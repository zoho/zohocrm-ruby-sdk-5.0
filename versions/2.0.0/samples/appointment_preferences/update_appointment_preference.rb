require "ZOHOCRMSDK5_0"
	

class UpdateAppointmentPreference
		def self.update_appointment_preference
			appointment_preference_operations =  ZOHOCRMSDK::AppointmentPreference::AppointmentPreferenceOperations.new
			request =  ZOHOCRMSDK::AppointmentPreference::BodyWrapper.new
			appointment_preferences = ZOHOCRMSDK::AppointmentPreference::AppointmentPreference.new
			appointment_preferences.allow_booking_outside_businesshours = false
			appointment_preferences.allow_booking_outside_service_availability = true
			appointment_preferences.when_appointment_completed =  Choice.new("create_deal")
			appointment_preferences.when_duration_exceeds =  Choice.new("ask_appointment_provider_to_complete")
			appointment_preferences.show_job_sheet = true
			deal_record_configuration={}
			layout =  ZOHOCRMSDK::AppointmentPreference::Layout.new
			layout.api_name="Standard"
			layout.id = 4402480173
			deal_record_configuration.store("layout", layout)
			mappings=[]
			field_mappings =  ZOHOCRMSDK::AppointmentPreference::FieldMappings.new
			field_mappings.type =  ZOHOCRMSDK::Util::Choice.new("static")
			field_mappings.value="Closed Won"
			field =  ZOHOCRMSDK::AppointmentPreference::Field.new
			field.api_name="Stage"
			field.id = 440248001308017
			field_mappings.field = field
			mappings.push(field_mappings)
			deal_record_configuration.store("field_mappings", mappings)
			appointment_preferences.deal_record_configuration = deal_record_configuration
			request.appointment_preferences = appointment_preferences
			response = appointment_preference_operations.update_appointment_preference(request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::AppointmentPreference::ActionWrapper
						action_wrapper = action_handler
						action_response = action_wrapper.appointment_preferences
						if action_response.is_a? ZOHOCRMSDK::AppointmentPreference::SuccessResponse
							success_response = action_response
							print "status: " + success_response.status.value.to_s + "\n"
							print "code: " + success_response.code.value.to_s + "\n"
							print "details: ".to_s + "\n"
							success_response.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
							print "message: " + success_response.message.value.to_s + "\n"
						elsif action_response.is_a? ZOHOCRMSDK::AppointmentPreference::APIException
							exception = action_response
							print "status: " + exception.status.value.to_s + "\n"
							print "code: " + exception.code.value.to_s + "\n"
							print "details: ".to_s + "\n"
							exception.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
							print "message: " + exception.message.to_s + "\n"
						end
					elsif action_handler.is_a? ZOHOCRMSDK::AppointmentPreference::APIException
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
				update_appointment_preference
			rescue Exception => e
				raise e
			end
		end
end
UpdateAppointmentPreference.initialize_and_call