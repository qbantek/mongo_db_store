# frozen_string_literal: true
# frozen_string_literal: true

if ENV['CODECLIMATE_REPO_TOKEN']
  # require 'codeclimate-test-reporter'
  # CodeClimate::TestReporter.start
  require 'simplecov'
  SimpleCov.start
end

require 'bundler/setup'
require 'mongo_db_store'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'
  config.expect_with(:rspec) {|c| c.syntax = :expect }
end
