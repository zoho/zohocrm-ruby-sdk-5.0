require "ZOHOCRMSDK5_0"

class GetMassUpdateStatus
		def self.get_mass_update_status(module_api_name, job_id)
			record_operations =  ZOHOCRMSDK::Record::RecordOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetMassUpdateStatusParam.job_id, job_id)
			response = record_operations.get_mass_update_status(module_api_name, param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					mass_update_response_handler = response.data_object
					if mass_update_response_handler.is_a? ZOHOCRMSDK::Record::MassUpdateResponseWrapper
						mass_update_response_wrapper = mass_update_response_handler
						mass_update_responses= mass_update_response_wrapper.data
						mass_update_responses.each do |mass_update_response|
							if mass_update_response.is_a? ZOHOCRMSDK::Record::MassUpdate
								mass_update = mass_update_response
								print "mass_update Status: " + mass_update.status.value.to_s + "\n"
								print "mass_update FailedCount: " + mass_update.failed_count.to_s + "\n"
								print "mass_update UpdatedCount: " + mass_update.updated_count.to_s + "\n"
								print "mass_update NotUpdatedCount: " + mass_update.not_updated_count.to_s + "\n"
								print "mass_update TotalCount: " + mass_update.total_count.to_s + "\n"
							elsif mass_update_response.is_a? ZOHOCRMSDK::Record::APIException
								exception = mass_update_response
								print "status: " + exception.status.value.to_s + "\n"
								print "code: " + exception.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								exception.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + exception.message.value.to_s + "\n"
							end
						end
					elsif mass_update_response_handler.is_a? ZOHOCRMSDK::Record::APIException
						exception = mass_update_response_handler
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
				module_api_name = "leads"
				job_id = "347706117121011"
				get_mass_update_status(module_api_name, job_id)
			rescue Exception => e
				raise e
			end
		end
end
GetMassUpdateStatus.initialize_and_call