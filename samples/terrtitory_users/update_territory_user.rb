require "ZOHOCRMSDK5_0"

	 
class UpdateTerritoryUser
		def self.update_territoryuser(user, territory)
			territory_users_operations =  ZOHOCRMSDK::TerritoryUsers::TerritoryUsersOperations.new
			response = territory_users_operations.update_territory_user(user, territory)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::TerritoryUsers::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.users
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::TerritoryUsers::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::TerritoryUsers::APIException
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

					elsif action_handler.is_a? ZOHOCRMSDK::TerritoryUsers::APIException
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
				territory_id = 440248001305227
				user = 440248001305249
				update_territoryuser(user, territory_id)
			rescue Exception => e
				raise e
			end
		end
end
UpdateTerritoryUser.initialize_and_call