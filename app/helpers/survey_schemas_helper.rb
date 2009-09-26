module SurveySchemasHelper
  def render_field(field)
    render(:partial => ("#{@current_controller}/#{@current_action}_#{field.type.underscore}"), 
           :locals => { :field => field })
  end

  def add_field_link
    link_to('add field', '#')
  end

  def delete_field_link(field)
    link_to('delete field', '#')
  end
end
