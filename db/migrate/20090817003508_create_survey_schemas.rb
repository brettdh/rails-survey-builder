class CreateSurveySchemas < ActiveRecord::Migration
  def self.up
    create_table :survey_schemas do |t|
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :survey_schemas
  end
end
