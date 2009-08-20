class SurveyResponse < ActiveRecord::Base
  belongs_to :survey_schema
  has_one :responder, :through => :users
  has_many :field_responses
end
