require "ZOHOCRMSDK5_0"

class GetUser
		def self.get_user(user_id)
			users_operations =  ZOHOCRMSDK::Users::UsersOperations.new
			header_instance =  ZOHOCRMSDK::HeaderMap.new
			ifmodifiedsince = DateTime.new(2019, 01, 02, 10, 00, 01, "+05:30")
			header_instance.add(ZOHOCRMSDK::Users::UsersOperations::GetUsersHeader.If_modified_since, ifmodifiedsince)
			response = users_operations.get_user(user_id, header_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Users::ResponseWrapper
						response_wrapper = response_handler
						users= response_wrapper.users
						users.each do |user|
							print "user Country: " + user.country.to_s + "\n"
							customize_info = user.customize_info
							if customize_info != nil
								if customize_info.notes_desc != nil
									print "user CustomizeInfo NotesDesc: " + customize_info.notes_desc.to_s + "\n"
								end
								if customize_info.show_right_panel != nil
									print "user CustomizeInfo ShowRightPanel: " + customize_info.show_right_panel.to_s + "\n"
								end
								if customize_info.bc_view != nil
									print "user CustomizeInfo BcView: " + customize_info.bc_view.to_s + "\n"
								end
								if customize_info.show_home != nil
									print "user CustomizeInfo ShowHome: " + customize_info.show_home.to_s + "\n"
								end
								if customize_info.show_detail_view != nil
									print "user CustomizeInfo ShowDetailView: " + customize_info.show_detail_view.to_s + "\n"
								end
								if customize_info.unpin_recent_item != nil
									print "user CustomizeInfo UnpinRecentItem: " + customize_info.unpin_recent_item.to_s + "\n"
								end
							end
							role = user.role
							if role != nil
								print "user Role Name: " + role.name.to_s + "\n"
								print "user Role ID: " + role.id.to_s + "\n"
							end
							print "user Signature: " + user.signature.to_s + "\n"
							print "user SortOrderPreference: " + user.sort_order_preference.to_s + "\n"
							print "user City: " + user.city.to_s + "\n"
							print "user Isonline: " + user.isonline.to_s + "\n"
							print "user SandboxDeveloper: " + user.sandboxdeveloper.to_s + "\n"
							print "user Zip: " + user.zip.to_s + "\n"
							print "user NameFormat: " + user.name_format__s.to_s + "\n"
							print "user Language: " + user.language.to_s + "\n"
							print "user Locale: " + user.locale.to_s + "\n"
							print "user Microsoft: " + user.microsoft.to_s + "\n"
							if user.personal_account != nil
								print "user PersonalAccount: " + user.personal_account.to_s + "\n"
							end
							print "user DefaultTabGroup: " + user.default_tab_group.to_s + "\n"
							print "user Isonline: " + user.isonline.to_s + "\n"
							modified_by= user.modified_by
							if modified_by != nil
								print "user Modified By User-Name: " + modified_by.name.to_s + "\n"
								print "user Modified By User-ID: " + modified_by.id.to_s + "\n"
							end
							print "user Street: " + user.street.to_s + "\n"
							print "user Currency: " + user.currency.to_s + "\n"
							print "user Alias: " + user.alias.to_s + "\n"
							theme = user.theme
							if theme != nil
								normal_tab = theme.normal_tab
								if normal_tab != nil
									print "user Theme NormalTab FontColor: " + normal_tab.font_color.to_s + "\n"
									print "user Theme NormalTab Name: " + normal_tab.background.to_s + "\n"
								end
								selected_tab = theme.selected_tab
								if selected_tab != nil
									print "user Theme SelectedTab FontColor: " + selected_tab.font_color.to_s + "\n"
									print "user Theme SelectedTab Name: " + selected_tab.background.to_s + "\n"
								end
								print "user Theme NewBackground: " + theme.new_background.to_s + "\n"
								print "user Theme Background: " + theme.background.to_s + "\n"
								print "user Theme Screen: " + theme.screen.to_s + "\n"
								print "user Theme Type: " + theme.type.to_s + "\n"
							end
							print "user ID: " + user.id.to_s + "\n"
							print "user State: " + user.state.to_s + "\n"
							print "user Fax: " + user.fax.to_s + "\n"
							print "user CountryLocale: " + user.country_locale.to_s + "\n"
							print "user FirstName: " + user.first_name.to_s + "\n"
							print "user Email: " + user.email.to_s + "\n"
							reporting_to= user.reporting_to
							if reporting_to != nil
								print "user ReportingTo Name: " + reporting_to.name.to_s + "\n"
								print "user ReportingTo ID: " + reporting_to.id.to_s + "\n"
							end
							print "user DecimalSeparator: " + user.decimal_separator.to_s + "\n"
							print "user Zip: " + user.zip.to_s + "\n"
							print "user CreatedTime: " + user.created_time.to_s + "\n"
							print "user Website: " + user.website.to_s + "\n"
							print "user ModifiedTime: " + user.modified_time.to_s + "\n"
							print "user TimeFormat: " + user.time_format.to_s + "\n"
							print "user Offset: " + user.offset.to_s + "\n"
							profile = user.profile
							if profile != nil
								print "user Profile Name: " + profile.name.to_s + "\n"
								print "user Profile ID: " + profile.id.to_s + "\n"
							end
							print "user Mobile: " + user.mobile.to_s + "\n"
							print "user LastName: " + user.last_name.to_s + "\n"
							print "user TimeZone: " + user.time_zone.to_s + "\n"
							created_by= user.created_by
							if created_by != nil
								print "user Created By User-Name: " + created_by.name.to_s + "\n"
								print "user Created By User-ID: " + created_by.id.to_s + "\n"
							end
							print "user Zuid: " + user.zuid.to_s + "\n"
							print "user Confirm: " + user.confirm.to_s + "\n"
							print "user FullName: " + user.full_name.to_s + "\n"
							print "user Phone: " + user.phone.to_s + "\n"
							print "user DOB: " + user.dob.to_s + "\n"
							print "user DateFormat: " + user.date_format.to_s + "\n"
							print "user Status: " + user.status.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Users::APIException
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
				user_id = 440248254001
				get_user(user_id)
			rescue Exception => e
				raise e
			end
		end
end
GetUser.initialize_and_call