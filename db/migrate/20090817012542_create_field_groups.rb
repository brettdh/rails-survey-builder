class CreateFieldGroups < ActiveRecord::Migration
  def self.up
    create_table :field_groups do |t|
      t.integer :sort_order
      t.string :title
      t.string :preamble
      t.references :survey_schema
      t.timestamps
    end
  end

  def self.down
    drop_table :field_groups
  end
end
