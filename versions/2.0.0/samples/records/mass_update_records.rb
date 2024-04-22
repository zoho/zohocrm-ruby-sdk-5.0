require "ZOHOCRMSDK5_0"

class MassUpdateRecords
		def self.mass_update_records(module_api_name)
			record_operations =  ZOHOCRMSDK::Record::RecordOperations.new
			request =  ZOHOCRMSDK::Record::MassUpdateBodyWrapper.new
			records=[]
			record1=ZOHOCRMSDK::Record::Record.new
			# Call addKeyValue method that takes two arguments 1 -> A string that is the Field's API Name 2 -> Value
			record1.add_key_value("city", "value")
			#		record1.add_key_value("company", "value")
			records.push(record1)
			request.data = records
			request.cvid="3477061087501"
			ids= ["34770615922192"]
			request.ids = ids
			# territory =  ZOHOCRMSDK::Record::Territory.new
			#	territory.id=""
			#	territory.include_child = true
			#	request.territory = territory
			request.over_write = true
			response = record_operations.mass_update_records(module_api_name, request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					mass_update_action_handler = response.data_object
					if mass_update_action_handler.is_a? ZOHOCRMSDK::Record::MassUpdateActionWrapper
						mass_update_action_wrapper = mass_update_action_handler
						mass_update_action_responses= mass_update_action_wrapper.data
						mass_update_action_responses.each do |mass_update_action_response|
							if mass_update_action_response.is_a? ZOHOCRMSDK::Record::MassUpdateSuccessResponse
								mass_update_success_response = mass_update_action_response
								print "status: " + mass_update_success_response.status.value.to_s + "\n"
								print "code: " + mass_update_success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								mass_update_success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + mass_update_success_response.message.value.to_s + "\n"
							elsif mass_update_action_response.is_a? ZOHOCRMSDK::Record::APIException
								exception = mass_update_action_response
								print "status: " + exception.status.value.to_s + "\n"
								print "code: " + exception.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								exception.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + exception.message.value.to_s + "\n"
							end
						end
					elsif mass_update_action_handler.is_a? ZOHOCRMSDK::Record::APIException
						exception = mass_update_action_handler
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
				mass_update_records(module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
MassUpdateRecords.initialize_and_call