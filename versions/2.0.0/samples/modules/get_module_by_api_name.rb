require "ZOHOCRMSDK5_0"

class GetModuleByAPIName
		def self.get_module_by_api_name(module_api_name)
			module_operations =  ZOHOCRMSDK::Modules::ModulesOperations.new
			response = module_operations.get_module_by_api_name(module_api_name)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Modules::ResponseWrapper
						response_wrapper = response_handler
						modules= response_wrapper.modules
						modules.each do |module_1|
							print "module GlobalSearchSupported: " + module_1.global_search_supported.to_s + "\n"
							if module_1.kanban_view != nil
								print "module KanbanView: " + module_1.kanban_view.to_s + "\n"
							end
							print "module Deletable: " + module_1.deletable.to_s + "\n"
							print "module Description: " + module_1.description.to_s + "\n"
							print "module Creatable: " + module_1.creatable.to_s + "\n"
							if module_1.filter_status != nil
								print "module FilterStatus: " + module_1.filter_status.to_s + "\n"
							end
							print "module InventoryTemplateSupported: " + module_1.inventory_template_supported.to_s + "\n"
							if module_1.modified_time != nil
								print "module ModifiedTime: " + module_1.modified_time.to_s + "\n"
							end
							print "module PluralLabel: " + module_1.plural_label.to_s + "\n"
							print "module PresenceSubMenu: " + module_1.presence_sub_menu.to_s + "\n"
							print "module TriggersSupported: " + module_1.triggers_supported.to_s + "\n"
							print "module Id: " + module_1.id.to_s + "\n"
							print "module IsBlueprintSupported : " + module_1.isblueprintsupported.to_s + "\n"
							related_list_properties = module_1.related_list_properties
							if related_list_properties != nil
								print "module RelatedListProperties SortBy: " + related_list_properties.sort_by.to_s + "\n"
								fields= related_list_properties.fields
								if fields != nil
									fields.each do |field_name|
										print "module RelatedListProperties Fields: " + field_name.to_s + "\n"
									end
								end
								print "module RelatedListProperties SortOrder: " + related_list_properties.sort_order.to_s + "\n"
							end
							print "module PerPage: " + module_1.per_page.to_s + "\n"
							properties= module_1.properties
							if properties != nil
								properties.each do |field_name|
									print "module Properties Fields: " + field_name.to_s + "\n"
								end
							end
							print "module visible: " + module_1.visible.to_s + "\n"
							print "module Visibility: " + module_1.visibility.to_s + "\n"
							print "module Convertable: " + module_1.convertable.to_s + "\n"
							print "module Editable: " + module_1.editable.to_s + "\n"
							print "module EmailtemplateSupport: " + module_1.emailtemplate_support.to_s + "\n"
							profiles= module_1.profiles
							if profiles != nil
								profiles.each do |profile|
									print "module Profile Name: " + profile.name.to_s + "\n"
									print "module Profile Id: " + profile.id.to_s + "\n"
								end
							end
							print "module FilterSupported: " + module_1.filter_supported.to_s + "\n"
							on_demand_properties= module_1.on_demand_properties
							if on_demand_properties != nil
								on_demand_properties.each do |field_name|
									print "module on_demand_properties Fields: " + field_name.to_s + "\n"
								end
							end
							print "module DisplayField: " + module_1.display_field.to_s + "\n"
							search_layout_fields= module_1.search_layout_fields
							if search_layout_fields != nil
								search_layout_fields.each do |field_name|
									print "module SearchLayoutFields Fields: " + field_name.to_s + "\n"
								end
							end
							if module_1.kanban_view_supported != nil
								print "module KanbanViewSupported: " + module_1.kanban_view_supported.to_s + "\n"
							end
							print "module ShowAsTab: " + module_1.show_as_tab.to_s + "\n"
							print "module WebLink: " + module_1.web_link.to_s + "\n"
							print "module SequenceNumber: " + module_1.sequence_number.to_s + "\n"
							print "module SingularLabel: " + module_1.singular_label.to_s + "\n"
							print "module Viewable: " + module_1.viewable.to_s + "\n"
							print "module APISupported: " + module_1.api_supported.to_s + "\n"
							print "module APIName: " + module_1.api_name.to_s + "\n"
							print "module QuickCreate: " + module_1.quick_create.to_s + "\n"
							modified_by= module_1.modified_by
							if modified_by != nil
								print "module Modified By User-Name: " + modified_by.name.to_s + "\n"
								print "module Modified By User-ID: " + modified_by.id.to_s + "\n"
							end
							print "module GeneratedType: " + module_1.generated_type.value.to_s + "\n"
							print "module FeedsRequired: " + module_1.feeds_required.to_s + "\n"
							print "module ScoringSupported: " + module_1.scoring_supported.to_s + "\n"
							print "module WebformSupported: " + module_1.webform_supported.to_s + "\n"
							arguments= module_1.arguments
							if arguments != nil
								arguments.each do |argument|
									print "module Argument Name: " + argument.name.to_s + "\n"
									print "module Argument Value: " + argument.value.to_s + "\n"
								end
							end
							print "module ModuleName: " + module_1.module_name.to_s + "\n"
							print "module BusinessCardFieldLimit: " + module_1.business_card_field_limit.to_s + "\n"
							custom_view = module_1.custom_view
							if custom_view != nil
								print_custom_view(custom_view)
							end
							parent_module = module_1.parent_module
							if parent_module != nil
								print "module Parent Module Name: " + parent_module.api_name.to_s + "\n"
								print "module Parent Module Id: " + parent_module.id.to_s + "\n"
							end
							territory = module_1.territory
							if territory != nil
								print "module Territory Name: " + territory.name.to_s + "\n"
								print "module Territory Id: " + territory.id.to_s + "\n"
								print "module Territory Subordinates: " + territory.subordinates.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Modules::APIException
						exception = response_handler
						print "status: " + exception.status.value.to_s + "\n"
						print "code: " + exception.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						if exception.details != nil
							exception.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
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
		def self.print_custom_view(custom_view)
			print "module CustomView DisplayValue: " + custom_view.display_value.to_s + "\n"
			if custom_view.created_time != nil
				print "module CustomView CreatedTime: " + custom_view.created_time.to_s + "\n"
			end
			print "module CustomView AccessType: " + custom_view.access_type.to_s + "\n"
			criteria = custom_view.criteria
			if criteria != nil
				print_criteria(criteria)
			end
			print "module CustomView SystemName: " + custom_view.system_name.to_s + "\n"
			print "module CustomView SortBy: " + custom_view.sort_by.to_s + "\n"
			created_by = custom_view.created_by
			if created_by != nil
				print "module Created By User-Name: " + created_by.name.to_s + "\n"
				print "module Created By User-ID: " + created_by.id.to_s + "\n"
			end
			shared_to_details= custom_view.shared_to
			if shared_to_details != nil
				shared_to_details.each do |shared_to|
					print "shared_details Name: " + shared_to.name.to_s + "\n"
					print "shared_details ID: " + shared_to.id.to_s + "\n"
					print "shared_details Type: " + shared_to.type.to_s + "\n"
					print "shared_details Subordinates: " + shared_to.subordinates.to_s + "\n"
				end
			end
			print "module CustomView Default: " + custom_view.default.to_s + "\n"
			if custom_view.modified_time != nil
				print "module CustomView ModifiedTime: " + custom_view.modified_time.to_s + "\n"
			end
			print "module CustomView Name: " + custom_view.name.to_s + "\n"
			print "module CustomView SystemDefined: " + custom_view.system_defined.to_s + "\n"
			modified_by = custom_view.modified_by
			if modified_by != nil
				print "module Modified By User-Name: " + modified_by.name.to_s + "\n"
				print "module Modified By User-ID: " + modified_by.id.to_s + "\n"
			end
			print "module CustomView ID: " + custom_view.id.to_s + "\n"
			fields= custom_view.fields
			if fields != nil
				fields.each do |field|
					print "module CustomView Field Id: " + field.id.to_s + "\n"
					print "module CustomView Field APIName: " + field.api_name.to_s + "\n"
				end
			end
			print "module CustomView Category: " + custom_view.category.to_s + "\n"
			if custom_view.last_accessed_time != nil
				print "module CustomView LastAccessedTime: " + custom_view.last_accessed_time.to_s + "\n"
			end
			if custom_view.favorite != nil
				print "module CustomView Favorite: " + custom_view.favorite.to_s + "\n"
			end
			if custom_view.sort_order != nil
				print "module CustomView SortOrder: " + custom_view.sort_order.to_s + "\n"
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
				module_api_name = "leads"
				get_module_by_api_name(module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
GetModuleByAPIName.initialize_and_call