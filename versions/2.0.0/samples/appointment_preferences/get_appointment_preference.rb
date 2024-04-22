require "ZOHOCRMSDK5_0"

	
class GetAppointmentPreference
		def self.get_appointment_preference
			appointment_preference_operations =  ZOHOCRMSDK::AppointmentPreference::AppointmentPreferenceOperations.new
			paraminstance =  ZOHOCRMSDK::ParameterMap.new
			paraminstance.add(ZOHOCRMSDK::AppointmentPreference::AppointmentPreferenceOperations::GetAppointmentPreferenceParam.include, "")
			response = appointment_preference_operations.get_appointment_preference(paraminstance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.status_code == 204
					print "no Content".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::AppointmentPreference::ResponseWrapper
						response_wrapper = response_handler
						appointment_preferences = response_wrapper.appointment_preferences
						if appointment_preferences != nil
							print "appointment_preference show_job_sheet : " + appointment_preferences.show_job_sheet.to_s + "\n"
							print "appointment_preference when_duration_exceeds : " + appointment_preferences.when_duration_exceeds.value.to_s + "\n"
							print "appointment_preference allow_booking_outside_service_availability : " + appointment_preferences.allow_booking_outside_service_availability.to_s + "\n"
							print "appointment_preference when_appointment_completed : " + appointment_preferences.when_appointment_completed.value.to_s + "\n"
							print "appointment_preference allow_booking_outside_businesshours : " + appointment_preferences.allow_booking_outside_businesshours.to_s + "\n"
							deal_record_configuration= appointment_preferences.deal_record_configuration
							if deal_record_configuration != nil
								deal_record_configuration.each do |k, v|
									if k == "layout"
										layout=  v
										print "layout Id :" + layout.id.to_s + "\n"
										print "layout_name : " + layout.api_name.to_s + "\n"
									end
									if k == "field_mappings"
										field_mappings=  v
										if field_mappings != nil
											field_mappings.each do |field_mapping|
												print "field_m_appings Type: " + field_mapping.type.value.to_s + "\n"
												print "field_mappings Value: " + field_mapping.value.to_s + "\n"
												field= field_mapping.field
												if field != nil
													print "field APIName : " + field.api_name.to_s + "\n"
													print "field Id : " + field.id.to_s + "\n"
												end
											end
										end
									end
								end
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::AppointmentPreference::APIException
						exception = response_handler
						print "status: " + exception.status.value.to_s + "\n"
						print "code: " + exception.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						exception.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + exception.message.to_s + "\n"
					end
				elsif response.status_code != 204
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
				get_appointment_preference
			rescue Exception => e
				raise e
			end
		end
end
GetAppointmentPreference.initialize_and_call