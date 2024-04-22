require "ZOHOCRMSDK5_0"

class UpdateCurrencies
		def self.update_currencies
			currencies_operations =  ZOHOCRMSDK::Currencies::CurrenciesOperations.new
			body_wrapper =  ZOHOCRMSDK::Currencies::BodyWrapper.new
			currencies=[]
			currency=ZOHOCRMSDK::Currencies::Currency.new
	#		currency.prefix_symbol = true
			currency.id = 34770617368016
			currency.exchange_rate="5.0"
			currency.is_active = true
			format =  ZOHOCRMSDK::Currencies::CurrencyFormat.new
			format.decimal_separator =  ZOHOCRMSDK::Util::Choice.new("period")
			format.thousand_separator =  ZOHOCRMSDK::Util::Choice.new("comma")
			format.decimal_places =  ZOHOCRMSDK::Util::Choice.new("2")
			currency.format = format
			currencies.push(currency)
			body_wrapper.currencies = currencies
			response = currencies_operations.update_currencies(body_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::Currencies::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.currencies
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::Currencies::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::Currencies::APIException
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
					elsif action_handler.is_a? ZOHOCRMSDK::Currencies::APIException
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
				update_currencies
			rescue Exception => e
				raise e
			end
		end
end
UpdateCurrencies.initialize_and_call