require "ZOHOCRMSDK5_0"

class GetSourcesCount
		def self.get_sources_count(group_id)
			user_groups_operations =  ZOHOCRMSDK::UserGroups::UserGroupsOperations.new
			response = user_groups_operations.get_sources_count(group_id)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::UserGroups::SourcesCountWrapper
						response_wrapper = response_handler
						sources_count= response_wrapper.sources_count
						sources_count.each do |count|
							print "sources Count Territories: " + count.territories.to_s + "\n"
							print "sources Count Roles: " + count.roles.to_s + "\n"
							print "sources Count Groups: " + count.groups.to_s + "\n"
							users = count.users
							if users != nil
								print "sources Users Inactive: " + users.inactive.to_s + "\n"
								print "sources Users Deleted: " + users.deleted.to_s + "\n"
								print "sources Users Groups: " + users.active.to_s + "\n"
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
				group_id = 347706117236002
				get_sources_count(group_id)
			rescue Exception => e
				raise e
			end
		end
end
GetSourcesCount.initialize_and_call