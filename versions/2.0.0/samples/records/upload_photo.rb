require "ZOHOCRMSDK5_0"

class UploadPhoto
		def self.upload_photo(module_api_name, record_id, absolute_file_path)
			record_operations =  ZOHOCRMSDK::Record::RecordOperations.new
			file_body_wrapper =  ZOHOCRMSDK::Record::FileBodyWrapper.new
			stream_wrapper =  ZOHOCRMSDK::Util::StreamWrapper.new(nil, nil, absolute_file_path)
			file_body_wrapper.file = stream_wrapper
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Record::RecordOperations::UploadPhotoParam.restrict_triggers, "workflow")
			response = record_operations.upload_photo(record_id, module_api_name, file_body_wrapper, param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					file_handler = response.data_object
					if file_handler.is_a? ZOHOCRMSDK::Record::SuccessResponse
						success_response = file_handler
						print "status: " + success_response.status.value.to_s + "\n"
						print "code: " + success_response.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						success_response.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + success_response.message.value.to_s + "\n"
					elsif file_handler.is_a? ZOHOCRMSDK::Record::APIException
						exception = file_handler
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
				record_id = 34770615177002
				absolute_file_path = "/users/zohocrm-java-sdk-sample/file/download.png"
				upload_photo(module_api_name, record_id, absolute_file_path)
			rescue Exception => e
				raise e
			end
		end
end
UploadPhoto.initialize_and_call