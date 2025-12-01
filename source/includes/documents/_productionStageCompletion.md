## Operation Report

The entity code for Operation Report in the JSON API is the **productionstagecompletion** keyword.

The Operation Report provides detailed information about the completed Production Operation from a Production Order. It includes the cost of raw materials actually used, the cost of finished goods (both ready for use and in progress), operational costs, and other relevant details.

Using the JSON API, you can perform the following actions on Operation Reports: 

* Create, update, and delete Operation Reports.
* Retrieve lists of Operation Reports.
* Access details of a specific Operation Report.

If production has not started for a Production Order, attempts to create an Operation Report for this Production Order will result in an error.


### Operation Report
#### Entity attributes

| Title                    | Type                                               | Filtration                 | Description                                                                                                                                                                                 |
|--------------------------|----------------------------------------------------|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **accountId**            | UUID                                               | `=` `!=`                   | Account ID<br>`+Required when replying` `+Read Only`                                                                                                                                        |
| **applicable**           | Boolean                                            |                            | Check mark<br>`+Required when answering`  `+Read Only`                                                                                                                                      |
| **created**              | DateTime                                           |                            | Date created<br>`+Required when responding` `+Read-only`                                                                                                                                    |
| **defect**               | Boolean                                            |                            | Attribute of defect. Cannot be changed after creation<br>`+Required when replying`                                                                                                          |
| **description**          | String(4096)                                       |                            | Operation Report Comment                                                                                                                                                                    |
| **enableHourAccounting** | Boolean                                            |                            | Is standard hours accounting enabled<br>`+Required when replying`                                                                                                                           |
| **externalCode**         | String(255)                                        |                            | Operation Report External Code <br>`+Required when replying`                                                                                                                                |
| **group**                | [Meta](../#kladana-json-api-general-info-metadata) |                            | Employee's department<br>`+Required when replying` `+Expand`                                                                                                                                |
| **id**                   | UUID                                               |                            | Operation Report ID<br>`+Required when replying` `+Read-only`                                                                                                                               |
| **labourUnitCost**       | Double                                             |                            | Labor cost per unit of production<br>`+Required when replying`                                                                                                                              |
| **standardHourUnit**     | Double                                             |                            | Standard Hours of a production unit<br>`+Required when replying`                                                                                                                            |
| **materials**            | MetaArray                                          |                            | Metadata of Operation Report Raw materials [Learn more](#transactions-operation-report-change-operation-report-operation-report-raw-materials)<br>`+Expand`                                 |
| **meta**                 | [Meta](../#kladana-json-api-general-info-metadata) |                            | Operation Report Metadata <br>`+Required when replying` `+Read-only`                                                                                                                        |
| **moment**               | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Document date<br>`+Required when replying`                                                                                                                                                  |
| **name**                 | String(255)                                        |                            | Operation Report Title<br>`+Required when replying`                                                                                                                                         |
| **owner**                | [Meta](../#kladana-json-api-general-info-metadata) |                            | Owner (Employee)<br>`+Expand`                                                                                                                                                               |
| **performer**            | [Meta](../#kladana-json-api-general-info-metadata) |                            | Performer (Employee)<br>`+Expand`                                                                                                                                                           |
| **processingUnitCost**   | Double                                             |                            | Cost per unit of production volume<br>`+Required when replying`                                                                                                                             |
| **productionStage**      | [Meta](../#kladana-json-api-general-info-metadata) |                            | [Production operation](#transactions-production-order-production-operations)<br>`+Expand` `+Cannot be changed after creation`                                                               |
| **productionVolume**     | Double                                             |                            | Production Volume<br>`+Required when replying`                                                                                                                                              |
| **products**             | MetaArray                                          |                            | Metadata of Products of Operation Report. Only available for last operation. [Learn more](#transactions-operation-report-change-operation-report-products-of-operation-report)<br>`+Expand` |
| **shared**               | Boolean                                            |                            | Public access<br>`+Required when replying`                                                                                                                                                  |
| **standardHourCost**     | Double                                             |                            | Standard Hour cost<br>`+Required when replying`                                                                                                                                             |
| **updated**              | DateTime                                           |                            | The moment of the last update of Operation Report<br>`+Required when replying` `+Read-only`                                                                                                 |

The entity has restrictions on expand: expand of nested fields is not available for the **productionStage.productionRow** field.

You can filter by **assortment** with `=`, which will allow you to get completed production steps with a specific material or product.

To create a defect, you must send the defect=true attribute. The Operation Reports document of the defect type has the following limitations:
1. The cost of a defect can only be associated with products released after it. Therefore, it is necessary that after the defect there remains available production volume for the release of products. The date of the defect document also cannot be the last among all the completions of the Production Order stages.
2. Once created, a defect cannot be changed back to a high-quality completion of the operation.
3. A defect does not produce products (scrap), so its products cannot be requested and changed.

### Get a list of Operation Reports
A request for Operation Reports on an account.

When getting a list of Operation Reports, you can pass a filter for a specific Production Order:
`filter=productionTask=https://api.kladana.com/api/remap/1.2/entity/productionTask/&lt;id>`.

Result: JSON object, including the following fields:

| Name | Type | Description |
| ----------- | :-------------------------------------------------------- |:--------------------------------------------------------------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the issue |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the employee who performed the request. |
| **rows** | Array(Object) | Array of JSON objects representing the Operation Report. |

**Parameters**

| Parameter | Description |
| ------------------------------- | :--------------------------------------------------------------------------------------------------------------------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to retrieve.`Valid values ​​are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indentation in the returned list of entities. |
| **search** | `string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Get a list of Operation Reports

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of a list of Operation Reports.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion",
    "type": "productionstagecompletion",
    "mediaType": "application/json",
    "size": 5,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000136",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/metadata",
        "type": "productionstagecompletion",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#productionstagecompletion/edit?id=01ff6808-95de-11ee-0a81-072300000136"
      },
      "id": "01ff6808-95de-11ee-0a81-072300000136",
      "accountId": "a67c68a3-95dd-11ee-0a83-071a00000002",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/a7354b1a-95dd-11ee-0a81-07230000004d",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=a7354b1a-95dd-11ee-0a81-07230000004d"
        }
      },
      "shared": false,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/a67ef296-95dd-11ee-0a83-071a00000003",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2023-12-08 18:25:24.325",
      "name": "00001",
      "externalCode": "EnuNEmG2jyUF4t9tgPQk72",
      "moment": "2023-12-08 18:25:00.000",
      "created": "2023-12-08 18:25:24.386",
      "performer": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/50f4a244-9a95-11ee-0a83-05c8000005af",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=50f4a244-9a95-11ee-0a83-05c8000005af"
        }
      },
      "productionStage": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/d15ec2e9-95dd-11ee-0a81-07230000011c",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstage/metadata",
          "type": "productionstage",
          "mediaType": "application/json"
        }
      },
      "materials": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000136/materials",
          "type": "productionstagecompletionmaterial",
          "mediaType": "application/json",
          "size": 1,
          "limit": 1000,
          "offset": 0
        }
      },
      "products": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000136/products",
          "type": "productionstagecompletionresult",
          "mediaType": "application/json",
          "size": 1,
          "limit": 1000,
          "offset": 0
        }
      },
      "productionVolume": 100000,
      "processingUnitCost": 0.0,
      "labourUnitCost": 0.0,
      "standardHour": 0.0,
      "standardHourCost": 0.0,
      "enableHourAccounting": false,
      "defect": false
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/19b3bb62-9807-11ee-0a81-07230000030e",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/metadata",
        "type": "productionstagecompletion",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#productionstagecompletion/edit?id=19b3bb62-9807-11ee-0a81-07230000030e"
      },
      "id": "19b3bb62-9807-11ee-0a81-07230000030e",
      "accountId": "a67c68a3-95dd-11ee-0a83-071a00000002",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/a7354b1a-95dd-11ee-0a81-07230000004d",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=a7354b1a-95dd-11ee-0a81-07230000004d"
        }
      },
      "shared": false,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/a67ef296-95dd-11ee-0a83-071a00000003",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2023-12-11 12:26:28.767",
      "name": "00003",
      "externalCode": "zjyrF00vg0Ogjpl0Uk0XP0",
      "moment": "2023-12-11 12:24:00.000",
      "created": "2023-12-11 12:24:35.847",
      "productionStage": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/1812ddaf-9807-11ee-0a81-072300000306",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstage/metadata",
          "type": "productionstage",
          "mediaType": "application/json"
        }
      },
      "materials": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/19b3bb62-9807-11ee-0a81-07230000030e/materials",
          "type": "productionstagecompletionmaterial",
          "mediaType": "application/json",
          "size": 1,
          "limit": 1000,
          "offset": 0
        }
      },
      "products": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/19b3bb62-9807-11ee-0a81-07230000030e/products",
          "type": "productionstagecompletionresult",
          "mediaType": "application/json",
          "size": 1,
          "limit": 1000,
          "offset": 0
        }
      },
      "productionVolume": 1,
      "processingUnitCost": 0.0,
      "labourUnitCost": 0.0,
      "standardHour": 0.0,
      "standardHourCost": 0.0,
      "enableHourAccounting": false,
      "defect": false
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/4c65602d-97f5-11ee-0a81-0723000001e1",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/metadata",
        "type": "productionstagecompletion",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#productionstagecompletion/edit?id=4c65602d-97f5-11ee-0a81-0723000001e1"
      },
      "id": "4c65602d-97f5-11ee-0a81-0723000001e1",
      "accountId": "a67c68a3-95dd-11ee-0a83-071a00000002",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/a7354b1a-95dd-11ee-0a81-07230000004d",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=a7354b1a-95dd-11ee-0a81-07230000004d"
        }
      },
      "shared": false,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/a67ef296-95dd-11ee-0a83-071a00000003",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2023-12-11 10:35:54.714",
      "name": "00002",
      "externalCode": "zrkbh5LfjVUXFXfbUunmh3",
      "moment": "2023-12-11 10:17:00.000",
      "created": "2023-12-11 10:17:09.956",
      "productionStage": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/3dc137d1-97f5-11ee-0a81-0723000001dc",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstage/metadata",
          "type": "productionstage",
          "mediaType": "application/json"
        }
      },
      "materials": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/4c65602d-97f5-11ee-0a81-0723000001e1/materials",
          "type": "productionstagecompletionmaterial",
          "mediaType": "application/json",
          "size": 18,
          "limit": 1000,
          "offset": 0
        }
      },
      "products": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/4c65602d-97f5-11ee-0a81-0723000001e1/products",
          "type": "productionstagecompletionresult",
          "mediaType": "application/json",
          "size": 1,
          "limit": 1000,
          "offset": 0
        }
      },
      "productionVolume": 1,
      "processingUnitCost": 0.0,
      "labourUnitCost": 0.0,
      "standardHour": 0.0,
      "standardHourCost": 0.0,
      "enableHourAccounting": false,
      "defect": false
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/68c6559a-980b-11ee-0a81-072300000358",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/metadata",
        "type": "productionstagecompletion",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#productionstagecompletion/edit?id=68c6559a-980b-11ee-0a81-072300000358"
      },
      "id": "68c6559a-980b-11ee-0a81-072300000358",
      "accountId": "a67c68a3-95dd-11ee-0a83-071a00000002",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/a7354b1a-95dd-11ee-0a81-07230000004d",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=a7354b1a-95dd-11ee-0a81-07230000004d"
        }
      },
      "shared": false,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/a67ef296-95dd-11ee-0a83-071a00000003",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2023-12-11 12:55:26.438",
      "name": "00006",
      "externalCode": "4vgR7NjlgYrEE1fKxfRVV2",
      "moment": "2023-12-11 12:55:00.000",
      "created": "2023-12-11 12:55:26.496",
      "productionStage": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/36bcdb7a-980b-11ee-0a81-07230000034c",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstage/metadata",
          "type": "productionstage",
          "mediaType": "application/json"
        }
      },
      "materials": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/68c6559a-980b-11ee-0a81-072300000358/materials",
          "type": "productionstagecompletionmaterial",
          "mediaType": "application/json",
          "size": 1,
          "limit": 1000,
          "offset": 0
        }
      },
      "products": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/68c6559a-980b-11ee-0a81-072300000358/products",
          "type": "productionstagecompletionresult",
          "mediaType": "application/json",
          "size": 1,
          "limit": 1000,
          "offset": 0
        }
      },
      "productionVolume": 1.1235,
      "processingUnitCost": 0.0,
      "labourUnitCost": 0.0,
      "standardHourUnit": 0.0,
      "standardHourCost": 0.0,
      "enableHourAccounting": false,
      "defect": false
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/6d87056d-9809-11ee-0a83-0717000000a2",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/metadata",
        "type": "productionstagecompletion",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#productionstagecompletion/edit?id=6d87056d-9809-11ee-0a83-0717000000a2"
      },
      "id": "6d87056d-9809-11ee-0a83-0717000000a2",
      "accountId": "a67c68a3-95dd-11ee-0a83-071a00000002",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/a7354b1a-95dd-11ee-0a81-07230000004d",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=a7354b1a-95dd-11ee-0a81-07230000004d"
        }
      },
      "shared": false,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/a67ef296-95dd-11ee-0a83-071a00000003",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2023-12-11 12:51:50.895",
      "name": "00004",
      "externalCode": "Y3qEMw7Qjl0jh5JwFFvrL2",
      "moment": "2023-12-11 12:41:00.000",
      "created": "2023-12-11 12:41:15.372",
      "productionStage": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/e0e2370f-9808-11ee-0a81-072300000327",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstage/metadata",
          "type": "productionstage",
          "mediaType": "application/json"
        }
      },
      "materials": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/6d87056d-9809-11ee-0a83-0717000000a2/materials",
          "type": "productionstagecompletionmaterial",
          "mediaType": "application/json",
          "size": 2,
          "limit": 1000,
          "offset": 0
        }
      },
      "products": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/6d87056d-9809-11ee-0a83-0717000000a2/products",
          "type": "productionstagecompletionresult",
          "mediaType": "application/json",
          "size": 1,
          "limit": 1000,
          "offset": 0
        }
      },
      "productionVolume": 1.6,
      "processingUnitCost": 0.0,
      "labourUnitCost": 0.0,
      "standardHourUnit": 0.0,
      "standardHourCost": 0.0,
      "enableHourAccounting": false,
      "defect": false
    }
  ]
}
```

### Create Operation Report
Request to create a new Operation Report.

The condition for creating an Operation Report is the start of production for the Production Task for which the Operation Report is being created. [Learn more](../#transactions-production-order).

When creating, the production start date is automatically changed if the production start date is later than the date of the Operation Report.

Required fields to create:

+ **productionStage** - Link to Production operation in [Metadata](../#kladana-json-api-general-info-metadata) format
+ **productionVolume** - Production volume

Creating an Operation Report with serial numbers is currently not supported.

> Example of creating a new Operation Report with a request body containing only the required fields.

```shell
  curl -X POST
    "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "productionStage": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/3130f7df-660f-11ee-c0a8-100c00000139",
                "type": "productionstage",
                "mediaType": "application/json"
              }
            },
            "productionVolume" : 5
          } 
