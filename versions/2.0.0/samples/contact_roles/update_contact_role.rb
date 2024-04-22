require "ZOHOCRMSDK5_0"

class UpdateContactRole
		def self.update_contact_role(contact_role_id)
			contact_roles_operations =  ZOHOCRMSDK::ContactRoles::ContactRolesOperations.new
			body_wrapper =  ZOHOCRMSDK::ContactRoles::BodyWrapper.new
			contact_roles_list=[]
			cr1 =  ZOHOCRMSDK::ContactRoles::ContactRole.new
			cr1.name="ContactRole"
			cr1.sequence_number = 2
			contact_roles_list.push(cr1)
			body_wrapper.contact_roles = contact_roles_list
			response = contact_roles_operations.update_role(contact_role_id, body_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::ContactRoles::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.contact_roles
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::ContactRoles::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::ContactRoles::APIException
								exception = action_response
								print "status: " + exception.status.value.to_s + "\n"
								print "code: " + exception.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								exception.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + exception.message.to_s + "\n"
							end
						end
					elsif action_handler.is_a? ZOHOCRMSDK::ContactRoles::APIException
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
				contact_role_id = 5255085067923
				update_contact_role(contact_role_id)
			rescue Exception => e
				raise e
			end
		end
end
UpdateContactRole.initialize_and_call