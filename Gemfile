source 'https://rubygems.org'

ruby '2.2.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use delayed job for background processing
gem 'delayed_job_active_record'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Simple and customizable html forms
gem 'simple_form'

# Used for JSON serialization
gem 'active_model_serializers'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use puma as the app server
gem 'puma'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # For unit testing
  gem 'rspec-rails'
  gem 'factory_girl_rails', :require => false

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. 
  # Read more: https://github.com/rails/spring
  gem 'spring'

  # Makes emails to be opened in a browser during development
  gem "letter_opener"
end

# Use 12 factor for logging and assets in production (heroku).
gem 'rails_12factor', group: :production