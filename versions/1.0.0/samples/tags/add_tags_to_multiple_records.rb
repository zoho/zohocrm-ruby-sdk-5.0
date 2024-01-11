require "ZOHOCRMSDK5_0"

class AddTagsToMultipleRecords
		def self.add_tags_to_multiple_records(module_api_name, record_ids)
			tags_operations =  ZOHOCRMSDK::Tags::TagsOperations.new
			request =  ZOHOCRMSDK::Tags::NewTagRequestWrapper.new
			tag_list=[]
			tag1=ZOHOCRMSDK::Tags::Tag.new
			tag1.name="tagNam3e3e12345"
			tag_list.push(tag1)
			request.tags = tag_list
			request.over_write = true
			request.ids = record_ids
			request.over_write = false
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			response = tags_operations.add_tags_to_multiple_records(module_api_name, request, param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					record_action_handler = response.data_object
					if record_action_handler.is_a? ZOHOCRMSDK::Tags::RecordActionWrapper
						record_action_wrapper = record_action_handler
						action_responses= record_action_wrapper.data
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::Tags::RecordSuccessResponse
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
						if record_action_wrapper.locked_count != nil
							print "locked Count: " + record_action_wrapper.locked_count.to_s + "\n"
						end
						if record_action_wrapper.success_count != nil
							print "success Count: " + record_action_wrapper.success_count.to_s + "\n"
						end
						if record_action_wrapper.wf_scheduler != nil
							print "wf Scheduler: " + record_action_wrapper.wf_scheduler.to_s + "\n"
						end
					elsif record_action_handler.is_a? ZOHOCRMSDK::Tags::APIException
						exception = record_action_handler
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
				record_ids=[]
				add_tags_to_multiple_records(module_api_name, record_ids)
			rescue Exception => e
				raise e
			end
		end
end
AddTagsToMultipleRecords.initialize_and_call