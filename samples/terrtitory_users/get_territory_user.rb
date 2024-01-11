require "ZOHOCRMSDK5_0"

	 
class GetTerritoryUser
		def self.get_territory_user(user, territory)
			territory_users_operations =  ZOHOCRMSDK::TerritoryUsers::TerritoryUsersOperations.new
			response = territory_users_operations.get_territory_user(user, territory)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::TerritoryUsers::ResponseWrapper
						response_wrapper =response_handler
						users= response_wrapper.users
						if users != nil
							users.each do |user1|
								print "territory User ID : " + user1.id.to_s + "\n"
							end
						end
						info = response_wrapper.info
						if info != nil
							if info.per_page != nil
								print "territory Info PerPage: " + info.per_page.to_s + "\n"
							end
							if info.count != nil
								print "territory Info Count: " + info.count.to_s + "\n"
							end
							if info.page != nil
								print "territory Info Page: " + info.page.to_s + "\n"
							end
							if info.more_records != nil
								print "territory Info MoreRecords: " + info.more_records.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::TerritoryUsers::APIException
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
				territory = 440248001305227
				user = 4402480254001
				get_territory_user(user, territory)
			rescue Exception => e
				raise e
			end
		end
end
GetTerritoryUser.initialize_and_call