require "ZOHOCRMSDK5_0"

class GetTimelines
		def self.get_timelines(module_1, record_id)
			timelinesoperations =  ZOHOCRMSDK::Timelines::TimelinesOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			response = timelinesoperations.get_timelines(module_1, record_id, param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Timelines::ResponseWrapper
						response_wrapper = response_handler
						timelines= response_wrapper.timeline
						if timelines != nil
							timelines.each do |timeline|
								done_by = timeline.done_by
								if done_by != nil
									print "done_by Name: " + done_by.name.to_s + "\n"
									print "done_by Id: " + done_by.id.to_s + "\n"
								end
								related_record = timeline.related_record
								if related_record != nil
									print "related_record Id: " + related_record.id.to_s + "\n"
									print "related_record Name: " + related_record.name.to_s + "\n"
									module1 = related_record.module
									print "module : ".to_s + "\n"
									if module1 != nil
										print "related_record Module Name: " + module1.name.to_s + "\n"
										print "related_record Module Id: " + module1.id.to_s + "\n"
									end
								end
								automation_details = timeline.automation_details
								if automation_details != nil
									print "automationdetails type: " + automation_details.type.to_s + "\n"
									rule = automation_details.rule
									if rule != nil
										print "automationdetails Rule Name :" + rule.name.to_s + "\n"
										print "automationdetails Rule Id :" + rule.id.to_s + "\n"
									end
								end
								record1 = timeline.record
								if record1 != nil
									print "record Id: " + record1.id.to_s + "\n"
									print "record Name: " + record1.name.to_s + "\n"
									module2 = record1.module
									print "module : ".to_s + "\n"
									if module2 != nil
										print "record Module Name: " + module2.api_name.to_s + "\n"
										print "record Module Id: " + module2.id.to_s + "\n"
									end
								end
								print "auditedtime : " + timeline.audited_time.to_s + "\n"
								print "action : " + timeline.action.to_s + "\n"
								print "timeline Id: " + timeline.id.to_s + "\n"
								print "source: " + timeline.source.to_s + "\n"
								print "extension: " + timeline.extension.to_s + "\n"
								print "type:: " + timeline.type.to_s + "\n"
								field_history= timeline.field_history
								if field_history != nil
									field_history.each do |history|
										print "field_history data_type: " + history.data_type.to_s + "\n"
										print "field_history enable_colour_code: " + history.enable_colour_code.to_s + "\n"
										print "field_history field_label: " + history.field_label.to_s + "\n"
										print "field_history api_name: " + history.api_name.to_s + "\n"
										print "field_history id: " + history.id.to_s + "\n"
										value = history.value
										if value != nil
											print "new :" + value.new.to_s + "\n"
											print "old :" + value.old.to_s + "\n"
										end
										pick_list_values= history.pick_list_values
										if pick_list_values != nil
											pick_list_values.each do |pick_list_value|
												print "picklistvalue DisplayValue : " + pick_list_value.display_value.to_s + "\n"
												print "picklistvalue sequence_number : " + pick_list_value.sequence_number.to_s + "\n"
												print "picklistvalue colour_code : " + pick_list_value.colour_code.to_s + "\n"
												print "picklistvalue actual_value : " + pick_list_value.actual_value.to_s + "\n"
												print "picklistvalue id : " + pick_list_value.id.to_s + "\n"
												print "picklistvalue type : " + pick_list_value.type.to_s + "\n"
											end
										end
									end
								end
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Timelines::APIException
						exception = response_handler
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
				module_1 = "leads"
				record_id = "440248001310027"
				get_timelines(module_1, record_id)
			rescue Exception => e
				raise e
			end
		end
end
GetTimelines.initialize_and_call