require "ZOHOCRMSDK5_0"

class GetRecords
		def self.get_records
			query_operations =  ZOHOCRMSDK::Query::QueryOperations.new
			body_wrapper =  ZOHOCRMSDK::Query::BodyWrapper.new
			select_query = "select Last_Name from Leads where Last_Name is not null limit 200"
			body_wrapper.select_query = select_query
			response = query_operations.get_records(body_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Query::ResponseWrapper
						response_wrapper = response_handler
						records= response_wrapper.data
						records.each do |record|
							print "record ID: " + record.id.to_s + "\n"
							created_by= record.created_by
							if created_by != nil
								print "record Created By User-ID: " + created_by.id.to_s + "\n"
								print "record Created By User-Name: " + created_by.name.to_s + "\n"
								print "record Created By User-Email: " + created_by.email.to_s + "\n"
							end
							print "record CreatedTime: " + record.created_time.to_s + "\n"
							modified_by= record.modified_by
							if modified_by != nil
								print "record Modified By User-ID: " + modified_by.id.to_s + "\n"
								print "record Modified By User-Name: " + modified_by.name.to_s + "\n"
								print "record Modified By User-Email: " + modified_by.email.to_s + "\n"
							end
							print "record ModifiedTime: " + record.modified_time.to_s + "\n"
							# To get particular field value
							print "record Field Value: " + record.get_key_value("last__name").to_s + "\n"# FieldApiName
							print "record KeyValues: ".to_s + "\n"
							record.each do |k, v|
								key_name = k
								value = v
								if value.is_a? Array
									print "record KeyName : " + key_name.to_s + "\n"
									data_list=  value
									data_list.each do |data|
										if data.is_a? Hash
											print "record KeyName : " + key_name + " - Value : ".to_s + "\n"
											data.each do |k1, v1|
												print k1 + " : " + v1.to_s + "\n"
											end
										else
											print data.to_s + "\n"
										end
									end
								elsif value.is_a? Hash
									print "record KeyName : " + key_name + " - Value : ".to_s + "\n"
									value.each do |k1, v1|
										print k1 + " : " + v1.to_s + "\n"
									end
								else
									print "record KeyName : " + key_name + " - Value : " + value.to_s + "\n"
								end
							end
						end
						info = response_wrapper.info
						if info != nil
							if info.count != nil
								print "record Info Count: " + info.count.to_s + "\n"
							end
							if info.more_records != nil
								print "record Info MoreRecords: " + info.more_records.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Query::APIException
						exception = response_handler
						print "status: " + exception.status.value.to_s + "\n"
						print "code: " + exception.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						exception.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + exception.message.to_s + "\n"
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
				get_records
			rescue Exception => e
				raise e
			end
		end
end
GetRecords.initialize_and_call