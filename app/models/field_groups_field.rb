class FieldGroupsField < ActiveRecord::Base
  belongs_to :field_group
  belongs_to :field, :polymorphic => true
end