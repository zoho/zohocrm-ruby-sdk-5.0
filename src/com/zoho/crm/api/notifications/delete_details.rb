require_relative '../util/model'

module ZOHOCRMSDK
  module Notifications
    class DeleteDetails
      include Util::Model

      # Creates an instance of DeleteDetails
      def initialize
        @resource_id = nil
        @resource_uri = nil
        @channel_id = nil
        @key_modified = Hash.new
      end

        # The method to get the resource_id
        # @return A Integer value

      def resource_id
        @resource_id
      end

        # The method to set the value to resource_id
        # @param resource_id [Integer] A Integer

      def resource_id=(resource_id)
        if resource_id!=nil and !resource_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: resource_id EXPECTED TYPE: Integer', nil, nil)
        end
        @resource_id = resource_id
        @key_modified['resource_id'] = 1
      end

        # The method to get the resource_uri
        # @return A String value

      def resource_uri
        @resource_uri
      end

        # The method to set the value to resource_uri
        # @param resource_uri [String] A String

      def resource_uri=(resource_uri)
        if resource_uri!=nil and !resource_uri.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: resource_uri EXPECTED TYPE: String', nil, nil)
        end
        @resource_uri = resource_uri
        @key_modified['resource_uri'] = 1
      end

        # The method to get the channel_id
        # @return A String value

      def channel_id
        @channel_id
      end

        # The method to set the value to channel_id
        # @param channel_id [String] A String

      def channel_id=(channel_id)
        if channel_id!=nil and !channel_id.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: channel_id EXPECTED TYPE: String', nil, nil)
        end
        @channel_id = channel_id
        @key_modified['channel_id'] = 1
      end

        # The method to check if the user has modified the given key
        # @param key [String] A String
        # @return A Integer value

      def is_key_modified(key)
        if key!=nil and !key.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: key EXPECTED TYPE: String', nil, nil)
        end
        if @key_modified.key?(key)
          return @key_modified[key]
        end

        nil
      end

        # The method to mark the given key as modified
        # @param key [String] A String
        # @param modification [Integer] A Integer

      def set_key_modified(key, modification)
        if key!=nil and !key.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: key EXPECTED TYPE: String', nil, nil)
        end
        if modification!=nil and !modification.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: modification EXPECTED TYPE: Integer', nil, nil)
        end
        @key_modified[key] = modification
      end

    end
  end
end
