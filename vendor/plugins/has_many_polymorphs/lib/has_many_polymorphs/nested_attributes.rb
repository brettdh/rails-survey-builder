module ActiveRecord
  module NestedAttributes #:nodoc:

    # ...snip...

    module ClassMethods
      def accepts_nested_attributes_for(*attr_names)
        options = { :allow_destroy => false }
        options.update(attr_names.extract_options!)
        options.assert_valid_keys(:allow_destroy, :reject_if, :limit)
        
        attr_names.each do |association_name|
          if reflection = reflect_on_association(association_name)
            type = case reflection.macro
            when :has_one, :belongs_to
              :one_to_one
            when :has_many, :has_and_belongs_to_many
              :collection
            when :has_many_polymorphs # added by has_many_polymorphs (surprise!)
              :collection
            end

            reflection.options[:autosave] = true
            self.nested_attributes_options[association_name.to_sym] = options

            class_eval %{
              def #{association_name}_attributes=(attributes)
                assign_nested_attributes_for_#{type}_association(:#{association_name}, attributes)
              end
            }, __FILE__, __LINE__

            add_autosave_association_callbacks(reflection)
          else
            raise ArgumentError, "No association found for name \'#{association_name}\'. Has it been defined yet?"
          end
        end
      end
    end
  end
end
