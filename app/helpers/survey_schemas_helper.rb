module SurveySchemasHelper
  def render_field(field)
    render(:partial => ("#{@current_controller}/#{@current_action}_#{field.type.underscore}"), 
           :locals => { :field => field })
  end
end
