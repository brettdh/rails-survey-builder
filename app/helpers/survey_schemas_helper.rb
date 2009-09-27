module SurveySchemasHelper
  def render_field(field, form)
    render(:partial => ("#{@current_controller}/#{@current_action}_#{field.type.underscore}"), 
           :locals => { :field => field, :form => form })
  end

  def fields_prefix_string(owner_model, owned_model)
    new_or_existing = owned_model.new_record? ? 'new' : 'existing'
    prefix = "#{owner_model.class.to_s.underscore}"
    prefix += "[#{new_or_existing}_"
    prefix += "#{owned_model.class.to_s.underscore}_attributes][]"
    prefix
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
