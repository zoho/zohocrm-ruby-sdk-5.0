require "ZOHOCRMSDK5_0"

class DeleteOrganizationPhoto
		def self.delete_organization_photo
			org_operations =  ZOHOCRMSDK::Org::OrgOperations.new
			response = org_operations.delete_organization_photo
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_response = response.data_object
					if action_response.is_a? ZOHOCRMSDK::Org::SuccessResponse
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
					elsif action_response.is_a? ZOHOCRMSDK::Org::APIException
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
				delete_organization_photo
			rescue Exception => e
				raise e
			end
		end
end
DeleteOrganizationPhoto.initialize_and_call