# Needed to access our classes in RSpec tests.
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../../config/environment", __FILE__)
require 'simplecov'
SimpleCov.start 'rails'

require 'capybara'
require 'database_cleaner'

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end
