## User directory
### User directories
#### Entity attributes

| Title | Type | Description |
| -------- |------- | ---------- |
| **id** | UUID | User Directory ID<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Metadata of the User directory<br>`+Required when replying` |
| **name** | String(255) | Name of the User Directory<br>`+Required when replying` `+Required when creating` |

#### List of user directories
To work with custom directories, you need to know the id of each directory.
This id is indicated in the URI parameters of requests to this entity as <metadata_id>. His
can be obtained by running a request to get company settings metadata. In the resulting list of entities
the fields of the meta type will contain a link to each of the directories. In this link, the last substring separated
character `/` and is an identifier for this directory.

Example: After executing the above query and finding among the list of reference books we are interested in, we isolate the following link
   from meta field: `https://app.kladana.in/api/remap/1.2/context/companysettings/metadata/customEntities/eaacabaf-2655-11e6-8a84-bae500000045`
   From this link, we isolate the <metadata_id> of the user directory we need: `eaacabaf-2655-11e6-8a84-bae500000045` and use this id
   to work with this user directory within the resource [User directory](../dictionaries/#suschnosti-pol-zowatel-skij-sprawochnik).

### Create directory
The only required field to create a custom directory
is the **name** field.
The action is only available to a user with administrative rights.

| Title | Description |
| ---------- | ---------- |
| **name** | Directory name |

> An example of a request to create a new user directory entity.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/customentity"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "custom dictionary"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created custom directory entity.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b",
     "type": "custom",
     "mediaType": "application/json"
   },
   "id": "3f9a2f30-76af-11e7-6adb-ede50000000b",
   "name": "custom dictionary"
}
```

### Edit directory
Request to change the directory.
The action is only available to a user with administrative rights.

**Parameters**

| Parameter | Description |
| ------------- | -------- |
| **metadata_id** | `string` (required) *Example: 3f9a2f30-76af-11e7-6adb-ede50000000b* user directory id. |

> An example of a request to update a user directory.

```shell
   curl -X PUT
     "ttps://app.kladana.in/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "new name"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated user guide.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b",
     "type": "custom",
     "mediaType": "application/json"
   },
   "id": "3f9a2f30-76af-11e7-6adb-ede50000000b",
   "name": "new name"
}
```

### Delete directory
Request to delete a user directory.
The action is only available to a user with administrative rights.

**Parameters**

| Parameter | Description |
| ------------- | -------- |
| **metadata_id** | `string` (required) *Example: 3f9a2f30-76af-11e7-6adb-ede50000000b* user directory id. |

> Delete directory
 
```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of the user directory.

### Elements of the User Directory
#### Element attributes

| Title | Type | Filtration | Description |
| ------------- | -------- | ------------- | -------- |
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Element Code of the User Directory|
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Description of the element of the User directory |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | The external code of the User Directory element<br>`+Required when replying` |
| **id** | UUID | `=` `!=` | Element ID of the User Directory<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | | Metadata of the User Directory element<br>`+Required when replying` |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Name of the User Directory element<br>`+Required when replying` `+Required when creating` |
| **updated** | datetime | `=` `!=` `<` `>` `<=` `>=` | The moment of the last update of the User Directory element<br>`+Required when replying` `+Read only` |
| **group** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **owner** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | `=` `!=` | Owner (Employee)<br>`+Expand` |
| **shared** | Boolean | `=` `!=` | Sharing<br>`+Required when replying` |

### Get directory elements
Request to get all items in the specified user dictionary.
Result: JSON object including fields:

| Title | Type | Description |
| ------------- | -------- | ------------- |
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Issuance metadata, |
| **context** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the elements of the User Directory. |

**Parameters**

| Parameter | Description |
| ------ | ---------- |
| **metadata_id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* user directory id. |

> Get directory items
 
