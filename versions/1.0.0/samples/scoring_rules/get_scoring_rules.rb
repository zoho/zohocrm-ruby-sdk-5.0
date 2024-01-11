require "ZOHOCRMSDK5_0"

class GetScoringRules
		def self.get_scoring_rules
			scoring_rules_operations =  ZOHOCRMSDK::ScoringRules::ScoringRulesOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::ScoringRules::ScoringRulesOperations::GetScoringRulesParam.module, "leads")
			response = scoring_rules_operations.get_scoring_rules(param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::ScoringRules::ResponseWrapper
						response_wrapper = response_handler
						scoring_rules= response_wrapper.scoring_rules
						scoring_rules.each do |scoring_rule|
							layout = scoring_rule.layout
							if layout != nil
								print "scoring_rule Layout ID: " + layout.id.to_s + "\n"
								print "scoring_rule Layout APIName: " + layout.api_name.to_s + "\n"
							end
							print "scoring_rule CreatedTime: " + scoring_rule.created_time.to_s + "\n"
							print "scoring_rule ModifiedTime: " + scoring_rule.modified_time.to_s + "\n"
							field_rules= scoring_rule.field_rules
							field_rules.each do |field_rule|
								print "scoring_rule FieldRule Score: " + field_rule.score.to_s + "\n"
								criteria = field_rule.criteria
								if criteria != nil
									print_criteria(criteria)
								end
								print "scoring_rule FieldRule Id: " + field_rule.id.to_s + "\n"
							end
							module_1= scoring_rule.module
							if module_1 != nil
								print "scoring_rule Module ID: " + module_1.id.to_s + "\n"
								print "scoring_rule Module APIName: " + module_1.api_name.to_s + "\n"
							end
							print "scoring_rule Name: " + scoring_rule.name.to_s + "\n"
							modified_by = scoring_rule.modified_by
							if modified_by != nil
								print "scoring_rule Modified By Name : " + modified_by.name.to_s + "\n"
								print "scoring_rule Modified By id : " + modified_by.id.to_s + "\n"
							end
							print "scoring_rule Active: " + scoring_rule.active.to_s + "\n"
							print "scoring_rule Description: " + scoring_rule.description.to_s + "\n"
							print "scoring_rule Id: " + scoring_rule.id.to_s + "\n"
							signal_rules= scoring_rule.signal_rules
							if signal_rules != nil
								signal_rules.each do |signal_rule|
									print "scoring_rule SignalRule Score: " + signal_rule.score.to_s + "\n"
									print "scoring_rule SignalRule Id: " + signal_rule.id.to_s + "\n"
									signal = signal_rule.signal
									if signal != nil
										print "scoring_rule SignalRule Signal Namespace: " + signal.namespace.to_s + "\n"
										print "scoring_rule SignalRule Signal Id: " + signal.id.to_s + "\n"
									end
								end
							end
							created_by = scoring_rule.created_by
							if created_by != nil
								print "scoring_rule Created By Name : " + created_by.name.to_s + "\n"
								print "scoring_rule Created By id : " + created_by.id.to_s + "\n"
							end
						end
						info = response_wrapper.info
						if info != nil
							if info.per_page != nil
								print "info PerPage: " + info.per_page.to_s + "\n"
							end
							if info.count != nil
								print "info Count: " + info.count.to_s + "\n"
							end
							if info.page != nil
								print "info Page: " + info.page.to_s + "\n"
							end
							if info.more_records != nil
								print "info MoreRecords: " + info.more_records.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::ScoringRules::APIException
						exception = response_handler
						print "status: " + exception.status.value.to_s + "\n"
						print "code: " + exception.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						exception.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + exception.message.value.to_s + "\n"
					end
				elsif response.status_code != 204
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
				get_scoring_rules
			rescue Exception => e
				raise e
			end
		end
end
GetScoringRules.initialize_and_call