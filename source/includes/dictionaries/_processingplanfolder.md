## Bills of Materials Folder

Using the JSON API, you can create and update information about Bills of Materials Folders and request the lists of Folders. The entity code for Bills of Materials Folder in the JSON API is the **processingplanfolder** keyword.

### Bills of Materials Folders
#### Entity attributes

| Title | Type | Description |
| ----------| ---------|----------|
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Read only` |
| **archived** | Boolean | Has Bills of Materials Folder been archived<br>`+Required when replying` |
| **externalCode** | String(255) | Bills of Materials Folder External Code<br>`+Required when replying` |
| **code** | String(255) | Bills of Materials Folder Code |
| **description** | String(4096) | Bills of Materials Folder Descriptions|
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | Employee department metadata<br>`+Required when replying` `+Expand` |
| **id** | UUID | Bills of Materials Folder ID<br>`+Required when replying` `+Read only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Bills of Materials Folder Metadata<br>`+Required when replying` |
| **name** | String(255) | Bills of Materials Folder Name<br>`+Required when replying` `+Required when creating` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | Owner (Employee) metadata<br>`+Expand` |
| **pathName** | String | Name of the Bills of Materials Folder<br>`+Required when replying` `+Read Only` |
| **shared** | Boolean | Sharing<br>`+Required when replying` |
| **updated** | DateTime | When the entity was last updated<br>`+Required for response` `+Read-only` |

### Get list of Bills of Materials Folder

Request all Bills of Materials Folders on the account.
Result: JSON object including fields:

| Title | Type | Description |
| ----------- | ------ | -------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the employee who made the request |
| **rows** | Array(Object) | An array of JSON objects representing Bills of Materials Folders |

**Parameters**

| Parameter | Description |
| ------ | -------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to retrieve.`Allowedstim values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get list of Bills of Materials Folders

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of list Bills of Materials Folders.

```json
{
   "context": {
     "employee": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/context/employee",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     }
   },
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/metadata",
     "type": "processingplanfolder",
     "mediaType": "application/json",
     "size": 1,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/3ea73e1a-2cad-11e6-8a84-bae50000001d",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/metadata",
         "type": "processingplanfolder",
         "mediaType": "application/json"
       },
       "id": "3ea73e1a-2cad-11e6-8a84-bae50000001d",
       "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
       "owner": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2022-04-18 09:48:28.563",
       "name": "Bills of Materials Folder",
       "externalCode": "gt6UOfuXgb2ChJBcVn55H2",
       "archived": false,
       "pathName": ""
     }
   ]
}
```

### Create new Bills of Materials Folder

Request to create new Bills of Materials Folder.
The fields required for the creation of the Bills of Materials Folder:

| Title | Description |
| ------ | -------- |
| **name** | Name of the Bills of Materials Folder |

> An example of creating a new Bills of Materials Folder with a request body containing only the name field.

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "Group 1"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Bills of Materials Folder.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/3ea73e1a-2cad-11e6-8a84-bae50000001d",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/metadata",
     "type": "processingplanfolder",
     "mediaType": "application/json"
   },
   "id": "3ea73e1a-2cad-11e6-8a84-bae50000001d",
   "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-06-07 15:42:07",
   "name": "Group 1",
   "externalCode": "mRQao-5IgY3soIY1EaI083",
   "archived": false,
   "pathName": ""
}
```

