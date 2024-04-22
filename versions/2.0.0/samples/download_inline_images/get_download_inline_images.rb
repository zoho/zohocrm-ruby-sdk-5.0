require "ZOHOCRMSDK5_0"

class GetDownloadInlineImages
		def self.get_download_inline_images(module_1, record_id, user_id, message_id, id, destination_folder)
			download_inline_images_operations =  ZOHOCRMSDK::DownloadInlineImages::DownloadInlineImagesOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::DownloadInlineImages::DownloadInlineImagesOperations::GetDownloadInlineImagesParam.message_id, message_id)
			param_instance.add(ZOHOCRMSDK::DownloadInlineImages::DownloadInlineImagesOperations::GetDownloadInlineImagesParam.user_id, user_id)
			param_instance.add(GetDownloadInlineImagesParam.id, id)
			response = download_inline_images_operations.get_download_inline_images(record_id, module_1, param_instance)
			if response != nil
				print "status Code : " + response.status_code.to_s + "\n"
				if response.status_code == 204
					print "no Content".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::DownloadInlineImages::FileBodyWrapper
 				    file_body_wrapper = response_handler
						stream_wrapper = file_body_wrapper.file
						File.open(destination_folder + '/' + stream_wrapper.name, 'w') do |f|
							f.write(stream_wrapper.stream)
						end
					elsif response_handler.is_a? ZOHOCRMSDK::DownloadInlineImages::APIException
						exception = response_handler
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
				module_1 = "leads"
				record_id = 4402480774074
				user_id = 4402480254001
				id = "645baab5ea43dd528292d648b400db2c36658d5845edad86fda3ac084b6a2f91823f8f602de784c26c619667564d7d1017304deeb964d78a3321"
				message_id = "c6085fae06cbd7b75001fefab46bf0f413bb368a1d6902b140927cfe9e18"
				destination_folder = "/users/zohocrm-java-sdk-sample/file"
				get_download_inline_images(module_1, record_id, user_id, message_id, id, destination_folder)
			rescue Exception => e
				raise e
			end
		end
end
GetDownloadInlineImages.initialize_and_call