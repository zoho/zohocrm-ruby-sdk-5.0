require 'ZOHOCRMSDK5_0'
module SingleUser
  class MultiThreading
    def execute(environment, token, tokenstore, sdk_config, resources_path, log,proxy)
      ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token, store: tokenstore, sdk_config: sdk_config, resources_path: resources_path,log:log,request_proxy: proxy)
      t1 = Thread.new{func1("Leads")}
      t2 = Thread.new{func1("Deals")}
      t1.join
      t2.join
    end
    def func1(module_api_name)
      ro = ZOHOCRMSDK::Record::RecordOperations.new
      param_instance = ZOHOCRMSDK::ParameterMap.new
      param_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetRecordsParam.fields, "id")
      response = ro.get_records(module_api_name,param_instance,nil)
    end

  end
end
log = ZOHOCRMSDK::SDKLog::Log.initialize(level:ZOHOCRMSDK::Levels::INFO,path:"/Users/user_name/Documents/rubysdk_log.log")
environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id: "clientId", client_secret:"clientSecret", grant_token:"grant_token", refresh_token:"refresh_token", redirect_url:"redirectURL", id:"id")
tokenstore = ZOHOCRMSDK::Store::FileStore.new("Users/user_name/sdk_tokens.txt")
sdk_config = ZOHOCRMSDK::SDKConfig.new(auto_refresh_fields: false,pick_list_validation: true,open_timeout: 60,read_timeout: 60,write_timeout: 60,keep_alive_timeout: 2)
proxy = ZOHOCRMSDK::RequestProxy.new(host:"proxyHost", port:"proxyPort", user_name:"proxyUser", password:"password")
resource_path = "/Users/user_name/ruby-application"
SingleUser::MultiThreading.new.execute(environment, token, tokenstore, sdk_config, resource_path, log, proxy)