'  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the generated Operation Report.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000136",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/metadata",
    "type": "productionstagecompletion",
    "mediaType": "application/json",
    "uuidHref": "https://app.kladana.com/app/#productionstagecompletion/edit?id=01ff6808-95de-11ee-0a81-072300000136"
  },
  "id": "01ff6808-95de-11ee-0a81-072300000136",
  "accountId": "a67c68a3-95dd-11ee-0a83-071a00000002",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/a7354b1a-95dd-11ee-0a81-07230000004d",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=a7354b1a-95dd-11ee-0a81-07230000004d"
    }
  },
  "shared": false,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/a67ef296-95dd-11ee-0a83-071a00000003",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2023-12-08 18:25:24.325",
  "name": "00001",
  "externalCode": "EnuNEmG2jyUF4t9tgPQk72",
  "moment": "2023-12-08 18:25:00.000",
  "created": "2023-12-08 18:25:24.386",
  "productionStage": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/3130f7df-660f-11ee-c0a8-100c00000139",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstage/metadata",
      "type": "productionstage",
      "mediaType": "application/json"
    }
  },
  "materials": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000136/materials",
      "type": "productionstagecompletionmaterial",
      "mediaType": "application/json",
      "size": 1,
      "limit": 1000,
      "offset": 0
    }
  },
  "products": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000136/products",
      "type": "productionstagecompletionresult",
      "mediaType": "application/json",
      "size": 1,
      "limit": 1000,
      "offset": 0
    }
  },
  "productionVolume": 5,
  "processingUnitCost": 10.0,
  "labourUnitCost": 20.0,
  "standardHourUnit": 30.0,
  "standardHourCost": 0.0,
  "enableHourAccounting": false,
  "defect": false
}
```

> An example of creating a new Operation Report with a richer request body.

```shell
  curl -X POST
    "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "name": "000034",
            "owner": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                "type": "employee",
                "mediaType": "application/json"
              }
            },
            "shared": false,
            "group": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
                "type": "group",
                "mediaType": "application/json"
              }
            },
            "performer": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/employee/a7354b1a-95dd-11ee-0a81-07230000004d",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                "type": "employee",
                "mediaType": "application/json",
                "uuidHref": "https://app.kladana.com/app/#employee/edit?id=a7354b1a-95dd-11ee-0a81-07230000004d"
              }
            },      
            "productionStage": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/3130f7df-660f-11ee-c0a8-100c00000139",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstage/metadata",
                "type": "productionstage",
                "mediaType": "application/json"
              }
            },
            "productionVolume": 5,
            "processingUnitCost": 10.0,
            "labourUnitCost": 20.0,
            "standardHourUnit": 30.0
          }'  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the generated Operation Report.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000136",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/metadata",
    "type": "productionstagecompletion",
    "mediaType": "application/json",
    "uuidHref": "https://app.kladana.com/app/#productionstagecompletion/edit?id=01ff6808-95de-11ee-0a81-072300000136"
  },
  "id": "01ff6808-95de-11ee-0a81-072300000136",
  "accountId": "a67c68a3-95dd-11ee-0a83-071a00000002",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/a7354b1a-95dd-11ee-0a81-07230000004d",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=a7354b1a-95dd-11ee-0a81-07230000004d"
    }
  },
  "shared": false,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/a67ef296-95dd-11ee-0a83-071a00000003",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2023-12-08 18:25:24.325",
  "name": "000034",
  "externalCode": "EnuNEmG2jyUF4t9tgPQk72",
  "moment": "2016-04-19 13:50:24",
  "created": "2023-12-08 18:25:24.386",
  "performer": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/a7354b1a-95dd-11ee-0a81-07230000004d",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=a7354b1a-95dd-11ee-0a81-07230000004d"
    }
  },
  "productionStage": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/3130f7df-660f-11ee-c0a8-100c00000139",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstage/metadata",
      "type": "productionstage",
      "mediaType": "application/json"
    }
  },
  "materials": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000136/materials",
      "type": "productionstagecompletionmaterial",
      "mediaType": "application/json",
      "size": 1,
      "limit": 1000,
      "offset": 0
    }
  },
  "products": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000136/products",
      "type": "productionstagecompletionresult",
      "mediaType": "application/json",
      "size": 1,
      "limit": 1000,
      "offset": 0
    }
  },
  "productionVolume": 5,
  "processingUnitCost": 10.0,
  "labourUnitCost": 20.0,
  "standardHourUnit": 30.0,
  "standardHourCost": 0.0,
  "enableHourAccounting": false,
  "defect": false
}
```

### Bulk creation and update of Operation Report
[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Operation Report. In the request body, you need to pass an array containing JSON representations of Operation Report that need to be created or updated. The Operation Reports to be updated must contain an identifier as metadata.

> Example of creating and updating several Operation Reports

```shell
  curl -X POST
    "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '[
            {
                "name": "000033",
                "owner": {
                  "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                    "type": "employee",
                    "mediaType": "application/json"
                  }
                },
                "shared": false,
                "group": {
                  "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
                    "type": "group",
                    "mediaType": "application/json"
                  }
                },
                "productionStage": {
                  "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/3130f7df-660f-11ee-c0a8-100c00000139",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstage/metadata",
                    "type": "productionstage",
                    "mediaType": "application/json"
                  }
                },
                "productionVolume": 15,
              ]
            },
            {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000136",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/metadata",
                "type": "productionstagecompletion",
                "mediaType": "application/json",
                "uuidHref": "https://app.kladana.com/app/#productionstagecompletion/edit?id=01ff6808-95de-11ee-0a81-072300000136"
              },
              "name": "000034",
              "productionVolume": 5
            }
          ]'  
