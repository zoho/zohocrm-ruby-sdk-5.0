require "ZOHOCRMSDK5_0"

class ValidateBeforeTransfer
		def self.validate_before_transfer(user_id, territory_id)
			users_territories_operations =  ZOHOCRMSDK::UsersTerritories::UsersTerritoriesOperations.new
			response = users_territories_operations.validate_before_transfer(territory_id, user_id)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::UsersTerritories::ValidationWrapper
						response_wrapper = response_handler
						users_territory= response_wrapper.validate_before_transfer
						users_territory.each do |validation_group|
							if validation_group.is_a? ZOHOCRMSDK::UsersTerritories::BulkValidation
								validation = validation_group
								print "user Territory Validation Alert : " + validation.alert.to_s + "\n"
								print "user Territory Validation Assignment : " + validation.assignment.to_s + "\n"
								print "user Territory Validation Criteria : " + validation.criteria.to_s + "\n"
								print "user Territory Validation Name : " + validation.name.to_s + "\n"
								print "user Territory Validation Id : " + validation.id.to_s + "\n"
							elsif validation_group.is_a? ZOHOCRMSDK::UsersTerritories::Validation
								validation = validation_group
								print "user Territory Validation Records : " + validation.records.to_s + "\n"
								print "user Territory Validation Name : " + validation.name.to_s + "\n"
								print "user Territory Validation Id : " + validation.id.to_s + "\n"
							end
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
				user_id = 34770611709
				territory_id = 34770613051397
				validate_before_transfer(user_id, territory_id)
			rescue Exception => e
				raise e
			end
		end
end
ValidateBeforeTransfer.initialize_and_call
