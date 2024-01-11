require "ZOHOCRMSDK5_0"

class UpdateTag
		def self.update_tag(module_api_name, tag_id)
			tags_operations =  ZOHOCRMSDK::Tags::TagsOperations.new
			request =  ZOHOCRMSDK::Tags::BodyWrapper.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Tags::TagsOperations::UpdateTagParam.module, module_api_name)
			tag_list=[]
			tag1=ZOHOCRMSDK::Tags::Tag.new
			tag1.name="Java SDK"
			tag1.color_code =  ZOHOCRMSDK::Util::Choice.new("#f48435")
			tag_list.push(tag1)
			request.tags = tag_list
			response = tags_operations.update_tag(tag_id, request, param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::Tags::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.tags
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::Tags::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::Tags::APIException
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
					elsif action_handler.is_a? ZOHOCRMSDK::Tags::APIException
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
				module_api_name = "leads"
				tag_id = "34770615794039"
				update_tag(module_api_name, tag_id)
			rescue Exception => e
				raise e
			end
		end
end
UpdateTag.initialize_and_call