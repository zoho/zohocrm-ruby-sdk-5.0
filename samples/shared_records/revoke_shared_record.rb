require "ZOHOCRMSDK5_0"

class RevokeSharedRecord
		def self.revoke_shared_record(module_api_name, record_id)
			share_records_operations =  ZOHOCRMSDK::ShareRecords::ShareRecordsOperations.new(record_id, module_api_name)
			response = share_records_operations.revoke_shared_record
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					delete_action_handler = response.data_object
					if delete_action_handler.is_a? ZOHOCRMSDK::ShareRecords::DeleteActionWrapper
						delete_action_wrapper = delete_action_handler
						delete_action_response = delete_action_wrapper.share
						if delete_action_response.is_a? ZOHOCRMSDK::ShareRecords::SuccessResponse
							success_response = delete_action_response
							print "status: " + success_response.status.value.to_s + "\n"
							print "code: " + success_response.code.value.to_s + "\n"
							print "details: ".to_s + "\n"
							success_response.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
							print "message: " + success_response.message.value.to_s + "\n"
						elsif delete_action_response.is_a? ZOHOCRMSDK::ShareRecords::APIException
							exception = delete_action_response
							print "status: " + exception.status.value.to_s + "\n"
							print "code: " + exception.code.value.to_s + "\n"
							print "details: ".to_s + "\n"
							exception.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
							print "message: " + exception.message.value.to_s + "\n"
						end
					elsif delete_action_handler.is_a? ZOHOCRMSDK::ShareRecords::APIException
						exception = delete_action_handler
						print "status: " + exception.status.value.to_s + "\n"
						print "code: " + exception.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						exception.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + exception.message.value.to_s + "\n"
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
				record_id = 347706114963002
				module_api_name = "leads"
				revoke_shared_record(module_api_name, record_id)
			rescue Exception => e
				raise e
			end
		end
end
RevokeSharedRecord.initialize_and_call
