require "ZOHOCRMSDK5_0"

class UpdateTerritory
		def self.update_territory(id)
			territories_operations =  ZOHOCRMSDK::Territories::TerritoriesOperations.new
			request =  ZOHOCRMSDK::Territories::BodyWrapper.new
			territories=[]
			territory =  ZOHOCRMSDK::Territories::Territories.new
			territory.id = 32133234546765
			territory.name="territoryName"
			criteria =  ZOHOCRMSDK::Territories::Criteria.new
			criteria.comparator="equal"
			criteria.value="3"
			field =  ZOHOCRMSDK::Territories::Field.new
			field.api_name="Account_Name"
			field.id = 32321323411
			criteria.field = field
			territory.account_rule_criteria = criteria
			criteria1 =  ZOHOCRMSDK::Territories::Criteria.new
			criteria1.comparator="not_between"
			value=[]
			value.push("2023-08-10")
			value.push("2023-08-30")
			criteria1.value = value
			field1 =  ZOHOCRMSDK::Territories::Field.new
			field1.api_name="Closing_Date"
			field1.id = 323213231223411
			criteria1.field = field1
			territory.deal_rule_criteria = criteria1
			territory.description="description"
			territory.permission_type =  ZOHOCRMSDK::Util::Choice.new("read_only")
			reporting_to =  ZOHOCRMSDK::Territories::ReportingTo.new
			reporting_to.id = 312324234312
			territory.reporting_to = reporting_to
			manager =  ZOHOCRMSDK::Territories::Manager.new
			manager.id = 324234564533
			territory.manager = manager
			territories.push(territory)
			request.territories = territories
			response = territories_operations.update_territory(id, request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::Territories::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.territories
						if action_responses != nil
							action_responses.each do |action_response|
								if action_response.is_a? ZOHOCRMSDK::Territories::SuccessResponse
									success_response = action_response
									print "status: " + success_response.status.value.to_s + "\n"
									print "code: " + success_response.code.value.to_s + "\n"
									print "details: ".to_s + "\n"
									success_response.details.each do |k, v|
										print k + ": " + v.to_s + "\n"
									end
									print "message: " + success_response.message.to_s + "\n"
								elsif action_response.is_a? ZOHOCRMSDK::Territories::APIException
									exception = action_response
									print "status: " + exception.status.value.to_s + "\n"
									print "code: " + exception.code.value.to_s + "\n"
									print "details: ".to_s + "\n"
									exception.details.each do |k, v|
										print k + ": " + v.to_s + "\n"
									end
									print "message: " + exception.message.to_s + "\n"
								end
							end
						end
					elsif action_handler.is_a? ZOHOCRMSDK::Territories::APIException
						exception = action_handler
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
				id = 3242343241
				update_territory(id)
			rescue Exception => e
				raise e
			end
		end
end
UpdateTerritory.initialize_and_call