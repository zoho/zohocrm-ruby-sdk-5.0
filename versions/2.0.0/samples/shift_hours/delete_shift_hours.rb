require "ZOHOCRMSDK5_0"

class DeleteShiftHours
		def self.delete_shift_hours(id)
			shifthoursoperations =  ZOHOCRMSDK::ShiftHours::ShiftHoursOperations.new("")
			response = shifthoursoperations.delete_shift_hour(id)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::ShiftHours::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.shift_hours
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::ShiftHours::SuccessResponse
								successresponse = action_response
								print "status: " + successresponse.status.value.to_s + "\n"
								print "code: " + successresponse.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								successresponse.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + successresponse.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::ShiftHours::APIException
								exception = action_response
								print "status: " + exception.status.value.to_s + "\n"
								print "code: " + exception.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								exception.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + exception.message.to_s + "\n"
							end
						end
					elsif action_handler.is_a? ZOHOCRMSDK::ShiftHours::APIException
						exception = action_handler
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
				delete_shift_hours(62371332015)
			rescue Exception => e
				raise e
			end
		end
end
DeleteShiftHours.initialize_and_call
