## Event Feed

### Working with the Event Feed in a transactions using special resources

The entity code for the Event Feed in the JSON API is the **notes** keyword.

Using the JSON API, you can create, update, and delete events, request lists of events, as well as information on
individual events for transactions of the following types:

+ [Purchase Order](../documents/#transactions-purchase-order)
+ [Purchase Return](../documents/#transactions-purchase-returns)
+ [Receiving](../documents/#transactions-receiving)
+ [Sales Invoice](../documents/#transactions-sales-invoice)
+ [Sales Order](../documents/#transactions-sales-order)
+ [Supplier Invoice](../documents/#transactions-supplier-invoice)

#### Working with mentions in the Event Feed

Events in the Feed can contain mentions of other entities directly in the text of the Event itself.

Mention format: `{{type;uuid}}`. For example, when mentioning an employee, the Event text may look like this:
`Hello, {{employee;861d34a9-f1b3-11ee-ac12-00110000004e}}! How are you doing?`. The display format for an
active/archived/deleted entity is the same.

**Attention!** If an entity with such UUID was not found, the text will be displayed in the web interface without any processing.

Supported entity types in mentions:

+ [Employee](../dictionaries/#entities-employee)

#### Events limit

No more than 5000 Events can be created for each transaction.

#### Access rights

| Operation         | Access                                                                                     |
|-------------------|--------------------------------------------------------------------------------------------|
| **View events**   | User with administrator rights or with permission to view the transaction                  |
| **Create events** | User with administrator rights or with permission to view the transaction                  |
| **Edit events**   | User with administrator rights or the event author with permission to view the transaction |
| **Delete events** | User with administrator rights or the event author with permission to view the transaction |


#### Entity attributes

| Name                  | Type                                               | Description                                                                                                                                                      |
|-----------------------|----------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **meta**              | [Meta](../#kladana-json-api-general-info-metadata) | Event Metadata<br>`+Required when replying`                                                                                                                      |
| **id**                | UUID                                               | Event ID<br>`+Required when replying` `+Read-only`                                                                                                               |
| **accountId**         | UUID                                               | Account ID<br>`+Required when replying` `+Read-only`                                                                                                             |
| **created**           | DateTime                                           | Event creation time<br>`+Required when replying` `+Read-only`                                                                                                    |
| **description**       | String(4096)                                       | Event Text<br>`+Required when replying` `+Required when creating`                                                                                                |
| **author**            | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Employee - the creator of the Event (account administrator, if the author is an application)<br>`+Required when replying` `+Read-only` `+Expand` |
| **authorApplication** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Application - the creator of the event<br>`+Read-only` `+Expand`                                                                                 |

### Get a list of Transaction Events

Request to get all transaction Events for the account.

Result: JSON object, including the fields:

| Name        | Type                                               | Description                                                                        |
|-------------|----------------------------------------------------|------------------------------------------------------------------------------------|
| **meta**    | [Meta](../#kladana-json-api-general-info-metadata) | Response metadata.                                                                 |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata on the employee who performed the request.                                |
| **rows**    | Array(Object)                                      | Array of JSON objects representing [Events](../dictionaries/#entities-event-feed). |

**Parameters**

| Parameter         | Description                                                                                                                |
|-------------------|----------------------------------------------------------------------------------------------------------------------------|
| **document_type** | `string` (required) *Example: customerorder* transaction type for which Events are requested.                              |
| **document_id**   | `string` (required) *Example: e4609c69-00bc-11ef-ac12-00120000001a* transaction ID with Events.                            |
| **limit**         | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to retrieve. `Valid values are 1 - 1000`. |
| **offset**        | `number` (optional) **Default: 0** *Example: 40* Offset in the returned list of entities.                                  |

> Get a list of Events for Sales Order

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
> Successful request. The result is the JSON representation of the Events list.

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
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=861d34a9-f1b3-11ee-ac12-00110000004e"
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
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=861d34a9-f1b3-11ee-ac12-00110000004e"
        }
      }
    }
  ]
}
```

### Get Event

Request to get one transaction Event for the account.

**Parameters**

| Parameter         | Description                                                                                     |
|-------------------|-------------------------------------------------------------------------------------------------|
| **document_type** | `string` (required) *Example: customerorder* transaction type for which the Event is requested. |
| **document_id**   | `string` (required) *Example: e4609c69-00bc-11ef-ac12-00120000001a* transaction ID with Events. |
| **id**            | `string` (required) *Example: 844a0ef9-19ac-11ef-ac12-000b00000000* Event ID.                   |

> Get Sales Order Event

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes/844a0ef9-19ac-11ef-ac12-000b00000000" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
> Successful request. The result is the JSON representation of the Event.

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
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=861d34a9-f1b3-11ee-ac12-00110000004e"
    }
  }
}
```

### Add Event

Request to add a transaction Event for the account.

**Parameters**

| Parameter         | Description                                                                                                        |
|-------------------|--------------------------------------------------------------------------------------------------------------------|
| **document_type** | `string` (required) *Example: customerorder* transaction type for which the Event is created.                      |
| **document_id**   | `string` (required) *Example: e4609c69-00bc-11ef-ac12-00120000001a* transaction ID for which the Event is created. |

> Request to add a new event for a Sales Order.

```shell
curl --compressed -X POST \
  "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip" \
  -H "Content-Type: application/json" \
    -d '{
          "description": "Hello, {{employee;730c1b3d-00ba-11ef-ac12-00120000000d}}! How are you?"
        }'  
```

> Response 201 (application/json). Successful request. The result is the JSON representation of the added Event.

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
        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=861d34a9-f1b3-11ee-ac12-00110000004e"
      }
    }
  }
]
```

### Update Event

Request to update a single transaction Event for the account.

**Parameters**

| Parameter         | Description                                                                                     |
|-------------------|-------------------------------------------------------------------------------------------------|
| **document_type** | `string` (required) *Example: customerorder* transaction type for which the Event is updated.   |
| **document_id**   | `string` (required) *Example: e4609c69-00bc-11ef-ac12-00120000001a* transaction ID with Events. |
| **id**            | `string` (required) *Example: 844a0ef9-19ac-11ef-ac12-000b00000000* Event ID.                   |

> Update Sales Order Event

```shell
curl --compressed -X PUT \
  "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes/844a0ef9-19ac-11ef-ac12-000b00000000" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip" \
  -H "Content-Type: application/json" \
    -d '{
          "description": "Hello, {{employee;730c1b3d-00ba-11ef-ac12-00120000000d}}! How are you?"
        }'  
