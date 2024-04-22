require "ZOHOCRMSDK5_0"

class GetCurrencies
		def self.get_currencies
			currencies_operations =  ZOHOCRMSDK::Currencies::CurrenciesOperations.new
			response = currencies_operations.get_currencies
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Currencies::BodyWrapper
						response_wrapper = response_handler
						currencies_list= response_wrapper.currencies
						currencies_list.each do |currency|
							print "currency Symbol: " + currency.symbol.to_s + "\n"
							print "currency CreatedTime: " + currency.created_time.to_s + "\n"
							print "currency IsActive: " + currency.is_active.to_s + "\n"
							print "currency ExchangeRate: " + currency.exchange_rate.to_s + "\n"
							format = currency.format
							if format != nil
								print "currency Format DecimalSeparator: " + format.decimal_separator.value.to_s + "\n"
								print "currency Format ThousandSeparator: " + format.thousand_separator.value.to_s + "\n"
								print "currency Format DecimalPlaces: " + format.decimal_places.value.to_s + "\n"
							end
							created_by= currency.created_by
							if created_by != nil
								print "currency CreatedBy User-Name: " + created_by.name.to_s + "\n"
								print "currency CreatedBy User-ID: " + created_by.id.to_s + "\n"
							end
							print "currency PrefixSymbol: " + currency.prefix_symbol.to_s + "\n"
							print "currency IsBase: " + currency.is_base.to_s + "\n"
							print "currency ModifiedTime: " + currency.modified_time.to_s + "\n"
							print "currency Name: " + currency.name.to_s + "\n"
							modified_by= currency.modified_by
							if modified_by != nil
								print "currency ModifiedBy User-Name: " + modified_by.name.to_s + "\n"
								print "currency ModifiedBy User-ID: " + modified_by.id.to_s + "\n"
							end
							print "currency Id: " + currency.id.to_s + "\n"
							print "currency IsoCode: " + currency.iso_code.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Currencies::APIException
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
				get_currencies
			rescue Exception => e
				raise e
			end
		end
end
GetCurrencies.initialize_and_call