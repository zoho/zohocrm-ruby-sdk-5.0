require "ZOHOCRMSDK5_0"

class SendMailMerge
		def self.send_mail_merge(module_1, id)
			mail_merge_operations =  ZOHOCRMSDK::MailMerge::MailMergeOperations.new(module_1, id)
			request =  ZOHOCRMSDK::MailMerge::MailMergeWrapper.new
			send_mail_merge=[]
			mailmerge =  ZOHOCRMSDK::MailMerge::MailMerge.new
			mail_merge_template =  ZOHOCRMSDK::MailMerge::MailMergeTemplate.new
			mail_merge_template.name="Test"
			mailmerge.mail_merge_template = mail_merge_template
			mailmerge.attachment_name="filename"
			from_address =  ZOHOCRMSDK::MailMerge::Address.new
			from_address.value="abcd@gmail.com"
			mailmerge.from_address = from_address
			to_address=[]
			addressvaluemap1 =  ZOHOCRMSDK::MailMerge::Address.new
			addressvaluemap1.value="abc@gmail.com"
			to_address.push(addressvaluemap1)
			mailmerge.to_address = to_address
			cc_email=[]
			addressvaluemap2 =  ZOHOCRMSDK::MailMerge::Address.new
			addressvaluemap2.value="abc2@gmail.com"
			cc_email.push(addressvaluemap2)
			mailmerge.cc_email = cc_email
			bcc_email=[]
			addressvaluemap3 =  ZOHOCRMSDK::MailMerge::Address.new
			addressvaluemap3.value="abc3@gmail.com"
			bcc_email.push(addressvaluemap3)
			mailmerge.bcc_email = bcc_email
			mailmerge.subject="subject"
			mailmerge.message="ewsadsqdwd"
			mailmerge.type="attachment"
			send_mail_merge.push(mailmerge)
			request.send_mail_merge = send_mail_merge
			response = mail_merge_operations.send_mail_merge(request)
			if response != nil
				print "status Code: " + response.status_code.to_s
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::MailMerge::ActionWrapper
						response_wrapper = action_handler
						action_responses= response_wrapper.send_mail_merge
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::MailMerge::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s
								print "code: " + success_response.code.value.to_s
								print "details: ".to_s
								success_response.details.each do |k, v|
									print k + ": " + v.to_s
								end
								print "message: " + success_response.message.to_s
							elsif action_response.is_a? ZOHOCRMSDK::MailMerge::APIException
								exception = action_response
								print "status: " + exception.status.value.to_s
								print "code: " + exception.code.value.to_s
								print "details: ".to_s
								exception.details.each do |k, v|
									print k + ": " + v.to_s
								end
								print "message: " + exception.message.to_s
							end
						end
					elsif action_handler.is_a? ZOHOCRMSDK::MailMerge::APIException
						exception = action_handler
						print "status: " + exception.status.value.to_s
						print "code: " + exception.code.value.to_s
						print "details: ".to_s
						exception.details.each do |k, v|
							print k + ": " + v.to_s
						end
						print "message: " + exception.message.to_s
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
				id = "66538908585"
				module_1 = "Leads"
				send_mail_merge(module_1, id)
			rescue Exception => e
				raise e
			end
	end
end
SendMailMerge.initialize_and_call