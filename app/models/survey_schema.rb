class SurveySchema < ActiveRecord::Base
  has_one :owner, :through => :users
  has_many :field_groups, :order => :sort_order
end
