require "ZOHOCRMSDK5_0"

class GetGroup
		def self.get_group(group_id)
			user_groups_operations =  ZOHOCRMSDK::UserGroups::UserGroupsOperations.new
			response = user_groups_operations.get_group(group_id)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::UserGroups::ResponseWrapper
						response_wrapper = response_handler
						users= response_wrapper.user_groups
						users.each do |user|
							created_by = user.created_by
							if created_by != nil
								print "user_groups Created By User-Name: " + created_by.name.to_s + "\n"
								print "user_groups Created By User-ID: " + created_by.id.to_s + "\n"
							end
							modified_by = user.modified_by
							if modified_by != nil
								print "user_groups Modified By User-Name: " + modified_by.name.to_s + "\n"
								print "user_groups Modified By User-ID: " + modified_by.id.to_s + "\n"
							end
							print "user ModifiedTime: " + user.modified_time.to_s + "\n"
							print "user CreatedTime: " + user.created_time.to_s + "\n"
							print "user_groups Description: " + user.description.to_s + "\n"
							print "user_groups Id: " + user.id.to_s + "\n"
							print "user_groups Name: " + user.name.to_s + "\n"
							sources= user.sources
							if sources != nil
								sources.each do |source |
									print "user_groups Sources Type: " + source.type.value.to_s + "\n"
									source1 = source.source
									if source1 != nil
										print "user_groups Sources Id: " + source1.id.to_s + "\n"
									end
									print "user_groups Sources Subordinates: " + source.subordinates.to_s + "\n"
									print "user_groups Sources SubTerritories: " + source.sub_territories.to_s + "\n"
								end
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
				group_id = 440248001307102
				get_group(group_id)
			rescue Exception => e
				raise e
			end
		end
end
GetGroup.initialize_and_call