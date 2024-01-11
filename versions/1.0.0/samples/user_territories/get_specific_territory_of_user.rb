require "ZOHOCRMSDK5_0"

class GetSpecificTerritoryOfUser
		def self.get_specific_territory_of_user(user_id, territory_id)
			users_territories_operations =  ZOHOCRMSDK::UsersTerritories::UsersTerritoriesOperations.new
			response = users_territories_operations.get_territory_of_user(territory_id, user_id)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::UsersTerritories::ResponseWrapper
						response_wrapper = response_handler
						users_territory= response_wrapper.territories
						users_territory.each do |territory|
							print "user Territory ID: " + territory.id.to_s + "\n"
							manager = territory.manager
							if manager != nil
								print "user Territory Manager Name: " + manager.name.to_s + "\n"
								print "user Territory Manager ID: " + manager.id.to_s + "\n"
							end
							reporting_to = territory.reporting_to
							if reporting_to != nil
								print "user Territory ReportingTo Name: " + reporting_to.name.to_s + "\n"
								print "user Territory ReportingTo ID: " + reporting_to.id.to_s + "\n"
							end
							print "user Territory Name: " + territory.name.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::UsersTerritories::APIException
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
				territory_id = 440248001305235
				get_specific_territory_of_user(user_id, territory_id)
			rescue Exception => e
				raise e
			end
		end
end
GetSpecificTerritoryOfUser.initialize_and_call