class FieldGroup < ActiveRecord::Base
  has_many_polymorphs :fields, {
    :from => [:text_boxes, :radio_containers, 
              :check_containers, :combo_containers, :options], 
    :order => 'fields.sort_order'}
  belongs_to :survey_schema

  validates_presence_of :survey_schema_id
end
