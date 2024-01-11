require "ZOHOCRMSDK5_0"

class TransferAndDelete
		def self.transfer_and_delete(layout_id)
			pipeline_operations =  ZOHOCRMSDK::Pipeline::PipelineOperations.new(layout_id)
			request =  ZOHOCRMSDK::Pipeline::TransferPipelineWrapper.new
			transfer_pipelines=[]
			transfer_pipeline =  ZOHOCRMSDK::Pipeline::TransferPipeline.new
			pipeline=ZOHOCRMSDK::Pipeline::TPipeline.new
			pipeline.from = 347706116634118
			pipeline.to = 34770619599012
			transfer_pipeline.pipeline = pipeline
			stages=[]
			stage =  ZOHOCRMSDK::Pipeline::Stages.new
			stage.from = 3652397006817
			stage.to = 3652397006819
			stages.push(stage)
			transfer_pipeline.stages = stages
			transfer_pipelines.push(transfer_pipeline)
			request.transfer_pipeline = transfer_pipelines
			response = pipeline_operations.transfer_pipelines(request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					transfer_action_handler = response.data_object
					if transfer_action_handler.is_a? ZOHOCRMSDK::Pipeline::TransferPipelineActionWrapper
						transfer_action_wrapper = transfer_action_handler
						transfer_pipelines1= transfer_action_wrapper.transfer_pipeline
						transfer_pipelines1.each do |transfer_pipeline1|
							if transfer_pipeline1.is_a? ZOHOCRMSDK::Pipeline::TransferPipelineSuccessResponse
								success_response = transfer_pipeline1
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif transfer_pipeline1.is_a? ZOHOCRMSDK::Pipeline::APIException
								exception = transfer_pipeline1
								print "status: " + exception.status.value.to_s + "\n"
								print "code: " + exception.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								exception.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + exception.message.to_s + "\n"
							end
						end
					elsif transfer_action_handler.is_a? ZOHOCRMSDK::Pipeline::APIException
						exception = transfer_action_handler
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
				transfer_and_delete(layout_id)
			rescue Exception => e
				raise e
			end
		end
end
TransferAndDelete.initialize_and_call