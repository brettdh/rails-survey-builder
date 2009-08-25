class FieldGroup < ActiveRecord::Base
  has_many :fields
  belongs_to :survey_schema
end
