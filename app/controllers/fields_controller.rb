class FieldsController < ApplicationController
  before_filter :find_survey, :find_field_group
  before_filter :find_field, {:except => ['new', 'create']}

  private

  def find_survey
    @survey = SurveySchema.find(params[:schema_id])
  end

  def find_field_group
    @field_group = FieldGroup.find(params[:field_group_id])
  end

  def find_field
    @field = Field.find(params[:field_id])
  end

  public
  
  def new
    if params.has_key? :superfield_id
      @superfield = Field.find(params[:superfield_id])
    end
    @field = Field.new
  end
  
  def create
    if params.has_key? :superfield_id
      field = Option.create(params[:field])
      @superfield = Field.find(params[:superfield_id])
      @superfield.subfields << field
    else
      klass = Kernel.const_get(params[:field_type])
      field = klass.create
      @field_group.fields << field
    end
    field.save!
    redirect_to edit_survey_schema_path(@survey)
  end

  def delete
    @superfield = @field.superfields
    if @superfield.nil?
      @delete_path = field_path(@field.survey_schema,
                                @field.field_group,
                                @field)
    else
      @delete_path = field_path(@superfield.survey_schema,
                                @superfield.field_group,
                                @field)
    end
  end

  def destroy
    if @field.superfields.nil?
      @field.destroy
    else
      @field.superfields.subfields.delete(@field)
    end
    redirect_to edit_survey_schema_path(@survey)
  end


  
end
