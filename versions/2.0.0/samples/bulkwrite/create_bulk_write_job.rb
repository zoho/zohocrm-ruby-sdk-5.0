require "ZOHOCRMSDK5_0"

class CreateBulkWriteJob
		def self.create_bulk_write_job(module_api_name, file_id)
			bulk_write_operations =  ZOHOCRMSDK::BulkWrite::BulkWriteOperations.new
			request_wrapper =  ZOHOCRMSDK::BulkWrite::RequestWrapper.new
			callback =  ZOHOCRMSDK::BulkWrite::CallBack.new
			callback.url="https:#www.example.com/callback"
			callback.method =  ZOHOCRMSDK::Util::Choice.new("post")
			request_wrapper.callback = callback
			request_wrapper.character_encoding="UTF-8"
			request_wrapper.operation =  ZOHOCRMSDK::Util::Choice.new("upsert")
			resource=[]
			resource_ins =  ZOHOCRMSDK::BulkWrite::Resource.new
			resource_ins.type =  ZOHOCRMSDK::Util::Choice.new("data")
			resource_ins.file_id = file_id
			resource_ins.ignore_empty = true
			resource_ins.find_by="Email"
			module_1 =  ZOHOCRMSDK::Modules::MinifiedModule.new
			module_1.api_name = module_api_name
			resource_ins.module = module_1
			field_mappings=[]
			field_mapping =  ZOHOCRMSDK::BulkWrite::FieldMapping.new
			field_mapping.api_name="Last_Name"
			field_mapping.index = 0
			field_mappings.push(field_mapping)
			field_mapping =  ZOHOCRMSDK::BulkWrite::FieldMapping.new
			field_mapping.api_name="Email"
			field_mapping.index = 1
			field_mappings.push(field_mapping)
			field_mapping =  ZOHOCRMSDK::BulkWrite::FieldMapping.new
			field_mapping.api_name="Company"
			field_mapping.index = 2
			field_mappings.push(field_mapping)
			field_mapping =  ZOHOCRMSDK::BulkWrite::FieldMapping.new
			field_mapping.api_name="Phone"
			field_mapping.index = 3
			field_mappings.push(field_mapping)
			field_mapping =  ZOHOCRMSDK::BulkWrite::FieldMapping.new
			field_mapping.api_name="Website"
			# field_mapping.format=""
			# field_mapping.find_by=""
			default_value =  ZOHOCRMSDK::BulkWrite::DefaultValue.new
			default_value.value="https:#www.zohoapis.com"
			field_mapping.default_value = default_value
			field_mappings.push(field_mapping)
			resource_ins.field_mappings = field_mappings
			resource.push(resource_ins)
			request_wrapper.resource = resource
			response = bulk_write_operations.create_bulk_write_job(request_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_response = response.data_object
					if action_response.is_a? ZOHOCRMSDK::BulkWrite::SuccessResponse
						success_response = action_response
						print "status: " + success_response.status.value.to_s + "\n"
						print "code: " + success_response.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						success_response.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + success_response.message.value.to_s + "\n"
					elsif action_response.is_a? ZOHOCRMSDK::BulkWrite::APIException
						exception = action_response
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
				file_id = "34770611727001"
				create_bulk_write_job(module_api_name, file_id)
			rescue Exception => e
				raise e
			end
		end
end
CreateBulkWriteJob.initialize_and_call