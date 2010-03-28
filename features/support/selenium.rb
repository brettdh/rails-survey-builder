Webrat.configure do |config|
  config.mode = :selenium
end

Cucumber::Rails::World.use_transactional_fixtures = false


require 'database_cleaner'

# Clean the database once when starting
DatabaseCleaner.clean_with :truncation
DatabaseCleaner.strategy = :truncation

Before do
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end
