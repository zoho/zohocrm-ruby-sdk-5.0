require_relative '../util/model'

module ZOHOCRMSDK
  module Record
    class FileDetails
      include Util::Model

      # Creates an instance of FileDetails
      def initialize
        @file_name__s = nil
        @size__s = nil
        @id = nil
        @file_id__s = nil
        @delete = nil
        @key_modified = Hash.new
      end

        # The method to get the file_name__s
        # @return A String value

      def file_name__s
        @file_name__s
      end

        # The method to set the value to file_name__s
        # @param file_name__s [String] A String

      def file_name__s=(file_name__s)
        if file_name__s!=nil and !file_name__s.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: file_name__s EXPECTED TYPE: String', nil, nil)
        end
        @file_name__s = file_name__s
        @key_modified['File_Name__s'] = 1
      end

        # The method to get the size__s
        # @return A String value

      def size__s
        @size__s
      end

        # The method to set the value to size__s
        # @param size__s [String] A String

      def size__s=(size__s)
        if size__s!=nil and !size__s.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: size__s EXPECTED TYPE: String', nil, nil)
        end
        @size__s = size__s
        @key_modified['Size__s'] = 1
      end

        # The method to get the id
        # @return A Integer value

      def id
        @id
      end

        # The method to set the value to id
        # @param id [Integer] A Integer

      def id=(id)
        if id!=nil and !id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
        end
        @id = id
        @key_modified['id'] = 1
      end

        # The method to get the file_id__s
        # @return A String value

      def file_id__s
        @file_id__s
      end

        # The method to set the value to file_id__s
        # @param file_id__s [String] A String

      def file_id__s=(file_id__s)
        if file_id__s!=nil and !file_id__s.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: file_id__s EXPECTED TYPE: String', nil, nil)
        end
        @file_id__s = file_id__s
        @key_modified['File_Id__s'] = 1
      end

        # The method to get the delete
        # @return A String value

      def delete
        @delete
      end

        # The method to set the value to delete
        # @param delete [String] A String

      def delete=(delete)
        if delete!=nil and !delete.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: delete EXPECTED TYPE: String', nil, nil)
        end
        @delete = delete
        @key_modified['_delete'] = 1
      end

        # The method to check if the user has modified the given key
        # @param key [String] A String
        # @return A Integer value

      def is_key_modified(key)
        if key!=nil and !key.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: key EXPECTED TYPE: String', nil, nil)
        end
        if @key_modified.key?(key)
          return @key_modified[key]
        end

        nil
      end

        # The method to mark the given key as modified
        # @param key [String] A String
        # @param modification [Integer] A Integer

      def set_key_modified(key, modification)
        if key!=nil and !key.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: key EXPECTED TYPE: String', nil, nil)
        end
        if modification!=nil and !modification.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: modification EXPECTED TYPE: Integer', nil, nil)
        end
        @key_modified[key] = modification
      end

    end
  end
end
