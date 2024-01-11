require "ZOHOCRMSDK5_0"

class GetShiftHour
		def self.get_shift_hour(id)
			shifthoursoperations =  ZOHOCRMSDK::ShiftHours::ShiftHoursOperations.new("")
			response = shifthoursoperations.get_shift_hour(id)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_object = response.data_object
					if response_object.is_a? ZOHOCRMSDK::ShiftHours::ResponseWrapper
						response_wrapper = response_object
						shiftcount = response_wrapper.shift_count
						print "shift_count :".to_s + "\n"
						print "total_shift_with_user :" + shiftcount.total_shift_with_user.to_s + "\n"
						print "total_shift :" + shiftcount.total_shift.to_s + "\n"
						shifthours= response_wrapper.shift_hours
						if shifthours != nil
							shifthours.each do |shifthour|
								print "name : " + shifthour.name.to_s + "\n"
								print "same_as_everyday : " + shifthour.same_as_everyday.to_s + "\n"
								print "users_count : " + shifthour.users_count.to_s + "\n"
								print "timezone : " + shifthour.timezone.to_s + "\n"
								shift_days= shifthour.shift_days
								if shift_days != nil
									print "shift_days : ".to_s + "\n"
									shift_days.each do |shift_day|
										print shift_day.to_s + "\n"
									end
								end
								daily_timing= shifthour.daily_timing
								if daily_timing != nil
									print "daily_timing : ".to_s + "\n"
									daily_timing.each do |dailytiming|
										print dailytiming.to_s + "\n"
									end
								end
								custom_timing= shifthour.custom_timing
								if custom_timing != nil
									print "custom_timing : ".to_s + "\n"
									custom_timing.each do |customtiming|
										shift_timing= customtiming.shift_timing
										if shift_timing != nil
											print "shift_timing :".to_s + "\n"
											shift_timing.each do |shifttiming|
												print shifttiming.to_s + "\n"
											end
										end
										print "days : " + customtiming.days.to_s + "\n"
									end
								end
								holidays= shifthour.holidays
								if holidays != nil
									print "holidays : ".to_s + "\n"
									holidays.each do |holiday|
										print "date : " + holiday.date.to_s + "\n"
										print "year : " + holiday.year.to_s + "\n"
										print "name : " + holiday.name.to_s + "\n"
										print "id : " + holiday.id.to_s + "\n"
									end
								end
								users= shifthour.users
								if users != nil
									print "users : ".to_s + "\n"
									users.each do |user|
										print "user__id : " + user.id.to_s + "\n"
										print "user_name : " + user.name.to_s + "\n"
										print "user_email : " + user.email.to_s + "\n"
										print "user_role : " + user.role.to_s + "\n"
										print "user__zuid : " + user.zuid.to_s + "\n"
										print "effective_from : " + user.effective_from.to_s + "\n"
									end
								end
								break_hours= shifthour.break_hours
								if break_hours != nil
									break_hours.each do |breakhour|
										print "breakhour__id : " + breakhour.id.to_s + "\n"
										print "same_as_everyday : " + breakhour.same_as_everyday.to_s + "\n"
										breakdays= breakhour.break_days
										if breakdays != nil
											breakdays.each do |breakday|
												print "breakdays : " + breakday.to_s + "\n"
											end
										end
										daily_timings= breakhour.daily_timing
										if daily_timings != nil
											daily_timings.each do |dailytiming|
												print "dailytiming : " + dailytiming.to_s + "\n"
											end
										end
										break_hours_custom_timings= breakhour.custom_timing
										if break_hours_custom_timings != nil
											break_hours_custom_timings.each do |break_hour_custom_timing|
												print "custom_timing : ".to_s + "\n"
												break_timings= break_hour_custom_timing.break_timing
												if break_timings != nil
													break_timings.each do |break_timing|
														print "breaktiming : " + break_timing.to_s + "\n"
													end
													print "days : " + break_hour_custom_timing.days.to_s + "\n"
												end
											end
										end
									end
								end
							end
						end
					elsif response_object.is_a? ZOHOCRMSDK::ShiftHours::APIException
						exception = response_object
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
				get_shift_hour(6237100332015)
			rescue Exception => e
				raise e
			end
		end
end
GetShiftHour.initialize_and_call