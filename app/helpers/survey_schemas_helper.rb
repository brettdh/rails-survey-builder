module SurveySchemasHelper
  def render_field(field)
    render :partial => field.type.underscore, :locals => { :field => field }
  end
end
