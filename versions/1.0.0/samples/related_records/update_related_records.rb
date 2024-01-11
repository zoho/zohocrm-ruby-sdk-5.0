require "ZOHOCRMSDK5_0"

class UpdateRelatedRecords
		def self.update_related_records(module_api_name, record_id, related_list_api_name)
			related_records_operations =  ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name, null)
			request =  ZOHOCRMSDK::RelatedRecords::BodyWrapper.new
			records=[]
			record1=ZOHOCRMSDK::Record::Record.new
		 # Call addKeyValue method that takes two arguments 1 -> A string that is the Field's API Name 2 -> Value
			record1.add_key_value("id", 4402481055023)
			record1.add_key_value("list_price", 50.56)
			records.push(record1)
			# record2=ZOHOCRMSDK::Record::Record.new
			# Call addKeyValue method that takes two arguments 1 -> A string that is the Field's API Name 2 -> Value
			#		record2.add_key_value("id", 347706110697001)
			#		record2.add_key_value("list_price", 50.56)
			#		records.push(record2)
			request.data = records
			response = related_records_operations.update_related_records(record_id, request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::RelatedRecords::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.data
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::RelatedRecords::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.value.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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
					elsif action_handler.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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
				record_id = 440248774074
				related_list_api_name = "notes"
				update_related_records(module_api_name, record_id, related_list_api_name)
			rescue Exception => e
				raise e
			end
		end
end
UpdateRelatedRecords.initialize_and_call