require "ZOHOCRMSDK5_0"

class GetSharedRecordDetails
		def self.get_shared_record_details(module_api_name, record_id)
			share_records_operations =  ZOHOCRMSDK::ShareRecords::ShareRecordsOperations.new(record_id, module_api_name)
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::ShareRecords::ShareRecordsOperations::GetSharedRecordDetailsParam.view, "summary")
	#		param_instance.add(GetSharedRecordDetailsParam.sharedto, 3477061173021)
			response = share_records_operations.get_shared_record_details(param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::ShareRecords::ResponseWrapper
						response_wrapper = response_handler
						share_records= response_wrapper.share
						share_records.each do |share_record|
							shared_with = share_record.shared_with
							if shared_with != nil
								print "share_record shared_with Name: " + shared_with.name.to_s + "\n"
								print "share_record shared_with Id: " + shared_with.id.to_s + "\n"
								print "share_record shared_with Type: " + shared_with.get_key_value("type").to_s + "\n"
								print "share_record shared_with Zuid: " + shared_with.zuid.to_s + "\n"
							end
							print "share_record ShareRelatedRecords: " + share_record.share_related_records.to_s + "\n"
							shared_through = share_record.shared_through
							if shared_through != nil
								module_1= shared_through.module
								if module_1 != nil
									print "share_record SharedThrough Module ID: " + module_1.id.to_s + "\n"
									print "share_record SharedThrough Module Name: " + module_1.name.to_s + "\n"
								end
								print "share_record SharedThrough Name: " + shared_through.name.to_s + "\n"
								print "share_record SharedThrough ID: " + shared_through.id.to_s + "\n"
							end
							print "share_record SharedTime: " + share_record.shared_time.to_s + "\n"
							print "share_record Permission: " + share_record.permission.value.to_s + "\n"
							shared_by= share_record.shared_by
							if shared_by != nil
								print "share_record SharedBy-ID: " + shared_by.id.to_s + "\n"
								print "share_record SharedBy-Name: " + shared_by.name.to_s + "\n"
								print "share_record SharedBy-Zuid: " + shared_by.zuid.to_s + "\n"
							end
							user= share_record.user
							if user != nil
								print "share_record User-ID: " + user.id.to_s + "\n"
								print "share_record User-Name: " + user.name.to_s + "\n"
								print "share_record User-Zuid: " + user.zuid.to_s + "\n"
							end
							print "share_record Type: " + share_record.type.value.to_s + "\n"
						end
						if response_wrapper.shareable_user != nil
							shareable_users= response_wrapper.shareable_user
							shareable_users.each do |shareable_user|
								print "share_record User-ID: " + shareable_user.id.to_s + "\n"
								print "share_record User-FullName: " + shareable_user.full_name.to_s + "\n"
								print "share_record User-Zuid: " + shareable_user.zuid.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::ShareRecords::APIException
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
	def self.initialize_and_call
			begin
				environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				record_id = 347706114963002
				module_api_name = "leads"
				get_shared_record_details(module_api_name, record_id)
			rescue Exception => e
				raise e
			end
		end
end
GetSharedRecordDetails.initialize_and_call