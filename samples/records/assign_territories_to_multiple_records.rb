require "ZOHOCRMSDK5_0"

class AssignTerritoriesToMultipleRecords
	def self.assign_territories_to_multiple_records(module_api_name)
		record_operations =  ZOHOCRMSDK::Record::RecordOperations.new
		request =  ZOHOCRMSDK::Record::BodyWrapper.new
		records=[]
		record1= ZOHOCRMSDK::Record::Record.new
		record1.id = 347706112107002
		territory =  ZOHOCRMSDK::Record::Territory.new
		territory.id = 34770613051397
		record1.add_key_value("territories",  [territory])
		records.push(record1)
		request.data = records
		response = record_operations.assign_territories_to_multiple_records(module_api_name, request)
		if response != nil
			print "status Code: " + response.status_code.to_s + "\n"
			if response.is_expected
				action_handler = response.data_object
				if action_handler.is_a? ZOHOCRMSDK::Record::ActionWrapper
					action_wrapper = action_handler
					action_responses= action_wrapper.data
					action_responses.each do |action_response|
						if action_response.is_a? ZOHOCRMSDK::Record::SuccessResponse
							success_response = action_response
							print "status: " + success_response.status.value.to_s + "\n"
							print "code: " + success_response.code.value.to_s + "\n"
							print "details: ".to_s + "\n"
							success_response.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
							print "message: " + success_response.message.value.to_s + "\n"
						elsif action_response.is_a? ZOHOCRMSDK::Record::APIException
							exception = action_response
							print "status: " + exception.status.value.to_s + "\n"
							print "code: " + exception.code.value.to_s + "\n"
							print "details: ".to_s + "\n"
							exception.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
							print "message: " + exception.message.value.to_s + "\n"
						end
					end
				elsif action_handler.is_a? ZOHOCRMSDK::Record::APIException
					exception = action_handler
					print "status: " + exception.status.value.to_s + "\n"
					print "code: " + exception.code.value.to_s + "\n"
					print "details: ".to_s + "\n"
					exception.details.each do |k, v|
						print k + ": " + v.to_s + "\n"
					end
					print "message: " + exception.message.value.to_s + "\n"
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
			module_api_name = "leads"
			assign_territories_to_multiple_records(module_api_name)
		rescue Exception => e
			raise e
		end
	end
end
AssignTerritoriesToMultipleRecords.initialize_and_call
