require_relative '../util/model'

module ZOHOCRMSDK
  module HipaaCompliance
    class ActionWrapper
      include Util::Model

      # Creates an instance of ActionWrapper
      def initialize
        @hipaa_compliance = nil
        @key_modified = Hash.new
      end

        # The method to get the hipaa_compliance
        # @return An instance of ActionHandler

      def hipaa_compliance
        @hipaa_compliance
      end

        # The method to set the value to hipaa_compliance
        # @param hipaa_compliance [ActionHandler] An instance of ActionHandler

      def hipaa_compliance=(hipaa_compliance)
        if hipaa_compliance!=nil and !hipaa_compliance.is_a? ActionHandler
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: hipaa_compliance EXPECTED TYPE: ActionHandler', nil, nil)
        end
        @hipaa_compliance = hipaa_compliance
        @key_modified['hipaa_compliance'] = 1
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
