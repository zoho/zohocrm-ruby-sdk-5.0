require "ZOHOCRMSDK5_0"

class History
		def self.history
			backup_operations =  ZOHOCRMSDK::Backup::BackupOperations.new
			param_instance =  ZOHOCRMSDK::Backup::ParameterMap.new
			response = backup_operations.history(param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Backup::HistoryWrapper
						history_wrapper = response_handler
						history= history_wrapper.history
						history.each do |history1|
							print "history Id: " + history1.id.to_s + "\n"
							done_by = history1.done_by
							if done_by != nil
								print "history DoneBy Id: " + done_by.id.to_s + "\n"
								print "history DoneBy Name: " + done_by.name.to_s + "\n"
								print "history DoneBy Zuid: " + done_by.zuid.to_s + "\n"
							end
							print "history LogTime: " + history1.log_time.to_s + "\n"
							print "history State: " + history1.state.to_s + "\n"
							print "history Action: " + history1.action.to_s + "\n"
							print "history RepeatType: " + history1.repeat_type.to_s + "\n"
							print "history FileName: " + history1.file_name.to_s + "\n"
							print "history Count: " + history1.count.to_s + "\n"
						end
						info = history_wrapper.info
						if info != nil
							if info.per_page != nil
								print "history Info PerPage: " + info.per_page.to_s + "\n"
							end
							if info.count != nil
								print "history Info Count: " + info.count.to_s + "\n"
							end
							if info.page != nil
								print "history Info Page: " + info.page.to_s + "\n"
							end
							if info.more_records != nil
								print "history Info MoreRecords: " + info.more_records.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Backup::APIException
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
				history
			rescue Exception => e
				raise e
			end
		end
end
History.initialize_and_call
