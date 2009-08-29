class Field < ActiveRecord::Base
  has_many :links_to_subfields, :class_name => 'FieldLink', :foreign_key => 'superfield_id'
  has_many :subfields, :through => :links_to_subfields

  has_many :links_to_superfields, :class_name => 'FieldLink', :foreign_key => 'subfield_id'
  has_many :superfields, :through => :links_to_superfields
end
