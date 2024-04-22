require "ZOHOCRMSDK5_0"

class GetDownloadAttachmentsDetails
		def self.get_download_attachment_details(module_1, record_id, user_id, message_id, destination_folder)
			download_attachments_operations =  ZOHOCRMSDK::DownloadAttachments::DownloadAttachmentsOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::DownloadAttachments::DownloadAttachmentsOperations::GetDownloadAttachmentsDetailsParam.message_id, message_id)
			param_instance.add(ZOHOCRMSDK::DownloadAttachments::DownloadAttachmentsOperations::GetDownloadAttachmentsDetailsParam.user_id, user_id)
			response = download_attachments_operations.get_download_attachments_details(record_id, module_1, param_instance)
			if response != nil
				print "status Code : " + response.status_code.to_s + "\n"
				if response.status_code == 204
					print "no Content".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::DownloadAttachments::FileBodyWrapper
 				    file_body_wrapper = response_handler
						stream_wrapper = file_body_wrapper.file
						File.open(destination_folder + '/' + stream_wrapper.name, 'w') do |f|
							f.write(stream_wrapper.stream)
						end
					elsif response_handler.is_a? ZOHOCRMSDK::DownloadAttachments::APIException
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
				module_1 = "leads"
				record_id = 4402480774074
				user_id = 4402480254001
				message_id = "c6085fcbd6902b140927cfe9e18"
				destination_folder = "/users/zohocrm-java-sdk-sample/file"
				get_download_attachment_details(module_1, record_id, user_id, message_id, destination_folder)
			rescue Exception => e
				raise e
			end
		end
end
GetDownloadAttachmentsDetails.initialize_and_call