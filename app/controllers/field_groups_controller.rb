class FieldGroupsController < ApplicationController
  before_filter :find_survey
  before_filter :find_group, {:only => [:delete, :destroy]}

  private

  def find_survey
    @survey = SurveySchema.find(params[:schema_id])
  end

  def find_group
    @group = FieldGroup.find(params[:field_group_id])
  end

  public

  def new
    @group = FieldGroup.new
  end

  def create
    @group = FieldGroup.new(params[:field_group])
    @group.survey_schema = @survey
    @group.save!
    redirect_to edit_survey_schema_path(@survey)
  end

  def delete

  end

  def destroy
    @group.destroy
    redirect_to edit_survey_schema_path(@survey)
  end
end
