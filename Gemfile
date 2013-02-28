
source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'bootstrap-sass', '2.0.0'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.0.1'
gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.6'
gem "carrierwave"
gem "fog", "~> 1.3.1"
gem "sidekiq"
gem "aws-sdk"
gem 'sinatra', require: false
gem 'slim'

group :development, :test do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.10.0'
  gem 'annotate', '~> 2.4.1.beta'
  gem 'spork', '0.9.0'
  gem 'guard-rspec', '0.5.5'
end

# Gems used only for assets and not required 
# in production environments by default. 
group :assets do
  gem 'sass-rails',   '3.2.4'
  gem 'coffee-rails'
  gem 'uglifier', '1.2.3'
end

gem 'jquery-rails'

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '1.4.0' #Factory for creating object prior to testing (cf. /spec/factories.rb)
  gem 'guard-spork', '0.3.2'
  
  
  # Test gems on Macintosh OS X
  gem 'rb-fsevent', '0.4.3.1', :require => false
  gem 'growl', '1.0.3'

  # Test gems on Linux
  # gem 'rb-inotify', '0.8.8'
  # gem 'libnotify', '0.5.9'

  # Test gems on Windows
  # gem 'rb-fchange', '0.0.5'
  # gem 'rb-notifu', '0.0.4'
  # gem 'win32console', '1.3.0'

end

group :production do
  gem 'pg', '0.12.2'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