> An example of creating a new Bills of Materials Folder with a larger request body.

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "Group 2",
             "code": "13321",
             "externalCode": "extGroup"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Bills of Materials Folder.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/275961ab-2cad-11e6-8a84-bae50000001a",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/metadata",
     "type": "processingplanfolder",
     "mediaType": "application/json"
   },
   "id": "275961ab-2cad-11e6-8a84-bae50000001a",
   "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-06-07 15:41:28",
   "name": "Group 2",
   "code": "13321",
   "externalCode": "extGroup",
   "archived": false,
   "pathName": ""
}
```

### Bills of Materials Folders Bulk creation and update

[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Bills of Materials Folders.
In the body of the request, you need to pass an array containing the JSON representation of the Bills of Materials Folders that you want to create or update. Updated Bills of Materials Folders must contain the ID as metadata.

> Example of creating and updating some Bills of Materials Folders

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "Furniture Group",
               "externalCode": "furnitureCode"
             },
             {
               "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/3ea73e1a-2cad-11e6-8a84-bae50000001d",
                 "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/metadata",
                 "type": "processingplanfolder",
                 "mediaType": "application/json"
               },
               "name": "Group Auto"
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Bills of Materials Folders.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/3ea73e1a-2cad-11e6-8a84-bae50000001d",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/metadata",
       "type": "processingplanfolder",
       "mediaType": "application/json"
     },
     "id": "3ea73e1a-2cad-11e6-8a84-bae50000001d",
     "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
     "owner": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": false,
     "group": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2022-04-19 09:48:28.563",
     "name": "Group Auto",
     "externalCode": "HiQQWfW-jK5Z8e5KxjkCb2",
     "archived": false,
     "pathName": ""
   },
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/d071992d-bee8-11ec-0a82-031400000004",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/metadata",
       "type": "processingplanfolder",
       "mediaType": "application/json"
     },
     "id": "d071992d-bee8-11ec-0a82-031400000004",
     "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
     "owner": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": false,
     "group": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2022-04-19 09:48:28.563",
     "name": "Furniture Group",
     "externalCode": "furnitureCode",
     "archived": false,
     "pathName": ""
   }
]
```

### Delete Bills of Materials Folder

**Parameters**

| Parameter | Description |
| ------ | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bills of Materials Folder id. |

> Request to remove the Bills of Materials Folder with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of Bills of Materials Folder.

### Bulk deletion of Bills of Materials Folders

In the body of the request, you need to pass an array containing the JSON Bills of Materials Folders metadata that you want to remove.


> Bulk deletion request for Bills of Materials Folders.

```shell
curl -X POST
   "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
         {
           "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/7944ef04-f831-11e5-7a69-971500188b1",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/metadata",
             "type": "processingplanfolder",
             "mediaType": "application/json"
             }
         },
         {
           "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/7944ef04-f831-11e5-7a69-971500188b2",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/metadata",
             "type": "processingplanfolder",
             "mediaType": "application/json"
             }
         }
       ]'
```

> Successful request. The result is JSON information about the deletion of Bills of Materials Folders.

```json
[
   {
     "info":"Entity 'processingplanfolder' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'processingplanfolder' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```


### Bills of Materials Folder Metadata
#### Bills of Materials Folder Metadata

Request to get metadata of Bills of Materials Folder. The result is a JSON object including:

| Title | Type | Description |
| ------------- | ------ | -------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of Bills of Materials Folders<br>`+Required when replying`|

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Get metadata of Bills of Materials Folder

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional fields of Bills of Materials Folder.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/metadata",
     "mediaType": "application/json"
   }
}
```

### Bills of Materials Folder

**Parameters**

| Parameter | Description|
| ------ | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bills of Materials Folder id. |

### Get Bills of Materials Folder

> Request for a separate Bills of Materials Folders with the specified id.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/8c329385-bee9-11ec-0a82-04c500000102"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Bills of Materials Folder.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/8c329385-bee9-11ec-0a82-04c500000102",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/metadata",
     "type": "processingplanfolder",
     "mediaType": "application/json"
   },
   "id": "8c329385-bee9-11ec-0a82-04c500000102",
   "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2022-04-19 09:48:28.563",
   "name": "Furniture Group",
   "externalCode": "furnitureCode",
   "archived": false,
   "pathName": ""
}
```

### Edit Bills of Materials Folder

Request to update the Bills of Materials Folderd with the specified id.
In the body of the request, you can specify only those fields that need to be changed in Bills of Materials Folders, except for those that
are marked `Read only` in the description of [Bills of Materials Folder Attributes](../dictionaries/#entities-bills-of-materials-folder).

To update the **pathName** field, you need to update the link to the parent Bills of Materials Folder, i.e. update field
**processingplanfolder**.

**Parameters**

| Parameter | Description |
| ------ | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bills of Materials Folder id. |

> An example of a request to update a specific Bills of Materials Folder.

```shell
   curl -X PUT
     "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "Group 1",
             "code": "groupCode",
             "externalCode": "extGroupCode"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Bills of Materials Folder.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/3ea73e1a-2cad-11e6-8a84-bae50000001d",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/metadata",
     "type": "processingplanfolder",
     "mediaType": "application/json"
   },
   "id": "3ea73e1a-2cad-11e6-8a84-bae50000001d",
   "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-06-07 15:45:28",
   "name": "Group 1",
   "code": "groupCode",
   "externalCode": "extGroupCode",
   "archived": false,
   "pathName": ""
}
```
