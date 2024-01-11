require "ZOHOCRMSDK5_0"

class GetRelatedList
		def self.get_related_list(module_api_name, related_list_id, layout_id)
			related_lists_operations =  ZOHOCRMSDK::RelatedLists::RelatedListsOperations.new(layout_id)
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::RelatedLists::RelatedListsOperations::GetRelatedListsParam.module, module_api_name)
			response = related_lists_operations.get_related_list(related_list_id, param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::RelatedLists::ResponseWrapper
						response_wrapper = response_handler
						related_lists= response_wrapper.related_lists
						related_lists.each do |related_list|
							print "related_list SequenceNumber: " + related_list.sequence_number.to_s + "\n"
							print "related_list DisplayLabel: " + related_list.display_label.to_s + "\n"
							print "related_list APIName: " + related_list.api_name.to_s + "\n"
							print "related_list Module: " + related_list.module.to_s + "\n"
							print "related_list Name: " + related_list.name.to_s + "\n"
							print "related_list Action: " + related_list.action.to_s + "\n"
							print "related_list ID: " + related_list.id.to_s + "\n"
							print "related_list Href: " + related_list.href.to_s + "\n"
							print "related_list Type: " + related_list.type.to_s + "\n"
							print "related_list Connectedmodule: " + related_list.connectedmodule.to_s + "\n"
							print "related_list Linkingmodule: " + related_list.linkingmodule.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::RelatedLists::APIException
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
				related_list_id = 5255085067912
				layout_id = 323131431
				get_related_list(module_api_name, related_list_id, layout_id)
			rescue Exception => e
				raise e
			end
		end
end
GetRelatedList.initialize_and_call