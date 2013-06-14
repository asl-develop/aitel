source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'factory_girl_rails'
gem 'active_decorator'

group :production do
  gem 'pg'

end

group :test, :development do
  gem 'sqlite3'
  gem "rails-erd"

  gem 'rspec-rails'
  gem 'rails3-generators'
  gem 'webrat'
  gem 'spork'
  gem 'rb-fsevent'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'growl' if /darwin/ =~ RUBY_PLATFORM
  gem 'libnotify' if /linux/ =~ RUBY_PLATFORM
  gem 'rb-inotify' if /linux/ =~ RUBY_PLATFORM
  gem "bullet"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'bootstrap-sass', '~> 2.3.1.0'
  gem 'compass-rails'
  gem 'zurui-sass-rails'
  gem 'uglifier', '>= 1.0.3'
end
gem 'font-awesome-rails'
gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
