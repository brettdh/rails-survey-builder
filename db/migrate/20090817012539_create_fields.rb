class CreateFields < ActiveRecord::Migration
  def self.up
    create_table :fields do |t|
      t.integer :sort_order
      t.string :prompt
      t.integer :type
      t.references :survey_schema
      t.references :field_group
      t.references :subfield
      t.references :superfield
      t.timestamps
    end
  end

  def self.down
    drop_table :fields
  end
end
