module SurveySchemasHelper
  def render_field(the_field, above_form=nil)
    render(:partial => ("#{the_field.type.underscore}"), 
           :locals => { 
             :field => the_field, :above_form => above_form
           })
  end

  def new_or_existing(model)
    model.new_record? ? 'new' : 'existing'
  end

  def fields_for_field_group(field_group, &block)
    fg_prefix = new_or_existing(field_group)
    ff_prefix = "survey[#{fg_prefix}_field_group_attributes][]"
    fields_for(ff_prefix, field_group, &block)
  end

  def fields_for_field(field, &block)
    fg = field.field_group
    fg_prefix = new_or_existing(fg)
    f_prefix = new_or_existing(field)
    ff_prefix = "survey[#{fg_prefix}_field_group_attributes][#{fg.id}]"
    ff_prefix += "[#{f_prefix}_field_attributes][]"
    fields_for(ff_prefix, field, &block)
  end

  def fields_for_subfield(subfield, &block)
    container = subfield.superfields
    fg = container.field_group

    sf_prefix = new_or_existing(subfield)
    fg_prefix = new_or_existing(fg)
    f_prefix = new_or_existing(container)

    ff_prefix = "survey[#{fg_prefix}_field_group_attributes][#{fg.id}]"
    ff_prefix += "[#{f_prefix}_field_attributes][#{container.id}]"
    ff_prefix += "[#{sf_prefix}_subfield_attributes][]"
    fields_for(ff_prefix, subfield, &block)
  end
  
  def add_field_group_link(survey, form)
    link_to_function 'add field group' do |page|
      page.insert_html :bottom, :field_groups, {
        :partial => 'edit_field_group',
        :object => FieldGroup.new
      }
    end
  end

  def delete_field_group_link(field_group, form)
    link_to_function 'delete', "$(this).up('.field_group').remove()"
  end

  def add_field_link(field_group, form)
    div_id = "field_group_#{field_group.id}_fields"
    link_to_function 'add field' do |page|
      page.insert_html(:bottom, div_id, {
        :partial => 'field', 
        :object => Field.new
      })
    end
  end

  def delete_field_link(field, form)
    link_to_function 'delete', "$(this).up('.field').remove()"
  end

  def add_subfield_link(superfield, form)
    link_to('add', '#')
  end

  def delete_subfield_link(subfield, form)
    link_to('delete', '#')
  end

  def choose_field_type_link(chooser_div, type_str)
    link_to(type_str, '#')
=begin
    link_to_function type_str do |page|
      klass = Kernel.const_get(type_str)
      page.replace_html chooser_div, {
        :partial => type_str.underscore,
        :locals => {
          :field => klass.new
        }
      }
    end
=end
  end
end
