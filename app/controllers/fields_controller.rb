class FieldsController < ApplicationController
  before_filter :find_field, {:except => [:create]}

  private

  def find_field
    @field = Field.find(params[:field_id])
  end

  public

  def create

  end

  def update

  end

  def destroy
    survey = @field.survey_schema
    @field.destroy
    redirect_to edit_survey_path(survey)
  end
end
