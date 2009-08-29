class FieldLink < ActiveRecord::Base
  belongs_to :superfield, :class_name => 'Field'
  belongs_to :subfield, :class_name => 'Field'
end
