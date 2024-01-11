require "ZOHOCRMSDK5_0"

class GetRecord
		def self.get_record(module_api_name, record_id, destination_folder)
			record_operations =  ZOHOCRMSDK::Record::RecordOperations.new
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetRecordParam.approved, "both")
			param_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetRecordParam.converted, "false")
			field_names= ["company", "email"]
			param_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetRecordParam.FIELDS, field_names.join(","))
			startdatetime = DateTime.new(2021, 07, 02, 11, 00, 01, "+05:30")
			param_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetRecordParam.startdatetime, startdatetime)
			enddatetime = DateTime.new(2021, 8, 02, 12, 00, 01, "+05:30")
			param_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetRecordParam.enddatetime, enddatetime)
			param_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetRecordParam.territory_id, "34770613051357")
			param_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetRecordParam.include_child, "true")
			header_instance =  ZOHOCRMSDK::HeaderMap.new
			ifmodifiedsince = DateTime.new(2019, 01, 02, 10, 00, 00, "+05:30")
			header_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetRecordHeader.If_modified_since, ifmodifiedsince)
			header_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetRecordHeader.X_external, "leads.External")
			response = record_operations.get_record(record_id, module_api_name, param_instance, header_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Record::ResponseWrapper
						response_wrapper = response_handler
						records= response_wrapper.data
						records.each do |record|
							print "record ID: " + record.id.to_s + "\n"
							created_by= record.created_by
							if created_by != nil
								print "record Created By User-ID: " + created_by.id.to_s + "\n"
								print "record Created By User-Name: " + created_by.name.to_s + "\n"
								print "record Created By User-Email: " + created_by.email.to_s + "\n"
							end
							print "record CreatedTime: " + record.created_time.to_s + "\n"
							modified_by= record.modified_by
							if modified_by != nil
								print "record Modified By User-ID: " + modified_by.id.to_s + "\n"
								print "record Modified By User-Name: " + modified_by.name.to_s + "\n"
								print "record Modified By User-Email: " + modified_by.email.to_s + "\n"
							end
							print "record ModifiedTime: " + record.modified_time.to_s + "\n"
							tags= record.tag
							if tags != nil
								tags.each do |tag|
									print "record Tag Name: " + tag.name.to_s + "\n"
									print "record Tag ID: " + tag.id.to_s + "\n"
								end
							end
							# To get particular field value
							print "record Field Value: " + record.get_key_value("last__name").to_s + "\n"
							print "record KeyValues: ".to_s + "\n"
							record.each do |k, v|
								key_name = k
								value = v
								if value.is_a? Array
									data_list= value
									if data_list.size > 0
										if data_list[0].is_a? ZOHOCRMSDK::Record::FileDetails
											file_details= value
											file_details.each do |file_detail|
												print "record FileDetails FileIds: " + file_detail.file_id__s.to_s + "\n"
												print "record FileDetails FileNameS: " + file_detail.file_name__s.to_s + "\n"
												print "record FileDetails SizeS: " + file_detail.size__s.to_s + "\n"
												print "record FileDetails Id: " + file_detail.id.to_s + "\n"
											end
										elsif data_list[0].is_a? ZOHOCRMSDK::Util::Choice
											choice_list=  data_list
											print key_name.to_s + "\n"
											print "values".to_s + "\n"
											choice_list.each do |choice|
												print choice.value.to_s + "\n"
											end
										elsif data_list[0].is_a? ZOHOCRMSDK::Record::ImageUpload
											image_uploads=data_list
											image_uploads.each do |image_upload|
												print "record  Description: " + image_upload.description__s.to_s + "\n"
												print "record  FileIds: " + image_upload.file_id__s.to_s + "\n"
												print "record  FileNameS: " + image_upload.file_name__s.to_s + "\n"
												print "record PreviewIdS: " + image_upload.preview_id__s.to_s + "\n"
												print "record  SizeS: " + image_upload.size__s.to_s + "\n"
												print "record  States: " + image_upload.state__s.to_s + "\n"
												print "record  ID: " + image_upload.id.to_s + "\n"
												print "record  SequenceNumber: " + image_upload.sequence_number__s.to_s + "\n"
											end
										elsif data_list[0].is_a? ZOHOCRMSDK::Record::Tax
											tax = data_list[0]
											print "record Tax id: " + tax.id.to_s + "\n"
											print "record Tax value: " + tax.value.to_s + "\n"
										elsif data_list[0].is_a? ZOHOCRMSDK::Tags::Tag
											tag_list = value
											tag_list.each do |tag|
												print "record Tag Name: " + tag.name.to_s + "\n"
												print "record Tag ID: " + tag.id.to_s + "\n"
											end
										elsif data_list[0].is_a? ZOHOCRMSDK::Record::PricingDetails
											pricing_details= value
											pricing_details.each do |pricing_detail|
												print "record PricingDetails ToRange: " + pricing_detail.to_range.to_s + "\n"
												print "record PricingDetails Discount: " + pricing_detail.discount.to_s + "\n"
												print "record PricingDetails ID: " + pricing_detail.id.to_s + "\n"
												print "record PricingDetails FromRange: " + pricing_detail.from_range.to_s + "\n"
											end
										elsif data_list[0].is_a? ZOHOCRMSDK::Record::Record
											record_list= data_list
											record_list.each do |record1|
												record1.each do |k1, v1|
													print k1 + ": " + v1.to_s + "\n"
												end
											end
										elsif data_list[0].is_a? ZOHOCRMSDK::Record::LineTax
											line_taxes=  data_list
											line_taxes.each do |line_tax|
												print "record ProductDetails LineTax Percentage: " + line_tax.percentage.to_s + "\n"
												print "record ProductDetails LineTax Name: " + line_tax.name.to_s + "\n"
												print "record ProductDetails LineTax Id: " + line_tax.id.to_s + "\n"
												print "record ProductDetails LineTax Value: " + line_tax.value.to_s + "\n"
											end
										elsif data_list[0].is_a? ZOHOCRMSDK::Record::Comment
											comments=  data_list
											comments.each do |comment|
												print "record Comment CommentedBy: " + comment.commented_by.to_s + "\n"
												print "record Comment CommentedTime: " + comment.commented_time.to_s + "\n"
												print "record Comment CommentContent: " + comment.comment_content.to_s + "\n"
												print "record Comment Id: " + comment.id.to_s + "\n"
											end
										elsif data_list[0].is_a? ZOHOCRMSDK::Record::Attachment
											attachments=  data_list
											attachments.each do |attachment|
												owner= attachment.owner
												if owner != nil
													print "record Attachment Owner User-Name: " + owner.name.to_s + "\n"
													print "record Attachment Owner User-ID: " + owner.id.to_s + "\n"
													print "record Attachment Owner User-Email: " + owner.email.to_s + "\n"
												end
												print "record Attachment Modified Time: " + attachment.modified_time.to_s + "\n"
												print "record Attachment File Name: " + attachment.file_name.to_s + "\n"
												print "record Attachment Created Time: " + attachment.created_time.to_s + "\n"
												print "record Attachment File Size: " + attachment.size.to_s + "\n"
												parent_id = attachment.parent_id
												if parent_id != nil
													print "record Attachment parent record Name: " + parent_id.name.to_s + "\n"
													print "record Attachment parent record ID: " + parent_id.id.to_s + "\n"
												end
												print "record Attachment is Editable: " + attachment.editable.to_s + "\n"
												print "record Attachment File ID: " + attachment.file_id.to_s + "\n"
												print "record Attachment File Type: " + attachment.type.to_s + "\n"
												print "record Attachment se_module: " + attachment.se_module.to_s + "\n"
												modified_by = attachment.modified_by
												if modified_by != nil
													print "record Attachment Modified By User-Name: " + modified_by.name.to_s + "\n"
													print "record Attachment Modified By User-ID: " + modified_by.id.to_s + "\n"
													print "record Attachment Modified By User-Email: " + modified_by.email.to_s + "\n"
												end
												print "record Attachment State: " + attachment.state.to_s + "\n"
												print "record Attachment ID: " + attachment.id.to_s + "\n"
												created_by = attachment.created_by
												if created_by != nil
													print "record Attachment Created By User-Name: " + created_by.name.to_s + "\n"
													print "record Attachment Created By User-ID: " + created_by.id.to_s + "\n"
													print "record Attachment Created By User-Email: " + created_by.email.to_s + "\n"
												end
												print "record Attachment LinkUrl: " + attachment.link_url.to_s + "\n"
											end
										else
											print key_name + ": " + value.to_s + "\n"
										end
									end
								elsif value.is_a? ZOHOCRMSDK::Record::Record
									record_value=  value
									print "record " + key_name + " ID: " + record_value.id.to_s + "\n"
									print "record " + key_name + " Name: " + record_value.get_key_value("name").to_s + "\n"
								elsif value.is_a? ZOHOCRMSDK::Layouts::Layouts
									layout= value
									if layout != nil
										print "record " + key_name + " ID: " + layout.id.to_s + "\n"
										print "record " + key_name + " Name: " + layout.name.to_s + "\n"
									end
								elsif value.is_a? ZOHOCRMSDK::Users::MinifiedUser
									user= value
									if user != nil
										print "record " + key_name + " User-ID: " + user.id.to_s + "\n"
										print "record " + key_name + " User-Name: " + user.name.to_s + "\n"
										print "record " + key_name + " User-Email: " + user.email.to_s + "\n"
									end
								elsif value.is_a? ZOHOCRMSDK::Util::Choice
									print key_name + ": " + (value).value.to_s + "\n"
								elsif value.is_a? ZOHOCRMSDK::Record::RemindAt
									print key_name + ": " + (value).alarm.to_s + "\n"
								elsif value.is_a? ZOHOCRMSDK::Record::RecurringActivity
									print key_name.to_s + "\n"
									print "rrule" + ": " + (value).rrule.to_s + "\n"
								elsif value.is_a? ZOHOCRMSDK::Record::Consent
									consent = value
									print "record Consent ID: " + consent.id.to_s + "\n"
									owner = consent.owner
									if owner != nil
										print "record Consent Owner Name: " + owner.name.to_s + "\n"
										print "record Consent Owner ID: " + owner.id.to_s + "\n"
										print "record Consent Owner Email: " + owner.email.to_s + "\n"
									end
									consent_created_by = consent.created_by
									if consent_created_by != nil
										print "record Consent CreatedBy Name: " + consent_created_by.name.to_s + "\n"
										print "record Consent CreatedBy ID: " + consent_created_by.id.to_s + "\n"
										print "record Consent CreatedBy Email: " + consent_created_by.email.to_s + "\n"
									end
									consent_modified_by = consent.modified_by
									if consent_modified_by != nil
										print "record Consent ModifiedBy Name: " + consent_modified_by.name.to_s + "\n"
										print "record Consent ModifiedBy ID: " + consent_modified_by.id.to_s + "\n"
										print "record Consent ModifiedBy Email: " + consent_modified_by.email.to_s + "\n"
									end
									print "record Consent CreatedTime: " + consent.created_time.to_s + "\n"
									print "record Consent ModifiedTime: " + consent.modified_time.to_s + "\n"
									print "record Consent ContactThroughEmail: " + consent.contact_through_email.to_s + "\n"
									print "record Consent ContactThroughSocial: " + consent.contact_through_social.to_s + "\n"
									print "record Consent ContactThroughSurvey: " + consent.contact_through_survey.to_s + "\n"
									print "record Consent ContactThroughPhone: " + consent.contact_through_phone.to_s + "\n"
									print "record Consent MailSentTime: " + consent.mail_sent_time.to_s + "\n"
									print "record Consent ConsentDate: " + consent.consent_date.to_s + "\n"
									print "record Consent ConsentRemarks: " + consent.consent_remarks.to_s + "\n"
									print "record Consent ConsentThrough: " + consent.consent_through.to_s + "\n"
									print "record Consent DataProcessingBasis: " + consent.data_processing_basis.to_s + "\n"
									# To get custom values
									print "record Consent Lawful Reason: " + consent.get_key_value("lawful__reason").to_s + "\n"
								else
									print key_name + ": " + value.to_s + "\n"
								end
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Record::FileBodyWrapper
 				    file_body_wrapper = response_handler
						stream_wrapper = file_body_wrapper.file
						File.open(destination_folder + '/' + stream_wrapper.name, 'w') do |f|
							f.write(stream_wrapper.stream)
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Record::APIException
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
				module_api_name = "leads"
				record_id = 44024000774074
				destination_folder = "/users/zohocrm-java-sdk-sample/file"
				get_record(module_api_name, record_id, destination_folder)
			rescue Exception => e
				raise e
			end
		end
end
GetRecord.initialize_and_call