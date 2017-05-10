# encoding: utf-8
# frozen_string_literal: true

require 'mongoid'
require 'active_support'
require 'base64'

module ActiveSupport
  module Cache
    class MongoDbStore < Store
      attr_reader :collection_name

      def initialize(options={})
        @collection_name = options[:collection] || :rails_cache
        options[:expires_in] ||= 1.day
        super(options)
      end

      def clear
        collection.find.delete_many
      end

      def cleanup
        collection.find(expires_at: {'$lt' => Time.now.utc.to_i}).delete_many
      end

      # @param [Regexp] matcher
      # @param [Hash] options
      def delete_matched(matcher, options=nil)
        options = merged_options(options)
        collection.find(_id: key_matcher(matcher, options)).delete_many
      end

      def delete_entry(key)
        collection.find(_id: key).delete_one
      end

      protected

      def write_entry(key, entry, options)
        expires_at = entry.expires_at.to_i
        created_at = Time.now.utc.to_i
        value = options[:raw] ? entry.value.to_s : entry
        rescue_error_with false do
          set = {data: Base64.encode64(Marshal.dump(value)),
                 expires_at: expires_at,
                 created_at: created_at}
          collection.find(_id: key).update_one({'$set' => set},
                                               upsert: true)
        end
        entry
      end

      def read_entry(key, _)
        expiration_criteria = {'$gt' => Time.now.utc.to_i}
        doc = collection.find(_id: key, expires_at: expiration_criteria).first
        rescue_error_with(nil) { deserialize_entry(doc['data']) } if doc
      end

      private

      def collection
        ::Mongoid.default_client[collection_name]
      end

      def deserialize_entry(raw_value)
        entry = Marshal.load(Base64.decode64(raw_value))
        entry.is_a?(Entry) ? entry : Entry.new(entry)
      end

      def rescue_error_with(fallback)
        yield
      rescue StandardError => e
        Rails.logger.error("Error (#{e}): #{e.message}")
        fallback
      end
    end
  end
end
