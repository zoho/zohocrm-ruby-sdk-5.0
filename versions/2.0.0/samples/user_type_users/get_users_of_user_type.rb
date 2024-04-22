require "ZOHOCRMSDK5_0"

class GetUsersOfUserType
		def self.get_users_of_user_type(portal_name, user_type_id)
			user_type_operations =  ZOHOCRMSDK::UserTypeUsers::UserTypeUsersOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			response = user_type_operations.get_users_of_user_type(user_type_id, portal_name, param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::UserTypeUsers::ResponseWrapper
						response_wrapper = response_handler
						users= response_wrapper.users
						users.each do |user|
							print "users PersonalityId: " + user.personality_id.to_s + "\n"
							print "users Confirm: " + user.confirm.to_s + "\n"
							print "users StatusReasonS: " + user.status_reason__s.to_s + "\n"
							print "users InvitedTime: " + user.invited_time.to_s + "\n"
							print "users Module: " + user.module.to_s + "\n"
							print "users Name: " + user.name.to_s + "\n"
							print "users Active: " + user.active.to_s + "\n"
							print "users Email: " + user.email.to_s + "\n"
						end
						info = response_wrapper.info
						if info != nil
							if info.per_page != nil
								print "users Info PerPage: " + info.per_page.to_s + "\n"
							end
							if info.count != nil
								print "users Info Count: " + info.count.to_s + "\n"
							end
							if info.page != nil
								print "users Info Page: " + info.page.to_s + "\n"
							end
							if info.more_records != nil
								print "users Info MoreRecords: " + info.more_records.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::UserTypeUsers::APIException
						exception = response_handler
						print "status: " + exception.status.value.to_s + "\n"
						print "code: " + exception.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						exception.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + exception.message.to_s + "\n"
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
	def self.initialize_and_call
			begin
				environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				portal_name = "portals_ap_itest100"
				user_type_id = 440248001304019
				get_users_of_user_type(portal_name, user_type_id)
			rescue Exception => e
				raise e
			end
		end
end
GetUsersOfUserType.initialize_and_call