require "ZOHOCRMSDK5_0"

class MassConvert
		def self.mass_convert
			mass_convert_operations = ZOHOCRMSDK::MassConvert::MassConvertOperations.new
			body_wrapper =  ZOHOCRMSDK::MassConvert::Convert.new
			body_wrapper.ids = [347706116634119]
			deals=ZOHOCRMSDK::Record::Record.new
			deals.add_field_value(ZOHOCRMSDK::Record::Field::Deals.Amount, 1)
			deals.add_field_value(ZOHOCRMSDK::Record::Field::Deals.Deal_name, "v4_sdk")
			deals.add_field_value(ZOHOCRMSDK::Record::Field::Deals.Closing_date, Date.new(2022, 12, 13))
			deals.add_field_value(ZOHOCRMSDK::Record::Field::Deals.Pipeline,  ZOHOCRMSDK::Util::Choice.new("standard(Standard)"))
			deals.add_field_value(ZOHOCRMSDK::Record::Field::Deals.Stage,  ZOHOCRMSDK::Util::Choice.new("closed Won"))
			body_wrapper.deals = deals
			carryovertags =  ZOHOCRMSDK::MassConvert::MoveAttachmentsTo.new
			carryovertags.id = 3652397002179
			carryovertags.api_name="Contacts"
			body_wrapper.carry_over_tags = [carryovertags]
			related_modules=[]
			relatedmodule =  ZOHOCRMSDK::MassConvert::RelatedModule.new
			relatedmodule.api_name="Tasks"
			relatedmodule.id = 3652397002193
			related_modules.push(relatedmodule)
			body_wrapper.related_modules = related_modules
			assign_to =  ZOHOCRMSDK::MassConvert::AssignTo.new
			assign_to.id = 3652397281001
			body_wrapper.assign_to = assign_to
			move_attachments_to =  ZOHOCRMSDK::MassConvert::MoveAttachmentsTo.new
			move_attachments_to.api_name="Contacts"
			move_attachments_to.id = 3652397002179
	#		body_wrapper.move_attachments_to = move_attachments_to
			response = mass_convert_operations.mass_convert(body_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::MassConvert::SuccessResponse
						success_response = action_handler
						print "status: " + success_response.status.value.to_s + "\n"
						print "code: " + success_response.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						success_response.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + success_response.message.to_s + "\n"
					elsif action_handler.is_a? ZOHOCRMSDK::MassConvert::APIException
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
				mass_convert
			rescue Exception => e
				raise e
			end
		end
end
MassConvert.initialize_and_call