```

> Response 200 (application/json)
Successful request. The result is a JSON array of views of the created and updated Operation Reports.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000136",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/metadata",
      "type": "productionstagecompletion",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#productionstagecompletion/edit?id=01ff6808-95de-11ee-0a81-072300000136"
    },
    "id": "01ff6808-95de-11ee-0a81-072300000136",
    "accountId": "a67c68a3-95dd-11ee-0a83-071a00000002",
    "owner": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/a7354b1a-95dd-11ee-0a81-07230000004d",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=a7354b1a-95dd-11ee-0a81-07230000004d"
      }
    },
    "shared": false,
    "group": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/group/a67ef296-95dd-11ee-0a83-071a00000003",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
        "type": "group",
        "mediaType": "application/json"
      }
    },
    "updated": "2023-12-08 18:25:24.325",
    "name": "000033",
    "externalCode": "EnuNEmG2jyUF4t9tgPQk72",
    "moment": "2023-12-08 18:25:00.000",
    "created": "2023-12-08 18:25:24.386",
    "productionStage": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/3130f7df-660f-11ee-c0a8-100c00000139",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstage/metadata",
        "type": "productionstage",
        "mediaType": "application/json"
      }
    },
    "materials": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000136/materials",
        "type": "productionstagecompletionmaterial",
        "mediaType": "application/json",
        "size": 1,
        "limit": 1000,
        "offset": 0
      }
    },
    "products": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000136/products",
        "type": "productionstagecompletionresult",
        "mediaType": "application/json",
        "size": 1,
        "limit": 1000,
        "offset": 0
      }
    },
    "productionVolume": 15,
    "processingUnitCost": 0.0,
    "labourUnitCost": 0.0,
    "standardHourUnit": 0.0,
    "standardHourCost": 0.0,
    "enableHourAccounting": false,
    "defect": false
  },
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/19b3bb62-9807-11ee-0a81-07230000030e",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/metadata",
      "type": "productionstagecompletion",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#productionstagecompletion/edit?id=19b3bb62-9807-11ee-0a81-07230000030e"
    },
    "id": "19b3bb62-9807-11ee-0a81-07230000030e",
    "accountId": "a67c68a3-95dd-11ee-0a83-071a00000002",
    "owner": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/a7354b1a-95dd-11ee-0a81-07230000004d",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=a7354b1a-95dd-11ee-0a81-07230000004d"
      }
    },
    "shared": false,
    "group": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/group/a67ef296-95dd-11ee-0a83-071a00000003",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
        "type": "group",
        "mediaType": "application/json"
      }
    },
    "updated": "2023-12-11 12:26:28.767",
    "name": "000034",
    "externalCode": "zjyrF00vg0Ogjpl0Uk0XP0",
    "moment": "2023-12-11 12:24:00.000",
    "created": "2023-12-11 12:24:35.847",
    "productionStage": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/1812ddaf-9807-11ee-0a81-072300000306",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstage/metadata",
        "type": "productionstage",
        "mediaType": "application/json"
      }
    },
    "materials": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/19b3bb62-9807-11ee-0a81-07230000030e/materials",
        "type": "productionstagecompletionmaterial",
        "mediaType": "application/json",
        "size": 1,
        "limit": 1000,
        "offset": 0
      }
    },
    "products": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/19b3bb62-9807-11ee-0a81-07230000030e/products",
        "type": "productionstagecompletionresult",
        "mediaType": "application/json",
        "size": 1,
        "limit": 1000,
        "offset": 0
      }
    },
    "productionVolume": 5,
    "processingUnitCost": 0.0,
    "labourUnitCost": 0.0,
    "standardHourUnit": 0.0,
    "standardHourCost": 0.0,
    "enableHourAccounting": false,
    "defect": false
  }
]
```

