require "ZOHOCRMSDK5_0"

class UpdateRelatedRecordUsingExternalId
		def self.update_related_record_using_external_id(module_api_name, external_value, related_list_api_name, external_field_value)
			x_external = "leads.External,Products.Products_External"
			related_records_operations =  ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name, x_external)
			request =  ZOHOCRMSDK::RelatedRecords::BodyWrapper.new
			records=[]
			record1=ZOHOCRMSDK::Record::Record.new
		 # Call addKeyValue method that takes two arguments 1 -> A string that is the Field's API Name 2 -> Value
			record1.add_key_value("list_price", 50.56)
			records.push(record1)
			request.data = records
			response = related_records_operations.update_related_record_using_external_id(external_field_value, external_value, request)
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
				external_value = "34770615177002"
				related_list_api_name = "products"
				external_field_value = "34770614994115"
				update_related_record_using_external_id(module_api_name, external_value, related_list_api_name, external_field_value)
			rescue Exception => e
				raise e
			end
		end
end
UpdateRelatedRecordUsingExternalId.initialize_and_call