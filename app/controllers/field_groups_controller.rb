class FieldGroupsController < ApplicationController
  before_filter :find_group, {:except => [:create]}

  private

  def find_group
    @group = FieldGroup.find(params[:group_id])
  end

  public

  def create
    group = FieldGroup.create(params[:new_field_group])
    redirect_to edit_survey_path(group.survey_schema)
  end

  def update
    @group.update_attributes(params[:survey
  end

  def destroy
    survey = @group.survey_schema
    @group.destroy
    redirect_to edit_survey_path(survey)
  end
end