### Delete Operation Report

**Parameters**

| Parameter | Description |
| :------- |:----------------------------------------------------------------------------------------------------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Operation Report ID |

> Request to delete Operation Report with the specified ID.

```shell
curl -X DELETE
  "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successfully removed Operation Report.

### Bulk delete of Operation Reports

The request body must contain an array with the JSON metadata of the Operation Reports to be deleted. Deletion is performed in the specified order, so the execution of the last Production Operation must be placed before the executions of any dependent operations.

> Request for bulk deletion of Operation Reports.

```shell
curl -X POST
  "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/delete"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
  -H "Content-Type: application/json"
  -d '[
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000136",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/metadata",
                "type": "productionstagecompletion",
                "mediaType": "application/json",
              }
        },
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000147",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/metadata",
                "type": "productionstagecompletion",
                "mediaType": "application/json",
              }
        }
      ]'
```        

> Successful request. The result is JSON information about the removal of Operation Reports.

```json
[
  {
    "info":"Entity 'productionstagecompletion' with UUID: 01ff6808-95de-11ee-0a81-072300000136 successfully deleted"
  },
  {
    "info":"Entity 'productionstagecompletion' with UUID: 01ff6808-95de-11ee-0a81-072300000147 successfully deleted"
  }
]
```

### Get Operation Report

**Parameters**

| Parameter | Description |
| :------- |:--------------------------------------------------------------------------------------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Operation Reports ID. |

> Request to get a single Operation Report with the specified ID.

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the Operation Report.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/metadata",
    "type": "productionstagecompletion",
    "mediaType": "application/json",
    "uuidHref": "https://app.kladana.com/app/#productionstagecompletion/edit?id=7944ef04-f831-11e5-7a69-971500188b19"
  },
  "id": "7944ef04-f831-11e5-7a69-971500188b19",
  "accountId": "a67c68a3-95dd-11ee-0a83-071a00000002",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/a7354b1a-95dd-11ee-0a81-07230000004d",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=a7354b1a-95dd-11ee-0a81-07230000004d"
    }
  },
  "shared": false,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/a67ef296-95dd-11ee-0a83-071a00000003",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2023-12-08 18:25:24.325",
  "name": "00001",
  "externalCode": "EnuNEmG2jyUF4t9tgPQk72",
  "moment": "2023-12-08 18:25:00.000",
  "created": "2023-12-08 18:25:24.386",
  "productionStage": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/d15ec2e9-95dd-11ee-0a81-07230000011c",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstage/metadata",
      "type": "productionstage",
      "mediaType": "application/json"
    }
  },
  "materials": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000136/materials",
      "type": "productionstagecompletionmaterial",
      "mediaType": "application/json",
      "size": 1,
      "limit": 1000,
      "offset": 0
    }
  },
  "products": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000136/products",
      "type": "productionstagecompletionresult",
      "mediaType": "application/json",
      "size": 1,
      "limit": 1000,
      "offset": 0
    }
  },
  "productionVolume": 100000,
  "processingUnitCost": 0.0,
  "labourUnitCost": 0.0,
  "standardHourUnit": 0.0,
  "standardHourCost": 0.0,
  "enableHourAccounting": false,
  "defect": false
}
```

