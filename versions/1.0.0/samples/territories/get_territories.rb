require "ZOHOCRMSDK5_0"

class GetTerritories
		def self.get_territories
			territories_operations =  ZOHOCRMSDK::Territories::TerritoriesOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			response = territories_operations.get_territories(param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Territories::ResponseWrapper
						response_wrapper = response_handler
						territory_list= response_wrapper.territories
						territory_list.each do |territory|
							print "territory CreatedTime: " + territory.created_time.to_s + "\n"
							print "territory permission type: " + territory.permission_type.to_s + "\n"
							print "territory ModifiedTime: " + territory.modified_time.to_s + "\n"
							manager = territory.manager
							if manager != nil
								print "territory Manager User-Name: " + manager.name.to_s + "\n"
								print "territory Manager User-ID: " + manager.id.to_s + "\n"
							end
							account_rule_criteria = territory.account_rule_criteria
							if account_rule_criteria != nil
								print_criteria(account_rule_criteria)
							end
							print "territory Name: " + territory.name.to_s + "\n"
							modified_by= territory.modified_by
							if modified_by != nil
								print "territory Modified By User-Name: " + modified_by.name.to_s + "\n"
								print "territory Modified By User-ID: " + modified_by.id.to_s + "\n"
							end
							deal_rule_criteria1 = territory.deal_rule_criteria
							if deal_rule_criteria1 != nil
								print_criteria(deal_rule_criteria1)
							end
							print "territory Description: " + territory.description.to_s + "\n"
							print "territory ID: " + territory.id.to_s + "\n"
							created_by= territory.created_by
							if modified_by != nil
								print "territory Created By User-Name: " + created_by.name.to_s + "\n"
								print "territory Created By User-ID: " + created_by.id.to_s + "\n"
							end
							reporting_to= territory.reporting_to
							if reporting_to != nil
								print "territory reporting By Territory-Name: " + reporting_to.name.to_s + "\n"
								print "territory reporting By Territory-ID: " + reporting_to.id.to_s + "\n"
							end
						end
						info = response_wrapper.info
						if info != nil
							if info.per_page != nil
								print "territory Info PerPage: " + info.per_page.to_s + "\n"
							end
							if info.count != nil
								print "territory Info Count: " + info.count.to_s + "\n"
							end
							if info.page != nil
								print "territory Info Page: " + info.page.to_s + "\n"
							end
							if info.more_records != nil
								print "territory Info MoreRecords: " + info.more_records.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Territories::APIException
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
				get_territories
			rescue Exception => e
				raise e
			end
		end
end
GetTerritories.initialize_and_call