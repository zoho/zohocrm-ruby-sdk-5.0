require 'ZOHOCRMSDK5_0'
module MultiUser
  class SingleThreading
    def initialize(module_api_name)
      @module_api_name = module_api_name
    end
    def execute(environment, token, token_store, sdk_config,resources_path, log, proxy)
      ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token, store: token_store, sdk_config: sdk_config, resources_path: resources_path,log:log,request_proxy: proxy)
      token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id: "clientId", client_secret:"clientSecret", grant_token:"grant_token", refresh_token:"refresh_token", redirect_url:"redirectURL", id:"id")
      environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
      sdk_config = ZOHOCRMSDK::SDKConfig.new(auto_refresh_fields: false,pick_list_validation: true,open_timeout: 60,read_timeout: 60,write_timeout: 60,keep_alive_timeout: 2)
      func1(environment, token, sdk_config)
    end
    def func1(environment, token, sdk_config)
      ZOHOCRMSDK::Initializer.switch_user(environment:environment, token:token, sdk_config:sdk_config)
      ro = ZOHOCRMSDK::Record::RecordOperations.new
      param_instance = ZOHOCRMSDK::ParameterMap.new
      param_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetRecordsParam.fields, "id")
      ro.get_records(@module_api_name,param_instance,nil)
    end
  end
end
log = ZOHOCRMSDK::SDKLog::Log.initialize(level:ZOHOCRMSDK::Levels::INFO,path:"/Users/user_name/Documents/rubysdk_log.log")
environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id: "clientId", client_secret:"clientSecret", grant_token:"grant_token", refresh_token:"refresh_token", redirect_url:"redirectURL")
token_store = ZOHOCRMSDK::Store::FileStore.new("/Users/user_name/Documents/ruby_sdk_token.txt")
sdk_config = ZOHOCRMSDK::SDKConfig.new(auto_refresh_fields: false,pick_list_validation: true,open_timeout: 60,read_timeout: 60,write_timeout: 60,keep_alive_timeout: 2)
proxy = ZOHOCRMSDK::RequestProxy.new(host:"proxyHost", port:"proxyPort", user_name:"proxyUser", password:"password")
module_api_name = "Leads"
resource_path = "/Users/user_name/Documents"
MultiUser::MultiThreading.new(module_api_name).execute(environment, token, token_store, sdk_config,resource_path, log,proxy)
