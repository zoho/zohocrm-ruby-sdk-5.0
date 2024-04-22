require "ZOHOCRMSDK5_0"

class UpsertRecords
		def self.upsert_records(module_api_name)
			record_operations =  ZOHOCRMSDK::Record::RecordOperations.new
			request =  ZOHOCRMSDK::Record::BodyWrapper.new
			records=[]
			record1=ZOHOCRMSDK::Record::Record.new
		 # Call addFieldValue method that takes two arguments 1 -> Call Field "." and choose the module_1 from the displayed list and press "." and choose the field name from the displayed list. 2 -> Value
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.City, "city")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Last_name, "last Name")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.First_name, "first Name")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Company, "company1")
		 # Call addKeyValue method that takes two arguments 1 -> A string that is the Field's API Name 2 -> Value
			record1.add_key_value("custom_field", "value")
			record1.add_key_value("custom_field_2", "value")
			# Add Record instance to the list
			records.push(record1)
			record2=ZOHOCRMSDK::Record::Record.new
		 # Call addFieldValue method that takes two arguments 1 -> Call Field "." and choose the module_1 from the displayed list and press "." and choose the field name from the displayed list. 2 -> Value
			record2.add_field_value(ZOHOCRMSDK::Record::Field::Leads.City, "city")
			record2.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Last_name, "last Name")
			record2.add_field_value(ZOHOCRMSDK::Record::Field::Leads.First_name, "first Name")
			record2.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Company, "company12")
		 # Call addKeyValue method that takes two arguments 1 -> A string that is the Field's API Name 2 -> Value
			record2.add_key_value("custom_field", "value")
			record2.add_key_value("custom_field_2", "value")
			# Add Record instance to the list
			records.push(record2)
			duplicate_check_fields= ["city", "first_name"]
			request.duplicate_check_fields = duplicate_check_fields
			request.data = records
			header_instance =  ZOHOCRMSDK::HeaderMap.new
			header_instance.add(ZOHOCRMSDK::Record::RecordOperations::UpsertRecordsHeader.X_external, "leads.External")
			response = record_operations.upsert_records(module_api_name, request, header_instance)
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
				upsert_records(module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
UpsertRecords.initialize_and_call
