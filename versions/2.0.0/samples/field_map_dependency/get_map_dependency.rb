require "ZOHOCRMSDK5_0"

class GetMapDependency
		def self.get_map_dependency(layout_id, module_1, dependency_id)
			field_map_dependency_operations =  ZOHOCRMSDK::FieldMapDependency::FieldMapDependencyOperations.new(layout_id, module_1)
			response = field_map_dependency_operations.get_map_dependency(dependency_id)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::FieldMapDependency::BodyWrapper
						response_wrapper = response_handler
						map_dependencies= response_wrapper.map_dependency
						map_dependencies.each do |map_dependency|
							parent = map_dependency.parent
							if parent != nil
								print "map_dependency Map ID: " + parent.id.to_s + "\n"
								print "map_dependency Map APIName: " + parent.api_name.to_s + "\n"
							end
							child = map_dependency.child
							if child != nil
								print "map_dependency Child ID: " + child.id.to_s + "\n"
								print "map_dependency Child APIName: " + child.api_name.to_s + "\n"
							end
							pick_list_values= map_dependency.pick_list_values
							if pick_list_values != nil
								pick_list_values.each do |pick_list_value |
									print "map_dependency PickListValue ID: " + pick_list_value.id.to_s + "\n"
									print "map_dependency PickListValue ActualValue: " + pick_list_value.actual_value.to_s + "\n"
									print "map_dependency PickListValue DisplayValue: " + pick_list_value.display_value.to_s + "\n"
									picklist_maps= pick_list_value.maps
									if picklist_maps != nil
										picklist_maps.each do |picklist_map |
											print "map_dependency PickListValue Map ID: " + picklist_map.id.to_s + "\n"
											print "map_dependency PickListValue Map ActualValue: " + picklist_map.actual_value.to_s + "\n"
											print "map_dependency PickListValue Map DisplayValue: " + picklist_map.display_value.to_s + "\n"
										end
									end
								end
							end
							print "map_dependency Internal: " + map_dependency.internal.to_s + "\n"
							print "map_dependency Active: " + map_dependency.active.to_s + "\n"
							print "map_dependency ID: " + map_dependency.id.to_s + "\n"
							print "map_dependency Active: " + map_dependency.source.to_s + "\n"
							print "map_dependency Category: " + map_dependency.category.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::FieldMapDependency::APIException
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
				module_api_name = "leads"
				layout_id = 347706111613002
				dependency_id = 347706111613002
				get_map_dependency(layout_id, module_api_name, dependency_id)
			rescue Exception => e
				raise e
			end
		end
end
GetMapDependency.initialize_and_call