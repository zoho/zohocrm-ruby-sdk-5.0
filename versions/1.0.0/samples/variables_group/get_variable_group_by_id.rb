require "ZOHOCRMSDK5_0"

class GetVariableGroupById
		def self.get_variable_group_by_id(variable_group_id)
			variable_groups_operations =  ZOHOCRMSDK::VariableGroups::VariableGroupsOperations.new
			response = variable_groups_operations.get_variable_group_by_id(variable_group_id)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::VariableGroups::ResponseWrapper
						response_wrapper = response_handler
						variable_groups= response_wrapper.variable_groups
						variable_groups.each do |variable_group|
							print "variable_group DisplayLabel: " + variable_group.display_label.to_s + "\n"
							print "variable_group APIName: " + variable_group.api_name.to_s + "\n"
							print "variable_group Name: " + variable_group.name.to_s + "\n"
							print "variable_group Description: " + variable_group.description.to_s + "\n"
							print "variable_group ID: " + variable_group.id.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::VariableGroups::APIException
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
				variable_group_id = "4402480345005"
				get_variable_group_by_id(variable_group_id)
			rescue Exception => e
				raise e
			end
		end
end
GetVariableGroupById.initialize_and_call