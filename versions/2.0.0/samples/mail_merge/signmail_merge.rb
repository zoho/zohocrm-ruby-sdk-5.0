require "ZOHOCRMSDK5_0"

class SignmailMerge
		def self.sign_mail_merge(module_1, id)
			mail_merge_operations =  ZOHOCRMSDK::MailMerge::MailMergeOperations.new(module_1, id)
			request =  ZOHOCRMSDK::MailMerge::SignMailMergeWrapper.new
			sign_mail_merge=[]
			mailmerge =  ZOHOCRMSDK::MailMerge::SignMailMerge.new
			mail_merge_template =  ZOHOCRMSDK::MailMerge::MailMergeTemplate.new
			mail_merge_template.name="Test"
			mailmerge.mail_merge_template = mail_merge_template
			mailmerge.file_name="filename"
			mailmerge.sign_in_order = true
			signers=[]
			signer =  ZOHOCRMSDK::MailMerge::Signers.new
			signer.recipient_name ="recipientname"
			signer.action_type =  ZOHOCRMSDK::Util::Choice.new("sign")
			recipent =  ZOHOCRMSDK::MailMerge::Address.new
			recipent.value="abc@gmail.com"
			signer.recipient = recipent
			signers.push(signer)
			mailmerge.signers = signers
			sign_mail_merge.push(mailmerge)
			request.sign_mail_merge = sign_mail_merge
			response = mail_merge_operations.sign_mail_merge(request)
			if response != nil
				print "status Code: " + response.status_code.to_s
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::MailMerge::SignActionWrapper
						response_wrapper = action_handler
						action_responses= response_wrapper.sign_mail_merge
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
				id = "6653308585"
				module_1 = "Leads"
				sign_mail_merge(module_1, id)
			rescue Exception => e
				raise e
			end
		end
end
SignmailMerge.initialize_and_call