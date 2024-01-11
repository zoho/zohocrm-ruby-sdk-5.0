require "ZOHOCRMSDK5_0"

class UploadFile
		def self.upload_file(org_id, absolute_file_path)
			bulk_write_operations =  ZOHOCRMSDK::BulkWrite::BulkWriteOperations.new
			file_body_wrapper=ZOHOCRMSDK::BulkWrite::FileBodyWrapper.new
			stream_wrapper =  ZOHOCRMSDK::Util::StreamWrapper.new(nil, nil, absolute_file_path)
#			stream =  FileInputStream.new(absolute_file_path)
# 			stream_wrapper =  ZOHOCRMSDK::Util::StreamWrapper.new("leads.zip", stream)
			file_body_wrapper.file = stream_wrapper
			header_instance =  ZOHOCRMSDK::HeaderMap.new
			header_instance.add(ZOHOCRMSDK::BulkWrite::BulkWriteOperations::UploadFileHeader.Feature, "bulk-write")
			header_instance.add(ZOHOCRMSDK::BulkWrite::BulkWriteOperations::UploadFileHeader.X_crm_org, org_id)
			response = bulk_write_operations.upload_file(file_body_wrapper, header_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_response = response.data_object
					if action_response.is_a? ZOHOCRMSDK::BulkWrite::SuccessResponse
						success_response = action_response
						print "status: " + success_response.status.value.to_s + "\n"
						print "code: " + success_response.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						success_response.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + success_response.message.value.to_s + "\n"
					elsif action_response.is_a? ZOHOCRMSDK::BulkWrite::APIException
						exception = action_response
						if exception.status != nil
							print "status: " + exception.status.value.to_s + "\n"
						end
						if exception.code != nil
							print "code: " + exception.code.value.to_s + "\n"
						end
						if exception.message != nil
							print "message: " + exception.message.value.to_s + "\n"
						end
						print "details: ".to_s + "\n"
						if exception.details != nil
							exception.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
						end
						if exception.error_message != nil
							print "error_message: " + exception.error_message.value.to_s + "\n"
						end
						print "error_code: " + exception.error_code.to_s + "\n"
						if exception.x_error != nil
							print "x_error: " + exception.x_error.value.to_s + "\n"
						end
						if exception.info != nil
							print "info: " + exception.info.value.to_s + "\n"
						end
						if exception.x_info != nil
							print "x_info: " + exception.x_info.value.to_s + "\n"
						end
						print "http_status: " + exception.http_status.to_s + "\n"
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
			org_id = "673573045"
			absolute_file_path = "/users/_documents/_crm__sdk/leads.zip"
			upload_file(org_id, absolute_file_path)
		rescue Exception => e
			raise e
		end
	end
end
UploadFile.initialize_and_call