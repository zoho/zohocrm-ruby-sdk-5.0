require "ZOHOCRMSDK5_0"

class DeleteRelatedRecordsUsingExternalId
		def self.delete_related_records_using_external_id(module_api_name, external_value, related_list_api_name, related_list_ids)
			x_external = "leads.External,Products.Products_External"
			related_records_operations =  ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name, x_external)
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			related_list_ids.each do |related_list_id|
				param_instance.add(ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations::DelinkRecordsParam.ids, related_list_id)
			end
			response = related_records_operations.delete_related_records_using_external_id(external_value, param_instance)
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
				related_list_ids= ["34770615919001", "34770615917011"]
				delete_related_records_using_external_id(module_api_name, external_value, related_list_api_name, related_list_ids)
			rescue Exception => e
				raise e
			end
		end
end
DeleteRelatedRecordsUsingExternalId.initialize_and_call