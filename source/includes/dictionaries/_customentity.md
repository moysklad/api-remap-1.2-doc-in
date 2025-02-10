## Custom list

### Custom lists

Using the JSON API, you can create, update, and delete Custom lists. It also allows you to manage elements
within Custom lists and retrieve details about their additional fields.
<br>
To work with Custom lists, you need the identifier for each list.
This identifier is available in the metadata request for the entity, located in the _\<id\>_ field.

#### Custom list attributes

| Title    | Type                                               | Description                                                             |
|----------|:---------------------------------------------------|:------------------------------------------------------------------------|
| **id**   | UUID                                               | Custom list ID<br>`+Required when replying` `+Read Only`                |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Custom list metadata<br>`+Required when replying`                       |
| **name** | String(255)                                        | Custom list name<br>`+Required when replying` `+Required when creating` |

### Get a list of Custom lists

To get all Custom lists, you can send a request for
the [company settings](../dictionaries/#entities-company-settings-get-company-settings-metadata) metadata. In the
resulting entity, the `customEntities` field contains a list of entities for all existing Custom lists. Each entity in
this list includes an `id` field, which specifies the identifier for each list.

### Create Custom list

The only required field for creating a custom list is the **name** field.
This action is available exclusively to users with administrator rights.

| Title    | Description      |
|----------|:-----------------|
| **name** | Custom list name |

> Request to create a new Custom list.

```shell
  curl -X POST
    "https://api.kladana.com/api/remap/1.2/entity/customentity"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "name": "Delivery"
          }'  
```

> Response 200 (application/json)
> Successful request. The result is a JSON representation of the created Custom list.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b",
    "type": "customentity",
    "mediaType": "application/json"
  },
  "id": "3f9a2f30-76af-11e7-6adb-ede50000000b",
  "name": "Delivery"
}
```

### Update Custom list

Request to update a custom list.
This action is available exclusively to users with administrator rights.

**Parameters**

| Parameter       | Description                                                                         |
|:----------------|:------------------------------------------------------------------------------------|
| **metadata_id** | `string` (required) *Example: 3f9a2f30-76af-11e7-6adb-ede50000000b* Custom list ID. |

> Request to update a new Custom list.

```shell
  curl -X PUT
    "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "name": "Delivery zones"
          }'  
```

> Response 200 (application/json)
> Successful request. The result is a JSON representation of the updated Custom list.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b",
    "type": "customentity",
    "mediaType": "application/json"
  },
  "id": "3f9a2f30-76af-11e7-6adb-ede50000000b",
  "name": "Delivery zones"
}
```

### Delete Custom list

Request to delete a custom list.
This action is available exclusively to users with administrator rights.

**Parameters**

| Parameter       | Description                                                                         |
|:----------------|:------------------------------------------------------------------------------------|
| **metadata_id** | `string` (required) *Example: 3f9a2f30-76af-11e7-6adb-ede50000000b* Custom list ID. |

> Request to delete a new Custom list.

```shell
curl -X DELETE
  "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
> Successful request. The result is a JSON representation of the deleted Custom list.

### Custom list metadata

Request to get Custom list metadata. The result is a JSON object including:

| Title            | Type                                               | Description                                                                               |
|------------------|:---------------------------------------------------|:------------------------------------------------------------------------------------------|
| **meta**         | [Meta](../#kladana-json-api-general-info-metadata) | Custom list metadata<br>`+Required when replying`                                         |
| **entityMeta**   | [Meta](../#kladana-json-api-general-info-metadata) | Link to the list of entities of Custom list.<br>`+Required when replying`                 |
| **attributes**   | Array(Object)                                      | Collection of additional fields for a Custom list.<br>`+Required when replying` `+Expand` |
| **id**           | UUID                                               | Custom list ID<br>`+Required when replying` `+Read Only`                                  |
| **name**         | String(255)                                        | Custom list name<br>`+Required when replying`                                             |
| **createShared** | Boolean                                            | Create new elements in the custom list with the label "Shared Access"                     |

The structure of a separate object representing an additional field is described in detail in
the [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

**Parameters**

| Parameter       | Description                                                                         |
|:----------------|:------------------------------------------------------------------------------------|
| **metadata_id** | `string` (required) *Example: 3f9a2f30-76af-11e7-6adb-ede50000000b* Custom list ID. |

> Request to get Custom list metadata.

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/metadata"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
> Successful request. The result is a JSON representation of the Custom list metadata.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/metadata",
    "type": "customentitymetadata",
    "mediaType": "application/json"
  },
  "entityMeta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b",
    "type": "customentity",
    "mediaType": "application/json",
    "uuidHref": "https://app.kladana.com/app/#custom_3f9a2f30-76af-11e7-6adb-ede50000000b"
  },
  "attributes": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/metadata/attributes",
      "type": "attributemetadata",
      "mediaType": "application/json",
      "size": 3,
      "limit": 1000,
      "offset": 0
    }
  },
  "id": "3f9a2f30-76af-11e7-6adb-ede50000000b",
  "name": "Delivery zones",
  "createShared": true
}
```

