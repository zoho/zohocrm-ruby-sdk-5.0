require "ZOHOCRMSDK5_0"

class GetRole
		def self.get_role(role_id)
			roles_operations =  ZOHOCRMSDK::Roles::RolesOperations.new
			response = roles_operations.get_role(role_id)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Roles::ResponseWrapper
						response_wrapper = response_handler
						roles= response_wrapper.roles
						roles.each do |role|
							print "role DisplayLabel: " + role.display_label.to_s + "\n"
							forecast_manager = role.forecast_manager
							if forecast_manager != nil
								print "role Forecast Manager User-ID: " + forecast_manager.id.to_s + "\n"
								print "role Forecast Manager User-Name: " + forecast_manager.name.to_s + "\n"
							end
							print "role ShareWithPeers: " + role.share_with_peers.to_s + "\n"
							print "role Name: " + role.name.to_s + "\n"
							print "role Description: " + role.description.to_s + "\n"
							print "role ID: " + role.id.to_s + "\n"
							reporting_to = role.reporting_to
							if reporting_to != nil
								print "role ReportingTo User-ID: " + reporting_to.id.to_s + "\n"
								print "role ReportingTo User-Name: " + reporting_to.name.to_s + "\n"
							end
							print "role AdminUser: " + role.admin_user.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Roles::APIException
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
				role_id = 4402480031151
				get_role(role_id)
			rescue Exception => e
				raise e
			end
		end
end
GetRole.initialize_and_call