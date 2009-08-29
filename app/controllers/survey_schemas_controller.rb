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
  end

  def edit
    
  end

  def update

  end

  def destroy
    
  end
end
