require "ZOHOCRMSDK5_0"

class EnableNotifications
		def self.enable_notifications
			notification_operations =  ZOHOCRMSDK::Notifications::NotificationsOperations.new
			body_wrapper =  ZOHOCRMSDK::Notifications::BodyWrapper.new
			notifications=[]
			notification=ZOHOCRMSDK::Notifications::Notification.new
			notification.channel_id="106800211l"
			notification.notify_on_related_action = false
			events=[]
			events.push("deals.all")
			notification.events = events
			notification.channel_expiry = DateTime.new(2020, 05, 20, 10, 00, 00, "+05:30")
			notification.token="TOKEN_FOR_VERIFICATION_OF_1068002"
			notification.notify_url="https:#www.zohoapis.com"
			notifications.push(notification)
			notification2=ZOHOCRMSDK::Notifications::Notification.new
			notification2.channel_id="106800211l"
			notification.notify_on_related_action = false
			events2=[]
			events2.push("accounts.all")
			notification2.events = events2
			notification2.channel_expiry = DateTime.new(2020, 05, 20, 10, 00, 00, "+05:30")
			notification2.token="TOKEN_FOR_VERIFICATION_OF_1068002"
			notification2.notify_url="https:#www.zohoapis.com"
			notifications.push(notification2)
			body_wrapper.watch = notifications
			response = notification_operations.enable_notifications(body_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::Notifications::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.watch
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::Notifications::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									if v.is_a? Array
										data_list= v
										if data_list.size > 0 && data_list[0].is_a?(ZOHOCRMSDK::Notifications::Event)
											event_list=  data_list
											event_list.each do |event|
												print "notification ChannelExpiry: " + event.channel_expiry.to_s + "\n"
												print "notification ResourceUri: " + event.resource_uri.to_s + "\n"
												print "notification ResourceId: " + event.resource_id.to_s + "\n"
												print "notification ResourceName: " + event.resource_name.to_s + "\n"
												print "notification ChannelId: " + event.channel_id.to_s + "\n"
											end
										end
									else
										print k + ": " + v.to_s + "\n"
									end
								end
								print "message: " + success_response.message.value.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::Notifications::APIException
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
					elsif action_handler.is_a? ZOHOCRMSDK::Notifications::APIException
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
				enable_notifications
			rescue Exception => e
				raise e
			end
		end
end
EnableNotifications.initialize_and_call