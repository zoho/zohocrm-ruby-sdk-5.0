require "ZOHOCRMSDK5_0"

class GetFieldAttachments
		def self.get_field_attachments(destination_folder, module_api_name, record_id, attachment_id)
			field_attachments_operations =  ZOHOCRMSDK::FieldAttachments::FieldAttachmentsOperations.new(module_api_name, record_id, attachment_id)
			response = field_attachments_operations.get_field_attachments
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::FieldAttachments::FileBodyWrapper
 				    file_body_wrapper = response_handler
						stream_wrapper = file_body_wrapper.file
						File.open(destination_folder + '/' + stream_wrapper.name, 'w') do |f|
							f.write(stream_wrapper.stream)
						end
					elsif response_handler.is_a? ZOHOCRMSDK::FieldAttachments::APIException
						exception = response_handler
						print "status: " + exception.status.value.to_s + "\n"
						print "code: " + exception.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						exception.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + exception.message.to_s + "\n"
					end
				elsif response.status_code != 204
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
				destination_folder = "/users/zohocrm-java-sdk-sample/file"
				module_api_name = "leads"
				record_id = 4402480774074
				attachment_id = 440248001286011
				get_field_attachments(destination_folder, module_api_name, record_id, attachment_id)
			rescue Exception => e
				raise e
			end
		end
end
GetFieldAttachments.initialize_and_call
