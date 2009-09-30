module SurveySchemasHelper
  def render_field(field, above_form=nil)
    render(:partial => ("#{field.type.underscore}"), 
           :locals => { 
             :field => field, :above_form => above_form
           })
  end

  def fields_prefix_string(owner_model, owned_model, obj)
    new_or_existing = obj.new_record? ? 'new' : 'existing'
    if owner_model.nil? then
      prefix = "#{new_or_existing}_#{owned_model}_attributes[]"
    else
      prefix = "#{owner_model}[#{new_or_existing}_#{owned_model}_attributes][]"
    end
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
