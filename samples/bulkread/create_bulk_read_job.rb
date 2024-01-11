require "ZOHOCRMSDK5_0"

class CreateBulkReadJob
		def self.create_bulk_read_job(module_api_name)
			bulk_read_operations =  ZOHOCRMSDK::BulkRead::BulkReadOperations.new
			request_wrapper =  ZOHOCRMSDK::BulkRead::RequestWrapper.new
			module_1 =  ZOHOCRMSDK::Modules::MinifiedModule.new
			module_1.api_name = module_api_name
			callback =  ZOHOCRMSDK::BulkRead::CallBack.new
			callback.url="https:#www.example.com/callback"
			callback.method =  ZOHOCRMSDK::Util::Choice.new("post")
			request_wrapper.callback = callback
			query =  ZOHOCRMSDK::BulkRead::Query.new
			query.module = module_1
			query.cvid = 347706108701
			field_api_names=[]
			field_api_names.push("last__name")
			query.fields = field_api_names
			query.page = 1
			criteria =  ZOHOCRMSDK::BulkRead::Criteria.new
			criteria.group_operator =  Choice.new("or")
			criteria_list=[]
			group11 =  ZOHOCRMSDK::BulkRead::Criteria.new
			group11.group_operator =  Choice.new("and")
			group_list11=[]
			group111 =  ZOHOCRMSDK::BulkRead::Criteria.new
			field111=ZOHOCRMSDK::Fields::MinifiedField.new
			field111.api_name="Company"
			group111.field = field111
			group111.comparator =  Choice.new("equal")
			group111.value="Zoho"
			group_list11.push(group111)
			group112 =  ZOHOCRMSDK::BulkRead::Criteria.new
			field112= ZOHOCRMSDK::Fields::MinifiedField.new
			field112.api_name="Owner"
			group112.field = field112
			group112.comparator =  ZOHOCRMSDK::Util::Choice.new("in")
			owner= ["3477061173021"]
			group112.value = owner
			group_list11.push(group112)
			group11.group = group_list11
			criteria_list.push(group11)
			group12 =  ZOHOCRMSDK::BulkRead::Criteria.new
			group12.group_operator =  ZOHOCRMSDK::Util::Choice.new("or")
			group_list12=[]
			group121 =  ZOHOCRMSDK::BulkRead::Criteria.new
			field121=ZOHOCRMSDK::Fields::MinifiedField.new
			field121.api_name="Paid"
			group121.field = field121
			group121.comparator =  Choice.new("equal")
			group121.value = true
			group_list12.push(group121)
			group122 =  ZOHOCRMSDK::BulkRead::Criteria.new
			field122=ZOHOCRMSDK::Fields::MinifiedField.new
			field122.api_name="Created_Time"
			group122.field = field122
			group122.comparator =  ZOHOCRMSDK::Util::Choice.new("between")
			created_time= ["2020-06-03_t17:31:48+05:30", "2020-06-03_t17:31:48+05:30"]
			group122.value = created_time
			group_list12.push(group122)
			group12.group = group_list12
			criteria_list.push(group12)
			criteria.group = criteria_list
			query.criteria = criteria
			request_wrapper.query = query
	#			request_wrapper.file_type =  Choice.new("ics")
			response = bulk_read_operations.create_bulk_read_job(request_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::BulkRead::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.data
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::BulkRead::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.value.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::BulkRead::APIException
								exception = action_response
								print "status: " + exception.status.value.to_s + "\n"
								print "code: " + exception.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								exception.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + exception.message.value.to_s + "\n"
							end
						end
					elsif action_handler.is_a? ZOHOCRMSDK::BulkRead::APIException
						exception = action_handler
						print "status: " + exception.status.value.to_s + "\n"
						print "code: " + exception.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						exception.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + exception.message.value.to_s + "\n"
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
				create_bulk_read_job(module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
CreateBulkReadJob.initialize_and_call