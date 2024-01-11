require "ZOHOCRMSDK5_0"

class GetEmailAddresses
		def self.get_email_addresses
			send_mails_operations =  ZOHOCRMSDK::FromAddresses::FromAddressesOperations.new
			response = send_mails_operations.get_from_addresses
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::FromAddresses::ResponseWrapper
						response_wrapper = response_handler
						user_addresses= response_wrapper.from_addresses
						user_addresses.each do |user_address|
							print "user_adress Email: " + user_address.email.to_s + "\n"
							print "user_adress Type: " + user_address.type.to_s + "\n"
							print "user_adress UserName: " + user_address.user_name.to_s + "\n"
							print "user_adress Default: " + user_address.default.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::FromAddresses::APIException
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
				get_email_addresses
			rescue Exception => e
				raise e
			end
		end
end
GetEmailAddresses.initialize_and_call