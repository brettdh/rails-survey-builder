class AddSortOrderToFieldLinks < ActiveRecord::Migration
  def self.up
    add_column :field_links, :sort_order, :integer
  end

  def self.down
    remove_column :field_links, :sort_order
  end
end
