require "ZOHOCRMSDK5_0"

class GetRecordCountForTag
		def self.get_record_count_for_tag(module_api_name, tag_id)
			tags_operations =  ZOHOCRMSDK::Tags::TagsOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Tags::TagsOperations::GetRecordCountForTagParam.module, module_api_name)
			response = tags_operations.get_record_count_for_tag(tag_id, param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					count_handler = response.data_object
					if count_handler.is_a? ZOHOCRMSDK::Tags::CountResponseWrapper
						count_wrapper = count_handler
						print "tag Count: " + count_wrapper.count.to_s + "\n"
					elsif count_handler.is_a? ZOHOCRMSDK::Tags::APIException
						exception = count_handler
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
				tag_id = 440248001279032
				get_record_count_for_tag(module_api_name, tag_id)
			rescue Exception => e
				raise e
			end
		end
end
GetRecordCountForTag.initialize_and_call