require "ZOHOCRMSDK5_0"

class UpdateBusinessHours
		def self.update_business_hours
			business_hours_operations =  ZOHOCRMSDK::BusinessHours::BusinessHoursOperations.new("4402480020813")
			request =  ZOHOCRMSDK::BusinessHours::BodyWrapper.new
			business_hours =  ZOHOCRMSDK::BusinessHours::BusinessHours.new
			business_hours.id = 4402481017425
			business_hours.same_as_everyday = false
			businessdays=[]
			businessdays.push( ZOHOCRMSDK::Util::Choice.new("monday"))
			businessdays.push( ZOHOCRMSDK::Util::Choice.new("tuesday"))
			businessdays.push( ZOHOCRMSDK::Util::Choice.new("wednesday"))
			business_hours.business_days = businessdays
			business_hours.week_starts_on =  ZOHOCRMSDK::Util::Choice.new("monday")
			bhct =  ZOHOCRMSDK::BusinessHours::BreakHoursCustomTiming.new
			bhct.days =  ZOHOCRMSDK::Util::Choice.new("monday")
			business_timing=[]
			business_timing.push("09:00")
			business_timing.push("17:00")
			bhct.business_timing = business_timing
			#
			bhct1 =  ZOHOCRMSDK::BusinessHours::BreakHoursCustomTiming.new
			bhct1.days =  ZOHOCRMSDK::Util::Choice.new("tuesday")
			business_timing1=[]
			business_timing1.push("10:30")
			business_timing1.push("17:00")
			bhct1.business_timing = business_timing1
			#
			bhct2 =  ZOHOCRMSDK::BusinessHours::BreakHoursCustomTiming.new
			bhct2.days =  ZOHOCRMSDK::Util::Choice.new("wednesday")
			business_timing2=[]
			business_timing2.push("11:00")
			business_timing2.push("17:00")
			bhct2.business_timing = business_timing2
			#
			custom_timing=[]
			custom_timing.push(bhct)
			custom_timing.push(bhct1)
			custom_timing.push(bhct2)
			business_hours.custom_timing = custom_timing
			# when sameas_everyday is true
			daily_timing=[]
			daily_timing.push("10:00")
			daily_timing.push("19:00")
			business_hours.daily_timing = daily_timing
			business_hours.type =  ZOHOCRMSDK::Util::Choice.new("custom")
			request.business_hours = business_hours
			response = business_hours_operations.update_business_hours(request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::BusinessHours::ActionWrapper
						action_wrapper = action_handler
						action_response = action_wrapper.business_hours
						if action_response.is_a? ZOHOCRMSDK::BusinessHours::BusinessHoursCreated
							businesshourscreated = action_response
							print "status: " + businesshourscreated.status.value.to_s + "\n"
							print "code: " + businesshourscreated.code.value.to_s + "\n"
							print "details: ".to_s + "\n"
							businesshourscreated.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
							print "message: " + businesshourscreated.message.value.to_s + "\n"
						elsif action_response.is_a? ZOHOCRMSDK::BusinessHours::APIException
							exception = action_response
							print "status: " + exception.status.value.to_s + "\n"
							print "code: " + exception.code.value.to_s + "\n"
							print "details: ".to_s + "\n"
							exception.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
							print "message: " + exception.message.to_s + "\n"
						end
					elsif action_handler.is_a? ZOHOCRMSDK::BusinessHours::APIException
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
				update_business_hours
			rescue Exception => e
				raise e
			end
		end
end
UpdateBusinessHours.initialize_and_call