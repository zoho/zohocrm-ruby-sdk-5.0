require "ZOHOCRMSDK5_0"

class GetEmailSharingDetails
		def self.get_email_sharing_details(record_id, module_1)
			emailsharingoperations =  ZOHOCRMSDK::EmailSharing::EmailSharingOperations.new(record_id, module_1)
			response = emailsharingoperations.get_email_sharing_details
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::EmailSharing::ResponseWrapper
						response_wrapper = response_handler
						email_sharingdetails= response_wrapper.emailssharingdetails
						if email_sharingdetails != nil
							email_sharingdetails.each do |getemailsharing|
								print "email__sharing__details : ".to_s + "\n"
								sharefrom_users= getemailsharing.share_from_users
								if sharefrom_users != nil
									print "share_from_users : ".to_s + "\n"
									sharefrom_users.each do |sharefromuser|
										print "id : " + sharefromuser.id.to_s + "\n"
										print "name : " + sharefromuser.name.to_s + "\n"
										print "type : " + sharefromuser.type.to_s + "\n"
									end
								end
								available_types= getemailsharing.available_types
								if available_types != nil
									print "available_types : ".to_s + "\n"
									available_types.each do |availabletype|
										print availabletype.to_s + "\n"
									end
								end
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::EmailSharing::APIException
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
				get_email_sharing_details(record_id, module_1)
			rescue Exception => e
				raise e
			end
		end
end
GetEmailSharingDetails.initialize_and_call