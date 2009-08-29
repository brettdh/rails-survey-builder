class CreateFields < ActiveRecord::Migration
  def self.up
    create_table :fields do |t|
      t.integer :sort_order
      t.string :prompt
      t.string :type # to enable single-table inheritance
      t.timestamps
    end
  end

  def self.down
    drop_table :fields
  end
end
