class SurveySchemasController < ApplicationController
  before_filter :authenticate!

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
    
  end

  def show
    @survey = SurveySchema.find(params[:id])
    @field_groups = FieldGroup.find_by_survey_schema_id(@survey, {:order => :sort_order})
    @field_groups = [] if @field_groups.nil?
    @fields = {}
    @field_groups.each do |group|
      #field_list = Field.find_by_field_group(group, {:order => :sort_order})
      # @fields[group.id] = field_list
    end
  end

  def edit
    
  end

  def update

  end

  def destroy
    
  end
end
