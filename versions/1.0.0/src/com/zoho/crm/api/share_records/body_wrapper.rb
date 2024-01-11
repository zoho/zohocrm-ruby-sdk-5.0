require_relative '../util/model'

module ZOHOCRMSDK
  module ShareRecords
    class BodyWrapper
      include Util::Model

      # Creates an instance of BodyWrapper
      def initialize
        @share = nil
        @notify_on_completion = nil
        @notify = nil
        @key_modified = Hash.new
      end

        # The method to get the share
        # @return An instance of Array

      def share
        @share
      end

        # The method to set the value to share
        # @param share [Array] An instance of Array

      def share=(share)
        if share!=nil and !share.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: share EXPECTED TYPE: Array', nil, nil)
        end
        @share = share
        @key_modified['share'] = 1
      end

        # The method to get the notify_on_completion
        # @return A Boolean value

      def notify_on_completion
        @notify_on_completion
      end

        # The method to set the value to notify_on_completion
        # @param notify_on_completion [Boolean] A Boolean

      def notify_on_completion=(notify_on_completion)
        if notify_on_completion!=nil and ! [true, false].include?notify_on_completion
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: notify_on_completion EXPECTED TYPE: Boolean', nil, nil)
        end
        @notify_on_completion = notify_on_completion
        @key_modified['notify_on_completion'] = 1
      end

        # The method to get the notify
        # @return A Boolean value

      def notify
        @notify
      end

        # The method to set the value to notify
        # @param notify [Boolean] A Boolean

      def notify=(notify)
        if notify!=nil and ! [true, false].include?notify
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: notify EXPECTED TYPE: Boolean', nil, nil)
        end
        @notify = notify
        @key_modified['notify'] = 1
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
