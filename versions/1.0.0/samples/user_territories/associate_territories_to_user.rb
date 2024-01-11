require "ZOHOCRMSDK5_0"

class AssociateTerritoriesToUser
		def self.associate_territories_to_user(user_id)
			users_territories_operations =  ZOHOCRMSDK::UsersTerritories::UsersTerritoriesOperations.new
			request =  ZOHOCRMSDK::UsersTerritories::BodyWrapper.new
			user_territory_list=[]
			territory =  ZOHOCRMSDK::UsersTerritories::Territory.new
			territory.id="440248001305235"
			user_territory_list.push(territory)
			request.territories = user_territory_list
			response = users_territories_operations.associate_territories_to_user(user_id, request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::UsersTerritories::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.territories
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::UsersTerritories::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"

							elsif action_response.is_a? ZOHOCRMSDK::UsersTerritories::APIException
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
					elsif action_handler.is_a? ZOHOCRMSDK::UsersTerritories::APIException
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
				user_id = 4402480254001
				associate_territories_to_user(user_id)
			rescue Exception => e
				raise e
			end
		end
end
AssociateTerritoriesToUser.initialize_and_call