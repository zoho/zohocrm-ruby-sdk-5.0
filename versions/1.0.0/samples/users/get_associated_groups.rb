require "ZOHOCRMSDK5_0"

class GetAssociatedGroups
		def self.get_associated_groups(user_id)
			users_operations =  ZOHOCRMSDK::Users::UsersOperations.new
			response = users_operations.get_associated_groups(user_id)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Users::AssociatedGroupsWrapper
						associated_groups_wrapper = response_handler
						user_groups= associated_groups_wrapper.user_groups
						if user_groups != nil
							user_groups.each do |user_group|
								print "associate_group ID : " + user_group.id.to_s + "\n"
								print "associate_group Name : " + user_group.name.to_s + "\n"
								print "associate_group Description : " + user_group.description.to_s + "\n"
								print "associate_group CreatedTime : " + user_group.created_time.to_s + "\n"
								print "associate_group ModifiedTime : " + user_group.modified_time.to_s + "\n"
								created_by = user_group.created_by
								if created_by != nil
									print "associate_group CreatedBy ID : " + created_by.id.to_s + "\n"
									print "associate_group CreatedBy Name : " + created_by.name.to_s + "\n"
									print "associate_group CreatedBy Email : " + created_by.email.to_s + "\n"
								end
								modified_by = user_group.modified_by
								if modified_by != nil
									print "associate_group modified_by ID : " + modified_by.id.to_s + "\n"
									print "associate_group modified_by Name : " + modified_by.name.to_s + "\n"
									print "associate_group modified_by Email : " + modified_by.email.to_s + "\n"
								end
							end
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
				user_id = 4402480254001
				get_associated_groups(user_id)
			rescue Exception => e
				raise e
			end
		end
end
GetAssociatedGroups.initialize_and_call