class FieldGroupsField < ActiveRecord::Base
  belongs_to :field_group
  belongs_to :field, :polymorphic => true, :dependent => :destroy
  #validates_associated :field

  acts_as_list(:column => 'sort_order', :scope => :field_group)

end
