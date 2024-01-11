require "ZOHOCRMSDK5_0"

class AddAppointmentsRescheduledHistory
		def self.add_appointments_rescheduled_history
			reschedule_history_operations =  ZOHOCRMSDK::RescheduleHistory::RescheduleHistoryOperations.new
			request =  ZOHOCRMSDK::RescheduleHistory::BodyWrapper.new
			data=[]
			reschedule_history =  ZOHOCRMSDK::RescheduleHistory::RescheduleHistory.new
			appointment_name =  ZOHOCRMSDK::RescheduleHistory::AppointmentName.new
			appointment_name.name="Name"
			appointment_name.id = 440248001298112
			reschedule_history.appointment_name = appointment_name
			rescheduled_by =  ZOHOCRMSDK::RescheduleHistory::User.new
			rescheduled_by.id = 4402480254001
			rescheduled_by.name="UserName"
			reschedule_history.rescheduled_by = rescheduled_by
			reschedule_history.rescheduled_to = DateTime.new(2023, 11, 20, 11, 30, 01, "+05:30")
			reschedule_history.rescheduled_from = DateTime.new(2023, 11, 20, 9, 30, 01, "+05:30")
			reschedule_history.rescheduled_time = DateTime.new(2023, 11, 20, 20, 00, 01, "+05:30")
			reschedule_history.reschedule_note="Customer unavailable"
			reschedule_history.reschedule_reason="By Customer"
			data.push(reschedule_history)
			request.data = data
			response = reschedule_history_operations.add_appointments_rescheduled_history(request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::RescheduleHistory::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.data
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::RescheduleHistory::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::RescheduleHistory::APIException
								exception = action_response
								print "status: " + exception.status.value.to_s + "\n"
								print "code: " + exception.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								exception.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + exception.message.value.to_s + "\n"
							end
						end
					elsif action_handler.is_a? ZOHOCRMSDK::RescheduleHistory::APIException
						exception = action_handler
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
				add_appointments_rescheduled_history
			rescue Exception => e
				raise e
			end
		end
end
AddAppointmentsRescheduledHistory.initialize_and_call