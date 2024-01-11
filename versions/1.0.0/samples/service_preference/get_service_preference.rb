require "ZOHOCRMSDK5_0"

class GetServicePreference
		def self.get_service_preference
			service_preference_operations =  ZOHOCRMSDK::ServicePreference::ServicePreferenceOperations.new
			response = service_preference_operations.get_service_preference
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::ServicePreference::ResponseWrapper
						response_wrapper = response_handler
						service_preferences = response_wrapper.service_preferences
						if service_preferences != nil
							print "job_sheet_enabled : " + service_preferences.job_sheet_enabled.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::ServicePreference::APIException
						exception = response_handler
						print "status: " + exception.status.value.to_s + "\n"
						print "code: " + exception.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						exception.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + exception.message.to_s + "\n"
					end
				else
          response_object = response.data_object
          response_object.instance_variables.each do |field_1|
            print field_1
            print "\n"
            print response_object.instance_variable_get(field_1)

					end
				end
			end
		end
	def self.initialize_and_call
			begin
				environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				get_service_preference
			rescue Exception => e
				raise e
			end
		end
end
GetServicePreference.initialize_and_call