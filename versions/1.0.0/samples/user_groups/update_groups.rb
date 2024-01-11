require "ZOHOCRMSDK5_0"

class UpdateGroups
		def self.update_groups
			user_groups_operations =  ZOHOCRMSDK::UserGroups::UserGroupsOperations.new
			request =  ZOHOCRMSDK::UserGroups::BodyWrapper.new
			user_list=[]
			user1=ZOHOCRMSDK::UserGroups::Groups.new
			user1.id = 31242354353423
			user1.name="test group"
			user1.description="my group"
			sources=[]
			source=ZOHOCRMSDK::UserGroups::Sources.new
			source.type =  ZOHOCRMSDK::Util::Choice.new("users")
			source1=ZOHOCRMSDK::UserGroups::Source.new
			source1.id = 4402480254001
			source.source = source1
			sources.push(source)
			user1.sources = sources
			user_list.push(user1)
			request.user_groups = user_list
			response = user_groups_operations.update_groups(request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::UserGroups::ActionWrapper
						response_wrapper = action_handler
						action_responses= response_wrapper.user_groups
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::UserGroups::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::UserGroups::APIException
								exception = action_response
								print "status: " + exception.status.value.to_s + "\n"
								print "code: " + exception.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								exception.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + exception.message.to_s + "\n"
							end
						end
					elsif action_handler.is_a? ZOHOCRMSDK::UserGroups::APIException
						exception = action_handler
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
				update_groups
			rescue Exception => e
				raise e
			end
		end
end
UpdateGroups.initialize_and_call