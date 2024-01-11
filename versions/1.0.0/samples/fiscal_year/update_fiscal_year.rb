require "ZOHOCRMSDK5_0"

class UpdateFiscalYear
		def self.update_fiscal_year
			fiscalyearoperations =  ZOHOCRMSDK::FiscalYear::FiscalYearOperations.new
			request =  ZOHOCRMSDK::FiscalYear::BodyWrapper.new
			fiscal_year =  ZOHOCRMSDK::FiscalYear::Year.new
			fiscal_year.start_month =  ZOHOCRMSDK::Util::Choice.new("july")
			fiscal_year.display_based_on =  ZOHOCRMSDK::Util::Choice.new("start_month")
			request.fiscal_year = fiscal_year
			response = fiscalyearoperations.update_fiscal_year(request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::FiscalYear::ActionWrapper
						action_wrapper = action_handler
						action_response = action_wrapper.fiscal_year
						if action_response.is_a? ZOHOCRMSDK::FiscalYear::SuccessResponse
							success_response = action_response
							print "status: " + success_response.status.value.to_s + "\n"
							print "code: " + success_response.code.value.to_s + "\n"
							print "details: ".to_s + "\n"
							success_response.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
							print "message: " + success_response.message.value.to_s + "\n"
						elsif action_response.is_a? ZOHOCRMSDK::FiscalYear::APIException
							exception = action_response
							print "status: " + exception.status.value.to_s + "\n"
							print "code: " + exception.code.value.to_s + "\n"
							print "details: ".to_s + "\n"
							exception.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
							print "message: " + exception.message.value.to_s + "\n"
						end
					elsif action_handler.is_a? ZOHOCRMSDK::FiscalYear::APIException
						exception = action_handler
						print "status: " + exception.status.value.to_s + "\n"
						print "code: " + exception.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						if exception.details != nil
							exception.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
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
				update_fiscal_year
			rescue Exception => e
				raise e
			end
		end
end
UpdateFiscalYear.initialize_and_call