require "ZOHOCRMSDK5_0"

class GetAssociatedUsersCount
		def self.get_associated_users_count
			user_groups_operations =  ZOHOCRMSDK::UserGroups::UserGroupsOperations.new
			response = user_groups_operations.get_associated_users_count
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::UserGroups::AssociatedUserCount
						associated_users_count= response_handler.associated_users_count
						if associated_users_count != nil
							associated_users_count.each do |associated_user|
								print "associated_user count: " + associated_user.count.to_s + "\n"
								user_group = associated_user.user_group
								if user_group != nil
									print "associated_user Name: " + user_group.name.to_s + "\n"
									print "associated_user ID: " + user_group.id.to_s + "\n"
								end
							end
						end
						info = response_handler.info
						if info != nil
							if info.per_page != nil
								print "user Info PerPage: " + info.per_page.to_s + "\n"
							end
							if info.count != nil
								print "user Info Count: " + info.count.to_s + "\n"
							end
							if info.page != nil
								print "user Info Page: " + info.page.to_s + "\n"
							end
							if info.more_records != nil
								print "user Info MoreRecords: " + info.more_records.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::UserGroups::APIException
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
				get_associated_users_count
			rescue Exception => e
				raise e
			end
		end
end
GetAssociatedUsersCount.initialize_and_call