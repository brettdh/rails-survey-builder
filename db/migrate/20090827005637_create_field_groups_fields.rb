class CreateFieldGroupsFields < ActiveRecord::Migration
  def self.up
    create_table :field_groups_fields do |t|
      t.integer :sort_order
      t.string :prompt

      t.references :field, :polymorphic => true
      t.references :field_group

      t.timestamps
    end
  end

  def self.down
    drop_table :field_groups_fields
  end
end
