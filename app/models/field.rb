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

  validates_associated :subfields
  accepts_nested_attributes_for :subfields, :allow_destroy => true

  # shortcut helper.
  def survey_schema
    if self.field_group.nil?
      self.superfields.survey_schema
    else
      self.field_group.survey_schema
    end
  end
end
