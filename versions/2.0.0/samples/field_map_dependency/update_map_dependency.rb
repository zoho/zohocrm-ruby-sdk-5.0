require "ZOHOCRMSDK5_0"

class UpdateMapDependency
		def self.update_map_dependency(layout_id, module_1, dependency_id)
			field_map_dependency_operations =  ZOHOCRMSDK::FieldMapDependency::FieldMapDependencyOperations.new(layout_id, module_1)
			body_wrapper =  ZOHOCRMSDK::FieldMapDependency::BodyWrapper.new
			map_dependencies=[]
			mapdependency =  ZOHOCRMSDK::FieldMapDependency::MapDependency.new
			parent =  ZOHOCRMSDK::FieldMapDependency::Parent.new
			parent.api_name="Lead_Status"
			parent.id = 3652397002611
			mapdependency.parent = parent
			child =  ZOHOCRMSDK::FieldMapDependency::Child.new
			child.api_name="Lead_Status"
			child.id = 3652397002611
			mapdependency.child = child
			pick_list_values=[]
			pick_list_value =  ZOHOCRMSDK::FieldMapDependency::PickListMapping.new
			pick_list_value.display_value="-None-"
			pick_list_value.id = 3652397003409
			pick_list_value.actual_value="-None-"
			picklist_maps=[]
			picklist_map =  ZOHOCRMSDK::FieldMapDependency::PicklistMap.new
			picklist_map.id = 3652397003389
			picklist_map.actual_value="Cold Call"
			picklist_map.display_value="Cold Call"
			picklist_maps.push(picklist_map)
			picklist_map =  ZOHOCRMSDK::FieldMapDependency::PicklistMap.new
			picklist_map.id = 3652397003391
			picklist_map.actual_value="-None-"
			picklist_map.display_value="-None-"
			picklist_maps.push(picklist_map)
			pick_list_value.maps = picklist_maps
			pick_list_values.push(pick_list_value)
			mapdependency.pick_list_values = pick_list_values
			map_dependencies.push(mapdependency)
			body_wrapper.map_dependency = map_dependencies
			response = field_map_dependency_operations.update_map_dependency(dependency_id, body_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::FieldMapDependency::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.map_dependency
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::FieldMapDependency::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::FieldMapDependency::APIException
								exception = action_response
								print "status: " + exception.status.value.to_s + "\n"
								print "code: " + exception.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								exception.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + exception.message.to_s + "\n"
							end
						end
					elsif action_handler.is_a? ZOHOCRMSDK::FieldMapDependency::APIException
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
				module_api_name = "leads"
				layout_id = 347706111613002
				dependency_id = 347706111613002
				update_map_dependency(layout_id, module_api_name, dependency_id)
			rescue Exception => e
				raise e
			end
		end
end
UpdateMapDependency.initialize_and_call