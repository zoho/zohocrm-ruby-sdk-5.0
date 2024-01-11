require "ZOHOCRMSDK5_0"

class GetProfile
		def self.get_profile(profile_id)
			profiles_operations =  ZOHOCRMSDK::Profiles::ProfilesOperations.new
			response = profiles_operations.get_profile(profile_id)
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
							print "is custom profile?  " + profile.custom.to_s + "\n"
							permissions_details= profile.permissions_details
							if permissions_details != nil
								permissions_details.each do |permissions_detail|
									print "profile PermissionDetail DisplayLabel: " + permissions_detail.display_label.to_s + "\n"
									print "profile PermissionDetail Module: " + permissions_detail.module.to_s + "\n"
									print "profile PermissionDetail Name: " + permissions_detail.name.to_s + "\n"
									print "profile PermissionDetail ID: " + permissions_detail.id.to_s + "\n"
									print "profile PermissionDetail Enabled: " + permissions_detail.enabled.to_s + "\n"
								end
							end
							default_view = profile.defaultview
							if default_view != nil
								print "default view Name : " + default_view.name.to_s + "\n"
								print "default view id : " + default_view.id.to_s + "\n"
								print "default view type : " + default_view.type.to_s + "\n"
							end
							print "permission type   " + profile.permission_type.to_s + "\n"
							print "profile Name: " + profile.name.to_s + "\n"
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
							sections= profile.sections
							if sections != nil
								sections.each do |section|
									print "profile Section Name: " + section.name.to_s + "\n"
									categories= section.categories
									categories.each do |category1|
										if category1.is_a? ZOHOCRMSDK::Profiles::CategoryOthers
											category = category1
											print "profile Section Category DisplayLabel: " + category.display_label.to_s + "\n"
											category_permissions_details= category.permissions_details
											if category_permissions_details != nil
												category_permissions_details.each do |permissions_detail_id|
													print "profile Section Category permissions_detail_id: " + permissions_detail_id.to_s + "\n"
												end
											end
											print "profile Section Category Name: " + category.name.to_s + "\n"
										elsif category1.is_a? ZOHOCRMSDK::Profiles::CategoryModule
											category = category1
											print "profile Section Category DisplayLabel: " + category.display_label.to_s + "\n"
											category_permissions_details= category.permissions_details
											if category_permissions_details != nil
												category_permissions_details.each do |permissions_detail_id|
													print "profile Section Category permissions_detail_id: " + permissions_detail_id.to_s + "\n"
												end
											end
											print "profile Section Category Module: " + category.module.to_s + "\n"
											print "profile Section Category Name: " + category.name.to_s + "\n"
										end
									end
								end
							end
							if profile.delete != nil
								print "profile Delete: " + profile.delete.to_s + "\n"
							end
							if profile.default != nil
								print "profile Default: " + profile.default.to_s + "\n"
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
				profile_id = 440248031157
				get_profile(profile_id)
			rescue Exception => e
				raise e
			end
		end
end
GetProfile.initialize_and_call