require "ZOHOCRMSDK5_0"

class DownloadBulkWriteResult
		def self.download_bulk_write_result(download_url, destination_folder)
			bulk_write_operations =  ZOHOCRMSDK::BulkWrite::BulkWriteOperations.new
			response = bulk_write_operations.download_bulk_write_result(download_url)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::BulkWrite::FileBodyWrapper
 				    file_body_wrapper = response_handler
						stream_wrapper = file_body_wrapper.file
						File.open(destination_folder + '/' + stream_wrapper.name, 'w') do |f|
							f.write(stream_wrapper.stream)
						end
					elsif response_handler.is_a? ZOHOCRMSDK::BulkWrite::APIException
						exception = response_handler
						if exception.status != nil
							print "status: " + exception.status.value.to_s + "\n"
						end
						if exception.code != nil
							print "code: " + exception.code.value.to_s + "\n"
						end
						if exception.details != nil
							print "details: ".to_s + "\n"
							exception.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
						end
						if exception.message != nil
							print "message: " + exception.message.value.to_s + "\n"
						end
						if exception.x_error != nil
							print "x_error: " + exception.x_error.value.to_s + "\n"
						end
						if exception.x_info != nil
							print "x_info: " + exception.x_info.value.to_s + "\n"
						end
						if exception.http_status != nil
							print "message: " + exception.http_status.to_s + "\n"
						end
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
				download_url = "https://download-accl.zoho.com/v2/crm/6735/bulk-write/347706009/3477061009.zip"
				destination_folder = "/users/user_name/_documents"
				download_bulk_write_result(download_url, destination_folder)
			rescue Exception => e
				raise e
			end
		end
end
DownloadBulkWriteResult.initialize_and_call