### Change Operation Report
Request to update the Operation Report with the specified ID.
When updating, the production start date is automatically changed if the production start date is later than the operation execution date.
In the request body, you must specify the fields that need to be changed in the Operation Report, except for those
marked `Read-only` in the description of the Operation Report attributes.

**Parameters**

| Parameter | Description |
| :------- |:------------------------------------------------------------------------------------------------------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Operation Report ID. |

> Example of a request to update a separate Operation Report.

```shell
  curl -X PUT
    "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "name": "000034",
            "productionVolume": 22,
          }'  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the updated Operation Report.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/metadata",
    "type": "productionstagecompletion",
    "mediaType": "application/json",
    "uuidHref": "https://app.kladana.com/app/#productionstagecompletion/edit?id=7944ef04-f831-11e5-7a69-971500188b19"
  },
  "id": "01ff6808-95de-11ee-0a81-072300000136",
  "accountId": "a67c68a3-95dd-11ee-0a83-071a00000002",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/a7354b1a-95dd-11ee-0a81-07230000004d",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=a7354b1a-95dd-11ee-0a81-07230000004d"
    }
  },
  "shared": false,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/a67ef296-95dd-11ee-0a83-071a00000003",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2023-12-08 18:25:24.325",
  "name": "000034",
  "externalCode": "EnuNEmG2jyUF4t9tgPQk72",
  "moment": "2023-12-08 18:25:00.000",
  "created": "2023-12-08 18:25:24.386",
  "productionStage": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/productionstage/d15ec2e9-95dd-11ee-0a81-07230000011c",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productionstage/metadata",
      "type": "productionstage",
      "mediaType": "application/json"
    }
  },
  "materials": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000136/materials",
      "type": "productionstagecompletionmaterial",
      "mediaType": "application/json",
      "size": 1,
      "limit": 1000,
      "offset": 0
    }
  },
  "products": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/01ff6808-95de-11ee-0a81-072300000136/products",
      "type": "productionstagecompletionresult",
      "mediaType": "application/json",
      "size": 1,
      "limit": 1000,
      "offset": 0
    }
  },
  "productionVolume": 22,
  "processingUnitCost": 0.0,
  "labourUnitCost": 0.0,
  "standardHourUnit": 0.0,
  "standardHourCost": 0.0,
  "enableHourAccounting": false,
  "defect": false
}
```

