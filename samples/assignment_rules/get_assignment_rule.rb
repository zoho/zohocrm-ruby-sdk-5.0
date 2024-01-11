require "ZOHOCRMSDK5_0"

	
class GetAssignmentRule
		def self.get_assignment_rule(assignment_rule_id, module_api_name)
			assignment_rule_operations =  ZOHOCRMSDK::AssignmentRules::AssignmentRulesOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::AssignmentRules::AssignmentRulesOperations::GetAssignmentRuleParam.module, module_api_name)
			response = assignment_rule_operations.get_assignment_rule(assignment_rule_id, param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.status_code == 204
					print "no Content".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::AssignmentRules::ResponseWrapper
						response_wrapper = response_handler
						assignment_rules= response_wrapper.assignment_rules
						assignment_rules.each do |assignment_rule|
							print "assignment_rule Modified Time: " + assignment_rule.modified_time.to_s + "\n"
							print "assignment_rule Created Time: " + assignment_rule.created_time.to_s + "\n"
							default_assignee = assignment_rule.default_assignee
							if default_assignee != nil
								print "assignment_rule DefaultUser User-ID: " + default_assignee.id.to_s + "\n"
								print "assignment_rule DefaultUser User-Name: " + default_assignee.name.to_s + "\n"
							end
							module_1 = assignment_rule.module
							if module_1 != nil
								print "assignment_rule Module ID: " + module_1.id.to_s + "\n"
								print "assignment_rule Module API Name: " + module_1.api_name.to_s + "\n"
							end
							print "assignment_rule Name: " + assignment_rule.name.to_s + "\n"
							modified_by= assignment_rule.modified_by
							if modified_by != nil
								print "assignment_rule Modified By User-Name: " + modified_by.name.to_s + "\n"
								print "assignment_rule Modified By User-ID: " + modified_by.id.to_s + "\n"
							end
							created_by= assignment_rule.created_by
							if created_by != nil
								print "assignment_rule Created By User-Name: " + created_by.name.to_s + "\n"
								print "assignment_rule Created By User-ID: " + created_by.id.to_s + "\n"
							end
							print "assignment_rule ID: " + assignment_rule.id.to_s + "\n"
						end

					elsif response_handler.is_a? ZOHOCRMSDK::AssignmentRules::APIException
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
	
	def self.initialize_and_call
			begin
				environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				module_api_name = "leads"
				get_assignment_rule(440248001307001, module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
GetAssignmentRule.initialize_and_call