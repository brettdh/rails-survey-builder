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

=begin
  map.surveys '/surveys', {
    :controller => 'SurveySchemas', :action => 'index', 
    :conditions => {:method => :get}
  }
  map.surveys '/surveys', {
    :controller => 'SurveySchemas', :action => 'create', 
    :conditions => {:method => :post}
  }
  map.new_survey '/surveys/new', {
    :controller => 'SurveySchemas', :action => 'new',
    :conditions => {:method => :get}
  }
  map.survey '/surveys/:id', {
    :controller => 'SurveySchemas', :action => 'show',
    :conditions => {:method => :get}
  }
  map.survey '/surveys/:id', {
    :controller => 'SurveySchemas', :action => 'update',
    :conditions => {:method => :put}
  }
  map.edit_survey '/surveys/:id/edit', {
    :controller => 'SurveySchemas', :action => 'edit', 
    :conditions => {:method => :get}
  }
  map.delete_survey '/surveys/:id', {
    :controller => 'SurveySchemas', :action => 'destroy', 
    :conditions => {:method => :delete}
  }

  map.responses '/surveys/:survey_id/responses', {
    :controller => 'SurveyResponses', :action => 'index', 
    :conditions => {:method => :get}
  }
  map.responses '/surveys/:survey_id/responses', {
    :controller => 'SurveyResponses', :action => 'create', 
    :conditions => {:method => :post}
  }
  map.new_response '/surveys/:survey_id/responses/new', {
    :controller => 'SurveyResponses', :action => 'new', 
    :conditions => {:method => :get}
  }
  map.response '/surveys/:survey_id/responses/:response_id', {
    :controller => 'SurveyResponses', :action => 'show', 
    :conditions => {:method => :get}
  }
  map.response '/surveys/:survey_id/responses/:response_id', {
    :controller => 'SurveyResponses', :action => 'update', 
    :conditions => {:method => :put}
  }
  map.edit_response '/surveys/:survey_id/responses/:response_id/edit', {
    :controller => 'SurveyResponses', :action => 'edit', 
    :conditions => {:method => :get}
  }
  map.delete_response '/surveys/:survey_id/responses/:response_id', {
    :controller => 'SurveyResponses', :action => 'destroy', 
    :conditions => {:method => :delete}
  }
=end

end
