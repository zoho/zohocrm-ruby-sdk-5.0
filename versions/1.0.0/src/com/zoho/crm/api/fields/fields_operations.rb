require_relative '../param'
require_relative '../parameter_map'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module ZOHOCRMSDK
  module Fields
    class FieldsOperations

      # Creates an instance of FieldsOperations
      def initialize
      end

        # The method to get fields
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def get_fields(param_instance=nil)
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v5/settings/fields'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.param = param_instance
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to get field
        # @param field [Integer] A Integer
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def get_field(field, param_instance=nil)
        if !field.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: field EXPECTED TYPE: Integer', nil, nil)
        end
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v5/settings/fields/'
        api_path = api_path + field.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.param = param_instance
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

      class GetFieldsParam
          @@module_1 =   Param.new('module', 'com.zoho.crm.api.Fields.GetFieldsParam')
        def self.module_1
          @@module_1
        end
          @@data_type =   Param.new('data_type', 'com.zoho.crm.api.Fields.GetFieldsParam')
        def self.data_type
          @@data_type
        end
          @@type =   Param.new('type', 'com.zoho.crm.api.Fields.GetFieldsParam')
        def self.type
          @@type
        end
          @@include =   Param.new('include', 'com.zoho.crm.api.Fields.GetFieldsParam')
        def self.include
          @@include
        end
          @@feature_name =   Param.new('feature_name', 'com.zoho.crm.api.Fields.GetFieldsParam')
        def self.feature_name
          @@feature_name
        end
          @@component =   Param.new('component', 'com.zoho.crm.api.Fields.GetFieldsParam')
        def self.component
          @@component
        end
          @@layout_id =   Param.new('layout_id', 'com.zoho.crm.api.Fields.GetFieldsParam')
        def self.layout_id
          @@layout_id
        end
      end

      class GetFieldParam
          @@module_1 =   Param.new('module', 'com.zoho.crm.api.Fields.GetFieldParam')
        def self.module_1
          @@module_1
        end
          @@include =   Param.new('include', 'com.zoho.crm.api.Fields.GetFieldParam')
        def self.include
          @@include
        end
      end

    end
  end
end
