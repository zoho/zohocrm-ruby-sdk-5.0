require "ZOHOCRMSDK5_0"

class GetOrganization
		def self.get_organization
			org_operations =  ZOHOCRMSDK::Org::OrgOperations.new
			response = org_operations.get_organization
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Org::ResponseWrapper
						response_wrapper = response_handler
						orgs= response_wrapper.org
						orgs.each do |org|
							print "organization Country: " + org.country.to_s + "\n"
							hierarchy_preferences = org.hierarchy_preferences
							if hierarchy_preferences != nil
								print "organization HierarchyPreferences Type: " + hierarchy_preferences.type.to_s + "\n"
							end
							print "organization PhotoId: " + org.photo_id.to_s + "\n"
							print "organization City: " + org.city.to_s + "\n"
							print "organization Description: " + org.description.to_s + "\n"
							print "organization McStatus: " + org.mc_status.to_s + "\n"
							print "organization GappsEnabled: " + org.gapps_enabled.to_s + "\n"
							print "organization DomainName: " + org.domain_name.to_s + "\n"
							print "organization TranslationEnabled: " + org.translation_enabled.to_s + "\n"
							print "organization Street: " + org.street.to_s + "\n"
							print "organization Alias: " + org.alias.to_s + "\n"
							print "organization Currency: " + org.currency.to_s + "\n"
							print "organization Id: " + org.id.to_s + "\n"
							print "organization State: " + org.state.to_s + "\n"
							print "organization Fax: " + org.fax.to_s + "\n"
							print "organization EmployeeCount: " + org.employee_count.to_s + "\n"
							print "organization Zip: " + org.zip.to_s + "\n"
							print "organization Website: " + org.website.to_s + "\n"
							print "organization CurrencySymbol: " + org.currency_symbol.to_s + "\n"
							print "organization Mobile: " + org.mobile.to_s + "\n"
							print "organization CurrencyLocale: " + org.currency_locale.to_s + "\n"
							print "organization PrimaryZuid: " + org.primary_zuid.to_s + "\n"
							print "organization ZiaPortalId: " + org.zia_portal_id.to_s + "\n"
							print "organization TimeZone: " + org.time_zone.to_s + "\n"
							print "organization Zgid: " + org.zgid.to_s + "\n"
							print "organization CountryCode: " + org.country_code.to_s + "\n"
							license_details = org.license_details
							if license_details != nil
								print "organization LicenseDetails PaidExpiry: " + license_details.paid_expiry.to_s + "\n"
								print "organization LicenseDetails UsersLicensePurchased: " + license_details.users_license_purchased.to_s + "\n"
								print "organization LicenseDetails TrialType: " + license_details.trial_type.to_s + "\n"
								print "organization LicenseDetails TrialExpiry: " + license_details.trial_expiry.to_s + "\n"
								print "organization LicenseDetails Paid: " + license_details.paid.to_s + "\n"
								print "organization LicenseDetails PaidType: " + license_details.paid_type.to_s + "\n"
							end
							print "organization Phone: " + org.phone.to_s + "\n"
							print "organization CompanyName: " + org.company_name.to_s + "\n"
							print "organization PrivacySettings: " + org.privacy_settings.to_s + "\n"
							print "organization HipaaComplianceEnabled: " + org.hipaa_compliance_enabled.to_s + "\n"
							print "organization PrimaryEmail: " + org.primary_email.to_s + "\n"
							print "organization IsoCode: " + org.iso_code.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Org::APIException
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
				get_organization
			rescue Exception => e
				raise e
			end
		end
end
GetOrganization.initialize_and_call