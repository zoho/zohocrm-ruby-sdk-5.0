require "ZOHOCRMSDK5_0"

class GetRecordCount
		def self.get_record_count
			record_operations =  ZOHOCRMSDK::Record::RecordOperations.new
			module_api_name = "leads"
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Record::RecordOperations.RecordCountParam.phone, "(990) -")
			response = record_operations.record_count(module_api_name, param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					count_handler = response.data_object
					if count_handler.is_a? ZOHOCRMSDK::Record::CountWrapper
						count_wrapper = count_handler
						print "record Count: " + count_wrapper.count.to_s + "\n"
					elsif count_handler.is_a? ZOHOCRMSDK::Record::APIException
						exception = count_handler
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
				get_record_count
			rescue Exception => e
				raise e
			end
		end
end
GetRecordCount.initialize_and_call