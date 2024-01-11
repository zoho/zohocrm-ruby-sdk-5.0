require "ZOHOCRMSDK5_0"

class GetPortal
		def self.get_portal(portal_name)
			portals_operations =  ZOHOCRMSDK::Portals::PortalsOperations.new
			response = portals_operations.get_portal(portal_name)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Portals::ResponseWrapper
						response_wrapper = response_handler
						portals= response_wrapper.portals
						portals.each do |portal|
							print "portals CreatedTime: " + portal.created_time.to_s + "\n"
							print "portals ModifiedTime: " + portal.modified_time.to_s + "\n"
							modified_by = portal.modified_by
							if modified_by != nil
								print "portals ModifiedBy User-ID: " + modified_by.id.to_s + "\n"
								print "portals ModifiedBy User-Name: " + modified_by.name.to_s + "\n"
							end
							created_by = portal.created_by
							if created_by != nil
								print "portals CreatedBy User-ID: " + created_by.id.to_s + "\n"
								print "portals CreatedBy User-Name: " + created_by.name.to_s + "\n"
							end
							print "portals Zaid: " + portal.zaid.to_s + "\n"
							print "portals Name: " + portal.name.to_s + "\n"
							print "portals Active: " + portal.active.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Portals::APIException
						exception = response_handler
						print "status: " + exception.status.value.to_s + "\n"
						print "code: " + exception.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						exception.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + exception.message.to_s + "\n"
					end
				elsif response.status_code != 204
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
				portal_name = "portals_ap_itest100"
				get_portal(portal_name)
			rescue Exception => e
				raise e
			end
		end
end
GetPortal.initialize_and_call
