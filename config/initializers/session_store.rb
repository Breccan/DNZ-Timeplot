# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_DNZ-Timeplot_session',
  :secret      => '3f743e7a699f8ccdf804c1288e1cd7dca7813b7e9598e9cfd46502b22d623402e7837be811f5b489564f4359fc608bdf332648c63dd8ece69ac02b23408d1bd3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
