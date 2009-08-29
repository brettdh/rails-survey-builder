class FieldGroup < ActiveRecord::Base
  has_many_polymorphs :fields, :from => [:text_boxes, :option_containers, :options]
  belongs_to :survey_schema
end
