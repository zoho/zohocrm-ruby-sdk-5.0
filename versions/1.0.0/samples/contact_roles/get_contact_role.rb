require "ZOHOCRMSDK5_0"

class GetContactRole
		def self.get_contact_role(contact_role_id)
			contact_roles_operations =  ZOHOCRMSDK::ContactRoles::ContactRolesOperations.new
			response = contact_roles_operations.get_role(contact_role_id)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::ContactRoles::BodyWrapper
						response_wrapper = response_handler
						contact_roles= response_wrapper.contact_roles
						contact_roles.each do |contact_role|
							print "contact_role ID: " + contact_role.id.to_s + "\n"
							print "contact_role Name: " + contact_role.name.to_s + "\n"
							print "contact_role SequenceNumber: " + contact_role.sequence_number.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::ContactRoles::APIException
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
				contact_role_id = 4770615208001
				get_contact_role(contact_role_id)
			rescue Exception => e
				raise e
			end
		end
end
GetContactRole.initialize_and_call