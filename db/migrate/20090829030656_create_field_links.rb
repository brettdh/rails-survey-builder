class CreateFieldLinks < ActiveRecord::Migration
  def self.up
    create_table :field_links do |t|
      t.references :subfield
      t.references :superfield
      t.timestamps
    end
  end

  def self.down
    drop_table :field_links
  end
end
