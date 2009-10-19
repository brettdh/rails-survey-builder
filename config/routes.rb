ActionController::Routing::Routes.draw do |map|
  map.login '/login', {
    :controller => 'Session', :action => 'new', 
    :conditions => { :method => :get }
  }
  map.auth  '/login', {
    :controller => 'Session', :action => 'create',
    :conditions => { :method => :post }
  }
  map.logout '/logout', {
    :controller => 'Session', :action => 'destroy', 
    :conditions => { :method => :delete }
  }

  map.resources :survey_schemas, :controller => 'SurveySchemas' do |survey|
    survey.resources :survey_responses, :controller => 'SurveyResponses'
  end
  
  map.delete_survey_schema '/survey_schemas/:id/delete', { 
    :controller => 'SurveySchemas', :action => 'delete', 
    :conditions => { :method => :get }
  }

  map.new_field_group '/survey_schemas/:schema_id/field_groups/new', {
    :controller => 'FieldGroups', :action => 'new',
    :conditions => { :method => :get }
  }
  map.field_groups '/survey_schemas/:schema_id/field_groups', {
    :controller => 'FieldGroups', :action => 'create',
    :conditions => { :method => :post }
  }
  map.delete_field_group '/survey_schemas/:schema_id/field_groups/:field_group_id/delete', {
    :controller => 'FieldGroups', :action => 'delete',
    :conditions => { :method => :get }
  }
  map.field_group '/survey_schemas/:schema_id/field_groups/:field_group_id', {
    :controller => 'FieldGroups', :action => 'destroy',
    :conditions => { :method => :delete }
  }

  map.new_field '/survey_schemas/:schema_id/field_groups/:field_group_id/fields/new', {
    :controller => 'Fields', :action => 'new',
    :conditions => { :method => :get }
  }
  map.fields '/survey_schemas/:schema_id/field_groups/:field_group_id/fields', {
    :controller => 'Fields', :action => 'create',
    :conditions => { :method => :post }
  }
  map.delete_field '/survey_schemas/:schema_id/field_groups/:field_group_id/fields/:field_id/delete', {
    :controller => 'Fields', :action => 'delete',
    :conditions => { :method => :get }
  }
  map.field '/survey_schemas/:schema_id/field_groups/:field_group_id/fields/:field_id', {
    :controller => 'Fields', :action => 'destroy',
    :conditions => { :method => :delete }
  }

  map.new_subfield '/survey_schemas/:schema_id/field_groups/:field_group_id/' +
                   'fields/:superfield_id/subfields/new', {
    :controller => 'Fields', :action => 'new',
    :conditions => { :method => :get }
  }
  map.subfields '/survey_schemas/:schema_id/field_groups/:field_group_id/' +
                'fields/:superfield_id/subfields', {
    :controller => 'Fields', :action => 'create',
    :conditions => { :method => :post }
  }

end
