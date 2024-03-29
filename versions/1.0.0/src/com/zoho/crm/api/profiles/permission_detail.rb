require_relative '../util/choice'
require_relative '../util/model'

module ZOHOCRMSDK
  module Profiles
    class PermissionDetail
      include Util::Model

      # Creates an instance of PermissionDetail
      def initialize
        @id = nil
        @enabled = nil
        @name = nil
        @display_label = nil
        @customizable = nil
        @parent_permissions = nil
        @module_1 = nil
        @key_modified = Hash.new
      end

        # The method to get the id
        # @return A Integer value

      def id
        @id
      end

        # The method to set the value to id
        # @param id [Integer] A Integer

      def id=(id)
        if id!=nil and !id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
        end
        @id = id
        @key_modified['id'] = 1
      end

        # The method to get the enabled
        # @return An instance of Util::Choice

      def enabled
        @enabled
      end

        # The method to set the value to enabled
        # @param enabled [Util::Choice] An instance of Util::Choice

      def enabled=(enabled)
        if enabled!=nil and !enabled.is_a? Util::Choice
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: enabled EXPECTED TYPE: Util::Choice', nil, nil)
        end
        @enabled = enabled
        @key_modified['enabled'] = 1
      end

        # The method to get the name
        # @return A String value

      def name
        @name
      end

        # The method to set the value to name
        # @param name [String] A String

      def name=(name)
        if name!=nil and !name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: name EXPECTED TYPE: String', nil, nil)
        end
        @name = name
        @key_modified['name'] = 1
      end

        # The method to get the display_label
        # @return A String value

      def display_label
        @display_label
      end

        # The method to set the value to display_label
        # @param display_label [String] A String

      def display_label=(display_label)
        if display_label!=nil and !display_label.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: display_label EXPECTED TYPE: String', nil, nil)
        end
        @display_label = display_label
        @key_modified['display_label'] = 1
      end

        # The method to get the customizable
        # @return A Boolean value

      def customizable
        @customizable
      end

        # The method to set the value to customizable
        # @param customizable [Boolean] A Boolean

      def customizable=(customizable)
        if customizable!=nil and ! [true, false].include?customizable
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: customizable EXPECTED TYPE: Boolean', nil, nil)
        end
        @customizable = customizable
        @key_modified['customizable'] = 1
      end

        # The method to get the parent_permissions
        # @return An instance of Array

      def parent_permissions
        @parent_permissions
      end

        # The method to set the value to parent_permissions
        # @param parent_permissions [Array] An instance of Array

      def parent_permissions=(parent_permissions)
        if parent_permissions!=nil and !parent_permissions.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: parent_permissions EXPECTED TYPE: Array', nil, nil)
        end
        @parent_permissions = parent_permissions
        @key_modified['parent_permissions'] = 1
      end

        # The method to get the module
        # @return A String value

      def module
        @module_1
      end

        # The method to set the value to module
        # @param module_1 [String] A String

      def module=(module_1)
        if module_1!=nil and !module_1.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: module_1 EXPECTED TYPE: String', nil, nil)
        end
        @module_1 = module_1
        @key_modified['module'] = 1
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
