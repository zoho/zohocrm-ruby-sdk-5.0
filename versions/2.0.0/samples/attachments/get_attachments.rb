require "ZOHOCRMSDK5_0"

	
class GetAttachments
		def self.get_attachments(module_api_name, record_id)
			attachments_operations =  ZOHOCRMSDK::Attachments::AttachmentsOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Attachments::AttachmentsOperations::GetAttachmentsParam.page, 1)
			param_instance.add(ZOHOCRMSDK::Attachments::AttachmentsOperations::GetAttachmentsParam.per_page, 10)
			param_instance.add(ZOHOCRMSDK::Attachments::AttachmentsOperations::GetAttachmentsParam.fields, "id")
			param_instance.add(ZOHOCRMSDK::Attachments::AttachmentsOperations::GetAttachmentsParam.ids, "347706117069001")
			response = attachments_operations.get_attachments(record_id, module_api_name, param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Attachments::ResponseWrapper
						response_wrapper = response_handler
						attachments= response_wrapper.data
						attachments.each do |attachment|
							owner= attachment.owner
							if owner != nil
								print "attachment Owner User-Name: " + owner.name.to_s + "\n"
								print "attachment Owner User-ID: " + owner.id.to_s + "\n"
								print "attachment Owner User-Email: " + owner.email.to_s + "\n"
							end
							print "attachment Modified Time: " + attachment.modified_time.to_s + "\n"
							print "attachment File Name: " + attachment.file_name.to_s + "\n"
							print "attachment Created Time: " + attachment.created_time.to_s + "\n"
							print "attachment File Size: " + attachment.size.to_s + "\n"
							parent_id = attachment.parent_id
							if parent_id != nil
								print "attachment parent record Name: " + parent_id.name.to_s + "\n"
								print "attachment parent record ID: " + parent_id.id.to_s + "\n"
							end
							print "attachment is Editable: " + attachment.editable.to_s + "\n"
							print "attachment SharingPermission: " + attachment.sharing_permission.to_s + "\n"
							print "attachment File ID: " + attachment.file_id.to_s + "\n"
							print "attachment File Type: " + attachment.type.to_s + "\n"
							print "attachment se_module: " + attachment.se_module.to_s + "\n"
							modified_by= attachment.modified_by
							if modified_by != nil
								print "attachment Modified By User-Name: " + modified_by.name.to_s + "\n"
								print "attachment Modified By User-ID: " + modified_by.id.to_s + "\n"
								print "attachment Modified By User-Email: " + modified_by.email.to_s + "\n"
							end
							print "attachment Type: " + attachment.attachment_type.to_s + "\n"
							print "attachment State: " + attachment.state.to_s + "\n"
							print "attachment ID: " + attachment.id.to_s + "\n"
							created_by= attachment.created_by
							if created_by != nil
								print "attachment Created By User-Name: " + created_by.name.to_s + "\n"
								print "attachment Created By User-ID: " + created_by.id.to_s + "\n"
								print "attachment Created By User-Email: " + created_by.email.to_s + "\n"
							end
							print "attachment LinkUrl: " + attachment.link_url.to_s + "\n"
						end
						info = response_wrapper.info
						if info != nil
							if info.per_page != nil
								print "attachment Info PerPage: " + info.per_page.to_s + "\n"
							end
							if info.count != nil
								print "attachment Info Count: " + info.count.to_s + "\n"
							end
							if info.page != nil
								print "attachment Info Page: " + info.page.to_s + "\n"
							end
							if info.more_records != nil
								print "record Info MoreRecords: " + info.more_records.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Attachments::APIException
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
				record_id = 4402480774074
				get_attachments(module_api_name, record_id)
			rescue Exception => e
				raise e
			end
		end
end
GetAttachments.initialize_and_call