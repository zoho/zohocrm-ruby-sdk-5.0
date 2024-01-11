require "ZOHOCRMSDK5_0"

class GetAvailableCurrencies
		def self.get_available_currencies
			currencies_operations =  ZOHOCRMSDK::AvailableCurrencies::AvailableCurrenciesOperations.new
			response = currencies_operations.get_available_currencies
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::AvailableCurrencies::ResponseWrapper
						response_wrapper = response_handler
						currencies_list= response_wrapper.available_currencies
						currencies_list.each do |currency|
							print "currency DisplayValue: " + currency.display_value.to_s + "\n"
							print "currency DecimalSeparator: " + currency.decimal_separator.to_s + "\n"
							print "currency Symbol: " + currency.symbol.to_s + "\n"
							print "currency ThousandSeparator: " + currency.thousand_separator.to_s + "\n"
							print "currency IsoCode: " + currency.iso_code.to_s + "\n"
							print "currency DisplayName: " + currency.display_name.to_s + "\n"
							print "currency DecimalPlaces: " + currency.decimal_places.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::AvailableCurrencies::APIException
						exception = response_handler
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
				get_available_currencies
			rescue Exception => e
				raise e
			end
		end
end
GetAvailableCurrencies.initialize_and_call