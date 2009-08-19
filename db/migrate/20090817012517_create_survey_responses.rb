class CreateSurveyResponses < ActiveRecord::Migration
  def self.up
    create_table :survey_responses do |t|
      t.references :survey_schema
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :survey_responses
  end
end
