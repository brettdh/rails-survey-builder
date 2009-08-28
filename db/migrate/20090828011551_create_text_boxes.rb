class CreateTextBoxes < ActiveRecord::Migration
  def self.up
    create_table :text_boxes do |t|
      t.integer :size
      t.timestamps
    end
  end

  def self.down
    drop_table :text_boxes
  end
end
