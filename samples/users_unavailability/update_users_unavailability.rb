require "ZOHOCRMSDK5_0"

class UpdateUsersUnavailability
		def self.update_users_unavailability(id)
			users_operations =  ZOHOCRMSDK::UsersUnavailability::UsersUnavailabilityOperations.new
			request =  ZOHOCRMSDK::UsersUnavailability::BodyWrapper.new
			user_list=[]
			user1=ZOHOCRMSDK::UsersUnavailability::UsersUnavailability.new
			user1.comments="Unavailable"
			from = DateTime.new(2022, 04, 02, 11, 00, 01, "+05:30")
			user1.from = from
			to = DateTime.new(2022, 05, 05, 11, 00, 01, "+05:30")
			user1.to = to
			user_list.push(user1)
			request.users_unavailability = user_list
			response = users_operations.update_user_unavailability(id, request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::UsersUnavailability::ActionWrapper
						response_wrapper = action_handler
						action_responses= response_wrapper.users_unavailability
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::UsersUnavailability::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::UsersUnavailability::APIException
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
					elsif action_handler.is_a? ZOHOCRMSDK::UsersUnavailability::APIException
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
				id = "347706117225001"
				update_users_unavailability(id)
			rescue Exception => e
				raise e
			end
		end
end
UpdateUsersUnavailability.initialize_and_call