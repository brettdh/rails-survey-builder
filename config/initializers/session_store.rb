# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails-survey-builder_session',
  :secret      => '491a18b4cffaeb9b248e74aa2f4ce660697bd2960be923dcb0470e3d8c66a08284b39b3c46da23642e9eb7164c57a98895cb69a90e622298d182489ca9511119'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
