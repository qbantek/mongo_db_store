# frozen_string_literal: true
require 'active_support'

module ActiveSupport
  module Cache
    autoload :MongoDbStore, 'active_support/cache/mongo_db_store'
  end
end