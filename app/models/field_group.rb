class FieldGroup < ActiveRecord::Base
  has_many_polymorphs :fields, {
    :from => [ :single_line_text_boxes, :text_boxes, :radio_containers, 
               :check_containers, :combo_containers, :options ]
  }
  belongs_to :survey_schema

  validates_presence_of :survey_schema_id
  validates_associated :fields

  after_save :save_fields

  acts_as_list(:column => 'sort_order', :scope => :survey_schema)

  def new_field_attributes=(field_attributes)
    field_attributes.each do |attributes|
      fields.build(attributes)
    end
  end

  def existing_field_attributes=(field_attributes)
    fields.reject(&:new_record?).each do |field|
      attributes = field_attributes[field.id.to_s]
      if attributes
        field.attributes = attributes
      else
        fields.delete(field)
      end
    end
  end

  def save_fields
    fields.each do |field|
      field.save(false)
    end
  end
end
