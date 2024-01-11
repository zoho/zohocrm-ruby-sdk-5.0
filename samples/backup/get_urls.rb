require "ZOHOCRMSDK5_0"

class GetUrls
		def self.get_urls
			backup_operations =  ZOHOCRMSDK::Backup::BackupOperations.new
			response = backup_operations.get_urls
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Backup::UrlsWrapper
						response_wrapper = response_handler
						urls = response_wrapper.urls
						if urls != nil
							data_links= urls.data_links
							if data_links != nil
								print "urls DataLinks: ".to_s + "\n"
								data_links.each do |url |
									print url.to_s + "\n"
								end
							end
							attachment_links= urls.attachment_links
							if attachment_links != nil
								print "urls AttachmentLinks: ".to_s + "\n"
								attachment_links.each do |url |
									print url.to_s + "\n"
								end
							end
							print "urls ExpiryDate: " + urls.expiry_date.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Backup::APIException
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
				get_urls
			rescue Exception => e
				raise e
			end
		end
end
GetUrls.initialize_and_call
