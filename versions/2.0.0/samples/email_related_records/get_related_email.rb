require "ZOHOCRMSDK5_0"

class GetRelatedEmail
		def self.get_related_email(module_api_name, id, message_id)
			email_templates_operations =  ZOHOCRMSDK::EmailRelatedRecords::EmailRelatedRecordsOperations.new(id, module_api_name)
			response = email_templates_operations.get_emails_related_record(message_id)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::EmailRelatedRecords::ResponseWrapper
						response_wrapper = response_handler
						email_templates= response_wrapper.emails
						email_templates.each do |email_template|
							user_details= email_template.cc
							if user_details != nil
								user_details.each do |user_detail|
									print "email_related_records User Email: " + user_detail.email.to_s + "\n"
									print "email_related_records User Name: " + user_detail.user_name.to_s + "\n"
								end
							end
							print "email_related_records Summary: " + email_template.summary.to_s + "\n"
							owner = email_template.owner
							if owner != nil
								print "email_related_records User ID: " + owner.id.to_s + "\n"
								print "email_related_records User Name: " + owner.name.to_s + "\n"
							end
							print "email_related_records Read: " + email_template.read.to_s + "\n"
							print "email_related_records Sent: " + email_template.sent.to_s + "\n"
							print "email_related_records Subject: " + email_template.subject.to_s + "\n"
							print "email_related_records Intent: " + email_template.intent.to_s + "\n"
							print "email_related_records Content: " + email_template.content.to_s + "\n"
							print "email_related_records SentimentInfo: " + email_template.sentiment_info.to_s + "\n"
							print "email_related_records MessageId: " + email_template.message_id.to_s + "\n"
							print "email_related_records MessageId: " + email_template.source.to_s + "\n"
							linked_record = email_template.linked_record
							if linked_record != nil
								print "email_related_records LinkedRecord id : " + linked_record.id.to_s + "\n"
								module_1= linked_record.module
								if module_1 != nil
									print "email_related_records LinkedRecord Module APIName : " + module_1.api_name.to_s + "\n"
									print "email_related_records LinkedRecord Module Id : " + module_1.id.to_s + "\n"
								end
							end
							attachments= email_template.attachments
							if attachments != nil
								attachments.each do |attachment|
									print "email_related_records Attachmnet Size :" + attachment.size.to_s + "\n"
									print "email_related_records Attachmnet Name :" + attachment.name.to_s + "\n"
									print "email_related_records Attachmnet Id :" + attachment.id.to_s + "\n"
								end
							end
							print "email_related_records Emotion: " + email_template.emotion.to_s + "\n"
							from = email_template.from
							if from != nil
								print "email_related_records From User Email: " + from.email.to_s + "\n"
								print "email_related_records From User Name: " + from.user_name.to_s + "\n"
							end
							to_user_details= email_template.to
							if to_user_details != nil
								to_user_details.each do |user_detail|
									print "email_related_records User Email: " + user_detail.email.to_s + "\n"
									print "email_related_records User Name: " + user_detail.user_name.to_s + "\n"
								end
							end
							print "email_related_records Time: " + email_template.time.to_s + "\n"
							status= email_template.status
							if status != nil
								status.each do |status1|
									print "email_related_records Status Type: " + status1.type.to_s + "\n"
									print "email_related_records Status BouncedTime: " + status1.bounced_time.to_s + "\n"
									print "email_related_records Status BouncedReason: " + status1.bounced_reason.to_s + "\n"
								end
							end
						end
						info = response_wrapper.info
						if info != nil
							if info.count != nil
								print "record Info Count: " + info.count.to_s + "\n"
							end
							if info.next_index != nil
								print "record Info NextIndex: " + info.next_index.to_s + "\n"
							end
							if info.prev_index != nil
								print "record Info PrevIndex: " + info.prev_index.to_s + "\n"
							end
							if info.per_page != nil
								print "record Info PerPage: " + info.per_page.to_s + "\n"
							end
							if info.more_records != nil
								print "record Info MoreRecords: " + info.more_records.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::EmailRelatedRecords::APIException
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
				id = 4402480774074
				message_id = "c6085fae06cbd7b75001d80ffefab46b7d76f8540fc65c6bc779dfe4aab8d727"
				get_related_email(module_api_name, id, message_id)
			rescue Exception => e
				raise e
			end
		end
end
GetRelatedEmail.initialize_and_call