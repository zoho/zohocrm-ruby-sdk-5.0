require "ZOHOCRMSDK5_0"

class SendMail
		def self.send_mail(record_id, module_api_name)
			send_mail_operations =  ZOHOCRMSDK::SendMail::SendMailOperations.new(record_id, module_api_name)
			body_wrapper =  ZOHOCRMSDK::SendMail::BodyWrapper.new
			mails=[]
			(0..1).each do |i|
				mail =  ZOHOCRMSDK::SendMail::Data.new
				user_address_from =  ZOHOCRMSDK::SendMail::From.new
				user_address_to =  ZOHOCRMSDK::SendMail::To.new
				user_address_cc =  ZOHOCRMSDK::SendMail::To.new
				user_address_bcc =  ZOHOCRMSDK::SendMail::To.new
				user_address_reply_to =  ZOHOCRMSDK::SendMail::To.new
				attachment =  ZOHOCRMSDK::SendMail::Attachment.new
				attachment.file_id="2cceafa194d2181dd81864b4812b1f8b0b4fe0949a982de89fa75a"
				template =  ZOHOCRMSDK::EmailTemplates::EmailTemplate.new
				template.id = 4402480627040
				mail.template = template
				user_address_from.user_name="username"
				user_address_from.email="abc@gmail.com"
				user_address_to.user_name="username1"
				user_address_to.email="abc1@gmail.com"
				user_address_cc.user_name="username2"
				user_address_cc.email="abc2@gmail.com"
				user_address_bcc.user_name="username3"
				user_address_bcc.email="abc3@gmail.com"
				user_address_reply_to.user_name="username4"
				user_address_reply_to.email="abc4@gmail.com"
				mail.from = user_address_from
				user_addresses_to=[]
				user_addresses_to.push(user_address_to)
				mail.to = user_addresses_to
				user_addresses_bcc=[]
				user_addresses_bcc.push(user_address_bcc)
				mail.bcc = user_addresses_bcc
				user_addresses_cc=[]
				user_addresses_cc.push(user_address_cc)
				mail.cc = user_addresses_cc
				mail.reply_to = user_address_reply_to
				mail.org_email = false
				mail.in_reply_to="2cceafa194d037b6dd8186486f1eb0360aee76d802b6d376dea97e7"
				scheduled_t_ime = DateTime.new(2021, 07, 02, 11, 00, 01, "+05:30")
				mail.scheduled_time = scheduled_t_ime
				mail.subject="Testing Send Mail API"
				mail.content = "\"<br><a href=\\\\\\\"${ConsentForm.en_US}\\\\\\\" id=\\\\\\\"ConsentForm\\\\\\\" class=\\\\\\\"en_US\\\\\\\" target=\\\\\\\"_blank\\\\\\\">Consent form link<\\/a><br><br><br><br><br><h3><span style=\\\\\\\"background-color: rgb(254, 255, 102)\\\\\\\">REGARDS,<\\/span><\\/h3><div><span style=\\\\\\\"background-color: rgb(254, 255, 102)\\\\\\\">AZ<\\/span><\\/div><div><span style=\\\\\\\"background-color: rgb(254, 255, 102)\\\\\\\">ADMIN<\\/span><\\/div> <div><\\/div>\""
				mail.mail_format =  ZOHOCRMSDK::Util::Choice.new("html")
				mails.push(mail)
			end
			body_wrapper.data = mails
			response = send_mail_operations.send_mail(body_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::SendMail::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.data
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::SendMail::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::SendMail::APIException
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
					elsif action_handler.is_a? ZOHOCRMSDK::SendMail::APIException
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
				record_id = 4402480774074
				module_api_name = "leads"
				send_mail(record_id, module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
SendMail.initialize_and_call