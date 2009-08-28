require 'active_record/fixtures'

class LoadSurveys < ActiveRecord::Migration
  def self.up
    #down()

    #directory = File.join(File.dirname(__FILE__), "init_data")
    #Fixtures.create_fixtures(directory, "surveys")
  end

  def self.down
    #SurveySchema.delete_all
  end
end
