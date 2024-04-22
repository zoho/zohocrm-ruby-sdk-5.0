require "ZOHOCRMSDK5_0"

class GetNotificationDetails
		def self.get_notification_details
			notification_operations =  ZOHOCRMSDK::Notifications::NotificationsOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Notifications::NotificationsOperations::GetNotificationsParam.channel_id, 106800211)
			param_instance.add(ZOHOCRMSDK::Notifications::NotificationsOperations::GetNotificationsParam.module, "accounts")
			param_instance.add(ZOHOCRMSDK::Notifications::NotificationsOperations::GetNotificationsParam.page, 1)
			param_instance.add(ZOHOCRMSDK::Notifications::NotificationsOperations::GetNotificationsParam.per_page, 2)
			response = notification_operations.get_notifications(param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Notifications::ResponseWrapper
						response_wrapper = response_handler
						notifications= response_wrapper.watch
						notifications.each do |notification|
							print "notification NotifyOnRelatedAction: " + notification.notify_on_related_action.to_s + "\n"
							print "notification ChannelExpiry: " + notification.channel_expiry.to_s + "\n"
							print "notification ResourceUri: " + notification.resource_uri.to_s + "\n"
							print "notification ResourceId: " + notification.resource_id.to_s + "\n"
							print "notification NotifyUrl: " + notification.notify_url.to_s + "\n"
							print "notification ResourceName: " + notification.resource_name.to_s + "\n"
							print "notification ChannelId: " + notification.channel_id.to_s + "\n"
							fields= notification.events
							if fields != nil
								fields.each do |field_name|
									print "notification Events: " + field_name.to_s + "\n"
								end
							end
							print "notification Token: " + notification.token.to_s + "\n"
						end
						info = response_wrapper.info
						if info != nil
							if info.per_page != nil
								print "record Info PerPage: " + info.per_page.to_s + "\n"
							end
							if info.count != nil
								print "record Info Count: " + info.count.to_s + "\n"
							end
							if info.page != nil
								print "record Info Page: " + info.page.to_s + "\n"
							end
							if info.more_records != nil
								print "record Info MoreRecords: " + info.more_records.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Notifications::APIException
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
				get_notification_details
			rescue Exception => e
				raise e
			end
		end
end
GetNotificationDetails.initialize_and_call