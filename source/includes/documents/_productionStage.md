### Production Operations

Production operation is not an independent entity, it cannot be created or deleted. It is created automatically when filling a Production task with the BOM items.

Using the JSON API, you can update information about Production operations, request lists of Production operations, and information about individual Production operations.

Production operation raw materials can be managed both as part of a separate Production operation and separately using special resources for managing raw materials of Production operations. The entity code for Production stages in the JSON API is the keyword **productionstage**.

Learn more about [Production operations](https://support.kladana.com/hc/en-us/articles/8082376915857-Production-Operations-and-Routings).

#### Entity attributes

| Name | Type | Filtering | Description |
| ---------- | ------- | ---------- | --------- |
| **accountId** | UUID | | Account ID<br>`+Required when replying` `+Read-only` |
| **availableQuantity** | Double | | Quantity available for execution<br>`+Read-only` |
| **blockedQuantity** | Double | | Quantity that cannot be executed at the moment. For example, the previous Production Operation has not yet been executed<br>`+Read-only` |
| **completedQuantity** | Double | | Completed quantity<br>`+Read-only` |
| **enableHourAccounting** | Boolean | | Is standard hours accounting enabled<br>`+Required when replying` |
| **id** | UUID | | Production Operation ID<br>`+Required when replying` `+Read-only` |
| **labourUnitCost** | Double | | Labor costs per production item<br> |
| **materials** | MetaArray | | Metadata of the raw materials of a Production Operation. [Learn more](#transactions-production-order-raw-materials-for-a-production-operation)<br>`+Required when replying` |
| **materialStore** | [Meta](../#kladana-json-api-general-info-metadata) | | Metadata of the raw material warehouse<br>`+Read-only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Production Operation metadata<br>`+Required when replying` `+Read-only` |
| **orderingPosition** | Int | | Production Operation Index in a Production Order item<br>`+Required when replying` `+Read-only` |
| **processingUnitCost** | Double | | Cost per unit of production volume<br> |
| **productionRow** | [Meta](../#kladana-json-api-general-info-metadata) | | Metadata of a Production Order item<br>`+Expand` `+Required when replying` `+Read-only` |
| **skippedQuantity** | Double | | Quantity that will not be executed. For example, due to a production stop<br>`+Read-only` |
| **stage** | [Meta](../#kladana-json-api-general-info-metadata) | | Production Operation metadata. [Learn more](..dictionaries/#entities-production-operations)<br>`+Expand` `+Required when replying` `+Read-only` |
| **standardHourCost** | Double | | Standard Hour cost<br>`+Required when replying` |
| **standardHourUnit** | Double | | Standard hours of a unit of production volume |
| **totalQuantity** | Double | | The volume of the Production Operation. It is equal to the volume of a Production Order item<br>`+Read-only` |
| **plannedEndDate** | Date | | Planned completion date of the operation |

The entity has expand restrictions: expand of nested fields is not available for the **productionRow** field.

#### Raw Materials for a Production Operation

Raw Material for a Production Operation is a product, product variant or batch that is intended to be used in the execution of the Production Operation.

A material object for a Production Operation contains the following fields:

| Name | Type | Description |
| ----------- | ------ | ----------- |
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Read-only` |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata)| Metadata of a product/service/product variant/batch that is represented by an item<br>`+Required when replying` `+Expand` |
| **id** | UUID | Item ID <br>`+Required when replying` `+Read-only` |
| **planQuantity** | Float | Quantity of products/product variants of this type in an item<br>`+Required when replying` |

### Get the list of Production Operations for a Production Order

When receiving production stages, it is necessary to pass a filter for a specific production task `?filter=productionTask=https://api.kladana.com/api/remap/1.2/entity/productiontask/&lt;id>`.
Result: JSON object, including fields:

| Name | Type | Description |
| ---- | ---- | ----------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the issue |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the employee who performed the request |
| **rows** | Array(Object) | JSON array of objects representing Production Operations |

**Parameters**

| Parameter | Description |
| --------- | ----------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to retrieve.`Valid values ​​are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indentation in the returned list of entities. |

> Get a list of Production Operations for a Production Order

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/productionstage/?filter=productionTask=https://api.kladana.com/api/remap/1.2/entity/productiontask/1906fa20-99d6-11ee-0a83-0a2e00000767"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. Result is a JSON representation of the Production Operations list for a Production Order.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/?filter=productionTask%3Dhttps%3A%2F%2Fapi.kladana.com%2Fapi%2Fremap%2F1.2%2Fentity%2Fproductiontask%2F1906fa20-99d6-11ee-0a83-0a2e00000767",
    "type": "productionstage",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/19070bfd-99d6-11ee-0a83-0a2e0000076b",
        "type": "productionstage",
        "mediaType": "application/json"
      },
      "id": "19070bfd-99d6-11ee-0a83-0a2e0000076b",
      "accountId": "4ac40edf-99d4-11ee-0a83-0ded0000002b",
      "stage": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/processingstage/4b3ada86-99d4-11ee-0a83-0a2e0000070e",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingstage/metadata",
          "type": "processingstage",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#processingstage/edit?id=4b3ada86-99d4-11ee-0a83-0a2e0000070e"
        }
      },
      "productionRow": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/productiontask/1906fa20-99d6-11ee-0a83-0a2e00000767/productionrows/19070a2e-99d6-11ee-0a83-0a2e0000076a",
          "type": "productionrow",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#productionrow/edit?id=19070a2e-99d6-11ee-0a83-0a2e0000076a"
        }
      },
      "materials": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/19070bfd-99d6-11ee-0a83-0a2e0000076b/materials",
          "type": "productiontaskmaterial",
          "mediaType": "application/json",
          "size": 2,
          "limit": 1000,
          "offset": 0
        }
      },
      "orderingPosition": 0,
      "totalQuantity": 1.0,
      "completedQuantity": 0.0,
      "availableQuantity": 1.0,
      "blockedQuantity": 0.0,
      "skippedQuantity": 0.0,
      "processingUnitCost": 2.0,
      "labourUnitCost": 0.0,
      "standardHourUnit": 0.0,
      "standardHourCost": 0.0,
      "enableHourAccounting": false
    }
  ]
}
```

### Change Production Operation

Request to update a Production Operation with the specified ID.
The request body can only contain fields that need to be changed in the Production Operation, except for those marked `Read Only` in the [Production Operation attributes](#transactions-production-order-production-operations) description.

**Parameters**

| Parameter | Description |
| -------- | ----------- |
| **id** | `string` (required) *Example: 19070bfd-99d6-11ee-0a83-0a2e0000076b* Production Operation ID |

> Example of a request to update a single Production Operation.

```shell
  curl -X PUT
    "https://api.kladana.com/api/remap/1.2/entity/productionstage/19070bfd-99d6-11ee-0a83-0a2e0000076b"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "processingUnitCost": 70.0,
            "labourUnitCost": 30.5,
            "standardHourUnit": 43.5
          }'  
```

> Response 200 (application/json)
Successful request. Result is a JSON representation of the updated Production Operation.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/19070bfd-99d6-11ee-0a83-0a2e0000076b",
    "type": "productionstage",
    "mediaType": "application/json"
  },
  "id": "19070bfd-99d6-11ee-0a83-0a2e0000076b",
  "accountId": "4ac40edf-99d4-11ee-0a83-0ded0000002b",
  "stage": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingstage/4b3ada86-99d4-11ee-0a83-0a2e0000070e",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingstage/metadata",
      "type": "processingstage",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#processingstage/edit?id=4b3ada86-99d4-11ee-0a83-0a2e0000070e"
    }
  },
  "productionRow": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/productiontask/1906fa20-99d6-11ee-0a83-0a2e00000767/productionrows/19070a2e-99d6-11ee-0a83-0a2e0000076a",
      "type": "productionrow",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#productionrow/edit?id=19070a2e-99d6-11ee-0a83-0a2e0000076a"
    }
  },
  "materials": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/19070bfd-99d6-11ee-0a83-0a2e0000076b/materials",
      "type": "productiontaskmaterial",
      "mediaType": "application/json",
      "size": 2,
      "limit": 1000,
      "offset": 0
    }
  },
  "orderingPosition": 0,
  "totalQuantity": 1.0,
  "completedQuantity": 0.0,
  "availableQuantity": 1.0,
  "blockedQuantity": 0.0,
  "skippedQuantity": 0.0,
  "processingUnitCost": 70.0,
  "labourUnitCost": 30.5,
  "standardHourUnit": 43.5,
  "standardHourCost": 0.0,
  "enableHourAccounting": false
}
```

### Raw Materials for a Production Operation
A separate resource for managing Production Operation raw materials.

### Get Raw Materials for a Production Operation
A request to get Production Operation raw materials. The result is a JSON object that includes:

| Name | Type | Description |
| ----------- | -------- | --------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata)| Metadata about the issue |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the employee who performed the request |
| **rows** | Array(Object) | Array of JSON objects representing Production Operation raw materials |

**Parameters**

| Parameter | Description |
| ---------- | ----------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Production Operation ID |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to retrieve.`Valid values ​​are 1 - 1000` |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indentation in the returned list of entities |

> Request to get a list of all raw materials for a Production Operation

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/productionstage/7944ef04-f831-11e5-7a69-971500188b19/materials"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. Result is a JSON representation of the list of raw materials for a Production Operation.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/7944ef04-f831-11e5-7a69-971500188b19/materials",
    "type": "productiontaskmaterial",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/7944ef04-f831-11e5-7a69-971500188b19/materials/190703d7-99d6-11ee-0a83-0a2e00000768",
        "type": "productiontaskmaterial",
        "mediaType": "application/json"
      },
      "id": "190703d7-99d6-11ee-0a83-0a2e00000768",
      "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
      "planQuantity": 1.0,
      "assortment": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/db82710a-99d5-11ee-0a83-0a2e0000072d",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#good/edit?id=db82468b-99d5-11ee-0a83-0a2e0000072b"
        }
      }
    }
  ]
}
```

