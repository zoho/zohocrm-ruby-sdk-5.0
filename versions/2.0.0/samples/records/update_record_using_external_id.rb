require "ZOHOCRMSDK5_0"

class UpdateRecordUsingExternalId
		def self.update_record_using_external_id(module_api_name, external_field_value)
			record_operations =  ZOHOCRMSDK::Record::RecordOperations.new
			request =  ZOHOCRMSDK::Record::BodyWrapper.new
			records=[]
			record1=ZOHOCRMSDK::Record::Record.new
		 # Call addFieldValue method that takes two arguments 1 -> Call Field "." and choose the module_1 from the displayed list and press "." and choose the field name from the displayed list. 2 -> Value
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.City, "city")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Last_name, "last Name")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.First_name, "first Name")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Last_name, "last Name")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Company, "kkrnp")
		 # Call addKeyValue method that takes two arguments 1 -> A string that is the Field's API Name 2 -> Value
			record1.add_key_value("custom_field", "value")
			record1.add_key_value("custom_field_2", "value")
			record1.add_key_value("date__time_2", DateTime.new(2019, 11, 20, 10, 00, 01, "+05:30"))
			record1.add_key_value("date_1", Date.new(2017, 1, 13))
			file_details=[]
			file_detail1 =  ZOHOCRMSDK::Record::FileDetails.new
			file_detail1.file_id__s="ae9c7cefa418a5c326ef21accd646c01e85c34b1b2e7fe45c"
			file_detail1.delete = nil
			file_details.push(file_detail1)
			file_detail2 =  ZOHOCRMSDK::Record::FileDetails.new
			file_detail2.file_id__s="ae9c7cefa418a5c326ef21accd646c01e85c34b1b2e7fe45c"
			file_detail2.delete = nil
			file_details.push(file_detail2)
			file_detail3 =  ZOHOCRMSDK::Record::FileDetails.new
			file_detail3.file_id__s="ae9c7cefa418a5c3256b4b32b984bad140a629d9f4d4fc8e2"
			file_detail3.delete = nil
			file_details.push(file_detail3)
			record1.add_key_value("file__upload", file_details)
			record_owner=ZOHOCRMSDK::Users::MinifiedUser.new
			record_owner.email="abc.d@zoho.com"
			record1.add_key_value("owner", record_owner)
			# Used when GDPR is enabled
			data_consent =  ZOHOCRMSDK::Record::Consent.new
			data_consent.consent_remarks="Approved."
			data_consent.consent_through="Email"
			data_consent.contact_through_email = true
			data_consent.contact_through_social = false
			record1.add_key_value("data__processing__basis__details", data_consent)
			# Subform sample code
			subform_list=[]
			subform=ZOHOCRMSDK::Record::Record.new
			subform.add_key_value("subform FieldAPIName", "field_value")
			subform_list.push(subform)
			record1.add_key_value("subform Name", subform_list)
			deal_name=ZOHOCRMSDK::Record::Record.new
			deal_name.add_field_value(ZOHOCRMSDK::Record::Field::Deals.id, 34770614995070)
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Sales_Orders.Deal_name, deal_name)
			contact_name=ZOHOCRMSDK::Record::Record.new
			contact_name.add_field_value(ZOHOCRMSDK::Record::Field::Contacts.id, 34770614977055)
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Purchase_Orders.Contact_name, contact_name)
			account_name=ZOHOCRMSDK::Record::Record.new
			account_name.add_key_value("name", "automatedaccount")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Quotes.Account_name, account_name)
			inventory_line_item_list=[]
			inventory_line_item=ZOHOCRMSDK::Record::Record.new
			line_item_product =  ZOHOCRMSDK::Record::LineItemProduct.new
			line_item_product.id = 34770615356009
			inventory_line_item.add_key_value("description", "asd")
			inventory_line_item.add_key_value("discount", "5")
			parent_id=ZOHOCRMSDK::Record::Record.new
			parent_id.id = 35240337331017
	#		inventory_line_item.add_key_value("parent__id", 5)
			inventory_line_item.add_key_value("sequence__number", 1)
			lineitem_product =  ZOHOCRMSDK::Record::LineItemProduct.new
			lineitem_product.id = 35240333659082
			inventory_line_item.add_key_value("product__name", line_item_product)
			inventory_line_item.add_key_value("sequence__number", 1)
			inventory_line_item.add_key_value("quantity", 123.2)
			inventory_line_item.add_key_value("tax", 123.2)
			inventory_line_item_list.push(inventory_line_item)
			product_line_taxes=[]
			product_line_tax =  ZOHOCRMSDK::Record::LineTax.new
			product_line_tax.name="MyT2ax1134"
			product_line_tax.percentage = 20.0
			product_line_taxes.push(product_line_tax)
			inventory_line_item.add_key_value("line_tax", product_line_taxes)
			inventory_line_item_list.push(inventory_line_item)
			record1.add_key_value("quoted__items", inventory_line_item_list)
			line_taxes=[]
			line_tax =  ZOHOCRMSDK::Record::LineTax.new
			line_tax.name="MyT2ax1134"
			line_tax.percentage = 20.0
			line_taxes.push(line_tax)
			record1.add_key_value("$line_tax", line_taxes)
			tag_list=[]
			tag =  ZOHOCRMSDK::Tags::Tag.new
			tag.name="Testtask1"
			tag_list.push(tag)
			record1.tag = tag_list
			# Add Record instance to the list
			records.push(record1)
			request.data = records
			trigger=[]
			trigger.push("approval")
			trigger.push("workflow")
			trigger.push("blueprint")
			request.trigger = trigger
			header_instance =  ZOHOCRMSDK::HeaderMap.new
			header_instance.add(ZOHOCRMSDK::Record::RecordOperations::UpdateRecordHeader.X_external, "leads.External")
			response = record_operations.update_record_using_external_id(external_field_value, module_api_name, request, header_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::Record::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.data
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::Record::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.value.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::Record::APIException
								exception = action_response
								print "status: " + exception.status.value.to_s + "\n"
								print "code: " + exception.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								exception.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + exception.message.value.to_s + "\n"
							end
						end
					elsif action_handler.is_a? ZOHOCRMSDK::Record::APIException
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
				module_api_name = "leads"
				external_field_value = "test_external_lead11"
				update_record_using_external_id(module_api_name, external_field_value)
			rescue Exception => e
				raise e
			end
		end
end
UpdateRecordUsingExternalId.initialize_and_call