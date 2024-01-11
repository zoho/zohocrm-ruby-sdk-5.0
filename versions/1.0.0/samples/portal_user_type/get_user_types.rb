require "ZOHOCRMSDK5_0"

class GetUserTypes
		def self.get_user_types(portal_name)
			user_type_operations =  ZOHOCRMSDK::PortalUserType::PortalUserTypeOperations.new(portal_name)
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			response = user_type_operations.get_user_types(param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::PortalUserType::ResponseWrapper
						response_wrapper = response_handler
						user_type= response_wrapper.user_type
						user_type.each do |user_type1|
							print "user_type CreatedTime: " + user_type1.created_time.to_s + "\n"
							print "user_type Default: " + user_type1.default.to_s + "\n"
							print "user_type ModifiedTime: " + user_type1.modified_time.to_s + "\n"
							personality_module = user_type1.personality_module
							if personality_module != nil
								print "user_type PersonalityModule ID: " + personality_module.id.to_s + "\n"
								print "user_type PersonalityModule APIName: " + personality_module.api_name.to_s + "\n"
								print "user_type PersonalityModule PluralLabel: " + personality_module.plural_label.to_s + "\n"
							end
							print "user_type Name: " + user_type1.name.to_s + "\n"
							modified_by = user_type1.modified_by
							if modified_by != nil
								print "user_type ModifiedBy User-ID: " + modified_by.id.to_s + "\n"
								print "user_type ModifiedBy User-Name: " + modified_by.name.to_s + "\n"
							end
							print "user_type Active: " + user_type1.active.to_s + "\n"
							print "user_type Id: " + user_type1.id.to_s + "\n"
							created_by = user_type1.created_by
							if created_by != nil
								print "user_type CreatedBy User-ID: " + created_by.id.to_s + "\n"
								print "user_type CreatedBy User-Name: " + created_by.name.to_s + "\n"
							end
							print "user_type NoOfUsers: " + user_type1.no_of_users.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::PortalUserType::APIException
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
				portal_name = "portals_ap_itest100"
				get_user_types(portal_name)
			rescue Exception => e
				raise e
			end
		end
end
GetUserTypes.initialize_and_call
