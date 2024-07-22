## Serial number
### Serial numbers
Using the JSON API, you can request lists of Serial numbers and information on individual Serial numbers. The entity code for Serial number in the JSON API is the **thing** keyword.

#### Entity attributes
| Title           | Type                                               | Filtration             | Description                                                               |
|-----------------|----------------------------------------------------|------------------------|---------------------------------------------------------------------------|
| **accountId**   | UUID                                               | `=` `!=`               | Account ID<br>`+Read Only`                                                |
| **description** | String(4096)                                       | `=` `!=` `~` `~=` `=~` | Description Serial numbers                                                |
| **id**          | UUID                                               | `=` `!=`               | Serial number ID<br>`+Required when replying` `+Read Only`                |
| **meta**        | [Meta](../#kladana-json-api-general-info-metadata) |                        | Serial number Metadata<br>`+Required when answering`                      |
| **name**        | String(255)                                        | `=` `!=` `~` `~=` `=~` | Serial number Name<br>`+Required when replying` `+Required when creating` |

### Get Serial numbers
Request to get a list of all Serial numbers for this account.
Result: JSON object including fields:

| Title       | Type                                                 | Description                                                                             |
|-------------|------------------------------------------------------|-----------------------------------------------------------------------------------------|
| **meta**    | [Meta](../#kladana-json-api-general-info-metadata)   | Issuance metadata.                                                                      |
| **context** | [Meta](../#kladana-json-api-general-info-metadata)   | Metadata about the person who made the request.                                         |
| **rows**    | Array(Object)                                        | An array of JSON objects representing [Serial numbers](../dictionaries/#entities-serial-number). |

**Parameters**

| Parameter  | Description                                                                                                                      |
|------------|----------------------------------------------------------------------------------------------------------------------------------|
| **limit**  | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities.                                          |

> Get Serial numbers

```shell
curl -X GET
   "https://app.kladana.com/api/remap/1.2/entity/thing"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Serial numbers.

```json
{
  "context":{
    "employee":{
      "meta":{
        "href":"https://app.kladana.com/api/remap/1.2/context/employee",
        "metadataHref":"https://app.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type":"employee",
        "mediaType":"application/json"
      }
    }
  },
  "meta":{
    "href":"https://app.kladana.com/api/remap/1.2/entity/thing",
    "metadataHref":"https://app.kladana.com/api/remap/1.2/entity/thing/metadata",
    "type":"thing",
    "mediaType":"application/json",
    "size":2,
    "limit":1000,
    "offset":0
  },
  "rows":[
    {
      "meta": {
        "href": "https://app.kladana.com/api/remap/1.2/entity/thing/3840d8d8-9f2d-11ee-8c90-0242ac120002",
        "metadataHref": "https://app.kladana.com/api/remap/1.2/entity/thing/metadata",
        "type": "thing",
        "mediaType": "application/json"
      },
      "id": "3840d8d8-9f2d-11ee-8c90-0242ac120002",
      "accountId": "45308174-9f2d-11ee-8c90-0242ac120002",
      "name": "1-100",
      "description": "Chairs"
    },
    {
      "meta": {
        "href": "https://app.kladana.com/api/remap/1.2/entity/thing/55609d5e-9f2d-11ee-8c90-0242ac120002",
        "metadataHref": "https://app.kladana.com/api/remap/1.2/entity/thing/metadata",
        "type": "thing",
        "mediaType": "application/json"
      },
      "id": "55609d5e-9f2d-11ee-8c90-0242ac120002",
      "accountId": "45308174-9f2d-11ee-8c90-0242ac120002",
      "name": "1-200",
      "description": "Chairs"
    }
  ]
}
```

### Serial number
### Get Serial number

**Parameters**

| Parameter | Description                                                                                                                  |
|-----------|------------------------------------------------------------------------------------------------------------------------------|
| **id**    | `7944ef04-f831-11e5-7a69-971500188b19` (required, string) - *Example: 3840d8d8-9f2d-11ee-8c90-0242ac120002* Serial number id |

> Request to get the Serial number with the specified id.

```shell
curl -X GET
   "https://app.kladana.com/api/remap/1.2/entity/thing/3840d8d8-9f2d-11ee-8c90-0242ac120002"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Serial number with the specified id.

```json
{
  "meta": {
    "href": "https://app.kladana.com/api/remap/1.2/entity/thing/3840d8d8-9f2d-11ee-8c90-0242ac120002",
    "metadataHref": "https://app.kladana.com/api/remap/1.2/entity/thing/metadata",
    "type": "thing",
    "mediaType": "application/json"
  },
  "id": "3840d8d8-9f2d-11ee-8c90-0242ac120002",
  "accountId": "45308174-9f2d-11ee-8c90-0242ac120002",
  "name": "1-100",
  "description": "Chairs"
}
```
