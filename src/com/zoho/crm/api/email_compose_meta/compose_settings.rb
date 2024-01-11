require_relative '../util/model'

module ZOHOCRMSDK
  module EmailComposeMeta
    class ComposeSettings
      include Util::Model

      # Creates an instance of ComposeSettings
      def initialize
        @default_from_address = nil
        @font_size = nil
        @font_family = nil
        @email_signatures = nil
        @key_modified = Hash.new
      end

        # The method to get the default_from_address
        # @return An instance of DefaultForm

      def default_from_address
        @default_from_address
      end

        # The method to set the value to default_from_address
        # @param default_from_address [DefaultForm] An instance of DefaultForm

      def default_from_address=(default_from_address)
        if default_from_address!=nil and !default_from_address.is_a? DefaultForm
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: default_from_address EXPECTED TYPE: DefaultForm', nil, nil)
        end
        @default_from_address = default_from_address
        @key_modified['default_from_address'] = 1
      end

        # The method to get the font_size
        # @return A Integer value

      def font_size
        @font_size
      end

        # The method to set the value to font_size
        # @param font_size [Integer] A Integer

      def font_size=(font_size)
        if font_size!=nil and !font_size.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: font_size EXPECTED TYPE: Integer', nil, nil)
        end
        @font_size = font_size
        @key_modified['font_size'] = 1
      end

        # The method to get the font_family
        # @return A String value

      def font_family
        @font_family
      end

        # The method to set the value to font_family
        # @param font_family [String] A String

      def font_family=(font_family)
        if font_family!=nil and !font_family.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: font_family EXPECTED TYPE: String', nil, nil)
        end
        @font_family = font_family
        @key_modified['font_family'] = 1
      end

        # The method to get the email_signatures
        # @return An instance of Array

      def email_signatures
        @email_signatures
      end

        # The method to set the value to email_signatures
        # @param email_signatures [Array] An instance of Array

      def email_signatures=(email_signatures)
        if email_signatures!=nil and !email_signatures.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: email_signatures EXPECTED TYPE: Array', nil, nil)
        end
        @email_signatures = email_signatures
        @key_modified['email_signatures'] = 1
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
