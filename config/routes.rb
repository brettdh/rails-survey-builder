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

  map.resources :surveys, :controller => 'SurveySchemas' do |survey|
    survey.resources :responses, :controller => 'SurveyResponses'
  end

=begin If we do all the processing in the SurveySchemasController,
       we won't need these controllers and routes.
  map.field_groups '/field_groups/', {
    :controller => 'FieldGroups', :action => 'create',
    :conditions => { :method => :post }
  }
  map.field_group '/field_groups/:group_id', {
    :controller => 'FieldGroups', :action => 'update',
    :conditions => { :method => :put }
  }
  map.field_group '/field_groups/:group_id', {
    :controller => 'FieldGroups', :action => 'destroy',
    :conditions => { :method => :delete }
  }

  map.fields '/fields', {
    :controller => 'Fields', :action => 'create',
    :conditions => { :method => :post }
  }
  map.field '/fields/:field_id', {
    :controller => 'Fields', :action => 'update',
    :conditions => { :method => :put }
  }
  map.connect '/fields/:field_id', {
    :controller => 'Fields', :action => 'destroy',
    :conditions => { :method => :delete }
  }
=end

end
