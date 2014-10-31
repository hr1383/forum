source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'sqlite3'
end
#gem 'mysql', '~>2.8.1'
#gem 'rake' '~>10.1.1'
gem 'koala'
gem 'paperclip'
gem 'aws-s3'
gem 'aws-sdk'
gem 'devise','~>1.4.3'
# gem 'sunspot_rails'
# gem 'sunspot_solr'
gem 'client_side_validations'
gem 'recaptcha', :require => 'recaptcha/rails'
gem 'time_diff'
gem 'mandrill_mailer'
#gem 'activerecord-mysql-adapter'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sprockets'
  gem 'sass', '3.2.13'
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end
group :production do
 gem 'pg'
 gem 'rack-google_analytics', :require => "rack/google_analytics"
 gem 'rails_12factor'
 gem 'heroku-deflater'
end
gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
