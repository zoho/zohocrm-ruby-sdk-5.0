require "ZOHOCRMSDK5_0"

class UpdateSharePermissions
		def self.update_share_permissions(module_api_name, record_id)
			share_records_operations =  ZOHOCRMSDK::ShareRecords::ShareRecordsOperations.new(record_id, module_api_name)
			request =  ZOHOCRMSDK::ShareRecords::BodyWrapper.new
			share_list=[]
			share1 =  ZOHOCRMSDK::ShareRecords::ShareRecord.new
			share1.share_related_records = true
			share1.permission =  ZOHOCRMSDK::Util::Choice.new("full_access")
			user =  ZOHOCRMSDK::Users::Users.new
			user.id = 34770615791024
			share1.user = user
			share1.type =  ZOHOCRMSDK::Util::Choice.new("public")
			share_list.push(share1)
			request.share = share_list
			response = share_records_operations.update_share_permissions(request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::ShareRecords::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.share
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::ShareRecords::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.value.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::ShareRecords::APIException
								exception = action_response
								print "status: " + exception.status.value.to_s + "\n"
								print "code: " + exception.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								exception.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + exception.message.value.to_s + "\n"
							end
						end
					elsif action_handler.is_a? ZOHOCRMSDK::ShareRecords::APIException
						exception = action_handler
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
				update_share_permissions(module_api_name, record_id)
			rescue Exception => e
				raise e
			end
		end
end
UpdateSharePermissions.initialize_and_call