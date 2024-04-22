require "ZOHOCRMSDK5_0"

class GetSources
		def self.get_sources(group_id)
			user_groups_operations =  ZOHOCRMSDK::UserGroups::UserGroupsOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			response = user_groups_operations.get_sources(group_id, param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::UserGroups::SourcesWrapper
						response_wrapper = response_handler
						sources= response_wrapper.sources
						sources.each do |source|
							source1 = source.source
							if source1 != nil
								print "sources  User-Name: " + source1.name.to_s + "\n"
								print "sources User-ID: " + source1.id.to_s + "\n"
							end
							print "sources Type: " + source.type.value.to_s + "\n"
							print "sources Subordinates: " + source.subordinates.to_s + "\n"
						end
						info = response_wrapper.info
						if info != nil
							if info.per_page != nil
								print "sources Info PerPage: " + info.per_page.to_s + "\n"
							end
							if info.count != nil
								print "sources Info Count: " + info.count.to_s + "\n"
							end
							if info.page != nil
								print "sources Info Page: " + info.page.to_s + "\n"
							end
							if info.more_records != nil
								print "sources Info MoreRecords: " + info.more_records.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::UserGroups::APIException
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
				group_id = 440248001219057
				get_sources(group_id)
			rescue Exception => e
				raise e
			end
		end
end
GetSources.initialize_and_call