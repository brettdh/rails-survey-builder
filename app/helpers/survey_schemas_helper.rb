module SurveySchemasHelper
  def render_field_form(form_builder)
    render(:partial => ("#{form_builder.object.type.underscore}"), 
           :locals => {
             :f => form_builder
           })
  end

  def render_field(the_field)
    render(:partial => ("#{the_field.type.underscore}"), 
           :locals => { 
             :field => the_field
           })
  end
  
  def add_field_group_link(survey)
    add_child_link('Add field group', new_field_group_path(survey), :field_groups)
  end

  def delete_field_group_link(fg_form_builder)
    field_group = fg_form_builder.object
    remove_child_link("delete", 
                      delete_field_group_path(field_group.survey_schema, 
                                              field_group),
                      fg_form_builder)
  end

  def add_field_link(field_group)
    add_child_link('Add field', new_field_path(field_group.survey_schema, field_group),
                   :fields)
  end

  def delete_field_link(field_form_builder)
    field = field_form_builder.object
    remove_child_link("delete", 
                      delete_field_path(field.survey_schema,
                                        field.field_group,
                                        field),
                      field_form_builder)
  end

  def add_subfield_link(superfield)
    add_child_link('add', 
                   new_subfield_path(superfield.survey_schema, 
                                     superfield.field_group,
                                     superfield),
                   :subfields)
  end

  def delete_subfield_link(subfield_form_builder)
    subfield = subfield_form_builder.object
    remove_child_link('delete', 
                      delete_field_path(subfield.survey_schema,
                                        subfield.superfields.field_group,
                                        subfield),
                      subfield_form_builder)
  end

  # Borrowed these from [timriley,ryanb]/complex-form-examples

  # since these helpers have links that point to real non-JS URLs, make sure
  #  that the related Javascript includes "return false" in the onClick handler.
  def remove_child_link(name, url, f)
    f.hidden_field(:_destroy) + link_to(name, url, :class => "remove_child")
  end
  
  def add_child_link(name, url, association)
    link_to(name, url, :class => "add_child", :"data-association" => association)
  end
  
  def new_child_fields_template(form_builder, association, options = {})
    content_for "#{association}_fields_template" do
      options[:object] ||= form_builder.object.class.reflect_on_association(association).klass.new
      options[:partial] ||= association.to_s.singularize
      options[:form_builder_local] ||= :f
    
      content_tag(:div, :id => "#{association}_fields_template", :style => "display: none") do
        form_builder.fields_for(association, options[:object], :child_index => "new_#{association}") do |f|
          render(:partial => options[:partial], :locals => {options[:form_builder_local] => f})
        end
      end
    end unless content_given?("#{association}_fields_template")
  end
  
  def content_given?(name)
    content = instance_variable_get("@content_for_#{name}")
    ! content.nil?
  end
end
