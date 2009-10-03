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
    link_to('add field group', '#')
  end

  def delete_field_group_link(field_group, form)
    link_to('delete', '#')
  end

  def add_field_link(field_group, form)
    link_to('add field', '#')
  end

  def delete_field_link(field, form)
    link_to('delete field', '#')
  end

  def add_subfield_link(superfield, form)
    link_to('add', '#')
  end

  def delete_subfield_link(subfield, form)
    link_to('delete', '#')
  end
end
