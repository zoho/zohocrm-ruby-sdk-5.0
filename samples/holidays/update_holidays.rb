require "ZOHOCRMSDK5_0"

class UpdateHolidays
		def self.update_holidays
			holidaysoperations =  ZOHOCRMSDK::Holidays::HolidaysOperations.new("4402480020813")
			request =  ZOHOCRMSDK::Holidays::Holidays.new
			holidays=[]
			holiday =  ZOHOCRMSDK::Holidays::Holiday.new
			holiday.id = 440248001283004
			holiday.name="holiday 1"
			holiday.date = Date.new(2023, 8, 12)
			holiday.type="shift_holiday"
			# when type is Shift_holiday
			shifthour =  ZOHOCRMSDK::Holidays::ShiftHour.new
			shifthour.name="shift hour for T"
			shifthour.id = 440248001286017
			holiday.shift_hour = shifthour
			holiday.year = 2023
			holidays.push(holiday)
			request.holidays = holidays
			response = holidaysoperations.update_holidays(request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::Holidays::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.holidays
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::Holidays::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.value.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::Holidays::APIException
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
					elsif action_handler.is_a? ZOHOCRMSDK::Holidays::APIException
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
				update_holidays
			rescue Exception => e
				raise e
			end
		end
end
UpdateHolidays.initialize_and_call