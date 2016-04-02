require 'simplecov'
SimpleCov.start 'rails'

# Needed to access our classes in RSpec tests.
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../../config/environment", __FILE__)

require 'database_cleaner'
require 'cucumber/rails'

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end