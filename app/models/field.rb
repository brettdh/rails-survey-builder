class Field < ActiveRecord::Base
  has_many :links_to_subfields, {
    :class_name => 'FieldLink', 
    :foreign_key => 'superfield_id', 
    :dependent => :destroy
  }
  has_many :subfields, { :through => :links_to_subfields, :order => 'sort_order' }

  has_many :links_to_superfields, :class_name => 'FieldLink', :foreign_key => 'subfield_id'
  has_one :superfields, :through => :links_to_superfields

  has_one :field_groups_field
  has_one :field_group, :through => :field_groups_field

  after_save :save_subfields

  validates_associated :subfields

  # shortcut helper.
  def survey_schema
    if self.field_group.nil?
      self.superfields.survey_schema
    else
      self.field_group.survey_schema
    end
  end
  
  def new_subfield_attributes=(subfield_attributes)
    subfield_attributes.each do |attributes|
      subfields.build(attributes)
    end
  end
  
  def existing_subfield_attributes=(subfield_attributes)
    subfields.reject(&:new_record?).each do |subfield|
      attributes = subfield_attributes[subfield.id.to_s]
      if attributes
        subfield.attributes = attributes
      else
        subfields.destroy(subfield)
      end
    end
  end

  def save_subfields
    subfields.each do |subfield|
      subfield.save(false)
    end
  end
end
