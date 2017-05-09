# frozen_string_literal: true

require 'spec_helper'
module ActiveSupport
  module Cache
    RSpec.describe MongoDbStore do
      it('has a version number') {expect(::MongoDbStore::VERSION).not_to be nil}

      describe '#new' do
        it 'can take options as the first parameter' do
          store = ActiveSupport::Cache.lookup_store(:mongo_store, :expires_in => 1.minute)
          expect(store.options[:expires_in]).to eq(1.minute)
        end

        it 'can take a collection name' do
          store = ActiveSupport::Cache.lookup_store(:mongo_db_store, collection: 'foo')
          expect(store.collection_name).to eq('foo')
        end

        it 'has a default collection name of rails_cache' do
          store = ActiveSupport::Cache.lookup_store(:mongo_db_store)
          expect(store.collection_name).to eq(:rails_cache)
        end

        it 'defaults to an expiration of 1 day' do
          store = ActiveSupport::Cache.lookup_store(:mongo_db_store)
          expect(store.options[:expires_in]).to eq(1.day)
        end

        it 'can override the default expiration' do
          store = ActiveSupport::Cache.lookup_store(:mongo_store, :expires_in => 1.minute)
          expect(store.options[:expires_in]).to eq(1.minute)
        end
      end

      describe '#'
    end
  end
end
