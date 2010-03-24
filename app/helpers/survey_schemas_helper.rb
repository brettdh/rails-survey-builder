module SurveySchemasHelper
  def render_option_form(form_builder, prefix)
    #prefix =form_builder.object.superfields.class.to_s.underscore.split("_")[0]
    render(:partial => "option",
           :locals => {
             :f => form_builder, :prefix => prefix
           })
  end
  
  def render_option_field(the_field)
    #prefix = the_field.superfields.class.to_s.underscore.split("_")[0]
    render(:partial => "option",
           :locals => {
             :field => the_field
           })
  end
  
  def render_field_form(form_builder, partial=nil)
    partial ||= "#{form_builder.object.class.to_s.underscore}"
    render(:partial => partial, 
           :locals => {
             :f => form_builder
           })
  end

  def render_field(the_field)
    render(:partial => ("#{the_field.class.to_s.underscore}"), 
           :locals => { 
             :field => the_field
           })
  end
  
  def add_field_group_link(survey)
    add_child_link('Add field group', new_field_group_path(survey), 
                   "FieldGroup")
  end

  def delete_field_group_link(fg_form_builder)
    field_group = fg_form_builder.object
    remove_child_link("delete field group", 
                      delete_field_group_path(field_group.survey_schema, 
                                              field_group),
                      fg_form_builder)
  end

  def add_field_link(field_group, field_type, name=field_type)
    add_child_link(name, new_field_path(field_group.survey_schema, field_group),
                   field_type)
  end

  def delete_field_link(field_form_builder)
    field = field_form_builder.object
    remove_child_link("delete field", 
                      delete_field_path(field.survey_schema,
                                        field.field_group,
                                        field),
                      field_form_builder)
  end

  def add_subfield_link(superfield, field_type="Option")
    add_child_link('add subfield', 
                   new_subfield_path(superfield.survey_schema, 
                                     superfield.field_group,
                                     superfield),
                   field_type)
  end

  def delete_subfield_link(subfield_form_builder)
    subfield = subfield_form_builder.object
    if subfield.survey_schema.nil? or subfield.superfields.nil?
      delete_link = "javascript:void(0)"
    else
      delete_link = delete_field_path(subfield.survey_schema,
                                      subfield.superfields.field_group,
                                      subfield)
    end
    remove_child_link('delete', delete_link, subfield_form_builder)
  end

  # Adapted these from [timriley,ryanb]/complex-form-examples

  # since these helpers have links that point to real non-JS URLs, make sure
  #  that the related Javascript includes "return false" in the onClick handler.
  def remove_child_link(name, url, f)
    f.hidden_field(:_destroy) + link_to(name, url, :class => "remove_child")
  end
  
  def add_child_link(name, url, field_type)
    link_to(name, url, :class => "add_child", 
            :"data-field-type" => field_type.underscore.pluralize)
  end
  
  # XXX: need to somehow embed the field type in the template divs so that
  #  we have a way to create new fields of different subtypes.
  def new_child_fields_template(form_builder, association, field_type, options = {})
    options[:partial] ||= field_type.underscore
    options[:form_builder_local] ||= :f
    options[:field_supertype] ||= "field"
    if options[:field_supertype] == "option"
      options[:object] ||= Option.new
    else
      options[:object] ||= Kernel.const_get(field_type).new
    end

    template_name = options[:partial].pluralize
    content_for "#{template_name}_fields_template" do
      content_tag(:div, :class => "templatecontainer",
                  :id => "#{template_name}_fields_template",
                  :style => "display: none") do
        form_builder.fields_for(association, options[:object], :child_index => "new_#{template_name}") do |f|
          if options[:field_supertype] == "option"
            prefix = field_type.underscore.split("_")[0]
            render_option_form(f, prefix)
          else
            render(:partial => options[:field_supertype],
                   :locals => {options[:form_builder_local] => f,
                               :partial => options[:partial]})
          end
        end
      end
    end unless content_given?("#{template_name}_fields_template")
  end
  
  def content_given?(name)
    content = instance_variable_get("@content_for_#{name}")
    ! content.nil?
  end
end
