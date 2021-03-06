class FieldGroup < ActiveRecord::Base
  has_many_polymorphs :fields, {
    :from => [ :single_line_text_boxes, :text_boxes, :radio_containers, 
               :check_containers, :combo_containers, :options ]
  }
  belongs_to :survey_schema

  validates_presence_of :survey_schema_id
  validates_associated :fields
  accepts_nested_attributes_for :fields, :allow_destroy => true

  acts_as_list(:column => 'sort_order', :scope => :survey_schema)
end
