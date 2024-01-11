require "ZOHOCRMSDK5_0"

class UpdateNotes
		def self.update_notes
			notes_operations =  ZOHOCRMSDK::Notes::NotesOperations.new
			body_wrapper =  ZOHOCRMSDK::Notes::BodyWrapper.new
			notes=[]
			note=ZOHOCRMSDK::Notes::Note.new
			note.id = 347706116695008
			note.note_title="Contacted12"
			note.note_content="Need to do further tracking12"
			notes.push(note)
			note=ZOHOCRMSDK::Notes::Note.new
			note.id = 347706111949008
			note.note_title="Contacted13"
			note.note_content="Need to do further tracking13"
			notes.push(note)
			body_wrapper.data = notes
			response = notes_operations.update_notes(body_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::Notes::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.data
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::Notes::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.value.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::Notes::APIException
								exception = action_response
								print "status: " + exception.status.value.to_s + "\n"
								print "code: " + exception.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								if exception.details != nil
									exception.details.each do |k, v|
										print k + ": " + v.to_s + "\n"
									end
								end
								print "message: " + exception.message.value.to_s + "\n"
							end
						end
					elsif action_handler.is_a? APIException
						exception = action_handler
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
	def self.initialize_and_call
			begin
				environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				update_notes
			rescue Exception => e
				raise e
			end
		end
end
UpdateNotes.initialize_and_call