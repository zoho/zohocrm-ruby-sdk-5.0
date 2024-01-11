require "ZOHOCRMSDK5_0"

class UserTransferAndDelete
		def self.user_transfer_and_delete(id)
			users_transfer_delete_operations =  ZOHOCRMSDK::UsersTransferDelete::UsersTransferDeleteOperations.new
			request =  ZOHOCRMSDK::UsersTransferDelete::BodyWrapper.new
			transfer_and_deletes=[]
			transfer_and_delete =  ZOHOCRMSDK::UsersTransferDelete::TransferAndDelete.new
			transfer =  ZOHOCRMSDK::UsersTransferDelete::Transfer.new
			transfer.records = true
			transfer.assignment = true
			transfer.criteria = false
			transfer.id = 34349178323
			transfer_and_delete.transfer = transfer
			move_subordinate =  ZOHOCRMSDK::UsersTransferDelete::MoveSubordinate.new
			move_subordinate.id = 323234872984342
			transfer_and_delete.move_subordinate = move_subordinate
			transfer_and_deletes.push(transfer_and_delete)
			request.transfer_and_delete = transfer_and_deletes
			response = users_transfer_delete_operations.user_transfer_and_delete(id, request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::UsersTransferDelete::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.transfer_and_delete
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::UsersTransferDelete::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::UsersTransferDelete::APIException
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
					elsif action_handler.is_a? ZOHOCRMSDK::UsersTransferDelete::APIException
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
				id = 3376487238733
				user_transfer_and_delete(id)
			rescue Exception => e
				raise e
			end
		end
end
UserTransferAndDelete.initialize_and_call
