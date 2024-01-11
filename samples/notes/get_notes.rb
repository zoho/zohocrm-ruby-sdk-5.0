require "ZOHOCRMSDK5_0"

class GetNotes
		def self.get_notes
			notes_operations =  ZOHOCRMSDK::Notes::NotesOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Notes::NotesOperations::GetNotesParam.page, "1")
			param_instance.add(ZOHOCRMSDK::Notes::NotesOperations::GetNotesParam.per_page, "1")
			param_instance.add(ZOHOCRMSDK::Notes::NotesOperations::GetNotesParam.fields, "id")
			# param_instance.add(ZOHOCRMSDK::Param.new("ids", nil), "34770619295004")
			header_instance =  ZOHOCRMSDK::HeaderMap.new
			startdatetime = DateTime.new(2021, 06, 01, 10, 00, 01, "+05:30")
			header_instance.add(ZOHOCRMSDK::Notes::NotesOperations::GetNotesHeader.If_modified_since, startdatetime)
			response = notes_operations.get_notes(param_instance, header_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Notes::ResponseWrapper
						response_wrapper = response_handler
						notes= response_wrapper.data
						notes.each do |note|
							owner= note.owner
							if owner != nil
								print "note Owner User-Name: " + owner.name.to_s + "\n"
								print "note Owner User-ID: " + owner.id.to_s + "\n"
								print "note Owner Email: " + owner.email.to_s + "\n"
							end
							print "note ModifiedTime: " + note.modified_time.to_s + "\n"
							attachments= note.attachments
							if attachments != nil
								attachments.each do |attachment|
									print_attachment(attachment)
								end
							end
							print "note CreatedTime: " + note.created_time.to_s + "\n"
							parent_id = note.parent_id
							if parent_id != nil
								if parent_id.get_key_value("name") != nil
									print "note parent record Name: " + parent_id.get_key_value("name").to_s + "\n"
								end
								print "note parent record ID: " + parent_id.id.to_s + "\n"
							end
							print "note Editable: " + note.editable.to_s + "\n"
							print "note SharingPermission: " + note.sharing_permission.to_s + "\n"
							print "note SeModule: " + note.se_module.to_s + "\n"
							print "note IsSharedToClient: " + note.is_shared_to_client.to_s + "\n"
							modified_by= note.modified_by
							if modified_by != nil
								print "note Modified By User-Name: " + modified_by.name.to_s + "\n"
								print "note Modified By User-ID: " + modified_by.id.to_s + "\n"
								print "note Modified By User-Email: " + modified_by.email.to_s + "\n"
							end
							print "note Size: " + note.size.to_s + "\n"
							print "note State: " + note.state.to_s + "\n"
							print "note VoiceNote: " + note.voice_note.to_s + "\n"
							print "note Id: " + note.id.to_s + "\n"
							created_by= note.created_by
							if created_by != nil
								print "note Created By User-Name: " + created_by.name.to_s + "\n"
								print "note Created By User-ID: " + created_by.id.to_s + "\n"
								print "note Created By User-Email: " + created_by.email.to_s + "\n"
							end
							print "note NoteTitle: " + note.note_title.to_s + "\n"
							print "note NoteContent: " + note.note_content.to_s + "\n"
						end
						info = response_wrapper.info
						if info != nil
							if info.per_page != nil
								print "note Info PerPage: " + info.per_page.to_s + "\n"
							end
							if info.count != nil
								print "note Info Count: " + info.count.to_s + "\n"
							end
							if info.page != nil
								print "note Info Page: " + info.page.to_s + "\n"
							end
							if info.more_records != nil
								print "note Info MoreRecords: " + info.more_records.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Notes::APIException
						exception = response_handler
						print "status: " + exception.status.value.to_s + "\n"
						print "code: " + exception.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						exception.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + exception.message.value.to_s + "\n"
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
		def self.print_attachment(attachment)
			owner= attachment.owner
			if owner != nil
				print "note Attachment Owner User-Name: " + owner.name.to_s + "\n"
				print "note Attachment Owner User-ID: " + owner.id.to_s + "\n"
				print "note Attachment Owner User-Email: " + owner.email.to_s + "\n"
			end
			print "note Attachment Modified Time: " + attachment.modified_time.to_s + "\n"
			print "note Attachment File Name: " + attachment.file_name.to_s + "\n"
			print "note Attachment Created Time: " + attachment.created_time.to_s + "\n"
			print "note Attachment File Size: " + attachment.size.to_s + "\n"
			parent_id = attachment.parent_id
			if parent_id != nil
				print "note Attachment parent record Name: " + parent_id.name.to_s + "\n"
				print "note Attachment parent record ID: " + parent_id.id.to_s + "\n"
			end
			print "note Attachment is Editable: " + attachment.editable.to_s + "\n"
			print "note Attachment is SharingPermission: " + attachment.sharing_permission.to_s + "\n"
			print "note Attachment File ID: " + attachment.file_id.to_s + "\n"
			print "note Attachment File Type: " + attachment.type.to_s + "\n"
			print "note Attachment se_module: " + attachment.se_module.to_s + "\n"
			modified_by= attachment.modified_by
			if modified_by != nil
				print "note Attachment Modified By User-Name: " + modified_by.name.to_s + "\n"
				print "note Attachment Modified By User-ID: " + modified_by.id.to_s + "\n"
				print "note Attachment Modified By User-Email: " + modified_by.email.to_s + "\n"
			end
			print "note Attachment State: " + attachment.state.to_s + "\n"
			print "note Attachment ID: " + attachment.id.to_s + "\n"
			created_by= attachment.created_by
			if created_by != nil
				print "note Attachment Created By User-Name: " + created_by.name.to_s + "\n"
				print "note Attachment Created By User-ID: " + created_by.id.to_s + "\n"
				print "note Attachment Created By User-Email: " + created_by.email.to_s + "\n"
			end
			print "note Attachment LinkUrl: " + attachment.link_url.to_s + "\n"
		end
	def self.initialize_and_call
			begin
				environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				get_notes
			rescue Exception => e
				raise e
			end
		end
end
GetNotes.initialize_and_call