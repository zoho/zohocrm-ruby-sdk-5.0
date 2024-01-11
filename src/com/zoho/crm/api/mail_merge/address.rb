require_relative '../util/model'

module ZOHOCRMSDK
  module MailMerge
    class Address
      include Util::Model

      # Creates an instance of Address
      def initialize
        @address_value_map = nil
        @key_modified = Hash.new
      end

        # The method to get the address_value_map
        # @return An instance of AddressValueMap

      def address_value_map
        @address_value_map
      end

        # The method to set the value to address_value_map
        # @param address_value_map [AddressValueMap] An instance of AddressValueMap

      def address_value_map=(address_value_map)
        if address_value_map!=nil and !address_value_map.is_a? AddressValueMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: address_value_map EXPECTED TYPE: AddressValueMap', nil, nil)
        end
        @address_value_map = address_value_map
        @key_modified['Address_Value_Map'] = 1
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
