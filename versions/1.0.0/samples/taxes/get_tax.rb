require "ZOHOCRMSDK5_0"

class GetTax
		def self.get_tax(tax_id)
			taxes_operations =  ZOHOCRMSDK::Taxes::TaxesOperations.new
			response = taxes_operations.get_tax(tax_id)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Taxes::ResponseWrapper
						response_wrapper = response_handler
						org_tax = response_wrapper.org_taxes
						taxes= org_tax.taxes
						taxes.each do |tax|
							print "tax DisplayLabel: " + tax.display_label.to_s + "\n"
							print "tax Name: " + tax.name.to_s + "\n"
							print "tax ID: " + tax.id.to_s + "\n"
							print "tax Value: " + tax.value.to_s + "\n"
						end
						preference = org_tax.preference
						if preference != nil
							print "preference AutoPopulateTax: " + preference.auto_populate_tax.to_s + "\n"
							print "preference ModifyTaxRates: " + preference.modify_tax_rates.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Taxes::APIException
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
				environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				tax_id = 34770616054012
				get_tax(tax_id)
			rescue Exception => e
				raise e
			end
		end
end
GetTax.initialize_and_call