require "ZOHOCRMSDK5_0"

class GetModules
		def self.get_modules
			module_operations =  ZOHOCRMSDK::Modules::ModulesOperations.new
			header_instance =  ZOHOCRMSDK::HeaderMap.new
			ifmodifiedsince = DateTime.new(2020, 05, 20, 10, 00, 00, "+05:30")
			header_instance.add(ZOHOCRMSDK::Modules::ModulesOperations::GetModulesHeader.If_modified_since, ifmodifiedsince)
			response = module_operations.get_modules(header_instance)
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
							print "module Deletable: " + module_1.deletable.to_s + "\n"
							print "module Description: " + module_1.description.to_s + "\n"
							print "module Creatable: " + module_1.creatable.to_s + "\n"
							print "module InventoryTemplateSupported: " + module_1.inventory_template_supported.to_s + "\n"
							if module_1.modified_time != nil
								print "module ModifiedTime: " + module_1.modified_time.to_s + "\n"
							end
							print "module PluralLabel: " + module_1.plural_label.to_s + "\n"
							print "module PresenceSubMenu: " + module_1.presence_sub_menu.to_s + "\n"
							print "module TriggersSupported: " + module_1.triggers_supported.to_s + "\n"
							print "module Id: " + module_1.id.to_s + "\n"
							print "module IsBlueprintSupported: " + module_1.isblueprintsupported.to_s + "\n"
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
							parent_module = module_1.parent_module
							if parent_module != nil
								print "module Parent Module Name: " + parent_module.api_name.to_s + "\n"
								print "module Parent Module Id: " + parent_module.id.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Modules::APIException
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
				get_modules
			rescue Exception => e
				raise e
			end
		end
end
GetModules.initialize_and_call