require "ZOHOCRMSDK5_0"

class GetBulkReadJobDetails
		def self.get_bulk_read_job_details(job_id)
			bulk_read_operations =  ZOHOCRMSDK::BulkRead::BulkReadOperations.new
			response = bulk_read_operations.get_bulk_read_job_details(job_id)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::BulkRead::ResponseWrapper
						response_wrapper = response_handler
						job_details= response_wrapper.data
						job_details.each do |job_detail|
							print "bulk read Job ID: " + job_detail.id.to_s + "\n"
							print "bulk read Operation: " + job_detail.operation.to_s + "\n"
							print "bulk read State: " + job_detail.state.value.to_s + "\n"
							result = job_detail.result
							if result != nil
								print "bulkread Result Page: " + result.page.to_s + "\n"
								print "bulkread Result Count: " + result.count.to_s + "\n"
								print "bulkread Result Download URL: " + result.download_url.to_s + "\n"
								print "bulkread Result Per_Page: " + result.per_page.to_s + "\n"
								print "bulkread Result MoreRecords: " + result.more_records.to_s + "\n"
							end
							query = job_detail.query
							if query != nil
								module_1 = query.module
								if module_1 != nil
									print "bulkread Resource Module Name : " + module_1.api_name.to_s + "\n"
									print "bulkread Resource Module Id : " + module_1.id.to_s + "\n"
								end
								print "bulk read Query Page: " + query.page.to_s + "\n"
								print "bulk read Query cvid: " + query.cvid.to_s + "\n"
								fields= query.fields
								if fields != nil
									fields.each do |field_name|
										print "bulk read Query Fields: " + field_name.to_s + "\n"
									end
								end
								criteria = query.criteria
								if criteria != nil
									print_criteria(criteria)
								end
							end
							created_by= job_detail.created_by
							if created_by != nil
								print "bulkread Created By User-ID: " + created_by.id.to_s + "\n"
								print "bulkread Created By user-_name: " + created_by.name.to_s + "\n"
							end
							print "bulkread CreatedTime: " + job_detail.created_time.to_s + "\n"
							print "bulkread File Type: " + job_detail.file_type.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::BulkRead::APIException
						exception = response_handler
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
		def self.print_criteria(criteria)
			print "bulk read Query Criteria APIName: " + criteria.api_name.to_s + "\n"
			if criteria.comparator != nil
				print "bulk read Query Criteria Comparator: " + criteria.comparator.value.to_s + "\n"
			end
			if criteria.value != nil
				print "bulk read Query Criteria Value: " + criteria.value.to_s + "\n"
			end
			if criteria.field != nil
				print "bulk read Query Criteria field name: " + criteria.field.api_name.to_s + "\n"
			end
			criteria_group= criteria.group
			if criteria_group != nil
				criteria_group.each do |criteria1|
					print_criteria(criteria1)
				end
			end
			if criteria.group_operator != nil
				print "bulk read Query Criteria Group Operator: " + criteria.group_operator.value.to_s + "\n"
			end
		end
	def self.initialize_and_call
			begin
				environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				job_id = 34770615177002
				get_bulk_read_job_details(job_id)
			rescue Exception => e
				raise e
			end
		end
end
GetBulkReadJobDetails.initialize_and_call