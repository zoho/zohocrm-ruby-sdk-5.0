require_relative 'datacenter'

module ZOHOCRMSDK
  module DC
    class AUDataCenter < DataCenter
      def initialize; end

      def get_iam_url
        'https://accounts.zoho.com.au/oauth/v2/token'
      end

      def get_file_upload_url
        'https://content.zohoapis.com.au'
      end

      PRODUCTION = Environment.new('https://www.zohoapis.com.au', AUDataCenter.new.get_iam_url, AUDataCenter.new.get_file_upload_url,"au_prd")
      SANDBOX = Environment.new('https://sandbox.zohoapis.com.au', AUDataCenter.new.get_iam_url, AUDataCenter.new.get_file_upload_url,"au_sdb")
      DEVELOPER = Environment.new('https://developer.zohoapis.com.au', AUDataCenter.new.get_iam_url, AUDataCenter.new.get_file_upload_url,"au_dev")
    end
  end
end