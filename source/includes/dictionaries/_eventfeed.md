## Event Feed

### Working with the Event Feed in transactions 

Using the JSON API, you can create, update, and delete events, query lists of events, and query details of individual events for the transactions of the following type: [Sales Order](documents/#transactions-sales-order).

#### Working with mentions in the Event Feed

Events in the Feed can contain mentions of other entities directly in the text of the Event itself.

Mention format: `{{type;uuid}}`. For example, when mentioning an employee, the Event text may look like this:
`Hello, {{employee;861d34a9-f1b3-11ee-ac12-00110000004e}}! How are you doing?`, the display format for an active/archived/deleted entity is the same.

**Attention!** If an entity with such UUID was not found, the text will be displayed in the web interface without any processing.

Supported entity types in mentions:

+ [Employee](dictionaries/#entities-employee)

#### Events limit

No more than 5000 Events can be created for each transaction.

#### Access rights

| Operation | Access |
| --------- | ------- |
| **View events** | User with administrator rights or with the right to view the transactions. |
| **Event Creation** | Requires the CRM tariff option. User must have administrator rights or transaction viewing rights. | 
| **Event Editing** | Requires the CRM tariff option. User must have administrator rights or be the event author with transaction viewing rights. | 
| **Event Deletion** | Requires the CRM tariff option. User must have administrator rights or be the event author with transaction viewing rights. |

#### Entity attributes

| Name | Type | Description |
| ----- | ----- | -------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Event Metadata<br>`+Required when responding` |
| **id** | UUID | Event ID<br>`+Required when responding` `+Read-only` |
| **accountId** | UUID | Account ID<br>`+Required when responding` `+Read-only` |
| **created** | DateTime | Event creation time<br>`+Required when responding` `+Read-only` |
| **description** | String(4096) | Event Text<br>`+Required when responding` `+Required when creating` |
| **author** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Employee - the creator of the Event (account administrator, if the author is an application)<br>`+Required when responding` `+Read-only` `+Expand` |
| **authorApplication** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Application - the creator of the event<br>`+Read-only` `+Expand` |

### Get a list of Transaction Events

Request to get all transaction events for the account.

Result: JSON object, including the fields:

| Name | Type | Description |
| ---- | ---- | ----------  |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issue Metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata on the employee who performed the request. |
| **rows** | Array(Object) | Array of JSON objects representing [Events](../dictionaries/#suschnosti-lenta-sobytij). |

**Parameters**

| Parameter | Description |
|---------- | ------------ |
| **document_type** | `string` (required) *Example: customerorder* transaction type for which Events are requested. |
| **document_id** | `string` (required) *Example: e4609c69-00bc-11ef-ac12-00120000001a* transaction ID with Events. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to retrieve.`Valid values ​​are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indentation in the returned list of entities. |

> Get Events list for Sales Order

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. Result is JSON representation of Events list.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes",
    "type": "eventnote",
    "mediaType": "application/json",
    "size": 2,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes/844a0ef9-19ac-11ef-ac12-000b00000000",
        "type": "eventnote",
        "mediaType": "application/json"
      },
      "id": "844a0ef9-19ac-11ef-ac12-000b00000000",
      "accountId": "85284e22-f1b3-11ee-ac12-000f00000001",
      "created": "2024-05-24 12:03:40.849",
      "description": "{{employee;861d34a9-f1b3-11ee-ac12-00110000004e}}, hello",
      "author": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/861d34a9-f1b3-11ee-ac12-00110000004e",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://api.kladana.com/app/#employee/edit?id=861d34a9-f1b3-11ee-ac12-00110000004e"
        }
      }
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes/844a0ef9-19ac-11ef-ac12-000b00000000",
        "type": "eventnote",
        "mediaType": "application/json"
      },
      "id": "844a0ef9-19ac-11ef-ac12-000b00000000",
      "accountId": "85284e22-f1b3-11ee-ac12-000f00000001",
      "created": "2024-05-24 12:03:40.849",
      "description": "{{employee;861d34a9-f1b3-11ee-ac12-00110000004e}}, hello",
      "author": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/861d34a9-f1b3-11ee-ac12-00110000004e",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://api.kladana.com/app/#employee/edit?id=861d34a9-f1b3-11ee-ac12-00110000004e"
        }
      }
    }
  ]
}
```
### Add Event

Request to add one  transaction Event for the account.

**Parameters**

| Parameter | Description |
| --------- | ----------- |
| **document_type** | `string` (required) *Example: customerorder* transaction type for which the Event is created. |
| **document_id** | `string` (required) *Example: e4609c69-00bc-11ef-ac12-00120000001a* transaction ID for which the Event is created. |

> Request to add a new event for a Sales Order.

```shell
curl -X POST
  "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
  -H "Content-Type: application/json"
    -d '{
          "description": "Hello, {{employee;730c1b3d-00ba-11ef-ac12-00120000000d}}! How are you?"
        }'  
```

> Response 201 (application/json). Successful request. Result - JSON representation of the added Event.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes/844a0ef9-19ac-11ef-ac12-000b00000000",
      "type": "eventnote",
      "mediaType": "application/json"
    },
    "id": "844a0ef9-19ac-11ef-ac12-000b00000000",
    "accountId": "85284e22-f1b3-11ee-ac12-000f00000001",
    "created": "2024-05-24 12:03:40.849",
    "description": "Hello, {{employee;730c1b3d-00ba-11ef-ac12-00120000000d}}! How are you?",
    "author": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/861d34a9-f1b3-11ee-ac12-00110000004e",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#employee/edit?id=861d34a9-f1b3-11ee-ac12-00110000004e"
      }
    }
  }
]
```


### Get Event

Request to get one transaction Event for this account.

**Parameters**

| Parameter | Description |
|---------- | ----------- |
| **document_type** | `string` (required) *Example: customerorderr* transaction type for which the Event is requested. |
| **document_id** | `string` (required) *Example: e4609c69-00bc-11ef-ac12-00120000001a* transaction ID with Events. |
| **id** | `string` (required) *Example: 844a0ef9-19ac-11ef-ac12-000b00000000* Event ID. |

> Get Sales Order Event

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/customerorder/ e4609c69-00bc-11ef-ac12-00120000001a/notes/844a0ef9-19ac-11ef-ac12-000b00000000"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. Result is JSON representation of the Event.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes/844a0ef9-19ac-11ef-ac12-000b00000000",
    "type": "eventnote",
    "mediaType": "application/json"
  },
  "id": "844a0ef9-19ac-11ef-ac12-000b00000000",
  "accountId": "85284e22-f1b3-11ee-ac12-000f00000001",
  "created": "2024-05-24 12:03:40.849",
  "description": "{{employee;861d34a9-f1b3-11ee-ac12-00110000004e}}, hello",
  "author": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/861d34a9-f1b3-11ee-ac12-00110000004e",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://api.kladana.com/app/#employee/edit?id=861d34a9-f1b3-11ee-ac12-00110000004e"
    }
  }
}
```

