require "ZOHOCRMSDK5_0"

class CreatePipelines
		def self.create_pipelines(layout_id)
			pipeline_operations =  ZOHOCRMSDK::Pipeline::PipelineOperations.new(layout_id)
			body_wrapper =  ZOHOCRMSDK::Pipeline::BodyWrapper.new
			pipelines=[]
			pipe_line=ZOHOCRMSDK::Pipeline::Pipeline.new
			pipe_line.display_value="Pipeline1gfgff"
			pipe_line.default = true
			maps=[]
			pick_list_value =  ZOHOCRMSDK::Pipeline::Maps.new
			pick_list_value.sequence_number = 1
			pick_list_value.id = 3477061006805
			pick_list_value.display_value="Closed Won"
			maps.push(pick_list_value)
			pipe_line.maps = maps
			pipelines.push(pipe_line)
			body_wrapper.pipeline = pipelines
			response = pipeline_operations.create_pipeline(body_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::Pipeline::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.pipeline
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::Pipeline::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::Pipeline::APIException
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
					elsif action_handler.is_a? ZOHOCRMSDK::Pipeline::APIException
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
				layout_id = 3477061091023
				create_pipelines(layout_id)
			rescue Exception => e
				raise e
			end
		end
end
CreatePipelines.initialize_and_call