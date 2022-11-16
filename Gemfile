# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.7.1"
# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 5.0.0"
# Use mysql as the database for Active Record
gem "mysql2", ">= 0.3.18", "< 0.5"
# Use Puma as the app server
gem "puma", "~> 3.0"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "therubyracer", platforms: :ruby

# Use jquery as the JavaScript library
gem "jquery-rails", "~> 4.5.1"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 3.0"
# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development
# Haml-rails provides Haml generators for Rails 5, 6, and 7.
gem "haml-rails", "~> 1.0.0"

# Sass-powered version of Bootstrap 3, ready to drop right into your Sass powered applications.
gem "bootstrap-sass", "~> 3.4.1"
# Integrates the C implementation of Sass, LibSass, into the asset pipeline.
gem "sassc-rails", ">= 2.1.0"
# Aims to be as flexible as possible while helping with powerful components to create your forms.
gem "simple_form", "~> 5.0.3"
# Runtime developer console and IRB alternative with powerful introspection capabilities.
gem "pry", "~> 0.14.1"
# A port of Perl's Data::Faker library that generates fake data
gem "faker", git: "https://github.com/faker-ruby/faker.git", branch: "main"

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", "~> 11.1.3", platform: :mri
  # Brings the RSpec testing framework to Ruby on Rails
  gem "rspec-rails", "~> 3.9.0"
  # Rails integration for factory_bot.
  gem "factory_bot_rails", "~> 6.2.0"
end

group :development do
  # A Ruby static code analyzer (a.k.a. linter) and code formatter. 1.25.1
  gem "rubocop", "~> 1.25.1", require: false
  # Performance optimization analysis for your projects, as an extension to RuboCop.
  gem "rubocop-performance", "~> 1.13.2", require: false
  # A RuboCop extension focused on enforcing Rails best practices and coding conventions
  gem "rubocop-rails", "~> 2.13.2", require: false
  # RSpec-specific analysis for your projects, as an extension to RuboCop.
  gem "rubocop-rspec", "~> 2.9.0", require: false
  # The listen gem listens to file modifications and notifies you about the changes.
  gem "listen", "~> 3.0.5"
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console", "~> 3.7.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring", "~> 2.1.1"
  # This gem makes Spring watch the filesystem for changes using Listen rather than by polling the filesystem.
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", "~> 1.2021.2", platforms: %i[mingw mswin x64_mingw jruby]
