class CreateFieldResponses < ActiveRecord::Migration
  def self.up
    create_table :field_responses do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :field_responses
  end
end
