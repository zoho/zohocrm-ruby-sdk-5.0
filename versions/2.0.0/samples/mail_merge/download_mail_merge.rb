require "ZOHOCRMSDK5_0"

class DownloadMailMerge
		def self.download_mail_merge(module_1, id, destination_folder)
			mail_merge_operations =  ZOHOCRMSDK::MailMerge::MailMergeOperations.new(module_1, id)
			request =  ZOHOCRMSDK::MailMerge::DownloadMailMergeWrapper.new
			download_mail_merge=[]
			mailmerge=ZOHOCRMSDK::MailMerge::DownloadMailMerge.new
			mail_merge_template =  ZOHOCRMSDK::MailMerge::MailMergeTemplate.new
			mail_merge_template.name="Test"
			mailmerge.mail_merge_template = mail_merge_template
			mailmerge.output_format =  ZOHOCRMSDK::Util::Choice.new("pdf")
			mailmerge.file_name="filename"
			mailmerge.password="TestSDK"
			download_mail_merge.push(mailmerge)
			request.download_mail_merge = download_mail_merge
			response = mail_merge_operations.download_mail_merge(request)
			if response != nil
				print "status Code: " + response.status_code.to_s
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::MailMerge::FileBodyWrapper
 				    file_body_wrapper = response_handler
						stream_wrapper = file_body_wrapper.file
						File.open(destination_folder + '/' + stream_wrapper.name, 'w') do |f|
							f.write(stream_wrapper.stream)
						end
					elsif response_handler.is_a? ZOHOCRMSDK::MailMerge::APIException
						exception = response_handler
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
				id = "665388585"
				module_1 = "Leads"
				destination_folder = "/users/doc"
				download_mail_merge(module_1, id, destination_folder)
			rescue Exception => e
				raise e
			end
		end
end
DownloadMailMerge.initialize_and_call