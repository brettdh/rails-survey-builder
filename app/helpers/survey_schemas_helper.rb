module SurveySchemasHelper
  def render_field(field)
    render(:partial => ("#{@current_controller}/#{@current_action}_#{field.type.underscore}"), 
           :locals => { :field => field })
  end

  def add_field_group_link(survey_schema, prev_sort_position)
    link_to('add field group', '#')
  end

  def delete_field_group_link(field_group)
    link_to('delete', '#')
  end

  def add_field_link(field_group, prev_sort_position)
    link_to('add field', '#')
  end

  def delete_field_link(field)
    link_to('delete field', '#')
  end

  def add_subfield_link(superfield)
    link_to('add', '#')
  end

  def delete_subfield_link(subfield)
    link_to('delete', '#')
  end
end
