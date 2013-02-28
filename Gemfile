source 'https://rubygems.org'

local_gemfile = File.dirname(__FILE__) + "/Gemfile.local"
if File.file?(local_gemfile)
  self.instance_eval( Bundler.read_file(local_gemfile) )
else
  gem 'pg'
end

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'jquery-rails'
gem "haml-rails", "~> 0.4"
gem 'simple_form'
gem "devise", "~> 2.2.3"
gem "less-rails", "~> 2.2.6"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem "rspec-rails", "~> 2.12.2"
  gem 'debugger'
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
# gem 'debugger'
