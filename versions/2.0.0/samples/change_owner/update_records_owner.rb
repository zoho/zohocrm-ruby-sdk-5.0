require "ZOHOCRMSDK5_0"

class UpdateRecordsOwner
		def self.update_records_owner(module_api_name)
			change_owner_operations =  ZOHOCRMSDK::ChangeOwner::ChangeOwnerOperations.new(module_api_name)
			body_wrapper =  ZOHOCRMSDK::ChangeOwner::MassWrapper.new
			ids=[]
			ids.push(6230300676)
			ids.push(6237134001)
			body_wrapper.ids = ids
			owner =  ZOHOCRMSDK::ChangeOwner::Owner.new
			owner.id = 623700001
			body_wrapper.owner = owner
			body_wrapper.notify = true
			related_modules=[]
			related_module =  ZOHOCRMSDK::ChangeOwner::RelatedModules.new
			related_module.id = 347706114686005
			related_module.api_name="Tasks"
			related_modules.push(related_module)
			related_module =  ZOHOCRMSDK::ChangeOwner::RelatedModules.new
			related_module.id = 347706114686005
			related_module.api_name="Tasks"
			related_modules.push(related_module)
			body_wrapper.related_modules = related_modules
			response = change_owner_operations.mass_update(body_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::ChangeOwner::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.data
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::ChangeOwner::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::ChangeOwner::APIException
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
					elsif action_handler.is_a? ZOHOCRMSDK::ChangeOwner::APIException
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
				module_api_name = "Leads"
				update_records_owner(module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
UpdateRecordsOwner.initialize_and_call