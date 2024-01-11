require "ZOHOCRMSDK5_0"

class GetBusinessHours
		def self.get_business_hours
			business_hours_operations =  ZOHOCRMSDK::BusinessHours::BusinessHoursOperations.new("")
			response = business_hours_operations.get_business_hours
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_object = response.data_object
					if response_object.is_a? ZOHOCRMSDK::BusinessHours::ResponseWrapper
						response_wrapper = response_object
						business_hours = response_wrapper.business_hours
						businessdays= business_hours.business_days
						if businessdays != nil
							print "businessdays :".to_s + "\n"
							businessdays.each do |businessday|
								print businessday.value.to_s + "\n"
							end
						else
							print "businessdays : nil".to_s + "\n"
						end
						customtiming= business_hours.custom_timing
						if customtiming != nil
							print "custom_timing :".to_s + "\n"
							customtiming.each do |bhct|
								print "days : " + bhct.days.value.to_s + "\n"
								business_timings= bhct.business_timing
								business_timings.each do |business_timing|
									print "businesstimings : " + business_timing.to_s + "\n"
								end
							end
						else
							print "customtiming : nil".to_s + "\n"
						end
						daily_timings= business_hours.daily_timing
						if daily_timings != nil
							print "daily_timings : ".to_s + "\n"
							daily_timings.each do |daily_timing|
								print daily_timing.to_s + "\n"
							end
						else
							print "daily_timings : nil".to_s + "\n"
						end
						print "week_starts_on : " + business_hours.week_starts_on.value.to_s + "\n"
						print "same_as_everyday : " + business_hours.same_as_everyday.to_s + "\n"
						print "businesshours_id : " + business_hours.id.to_s + "\n"
						print "businesshours_type : " + business_hours.type.value.to_s + "\n"
					elsif response_object.is_a? ZOHOCRMSDK::BusinessHours::APIException
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
				get_business_hours
			rescue Exception => e
				raise e
			end
		end
end
GetBusinessHours.initialize_and_call