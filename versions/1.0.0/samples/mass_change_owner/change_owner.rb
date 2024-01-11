require "ZOHOCRMSDK5_0"

class ChangeOwner
		def self.change_owner(module_api_name)
			mass_change_owner_operations =  ZOHOCRMSDK::MassChangeOwner::MassChangeOwnerOperations.new
			body_wrapper =  ZOHOCRMSDK::MassChangeOwner::BodyWrapper.new
			body_wrapper.cvid = 347706115237021
			owner =  ZOHOCRMSDK::MassChangeOwner::Owner.new
			owner.id = 3477061173021
			body_wrapper.owner = owner
			territory =  ZOHOCRMSDK::MassChangeOwner::Territory.new
			territory.id = 36523977622003
			territory.include_child = true
			body_wrapper.territory = territory
			response = mass_change_owner_operations.change_owner(module_api_name, body_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::MassChangeOwner::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.data
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::MassChangeOwner::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							end
						end
					elsif action_handler.is_a? ZOHOCRMSDK::MassChangeOwner::APIException
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
				module_api_name = "dot"
				change_owner(module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
ChangeOwner.initialize_and_call