```

> Response 200 (application/json)
> Successful request. The result is the JSON representation of the Event.

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
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=861d34a9-f1b3-11ee-ac12-00110000004e"
    }
  }
}
```

### Bulk creation and update of Events

[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Events.
The request body must contain an array with JSON representations of the Events that you want to create or update.
Events to be updated must contain an identifier in the form of metadata.

> Create and update multiple Sales Order Events

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '[
            {
              "description": "Hello, {{employee;730c1b3d-00ba-11ef-ac12-00120000000d}}! This is a new Event"
            },
            {
              "description": "Hello, {{employee;730c1b3d-00ba-11ef-ac12-00120000000d}}! This is an updated Event",
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes/844a0ef9-19ac-11ef-ac12-000b00000000",
                "type": "eventnote",
                "mediaType": "application/json"
              }
            }
          ]'  
```

> Response 201 (application/json)
> Successful request. The result is JSON representations of the created and updated Events in an array.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes/c49d7517-5b69-40dc-9254-6721f72a860a",
      "type": "eventnote",
      "mediaType": "application/json"
    },
    "id": "c49d7517-5b69-40dc-9254-6721f72a860a",
    "accountId": "85284e22-f1b3-11ee-ac12-000f00000001",
    "created": "2026-05-07 12:03:40.849",
    "description": "Hello, {{employee;730c1b3d-00ba-11ef-ac12-00120000000d}}! This is a new Event",
    "author": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/861d34a9-f1b3-11ee-ac12-00110000004e",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=861d34a9-f1b3-11ee-ac12-00110000004e"
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
    "description": "Hello, {{employee;730c1b3d-00ba-11ef-ac12-00120000000d}}! This is an updated Event",
    "author": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/861d34a9-f1b3-11ee-ac12-00110000004e",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=861d34a9-f1b3-11ee-ac12-00110000004e"
      }
    }
  }
]
```

### Delete Event

Request to delete one transaction Event for the account.

**Parameters**

| Parameter         | Description                                                                                     |
|-------------------|-------------------------------------------------------------------------------------------------|
| **document_type** | `string` (required) *Example: customerorder* transaction type for which the Event is deleted.   |
| **document_id**   | `string` (required) *Example: e4609c69-00bc-11ef-ac12-00120000001a* transaction ID with Events. |
| **id**            | `string` (required) *Example: 844a0ef9-19ac-11ef-ac12-000b00000000* Event ID.                   |

> Delete Event of Sales Order

```shell
curl --compressed -X DELETE \
  "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes/844a0ef9-19ac-11ef-ac12-000b00000000" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 204 (application/json)
> Successfully deleted Event.

### Bulk removal of Events

To delete several Events at once, you need to execute the following POST request, specifying the metadata of the Event
to be deleted in the body:

> Delete multiple Sales Order Events

```shell
curl --compressed -X POST \
  "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes/delete" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip" \
  -H "Content-Type: application/json" \
    -d '[
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes/acd884ce-b44f-11e9-7ae5-884b00009002",
            "type": "eventnote",
            "mediaType": "application/json"
          }
        },
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/e4609c69-00bc-11ef-ac12-00120000001a/notes/33b30b2e-b465-11e9-7ae5-884b00015630",
            "type": "eventnote",
            "mediaType": "application/json"
          }
        }
      ]'
```

If the specified objects are deleted successfully, the server returns an empty response body with status 200.
If an error occurs, the response body contains the error description.
