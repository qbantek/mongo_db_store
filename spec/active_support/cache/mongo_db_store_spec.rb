# frozen_string_literal: true

require 'spec_helper'
module ActiveSupport
  module Cache
    RSpec.describe MongoDbStore do
      it('has a version number') do
        expect(::MongoDbStore::VERSION).not_to be nil
      end

      describe '#new' do
        context 'when using defaults' do
          let(:store) { ActiveSupport::Cache.lookup_store(:mongo_db_store) }
          it('has a default collection name of rails_cache') do
            expect(store.collection_name).to eq(:rails_cache)
          end
          it('defaults to an expiration of 1 day') do
            expect(store.options[:expires_in]).to eq(1.day)
          end
        end

        context 'when NOT using defaults' do
          let(:store) do
            ActiveSupport::Cache.lookup_store(:mongo_db_store,
                                              collection: 'foo',
                                              expires_in: 1.minute)
          end
          it 'can override the default expiration' do
            expect(store.options[:expires_in]).to eq(1.minute)
          end

          it 'can override the default collection name' do
            expect(store.collection_name).to eq('foo')
          end
        end
      end
    end
  end
end
