require "ZOHOCRMSDK5_0"

class GetWizards
		def self.get_wizards
			wizards_operations =  ZOHOCRMSDK::Wizards::WizardsOperations.new
			response = wizards_operations.get_wizards
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Wizards::ResponseWrapper
						response_wrapper = response_handler
						wizards= response_wrapper.wizards
						wizards.each do |wizard|
							print "wizard CreatedTime: " + wizard.created_time.to_s + "\n"
							print "wizard ModifiedTime: " + wizard.modified_time.to_s + "\n"
							module_1 = wizard.module
							if module_1 != nil
								print "wizard Module ID: " + module_1.id.to_s + "\n"
								print "wizard Module api_name: " + module_1.api_name.to_s + "\n"
							end
							print "wizard Name: " + wizard.name.to_s + "\n"
							modified_by = wizard.modified_by
							if modified_by != nil
								print "wizard Modified By Name : " + modified_by.name.to_s + "\n"
								print "wizard Modified By id : " + modified_by.id.to_s + "\n"
								print "wizard Modified By Name : " + modified_by.email.to_s + "\n"
							end
							profiles= wizard.profiles
							profiles.each do |profile|
								print "wizard Profile  Name: " + profile.name.to_s + "\n"
								print "wizard Profile ID: " + profile.id.to_s + "\n"
							end
							print "wizard Active: " + wizard.active.to_s + "\n"
							containers= wizard.containers
							containers.each do |container|
								print "wizard Container ID: " + container.id.to_s + "\n"
								layout = container.layout
								if layout != nil
									print "wizard Container Layout ID: " + layout.id.to_s + "\n"
									print "wizard Container Layout Name: " + layout.name.to_s + "\n"
								end
								chart_data = container.chart_data
								if chart_data != nil
									nodes= chart_data.nodes
									nodes.each do |node|
										print "chart Data Node poistion y: " + node.pos_y.to_s + "\n"
										print "chart Data Node poistion X: " + node.pos_x.to_s + "\n"
										print "chart Data Node start node: " + node.start_node.to_s + "\n"
										node_screen = node.screen
										if node_screen != nil
											print " screens id: " + node_screen.id.to_s + "\n"
											print "display label: " + node_screen.display_label.to_s + "\n"
										end
									end
									connections= chart_data.connections
									connections.each do |connection|
										connection_screen = connection.tarscreen
										if connection_screen != nil
											print " screens id: " + connection_screen.id.to_s + "\n"
											print "display label: " + connection_screen.display_label.to_s + "\n"
										end
										connection_button = connection.source_button
										if connection_button != nil
											print " button id: " + connection_button.id.to_s + "\n"
											print "display label: " + connection_button.display_label.to_s + "\n"
										end
									end
									print "chart Data Canvas width: " + chart_data.canvas_width.to_s + "\n"
									print "chart Data Canvas height: " + chart_data.canvas_height.to_s + "\n"
								end
								screens= container.screens
								if screens != nil
									screens.each do |screen|
										print " screens id: " + screen.id.to_s + "\n"
										print "display label: " + screen.display_label.to_s + "\n"
										segments= screen.segments
										segments.each do |segment|
											print "screens segment id: " + segment.id.to_s + "\n"
											print "screens segment equence number: " + segment.sequence_number.to_s + "\n"
											print "screens segment display label: " + segment.display_label.to_s + "\n"
											print "screens segment type: " + segment.type.to_s + "\n"
											print "screens segment column count: " + segment.column_count.to_s + "\n"
											fields= segment.fields
											fields.each do |field|
												print "screens segment field id: " + field.id.to_s + "\n"
												print "screens segment field apiname: " + field.api_name.to_s + "\n"
											end
											buttons= segment.buttons
											buttons.each do |button|
												criteria = button.criteria
												if criteria != nil
													print_criteria(criteria)
												end
												target_screen = button.tarscreen
												if target_screen != nil
													print " Button target_screen id : " + target_screen.id.to_s + "\n"
													print " Button target_screen display label: " + target_screen.display_label.to_s + "\n"
												end
												print " Button display label: " + button.display_label.to_s + "\n"
												print " Button id: " + button.id.to_s + "\n"
												print " Button display label: " + button.display_label.to_s + "\n"
												print " Button type: " + button.type.to_s + "\n"
												print " Button bg color: " + button.background_color.to_s + "\n"
												print " Button sequence number: " + button.sequence_number.to_s + "\n"
												print " Button color: " + button.color.to_s + "\n"
												print " Button shape: " + button.shape.to_s + "\n"
												print " Button sequence number: " + button.sequence_number.to_s + "\n"
											end
										end
									end
								end
							end
							created_by = wizard.created_by
							if created_by != nil
								print "wizard Created By Name : " + created_by.name.to_s + "\n"
								print "wizard Created By id : " + created_by.id.to_s + "\n"
								print "wizard Created By Name : " + created_by.email.to_s + "\n"
							end
							parent_wizard = wizard.parent_wizard
							if parent_wizard != nil
								print "wizard parent Wizard  id : " + parent_wizard.id.to_s + "\n"
								print "wizard parent Wizard  Name : " + parent_wizard.name.to_s + "\n"
							end
							print "wizard Draft: " + wizard.draft.to_s + "\n"
							print "wizard ID: " + wizard.id.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Wizards::APIException
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
		def self.print_criteria(criteria)
			if criteria.comparator != nil
				print "custom_view Criteria Comparator: " + criteria.comparator.to_s + "\n"
			end
			if criteria.field != nil
				print "custom_view Criteria field name: " + criteria.field.api_name.to_s + "\n"
			end
			if criteria.value != nil
				print "custom_view Criteria Value: " + criteria.value.to_s + "\n"
			end
			criteria_group= criteria.group
			if criteria_group != nil
				criteria_group.each do |criteria1|
					print_criteria(criteria1)
				end
			end
			if criteria.group_operator != nil
				print "custom_view Criteria Group Operator: " + criteria.group_operator.to_s + "\n"
			end
		end
	def self.initialize_and_call
			begin
				environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				get_wizards
			rescue Exception => e
				raise e
			end
		end
end
GetWizards.initialize_and_call