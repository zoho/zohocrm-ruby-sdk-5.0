require "ZOHOCRMSDK5_0"

class GetDeletedRecords
		def self.get_deleted_records(module_api_name)
			record_operations =  ZOHOCRMSDK::Record::RecordOperations.new
			param_instance =  ZOHOCRMSDK::Record::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetDeletedRecordsParam.type, "permanent")# all, recycle, permanent
			param_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetDeletedRecordsParam.page, 1)
			param_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetDeletedRecordsParam.per_page, 2)
			header_instance =  ZOHOCRMSDK::HeaderMap.new
			if_modified_since = DateTime.new(2020, 05, 02, 12, 00, 30, "+05:30")
			header_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetDeletedRecordsHeader.If_modified_since, if_modified_since)
			response = record_operations.get_deleted_records(module_api_name, param_instance, header_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					deleted_records_handler = response.data_object
					if deleted_records_handler.is_a? ZOHOCRMSDK::Record::DeletedRecordsWrapper
						deleted_records_wrapper = deleted_records_handler
						deleted_records= deleted_records_wrapper.data
						deleted_records.each do |deleted_record|
							deleted_by= deleted_record.deleted_by
							if deleted_by != nil
								print "deleted_record Deleted By User-Name: " + deleted_by.name.to_s + "\n"
								print "deleted_record Deleted By User-ID: " + deleted_by.id.to_s + "\n"
							end
							print "deleted_record ID: " + deleted_record.id.to_s + "\n"
							print "deleted_record DisplayName: " + deleted_record.display_name.to_s + "\n"
							print "deleted_record Type: " + deleted_record.type.to_s + "\n"
							created_by= deleted_record.created_by
							if created_by != nil
								print "deleted_record Created By User-Name: " + created_by.name.to_s + "\n"
								print "deleted_record Created By User-ID: " + created_by.id.to_s + "\n"
							end
							print "deleted_record DeletedTime: " + deleted_record.deleted_time.to_s + "\n"
						end
						info = deleted_records_wrapper.info
						if info != nil
							if info.per_page != nil
								print "record Info PerPage: " + info.per_page.to_s + "\n"
							end
							if info.count != nil
								print "record Info Count: " + info.count.to_s + "\n"
							end
							if info.page != nil
								print "record Info Page: " + info.page.to_s + "\n"
							end
							if info.more_records != nil
								print "record Info MoreRecords: " + info.more_records.to_s + "\n"
							end
						end
					elsif deleted_records_handler.is_a? ZOHOCRMSDK::Record::APIException
						exception = deleted_records_handler
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
				get_deleted_records(module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
GetDeletedRecords.initialize_and_call