require "ZOHOCRMSDK5_0"

class GetInventoryTemplates
		def self.get_inventory_templates(module_api_name)
			inventory_templates_operations =  ZOHOCRMSDK::InventoryTemplates::InventoryTemplatesOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::InventoryTemplates::InventoryTemplatesOperations::GetInventoryTemplatesParam.module, module_api_name)
			response = inventory_templates_operations.get_inventory_templates(param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::InventoryTemplates::ResponseWrapper
						response_wrapper = response_handler
						inventory_templates= response_wrapper.inventory_templates
						inventory_templates.each do |inventory_template|
							print "inventory_template CreatedTime: " + inventory_template.created_time.to_s + "\n"
							module_1 = inventory_template.module
							if module_1 != nil
								print "inventory_template Module ID: " + module_1.id.to_s + "\n"
								print "inventory_template Module api_name: " + module_1.api_name.to_s + "\n"
							end
							print "inventory_template Type: " + inventory_template.type.to_s + "\n"
							created_by = inventory_template.created_by
							if created_by != nil
								print "inventory_template Created By Name : " + created_by.name.to_s + "\n"
								print "inventory_template Created By id : " + created_by.id.to_s + "\n"
							end
							print "inventory_template ModifiedTime: " + inventory_template.modified_time.to_s + "\n"
							folder = inventory_template.folder
							if folder != nil
								print "inventory_template Folder  id : " + folder.id.to_s + "\n"
								print "inventory_template Folder  Name : " + folder.name.to_s + "\n"
							end
							print "inventory_template Last Usage Time: " + inventory_template.last_usage_time.to_s + "\n"
							print "inventory_template Name: " + inventory_template.name.to_s + "\n"
							modified_by = inventory_template.modified_by
							if modified_by != nil
								print "inventory_template Modified By Name : " + modified_by.name.to_s + "\n"
								print "inventory_template Modified By id : " + modified_by.id.to_s + "\n"
							end
							print "inventory_template ID: " + inventory_template.id.to_s + "\n"
							print "inventory_template EditorMode : " + inventory_template.editor_mode.to_s + "\n"
							print "inventory_template Content: " + inventory_template.content.to_s + "\n"
							print "inventory_template Favourite: " + inventory_template.favorite.to_s + "\n"
						end
						info = response_wrapper.info
						if info != nil
							if info.per_page != nil
								print "record Info PerPage: " + info.per_page.to_s + "\n"
							end
							if info.count != nil
								print "record Info Count: " + info.count.to_s + "\n"
							end
							if info.page != nil
								print "record Info Page: " + info.page.to_s + "\n"
							end
							if info.more_records != nil
								print "record Info MoreRecords: " + info.more_records.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::InventoryTemplates::APIException
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
				module_api_name = "quotes"
				get_inventory_templates(module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
GetInventoryTemplates.initialize_and_call