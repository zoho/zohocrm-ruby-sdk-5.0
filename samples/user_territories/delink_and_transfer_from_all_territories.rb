require "ZOHOCRMSDK5_0"

class DelinkAndTransferFromAllTerritories
		def self.delink_and_transfer_from_all_territories(user_id)
			users_territories_operations =  ZOHOCRMSDK::UsersTerritories::UsersTerritoriesOperations.new
			request =  ZOHOCRMSDK::UsersTerritories::TransferWrapper.new
			user_territory_list=[]
			territory =  ZOHOCRMSDK::UsersTerritories::TransferAndDelink.new
			territory.id = 34770613051397
			transfer_to_user =  ZOHOCRMSDK::UsersTerritories::TransferToUser.new
			transfer_to_user.id = 347706113767065
			territory.transfer_to_user = transfer_to_user
			user_territory_list.push(territory)
			request.transfer_and_delink = user_territory_list
			response = users_territories_operations.delink_and_transfer_from_all_territories(user_id, request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::UsersTerritories::TransferActionWrapper
						response_wrapper = action_handler
						action_responses= response_wrapper.transfer_and_delink
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
				delink_and_transfer_from_all_territories(user_id)
			rescue Exception => e
				raise e
			end
		end
end
DelinkAndTransferFromAllTerritories.initialize_and_call