```shell
  curl -X GET
    "https://app.kladana.in/api/remap/1.2/entity/customentity/7944ef04-f831-11e5-7a69-971500188b19"
    -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of user directory elements.
 
```json
{
   context: {
     "employee": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/context/employee",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     }
   },
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/customentity/7944ef04-f831-11e5-7a69-971500188b19/",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/customentity/metadata",
     "type": "custom",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#custom_7944ef04-f831-11e5-7a69-971500188b19",
     size: 3
     limit: 1000
     offset: 0
   },
   rows: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/customentity/7944ef04-f831-11e5-7a69-971500188b19/01b29035-2656-11e6-8a84-bae500000048",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/context/companysettings/metadata/customEntities/7944ef04-f831-11e5-7a69-971500188b19",
         "type": "custom",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#custom_7944ef04-f831-11e5-7a69-971500188b19/edit?id=01b29035-2656-11e6-8a84-bae500000048"
       },
       "id": "01b29035-2656-11e6-8a84-bae500000048",
       "accountId": "45489428-24a5-11e6-8a84-bae500000001",
       "updated": "2017-08-13 17:55:08",
       "name": "Partner1",
       "code": "partner1",
       "externalCode": "5434665867876",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9bc5de98-79f2-11e8-1a0d-4e0d0000002b",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#employee/edit?id=9bc5de98-79f2-11e8-1a0d-4e0d0000002b"
         }
       },
       shared: true
       group: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/9504054f-79f2-11e8-1a0d-4e0d00000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       }
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/customentity/7944ef04-f831-11e5-7a69-971500188b19/3fbe37f2-2659-11e6-8a84-bae500000013",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/context/companysettings/metadata/customEntities/7944ef04-f831-11e5-7a69-971500188b19",
         "type": "custom",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#custom_7944ef04-f831-11e5-7a69-971500188b19/edit?id=3fbe37f2-2659-11e6-8a84-bae500000013"
       },
       "id": "3fbe37f2-2659-11e6-8a84-bae500000013",
       "accountId": "45489428-24a5-11e6-8a84-bae500000001",
       "updated": "2017-08-13 11:06:23",
       "name": "Partner 2",
       "externalCode": "5434665867877",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9bc5de98-79f2-11e8-1a0d-4e0d0000002b",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#employee/edit?id=9bc5de98-79f2-11e8-1a0d-4e0d0000002b"
         }
       },
       shared: true
       group: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/9504054f-79f2-11e8-1a0d-4e0d00000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       }
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/customentity/7944ef04-f831-11e5-7a69-971500188b19/6343f631-265d-11e6-8a84-bae500000014",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/context/companysettings/metadata/customEntities/7944ef04-f831-11e5-7a69-971500188b19",
         "type": "custom",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#custom_7944ef04-f831-11e5-7a69-971500188b19/edit?id=6343f631-265d-11e6-8a84-bae500000014"
       },
       "id": "6343f631-265d-11e6-8a84-bae500000014",
       "accountId": "45489428-24a5-11e6-8a84-bae500000001",
       "updated": "2017-08-14 10:22:51",
       "name": "Peter Mikhalych from LLC Enterprise",
       "code": "partner mikhalych",
       "description": "Key employee of OOO Enterprise",
       "externalCode": "5434665867878",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9bc5de98-79f2-11e8-1a0d-4e0d0000002b",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#employee/edit?id=9bc5de98-79f2-11e8-1a0d-4e0d0000002b"
         }
       },
       shared: true
       group: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/9504054f-79f2-11e8-1a0d-4e0d00000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       }
     }
   ]
}
```

### Create a lookup element
The only required field to create a custom directory element
is the **name** field.

**Parameters**

| Parameter | Description |
| --------- | ------- |
| **metadata_id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* user directory id. |

> An example of a request to create a new element of the user directory.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/customentity/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "Partner 3",
             "code": "partner3",
             "description": "Description",
             "externalCode": "5434665867876",
             shared: false
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created custom directory element.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/customentity/7944ef04-f831-11e5-7a69-971500188b19/6343f631-265d-11e6-8a84-bae500000014",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/context/companysettings/metadata/customEntities/7944ef04-f831-11e5-7a69-971500188b19",
     "type": "custom",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#custom_7944ef04-f831-11e5-7a69-971500188b19/edit?id=6343f631-265d-11e6-8a84-bae500000014"
   },
   "id": "6343f631-265d-11e6-8a84-bae500000014",
   "accountId": "45489428-24a5-11e6-8a84-bae500000001",
   "updated": "2017-08-15 09:35:11",
   "name": "Partner 3",
   "code": "partner3",
   "description": "Description",
   "externalCode": "5434665867876",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9bc5de98-79f2-11e8-1a0d-4e0d0000002b",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=9bc5de98-79f2-11e8-1a0d-4e0d0000002b"
     }
   },
   shared: false
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/9504054f-79f2-11e8-1a0d-4e0d00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   }
}
```

