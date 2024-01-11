require "ZOHOCRMSDK5_0"

class GetPipelines
		def self.get_pipelines(layout_id)
			pipeline_operations =  ZOHOCRMSDK::Pipeline::PipelineOperations.new(layout_id)
			response = pipeline_operations.get_pipelines
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Pipeline::BodyWrapper
						response_wrapper = response_handler
						pipelines= response_wrapper.pipeline
						if pipelines != nil
							pipelines.each do |pipeline|
								print "pipeline ID: " + pipeline.id.to_s + "\n"
								print "pipeline default  : " + pipeline.default.to_s + "\n"
								print "pipeline Display value : " + pipeline.display_value.to_s + "\n"
								print "pipeline Actual value : " + pipeline.actual_value.to_s + "\n"
								print "pipeline child available  : " + pipeline.child_available.to_s + "\n"
								parent= pipeline.parent
								if parent != nil
									print "pipeline parent ID: " + parent.id.to_s + "\n"
								end
								maps= pipeline.maps
								maps.each do |map|
									print "pick_list_value Display Value: " + map.display_value.to_s + "\n"
									print "pick_list_value Sequence Number: " + map.sequence_number.to_s + "\n"
									forecast_category = map.forecast_category
									if forecast_category != nil
										print "forecast Category Name: " + forecast_category.name.to_s + "\n"
										print "forecast Category ID: " + forecast_category.id.to_s + "\n"
									end
									print "pick_list_value Actual Value: " + map.actual_value.to_s + "\n"
									print "pick_list_value ID: " + map.id.to_s + "\n"
									print "pick_list_value Forecast type: " + map.forecast_type.to_s + "\n"
									print "pick_list_value delete: " + map.delete.to_s + "\n"
								end
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Pipeline::APIException
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
				layout_id = 4402480167
				get_pipelines(layout_id)
			rescue Exception => e
				raise e
			end
		end
end
GetPipelines.initialize_and_call
