module SurveySchemasHelper
  def render_field(the_field)
    render(:partial => ("#{the_field.type.underscore}"), 
           :locals => { 
             :field => the_field
           })
  end

  def new_or_existing(model)
    model.new_record? ? 'new' : 'existing'
  end

  def fields_for_field_group(field_group, &block)
    fg_prefix = new_or_existing(field_group)
    ff_prefix = "survey_schema[#{fg_prefix}_field_group_attributes][]"
    fields_for(ff_prefix, field_group, &block)
  end

  def fields_for_field(field, &block)
    fg = field.field_group
    fg_prefix = new_or_existing(fg)
    f_prefix = new_or_existing(field)
    ff_prefix = "survey_schema[#{fg_prefix}_field_group_attributes][#{fg.id}]"
    ff_prefix += "[#{f_prefix}_field_attributes][]"
    fields_for(ff_prefix, field, &block)
  end

  def fields_for_subfield(subfield, &block)
    container = subfield.superfields
    fg = container.field_group

    sf_prefix = new_or_existing(subfield)
    fg_prefix = new_or_existing(fg)
    f_prefix = new_or_existing(container)

    ff_prefix = "survey_schema[#{fg_prefix}_field_group_attributes][#{fg.id}]"
    ff_prefix += "[#{f_prefix}_field_attributes][#{container.id}]"
    ff_prefix += "[#{sf_prefix}_subfield_attributes][]"
    fields_for(ff_prefix, subfield, &block)
  end
  
  def add_field_group_link(survey)
    link_to 'Add field group', new_field_group_path(survey)
  end

  def delete_field_group_link(field_group)
    link_to("delete", delete_field_group_path(field_group.survey_schema, 
                                              field_group))
  end

  def add_field_link(field_group)
    link_to 'Add field', new_field_path(field_group.survey_schema, field_group)
  end

  def delete_field_link(field)
    link_to("delete", delete_field_path(field.survey_schema,
                                        field.field_group,
                                        field))
  end

  def add_subfield_link(superfield)
    link_to('add', new_subfield_path(superfield.survey_schema, 
                                     superfield.field_group,
                                     superfield))
  end

  def delete_subfield_link(subfield)
    link_to('delete', delete_field_path(subfield.survey_schema,
                                        subfield.superfields.field_group,
                                        subfield))
  end

end
