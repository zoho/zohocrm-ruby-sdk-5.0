require "ZOHOCRMSDK5_0"

class GetAppointmentsRescheduledHistory
		def self.get_appointments_rescheduled_history
			reschedule_history_operations =  ZOHOCRMSDK::RescheduleHistory::RescheduleHistoryOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			response = reschedule_history_operations.get_appointments_rescheduled_history(param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::RescheduleHistory::ResponseWrapper
						response_wrapper = response_handler
						data= response_wrapper.data
						if data != nil
							data.each do |history|
								print "currency_symbol: " + history.currency_symbol.to_s + "\n"
								print "reviewprocess: " + history.review_process.to_s + "\n"
								print "reschedulereason: " + history.reschedule_reason.to_s + "\n"
								print "sharingpermission: " + history.sharing_permission.to_s + "\n"
								print "name: " + history.name.to_s + "\n"
								print "review: " + history.review.to_s + "\n"
								print "state: " + history.state.to_s + "\n"
								print "canvasid: " + history.canvas_id.to_s + "\n"
								print "processflow: " + history.process_flow.to_s + "\n"
								print "id: " + history.id.to_s + "\n"
								print "ziavisions: " + history.zia_visions.to_s + "\n"
								print "approved: " + history.approved.to_s + "\n"
								print "ziavisions: " + history.zia_visions.to_s + "\n"
								print "editable: " + history.editable.to_s + "\n"
								print "orchestration: " + history.orchestration.to_s + "\n"
								print "inmerge: " + history.in_merge.to_s + "\n"
								print "approvalstate: " + history.approval_state.to_s + "\n"
								print "reschedulenote: " + history.reschedule_note.to_s + "\n"
								print "rescheduledto: " + history.rescheduled_to.to_s + "\n"
								print "rescheduledtime: " + history.rescheduled_time.to_s + "\n"
								print "rescheduledfrom: " + history.rescheduled_from.to_s + "\n"
								appointment_name = history.appointment_name
								if appointment_name != nil
									print "appointment Name: " + appointment_name.name.to_s + "\n"
									print "appointmnet Id: " + appointment_name.id.to_s + "\n"
								end
								approval = history.approval
								if approval != nil
									print "delegate : " + approval.delegate.to_s + "\n"
									print "approve : " + approval.approve.to_s + "\n"
									print "reject : " + approval.reject.to_s + "\n"
									print "resubmit : " + approval.resubmit.to_s + "\n"
								end
								modified_by = history.modified_by
								if modified_by != nil
									print "modifiedby : " + modified_by.id.to_s + "\n"
									print "modifiedby : " + modified_by.name.to_s + "\n"
									print "modifiedby : " + modified_by.email.to_s + "\n"
								end
								rescheduled_by = history.rescheduled_by
								if rescheduled_by != nil
									print "rescheduledby : " + rescheduled_by.id.to_s + "\n"
									print "rescheduledby : " + rescheduled_by.name.to_s + "\n"
									print "rescheduledby" + rescheduled_by.email.to_s + "\n"
								end
								created_by = history.created_by
								if created_by != nil
									print "createdby : " + created_by.id.to_s + "\n"
									print "createdby : " + created_by.name.to_s + "\n"
									print "createdby : " + created_by.email.to_s + "\n"
								end
							end
						end
						info = response_wrapper.info
						if info.per_page != nil
							print "related_record Info PerPage: " + info.per_page.to_s + "\n"
						end
						if info.count != nil
							print "related_record Info Count: " + info.count.to_s + "\n"
						end
						if info.page != nil
							print "related_record Info Page: " + info.page.to_s + "\n"
						end
						if info.more_records != nil
							print "related_record Info MoreRecords: " + info.more_records.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::RescheduleHistory::APIException
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
	def self.initialize_and_call
			begin
				environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				get_appointments_rescheduled_history
			rescue Exception => e
				raise e
			end
		end
end
GetAppointmentsRescheduledHistory.initialize_and_call