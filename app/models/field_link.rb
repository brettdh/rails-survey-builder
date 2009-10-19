class FieldLink < ActiveRecord::Base
  belongs_to :superfield, :class_name => 'Field'
  belongs_to :subfield, :class_name => 'Field'

  acts_as_list(:column => 'sort_order', :scope => :superfield)

  before_destroy :delete_subfield

  def delete_subfield
    # no orphaned subfields
    subfield.destroy_without_callbacks
  end
end
