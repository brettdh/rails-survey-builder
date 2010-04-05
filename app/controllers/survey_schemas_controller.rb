class SurveySchemasController < ApplicationController
  before_filter :authenticate!
  before_filter :lookup_survey, :only => [:show, :edit, :update, :delete, :destroy]
  
  def lookup_survey
    @survey = SurveySchema.find(params[:id])
  end
  
  def authenticate!
    true
  end
  
  def index
    # @surveys = SurveySchema.find_by_owner(current_user)
    @surveys = SurveySchema.all
    
  end

  def new
    @survey = SurveySchema.new
    @editing = true
    render :action => :edit
  end

  def create
    @survey = SurveySchema.new(params[:survey_schema])
    if @survey.save!
      flash[:notice] = "Successfully saved survey."
      @editing = true
      render :action => 'edit'
    else
      flash[:error] = error_messages_for 'survey_schema'
      render :action => 'new'
    end
  end

  def show

  end

  def edit
    @editing = true
  end

  def update
    #debugger
    if @survey.update_attributes(params[:survey_schema])
      flash[:notice] = "Successfully saved survey."
      redirect_to edit_survey_schema_path(@survey)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @survey.destroy
    redirect_to survey_schemas_path
  end
end
