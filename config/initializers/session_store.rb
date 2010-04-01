# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_bugtracker_session',
  :secret => '3a4dd5b6fe5ecc7c6949e9dcbedc661f4b08fe3ea8bbd35be0f42b226eecdef0c2cc0f1b3e2dcc4fbe2bd38d8a66eadda47a5c3a7ceafebf356bdebeb4b51ae2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
