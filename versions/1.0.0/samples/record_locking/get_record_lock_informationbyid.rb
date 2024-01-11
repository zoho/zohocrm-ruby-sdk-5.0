require "ZOHOCRMSDK5_0"

class GetRecordLockInformationbyid
		def self.get_record_lock_informationbyid(module_api_name, record_id, lock_id)
			record_locking_operations =  ZOHOCRMSDK::RecordLocking::RecordLockingOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::RecordLocking::RecordLockingOperations::GetrecordlockinformationbyidParam.fields, "lock_source__s")
			response = record_locking_operations.get_record_lock_informationbyid(lock_id, record_id, module_api_name, param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::RecordLocking::ResponseWrapper
						response_wrapper = response_handler
						record_locks= response_wrapper.data
						record_locks.each do |record_lock|
							record_lock.each do |k, v|
								key_name = k
								value = v
								if value.is_a? ZOHOCRMSDK::Users::MinifiedUser
									locked_by_s=  value
									if locked_by_s != nil
										print "record_locking LockedByS User-ID: " + locked_by_s.id.to_s + "\n"
										print "record_locking LockedByS User-Name: " + locked_by_s.name.to_s + "\n"
										print "record_locking LockedByS User-Email: " + locked_by_s.email.to_s + "\n"
									end
								end
								if value.is_a? ZOHOCRMSDK::RecordLocking::LockedForS
									locked_for_s = value
									if locked_for_s != nil
										print "record_locking LockedForS By User-ID: " + locked_for_s.id.to_s + "\n"
										print "record_locking LockedForS By User-Name: " + locked_for_s.name.to_s + "\n"
										print "record_locking LockedForS Module KeyName : " + key_name + " - Value : ".to_s + "\n"
										locked_for_s.each do |k1, v1|
											print k1 + " : " + v1.to_s + "\n"
										end
									end
								end
								if value.is_a? Array
									print "record_locking KeyName : " + key_name.to_s + "\n"
									data_list=value
									data_list.each do |data|
										if data.is_a? Hash
											print "record_locking KeyName : " + key_name + " - Value : ".to_s + "\n"
											data.each do |k1, v1|
												print k1 + " : " + v1.to_s + "\n"
											end
										else
											print data.to_s + "\n"
										end
									end
								elsif value.is_a? Hash
									print "record_locking KeyName : " + key_name + " - Value : ".to_s + "\n"
									value.each do |k1, v1|
										print k1 + " : " + v1.to_s + "\n"
									end
								else
									print "record_locking KeyName : " + key_name + " - Value : " + value.to_s + "\n"
								end
							end
						end
						info = response_wrapper.info
						if info != nil
							if info.count != nil
								print "record_locking Info Count: " + info.count.to_s + "\n"
							end
							if info.more_records != nil
								print "record_locking Info MoreRecords: " + info.more_records.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::RecordLocking::APIException
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
				module_api_name = "leads"
				record_id = 34770001
				lock_id = 347779001
				get_record_lock_informationbyid(module_api_name, record_id,lock_id)
			rescue Exception => e
				raise e
			end
		end
end
GetRecordLockInformationbyid.initialize_and_call