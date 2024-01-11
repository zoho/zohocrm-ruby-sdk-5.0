require "ZOHOCRMSDK5_0"

class GetTags
		def self.get_tags(module_api_name)
			tags_operations =  ZOHOCRMSDK::Tags::TagsOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Tags::TagsOperations::GetTagsParam.module, module_api_name)
			# param_instance.add(ZOHOCRMSDK::Tags::TagsOperations::GetTagsParam.my_tags, false)
			response = tags_operations.get_tags(param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Tags::ResponseWrapper
						response_wrapper = response_handler
						tags= response_wrapper.tags
						tags.each do |tag|
							print "tag CreatedTime: " + tag.created_time.to_s + "\n"
							print "tag ModifiedTime: " + tag.modified_time.to_s + "\n"
							print "tag ColorCode: " + tag.color_code.to_s + "\n"
							print "tag Name: " + tag.name.to_s + "\n"
							modified_by= tag.modified_by
							if modified_by != nil
								print "tag Modified By User-ID: " + modified_by.id.to_s + "\n"
								print "tag Modified By User-Name: " + modified_by.name.to_s + "\n"
							end
							print "tag ID: " + tag.id.to_s + "\n"
							created_by= tag.created_by
							if created_by != nil
								print "tag Created By User-ID: " + created_by.id.to_s + "\n"
								print "tag Created By User-Name: " + created_by.name.to_s + "\n"
							end
						end
						info = response_wrapper.info
						if info != nil
							if info.count != nil
								print "tag Info Count: " + info.count.to_s + "\n"
							end
							if info.allowed_count != nil
								print "tag Info AllowedCount: " + info.allowed_count.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Tags::APIException
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
				module_api_name = "leads"
				get_tags(module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
GetTags.initialize_and_call