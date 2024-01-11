require "ZOHOCRMSDK5_0"

class GetFields
		def self.get_fields(module_api_name)
			field_operations =  ZOHOCRMSDK::Fields::FieldsOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Fields::FieldsOperations::GetFieldsParam.module, module_api_name)
	#		param_instance.add(ZOHOCRMSDK::Fields::FieldsOperations::GetFieldsParam.type, "unused")
			response = field_operations.get_fields(param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Fields::BodyWrapper
						response_wrapper = response_handler
						fields= response_wrapper.fields
						fields.each do |field|
							print "field SystemMandatory: " + field.system_mandatory.to_s + "\n"
							print "field Webhook: " + field.webhook.to_s + "\n"
							print "field JsonType: " + field.json_type.to_s + "\n"
							private_info = field.private_1
							if private_info != nil
								print "private Details".to_s + "\n"
								print "field Private Type: " + private_info.type.to_s + "\n"
								print "field Private Export: " + private_info.export.to_s + "\n"
								print "field Private Restricted: " + private_info.restricted.to_s + "\n"
							end
							crypt = field.crypt
							if crypt != nil
								print "field Crypt Mode: " + crypt.mode.to_s + "\n"
								print "field Crypt Column: " + crypt.column.to_s + "\n"
								print "field Crypt Table: " + crypt.table.to_s + "\n"
								print "field Crypt Status: " + crypt.status.to_s + "\n"
								enc_fld_ids= crypt.encfldids
								if enc_fld_ids != nil
									print "enc_fld_ids : ".to_s + "\n"
									enc_fld_ids.each do |enc_fld_id|
										print enc_fld_id.to_s + "\n"
									end
								end
								print "field Crypt Notify: " + crypt.notify.to_s + "\n"
							end
							print "field FieldLabel: " + field.field_label.to_s + "\n"
							tooltip = field.tooltip
							if tooltip != nil
								print "field ToolTip Name: " + tooltip.name.to_s + "\n"
								print "field ToolTip Value: " + tooltip.value.to_s + "\n"
							end
							print "field CreatedSource: " + field.created_source.to_s + "\n"
							print "field Type :" + field.type.to_s + "\n"
							print "field FieldReadOnly: " + field.field_read_only.to_s + "\n"
							print "field DisplayLabel: " + field.display_label.to_s + "\n"
							if field.display_type != nil
								print "field DisplayType : " + field.display_type.to_s + "\n"
							end
							if field.ui_type != nil
								print "field UI Type " + field.ui_type.to_s + "\n"
							end
							print "field ReadOnly: " + field.read_only.to_s + "\n"
							association_details = field.association_details
							if association_details != nil
								lookup_field = association_details.lookup_field
								if lookup_field != nil
									print "field AssociationDetails LookupField ID: " + lookup_field.id.to_s + "\n"
									print "field AssociationDetails LookupField Name: " + lookup_field.api_name.to_s + "\n"
								end
								related_field = association_details.related_field
								if related_field != nil
									print "field AssociationDetails RelatedField ID: " + related_field.id.to_s + "\n"
									print "field AssociationDetails RelatedField Name: " + related_field.api_name.to_s + "\n"
								end
							end
							if field.quick_sequence_number != nil
								print "field QuickSequenceNumber: " + field.quick_sequence_number.to_s + "\n"
							end
							print "field BusinesscardSupported: " + field.businesscard_supported.to_s + "\n"
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
								print "field Currency RoundingOption: " + currency.rounding_option.value.to_s + "\n"
								if currency.precision != nil
									print "field Currency Precision: " + currency.precision.to_s + "\n"
								end
							end
							print "field ID: " + field.id.to_s + "\n"
							if field.custom_field != nil
								print "field CustomField: " + field.custom_field.to_s + "\n"
							end
							lookup = field.lookup
							if lookup != nil
								print "field ModuleLookup DisplayLabel: " + lookup.display_label.to_s + "\n"
								print "field ModuleLookup RevalidateFilterDuringEdit: " + lookup.revalidate_filter_during_edit.to_s + "\n"
								print "field ModuleLookup APIName: " + lookup.api_name.to_s + "\n"
								module_1 = lookup.module
								if module_1 != nil
									print "field ModuleLookup Module APIName: " + module_1.api_name.to_s + "\n"
									print "field ModuleLookup Module Id: " + module_1.id.to_s + "\n"
								end
								querydetails = lookup.query_details
								if querydetails != nil
									print "field ModuleLookup QueryDetails Query Id: " + querydetails.query_id.to_s + "\n"
								end
								if lookup.id != nil
									print "field ModuleLookup ID: " + lookup.id.to_s + "\n"
								end
							end
							print "field Filterable: " + field.filterable.to_s + "\n"
							if field.visible != nil
								print "field Visible: " + field.visible.to_s + "\n"
							end
							field_profiles= field.profiles
							field_profiles.each do |field_profile|
								print "profile permission Type " + field_profile.permission_type.to_s + "\n"
								print "profile Name  " + field_profile.name.to_s + "\n"
								print "profile ID  " + field_profile.id.to_s + "\n"
							end
							if field.length != nil
								print "field Length: " + field.length.to_s + "\n"
							end
							view_type = field.view_type
							if view_type != nil
								print "field ViewType View: " + view_type.view.to_s + "\n"
								print "field ViewType Edit: " + view_type.edit.to_s + "\n"
								print "field ViewType Create: " + view_type.create.to_s + "\n"
								print "field ViewType QuickCreate: " + view_type.quick_create.to_s + "\n"
							end
							if field.display_field != nil
								print "field DisplayField " + field.display_field.to_s + "\n"
							end
							if field.pick_list_values_sorted_lexically != nil
								print "field pick list values lexically sorted: " + field.pick_list_values_sorted_lexically.to_s + "\n"
							end
							if field.sortable != nil
								print "field sortable " + field.sortable.to_s + "\n"
							end
							subform = field.associated_module
							if subform != nil
								print "field Subform Module: " + subform.module.to_s + "\n"
								print "field Subform ID: " + subform.id.to_s + "\n"
							end
							if field.sequence_number != nil
								print "field sequence number " + field.sequence_number.to_s + "\n"
							end
							if field.external != nil
								print "get External show " + field.external.show.to_s + "\n"
								print "get External type" + field.external.type.to_s + "\n"
								print "allow multiple config" + field.external.allow_multiple_config.to_s + "\n"
							end
							print "field APIName: " + field.api_name.to_s + "\n"
							unique1 = field.unique
							if unique1 != nil
								if unique1.is_a? ZOHOCRMSDK::Fields::Unique
									unique = unique1
									print "field Unique Casesensitive : " + unique.casesensitive.to_s + "\n"
								else
									print "field Unique : " + unique1.to_s + "\n"
								end
							end
							if field.history_tracking != nil
								historytracking = field.history_tracking
								module_1 = historytracking.module
								if module_1 != nil
									module_layout = module_1.layout
									if module_layout != nil
										print "module layout id" + module_layout.id.to_s + "\n"
									end
									print "module  display label" + module_1.display_label.to_s + "\n"
									print "module  api name" + module_1.api_name.to_s + "\n"
									print "module  id" + module_1.id.to_s + "\n"
									print "module  module_1" + module_1.module.to_s + "\n"
									print "module  module_1 name" + module_1.module_name.to_s + "\n"
								end
								duration_configured = historytracking.duration_configured_field
								if duration_configured != nil
									print "historytracking duration configured field" + duration_configured.id.to_s + "\n"
								end
							end
							print "field DataType: " + field.data_type.to_s + "\n"
							formula = field.formula
							if formula != nil
								print "field Formula ReturnType : " + formula.return_type.to_s + "\n"
								if formula.expression != nil
									print "field Formula Expression : " + formula.expression.to_s + "\n"
								end
							end
							if field.decimal_place != nil
								print "field DecimalPlace: " + field.decimal_place.to_s + "\n"
							end
							print "field MassUpdate: " + field.mass_update.to_s + "\n"
							if field.blueprint_supported != nil
								print "field BlueprintSupported: " + field.blueprint_supported.to_s + "\n"
							end
							multi_select_lookup = field.multiselectlookup
							if multi_select_lookup != nil
								print "field MultiSelectLookup DisplayLabel: " + multi_select_lookup.display_label.to_s + "\n"
								print "field MultiSelectLookup LinkingModule: " + multi_select_lookup.linking_module.to_s + "\n"
								print "field MultiSelectLookup LookupApiname: " + multi_select_lookup.lookup_apiname.to_s + "\n"
								print "field MultiSelectLookup APIName: " + multi_select_lookup.api_name.to_s + "\n"
								print "field MultiSelectLookup ConnectedlookupApiname: " + multi_select_lookup.connectedlookup_apiname.to_s + "\n"
								print "field MultiSelectLookup ID: " + multi_select_lookup.id.to_s + "\n"
								print "field MultiSelectLookup connected module: " + multi_select_lookup.connected_module.to_s + "\n"
							end
							pick_list_values= field.pick_list_values
							if pick_list_values != nil
								pick_list_values.each do |pick_list_value|
									print_pick_list_value(pick_list_value)
								end
							end
							auto_number = field.auto_number
							if auto_number != nil
								print "field AutoNumber Prefix: " + auto_number.prefix.to_s + "\n"
								print "field AutoNumber Suffix: " + auto_number.suffix.to_s + "\n"
								if auto_number.start_number != nil
									print "field AutoNumber StartNumber: " + auto_number.start_number.to_s + "\n"
								end
							end
							if field.default_value != nil
								print "field DefaultValue: " + field.default_value.to_s + "\n"
							end
							if field.convert_mapping != nil
								convert_mapping = field.convert_mapping
								print convert_mapping.accounts.to_s + "\n"
								print convert_mapping.contacts.to_s + "\n"
								print convert_mapping.deals.to_s + "\n"
							end
							if field.multiuserlookup != nil
								multiuserlookup = field.multiuserlookup
								print "get Multiselectlookup DisplayLabel" + multiuserlookup.display_label.to_s + "\n"
								print "get Multiselectlookup LinkingModule" + multiuserlookup.linking_module.to_s + "\n"
								print "get Multiselectlookup LookupAPIName" + multiuserlookup.lookup_apiname.to_s + "\n"
								print "get Multiselectlookup APIName" + multiuserlookup.api_name.to_s + "\n"
								print "get Multiselectlookup Id" + multiuserlookup.id.to_s + "\n"
								print "get Multiselectlookup ConnectedModule" + multiuserlookup.connected_module.to_s + "\n"
								print "get Multiselectlookup ConnectedlookupAPIName" + multiuserlookup.connectedlookup_apiname.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Fields::APIException
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
		def self.print_pick_list_value(pick_list_value)
			print "fields PickListValue DisplayValue: " + pick_list_value.display_value.to_s + "\n"
			print "fields PickListValue Probability: " + pick_list_value.probability.to_s + "\n"
			print "fields PickListValue ForecastCategory: " + pick_list_value.forecast_category.to_s + "\n"
			print "fields PickListValue SequenceNumber: " + pick_list_value.sequence_number.to_s + "\n"
			print "fields PickListValue ExpectedDataType: " + pick_list_value.expected_data_type.to_s + "\n"
			print "fields PickListValue ActualValue: " + pick_list_value.actual_value.to_s + "\n"
			print "fields PickListValue SysRefName: " + pick_list_value.sys_ref_name.to_s + "\n"
			print "fields PickListValue Type: " + pick_list_value.type.to_s + "\n"
			print "fields PickListValue Id: " + pick_list_value.id.to_s + "\n"
			print "fields PickListValue ForecastType: " + pick_list_value.forecast_type.to_s + "\n"
			if pick_list_value.maps != nil
				pick_list_value.each do |map|
					print map.to_s + "\n"
					pick_list_values= map.pick_list_values
					if pick_list_values != nil
						pick_list_values.each do |pick_list_value1|
							print_pick_list_value(pick_list_value1)
						end
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
				get_fields(module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
GetFields.initialize_and_call