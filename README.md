# ZOHO CRM RUBY SDK 5.0 for API Version 5

The Ruby SDK for Zoho CRM allows developers to easily create Ruby applications that can be integrated with Zoho CRM. This SDK serves as a wrapper for the REST APIs, making it easier to access and utilize the services of Zoho CRM. 
Authentication to access the CRM APIs is done through OAuth2.0, and the authentication process is streamlined through the use of the Ruby SDK. The grant and access/refresh tokens are generated and managed within the SDK code, eliminating the need for manual handling during data synchronization between Zoho CRM and the client application.

This repository includes the Ruby SDK for API v5 of Zoho CRM. Check [Versions](https://github.com/zoho/zohocrm-Ruby-sdk-5.0/releases) for more details on the versions of SDK released for this API version.

License
=======

    Copyright (c) 2021, ZOHO CORPORATION PRIVATE LIMITED 
    All rights reserved. 

    Licensed under the Apache License, Version 2.0 (the "License"); 
    you may not use this file except in compliance with the License. 
    You may obtain a copy of the License at 
    
        http://www.apache.org/licenses/LICENSE-2.0 
    
    Unless required by applicable law or agreed to in writing, software 
    distributed under the License is distributed on an "AS IS" BASIS, 
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
    See the License for the specific language governing permissions and 
    limitations under the License.

## Latest Version

- [2.0.0](/versions/2.0.0/README.md)

    - Update RecordLockingOperations class constructor and methods.

    - Added new parentColumnIndex field in BulkWrite FieldMapping class.

    - Added new fileNames field in BulkWrite Resource class.

    - Support for the following new APIs. 
        - MailMerge:
            - [Send Mail Merge](https://www.zoho.com/crm/developer/docs/api/v5/send-mail-merge.html)
            - [Sign Mail Merge](https://www.zoho.com/crm/developer/docs/api/v5/sign-mail-merge.html)
            - [Download Mail Merge](https://www.zoho.com/crm/developer/docs/api/v5/download-mail-merge.html)

- [1.0.0](/versions/1.0.0/README.md)

    - Added new key in FileStore and DBStore

    - Added a new key find_user in OAuthToken.
      - By default, the find_user key is set to true, to set userSignature. However, this requires the ZohoCRM.users.READ and ZohoCRM.org.READ scopes to be mandatory. If you do not want to set userSignature, you must set the find_user key to false.

    - Ruby SDK upgraded to support v5 APIs.

    - Ruby SDK improved to support the following new APIs

        - [User Groups API](https://www.zoho.com/crm/developer/docs/api/v5/associated-user-count-user-group.html)
        - [Fiscal Years](https://www.zoho.com/crm/developer/docs/api/v5/get-fiscal-year.html)
        - [Timeline API](https://www.zoho.com/crm/developer/docs/api/v5/timeline-of-a-record.html)
        - [Transfer and Delete Users](https://www.zoho.com/crm/developer/docs/api/v5/transfer_records-delete_user.html)
        - [Territories](https://www.zoho.com/crm/developer/docs/api/v5/add-territories.html)
        - [Territories Users](https://www.zoho.com/crm/developer/docs/api/v5/associate-users-territory.html)
        - [Organization API](https://www.zoho.com/crm/developer/docs/api/v5/delete-org-img.html)
        - [Record Locking API](https://www.zoho.com/crm/developer/docs/api/v5/get-record-locking-info.html)


For older versions, please [refer](https://github.com/zoho/zohocrm-Ruby-sdk-5.0/releases).


## Including the SDK in your project

You can include the SDK to your project using:

- For including the latest [version](https://github.com/zoho/zohocrm-ruby-sdk-5.0/releases/tag/2.0.0)

  - Ruby SDK is available through Gem . You can download the gem using:
`gem install ZOHOCRMSDK5_0` 

  - You can include the SDK to your project using:
`require 'ZOHOCRMSDK5_0'`

### Dependencies
- Dependencies that should be included in the project
  - install **cgi**
    ```shell
      gem install cgi
    ```
  - install **csv**
    ```shell
      gem install csv
    ```
  - install **json**
    ```shell
      gem install json
    ```
  - install **multipart-post**
    ```shell
      gem install multipart-post
    ```
  - install **rest-client**
    ```shell
      gem install rest-client
    ```
  - install **uri**
    ```shell
      gem install uri
    ```
  - install **mysql2**
    ```shell
      gem install mysql2
    ```
  - install **tzinfo**
    ```shell
      gem install tzinfo
    ```
  - install **webrick**
    ```shell
      gem install webrick
    ```

For more details, kindly refer [here](/versions/2.0.0/README.md).
