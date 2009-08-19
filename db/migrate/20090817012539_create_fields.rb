class CreateFields < ActiveRecord::Migration
  def self.up
    create_table :fields do |t|
      t.integer :sort_order
      t.string :prompt
      t.integer :type
      t.boolean :subfield
      t.references :super_field
      t.timestamps
    end
  end

  def self.down
    drop_table :fields
  end
end
