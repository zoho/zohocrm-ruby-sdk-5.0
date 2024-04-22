require "ZOHOCRMSDK5_0"

class ConvertLead
		def self.convert_lead(lead_id)
			record_operations =  ZOHOCRMSDK::Record::RecordOperations.new
			request =  ZOHOCRMSDK::Record::ConvertBodyWrapper.new
			data=[]
			record1 =  ZOHOCRMSDK::Record::LeadConverter.new
			record1.overwrite = true
			record1.notify_lead_owner = true
			record1.notify_new_entity_owner = true
			accounts=ZOHOCRMSDK::Record::Record.new
			accounts.id = 347706112263002
			record1.accounts = accounts
			contacts=ZOHOCRMSDK::Record::Record.new
			contacts.id = 347706112263005
			record1.contacts = contacts
			assign_to =  ZOHOCRMSDK::Record::MinifiedUser.new
			assign_to.id = 3477061173021
			record1.assign_to = assign_to
			deals=ZOHOCRMSDK::Record::Record.new
		 # Call addFieldValue method that takes two arguments 1 -> Call Field "." and choose the module_1 from the displayed list and press "." and choose the field name from the displayed list. 2 -> Value
			deals.add_field_value(ZOHOCRMSDK::Record::Field::Deals.Deal_name, "deal_name")
			deals.add_field_value(ZOHOCRMSDK::Record::Field::Deals.Description, "deals description")
			deals.add_field_value(ZOHOCRMSDK::Record::Field::Deals.Closing_date, Date.new(2021, 1, 13))
			deals.add_field_value(ZOHOCRMSDK::Record::Field::Deals.Stage,  ZOHOCRMSDK::Util::Choice.new("closed Won"))
			deals.add_field_value(ZOHOCRMSDK::Record::Field::Deals.Amount, 50.7)
		 # Call addKeyValue method that takes two arguments 1 -> A string that is the Field's API Name 2 -> Value
			deals.add_key_value("custom_field", "value")
			deals.add_key_value("pipeline",  ZOHOCRMSDK::Util::Choice.new("qualification"))
			record1.deals = deals
			data.push(record1)
			request.data = data
			response = record_operations.convert_lead(lead_id, request)
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
				lead_id = 34770616603276
				convert_lead(lead_id)
			rescue Exception => e
				raise e
			end
		end
end
ConvertLead.initialize_and_call