require_relative '../util/model'

module ZOHOCRMSDK
  module Record
    require_relative 'response_handler'
    class ConversionOptionsResponseWrapper
      include Util::Model
      include ResponseHandler

      # Creates an instance of ConversionOptionsResponseWrapper
      def initialize
        @conversionoptions = nil
        @key_modified = Hash.new
      end

        # The method to get the conversionoptions
        # @return An instance of ConversionOption

      def conversionoptions
        @conversionoptions
      end

        # The method to set the value to conversionoptions
        # @param conversionoptions [ConversionOption] An instance of ConversionOption

      def conversionoptions=(conversionoptions)
        if conversionoptions!=nil and !conversionoptions.is_a? ConversionOption
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: conversionoptions EXPECTED TYPE: ConversionOption', nil, nil)
        end
        @conversionoptions = conversionoptions
        @key_modified['__conversion_options'] = 1
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