### Elements of the Custom list

#### Element attributes

| Title            | Type                                               | Filtration                                                                                                                                                                | Description                                                                                        |
|------------------|:---------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------------------|
| **meta**         | [Meta](../#kladana-json-api-general-info-metadata) |                                                                                                                                                                           | Custom list element metadata<br>`+Required when replying`                                          |
| **id**           | UUID                                               | `=` `!=`                                                                                                                                                                  | Element ID of the Custom list<br>`+Required when replying` `+Read Only`                            |
| **accountId**    | UUID                                               | `=` `!=`                                                                                                                                                                  | Account ID<br>`+Required when replying` `+Read Only`                                               |
| **updated**      | DateTime                                           | `=` `!=` `<` `>` `<=` `>=`                                                                                                                                                | The moment of the last update of the Custom list element<br>`+Required when replying` `+Read Only` |
| **name**         | String(255)                                        | `=` `!=` `~` `~=` `=~`                                                                                                                                                    | Name of the Custom list element<br>`+Required when replying` `+Required when creating`             |
| **code**         | String(255)                                        | `=` `!=` `~` `~=` `=~`                                                                                                                                                    | Element Code of the Custom list                                                                    |
| **description**  | String(4096)                                       | `=` `!=` `~` `~=` `=~`                                                                                                                                                    | Description of the element of the Custom list                                                      |
| **externalCode** | String(255)                                        | `=` `!=` `~` `~=` `=~`                                                                                                                                                    | The external code of the Custom list element<br>`+Required when replying`                          |
| **attributes**   | Array(Object)                                      | [Filtering the selection using the filter parameter](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Array of additional fields in the [Metadata](../#kladana-json-api-general-info-metadata) format    |
| **owner**        | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                                                                                                                                                                  | Owner (Employee)<br>`+Expand`                                                                      |
| **shared**       | Boolean                                            | `=` `!=`                                                                                                                                                                  | Shared Access<br>`+Required when replying`                                                         |
| **group**        | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                                                                                                                                                                  | Employee's department<br>`+Required when replying` `+Expand`                                       |

### Get Custom list elements

Request to get all elements in the specified Custom list.
Result: JSON object including fields:

| Title       | Type                                               | Description                                                            |
|-------------|:---------------------------------------------------|:-----------------------------------------------------------------------|
| **meta**    | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata.                                                     |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request.                        |
| **rows**    | Array(Object)                                      | An array of JSON objects representing the elements of the Custom list. |

**Parameters**

| Parameter       | Description                                                                         |
|:----------------|:------------------------------------------------------------------------------------|
| **metadata_id** | `string` (required) *Example: 3f9a2f30-76af-11e7-6adb-ede50000000b* Custom list ID. |

> Request to get all elements of the Custom list.

```shell
 curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b"
   -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
> Successful request. The result is a JSON representation of a list of Custom list elements.

```json
{
  "context": {
    "employee": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/context/employee",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json"
      }
    }
  },
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customentity/metadata",
    "type": "customentity",
    "mediaType": "application/json",
    "uuidHref": "https://app.kladana.com/app/#custom_3f9a2f30-76af-11e7-6adb-ede50000000b",
    "size": 3,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/01b29035-2656-11e6-8a84-bae500000048",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/metadata",
        "type": "customentity",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#custom_3f9a2f30-76af-11e7-6adb-ede50000000b/edit?id=01b29035-2656-11e6-8a84-bae500000048"
      },
      "id": "01b29035-2656-11e6-8a84-bae500000048",
      "accountId": "45489428-24a5-11e6-8a84-bae500000001",
      "updated": "2017-08-13 17:55:08",
      "name": "City center",
      "code": "center",
      "externalCode": "5434665867876",
      "attributes": [
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/metadata/attributes/54b79da2-9124-11ef-ac12-000e00000008",
            "type": "attributemetadata",
            "mediaType": "application/json"
          },
          "id": "54b79da2-9124-11ef-ac12-000e00000008",
          "name": "Last request date",
          "type": "time",
          "value": "2024-10-24 19:42:00.000"
        }
      ],
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/9bc5de98-79f2-11e8-1a0d-4e0d0000002b",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=9bc5de98-79f2-11e8-1a0d-4e0d0000002b"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/9504054f-79f2-11e8-1a0d-4e0d00000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      }
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/3fbe37f2-2659-11e6-8a84-bae500000013",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/metadata",
        "type": "customentity",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#custom_3f9a2f30-76af-11e7-6adb-ede50000000b/edit?id=3fbe37f2-2659-11e6-8a84-bae500000013"
      },
      "id": "3fbe37f2-2659-11e6-8a84-bae500000013",
      "accountId": "45489428-24a5-11e6-8a84-bae500000001",
      "updated": "2017-08-13 11:06:23",
      "name": "Airport",
      "externalCode": "5434665867877",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/9bc5de98-79f2-11e8-1a0d-4e0d0000002b",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=9bc5de98-79f2-11e8-1a0d-4e0d0000002b"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/9504054f-79f2-11e8-1a0d-4e0d00000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      }
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/6343f631-265d-11e6-8a84-bae500000014",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/metadata",
        "type": "customentity",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#custom_3f9a2f30-76af-11e7-6adb-ede50000000b/edit?id=6343f631-265d-11e6-8a84-bae500000014"
      },
      "id": "6343f631-265d-11e6-8a84-bae500000014",
      "accountId": "45489428-24a5-11e6-8a84-bae500000001",
      "updated": "2017-08-14 10:22:51",
      "name": "Station",
      "code": "station",
      "description": "Need more time for delivery",
      "externalCode": "5434665867878",
      "attributes": [
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/metadata/attributes/54b79da2-9124-11ef-ac12-000e00000008",
            "type": "attributemetadata",
            "mediaType": "application/json"
          },
          "id": "54b79da2-9124-11ef-ac12-000e00000008",
          "name": "Last request date",
          "type": "time",
          "value": "2024-07-20 12:43:00.000"
        }
      ],
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/9bc5de98-79f2-11e8-1a0d-4e0d0000002b",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=9bc5de98-79f2-11e8-1a0d-4e0d0000002b"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/9504054f-79f2-11e8-1a0d-4e0d00000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      }
    }
  ]
} 
```

### Get Custom list element

**Parameters**

| Parameter       | Description                                                                                        |
|:----------------|:---------------------------------------------------------------------------------------------------|
| **metadata_id** | `string` (required) *Example: 3f9a2f30-76af-11e7-6adb-ede50000000b* Custom list ID.                |
| **id**          | `string` (required) *Example: 6343f631-265d-11e6-8a84-bae500000014* Element ID of the Custom list. |

> Request to get a Custom list element with the specified ID.

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/6343f631-265d-11e6-8a84-bae500000014"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
> Successful request. The result is a JSON representation of a Custom list element with the specified ID.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/6343f631-265d-11e6-8a84-bae500000014",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/metadata",
    "type": "customentity",
    "mediaType": "application/json",
    "uuidHref": "https://app.kladana.com/app/#custom_3f9a2f30-76af-11e7-6adb-ede50000000b/edit?id=6343f631-265d-11e6-8a84-bae500000014"
  },
  "id": "6343f631-265d-11e6-8a84-bae500000014",
  "accountId": "45489428-24a5-11e6-8a84-bae500000001",
  "updated": "2017-08-14 10:22:51",
  "name": "Station",
  "code": "station",
  "description": "Need more time for delivery",
  "externalCode": "5434665867878",
  "attributes": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/metadata/attributes/54b79da2-9124-11ef-ac12-000e00000008",
        "type": "attributemetadata",
        "mediaType": "application/json"
      },
      "id": "54b79da2-9124-11ef-ac12-000e00000008",
      "name": "Last request date",
      "type": "time",
      "value": "2024-07-20 12:43:00.000"
    }
  ],
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/9bc5de98-79f2-11e8-1a0d-4e0d0000002b",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=9bc5de98-79f2-11e8-1a0d-4e0d0000002b"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/9504054f-79f2-11e8-1a0d-4e0d00000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  }
}
```

