class FieldResponse < ActiveRecord::Base
  belongs_to :field_groups_field
  belongs_to :field, :through => :field_groups_field
end