### Delete directory entry
Request to delete an element of the user directory.
 
  **Parameters**
 
| Parameter | Description |
| ----- | --------- |
| **id** | `string` (required) *Example: 6343f631-265d-11e6-8a84-bae500000014* id of the user dictionary element. |
| **metadata_id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* user directory id. |

> Delete directory entry

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/customentity/7944ef04-f831-11e5-7a69-971500188b19/6343f631-265d-11e6-8a84-bae500000014"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of the user directory element.

### User directory element

### Get element
 
**Parameters**
 
| Parameter | Description |
| ------- | ---- |
| **id** | `string` (required) *Example: 6343f631-265d-11e6-8a84-bae500000014* id of the user dictionary element. |
| **metadata_id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* user directory id. |

> Request to get a custom dictionary element with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/customentity/7944ef04-f831-11e5-7a69-971500188b19/6343f631-265d-11e6-8a84-bae500000014"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the user directory element with the specified id.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/customentity/7944ef04-f831-11e5-7a69-971500188b19/6343f631-265d-11e6-8a84-bae500000014",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/context/companysettings/metadata/customEntities/7944ef04-f831-11e5-7a69-971500188b19",
     "type": "custom",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#custom_7944ef04-f831-11e5-7a69-971500188b19/edit?id=6343f631-265d-11e6-8a84-bae500000014"
   },
   "id": "6343f631-265d-11e6-8a84-bae500000014",
   "accountId": "45489428-24a5-11e6-8a84-bae500000001",
   "updated": "2017-08-14 10:22:51",
   "name": "Partner 3",
   "code": "partner3",
   "description": "Description",
   "externalCode": "5434665867876",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9bc5de98-79f2-11e8-1a0d-4e0d0000002b",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=9bc5de98-79f2-11e8-1a0d-4e0d0000002b"
     }
   },
   shared: true
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/9504054f-79f2-11e8-1a0d-4e0d00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   }
}
```

### Change element
A request to change an object that is an element of a user directory.

**Parameters**
 
| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 6343f631-265d-11e6-8a84-bae500000014* id of the user dictionary element. |
| **metadata_id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* user directory id. |

> An example of a request to update an element of a user directory.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/customentity/7944ef04-f831-11e5-7a69-971500188b19/6343f631-265d-11e6-8a84-bae500000014"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "Peter Mikhalych from LLC Enterprise",
             "code": "partner mikhalych",
             "description": "Key employee of OOO Enterprise",
             "externalCode": "5434665867876"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated user directory element.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/customentity/7944ef04-f831-11e5-7a69-971500188b19/6343f631-265d-11e6-8a84-bae500000014",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/context/companysettings/metadata/customEntities/7944ef04-f831-11e5-7a69-971500188b19",
     "type": "custom",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#custom_7944ef04-f831-11e5-7a69-971500188b19/edit?id=6343f631-265d-11e6-8a84-bae500000014"
   },
   "id": "6343f631-265d-11e6-8a84-bae500000014",
   "accountId": "45489428-24a5-11e6-8a84-bae500000001",
   "updated": "2017-08-15 09:39:34",
   "name": "Peter Mikhalych from LLC Enterprise",
   "code": "partner mikhalych",
   "description": "Key employee of OOO Enterprise",
   "externalCode": "5434665867876",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9bc5de98-79f2-11e8-1a0d-4e0d0000002b",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=9bc5de98-79f2-11e8-1a0d-4e0d0000002b"
     }
   },
   shared: true
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/9504054f-79f2-11e8-1a0d-4e0d00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   }
}
```