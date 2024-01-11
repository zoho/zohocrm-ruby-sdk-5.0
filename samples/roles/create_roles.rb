require "ZOHOCRMSDK5_0"

class CreateRoles
		def self.create_roles
			roles_operations =  ZOHOCRMSDK::Roles::RolesOperations.new
			body_wrapper =  ZOHOCRMSDK::Roles::BodyWrapper.new
			roles=[]
			role=ZOHOCRMSDK::Roles::Role.new
			role.name="SDK Manager"
			reporting_to =  ZOHOCRMSDK::Roles::ReportingTo.new
			reporting_to.id = 4402480254001
			role.reporting_to = reporting_to
			role.description="Schedule and manage resources"
	#		role.share_with_peers = true
			roles.push(role)
			body_wrapper.roles = roles
			response = roles_operations.create_roles(body_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::Roles::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.roles
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::Roles::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::Roles::APIException
								exception = action_response
								print "status: " + exception.status.value.to_s + "\n"
								print "code: " + exception.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								exception.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + exception.message.to_s + "\n"
							end
						end
					elsif action_handler.is_a? ZOHOCRMSDK::Roles::APIException
						exception = action_handler
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
				create_roles
			rescue Exception => e
				raise e
			end
		end
end
CreateRoles.initialize_and_call