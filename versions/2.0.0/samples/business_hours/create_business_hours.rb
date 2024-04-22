require "ZOHOCRMSDK5_0"

class CreateBusinessHours
		def self.create_business_hours
			business_hours_operations =  ZOHOCRMSDK::BusinessHours::BusinessHoursOperations.new("x_crm_org")
			request =  ZOHOCRMSDK::BusinessHours::BodyWrapper.new
			business_hours =  ZOHOCRMSDK::BusinessHours::BusinessHours.new
			businessdays=[]
			businessdays.push( ZOHOCRMSDK::Util::Choice.new("Monday"))
			business_hours.business_days = businessdays
			business_hours.week_starts_on =  ZOHOCRMSDK::Util::Choice.new("Monday")
			bhct =  ZOHOCRMSDK::BusinessHours::BreakHoursCustomTiming.new
			bhct.days =  ZOHOCRMSDK::Util::Choice.new("Monday")
			business_timing=[]
			business_timing.push("10:00")
			business_timing.push("11:00")
			bhct.business_timing = business_timing
			custom_timing=[]
			custom_timing.push(bhct)
			business_hours.custom_timing = custom_timing
			business_hours.same_as_everyday = false
			# when sameas_every_day is true
			daily_timing=[]
			daily_timing.push( ZOHOCRMSDK::Util::Choice.new("10:00"))
			daily_timing.push( ZOHOCRMSDK::Util::Choice.new("11:00"))

			business_hours.type =  ZOHOCRMSDK::Util::Choice.new("custom")
			request.business_hours = business_hours
			response = business_hours_operations.create_business_hours(request)
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
							businesshourscreated.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
							print "message: " + businesshourscreated.message.to_s + "\n"
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
				create_business_hours
			rescue Exception => e
				raise e
			end
		end
end
CreateBusinessHours.initialize_and_call