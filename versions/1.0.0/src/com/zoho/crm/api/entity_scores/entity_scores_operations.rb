require_relative '../param'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module ZOHOCRMSDK
  module EntityScores
    class EntityScoresOperations

        # Creates an instance of EntityScoresOperations with the given parameters
        # @param fields [String] A String
      def initialize(fields=nil)
        if fields!=nil and !fields.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: fields EXPECTED TYPE: String', nil, nil)
        end
        @fields = fields
      end

        # The method to get module
        # @param record_id [Integer] A Integer
        # @param module_1 [String] A String
        # @return An instance of APIResponse
      # @raise SDKException
      def get_module(record_id, module_1)
        if !record_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: record_id EXPECTED TYPE: Integer', nil, nil)
        end
        if !module_1.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: module_1 EXPECTED TYPE: String', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v5/'
        api_path = api_path + module_1.to_s
        api_path = api_path + '/'
        api_path = api_path + record_id.to_s
        api_path = api_path + '/Entity_Scores__s'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.add_param(Param.new('fields', 'com.zoho.crm.api.EntityScores.GetModuleParam'), @fields)
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to get modules
        # @return An instance of APIResponse
      # @raise SDKException
      def get_modules
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v5/Entity_Scores__s'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.add_param(Param.new('fields', 'com.zoho.crm.api.EntityScores.GetModulesParam'), @fields)
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

      class GetModuleParam
      end

      class GetModulesParam
      end

    end
  end
end
