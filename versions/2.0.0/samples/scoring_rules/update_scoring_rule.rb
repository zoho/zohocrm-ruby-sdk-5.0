require "ZOHOCRMSDK5_0"

class UpdateScoringRule
		def self.update_scoring_rule(id)
			scoring_rules_operations =  ZOHOCRMSDK::ScoringRules::ScoringRulesOperations.new
			body_wrapper =  ZOHOCRMSDK::ScoringRules::BodyWrapper.new
			scoring_rules=[]
			scoring_rule=ZOHOCRMSDK::ScoringRules::ScoringRule.new
			scoring_rule.name="Rule 10"
			scoring_rule.description="Rule for Module Leads"
			module_1=ZOHOCRMSDK::Modules::Modules.new
			module_1.api_name="Leads"
			module_1.id = 3477061002175
			scoring_rule.module = module_1
			layout =  ZOHOCRMSDK::ScoringRules::Layout.new
			layout.api_name="Standard"
			layout.id = 3477061091055
			scoring_rule.layout = layout
			scoring_rule.active = false
			field_rules=[]
			field_rule =  ZOHOCRMSDK::ScoringRules::FieldRule.new
			field_rule.score = 10
	#		field_rule.id = 347706114954005
	#		field_rule.delete = nil
			criteria =  ZOHOCRMSDK::ScoringRules::Criteria.new
			criteria.group_operator="or"
			group=[]
			criteria1 =  ZOHOCRMSDK::ScoringRules::Criteria.new
			field1=ZOHOCRMSDK::ScoringRules::Field.new
			field1.api_name="Company"
			criteria1.field = field1
			criteria1.comparator="equal"
			criteria1.value="zoho"
			group.push(criteria1)
			criteria2 =  ZOHOCRMSDK::ScoringRules::Criteria.new
			field2=ZOHOCRMSDK::ScoringRules::Field.new
			field2.api_name="Designation"
			criteria2.field = field2
			criteria2.comparator="equal"
			criteria2.value="review"
			group.push(criteria2)
			criteria3 =  ZOHOCRMSDK::ScoringRules::Criteria.new
			field3=ZOHOCRMSDK::ScoringRules::Field.new
			field3.api_name="Last_Name"
			criteria3.field = field3
			criteria3.comparator="equal"
			criteria3.value="SDK"
			group.push(criteria3)
			criteria.group = group
			field_rule.criteria = criteria
			field_rules.push(field_rule)
			scoring_rule.field_rules = field_rules
			signal_rules=[]
			signal_rule =  ZOHOCRMSDK::ScoringRules::SignalRule.new
			signal_rule.id="4836976111233"
			signal_rule.score = 10
			signal =  ZOHOCRMSDK::ScoringRules::Signal.new
			signal.id = 4876876112019
			signal.namespace="Email_Incoming__s"
			signal_rule.signal = signal
			signal_rules.push(signal_rule)
			scoring_rule.signal_rules = signal_rules
			scoring_rules.push(scoring_rule)
			body_wrapper.scoring_rules = scoring_rules
			response = scoring_rules_operations.update_scoring_rule(id, body_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::ScoringRules::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.scoring_rules
						action_responses.each do |action_response|
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
						end
					elsif action_handler.is_a? ZOHOCRMSDK::ScoringRules::APIException
						exception = action_handler
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
				id = 347706114966002
				update_scoring_rule(id)
			rescue Exception => e
				raise e
			end
		end
end
UpdateScoringRule.initialize_and_call
