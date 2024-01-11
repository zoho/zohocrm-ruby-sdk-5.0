require "ZOHOCRMSDK5_0"

class GetUsersUnavailabilites
		def self.get_users_unavailabilites
			users_unavailability_operations =  ZOHOCRMSDK::UsersUnavailability::UsersUnavailabilityOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::UsersUnavailability::UsersUnavailabilityOperations::GetUsersUnavailabilityParam.group_ids, "34770619,3477061912")
			param_instance.add(ZOHOCRMSDK::UsersUnavailability::UsersUnavailabilityOperations::GetUsersUnavailabilityParam.include_inner_details, "56xxx8")
			param_instance.add(ZOHOCRMSDK::UsersUnavailability::UsersUnavailabilityOperations::GetUsersUnavailabilityParam.role_ids, "343370619,3403706191")
			param_instance.add(ZOHOCRMSDK::UsersUnavailability::UsersUnavailabilityOperations::GetUsersUnavailabilityParam.territory_ids, "343370619,3403706191")
			filters =  {}
			filters.store("group_operator", "or")
			group= []
			criteria1 = {}
			criteria1.store("comparator", "between")
			criteria1_field =  {}
			criteria1_field.store("api_name", "from")
			criteria1.store("field", criteria1_field)
			criteria1_value= []
			criteria1_value.store("2021-02-18t19:00:00+05:30")
			criteria1_value.store("2021-02-19t19:00:00+05:30")
			criteria1.store("value", criteria1_value)
			group.store(criteria1)
			criteria2 =  {}
			criteria2.store("comparator", "between")
			criteria2_field =  {}
			criteria2_field.store("api_name", "to")
			criteria2.store("field", criteria2_field)
			criteria2_value= []
			criteria2_value.store("2021-02-18t20:00:00+05:30")
			criteria2_value.store("2021-02-19t20:00:00+05:30")
			criteria2.store("value", criteria2_value)
			group.store(criteria2)
			filters.store("group", group)
			param_instance.add(ZOHOCRMSDK::UsersUnavailability::UsersUnavailabilityOperations::GetUsersUnavailabilityParam.filters, filters.to_s + "\n")
			response = users_unavailability_operations.get_users_unavailability(param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::UsersUnavailability::ResponseWrapper
						response_wrapper = response_handler
						users= response_wrapper.users_unavailability
						users.each do |users_unavailability|
							print "users_unavailability Comments: " + users_unavailability.comments.to_s + "\n"
							print "users_unavailability From: " + users_unavailability.from.to_s + "\n"
							print "users_unavailability Id: " + users_unavailability.id.to_s + "\n"
							print "users_unavailability to: " + users_unavailability.to.to_s + "\n"
							user = users_unavailability.user
							if user != nil
								print "users_unavailability User-Name: " + user.name.to_s + "\n"
								print "users_unavailability User-Id: " + user.id.to_s + "\n"
								print "users_unavailability User-ZuId: " + user.zuid.to_s + "\n"
							end
						end
						info = response_wrapper.info
						if info != nil
							if info.per_page != nil
								print "user Info PerPage: " + info.per_page.to_s + "\n"
							end
							if info.count != nil
								print "user Info Count: " + info.count.to_s + "\n"
							end
							if info.page != nil
								print "user Info Page: " + info.page.to_s + "\n"
							end
							if info.more_records != nil
								print "user Info MoreRecords: " + info.more_records.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::UsersUnavailability::APIException
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
				get_users_unavailabilites
			rescue Exception => e
				raise e
			end
		end
end
GetUsersUnavailabilites.initialize_and_call
