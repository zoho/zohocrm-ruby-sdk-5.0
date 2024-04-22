require "ZOHOCRMSDK5_0"

class CreateHolidays
		def self.create_holidays
			holidaysoperations =  ZOHOCRMSDK::Holidays::HolidaysOperations.new("")
			# when type is business_holiday
			request =  ZOHOCRMSDK::Holidays::CreateBusinessHoliday.new
			holidays=[]
			holiday =  ZOHOCRMSDK::Holidays::BusinessHoliday.new
			holiday.name="Holiday 1"
			holiday.date = Date.new(2024, 8, 22)
			holiday.type =  ZOHOCRMSDK::Util::Choice.new("business_holiday")
			holidays.push(holiday)
			request.holidays = holidays
			# when type is Shift_holiday
			request1 =  ZOHOCRMSDK::Holidays::CreateShiftHoliday.new
			shiftholidays=[]
			shiftholiday =  ZOHOCRMSDK::Holidays::ShiftHoliday.new
			shifthour =  ZOHOCRMSDK::Holidays::ShiftHour.new
			shifthour.name="shift hour for TX"
			shifthour.id = 623710332015
			shiftholiday.shift_hour = shifthour
			shiftholiday.name="shiftholiday"
			shiftholiday.type =  ZOHOCRMSDK::Util::Choice.new("shift_holiday")
			shiftholiday.date = Date.new(2024, 8, 22)
			shiftholidays.push(shiftholiday)
			request1.holidays = shiftholidays
			response = holidaysoperations.create_holidays(request1)
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
				create_holidays
			rescue Exception => e
				raise e
			end
		end
end
CreateHolidays.initialize_and_call