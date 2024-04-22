require "ZOHOCRMSDK5_0"

class GetUserType
		def self.get_user_type(portal_name, user_type_id)
			user_type_operations =  ZOHOCRMSDK::PortalUserType::PortalUserTypeOperations.new(portal_name)
			response = user_type_operations.get_user_type(user_type_id)
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
							print "user_type Default: " + user_type1.default.to_s + "\n"
							personality_module = user_type1.personality_module
							if personality_module != nil
								print "user_type PersonalityModule ID: " + personality_module.id.to_s + "\n"
								print "user_type PersonalityModule APIName: " + personality_module.api_name.to_s + "\n"
								print "user_type PersonalityModule PluralLabel: " + personality_module.plural_label.to_s + "\n"
							end
							print "user_type Name: " + user_type1.name.to_s + "\n"
							print "user_type Active: " + user_type1.active.to_s + "\n"
							print "user_type Id: " + user_type1.id.to_s + "\n"
							print "user_type NoOfUsers: " + user_type1.no_of_users.to_s + "\n"
							modules= user_type1.modules
							if modules != nil
								modules.each do |module_1 |
									print "user_type Modules PluralLabel: " + module_1.plural_label.to_s + "\n"
									print "user_type Modules SharedType: " + module_1.shared_type.value.to_s + "\n"
									print "user_type Modules APIName: " + module_1.api_name.to_s + "\n"
									permissions = module_1.permissions
									if permissions != nil
										print "user_type Modules Permissions View: " + permissions.view.to_s + "\n"
										print "user_type Modules Permissions Edit: " + permissions.edit.to_s + "\n"
										print "user_type Modules Permissions EditSharedRecords: " + permissions.edit_shared_records.to_s + "\n"
										print "user_type Modules Permissions Create: " + permissions.create.to_s + "\n"
										print "user_type Modules Permissions Delete: " + permissions.delete.to_s + "\n"
									end
									print "user_type Modules Id: " + module_1.id.to_s + "\n"
									filters= module_1.filters
									if filters != nil
										filters.each do |filter |
											print "user_type Modules Filters APIName: " + filter.api_name.to_s + "\n"
											print "user_type Modules Filters DisplayLabel: " + filter.display_label.to_s + "\n"
											print "user_type Modules Filters Id: " + filter.id.to_s + "\n"
										end
									end
									fields= module_1.fields
									if fields != nil
										fields.each do |field |
											print "user_type Modules Fields APIName: " + field.api_name.to_s + "\n"
											print "user_type Modules Fields ReadOnly: " + field.read_only.to_s + "\n"
											print "user_type Modules Fields Id: " + field.id.to_s + "\n"
										end
									end
									layouts= module_1.layouts
									if layouts != nil
										layouts.each do |layout |
											print "user_type Modules Layouts Name: " + layout.name.to_s + "\n"
											print "user_type Modules Layouts DisplayLabel: " + layout.display_label.to_s + "\n"
											print "user_type Modules Layouts Id: " + layout.id.to_s + "\n"
										end
									end
									views = module_1.views
									if views != nil
										print "user_type Modules Views DisplayLabel: " + views.display_label.to_s + "\n"
										print "user_type Modules Views Name: " + views.name.to_s + "\n"
										print "user_type Modules Views Id: " + views.id.to_s + "\n"
										print "user_type Modules Permissions Type: " + views.type.to_s + "\n"
									end
								end
							end
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
				user_type_id = "440248001304019"
				get_user_type(portal_name, user_type_id)
			rescue Exception => e
				raise e
			end
		end
end
GetUserType.initialize_and_call