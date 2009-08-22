class SurveySchemasController < ApplicationController
  before_filter :authenticate!

  def index
    @surveys = SurveySchema.find_by_owner(current_user)
    
  end

  def new
    @survey = SurveySchema.new
  end

  def create
    
  end

  def show
    @survey = SurveySchema.find(params[:id])
    @field_groups = FieldGroup.find_by_survey(@survey, {:order => :sort_order})
    @field_groups.each do |group|
      @fields = Field.find_by_field_group(group, {:order => :sort_order})
      @fields.each do |field|
        
      end
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end
end
