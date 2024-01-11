require_relative '../util/model'

module ZOHOCRMSDK
  module Blueprint
    class Escalation
      include Util::Model

      # Creates an instance of Escalation
      def initialize
        @days = nil
        @status = nil
        @key_modified = Hash.new
      end

        # The method to get the days
        # @return A Integer value

      def days
        @days
      end

        # The method to set the value to days
        # @param days [Integer] A Integer

      def days=(days)
        if days!=nil and !days.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: days EXPECTED TYPE: Integer', nil, nil)
        end
        @days = days
        @key_modified['days'] = 1
      end

        # The method to get the status
        # @return A String value

      def status
        @status
      end

        # The method to set the value to status
        # @param status [String] A String

      def status=(status)
        if status!=nil and !status.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: status EXPECTED TYPE: String', nil, nil)
        end
        @status = status
        @key_modified['status'] = 1
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
