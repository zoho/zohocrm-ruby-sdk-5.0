require "ZOHOCRMSDK5_0"

class DeleteProfile
		def self.delete_profile(profile_id, existingprofileid)
			profiles_operations =  ZOHOCRMSDK::Profiles::ProfilesOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Profiles::ProfilesOperations::DeleteProfileParam.transfer_to, existingprofileid)
			response = profiles_operations.delete_profile(profile_id, param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::Profiles::SuccessResponse
						success_response = action_handler
						print "status: " + success_response.status.value.to_s + "\n"
						print "code: " + success_response.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						success_response.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + success_response.message.to_s + "\n"
					elsif action_handler.is_a? ZOHOCRMSDK::Profiles::APIException
						exception = action_handler
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
				profile_id = 3477061026011
				existingprofileid = 347706116715008
				delete_profile(profile_id, existingprofileid)
			rescue Exception => e
				raise e
			end
		end
end
DeleteProfile.initialize_and_call