class AddSortOrderToFieldGroupsFields < ActiveRecord::Migration
  def self.up
    add_column :field_groups_fields, :sort_order, :integer
  end

  def self.down
    remove_column :field_groups_fields, :sort_order
  end
end
