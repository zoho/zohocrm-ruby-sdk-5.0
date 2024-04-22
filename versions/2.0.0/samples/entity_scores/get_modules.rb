require "ZOHOCRMSDK5_0"

class GetModules
		def self.get_modules
			entity_scores_operations =  ZOHOCRMSDK::EntityScores::EntityScoresOperations.new("positive_score")
			response = entity_scores_operations.get_modules
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::EntityScores::ResponseWrapper
						response_wrapper = response_handler
						data= response_wrapper.data
						if data != nil
							data.each do |score|
								print "score : " + score.score.to_s + "\n"
								print "positive_score : " + score.positive_score.to_s + "\n"
								print "touch_point_score : " + score.touch_point_score.to_s + "\n"
								print "negative_score : " + score.negative_score.to_s + "\n"
								print "touchpoint_negative_score : " + score.touch_point_negative_score.to_s + "\n"
								print "touchpoint_positive_score : " + score.touch_point_positive_score.to_s + "\n"
								print "id : " + score.id.to_s + "\n"
								print "zia_visions : " + score.zia_visions.to_s + "\n"
								scoring_rule = score.scoring_rule
								if scoring_rule != nil
									print "scoring_rule Id : " + scoring_rule.id.to_s + "\n"
									print "scoring_rule Name : " + scoring_rule.name.to_s + "\n"
								end
								field_states= score.field_states
								field_states.each do |field|
									print "fieldstates : " + field.to_s + "\n"
								end
							end
						end
						info = response_wrapper.info
						if info != nil
							if info.per_page != nil
								print "info PerPage: " + info.per_page.to_s + "\n"
							end
							if info.count != nil
								print "info Count: " + info.count.to_s + "\n"
							end
							if info.page != nil
								print "info Page: " + info.page.to_s + "\n"
							end
							if info.more_records != nil
								print "info MoreRecords: " + info.more_records.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::EntityScores::APIException
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
				get_modules
			rescue Exception => e
				raise e
			end
		end
end
GetModules.initialize_and_call