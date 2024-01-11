require "ZOHOCRMSDK5_0"

class RemoveContactRoleFromDeal
		def self.remove_contact_role_from_deal(contact_id, deal_id)
			contact_roles_operations =  ZOHOCRMSDK::DealContactRoles::DealContactRolesOperations.new
			response = contact_roles_operations.delete_contact_role_realation(contact_id, deal_id)
			if response != nil
				print "status code" + response.status_code.to_s + "\n"
				action_handler = response.data_object
				if action_handler.is_a? ZOHOCRMSDK::DealContactRoles::ActionWrapper
					action_wrapper = action_handler
					action_responses= action_wrapper.data
					action_responses.each do |action_response|
						if action_response.is_a? ZOHOCRMSDK::DealContactRoles::SuccessResponse
							success_response = action_response
							print "status: " + success_response.status.value.to_s + "\n"
							print "code: " + success_response.code.value.to_s + "\n"
							print "details: ".to_s + "\n"
							if success_response.details != nil
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
							end
							print "message: " + success_response.message.to_s + "\n"
						elsif action_response.is_a? ZOHOCRMSDK::DealContactRoles::APIException
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
				elsif action_handler.is_a? ZOHOCRMSDK::DealContactRoles::APIException
					exception = action_handler
					print "status: " + exception.status.value.to_s + "\n"
					print "code: " + exception.code.value.to_s + "\n"
					print "details: ".to_s + "\n"
					exception.details.each do |k, v|
						print k + ": " + v.to_s + "\n"
					end
					print "message: " + exception.message.to_s + "\n"
				end
			end
		end
	def self.initialize_and_call
			begin
				environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				deal_id = 440248001177050
				contact_id = 440248001030088
				remove_contact_role_from_deal(contact_id, deal_id)
			rescue Exception => e
				raise e
			end
		end
end
RemoveContactRoleFromDeal.initialize_and_call