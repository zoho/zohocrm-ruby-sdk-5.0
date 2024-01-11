require "ZOHOCRMSDK5_0"

class GetProfiles
		def self.get_profiles
			profiles_operations =  ZOHOCRMSDK::Profiles::ProfilesOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			response = profiles_operations.get_profiles(param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Profiles::ProfileWrapper
						response_wrapper = response_handler
						profiles= response_wrapper.profiles
						profiles.each do |profile|
							print "profile DisplayLabel: " + profile.display_label.to_s + "\n"
							if profile.created_time != nil
								print "profile CreatedTime: " + profile.created_time.to_s + "\n"
							end
							if profile.modified_time != nil
								print "profile ModifiedTime: " + profile.modified_time.to_s + "\n"
							end
							default_view = profile.defaultview
							if default_view != nil
								print "default view Name : " + default_view.name.to_s + "\n"
								print "default view id : " + default_view.id.to_s + "\n"
								print "default view type : " + default_view.type.to_s + "\n"
							end
							print "profile Name: " + profile.name.to_s + "\n"
							print "is custom profile?  " + profile.custom.to_s + "\n"
							print "is deleted profile?  " + profile.delete.to_s + "\n"
							print "permission type   " + profile.permission_type.to_s + "\n"
							modified_by= profile.modified_by
							if modified_by != nil
								print "profile Modified By User-ID: " + modified_by.id.to_s + "\n"
								print "profile Modified By User-Name: " + modified_by.name.to_s + "\n"
								print "profile Modified By User-Email: " + modified_by.email.to_s + "\n"
							end
							print "profile Description: " + profile.description.to_s + "\n"
							print "profile ID: " + profile.id.to_s + "\n"
							created_by= profile.created_by
							if created_by != nil
								print "profile Created By User-ID: " + created_by.id.to_s + "\n"
								print "profile Created By User-Name: " + created_by.name.to_s + "\n"
								print "profile Created By User-Email: " + created_by.email.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Profiles::APIException
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
				get_profiles
			rescue Exception => e
				raise e
			end
		end
end
GetProfiles.initialize_and_call