require "ZOHOCRMSDK5_0"

class UpdateTaxes
		def self.update_taxes
			taxes_operations =  ZOHOCRMSDK::Taxes::TaxesOperations.new
			request =  ZOHOCRMSDK::Taxes::BodyWrapper.new
			org_tax =  ZOHOCRMSDK::Taxes::OrgTax.new
			tax_list=[]
			tax1=ZOHOCRMSDK::Taxes::Tax.new
			tax1.id = 347706114923002
			tax1.name="MyTax1134313223"
			tax1.sequence_number = 1
			tax1.value = 15.04
	#		tax1.delete = nil
			tax_list.push(tax1)
			org_tax.taxes = tax_list
			preference =  ZOHOCRMSDK::Taxes::Preference.new
			preference.auto_populate_tax = false
			preference.modify_tax_rates = false
			org_tax.preference = preference
			request.org_taxes = org_tax
			response = taxes_operations.update_taxes(request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::Taxes::ActionWrapper
						action_wrapper = action_handler
						action_response = action_wrapper.org_taxes
						if action_response.is_a? ZOHOCRMSDK::Taxes::SuccessResponse
							success_response = action_response
							print "status: " + success_response.status.value.to_s + "\n"
							print "code: " + success_response.code.value.to_s + "\n"
							print "details: ".to_s + "\n"
							success_response.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
							print "message: " + success_response.message.value.to_s + "\n"
						elsif action_response.is_a? ZOHOCRMSDK::Taxes::APIException
							exception = action_response
							print "status: " + exception.status.value.to_s + "\n"
							print "code: " + exception.code.value.to_s + "\n"
							print "details: ".to_s + "\n"
							exception.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
							print "message: " + exception.message.value.to_s + "\n"
						end
					elsif action_handler.is_a? APIException
						exception = action_handler
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
				update_taxes
			rescue Exception => e
				raise e
			end
		end
end
UpdateTaxes.initialize_and_call