require "ZOHOCRMSDK5_0"

class GetBulkWriteJobDetails
		def self.get_bulk_write_job_details(job_id)
			bulk_write_operations =  ZOHOCRMSDK::BulkWrite::BulkWriteOperations.new
			response = bulk_write_operations.get_bulk_write_job_details(job_id)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_wrapper = response.data_object
					if response_wrapper.is_a? ZOHOCRMSDK::BulkWrite::BulkWriteResponse
						bulk_write_response = response_wrapper
						print "bulk write Job Status: " + bulk_write_response.status.to_s + "\n"
						print "bulk write CharacterEncoding: " + bulk_write_response.character_encoding.to_s + "\n"
						resources= bulk_write_response.resource
						if resources != nil
							resources.each do |resource|
								print "bulk write Resource Status: " + resource.status.value.to_s + "\n"
								print "bulk write Resource Type: " + resource.type.value.to_s + "\n"
								module_1 = resource.module
								if module_1 != nil
									print "bulkwrite Resource Module Name : " + module_1.api_name.to_s + "\n"
									print "bulkwrite Resource Module Id : " + module_1.id.to_s + "\n"
								end
								field_mappings= resource.field_mappings
								if field_mappings != nil
									field_mappings.each do |field_mapping|
										print "bulk write Resource FieldMapping Module: " + field_mapping.api_name.to_s + "\n"
										if field_mapping.index != nil
											print "bulk write Resource FieldMapping Index: " + field_mapping.index.to_s + "\n"
										end
										if field_mapping.format != nil
											print "bulk write Resource FieldMapping Format: " + field_mapping.format.to_s + "\n"
										end
										if field_mapping.module != nil
											print "bulk write Resource FieldMapping Module: " + field_mapping.module.to_s + "\n"
										end
										if field_mapping.find_by != nil
											print "bulk write Resource FieldMapping FindBy: " + field_mapping.find_by.to_s + "\n"
										end
										if field_mapping.default_value != nil
											default_value = field_mapping.default_value
											if default_value != nil
												print "name : " + default_value.name.to_s + "\n"
												print "module : " + default_value.module.to_s + "\n"
												print "value : " + default_value.value.to_s + "\n"
											end
										end
									end
								end
								file= resource.file
								if file != nil
									print "bulk write Resource File Status: " + file.status.value.to_s + "\n"
									print "bulk write Resource File Name: " + file.name.to_s + "\n"
									print "bulk write Resource File AddedCount: " + file.added_count.to_s + "\n"
									print "bulk write Resource File SkippedCount: " + file.skipped_count.to_s + "\n"
									print "bulk write Resource File UpdatedCount: " + file.updated_count.to_s + "\n"
									print "bulk write Resource File TotalCount: " + file.total_count.to_s + "\n"
								end
								print "bulk write Resource FindBy: " + resource.find_by.to_s + "\n"
								print "bulk write Resource Code: " + resource.code.to_s + "\n"
							end
						end
						callback = bulk_write_response.callback
						if callback != nil
							print "bulk write CallBack Url: " + callback.url.to_s + "\n"
							print "bulk write CallBack Method: " + callback.method.value.to_s + "\n"
						end
						print "bulk write ID: " + bulk_write_response.id.to_s + "\n"
						result = bulk_write_response.result
						if result != nil
							print "bulk write DownloadUrl: " + result.download_url.to_s + "\n"
						end
						created_by= bulk_write_response.created_by
						if created_by != nil
							print "bulkread Created By User-ID: " + created_by.id.to_s + "\n"
							print "bulkread Created By user-_name: " + created_by.name.to_s + "\n"
						end
						print "bulk write Operation: " + bulk_write_response.operation.to_s + "\n"
						print "bulk write File CreatedTime: " + bulk_write_response.created_time.to_s + "\n"
					elsif response_wrapper.is_a? ZOHOCRMSDK::BulkWrite::APIException
						exception = response_wrapper
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
				job_id = 347706117222006
				get_bulk_write_job_details(job_id)
			rescue Exception => e
				raise e
			end
		end
end
GetBulkWriteJobDetails.initialize_and_call