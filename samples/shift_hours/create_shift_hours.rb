require "ZOHOCRMSDK5_0"

class CreateShiftHours
		def self.create_shift_hours
			shifthoursoperations =  ZOHOCRMSDK::ShiftHours::ShiftHoursOperations.new("")
			request =  ZOHOCRMSDK::ShiftHours::BodyWrapper.new
			shift_hours=[]
			shifthours =  ZOHOCRMSDK::ShiftHours::ShiftHours.new
			shifthours.timezone = TZInfo::Timezone.get("Asia/Kolkata")
			shifthours.name="shift hours with holiday1"
			shifthours.same_as_everyday = false
			shift_days=[]
			shift_days.push("Monday")
			shift_days.push("Tuesday")
			shifthours.shift_days = shift_days
			# # if same_as_everyday is true
			daily_timing=[]
			daily_timing.push("10:00")
			daily_timing.push("19:00")
			shifthours.daily_timing = daily_timing
			# if same_as_everyday is false
			custom_timings=[]
			customtiming =  ZOHOCRMSDK::ShiftHours::ShiftCustomTiming.new
			shift_timing=[]
			shift_timing.push("10:00")
			shift_timing.push("16:00")
			customtiming.shift_timing = shift_timing
			customtiming.days="Monday"
			custom_timings.push(customtiming)
			customtiming1 =  ZOHOCRMSDK::ShiftHours::ShiftCustomTiming.new
			shift_timing1=[]
			shift_timing1.push("10:00")
			shift_timing1.push("18:00")
			customtiming1.shift_timing = shift_timing1
			customtiming1.days="Tuesday"
			custom_timings.push(customtiming1)
			shifthours.custom_timing = custom_timings
			#
			break_hours=[]
			breakhour =  ZOHOCRMSDK::ShiftHours::BreakHours.new
			break_days=[]
			break_days.push("Monday")
			break_days.push("Tuesday")
			breakhour.break_days = break_days
			# # if same_as_everday is True
			breakhour.same_as_everyday = true
			dailytimingfor_break_hours=[]
			dailytimingfor_break_hours.push("11:00")
			dailytimingfor_break_hours.push("11:30")
			breakhour.daily_timing = dailytimingfor_break_hours
			break_hours.push(breakhour)
			shifthours.break_hours = break_hours
			# if same_as_everyday is false
			breakhour.same_as_everyday = false
			customtimingsfor_break_hours=[]
			custom_timingfor_break_hour =  ZOHOCRMSDK::ShiftHours::BreakCustomTiming.new
			break_timings=[]
			break_timings.push("12:00")
			break_timings.push("12:15")
			custom_timingfor_break_hour.break_timing = break_timings
			custom_timingfor_break_hour.days="Monday"
			customtimingsfor_break_hours.push(custom_timingfor_break_hour)
			custom_timingfor_break_hour1 =  ZOHOCRMSDK::ShiftHours::BreakCustomTiming.new
			break_timings1=[]
			break_timings1.push("16:00")
			break_timings1.push("16:15")
			custom_timingfor_break_hour1.break_timing = break_timings1
			custom_timingfor_break_hour1.days="Tuesday"
			customtimingsfor_break_hours.push(custom_timingfor_break_hour1)
			breakhour.custom_timing = customtimingsfor_break_hours
			break_hours.push(breakhour)
			shifthours.break_hours = break_hours
			#
			users=[]
			user =  ZOHOCRMSDK::ShiftHours::Users.new
			user.id = 440248254001
			user.effective_from(Date.new(2023, 10, 12))
			users.push(user)
			shifthours.users = users
			holidays=[]
			holiday =  ZOHOCRMSDK::ShiftHours::Holidays.new
			holiday.date = Date.new(2023, 05, 01)
			holiday.id = 23456
			holiday.name="Holi10"
			holiday.year = 2023
			holidays.push(holiday)
			shifthours.holidays = holidays
			shift_hours.push(shifthours)
			request.shift_hours = shift_hours
			response = shifthoursoperations.create_shifts_hours(request)
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
				create_shift_hours
			rescue Exception => e
				raise e
			end
		end
end
CreateShiftHours.initialize_and_call