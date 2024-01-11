require_relative '../param'
require_relative '../parameter_map'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module ZOHOCRMSDK
  module EmailRelatedRecords
    class EmailRelatedRecordsOperations

        # Creates an instance of EmailRelatedRecordsOperations with the given parameters
        # @param record_id [Integer] A Integer
        # @param module_name [String] A String
      def initialize(record_id, module_name)
        if !record_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: record_id EXPECTED TYPE: Integer', nil, nil)
        end
        if !module_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: module_name EXPECTED TYPE: String', nil, nil)
        end
        @record_id = record_id
        @module_name = module_name
      end

        # The method to get emails related records
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def get_emails_related_records(param_instance=nil)
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v5/'
        api_path = api_path + @module_name.to_s
        api_path = api_path + '/'
        api_path = api_path + @record_id.to_s
        api_path = api_path + '/Emails'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.param = param_instance
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to get emails related record
        # @param message_id [String] A String
        # @return An instance of APIResponse
      # @raise SDKException
      def get_emails_related_record(message_id)
        if !message_id.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: message_id EXPECTED TYPE: String', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v5/'
        api_path = api_path + @module_name.to_s
        api_path = api_path + '/'
        api_path = api_path + @record_id.to_s
        api_path = api_path + '/Emails/'
        api_path = api_path + message_id.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

      class GetEmailsRelatedRecordsParam
          @@type =   Param.new('type', 'com.zoho.crm.api.EmailRelatedRecords.GetEmailsRelatedRecordsParam')
        def self.type
          @@type
        end
          @@index =   Param.new('index', 'com.zoho.crm.api.EmailRelatedRecords.GetEmailsRelatedRecordsParam')
        def self.index
          @@index
        end
          @@owner_id =   Param.new('owner_id', 'com.zoho.crm.api.EmailRelatedRecords.GetEmailsRelatedRecordsParam')
        def self.owner_id
          @@owner_id
        end
      end

    end
  end
end
