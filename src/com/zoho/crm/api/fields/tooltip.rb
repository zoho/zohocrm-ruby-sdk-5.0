require_relative '../util/choice'
require_relative '../util/model'

module ZOHOCRMSDK
  module Fields
    class Tooltip
      include Util::Model

      # Creates an instance of Tooltip
      def initialize
        @name = nil
        @value = nil
        @key_modified = Hash.new
      end

        # The method to get the name
        # @return An instance of Util::Choice

      def name
        @name
      end

        # The method to set the value to name
        # @param name [Util::Choice] An instance of Util::Choice

      def name=(name)
        if name!=nil and !name.is_a? Util::Choice
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: name EXPECTED TYPE: Util::Choice', nil, nil)
        end
        @name = name
        @key_modified['name'] = 1
      end

        # The method to get the value
        # @return A String value

      def value
        @value
      end

        # The method to set the value to value
        # @param value [String] A String

      def value=(value)
        if value!=nil and !value.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: value EXPECTED TYPE: String', nil, nil)
        end
        @value = value
        @key_modified['value'] = 1
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
