require 'dragonfly'
require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "50f26fd74b6bc09b8d2c04a31512e221d7123fe6dc34b85adde2a203c84ae5e4"

  url_format "/media/:job/:name"

  if Rails.env.production?
    datastore :s3,
      bucket_name: ENV['BUCKET_NAME'],
      access_key_id: ENV['BUCKET_KEY_ID'],
      secret_access_key: ENV['BUCKET_SECRET']
  else
    datastore :file,
      root_path: Rails.root.join('public/system/dragonfly', Rails.env),
      server_root: Rails.root.join('public')
  end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
