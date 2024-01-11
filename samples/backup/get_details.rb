require "ZOHOCRMSDK5_0"

class GetDetails
		def self.get_details
			backup_operations =  ZOHOCRMSDK::Backup::BackupOperations.new
			response = backup_operations.get_details
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Backup::BodyWrapper
						response_wrapper = response_handler
						backup= response_wrapper.backup
						if backup != nil
							print "backup Rrule: " + backup.rrule.to_s + "\n"
							print "backup Id: " + backup.id.to_s + "\n"
							print "backup StartDate: " + backup.start_date.to_s + "\n"
							print "backup ScheduledDate: " + backup.scheduled_date.to_s + "\n"
							print "backup Status: " + backup.status.to_s + "\n"
							requester = backup.requester
							if requester != nil
								print "backup Requester Id: " + requester.id.to_s + "\n"
								print "backup Requester Name: " + requester.name.to_s + "\n"
								print "backup Requester Zuid: " + requester.zuid.to_s + "\n"
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
				elsif response.status_code != 204
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
				get_details
			rescue Exception => e
				raise e
			end
		end
end
GetDetails.initialize_and_call