#### Operation Report Raw Materials
Raw Materials of Operation Report are the products, product variants and batches consumed during the execution of the Production operation.

The material object of Operation Report contains the following fields:

| Name | Type | Description |
| -------------------- |:----------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Read-only` |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata)| Metadata of a product/product variant/batches that the item represents<br>`+Required when replying` `+Expand` |
| **consumedQuantity** | Float | The number of products/product variants of this type in item. If the position is a product that has accounting by serial numbers enabled, then the value in this field will always be equal to the number of serial numbers for this position in the document<br>`+Required when replying` |
| **id** | UUID | Item ID<br>`+Required when replying` `+Read-only` |
| **things** | Array(String) | Serial numbers. The value of this attribute is ignored if the product of the position is not accounted for by serial numbers. Otherwise, the number of products in the position will be equal to the number of serial numbers passed in the attribute value |

#### Products of Operation Report
Products of Operation Report are products, product variants, and batches created during the execution of the Production operation.

The product object of Operation Report contains the following fields:

| Name | Type | Description |
| -------------------- |:-----------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Read-only` |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata)| Metadata of the product/product variant/batches that the item represents<br>`+Required when replying` `+Expand` |
| **id** | UUID | Item ID<br>`+Required when replying` `+Read-only` |
| **producedQuantity** | Float | Quantity of products/product variants of this type in the item. If the item is a product that has serial numbers enabled, then the value in this field will always be equal to the number of serial numbers for this item in the document<br>`+Required when replying` |
| **things** | Array(String) | Serial numbers. The value of this attribute it is ignored if the item is not accounted for by serial numbers. Otherwise, the number of items in the item will be equal to the number of serial numbers passed in the attribute value |

