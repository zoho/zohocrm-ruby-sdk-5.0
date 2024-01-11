require "ZOHOCRMSDK5_0"

class GetVariables
		def self.get_variables
			variables_operations =  ZOHOCRMSDK::Variables::VariablesOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Variables::VariablesOperations::GetVariablesParam.group, "general")
			response = variables_operations.get_variables(param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Variables::ResponseWrapper
						response_wrapper = response_handler
						variables= response_wrapper.variables
						variables.each do |variable|
							print "variable APIName: " + variable.api_name.to_s + "\n"
							print "variable Name: " + variable.name.to_s + "\n"
							print "variable Description: " + variable.description.to_s + "\n"
							print "variable ID: " + variable.id.to_s + "\n"
							print "variable Source: " + variable.source.to_s + "\n"
							print "variable Type: " + variable.type.to_s + "\n"
							variable_group = variable.variable_group
							if variable_group != nil
								print "variable VariableGroup APIName: " + variable_group.api_name.to_s + "\n"
								print "variable VariableGroup ID: " + variable_group.id.to_s + "\n"
							end
							print "variable Value: " + variable.value.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Variables::APIException
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
				get_variables
			rescue Exception => e
				raise e
			end
		end
end
GetVariables.initialize_and_call