class CreateFieldGroupsFields < ActiveRecord::Migration
  def self.up
    create_table :field_groups_fields do |t|
      t.string :field_type
      t.integer :field_id
      t.integer :field_group_id
      t.timestamps
    end
  end

  def self.down
    drop_table :field_groups_fields
  end
end