### Add a Raw Material to a Production Operation

Request to add a raw material to a Production Operation.

To create it successfully, the following fields must be specified in the request body:

+ **assortment** - link to the product/product variant/batch that the material represents.
+ **planQuantity** - planned quantity.

**Parameters**

| Parameter | Description |
| -------- | ------------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Production Operation ID |

> Example of a request to add a raw material to a Production Operation.

```shell
  curl -X POST
    "https://api.kladana.com/api/remap/1.2/entity/productionstage/7944ef04-f831-11e5-7a69-971500188b19/materials"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "planQuantity": 2,
            "assortment": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/product/9656117b-b717-11ec-0с80-0bba0006dcde",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                "type": "product",
                "mediaType": "application/json",
                "uuidHref": "https://app.kladana.com/app/#good/edit?id=466222d6-c1c8-11ea-c0a8-f00c00000018"
              }
            }
          }
      '
```
> Response 200 (application/json)
Successful request. Result - JSON representation of added raw material to a Production Operation

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/7944ef04-f831-11e5-7a69-971500188b19/materials/34f6344f-015e-11e6-9464-e4de0000006c",
      "type": "productiontaskmaterial",
      "mediaType": "application/json"
    },
    "id": "34f6344f-015e-11e6-9464-e4de0000006c",
    "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
    "planQuantity": 2.0,
    "assortment": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/9656117b-b717-11ec-0с80-0bba0006dcde",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#good/edit?id=57c98e8c-99d8-11ee-0a83-0a2e00000771"
      }
    }
  }
]
```

### Change Raw Material of a Production Operation
Request to update a single raw material of a Production Operation.

**Parameters**

| Parameter | Description |
| --------- | ----------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Production Operation ID |
| **materialID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* ID of a Raw Material for a Production Operation |

> Example of a request to update the quantity of a single raw material of a Production Operation.

```shell
  curl -X PUT
    "https://api.kladana.com/api/remap/1.2/entity/productionstage/7944ef04-f831-11e5-7a69-971500188b19/materials/34f6344f-015e-11e6-9464-e4de0000006c"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "planQuantity": 3,
            "assortment": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/product/57c9a841-99d8-11ee-0a83-0a2e00000773",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                "type": "product",
                "mediaType": "application/json",
                "uuidHref": "https://app.kladana.com/app/#good/edit?id=466222d6-c1c8-11ea-c0a8-f00c00000018"
              }
            }
          }
      '
