require "ZOHOCRMSDK5_0"

class AssociatedUserCount
		def self.get_associated_usercount
			territories_operations =  ZOHOCRMSDK::Territories::TerritoriesOperations.new
			response = territories_operations.get_associated_user_count
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Territories::AssociatedUsersCountWrapper
						response_wrapper = response_handler
						territory_list= response_wrapper.associated_users_count
						territory_list.each do |territorycount|
							print "associated_users_count count: " + territorycount.count.to_s + "\n"
							territory = territorycount.territory
							if territory != nil
								print "associated_users_count Name" + territory.name.to_s + "\n"
								print "associated_users_count ID" + territory.id.to_s + "\n"
								print "associated_users_count Subordinates" + territory.subordinates.to_s + "\n"
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
					elsif response_handler.is_a? ZOHOCRMSDK::Territories::APIException
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
				get_associated_usercount
			rescue Exception => e
				raise e
			end
		end
end
AssociatedUserCount.initialize_and_call