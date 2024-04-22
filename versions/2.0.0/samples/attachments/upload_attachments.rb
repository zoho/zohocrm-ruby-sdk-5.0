require "ZOHOCRMSDK5_0"
	

class UploadAttachments
		def self.upload_attachments(module_api_name, record_id, absolute_file_path)
			attachments_operations =  ZOHOCRMSDK::Attachments::AttachmentsOperations.new
			file_body_wrapper=ZOHOCRMSDK::Attachments::FileBodyWrapper.new
			stream_wrapper =  ZOHOCRMSDK::Util::StreamWrapper.new(nil, nil, absolute_file_path)
			file_body_wrapper.file = stream_wrapper
			response = attachments_operations.create_attachment(record_id, module_api_name, file_body_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::Attachments::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.data
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::Attachments::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								if success_response.details != nil
									success_response.details.each do |k, v|
										print k + ": " + v.to_s + "\n"
									end
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::Attachments::APIException
								exception = action_response
								print "status: " + exception.status.value.to_s + "\n"
								print "code: " + exception.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								if exception.details != nil
									exception.details.each do |k, v|
										print k + ": " + v.to_s + "\n"
									end
								end
								print "message: " + exception.message.to_s + "\n"
							end
						end
					elsif action_handler.is_a? ZOHOCRMSDK::Attachments::APIException
						exception = action_handler
						print "status: " + exception.status.value.to_s + "\n"
						print "code: " + exception.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						if exception.details != nil
							exception.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
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
				attachment_id = 347706117122005
				absolute_file_path = "/users/zohocrm-java-sdk-sample/file/download.png"
				upload_attachments(module_api_name, attachment_id, absolute_file_path)
			rescue Exception => e
				raise e
			end
		end
end
UploadAttachments.initialize_and_call