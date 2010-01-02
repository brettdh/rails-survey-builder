class SurveySchema < ActiveRecord::Base
  has_one :owner, :through => :users
  has_many :field_groups
  accepts_nested_attributes_for :field_groups, :allow_destroy => true

  validates_associated :field_groups
end