### Operation Report Raw Materials
A separate resource for managing Raw Materials of a Production operation.

### Get Operation Report Raw Materials
A request to get a list of all Operation Report Raw Materials.

| Name | Type | Description |
| ----------- | :-------------------------------------------------------- |:-----------------------------------------------------------------------------------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the issue |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the employee who performed the request |
| **rows** | Array(Object) | JSON array of objects representing Operation Report Raw Materials |

**Parameters**

| Parameter | Description |
| :--------- | :-------------------------------------------------------------------------------------------------------------------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Operation Report ID |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to retrieve.`Valid values ​​are 1 - 1000` |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indentation in the returned list of entities |

> Request to get a list of all Raw Materials of a Operation Report

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19/materials"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the list of products of Operation Report.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19/materials/",
    "type": "productionstagecompletionmaterial",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19/materials/34f6344f-015e-11e6-9464-e4de0000006c",
        "type": "productionstagecompletionmaterial",
        "mediaType": "application/json"
      },
      "id": "34f6344f-015e-11e6-9464-e4de0000006c",
      "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
      "consumedQuantity": 5.0,
      "assortment": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/9656117b-b717-11ec-0c80-0bba0006dcde",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#good/edit?id=96568199-b716-11ec-0a80-0bba0006dcdc"
        }
      }
    }
  ]
}
```

### Add Raw Material of Operation Report
Request to add Raw Material to the Operation Report.
For products with serial numbers, the `consumedQuantity` field is automatically changed to the quantity of serial numbers passed in the `things` field.

For successful creation, the following fields must be specified in the request body:

+ **assortment** - Link to the product/product variant/batches that the material represents.
+ **consumedQuantity** - quantity of the product (ignored if the `things` field is passed)
+ **things** - serial numbers (only for products with serial numbers)

**Parameters**

| Parameter | Description |
| :------- |:----------------------------------------------------------------------------------------------------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Operation Report ID |

> Example of request to add Raw Material of Operation Report.

```shell
  curl -X POST
    "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19/materials"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "consumedQuantity": 2,
            "assortment": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/product/9656117b-b717-11ec-0c80-0bba0006dcde",
              }
            }
          }
      '  
```
> Response 200 (application/json)
Successful request. The result is a JSON representation of the added material.

```json
    {
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19/materials/34f6344f-015e-11e6-9464-e4de0000006c",
    "type": "productionstagecompletionmaterial",
    "mediaType": "application/json"
  },
  "id": "34f6344f-015e-11e6-9464-e4de0000006c",
  "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
  "consumedQuantity": 2.0,
  "assortment": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/9656117b-b717-11ec-0c80-0bba0006dcde",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#good/edit?id=96568199-b716-11ec-0a80-0bba0006dcdc"
    }
  }
}
```

> Example of a request to add Raw Material of Operation Report taking into account serial numbers.

```shell
  curl -X POST
    "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19/materials"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "assortment": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/product/9656117b-b717-11ec-0c80-0bba0006dcde",
              }
            },
            "things": ["F564X056", "F564X057"]
          }
      '  
