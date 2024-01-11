require "ZOHOCRMSDK5_0"

class CheckStatus
		def self.check_status(job_id, module_1)
			mass_change_owner_operations =  ZOHOCRMSDK::MassChangeOwner::MassChangeOwnerOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::MassChangeOwner::MassChangeOwnerOperations::CheckStatusParam.job_id, job_id)
			response = mass_change_owner_operations.check_status(module_1, param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::MassChangeOwner::ResponseWrapper
						response_wrapper = response_handler
						status= response_wrapper.data
						status.each do |status1|
							print "mass_change_owner TotalCount: " + status1.total_count.to_s + "\n"
							print "mass_change_owner UpdatedCount: " + status1.updated_count.to_s + "\n"
							print "mass_change_owner NotUpdatedCount: " + status1.not_updated_count.to_s + "\n"
							print "mass_change_owner FailedCount: " + status1.failed_count.to_s + "\n"
							print "mass_change_owner Status: " + status1.status.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::MassChangeOwner::APIException
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
				module_api_name = "leads"
				job_id = 347706117101007
				check_status(job_id, module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
CheckStatus.initialize_and_call