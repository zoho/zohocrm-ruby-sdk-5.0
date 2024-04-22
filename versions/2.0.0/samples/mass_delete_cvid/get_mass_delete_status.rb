require "ZOHOCRMSDK5_0"

class GetMassDeleteStatus
		def self.get_mass_delete_status(job_id, module_api_name)
			mass_delete_cvid_operations =  ZOHOCRMSDK::MassDeleteCvid::MassDeleteCvidOperations.new(module_api_name)
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::MassDeleteCvid::MassDeleteCvidOperations::GetMassDeleteStatusParam.job_id, job_id)
			response = mass_delete_cvid_operations.get_mass_delete_status(param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::MassDeleteCvid::ResponseWrapper
						response_wrapper = response_handler
						status= response_wrapper.data
						status.each do |status1|
							print "mass_delete TotalCount: " + status1.total_count.to_s + "\n"
							print "mass_delete ConvertedCount: " + status1.deleted_count.to_s + "\n"
							print "mass_delete FailedCount: " + status1.failed_count.to_s + "\n"
							print "mass_delete Status: " + status1.status.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::MassDeleteCvid::APIException
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
				module_api_name = "dot"
				job_id = 347706116634118
				get_mass_delete_status(job_id, module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
GetMassDeleteStatus.initialize_and_call