class FieldGroup < ActiveRecord::Base
  #has_many :fields
  has_many_polymorphs :fields, :from => [:text_boxes]

  belongs_to :survey_schema
end
