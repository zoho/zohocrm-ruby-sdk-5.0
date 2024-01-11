require "ZOHOCRMSDK5_0"

class GetHoliday
		def self.get_holiday(id)
			holidaysoperations =  ZOHOCRMSDK::Holidays::HolidaysOperations.new("")
			response = holidaysoperations.get_holiday(id)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Holidays::ResponseWrapper
						response_wrapper = response_handler
						holidays= response_wrapper.holidays
						if holidays != nil
							print "holidays : ".to_s + "\n"
							holidays.each do |holiday|
								print "hoilday ID: " + holiday.id.to_s + "\n"
								print "name: " + holiday.name.to_s + "\n"
								print "date: " + holiday.date.to_s + "\n"
								print "year: " + holiday.year.to_s + "\n"
								print "type: " + holiday.type.to_s + "\n"
								shifthour = holiday.shift_hour
								if shifthour != nil
									print "shifthour: ".to_s + "\n"
									print "name : " + shifthour.name.to_s + "\n"
									print "shifthour id : " + shifthour.id.to_s + "\n"
								end
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Holidays::APIException
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
				id = 623710325009
				get_holiday(id)
			rescue Exception => e
				raise e
			end
		end
end
GetHoliday.initialize_and_call
