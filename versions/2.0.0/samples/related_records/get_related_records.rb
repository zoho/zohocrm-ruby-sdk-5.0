require "ZOHOCRMSDK5_0"

class GetRelatedRecords
		def self.get_related_records(module_api_name, record_id, related_list_api_name)
			related_records_operations =  ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name, null)
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations::GetRelatedRecordsParam.page, 1)
			param_instance.add(ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations::GetRelatedRecordsParam.per_page, 2)
			param_instance.add(ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations::GetRelatedRecordsParam.fields, "id")
			header_instance =  ZOHOCRMSDK::HeaderMap.new
			# startdatetime = DateTime.new(2019, 06, 01, 10, 00, 01, "+05:30")
			# header_instance.add(ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations::GetRelatedRecordsHeader.If_modified_since, startdatetime)
			response = related_records_operations.get_related_records(record_id, param_instance, header_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::RelatedRecords::ResponseWrapper
						response_wrapper = response_handler
						records= response_wrapper.data
						records.each do |record|
							print "related_record ID: " + record.id.to_s + "\n"
							created_by= record.created_by
							if created_by != nil
								print "related_record Created By User-ID: " + created_by.id.to_s + "\n"
								print "related_record Created By User-Name: " + created_by.name.to_s + "\n"
								print "related_record Created By User-Email: " + created_by.email.to_s + "\n"
							end
							print "related_record CreatedTime: " + record.created_time.to_s + "\n"
							modified_by= record.modified_by
							if modified_by != nil
								print "related_record Modified By User-ID: " + modified_by.id.to_s + "\n"
								print "related_record Modified By User-Name: " + modified_by.name.to_s + "\n"
								print "related_record Modified By User-Email: " + modified_by.email.to_s + "\n"
							end
							print "related_record ModifiedTime: " + record.modified_time.to_s + "\n"
							tags= record.tag
							if tags != nil
								tags.each do |tag|
									print "related_record Tag Name: " + tag.name.to_s + "\n"
									print "related_record Tag ID: " + tag.id.to_s + "\n"
								end
							end
							# To get particular field value
							print "related_record Field Value: " + record.get_key_value("last__name").to_s + "\n"# FieldApiName
							print "related_record KeyValues: ".to_s + "\n"
							record.each do |k, v|
								key_name = k
								value = v
								if value.is_a? Array
									data_list=  value
									if data_list.size > 0
										if data_list[0].is_a? ZOHOCRMSDK::Record::FileDetails
											file_details=value
											file_details.each do |file_detail|
												print "record FileDetails FileIds: " + file_detail.file_id__s.to_s + "\n"
												print "record FileDetails FileNameS: " + file_detail.file_name__s.to_s + "\n"
												print "record FileDetails SizeS: " + file_detail.size__s.to_s + "\n"
												print "record FileDetails Id: " + file_detail.id.to_s + "\n"
											end
										elsif data_list[0].is_a? ZOHOCRMSDK::Tags::Tag
											tag_list =  value
											tag_list.each do |tag|
												print "related_record Tag Name: " + tag.name.to_s + "\n"
												print "related_record Tag ID: " + tag.id.to_s + "\n"
											end
										elsif data_list[0].is_a? ZOHOCRMSDK::Record::PricingDetails
											pricing_details=  value
											pricing_details.each do |pricing_detail|
												print "related_record PricingDetails ToRange: " + pricing_detail.to_range.to_s + "\n"
												print "related_record PricingDetails Discount: " + pricing_detail.discount.to_s + "\n"
												print "related_record PricingDetails ID: " + pricing_detail.id.to_s + "\n"
												print "related_record PricingDetails FromRange: " + pricing_detail.from_range.to_s + "\n"
											end
										elsif data_list[0].is_a? ZOHOCRMSDK::Record::Record
											record_list=  data_list
											record_list.each do |record1|
												record1.each do |k1, v1|
													print k1 + ": " + v1.to_s + "\n"
												end
											end
										elsif data_list[0].is_a? ZOHOCRMSDK::Record::LineTax
											line_taxes=  data_list
											line_taxes.each do |line_tax|
												print "related_record ProductDetails LineTax Percentage: " + line_tax.percentage.to_s + "\n"
												print "related_record ProductDetails LineTax Name: " + line_tax.name.to_s + "\n"
												print "related_record ProductDetails LineTax Id: " + line_tax.id.to_s + "\n"
												print "related_record ProductDetails LineTax Value: " + line_tax.value.to_s + "\n"
											end
										elsif data_list[0].is_a? ZOHOCRMSDK::Util::Choice
											choice= data_list
											choice.each do |choice_value|
												print "related_record " + key_name + " : " + choice_value.value.to_s + "\n"
											end

										elsif data_list[0].is_a? ZOHOCRMSDK::Record::Comment
											comments=  data_list
											comments.each do |comment|
												print "record Comment CommentedBy: " + comment.commented_by.to_s + "\n"
												print "record Comment CommentedTime: " + comment.commented_time.to_s + "\n"
												print "record Comment CommentContent: " + comment.comment_content.to_s + "\n"
												print "record Comment Id: " + comment.id.to_s + "\n"
											end
										elsif data_list[0].is_a? ZOHOCRMSDK::Record::ImageUpload
											image_uploads= data_list
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
										elsif data_list[0].is_a? ZOHOCRMSDK::Attachments::Attachment
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
								elsif value.is_a? ZOHOCRMSDK::Layouts::Layouts
									layout=  value
									if layout != nil
										print "related_record " + key_name + " ID: " + layout.id.to_s + "\n"
										print "related_record " + key_name + " Name: " + layout.name.to_s + "\n"
									end
								elsif value.is_a? ZOHOCRMSDK::Users::MinifiedUser
									user= value
									if user != nil
										print "related_record " + key_name + " User-ID: " + user.id.to_s + "\n"
										print "related_record " + key_name + " User-Name: " + user.name.to_s + "\n"
										print "related_record " + key_name + " User-Email: " + user.email.to_s + "\n"
									end
								elsif value.is_a? ZOHOCRMSDK::Record::Record
									record_value=  value
									print "related_record " + key_name + " ID: " + record_value.id.to_s + "\n"
									print "related_record " + key_name + " Name: " + record_value.get_key_value("name").to_s + "\n"
								elsif value.is_a? ZOHOCRMSDK::Util::Choice
									choice_value = value
									print "related_record " + key_name + " : " + choice_value.value.to_s + "\n"
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
						info = response_wrapper.info
						if info != nil
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
						end
					elsif response_handler.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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
				record_id = 4402480774074
				related_list_api_name = "notes"
				get_related_records(module_api_name, record_id, related_list_api_name)
			rescue Exception => e
				raise e
			end
		end
end
GetRelatedRecords.initialize_and_call