```

> Response 200 (application/json)
Successful request. Result - JSON representation of updated material.

```json
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/7944ef04-f831-11e5-7a69-971500188b19/materials/34f6344f-015e-11e6-9464-e4de0000006c",
      "type": "productiontaskmaterial",
      "mediaType": "application/json"
    },
    "id": "34f6344f-015e-11e6-9464-e4de0000006c",
    "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
    "planQuantity": 3.0,
    "assortment": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/57c9a841-99d8-11ee-0a83-0a2e00000773",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#good/edit?id=57c98e8c-99d8-11ee-0a83-0a2e00000358"
      }
    }
  }
```
### Delete Raw Material of a Production Operation

Request to delete a single raw material of a Production Operation.

When fallback is enabled, the last material in a Production Operation cannot be deleted.

Material out of a Production Operation that has a completed operation cannot be deleted.

**Parameters**

| Parameter | Description |
| ---------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Production Operation ID |
| **materialID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* ID of a raw material for a Production Operation |

> Request to delete a single raw material from a Production Operation with the specified ID.

```shell
curl -X DELETE
  "https://api.kladana.com/api/remap/1.2/entity/productionstage/7944ef04-f831-11e5-7a69-971500188b19/materials/34f6344f-015e-11e6-9464-e4de0000006c"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful removal of a raw material out of a Production Operation.
