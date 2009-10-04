class SurveySchema < ActiveRecord::Base
  has_one :owner, :through => :users
  has_many :field_groups, :order => :sort_order

  def new_field_group_attributes=(fg_attributes)
    fg_attributes.each do |attributes|
      field_groups.build(attributes)
    end
  end
end
