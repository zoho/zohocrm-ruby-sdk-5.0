require "ZOHOCRMSDK5_0"

class LeadConversionOptions
		def self.lead_conversion_options(record_id)
			record_operations =  ZOHOCRMSDK::Record::RecordOperations.new
			module_api_name = "leads"
			response = record_operations.lead_conversion_options(record_id, module_api_name)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Record::ConversionOptionsResponseWrapper
						conversion_option_response_wrapper = response_handler
						conversion_option = conversion_option_response_wrapper.conversionoptions
						module_1= conversion_option.module_preference
						if module_1 != nil
							print "conversion_options ModulePreference API-Name: " + module_1.api_name.to_s + "\n"
							print "conversion_options ModulePreference ID: " + module_1.id.to_s + "\n"
						end
						contacts= conversion_option.contacts
						if contacts != nil
							contacts.each do |contact|
								print "record ID: " + contact.id.to_s + "\n"
								print "record KeyValues: ".to_s + "\n"
								contact.each do |k, v|
									key_name = k
									value = v
									if value.is_a? Array
										print "record KeyName : " + key_name.to_s + "\n"
										data_list= value
										data_list.each do |data|
											if data.is_a? Hash
												print "record KeyName : " + key_name + " - Value : ".to_s + "\n"
												data.each do |k1, v1|
													print k1 + " : " + v1.to_s + "\n"
												end
											else
												print data.to_s + "\n"
											end
										end
									elsif value.is_a? Hash
										print "record KeyName : " + key_name + " - Value : ".to_s + "\n"
										value.each do |k1, v1|
											print k1 + " : " + v1.to_s + "\n"
										end
									else
										print "record KeyName : " + key_name + " - Value : " + value.to_s + "\n"
									end
								end
							end
						end
						preference_field_matched_value = conversion_option.preference_field_matched_value
						if preference_field_matched_value != nil
							contacts_preference_field= preference_field_matched_value.contacts
							if contacts_preference_field != nil
								contacts_preference_field.each do |contact|
									print "record ID: " + contact.id.to_s + "\n"
									print "record KeyValues: ".to_s + "\n"
									contact.each do |k, v|
										key_name = k
										value = v
										if value.is_a? Hash
											print "record KeyName : " + key_name + " - Value : ".to_s + "\n"
											value.each do |k1, v1|
												print k1 + " : " + v1.to_s + "\n"
											end
										else
											print "record KeyName : " + key_name + " - Value : " + value.to_s + "\n"
										end
									end
								end
							end
							accounts_preference_field= preference_field_matched_value.accounts
							if accounts_preference_field != nil
								accounts_preference_field.each do |account|
									print "record ID: " + account.id.to_s + "\n"
									print "record KeyValues: ".to_s + "\n"
									account.each do |k, v|
										key_name = k
										value = v
										if value.is_a? Hash
											print "record KeyName : " + key_name + " - Value : ".to_s + "\n"
											value.each do |k1, v1|
												print k1 + " : " + v1.to_s + "\n"
											end
										else
											print "record KeyName : " + key_name + " - Value : " + value.to_s + "\n"
										end
									end
								end
							end
							deals_preference_field= preference_field_matched_value.deals
							if deals_preference_field != nil
								deals_preference_field.each do |deal|
									print "record ID: " + deal.id.to_s + "\n"
									print "record KeyValues: ".to_s + "\n"
									deal.each do |k, v|
										key_name = k
										value = v
										if value.is_a? Hash
											print "record KeyName : " + key_name + " - Value : ".to_s + "\n"
											value.each do |k1, v1|
												print k1 + " : " + v1.to_s + "\n"
											end
										else
											print "record KeyName : " + key_name + " - Value : " + value.to_s + "\n"
										end
									end
								end
							end
						end
						accoutns= conversion_option.accounts
						if accoutns != nil
							accoutns.each do |account|
								print "record ID: " + account.id.to_s + "\n"
								print "record KeyValues: ".to_s + "\n"
								account.each do |k, v|
									key_name = k
									value = v
									if value.is_a? Array
										print "record KeyName : " + key_name.to_s + "\n"
										data_list=  value
										data_list.each do |data|
											if data.is_a? Hash
												print "record KeyName : " + key_name + " - Value : ".to_s + "\n"
												data.each do |k1, v1|
													print k1 + " : " + v1.to_s + "\n"
												end
											else
												print data.to_s + "\n"
											end
										end
									elsif value.is_a? Hash
										print "record KeyName : " + key_name + " - Value : ".to_s + "\n"
										value.each do |k1, v1|
											print k1 + " : " + v1.to_s + "\n"
										end
									else
										print "record KeyName : " + key_name + " - Value : " + value.to_s + "\n"
									end
								end
							end
						end
						deals= conversion_option.deals
						if deals != nil
							deals.each do |deal|
								print "record ID: " + deal.id.to_s + "\n"
								print "record KeyValues: ".to_s + "\n"
								deal.each do |k, v|
									key_name = k
									value = v
									if value.is_a? Array
										print "record KeyName : " + key_name.to_s + "\n"
										data_list=  value
										data_list.each do |data|
											if data.is_a? Hash
												print "record KeyName : " + key_name + " - Value : ".to_s + "\n"
												data.each do |k1, v1|
													print k1 + " : " + v1.to_s + "\n"
												end
											else
												print data.to_s + "\n"
											end
										end
									elsif value.is_a? Hash
										print "record KeyName : " + key_name + " - Value : ".to_s + "\n"
										value.each do |k1, v1|
											print k1 + " : " + v1.to_s + "\n"
										end
									else
										print "record KeyName : " + key_name + " - Value : " + value.to_s + "\n"
									end
								end
							end
						end
						modules_with_multiple_layouts= conversion_option.modules_with_multiple_layouts
						if modules_with_multiple_layouts != nil
							modules_with_multiple_layouts.each do |module_2|
								print "conversion_options ModulesWithMultipleLayouts API-Name: " + module_2.api_name.to_s + "\n"
								print "conversion_options ModulesWithMultipleLayouts ID: " + module_2.id.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Record::APIException
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
				record_id = 347706116989001
				lead_conversion_options(record_id)
			rescue Exception => e
				raise e
			end
		end
end
LeadConversionOptions.initialize_and_call