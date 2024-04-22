require "ZOHOCRMSDK5_0"
	

class Associate
		def self.associate(record_id, module_1)
			associate_email_operations =  ZOHOCRMSDK::AssociateEmail::AssociateEmailOperations.new
			request =  ZOHOCRMSDK::AssociateEmail::BodyWrapper.new
			emails=[]
			(0..1).each do |i|
				associate_email =  ZOHOCRMSDK::AssociateEmail::AssociateEmail.new
				from =  ZOHOCRMSDK::AssociateEmail::From.new
				from.email="abc555@gmail.com"
				from.user_name="username"
				associate_email.from = from
				tos=[]
				to =  ZOHOCRMSDK::AssociateEmail::To.new
				to.email="abc1@gmail.com"
				to.user_name="username1"
				tos.push(to)
				tos1=[]
				to1 =  ZOHOCRMSDK::AssociateEmail::To.new
				to1.email="abc2@gmail.com"
				to1.user_name="user_name2"
				tos1.push(to1)
				tos2=[]
				to2 =  ZOHOCRMSDK::AssociateEmail::To.new
				to2.email="abc3@gmail.com"
				to2.user_name="user_name3"
				tos2.push(to2)
				associate_email.to = tos
				associate_email.cc = tos1
				associate_email.bcc = tos2
				associate_email.subject="Subject"
				associate_email.original_message_id="c6085fab75001d80ffefab46b9c6a7521a63e163835aecd3937749712"
				associate_email.date_time = DateTime.now
				associate_email.date_time = DateTime.new(2023, 05, 9, 11, 26, 25, "+05:30")
				associate_email.sent = true
				associate_email.content = "<h3><span style=\\\"background-color: rgb(254, 255, 102)\\\">Mail is of rich text format</span></h3><h3><span style=\\\"background-color: rgb(254, 255, 102)\\\">REGARDS,</span></h3><div><span style=\\\"background-color: rgb(254, 255, 102)\\\">AZ</span></div><div><span style=\\\"background-color: rgb(254, 255, 102)\\\">ADMIN</span></div> <div></div>"
				associate_email.mail_format =  ZOHOCRMSDK::Util::Choice.new("html")
				attachments=[]
				attachment =  ZOHOCRMSDK::AssociateEmail::Attachments.new
				attachment.id="c6085fae06cbd7b75001d806b1061e063a64154e30b905c6e1efa82c6"
				attachments.push(attachment)
				associate_email.attachments = attachments
				emails.push(associate_email)
			end
			request.emails = emails
			response = associate_email_operations.associate(record_id, module_1, request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::AssociateEmail::ActionWrapper
						action_wrapper = action_handler
						actionresponses= action_wrapper.emails
						actionresponses.each do |actionresponse|
							if actionresponse.is_a? ZOHOCRMSDK::AssociateEmail::SuccessResponse
								successresponse = actionresponse
								print "status: " + successresponse.status.value.to_s + "\n"
								print "code: " + successresponse.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								successresponse.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + successresponse.message.to_s + "\n"
							elsif actionresponse.is_a? ZOHOCRMSDK::AssociateEmail::APIException
								exception = actionresponse
								print "status: " + exception.status.value.to_s + "\n"
								print "code: " + exception.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								exception.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + exception.message.to_s + "\n"
							end
						end
					elsif action_handler.is_a? ZOHOCRMSDK::AssociateEmail::APIException
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
				record_id = 4402401304002
				module_api_name = "leads"
				associate(record_id, module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
Associate.initialize_and_call