### Create an element of Custom list

The only required field to create a custom list element is the **name** field.

**Parameters**

| Parameter       | Description                                                                         |
|:----------------|:------------------------------------------------------------------------------------|
| **metadata_id** | `string` (required) *Example: 3f9a2f30-76af-11e7-6adb-ede50000000b* Custom list ID. |

> Request to create a Custom list element.

```shell
  curl -X POST
    "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "name": "Lake",
            "code": "lake",
            "description": "Orders rarely come from here. It is very far from the office.",
            "externalCode": "5434665867876",
            "shared": false
          }'  
```

> Response 200 (application/json)
> Successful request. The result is a JSON representation of a new Custom list element.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/6343f631-265d-11e6-8a84-bae500000014",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/metadata",
    "type": "customentity",
    "mediaType": "application/json",
    "uuidHref": "https://app.kladana.com/app/#custom_3f9a2f30-76af-11e7-6adb-ede50000000b/edit?id=6343f631-265d-11e6-8a84-bae500000014"
  },
  "id": "6343f631-265d-11e6-8a84-bae500000014",
  "accountId": "45489428-24a5-11e6-8a84-bae500000001",
  "updated": "2017-08-15 09:35:11",
  "name": "Lake",
  "code": "lake",
  "description": "Orders rarely come from here. It is very far from the office.",
  "externalCode": "5434665867876",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/9bc5de98-79f2-11e8-1a0d-4e0d0000002b",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=9bc5de98-79f2-11e8-1a0d-4e0d0000002b"
    }
  },
  "shared": false,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/9504054f-79f2-11e8-1a0d-4e0d00000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  }
}
```

### Update Custom list element

A request to update an element of the Custom list.

**Parameters**

| Parameter       | Description                                                                                        |
|:----------------|:---------------------------------------------------------------------------------------------------|
| **metadata_id** | `string` (required) *Example: 3f9a2f30-76af-11e7-6adb-ede50000000b* Custom list ID.                |
| **id**          | `string` (required) *Example: 6343f631-265d-11e6-8a84-bae500000014* Element ID of the Custom list. |

> Request to update a Custom list element

```shell
  curl -X PUT
    "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/6343f631-265d-11e6-8a84-bae500000014"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "name": "Railway Station",
            "code": "railway station",
            "description": "Huge area. Need more time for delivery",
            "externalCode": "5434665867876",
            "attributes": [
              {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/metadata/attributes/54b79da2-9124-11ef-ac12-000e00000008",
                  "type": "attributemetadata",
                  "mediaType": "application/json"
                },
                "value": "2024-07-20 12:43:00.000"
              }
            ]
          }'  
