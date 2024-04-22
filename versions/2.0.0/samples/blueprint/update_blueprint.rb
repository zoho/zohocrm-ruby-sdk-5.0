require "ZOHOCRMSDK5_0"

class UpdateBlueprint
		def self.update_blueprint(module_api_name, record_id, transition_id)
			blue_print_operations =  ZOHOCRMSDK::Blueprint::BlueprintOperations.new(record_id, module_api_name)
			body_wrapper =  ZOHOCRMSDK::Blueprint::BodyWrapper.new
			blue_print_list=[]
			blue_print=ZOHOCRMSDK::Blueprint::BluePrint.new
			blue_print.transition_id = transition_id
			data =  ZOHOCRMSDK::Record::Record.new
			lookup={}
			lookup.store("phone", "8940372937")
			lookup.store("id", "8940372937")
			data.add_key_value("phone", "8940372937")
			data.add_key_value("notes", "updated via blueprint")
			attachments={}
			file_ids=[]
			file_ids.push("blojtd2d13b5f044e4041a3315793fb21ef")
			attachments.store("file_id", file_ids)
			attachments.store("link_url", "ww.zoho.com")
	#		data.add_key_value("attachments", attachments)
			listings=[]
			interested_listings={}
			interested_listings.store("id", 36523971978005)
			listings.push(interested_listings)
	#		data.add_key_value("listings", listings)
			multiuser=[]
			multi_user={}
			multi_user.store("name", "givenname")
			multi_user.store("id", 3652397186017)
			multiuser.push(multi_user)
	#		data.add_key_value("multi_user", multiuser)
			processinfo =  ZOHOCRMSDK::Blueprint::ProcessInfo.new
			processinfo.api_name="apiname"
			processinfo.column_name="columnname"
			processinfo.continuous = false
			processinfo.field_id = 323243
			processinfo.field_label="fieldlabel"
			processinfo.field_name="field_name"
			processinfo.id="329993200132223"
			processinfo.is_continuous = false
			processinfo.name="name"
			escalation =  ZOHOCRMSDK::Blueprint::Escalation.new
			escalation.days = 1
			escalation.status="overdue"
			processinfo.escalation = escalation
	#		blue_print.process_info = processinfo
			transitions=[]
			transition =  ZOHOCRMSDK::Blueprint::Transition.new
			transition.type="manual"
			next_transitions=[]
			nexttransition =  ZOHOCRMSDK::Blueprint::NextTransition.new
			nexttransition.id = 36523973921103
			nexttransition.name="call later"
			nexttransition.type="manual"
			nexttransition.criteria_matched = false
			next_transitions.push(nexttransition)
			transition.next_transitions = next_transitions
			transitions.push(transition)
	#		blue_print.transitions = transitions
			check_lists=[]
			check_list_item={}
			check_list_item.store("list 1", true)
			check_lists.push(check_list_item)
			check_list_item={}
			check_list_item.store("list 2", true)
			check_lists.push(check_list_item)
			check_list_item={}
			check_list_item.store("list 3", true)
			check_lists.push(check_list_item)
	#		data.add_key_value("check_lists", check_lists)
			tasks={}
			tasks.store("subject", "event")
	#		data.add_key_value("tasks", tasks)
			blue_print.data = data
			blue_print_list.push(blue_print)
			body_wrapper.blueprint = blue_print_list
			response = blue_print_operations.update_blueprint(body_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_response = response.data_object
					if action_response.is_a? ZOHOCRMSDK::Blueprint::SuccessResponse
						success_response = action_response
						print "status: " + success_response.status.value.to_s + "\n"
						print "code: " + success_response.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						if success_response.details != nil
							success_response.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
						end
						print "message: " + success_response.message.value.to_s + "\n"
					elsif action_response.is_a? ZOHOCRMSDK::Blueprint::APIException
						exception = action_response
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
				module_api_name = "leads"
				record_id = "34770614381002"
				transition_id = "343123762189321"
				update_blueprint(module_api_name, record_id, transition_id)
			rescue Exception => e
				raise e
			end
		end
end
UpdateBlueprint.initialize_and_call