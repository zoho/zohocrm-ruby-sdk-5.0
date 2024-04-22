require "ZOHOCRMSDK5_0"

class UpdateVariables
		def self.update_variables
			variables_operations =  ZOHOCRMSDK::Variables::VariablesOperations.new
			request =  ZOHOCRMSDK::Variables::BodyWrapper.new
			variable_list=[]
			variable1=ZOHOCRMSDK::Variables::Variable.new
			variable1.id = 347706116701021
			variable1.value="4763"
			variable_list.push(variable1)
			variable1=ZOHOCRMSDK::Variables::Variable.new
			variable1.id = 34770615817019
			variable1.description = "this is a  description"
			variable_list.push(variable1)
			variable1=ZOHOCRMSDK::Variables::Variable.new
			variable1.id = 34770615826003
			variable1.api_name="NewAPI"
			variable_list.push(variable1)
			request.variables = variable_list
			response = variables_operations.update_variables(request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::Variables::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.variables
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::Variables::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::Variables::APIException
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
					elsif action_handler.is_a? ZOHOCRMSDK::Variables::APIException
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
				update_variables
			rescue Exception => e
				raise e
			end
		end
end
UpdateVariables.initialize_and_call