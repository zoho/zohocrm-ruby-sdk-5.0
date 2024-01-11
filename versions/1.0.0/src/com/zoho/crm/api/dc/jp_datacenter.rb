require_relative 'datacenter'

module ZOHOCRMSDK
  module DC
    class JPDataCenter < DataCenter
      def initialize; end

      def get_iam_url
        'https://accounts.zoho.jp/oauth/v2/token'
      end

      def get_file_upload_url
        'https://content.zohoapis.jp'
      end

      PRODUCTION = Environment.new('https://www.zohoapis.jp', JPDataCenter.new.get_iam_url, JPDataCenter.new.get_file_upload_url,"jp_prd")
      SANDBOX = Environment.new('https://sandbox.zohoapis.jp', JPDataCenter.new.get_iam_url, JPDataCenter.new.get_file_upload_url,"jp_sdb")
      DEVELOPER = Environment.new('https://developer.zohoapis.jp', JPDataCenter.new.get_iam_url, JPDataCenter.new.get_file_upload_url,"jp_dev")
    end
  end
end