### Update Event

Request to update a single Event for the account.

**Parameters**

| Parameter | Description |
|---------- | ----------- |
| **document_type** | `string` (required) *Example: customerorder* transaction type for which the Event is updated. |
| **document_id** | `string` (required) *Example: e4609c69-00bc-11ef-ac12-00120000001a* Id of the transaction with Events. |
| **id** | `string` (required) *Example: 844a0ef9-19ac-11ef-ac12-000b00000000* Event ID. |

> Update Sales Order Event

```shell
curl -X PUT
  "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes/844a0ef9-19ac-11ef-ac12-000b00000000"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
  -H "Content-Type: application/json"
    -d '{
          "description": "Hello, {{employee;730c1b3d-00ba-11ef-ac12-00120000000d}}! How are you?"
        }'  
```

> Response 200 (application/json)
> Successful request. Result is a JSON representation of the Event.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes/844a0ef9-19ac-11ef-ac12-000b00000000",
    "type": "eventnote",
    "mediaType": "application/json"
  },
  "id": "844a0ef9-19ac-11ef-ac12-000b00000000",
  "accountId": "85284e22-f1b3-11ee-ac12-000f00000001",
  "created": "2024-05-24 12:03:40.849",
  "description": "Hello, {{employee;730c1b3d-00ba-11ef-ac12-00120000000d}}! How are you?",
  "author": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/861d34a9-f1b3-11ee-ac12-00110000004e",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://api.kladana.com/app/#employee/edit?id=861d34a9-f1b3-11ee-ac12-00110000004e"
    }
  }
}
```

### Delete Event

Request to delete one document Event for the account.

**Parameters**

| Parameter | Description |
| -------------- | ------------- |
| **document_type** | `string` (required) *Example: customerorder* transaction type for which the Event is deleted. |
| **document_id** | `string` (required) *Example: e4609c69-00bc-11ef-ac12-00120000001a* ID of the transaction with Events. |
| **id** | `string` (required) *Example: 844a0ef9-19ac-11ef-ac12-000b00000000* Event ID. |

> Delete Event of Sales Order

```shell
curl -X DELETE
  "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes/844a0ef9-19ac-11ef-ac12-000b00000000"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 204 (application/json)
> Successfully deleted Event.