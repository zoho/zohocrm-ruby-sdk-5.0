require "ZOHOCRMSDK5_0"

class GetStatus
		def self.get_status
			users_transfer_delete_operations =  ZOHOCRMSDK::UsersTransferDelete::UsersTransferDeleteOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::UsersTransferDelete::UsersTransferDeleteOperations::GetStatusParam.job_id, 32838742872382)
			response = users_transfer_delete_operations.get_status(param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::UsersTransferDelete::ResponseWrapper
						response_wrapper = response_handler
						transfer_and_delete= response_wrapper.transfer_and_delete
						if transfer_and_delete != nil
							transfer_and_delete.each do |status|
								print "transfer_and_delete Status: " + status.status.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::UsersTransferDelete::APIException
						exception = response_handler
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
				get_status
			rescue Exception => e
				raise e
			end
		end
end
GetStatus.initialize_and_call
