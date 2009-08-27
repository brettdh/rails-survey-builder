class Field < ActiveRecord::Base
  set_table_name :fields
  
  #belongs_to :survey_schema
  
  #belongs_to :field_group
#  belongs_to :superfield, :through => :fields # may be nil
#  has_many :subfields, :through => :fields # may be nil
end
