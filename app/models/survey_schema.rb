class SurveySchema < ActiveRecord::Base
  has_one :owner, :through => :users
  has_many :field_groups
  accepts_nested_attributes_for :field_groups, :allow_destroy => true
#   after_update :save_field_groups
#   validates_associated :field_groups

#   def new_field_group_attributes=(fg_attributes)
#     fg_attributes.each do |attributes|
#       field_groups.build(attributes)
#     end
#   end

#   def existing_field_group_attributes=(fg_attributes)
#     field_groups.reject(&:new_record?).each do |fg|
#       attributes = fg_attributes[fg.id.to_s]
#       if attributes
#         fg.attributes = attributes
#       else
#         field_groups.delete(fg)
#       end
#     end
#   end

#   def save_field_groups
#     field_groups.each do |fg|
#       fg.save(false)
#     end
#   end
end
