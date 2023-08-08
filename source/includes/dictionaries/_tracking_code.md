## Marking codes
### Marking code

Using the JSON API, you can get, create, edit, and delete Marking Codes.
An entity is represented as an identifier, a text code, a code type, and an array of nested Marking Codes.
Marking codes refer to a single item of a specific document. The output order of the first level Marking Code is fixed - nested Marking Codes can be output in random order.

#### Entity attributes

| Title | Type | Description | Field property in the request| Required when replying|Expand|
| --------- |----|--------|--------|------|----|
|**id** |UUID|ID of marking code|Read-only|yes|no
|**cis** |String|Marking code in standard format|Required when creating|none|none
|**cis_1162** |String|Marking code in tag format 1162|Read-only|none|none
|**type** |String|Marking code type|Required when creating|yes|no
|**trackingCodes** |Array(Object)|Array of nested tracking codes|-|none|none

Request example:
Entities and documents - ```/entity/[entityType]/[entityId]/positions/[positionId]/trackingCodes```

### Get document item marking codes

**Parameters**

| Parameter | Description |
| ---------|-----------|
|**limit** | `number` (optional) **Default: 100** *Example: 50* Maximum number of entities to retrieve.`Allowed values are 1 - 100`.|
|**offset** | `number` (optional) **Default: 0** *Example: 50* Indent in the output list of entities.|
|**codetype** | `number` (optional) **Default: gs1** Format of received marking codes. |


***Possible codetype values***

- gs1 - standard format
- tag_1162 - in tag 1162 format
- all - all available formats


The result of a successful request is a JSON representation of a list of Marking Codes with the listed fields:


| Title | Type | Description |
| --------- |----|------------|
**meta** |[Meta](../#kladana-json-api-general-info-metadata)|Issuance metadata,
**context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request.
**rows** |Array(Object)| An array of JSON objects representing marking codes.

> Sample Request for Marking Codes

```shell
   curl -X GET
     "https://app.kladana.in/api/remap/1.2/entity/supply/161d0246-1477-11ec-ac18-000b00000001/positions/161d25a8-1477-11ec-ac18-000b00000002/trackingCodes"
     -H "Authorization: Basic <Credentials>"
```

> Response200

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
      "href": "https://app.kladana.in/api/remap/1.2/entity/supply/161d0246-1477-11ec-ac18-000b00000001/positions/161d25a8-1477-11ec-ac18-000b00000002/trackingCodes",
      "type": "tracking code",
      "mediaType": "application/json",
      size: 23
      limit: 100
      offset: 0
    },
    rows: [
      {
        "id": "c7ea6665-1bb9-11ec-ac18-000c00000000",
        "cis": "012345678912345679",
        "type": "transportpack"
      },
      {
        "id": "6e29f82e-1bc0-11ec-ac18-000c00000002",
        "cis": "012345678912345543",
        "type": "transportpack",
        trackingCodes: [
          {
            "id": "6e2a0192-1bc0-11ec-ac18-000c00000003",
            "cis": "010463003759026521LjJfNII5aXL-B",
            "type": "consumer pack"
          }
        ]
      }
    ]
  }
```

### Marking Codes bulk creation and update

Bulk creation and updating of the specified position Marking Codes. In the body of the request, you must pass an array containing the JSON representation of the Marking Codes that you want to create or update. Upgradable Marking Codes must contain an identifier.

The result of a successful request is a JSON array of representations of the generated and updated Receivings.

Nested Marking Codes are replaced by those specified in the request.

> Example of creating and updating multiple marking codes

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/supply/161d0246-1477-11ec-ac18-000b00000001/positions/161d25a8-1477-11ec-ac18-000b00000002/trackingCodes"
     -H "Authorization: Basic <Credentials>
     -H "Content-Type: application/json"
       -d'[
             {
               "id": "f591e101-1bc0-11ec-ac18-000c00000004",
               "cis": "012345678912345576",
               "type": "transportpack"
             },
             {
               "cis": "010463003759026521LjJfNII5aXL-B",
               "type": "tracking code"
             }
           ]'
```

> Response 200 (application/json) Successful request. The result is a JSON array of representations of the created and updated Marking Codes.

```json
[
   {
     "id": "f591e101-1bc0-11ec-ac18-000c00000004",
     "cis": "012345678912345576",
"type": "transportpack"
   },
   {
     "id": "f591f05d-1bc0-11ec-ac18-000c00000005",
"cis": "010463003759026521LjJfNII5aXL-B",
"type": "tracking code"
   }
]
```

### Bulk deletion of Marking Codes

In the body of the request, you need to pass an array containing JSON of the Marking Code metadata that you want to remove, or a list with identifiers.

If the Marking Code is specified in the request contains nested codes, they are also subject to deletion.

> Request for Bulk Deletion of Marking Codes

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/supply/161d0246-1477-11ec-ac18-000b00000001/positions/161d25a8-1477-11ec-ac18-000b00000002/trackingCodes/delete"
     -H "Authorization: Basic <Credentials>
     -H "Content-Type: application/json"
       -d'[
             {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/supply/161d0246-1477-11ec-ac18-000b00000001/positions/161d25a8-1477-11ec-ac18-000b00000002/trackingCodes/c7eccae6 -1bb9-11ec-ac18-000c00000001",
                 "type": "tracking code",
                 "mediaType": "application/json"
               }
             }
           ]'
```

> Successful request. The result is JSON information about the removal of Marking Codes.

```json
[
   {
     "info": "Entity 'trackingcode' with UUID: 6e29f82e-1bc0-11ec-ac18-000c00000002 deleted successfully"
   }
]
```
