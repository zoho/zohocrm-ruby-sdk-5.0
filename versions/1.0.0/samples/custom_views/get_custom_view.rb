require "ZOHOCRMSDK5_0"

class GetCustomView
		def self.get_custom_view(module_api_name, custom_view_id)
			custom_views_operations =  ZOHOCRMSDK::CustomViews::CustomViewsOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::CustomViews::GetCustomViewsParam.module, module_api_name)
			response = custom_views_operations.get_custom_view(custom_view_id, param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::CustomViews::BodyWrapper
						response_wrapper = response_handler
						custom_views= response_wrapper.custom_views
						custom_views.each do |custom_view|
							print "custom_view DisplayValue: " + custom_view.display_value.to_s + "\n"
							print "custom_view AccessType: " + custom_view.access_type.to_s + "\n"
							print "custom_view SystemName: " + custom_view.system_name.to_s + "\n"
							criteria = custom_view.criteria
							if criteria != nil
								print_criteria(criteria)
							end
							shared_to_details= custom_view.shared_to
							if shared_to_details != nil
								shared_to_details.each do |shared_to|
									print "shared_details Name: " + shared_to.name.to_s + "\n"
									print "shared_details ID: " + shared_to.id.to_s + "\n"
									print "shared_details Type: " + shared_to.type.to_s + "\n"
									print "shared_details Subordinates: " + shared_to.subordinates.to_s + "\n"
								end
							end
							print "custom_view SortBy: " + custom_view.sort_by.to_s + "\n"
							print "custom_view Default: " + custom_view.default.to_s + "\n"
							print "custom_view SystemDefined: " + custom_view.system_defined.to_s + "\n"
							print "custom_view Name: " + custom_view.name.to_s + "\n"
							print "custom_view ID: " + custom_view.id.to_s + "\n"
							print "custom_view Category: " + custom_view.category.to_s + "\n"
							if custom_view.favorite != nil
								print "custom_view Favorite: " + custom_view.favorite.to_s + "\n"
							end
							if custom_view.sort_order != nil
								print "custom_view SortOrder: " + custom_view.sort_order.to_s + "\n"
							end
							fields= custom_view.fields
							if fields != nil
								fields.each do |field|
									print "custome view field name: " + field.api_name.to_s + "\n"
								end
							end
							print "custom_view LastAccessedType: " + custom_view.last_accessed_time.to_s + "\n"
							print "custom_view ModifiedTime: " + custom_view.modified_time.to_s + "\n"
							created_by = custom_view.created_by
							if created_by != nil
								print "custom_view Created By Name : " + created_by.name.to_s + "\n"
								print "custom_view Created By id : " + created_by.id.to_s + "\n"
								print "custom_view Created By Name : " + created_by.email.to_s + "\n"
							end
							modified_by = custom_view.modified_by
							if modified_by != nil
								print "custom_view Modified By Name : " + modified_by.name.to_s + "\n"
								print "custom_view Modified By id : " + modified_by.id.to_s + "\n"
								print "custom_view Modified By Name : " + modified_by.email.to_s + "\n"
							end
						end
						info = response_wrapper.info
						if info != nil
							translation = info.translation
							if translation != nil
								print "custom_view Info Translation PublicViews: " + translation.public_views.to_s + "\n"
								print "custom_view Info Translation OtherUsersViews: " + translation.other_users_views.to_s + "\n"
								print "custom_view Info Translation SharedWithMe: " + translation.shared_with_me.to_s + "\n"
								print "custom_view Info Translation CreatedByMe: " + translation.created_by_me.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::CustomViews::APIException
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
		def self.print_criteria(criteria)
			if criteria.comparator != nil
				print "custom_view Criteria Comparator: " + criteria.comparator.to_s + "\n"
			end
			if criteria.field != nil
				print "custom_view Criteria field name: " + criteria.field.api_name.to_s + "\n"
			end
			if criteria.value != nil
				print "custom_view Criteria Value: " + criteria.value.to_s + "\n"
			end
			criteria_group= criteria.group
			if criteria_group != nil
				criteria_group.each do |criteria1|
					print_criteria(criteria1)
				end
			end
			if criteria.group_operator != nil
				print "custom_view Criteria Group Operator: " + criteria.group_operator.to_s + "\n"
			end
		end
	def self.initialize_and_call
			begin
				environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				module_api_name = "leads"
				custom_view_id = 4402480892044
				get_custom_view(module_api_name, custom_view_id)
			rescue Exception => e
				raise e
			end
		end
end
GetCustomView.initialize_and_call