module ActiveRecord
  module AutosaveAssociation
    def self.included(base)
      base.class_eval do
        base.extend(ClassMethods)
        alias_method_chain :reload, :autosave_associations

        (ASSOCIATION_TYPES + %w{ has_many_polymorphs }).each do |type|
          base.send("valid_keys_for_#{type}_association") << :autosave
        end
      end
    end

    module ClassMethods
      private

      # def belongs_to(name, options = {})
      #   super
      #   add_autosave_association_callbacks(reflect_on_association(name))
      # end
      (ASSOCIATION_TYPES + %w{ has_many_polymorphs }).each do |type|
        module_eval %{
          def #{type}(name, options = {})
            super
            add_autosave_association_callbacks(reflect_on_association(name))
          end
        }
      end

      # Adds a validate and save callback for the association as specified by
      # the +reflection+.
      def add_autosave_association_callbacks(reflection)
        save_method = "autosave_associated_records_for_#{reflection.name}"
        validation_method = "validate_associated_records_for_#{reflection.name}"
        force_validation = (reflection.options[:validate] == true || reflection.options[:autosave] == true)

        case reflection.macro
        when :has_many, :has_and_belongs_to_many, :has_many_polymorphs # hmp-added
          before_save :before_save_collection_association

          define_method(save_method) { save_collection_association(reflection) }
          # Doesn't use after_save as that would save associations added in after_create/after_update twice
          after_create save_method
          after_update save_method

          if force_validation || (reflection.macro == :has_many && reflection.options[:validate] != false)
            define_method(validation_method) { validate_collection_association(reflection) }
            validate validation_method
          end
        else
          case reflection.macro
          when :has_one
            define_method(save_method) { save_has_one_association(reflection) }
            after_save save_method
          when :belongs_to
            define_method(save_method) { save_belongs_to_association(reflection) }
            before_save save_method
          end

          if force_validation
            define_method(validation_method) { validate_single_association(reflection) }
            validate validation_method
          end
        end
      end
    end
  end
end
