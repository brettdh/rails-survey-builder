class Field < ActiveRecord::Base
  has_many :links_to_subfields, :class_name => 'FieldLink', :foreign_key => 'superfield_id'
  has_many :subfields, :through => :links_to_subfields, :order => 'sort_order'

  has_many :links_to_superfields, :class_name => 'FieldLink', :foreign_key => 'subfield_id'
  has_one :superfields, :through => :links_to_superfields

  has_one :field_groups_field
  has_one :field_group, :through => :field_groups_field

  # shortcut helper.
  def survey_schema
    self.field_group.survey_schema
  end
end
