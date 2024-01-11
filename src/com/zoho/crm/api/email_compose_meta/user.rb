require_relative '../util/model'

module ZOHOCRMSDK
  module EmailComposeMeta
    class User
      include Util::Model

      # Creates an instance of User
      def initialize
        @full_name = nil
        @email = nil
        @zuid = nil
        @zgid = nil
        @compose_settings = nil
        @key_modified = Hash.new
      end

        # The method to get the full_name
        # @return A String value

      def full_name
        @full_name
      end

        # The method to set the value to full_name
        # @param full_name [String] A String

      def full_name=(full_name)
        if full_name!=nil and !full_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: full_name EXPECTED TYPE: String', nil, nil)
        end
        @full_name = full_name
        @key_modified['full_name'] = 1
      end

        # The method to get the email
        # @return A String value

      def email
        @email
      end

        # The method to set the value to email
        # @param email [String] A String

      def email=(email)
        if email!=nil and !email.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: email EXPECTED TYPE: String', nil, nil)
        end
        @email = email
        @key_modified['email'] = 1
      end

        # The method to get the zuid
        # @return A String value

      def zuid
        @zuid
      end

        # The method to set the value to zuid
        # @param zuid [String] A String

      def zuid=(zuid)
        if zuid!=nil and !zuid.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: zuid EXPECTED TYPE: String', nil, nil)
        end
        @zuid = zuid
        @key_modified['zuid'] = 1
      end

        # The method to get the zgid
        # @return A String value

      def zgid
        @zgid
      end

        # The method to set the value to zgid
        # @param zgid [String] A String

      def zgid=(zgid)
        if zgid!=nil and !zgid.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: zgid EXPECTED TYPE: String', nil, nil)
        end
        @zgid = zgid
        @key_modified['zgid'] = 1
      end

        # The method to get the compose_settings
        # @return An instance of ComposeSettings

      def compose_settings
        @compose_settings
      end

        # The method to set the value to compose_settings
        # @param compose_settings [ComposeSettings] An instance of ComposeSettings

      def compose_settings=(compose_settings)
        if compose_settings!=nil and !compose_settings.is_a? ComposeSettings
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: compose_settings EXPECTED TYPE: ComposeSettings', nil, nil)
        end
        @compose_settings = compose_settings
        @key_modified['compose_settings'] = 1
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
