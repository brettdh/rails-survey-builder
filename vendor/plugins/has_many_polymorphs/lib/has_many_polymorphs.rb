
require 'active_record'

RAILS_DEFAULT_LOGGER = nil unless defined? RAILS_DEFAULT_LOGGER

require 'has_many_polymorphs/reflection'
require 'has_many_polymorphs/association'
require 'has_many_polymorphs/class_methods'
if Rails::VERSION::STRING == "2.3.5"
  # XXX: how to support the ugly copy/paste/patch changes for many versions
  #      from 2.3.0-2.3.5 and beyond?
  # For now it only works for Rails 2.3.5
  require 'has_many_polymorphs/nested_attributes'
  require 'has_many_polymorphs/autosave_association'
end

require 'has_many_polymorphs/support_methods'
require 'has_many_polymorphs/base'

class ActiveRecord::Base
  extend ActiveRecord::Associations::PolymorphicClassMethods 
end

if ENV['HMP_DEBUG'] || ENV['RAILS_ENV'] =~ /development|test/ && ENV['USER'] == 'eweaver'
  require 'has_many_polymorphs/debugging_tools' 
end

if defined? Rails and RAILS_ENV and RAILS_ROOT
  _logger_warn "rails environment detected"
  require 'has_many_polymorphs/configuration'
  require 'has_many_polymorphs/autoload'
end

_logger_debug "loaded ok"
