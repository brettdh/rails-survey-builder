class CreateFieldGroups < ActiveRecord::Migration
  def self.up
    create_table :field_groups do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :field_groups
  end
end
