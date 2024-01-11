require "ZOHOCRMSDK5_0"

class UpdateUsers
		def self.update_users
			users_operations =  ZOHOCRMSDK::Users::UsersOperations.new
			request =  ZOHOCRMSDK::Users::BodyWrapper.new
			user_list=[]
			user1=ZOHOCRMSDK::Users::Users.new
			user1.id = 347706117111001
			role =  ZOHOCRMSDK::Users::Role.new
			role.id = 3477061026008
			user1.role = role
			user1.country_locale="en_US"
			user_list.push(user1)
			user1=ZOHOCRMSDK::Users::Users.new
			user1.id = 347706116697013
			role =  ZOHOCRMSDK::Users::Role.new
			role.id = 3477061026008
			user1.role = role
			user1.country_locale="en_US"
	#		user1.add_key_value(api_name, value)
			user_list.push(user1)
			request.users = user_list
			response = users_operations.update_users(request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::Users::ActionWrapper
						response_wrapper = action_handler
						action_responses= response_wrapper.users
						action_responses.each do |action_response|
							if action_response.is_a? SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::Users::APIException
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
					elsif action_handler.is_a? ZOHOCRMSDK::Users::APIException
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
				update_users
			rescue Exception => e
				raise e
			end
		end
end
UpdateUsers.initialize_and_call