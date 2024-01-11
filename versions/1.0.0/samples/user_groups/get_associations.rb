require "ZOHOCRMSDK5_0"

class GetAssociations
		def self.get_associations(group_id)
			user_groups_operations =  ZOHOCRMSDK::UserGroups::UserGroupsOperations.new
			response = user_groups_operations.get_associations(group_id)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::UserGroups::AssociationWrapper
						assoication_wrapper = response_handler
						associations= assoication_wrapper.associations
						if associations != nil
							associations.each do |association_response|
								print "associations Type : " + association_response.type.to_s + "\n"
								resource = association_response.resource
								if resource != nil
									print "associations Resource Id : " + resource.id.to_s + "\n"
									print "associations Resource Name : " + resource.name.to_s + "\n"
								end
								detail = association_response.detail
								if detail != nil
									module_1 = detail.module
									if module_1 != nil
										print "associations Module Id : " + module_1.id.to_s + "\n"
										print "associations Module Id : " + module_1.api_name.to_s + "\n"
										print "associations Module Id : " + module_1.module.to_s + "\n"
									end
								end
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::UserGroups::APIException
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
				group_id = 44024801326019
				get_associations(group_id)
			rescue Exception => e
				raise e
			end
		end
end
GetAssociations.initialize_and_call