require "ZOHOCRMSDK5_0"

class UpdateContactRoles
		def self.update_contact_roles
			contact_roles_operations =  ZOHOCRMSDK::ContactRoles::ContactRolesOperations.new
			body_wrapper =  ZOHOCRMSDK::ContactRoles::BodyWrapper.new
			contact_roles_list=[]
			cr1 =  ZOHOCRMSDK::ContactRoles::ContactRole.new
			cr1.id = 347706114686005
			cr1.name="Editsded1"
			contact_roles_list.push(cr1)
			cr2 =  ZOHOCRMSDK::ContactRoles::ContactRole.new
			cr2.id = 347706114686003
			cr2.sequence_number = 1
			cr2.name="Edisdasted1"
			contact_roles_list.push(cr2)
			body_wrapper.contact_roles = contact_roles_list
			response = contact_roles_operations.update_roles(body_wrapper)
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
				update_contact_roles
			rescue Exception => e
				raise e
			end
		end
end
UpdateContactRoles.initialize_and_call