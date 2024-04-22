require "ZOHOCRMSDK5_0"

class ScoringRuleExecutionUsingLayoutId
		def self.scoring_rule_execution_using_layout_id(module_api_name)
			scoring_rules_operations =  ZOHOCRMSDK::ScoringRules::ScoringRulesOperations.new
			body_wrapper =  ZOHOCRMSDK::ScoringRules::LayoutRequestWrapper.new
			layout =  ZOHOCRMSDK::ScoringRules::Layout.new
			layout.id = 3477061091055
			body_wrapper.layout = layout
			response = scoring_rules_operations.scoring_rule_execution_using_layout_id(module_api_name, body_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_response = response.data_object
					if action_response.is_a? ZOHOCRMSDK::ScoringRules::SuccessResponse
						success_response = action_response
						print "status: " + success_response.status.value.to_s + "\n"
						print "code: " + success_response.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						success_response.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + success_response.message.value.to_s + "\n"
					elsif action_response.is_a? ZOHOCRMSDK::ScoringRules::APIException
						exception = action_response
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
				scoring_rule_execution_using_layout_id(module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
ScoringRuleExecutionUsingLayoutId.initialize_and_call
