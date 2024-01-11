require "ZOHOCRMSDK5_0"

class TransferAndDeleteTerritory
		def self.transfer_and_delete_territory(id)
			territories_operations =  ZOHOCRMSDK::Territories::TerritoriesOperations.new
			request =  ZOHOCRMSDK::Territories::TransferBodyWrapper.new
			territories=[]
			territory =  ZOHOCRMSDK::Territories::TransferTerritory.new
			territory.transfer_to_id = 32322131232
			territory.delete_previous_forecasts = false
			territories.push(territory)
			request.territories = territories
			response = territories_operations.transfer_and_delete_territory(id, request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::Territories::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.territories
						if action_responses != nil
							action_responses.each do |action_response|
								if action_response.is_a? ZOHOCRMSDK::Territories::SuccessResponse
									success_response = action_response
									print "status: " + success_response.status.value.to_s + "\n"
									print "code: " + success_response.code.value.to_s + "\n"
									print "details: ".to_s + "\n"
									success_response.details.each do |k, v|
										print k + ": " + v.to_s + "\n"
									end
									print "message: " + success_response.message.to_s + "\n"
								elsif action_response.is_a? ZOHOCRMSDK::Territories::APIException
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
						end
					elsif action_handler.is_a? ZOHOCRMSDK::Territories::APIException
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
				id = 32132345345233
				transfer_and_delete_territory(id)
			rescue Exception => e
				raise e
			end
		end
end
TransferAndDeleteTerritory.initialize_and_call