```

> Response 200 (application/json)
> Successful request. The result is a JSON representation of the updated Custom list element.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/6343f631-265d-11e6-8a84-bae500000014",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/metadata",
    "type": "customentity",
    "mediaType": "application/json",
    "uuidHref": "https://app.kladana.com/app/#custom_3f9a2f30-76af-11e7-6adb-ede50000000b/edit?id=6343f631-265d-11e6-8a84-bae500000014"
  },
  "id": "6343f631-265d-11e6-8a84-bae500000014",
  "accountId": "45489428-24a5-11e6-8a84-bae500000001",
  "updated": "2017-08-15 09:39:34",
  "name": "Railway Station",
  "code": "railway station",
  "description": "Huge area. Need more time for delivery",
  "externalCode": "5434665867876",
  "attributes": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/metadata/attributes/54b79da2-9124-11ef-ac12-000e00000008",
        "type": "attributemetadata",
        "mediaType": "application/json"
      },
      "id": "54b79da2-9124-11ef-ac12-000e00000008",
      "name": "Last request date",
      "type": "time",
      "value": "2024-07-20 12:43:00.000"
    }
  ],
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/9bc5de98-79f2-11e8-1a0d-4e0d0000002b",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=9bc5de98-79f2-11e8-1a0d-4e0d0000002b"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/9504054f-79f2-11e8-1a0d-4e0d00000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  }
}
```

### Delete Custom list element

Request to delete an element of the Custom list.

**Parameters**

| Parameter       | Description                                                                                        |
|:----------------|:---------------------------------------------------------------------------------------------------|
| **metadata_id** | `string` (required) *Example: 3f9a2f30-76af-11e7-6adb-ede50000000b* Custom list ID.                |
| **id**          | `string` (required) *Example: 6343f631-265d-11e6-8a84-bae500000014* Element ID of the Custom list. |

> Request to delete a Custom list element.

```shell
curl -X DELETE
  "https://api.kladana.com/api/remap/1.2/entity/customentity/3f9a2f30-76af-11e7-6adb-ede50000000b/6343f631-265d-11e6-8a84-bae500000014"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
> Successful request. The result is a JSON representation of the deleted Custom list element.
