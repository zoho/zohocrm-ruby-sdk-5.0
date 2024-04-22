require "ZOHOCRMSDK5_0"

class GetFiscalYear
		def self.get_fiscal_year
			fiscalyearoperations =  ZOHOCRMSDK::FiscalYear::FiscalYearOperations.new
			response = fiscalyearoperations.get_fiscal_year
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::FiscalYear::ResponseWrapper
						response_wrapper = response_handler
						fiscal_year = response_wrapper.fiscal_year
						if fiscal_year != nil
							print "fiscal_year start_month :" + fiscal_year.start_month.value.to_s + "\n"
							print "fiscal_year display_based_on :" + fiscal_year.display_based_on.value.to_s + "\n"
							print "fiscal_year Id : " + fiscal_year.id.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::FiscalYear::APIException
						exception = response_handler
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
				environment = ZOHOCRMSDK::DC::USDataCenter.PRODUCTION
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				get_fiscal_year
			rescue Exception => e
				raise e
			end
		end
end
GetFiscalYear.initialize_and_call