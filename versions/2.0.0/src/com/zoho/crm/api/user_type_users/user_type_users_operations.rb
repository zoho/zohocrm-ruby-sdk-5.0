require_relative '../param'
require_relative '../parameter_map'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module ZOHOCRMSDK
  module UserTypeUsers
    class UserTypeUsersOperations

      # Creates an instance of UserTypeUsersOperations
      def initialize
      end

        # The method to get users of user type
        # @param user_type_id [Integer] A Integer
        # @param portal_name [String] A String
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def get_users_of_user_type(user_type_id, portal_name, param_instance=nil)
        if !user_type_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: user_type_id EXPECTED TYPE: Integer', nil, nil)
        end
        if !portal_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: portal_name EXPECTED TYPE: String', nil, nil)
        end
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v5/settings/portals/'
        api_path = api_path + portal_name.to_s
        api_path = api_path + '/user_type/'
        api_path = api_path + user_type_id.to_s
        api_path = api_path + '/users'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.param = param_instance
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

      class GetUsersofUserTypeParam
          @@filters =   Param.new('filters', 'com.zoho.crm.api.UserTypeUsers.GetUsersofUserTypeParam')
        def self.filters
          @@filters
        end
          @@type =   Param.new('type', 'com.zoho.crm.api.UserTypeUsers.GetUsersofUserTypeParam')
        def self.type
          @@type
        end
      end

    end
  end
end
