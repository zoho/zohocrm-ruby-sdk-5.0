require "ZOHOCRMSDK5_0"

class UpdateBaseCurrency
		def self.update_base_currency
			currencies_operations =  ZOHOCRMSDK::Currencies::CurrenciesOperations.new
			body_wrapper =  ZOHOCRMSDK::Currencies::BaseCurrencyWrapper.new
			currency=ZOHOCRMSDK::Currencies::BaseCurrency.new
			currency.prefix_symbol = true
	#		currency.symbol="Af"
			currency.exchange_rate="5.0"
			currency.id = 3477061005657003
			currency.is_active = true
			format =  ZOHOCRMSDK::Currencies::Format.new
			format.decimal_separator =  ZOHOCRMSDK::Util::Choice.new("period")
			format.thousand_separator =  ZOHOCRMSDK::Util::Choice.new("comma")
			format.decimal_places =  ZOHOCRMSDK::Util::Choice.new("2")
			currency.format = format
			body_wrapper.base_currency = currency
			response = currencies_operations.update_base_currency(body_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					base_currency_action_handler = response.data_object
					if base_currency_action_handler.is_a? ZOHOCRMSDK::Currencies::BaseCurrencyActionWrapper
						base_currency_action_wrapper = base_currency_action_handler
						action_response = base_currency_action_wrapper.base_currency
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
					elsif base_currency_action_handler.is_a? ZOHOCRMSDK::Currencies::APIException
						exception = base_currency_action_handler
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
				update_base_currency
			rescue Exception => e
				raise e
			end
		end
end
UpdateBaseCurrency.initialize_and_call
