class SurveySchemasController < ApplicationController
  before_filter :authenticate!
  before_filter :lookup_survey, :only => [:show, :edit]
  
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
    render :action => :edit
  end

  def create
    @survey = SurveySchema.new(params[:survey])
    if @survey.save
      flash[:notice] = "Successfully saved survey."
      redirect_to survey_schemas_path
    else
      render :action => 'new'
    end
  end

  def show

  end

  def edit
    @editing = true
  end

  def update
    params[:survey][:existing_field_group_attributes] ||= {}

    if @survey.update_attributes(params[:survey])
      flash[:notice] = "Successfully saved survey."
      redirect_to survey_schema_path(@survey)
    else
      render :action => 'edit'
    end
  end

  def destroy
    
  end
end
