require "ZOHOCRMSDK5_0"

class GetEmailTemplates
		def self.get_email_templates(module_api_name)
			email_templates_operations =  ZOHOCRMSDK::EmailTemplates::EmailTemplatesOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::EmailTemplates::EmailTemplatesOperations::GetEmailTemplatesParam.module, module_api_name)
			response = email_templates_operations.get_email_templates(param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::EmailTemplates::ResponseWrapper
						response_wrapper = response_handler
						email_templates= response_wrapper.email_templates
						email_templates.each do |email_template|
							print "email_template CreatedTime: " + email_template.created_time.to_s + "\n"
							attachments= email_template.attachments
							if attachments != nil
								attachments.each do |attachment|
									print "email_template Attachment File ID: " + attachment.file_id.to_s + "\n"
									print "email_template Attachment File Name: " + attachment.file_name.to_s + "\n"
									print "email_template Attachment Size: " + attachment.size.to_s + "\n"
									print "email_template Attachment ID: " + attachment.id.to_s + "\n"
								end
							end
							print "email_template Subject: " + email_template.subject.to_s + "\n"
							module_1 = email_template.module
							if module_1 != nil
								print "email_template Module ID: " + module_1.id.to_s + "\n"
								print "email_template Module api_name: " + module_1.api_name.to_s + "\n"
							end
							lastversionstatistics = email_template.last_version_statistics
							if lastversionstatistics != nil
								print "email_template Module Tracked: " + lastversionstatistics.tracked.to_s + "\n"
								print "email_template Module Delivered: " + lastversionstatistics.delivered.to_s + "\n"
								print "email_template Module Opened: " + lastversionstatistics.opened.to_s + "\n"
								print "email_template Module Bounced: " + lastversionstatistics.bounced.to_s + "\n"
								print "email_template Module Sent: " + lastversionstatistics.sent.to_s + "\n"
								print "email_template Module Clicked: " + lastversionstatistics.clicked.to_s + "\n"
							end
							print "email_template Type: " + email_template.type.to_s + "\n"
							created_by = email_template.created_by
							if created_by != nil
								print "email_template Created By Name : " + created_by.name.to_s + "\n"
								print "email_template Created By id : " + created_by.id.to_s + "\n"
								print "email_template Created By Email : " + created_by.email.to_s + "\n"
							end
							print "email_template ModifiedTime: " + email_template.modified_time.to_s + "\n"
							folder = email_template.folder
							if folder != nil
								print "email_template Folder  id : " + folder.id.to_s + "\n"
								print "email_template Folder  Name : " + folder.name.to_s + "\n"
							end
							print "email_template Last Usage Time: " + email_template.last_usage_time.to_s + "\n"
							print "email_template Associated: " + email_template.associated.to_s + "\n"
							print "email_template Name: " + email_template.name.to_s + "\n"
							print "email_template Consent Linked: " + email_template.consent_linked.to_s + "\n"
							modified_by = email_template.modified_by
							if modified_by != nil
								print "email_template Modified By Name : " + modified_by.name.to_s + "\n"
								print "email_template Modified By id : " + modified_by.id.to_s + "\n"
								print "email_template Modified By Email : " + modified_by.email.to_s + "\n"
							end
							print "email_template ID: " + email_template.id.to_s + "\n"
							print "email_template Content: " + email_template.content.to_s + "\n"
							print "email_template Description: " + email_template.description.to_s + "\n"
							print "email_template EditorMode: " + email_template.editor_mode.to_s + "\n"
							print "email_template Category: " + email_template.category.to_s + "\n"
							print "email_template Favourite: " + email_template.favorite.to_s + "\n"
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
					elsif response_handler.is_a? ZOHOCRMSDK::EmailTemplates::APIException
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
				get_email_templates(module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
GetEmailTemplates.initialize_and_call