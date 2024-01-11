require "ZOHOCRMSDK5_0"

class Accounts
		def self.create_accounts(module_1)
			record_operations =  ZOHOCRMSDK::Record::RecordOperations.new
			body_wrapper =  ZOHOCRMSDK::Record::BodyWrapper.new
			records=[]
			record1=ZOHOCRMSDK::Record::Record.new
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Account_name, "new Account")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Rating,  ZOHOCRMSDK::Util::Choice.new("active"))
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Phone, "111111")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Account_site, "www.account.com")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Fax, "fax")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Website, nil)
			parent_account=ZOHOCRMSDK::Record::Record.new
			parent_account.id = 4230432933
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Parent_account, parent_account)
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Account_number, 121121)
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Account_type,  ZOHOCRMSDK::Util::Choice.new("customer"))
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Annual_revenue, 2121.1)
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Employees, 100)
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Industry,  ZOHOCRMSDK::Util::Choice.new("technology"))
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.SIC_code, nil)
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Ownership,  ZOHOCRMSDK::Util::Choice.new("private"))
			# Address info of Account
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Billing_city, "city")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Billing_code, "12345")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Billing_country, "counbegin")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Billing_state, "state")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Billing_street, "street")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Shipping_city, "shipping city")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Shipping_code, "shipping code")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Shipping_country, "shipping counbegin")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Shipping_state, "shipping state")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Shipping_street, "shipping street")
			#
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Accounts.Description, "description")
			# Used when GDPR is enabled
			data_consent =  ZOHOCRMSDK::Record::Consent.new
			data_consent.consent_remarks="Approved."
			data_consent.consent_through="Email"
			data_consent.contact_through_email = true
			data_consent.contact_through_social = false
			data_consent.contact_through_phone = true
			data_consent.contact_through_survey = true
			data_consent.consent_date = Date.new(2023, 10, 11)
			data_consent.data_processing_basis="Obtained"
			record1.add_key_value("data__processing__basis__details", data_consent)
			# for MultiSelectLookUp/custom MultiSelectLookUp
			multi_records=[]
			record=ZOHOCRMSDK::Record::Record.new
			linking_record=ZOHOCRMSDK::Record::Record.new
			record.add_key_value("id", 440248884001)
			linking_record.add_key_value("msl", record)
			multi_records.push(linking_record)
			record1.add_key_value("msl", multi_records)
			# for Custom Fields
			record1.add_key_value("external", "value12345")
			record1.add_key_value("custom_field", "value")
			record1.add_key_value("date_time_2", DateTime.new(2023, 11, 20, 10, 00, 01, "+05:30"))
			record1.add_key_value("date_1", Date.new(2021, 1, 13))
			record1.add_key_value("subject", "automated_sdk")
			record1.add_key_value("product_name", "automated_sdk")
			file_details=[]
			file_detail1 =  ZOHOCRMSDK::Record::FileDetails.new
			file_detail1.file_id__s="ae9c7cefa418aec1d6a5cc2d9ab35c32a6ae23db0bd44183d280"
			file_details.push(file_detail1)
			file_detail2 =  ZOHOCRMSDK::Record::FileDetails.new
			file_detail2.file_id__s="ae9c7cefa418aec1d6a5cc2d9ab35c32e0ca878a934519e6cdb2"
			file_details.push(file_detail2)
			record1.add_key_value("file__upload", file_details)
			# for Custom User LookUp
			user=ZOHOCRMSDK::Users::MinifiedUser.new
			user.id = 440248254001
			record1.add_key_value("user_1", user)
			# for Custom LookUp
			data=ZOHOCRMSDK::Record::Record.new
			data.id = 440248774074
			record1.add_key_value("lookup_2", data)
			# for Custom pick_list
			record1.add_key_value("pick",  ZOHOCRMSDK::Util::Choice.new("true"))
			# for Custom MultiSelect
			record1.add_key_value("multiselect",  [ZOHOCRMSDK::Util::Choice.new("option 1"), ZOHOCRMSDK::Util::Choice.new("option 2")])
			# Subform sample code
			subform_list=[]
			subform=ZOHOCRMSDK::Record::Record.new
			subform.add_key_value("customfield", "customvalue")
			user1=ZOHOCRMSDK::Users::MinifiedUser.new
			user1.id = 440248254001
			subform.add_key_value("userfield", user1)
			subform_list.push(subform)
			record1.add_key_value("subform_2", subform_list)
			tag_list=[]
			tag =  ZOHOCRMSDK::Tags::Tag.new
			tag.name="Testtask"
			tag_list.push(tag)
			record1.tag = tag_list
			# Add Record instance to the list
			records.push(record1)
			body_wrapper.data = records
			trigger=[]
			trigger.push("approval")
			trigger.push("workflow")
			trigger.push("blueprint")
			body_wrapper.trigger = trigger
			body_wrapper.lar_id="3477061087515"
			header_instance =  ZOHOCRMSDK::HeaderMap.new
			# header_instance.add(ZOHOCRMSDK::Record::RecordOperations::CreateRecordsHeader.X_external, "quotes.Quoted_Items.Product_Name.Products_External")
			response = record_operations.create_records(module_1, body_wrapper, header_instance)
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
				module_api_name = "accounts"
				create_accounts(module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
Accounts.initialize_and_call