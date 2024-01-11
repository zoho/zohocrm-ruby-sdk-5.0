require "ZOHOCRMSDK5_0"

class GetBlueprint
		def self.get_blueprint(module_api_name, record_id)
			blue_print_operations =  ZOHOCRMSDK::Blueprint::BlueprintOperations.new(record_id, module_api_name)
			response = blue_print_operations.get_blueprint
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Blueprint::ResponseWrapper
						response_wrapper = response_handler
						blue_print= response_wrapper.blueprint
						process_info = blue_print.process_info
						if process_info != nil
							print "process_info Field-ID: " + process_info.field_id.to_s + "\n"
							escalation = process_info.escalation
							if escalation != nil
								print "escalation days: " + escalation.days.to_s + "\n"
								print "escalation status: " + escalation.status.to_s + "\n"
							end
							print "process_info is_continuous: " + process_info.is_continuous.to_s + "\n"
							print "process_info API Name: " + process_info.api_name.to_s + "\n"
							print "process_info Continuous: " + process_info.continuous.to_s + "\n"
							print "process_info FieldLabel: " + process_info.field_label.to_s + "\n"
							print "process_info Name: " + process_info.name.to_s + "\n"
							print "process_info ColumnName: " + process_info.column_name.to_s + "\n"
							print "process_info FieldValue: " + process_info.field_value.to_s + "\n"
							print "process_info ID: " + process_info.id.to_s + "\n"
							print "process_info FieldName: " + process_info.field_name.to_s + "\n"
						end
						transitions= blue_print.transitions
						transitions.each do |transition|
							next_transitions= transition.next_transitions
							next_transitions.each do |next_transition|
								print "next_transition ID: " + next_transition.id.to_s + "\n"
								print "next_transition criteria_matched: " + next_transition.criteria_matched.to_s + "\n"
								print "next_transition Name: " + next_transition.name.to_s + "\n"
								print "next_transition type: " + next_transition.type.to_s + "\n"
							end
							parent_transition = transition.parent_transition
							if parent_transition != nil
								print "parenttransition ID: " + parent_transition.id.to_s + "\n"
							end
							data = transition.data
							print "record ID: " + data.id.to_s + "\n"
							created_by = data.created_by
							if created_by != nil
								print "record Created By User-ID: " + created_by.id.to_s + "\n"
								print "record Created By User-Name: " + created_by.name.to_s + "\n"
							end
							if data.created_time != nil
								print "record Created Time: " + data.created_time.to_s + "\n"
							end
							if data.modified_time != nil
								print "record Modified Time: " + data.modified_time.to_s + "\n"
							end
							modified_by = data.modified_by
							if modified_by != nil
								print "record Modified By User-ID: " + modified_by.id.to_s + "\n"
								print "record Modified By user-_name: " + modified_by.name.to_s + "\n"
							end
							data.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
							print "transition NextFieldValue: " + transition.next_field_value.to_s + "\n"
							print "transition Name: " + transition.name.to_s + "\n"
							print "transition CriteriaMatched: " + transition.criteria_matched.to_s + "\n"
							print "transition ID: " + transition.id.to_s + "\n"
							print "transition Fields: ".to_s + "\n"
							fields= transition.fields
							fields.each do |field_handler|
								field = field_handler
								if field.system_mandatory != nil
									print "field is SystemMandatory: " + field.system_mandatory.to_s + "\n"
								end
								print "field is Private_1" + field.private_1.to_s + "\n"
								print "transition Fields Webhook: " + field.webhook.to_s + "\n"
								print "transition Fields JsonType: " + field.json_type.to_s + "\n"
								print "transition Fields DisplayLabel: " + field.display_label.to_s + "\n"
								print "transition Fields UiType: " + field.ui_type.to_s + "\n"
								print "transition Fields ValidationRule: " + field.validation_rule.to_s + "\n"
								print "transition Fields DataType: " + field.data_type.to_s + "\n"
								print "transition Fields Type: " + field.type.to_s + "\n"
								print "transition Fields ColumnName: " + field.column_name.to_s + "\n"
								print "transition Fields PersonalityName: " + field.personality_name.to_s + "\n"
								print "transition Fields ID: " + field.id.to_s + "\n"
								print "transition Fields TransitionSequence: " + field.transition_sequence.to_s + "\n"
								if field.mandatory != nil
									print "transition Fields Mandatory: " + field.mandatory.to_s + "\n"
								end
								layout = field.layouts
								if layout != nil
									print "transition Fields Layout ID: " + layout.id.to_s + "\n"
									print "transition Fields Layout Name: " + layout.name.to_s + "\n"
								end
								print "field PickListValuesSortedLexically: " + field.pick_list_values_sorted_lexically.to_s + "\n"
								print "field Sortable: " + field.sortable.to_s + "\n"
								print "field TransitionSequence: " + field.transition_sequence.to_s + "\n"
								external = field.external
								if external != nil
									print "field External Show: " + external.show.to_s + "\n"
									print "field External Type: " + external.type.to_s + "\n"
									print "field External AllowMultipleConfig: " + external.allow_multiple_config.to_s + "\n"
								end
								unique = field.unique
								if unique != nil
									print "field Unique Casesensitive : " + unique.casesensitive.to_s + "\n"
								end
								if field.history_tracking != nil
									print "field HistoryTracking: " + field.history_tracking.to_s + "\n"
								end
								print "field DataType: " + field.data_type.to_s + "\n"
								print "transition Fields APIName: " + field.api_name.to_s + "\n"
								print "transition Fields Content: " + field.content.to_s + "\n"
								if field.system_mandatory != nil
									print "transition Fields SystemMandatory: " + field.system_mandatory.to_s + "\n"
								end
								print "transition Fields FieldLabel: " + field.field_label.to_s + "\n"
								multi_module_lookup = field.multi_module_lookup
								if multi_module_lookup != nil
									print "field MultiModuleLookup APIName: " + multi_module_lookup.api_name.to_s + "\n"
									print "field MultiModuleLookup DisplayLabel: " + multi_module_lookup.display_label.to_s + "\n"
									multi_module_lookup.each do |module_1|
										print "field MultiModuleLookup Module ID: " + module_1.id.to_s + "\n"
										print "field MultiModuleLookup Module APIName: " + module_1.api_name.to_s + "\n"
									end
								end
								currency = field.currency
								if currency != nil
									print "field Currency RoundingOption: " + currency.rounding_option.to_s + "\n"
									if currency.precision != nil
										print "field Currency Precision: " + currency.precision.to_s + "\n"
									end
								end
								tool_tip = field.tooltip
								if tool_tip != nil
									print "transition Fields Tooltip Name: " + tool_tip.name.to_s + "\n"
									print "transition Fields Tooltip Value: " + tool_tip.value.to_s + "\n"
								end
								print "transition Fields CreatedSource: " + field.created_source.to_s + "\n"
								if field.field_read_only != nil
									print "transition Fields FieldReadOnly: " + field.field_read_only.to_s + "\n"
								end
								if field.display_type != nil
									print "transition Fields DisplayType: " + field.display_type.to_s + "\n"
								end
								if field.read_only != nil
									print "transition Fields ReadOnly: " + field.read_only.to_s + "\n"
								end
								print "transition Fields AssociationDetails: " + field.association_details.to_s + "\n"
								if field.quick_sequence_number != nil
									print "transition Fields QuickSequenceNumber: " + field.quick_sequence_number.to_s + "\n"
								end
								if field.custom_field != nil
									print "transition Fields CustomField: " + field.custom_field.to_s + "\n"
								end
								lookup = field.lookup
								if lookup != nil
									print "field ModuleLookup DisplayLabel: " + lookup.display_label.to_s + "\n"
									print "field ModuleLookup APIName: " + lookup.api_name.to_s + "\n"
									print "field ModuleLookup Module: " + lookup.module.to_s + "\n"
									if lookup.id != nil
										print "field ModuleLookup ID: " + lookup.id.to_s + "\n"
									end
								end
								print "field Filterable: " + field.filterable.to_s + "\n"
								if field.convert_mapping != nil
									convert_mapping = field.convert_mapping
									accounts = convert_mapping.accounts
									contacts = convert_mapping.contacts
									deals = convert_mapping.deals
								end
								if field.visible != nil
									print "transition Fields Visible: " + field.visible.to_s + "\n"
								end
								profiles= field.profiles
								if profiles != nil
									profiles.each do |profile|
										print "field Profile PermissionType: " + profile.permission_type.to_s + "\n"
										print "field Profile Name: " + profile.name.to_s + "\n"
										print "field Profile Id: " + profile.id.to_s + "\n"
									end
								end
								if field.formula != nil
									if field.formula.expression != nil
										print "field Formula Expression :  " + field.formula.expression.to_s + "\n"
									end
								end
								if field.decimal_place != nil
									print "field DecimalPlace: " + field.decimal_place.to_s + "\n"
								end
								if field.length != nil
									print "transition Fields Length: " + field.length.to_s + "\n"
								end
								print "transition Fields DecimalPlace: " + field.decimal_place.to_s + "\n"
								view_type = field.view_type
								if view_type != nil
									print "transition Fields ViewType View: " + view_type.view.to_s + "\n"
									print "transition Fields ViewType Edit: " + view_type.edit.to_s + "\n"
									print "transition Fields ViewType Create: " + view_type.create.to_s + "\n"
									print "transition Fields ViewType QuickCreate: " + view_type.quick_create.to_s + "\n"
								end
								pick_list_values= field.pick_list_values
								if pick_list_values != nil
									pick_list_values.each do |pick_list_value|
										print_pick_list_value(pick_list_value)
									end
								end
								multi_select_lookup = field.multiselectlookup
								if multi_select_lookup != nil
									print "transition Fields MultiSelectLookup DisplayLabel: " + multi_select_lookup.display_label.to_s + "\n"
									print "transition Fields MultiSelectLookup LinkingModule: " + multi_select_lookup.linking_module.to_s + "\n"
									print "transition Fields MultiSelectLookup LookupApiname: " + multi_select_lookup.lookup_apiname.to_s + "\n"
									print "transition Fields MultiSelectLookup APIName: " + multi_select_lookup.api_name.to_s + "\n"
									print "transition Fields MultiSelectLookup ConnectedlookupApiname: " + multi_select_lookup.connectedlookup_apiname.to_s + "\n"
									print "transition Fields MultiSelectLookup ID: " + multi_select_lookup.id.to_s + "\n"
								end
								auto_number= field.auto_number
								if auto_number != nil
									print "transition Fields AutoNumber Prefix: " + auto_number.prefix.to_s + "\n"
									print "transition Fields AutoNumber Suffix: " + auto_number.suffix.to_s + "\n"
									if auto_number.start_number != nil
										print "transition Fields Auto StartNumber: " + auto_number.start_number.to_s + "\n"
									end
								end
								print "transition Fields ConvertMapping: ".to_s + "\n"
								if field.convert_mapping != nil
									convert_mapping = field.convert_mapping
									accounts = convert_mapping.accounts
									contacts = convert_mapping.contacts
									deals = convert_mapping.deals
								end
							end
							print "transition CriteriaMessage: " + transition.criteria_message.to_s + "\n"
							print "transition PercentPartialSave: " + transition.percent_partial_save.to_s + "\n"
							print "transition ExecutionTime: " + transition.execution_time.to_s + "\n"
							print "transition Type: " + transition.type.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Blueprint::APIException
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
		def self.print_pick_list_value(pick_list_value)
			print " Fields PickListValue DisplayValue: " + pick_list_value.display_value.to_s + "\n"
			print " Fields PickListValue SequenceNumber: " + pick_list_value.sequence_number.to_s + "\n"
			print " Fields PickListValue ExpectedDataType: " + pick_list_value.expected_data_type.to_s + "\n"
			print " Fields PickListValue ActualValue: " + pick_list_value.actual_value.to_s + "\n"
			print " Fields PickListValue SysRefName: " + pick_list_value.sys_ref_name.to_s + "\n"
			print " Fields PickListValue Type: " + pick_list_value.type.to_s + "\n"
			print " Fields PickListValue Id: " + pick_list_value.id.to_s + "\n"
			pick_list_value.each do |map|
				print map.to_s + "\n"
				pick_list_values= map.pick_list_values
				if pick_list_values != nil
					pick_list_values.each do |plv|
						print_pick_list_value(plv)
					end
				end
			end
		end
	def self.initialize_and_call
			begin
				environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				module_api_name = "deals"
				record_id = "4402480262183"
				get_blueprint(module_api_name, record_id)
			rescue Exception => e
				raise e
			end
		end
end
GetBlueprint.initialize_and_call