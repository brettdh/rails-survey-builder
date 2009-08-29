class FieldResponse < ActiveRecord::Base
  belongs_to :field_groups_field
  has_one :field, :through => :field_groups_field
end