```
> Response 200 (application/json)
Successful request. The result is a JSON representation of the added material.

```json
    {
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19/materials/34f6344f-015e-11e6-9464-e4de0000006c",
    "type": "productionstagecompletionmaterial",
    "mediaType": "application/json"
  },
  "id": "34f6344f-015e-11e6-9464-e4de0000006c",
  "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
  "consumedQuantity": 2.0,
  "assortment": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/9656117b-b717-11ec-0c80-0bba0006dcde",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#good/edit?id=96568199-b716-11ec-0a80-0bba0006dcdc"
    },
    "things": ["F564X056", "F564X057"]
  }
}
```

### Change Raw Material of Operation Report
Request to update a single Raw Material of Operation Report.
For items with serial numbers, the `consumedQuantity` field is automatically updated to the quantity of serial numbers passed in the `things` field.

**Parameters**

| Parameter | Description |
| :------------- |:----------------------------------------------------------------------------------------------------------------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Operation Report ID |
| **materialID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* ID of the Operation Report Raw Material |

> Example of a request to update the quantity of a single Raw Material of an Operation Report.

```shell
  curl -X PUT
    "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19/materials/34f6344f-015e-11e6-9464-e4de0000006c"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "consumedQuantity": 3,
          }
      '  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the updated material.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19/materials/34f6344f-015e-11e6-9464-e4de0000006c",
    "type": "productionstagecompletionmaterial",
    "mediaType": "application/json"
  },
  "id": "34f6344f-015e-11e6-9464-e4de0000006c",
  "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
  "consumedQuantity": 3.0,
  "assortment": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/9656117b-b717-11ec-0c80-0bba0006dcde",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#good/edit?id=96568199-b716-11ec-0a80-0bba0006dcdc"
    }
  }
}
```

> Example of a request to update serial numbers of a single Raw Material of an Operation Report.

```shell
  curl -X PUT
    "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19/materials/34f6344f-015e-11e6-9464-e4de0000006c"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "things": ["F564X056", "F564X057"]
          }
      '  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the updated product.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19/products/34f6344f-015e-11e6-9464-e4de0000006c",
    "type": "productionstagecompletionresult",
    "mediaType": "application/json"
  },
  "id": "34f6344f-015e-11e6-9464-e4de0000006c",
  "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
  "consumedQuantity": 2,
  "assortment": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/materials/9656117b-b717-11ec-0c80-0bba0006dcde",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/materials/metadata",
      "type": "product",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#good/edit?id=96568199-b716-11ec-0a80-0bba0006dcdc"
    }
  },
  "things": ["F564X056", "F564X057"]
}
```

### Operation Report Products
A separate resource for managing Operation Report Products.

### Get Operation Report Products
A request to get a list of all Operation Report Products.

| Name | Type | Description |
| ----------- | :-------------------------------------------------------- |:----------------------------------------------------------------------------------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the issue |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the employee who performed the request |
| **rows** | Array(Object) | Array of JSON objects representing Operation Report Products |

**Parameters**

| Parameter | Description |
| :--------- | :------------------------------------------------------------------------------------------------------------------------------------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Operation Report ID |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to retrieve. `Possible values ​​are 1 - 1000` |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indentation in the returned list of entities |

> Request to get a list of all Products of this Operation Report

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19/products/"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the list of Products of Operation Report.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19/products/",
    "type": "productionstagecompletionresult",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19/products/34f6344f-015e-11e6-9464-e4de0000006c",
        "type": "productionstagecompletionresult",
        "mediaType": "application/json"
      },
      "id": "34f6344f-015e-11e6-9464-e4de0000006c",
      "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
      "producedQuantity": 0.7,
      "assortment": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/9656117b-b717-11ec-0c80-0bba0006dcde",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#good/edit?id=96568199-b716-11ec-0a80-0bba0006dcdc"
        }
      }
    }
  ]
}
```

### Change Product of Operation Report
Request to update a single Product of Operation Report.
You cannot change a product/product variant, but you can change the product batch.
For products with by serial numbers, the `producedQuantity` field is automatically changed to the quantity of serial numbers passed in the `things` field.

**Parameters**

| Parameter | Description |
| :------------ |:---------------------------------------------------------------------------------------------------------------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Operation Report ID |
| **productID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* ID of a Product in Operation Report |

> Example of a request to update the quantity of a single Product of Operation Report.

```shell
  curl -X PUT
    "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19/products/34f6344f-015e-11e6-9464-e4de0000006c"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "producedQuantity": 2.7,
          }
      '  
```

> Response 200 (application/json)
Successful request. Result is a JSON representation of the updated Product of Operation Report.

```json
    {
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19/products/34f6344f-015e-11e6-9464-e4de0000006c",
    "type": "productionstagecompletionresult",
    "mediaType": "application/json"
  },
  "id": "34f6344f-015e-11e6-9464-e4de0000006c",
  "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
  "producedQuantity": 2.7,
  "assortment": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/9656117b-b717-11ec-0c80-0bba0006dcde",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#good/edit?id=96568199-b716-11ec-0a80-0bba0006dcdc"
    }
  }
}
```

> An example of a request to update serial numbers of a specific Operation Report Product.

```shell
  curl -X PUT
    "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19/products/34f6344f-015e-11e6-9464-e4de0000006c"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "things": ["F564X056", "F564X057"]
          }
      '  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the updated Product of Operation Report.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/productionstagecompletion/7944ef04-f831-11e5-7a69-971500188b19/products/34f6344f-015e-11e6-9464-e4de0000006c",
    "type": "productionstagecompletionresult",
    "mediaType": "application/json"
  },
  "id": "34f6344f-015e-11e6-9464-e4de0000006c",
  "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
  "producedQuantity": 2,
  "assortment": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/9656117b-b717-11ec-0c80-0bba0006dcde",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#good/edit?id=96568199-b716-11ec-0a80-0bba0006dcdc"
    }
  },
  "things": ["F564X056", "F564X057"]
}
```
