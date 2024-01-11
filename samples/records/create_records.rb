require "ZOHOCRMSDK5_0"

class CreateRecords
		def self.create_records(module_api_name)
			record_operations =  ZOHOCRMSDK::Record::RecordOperations.new
			body_wrapper =  ZOHOCRMSDK::Record::BodyWrapper.new
			records=[]
			record1=ZOHOCRMSDK::Record::Record.new
		 # Call addFieldValue method that takes two arguments 1 -> Call Field "." and choose the module_1 from the displayed list and press "." and choose the field name from the displayed list. 2 -> Value
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Last_name, "last Name")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.First_name, "first Name")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Company, "company Name")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Annual_revenue, 1221.2)
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Lead_status,  ZOHOCRMSDK::Util::Choice.new("not Contacted"))
			deal_name=ZOHOCRMSDK::Record::Record.new
			deal_name.add_field_value(ZOHOCRMSDK::Record::Field::Deals.id, 347706111383007)
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Sales_Orders.Deal_name, deal_name)
			contact_name=ZOHOCRMSDK::Record::Record.new
			contact_name.add_field_value(ZOHOCRMSDK::Record::Field::Contacts.id, 347706111853001)
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Purchase_Orders.Contact_name, contact_name)
			account_name=ZOHOCRMSDK::Record::Record.new
			account_name.add_key_value("name", "automatedaccount")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Quotes.Account_name, account_name)
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Sales_Orders.Account_name, nil)
			inventory_line_item_list=[]
			inventory_line_item=ZOHOCRMSDK::Record::Record.new
			line_item_product =  ZOHOCRMSDK::Record::LineItemProduct.new
			line_item_product.id = 440248954344
			line_item_product.add_key_value("products__external", "product_external")
			inventory_line_item.add_key_value("description", "asd")
			inventory_line_item.add_key_value("discount", "5")
			record1.add_key_value("singleline", "customfield")
			inventory_line_item.add_key_value("desc", "customfield")
			parent_id=ZOHOCRMSDK::Record::Record.new
			parent_id.id = 35240337331017
			inventory_line_item.add_key_value("parent__id", parent_id)
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Quotes.Subject, "new Quote")
			lineitem_product =  ZOHOCRMSDK::Record::LineItemProduct.new
			lineitem_product.id = 440248954344
			inventory_line_item.add_key_value("product__name", lineitem_product)
			inventory_line_item.add_key_value("sequence__number", 2)
			inventory_line_item.add_key_value("quantity", 123.2)
			inventory_line_item.add_key_value("tax", 123.2)
			inventory_line_item_list.push(inventory_line_item)
			product_line_taxes=[]
			product_line_tax =  ZOHOCRMSDK::Record::LineTax.new
			product_line_tax.name="MyTax1134"
			product_line_tax.value = 0.0
			product_line_tax.id = 347706110743003
			product_line_tax.percentage = 15.0
			product_line_taxes.push(product_line_tax)
			inventory_line_item.add_key_value("line__tax", product_line_taxes)
			inventory_line_item_list.push(inventory_line_item)
			record1.add_key_value("quoted__items", inventory_line_item_list)
			line_taxes=[]
			line_tax =  ZOHOCRMSDK::Record::LineTax.new
			line_tax.name="MyTax1134"
			line_tax.percentage = 20.0
			line_taxes.push(line_tax)
			record1.add_key_value("$line_tax", line_taxes)
			#_tasks
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Tasks.Description, "test Task")
			record1.add_key_value("currency",  ZOHOCRMSDK::Util::Choice.new("inr"))
			remind_at =  ZOHOCRMSDK::Record::RemindAt.new
		remind_at.alarm="ACTION=EMAILANDPOPUPTRIGGER=DATE-TIME:2020-07-03T12:30:00+05:30"
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Tasks.Remind_at, remind_at)
			who_id=ZOHOCRMSDK::Record::Record.new
			who_id.id = 34770614977055
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Tasks.Who_id, who_id)
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Tasks.Status,  ZOHOCRMSDK::Util::Choice.new("waiting on someone else"))
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Tasks.Due_date, Date.new(2021, 1, 13))
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Tasks.Priority,  ZOHOCRMSDK::Util::Choice.new("high"))
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Tasks.Subject, "email1")
			record1.add_key_value("$se_module", "accounts")
			what_id=ZOHOCRMSDK::Record::Record.new
			what_id.id = 3477061207118
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Tasks.What_id, what_id)
			recurring_activity =  RecurringActivity.new
		recurring_activity.rrule="FREQ=DAILYINTERVAL=10UNTIL=2023-08-14DTSTART=2020-07-03"
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Events.Recurring_activity, recurring_activity)
			#
			# Events
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Events.Description, "test Events")
			start_date_time = DateTime.new(2020, 01, 02, 10, 00, 00, "+05:30")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Events.Start_datetime, start_date_time)
			participants=[]
			participant1 =  ZOHOCRMSDK::Record::Participants.new
			participant1.email="abc@gmail.com"
			participant1.type="email"
			participant1.id = 34770615902017
			participants.push(participant1)
			participant2 =  ZOHOCRMSDK::Record::Participants.new
			participant2.add_key_value("participant", "34770617425")
			participant2.add_key_value("type", "lead")
			participants.push(participant2)
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Events.Participants, participants)
			record1.add_key_value("$send_notification", true)
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Events.Event_title, "new Automated Event")
			enddatetime = DateTime.new(2020, 05, 02, 10, 00, 00, "+05:30")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Events.End_datetime, enddatetime)
			reminder_list=[]
			remind_at1 =  ZOHOCRMSDK::Record::Reminder.new
			remind_at1.period="minutes"
			remind_at1.unit = 15
			reminder_list.push(remind_at1)
		remind_at1 =  ZOHOCRMSDK::Record::Reminder.new
			remind_at1.period="days"
			remind_at1.unit = 1
			remind_at1.time="10.30"
			reminder_list.push(remind_at1)
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Events.Remind_at, reminder_list)
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Events.Check_in_status, "planned")
			record1.add_key_value("$se_module", "leads")
			what_id1=ZOHOCRMSDK::Record::Record.new
			what_id1.id = 34770614381002
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Events.What_id, what_id1)
			record1.add_key_value("currency",  ZOHOCRMSDK::Util::Choice.new("usd"))
			pricing_details=[]
			pricing_detail1 = ZOHOCRMSDK::Record::PricingDetails.new
			pricing_detail1.from_range = 1.0
			pricing_detail1.to_range = 5.0
			pricing_detail1.discount = 2.0
			pricing_details.push(pricing_detail1)
			pricing_detail2 =  ZOHOCRMSDK::Record::PricingDetails.new
			pricing_detail2.add_key_value("from_range", 6.0)
			pricing_detail2.add_key_value("to_range", 11.0)
			pricing_detail2.add_key_value("discount", 3.0)
			pricing_details.push(pricing_detail2)
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Price_Books.Pricing_details, pricing_details)
			record1.add_key_value("email", "abc.d@zoho.com")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Price_Books.Description, "test")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Price_Books.Price_book_name, "book_name")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Price_Books.Pricing_model,  ZOHOCRMSDK::Util::Choice.new("flat"))
			
			# Used when GDPR is enabled
			data_consent =  ZOHOCRMSDK::Record::Consent.new
			data_consent.consent_remarks="Approved."
			data_consent.consent_through="Email"
			data_consent.contact_through_email = true
			data_consent.contact_through_social = false
			data_consent.contact_through_phone = true
			data_consent.contact_through_survey = true
			data_consent.consent_date(Date.new(2023, 10, 11))
			data_consent.data_processing_basis="Obtained"
			record1.add_key_value("data__processing__basis__details", data_consent)
		 # Call addKeyValue method that takes two arguments 1 -> A string that is the Field's API Name 2 -> Value
			record1.add_key_value("external", "value12345")
			record1.add_key_value("custom_field", "value")
			record1.add_key_value("date__time_2", DateTime.new(2023, 11, 20, 10, 00, 01, "+05:30"))
			record1.add_key_value("date_1", Date.new(2021, 1, 13))
			record1.add_key_value("subject", "automated_sdk")
			record1.add_key_value("product__name", "automated_sdk")
			file_details=[]
			file_detail1 =  ZOHOCRMSDK::Record::FileDetails.new
			file_detail1.file_id__s="ae9c7cefa418aec1d6a5cc2d9ab35c32a6ae23bd44183d280"
			file_details.push(file_detail1)
			file_detail2 =  ZOHOCRMSDK::Record::FileDetails.new
			file_detail2.file_id__s="ae9c7cefa418aec1d6a5cc27321b5b4ca878a934519e6cdb2"
			file_details.push(file_detail2)
			record1.add_key_value("file__upload", file_details)
			# for Custom User LookUp
			user=ZOHOCRMSDK::Users::MinifiedUser.new
			user.id = 440248254001
			record1.add_key_value("user_1", user)
			record1.add_key_value("new", DateTime.now)
			# for Custom LookUp
			data=ZOHOCRMSDK::Record::Record.new
			data.id = 440248774074
			record1.add_key_value("lookup_2", data)
			# for Custom pick_list
			record1.add_key_value("pick",  ZOHOCRMSDK::Util::Choice.new("true"))
			# for Custom MultiSelect
			record1.add_key_value("multiselect", [ZOHOCRMSDK::Util::Choice.new("option 1"),  ZOHOCRMSDK::Util::Choice.new("option 2")])
			# Subform sample code
			subform_list=[]
			subform=ZOHOCRMSDK::Record::Record.new
			subform.add_key_value("customfield", "customvalue")
			user1=ZOHOCRMSDK::Users::MinifiedUser.new
			user1.id = 440248254001
			subform.add_key_value("userfield", user1)
			subform_list.push(subform)
			record1.add_key_value("subform_2", subform_list)
			# sample code for MultiSelectLookUp Field
			multi_records=[]
			record=ZOHOCRMSDK::Record::Record.new
			linking_record=Record.new
			record.add_key_value("id", 440248884001)
			linking_record.add_key_value("msl", record)
			multi_records.push(linking_record)
			record1.add_key_value("msl", multi_records)
			tag_list=[]
			tag =  ZOHOCRMSDK::Record::Tag.new
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
			#header_instance.add(CreateRecordsHeader.X_external, "quotes.Quoted_Items.Product_Name.Products_External")
			response = record_operations.create_records(module_api_name, body_wrapper, header_instance)
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
				create_records(module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
CreateRecords.initialize_and_call