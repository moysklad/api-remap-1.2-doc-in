## Payroll
### Payrolls

Using the JSON API, you can create and update Payrolls, request lists of Payrolls, and retrieve individual Payrolls. Payroll items can be managed both within a separate Payroll and separately, using special resources for managing Payroll items.

The entity code for Payrolls in the JSON API is the **payroll** keyword.

#### Entity attributes

| Title                  | Type                                               | Description                                                                                                                                                                                                                  |
|------------------------|----------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **accountId**          | UUID                                               | Account ID<br>`+Required when replying` `+Read-only`                                                                                                                                                                         |
| **applicable**         | Boolean                                            | Check mark<br>`+Required when replying` `+Update-provider`                                                                                                                                                                   |
| **attributes**         | Array(Object)                                     | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields)                                                                                                                  |
| **created**            | DateTime                                          | Creation date<br>`+Required when replying` `+Read-only`                                                                                                                                                                      |
| **description**        | String(4096)                                      | Payroll comment                                                                                                                                                                                                              |
| **endPayrollPeriod**   | DateTime                                          | End of the payroll period. *The difference between the start and end of the payroll period must be a multiple of 24 hours; seconds are ignored*<br>`+Required when replying` `+Required when creating` `+Update-provider`   |
| **externalCode**       | String(255)                                       | External Payroll code<br>`+Required when replying`                                                                                                                                                                           |
| **files**              | MetaArray                                         | [Files](../dictionaries/#entities-files) array metadata. Maximum number of files - 100.<br>`+Required when replying` `+Expand`                                                                                               |
| **group**              | [Meta](../#kladana-json-api-general-info-metadata) | Employee's department<br>`+Required when replying` `+Expand`                                                                                                                                                                 |
| **id**                 | UUID                                               | Payroll ID<br>`+Required when replying` `+Read-only`                                                                                                                                                                         |
| **meta**               | [Meta](../#kladana-json-api-general-info-metadata) | Payroll Metadata<br>`+Required when replying`                                                                                                                                                                                |
| **moment**             | DateTime                                          | Document date<br>`+Required when replying` `+Update-provider`                                                                                                                                                                |
| **name**               | String(255)                                       | Payroll name<br>`+Required when replying` `+Update-provider`                                                                                                                                                                 |
| **organization**       | [Meta](../#kladana-json-api-general-info-metadata) | Legal entity metadata<br>`+Required when replying` `+Expand` `+Required when creating` `+Update-provider`                                                                                                                    |
| **owner**              | [Meta](../#kladana-json-api-general-info-metadata) | Owner (Employee)<br>`+Expand`                                                                                                                                                                                                |
| **positions**          | MetaArray                                         | Payroll item metadata<br>`+Required when replying` `+Expand` `+Update-provider`                                                                                                                                 |
| **printed**            | Boolean                                            | Is the document printed<br>`+Required when replying` `+Read Only`                                                                                                                                                            |
| **published**          | Boolean                                            | Is the document published<br>`+Required when replying` `+Read Only`                                                                                                                                                          |
| **shared**             | Boolean                                            | Sharing<br>`+Required when replying`                                                                                                                                                                                         |
| **startPayrollPeriod** | DateTime                                          | Start of the payroll period. *The difference between the start and end of the payroll period must be a multiple of 24 hours; seconds are ignored*<br>`+Required when replying` `+Required when creating` `+Update-provider` |
| **state**              | [Meta](../#kladana-json-api-general-info-metadata) | Payroll status metadata<br>`+Expand` `+Update-provider`                                                                                                                                                              |
| **sum**                | Float                                              | Payroll amount in paise<br>`+Required when replying` `+Read-only`                                                                                                                                                            |
| **syncId**             | UUID                                               | Synchronization ID. After filling it is not available for change                                                                                                                                                             |
| **updated**            | DateTime                                          | Payroll last updated time<br>`+Required when replying` `+Read-only`                                                                                                                                                          |

You can work with items using special resources for managing Payroll items, as well as within a separate Payroll. When working within a separate Payroll, you can send create requests with the Payroll items array included in the request body.

If the number of items exceeds the maximum allowed value, use the special "Payroll Items" resource to add more items. When updating a Payroll with a positions array in the request body, the array is treated as the complete set of Payroll items and fully replaces the existing collection: extra items are deleted, new items are added, and existing items are changed.

#### Payroll Items

Payroll items are a list of employees with their base salary and piecework pay accruals. The Payroll item object contains the following fields:

| Title               | Type                                               | Description                                                                                   |
|---------------------|----------------------------------------------------|-----------------------------------------------------------------------------------------------|
| **accountId**       | UUID                                               | Account ID<br>`+Required when replying` `+Read Only`                                          |
| **baseSalary**      | Float                                              | Base salary accrual for the employee<br>`+Required when replying` `+Update-provider`          |
| **employee**        | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the employee for whom payroll is calculated<br>`+Required when replying` `+Expand` |
| **id**              | UUID                                               | Item ID<br>`+Required when replying` `+Read Only`                                         |
| **meta**            | [Meta](../#kladana-json-api-general-info-metadata) | Payroll item metadata<br>`+Required when replying`                                |
| **pieceworkSalary** | Float                                              | Piecework pay accrual for the employee<br>`+Required when replying` `+Update-provider`        |

### Get a list of Payrolls

Query all Payrolls on this account.
Result: JSON object including fields:

| Title       | Type                                               | Description                                     |
|-------------|----------------------------------------------------|-------------------------------------------------|
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request.    |
| **meta**    | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata.                              |
| **rows**    | Array(Object)                                      | An array of JSON objects representing Payrolls. |

**Parameters**

| Parameter  | Description                                                                                                                         |
|------------|-------------------------------------------------------------------------------------------------------------------------------------|
| **limit**  | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Offset in the list of returned entities.                                         |
| **search** | `string` (optional) *Example: 0001* Filters transactions by the specified search string.                                           |

> Get Payrolls

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/payroll" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the Payrolls list.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/",
    "type": "payroll",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/946f8595-17c3-11f1-4095-ec9f00000001",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata",
        "type": "payroll",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#payroll/edit?id=946f8595-17c3-11f1-4095-ec9f00000001"
      },
      "id": "946f8595-17c3-11f1-4095-ec9f00000001",
      "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/be4118c7-fda6-11f0-2555-e5d500000055",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=be4118c7-fda6-11f0-2555-e5d500000055"
        }
      },
      "shared": false,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/bc657ddf-fda6-11f0-4e60-ea2900000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2026-03-12 08:15:10.678",
      "name": "00001",
      "externalCode": "EX0JefwKhGFRrJ7uS95aI0",
      "moment": "2026-03-04 15:13:00.000",
      "applicable": true,
      "sum": 60000.0,
      "organization": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
          "type": "organization",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
        }
      },
      "state": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata/states/615bd402-1dd2-11f1-994a-b7f800000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata",
          "type": "state",
          "mediaType": "application/json"
        }
      },
      "created": "2026-03-04 15:13:40.158",
      "printed": false,
      "published": false,
      "files": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/946f8595-17c3-11f1-4095-ec9f00000001/files",
          "type": "files",
          "mediaType": "application/json",
          "size": 0,
          "limit": 1000,
          "offset": 0
        }
      },
      "positions": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/946f8595-17c3-11f1-4095-ec9f00000001/positions",
          "type": "payrollposition",
          "mediaType": "application/json",
          "size": 2,
          "limit": 1000,
          "offset": 0
        }
      },
      "startPayrollPeriod": "2026-03-03 00:00:00.000",
      "endPayrollPeriod": "2026-03-04 23:59:59.000"
    }
  ]
}
```

### Create Payroll

Request to create a new Payroll.

Required fields:

| Parameter              | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| **endPayrollPeriod**   | End of the payroll period                                                   |
| **organization**       | Reference to your legal entity in [Metadata](../#kladana-json-api-general-info-metadata) format |
| **startPayrollPeriod** | Start of the payroll period                                                 |

> Example of creating a Payroll with only required fields

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/payroll" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '{
            "organization": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                    "type": "organization",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
                }
            },
            "startPayrollPeriod": "2026-03-24 00:00:00.000",
            "endPayrollPeriod": "2026-03-25 23:59:59.000"
          }'
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the created Payroll.

```json
{
    "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/5af05a28-285b-11f1-cc6f-b56e0000000d",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata",
        "type": "payroll",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#payroll/edit?id=5af05a28-285b-11f1-cc6f-b56e0000000d"
    },
    "id": "5af05a28-285b-11f1-cc6f-b56e0000000d",
    "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
    "owner": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/employee/be4118c7-fda6-11f0-2555-e5d500000055",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
            "type": "employee",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.com/app/#employee/edit?id=be4118c7-fda6-11f0-2555-e5d500000055"
        }
    },
    "shared": false,
    "group": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/group/bc657ddf-fda6-11f0-4e60-ea2900000002",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
            "type": "group",
            "mediaType": "application/json"
        }
    },
    "updated": "2026-03-25 19:03:35.549",
    "name": "00006",
    "externalCode": "jIqH816xglg6CcHDRj5dZ2",
    "moment": "2026-03-25 19:03:00.000",
    "applicable": true,
    "sum": 0.0,
    "organization": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
            "type": "organization",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
        }
    },
    "created": "2026-03-25 19:03:35.608",
    "printed": false,
    "published": false,
    "files": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/5af05a28-285b-11f1-cc6f-b56e0000000d/files",
            "type": "files",
            "mediaType": "application/json",
            "size": 0,
            "limit": 1000,
            "offset": 0
        }
    },
    "positions": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/5af05a28-285b-11f1-cc6f-b56e0000000d/positions",
            "type": "payrollposition",
            "mediaType": "application/json",
            "size": 0,
            "limit": 1000,
            "offset": 0
        }
    },
    "startPayrollPeriod": "2026-03-24 00:00:00.000",
    "endPayrollPeriod": "2026-03-25 23:59:59.000"
}
```

> Example of creating a Payroll with a fuller request body

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/payroll" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '{
            "organization": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                    "type": "organization",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
                }
            },
            "owner": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/employee/be4118c7-fda6-11f0-2555-e5d500000055",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                    "type": "employee",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#employee/edit?id=be4118c7-fda6-11f0-2555-e5d500000055"
                }
            },
            "shared": true,
            "name": "second",
            "moment": "2028-03-25 19:03:00.000",
            "applicable": true,
            "positions": [
                {
                    "employee": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/employee/e7b29e11-17d4-11f1-4095-ec9f00000027",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                            "type": "employee",
                            "mediaType": "application/json",
                            "uuidHref": "https://app.kladana.com/app/#employee/edit?id=e7b29e11-17d4-11f1-4095-ec9f00000027"
                        }
                    },
                    "baseSalary": 2020.0,
                    "pieceworkSalary": 2020.0
                }
            ],
            "startPayrollPeriod": "2026-03-24 00:00:00.000",
            "endPayrollPeriod": "2026-03-25 23:59:59.000"
        }'
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the created Payroll.

```json
{
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata",
        "type": "payroll",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#payroll/edit?id=4ee9ddd8-285d-11f1-cc6f-b56e00000011"
      },
      "id": "4ee9ddd8-285d-11f1-cc6f-b56e00000011",
      "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/be4118c7-fda6-11f0-2555-e5d500000055",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=be4118c7-fda6-11f0-2555-e5d500000055"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/bc657ddf-fda6-11f0-4e60-ea2900000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2026-03-25 19:44:34.567",
      "name": "second",
      "externalCode": "VpV4ADEPgtvGZSwcvakJg1",
      "moment": "2028-03-25 19:03:00.000",
      "applicable": true,
      "sum": 4040.0,
      "organization": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
          "type": "organization",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
        }
      },
      "created": "2026-03-25 19:44:34.603",
      "printed": false,
      "published": false,
      "files": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/files",
          "type": "files",
          "mediaType": "application/json",
          "size": 0,
          "limit": 1000,
          "offset": 0
        }
      },
      "positions": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/positions",
          "type": "payrollposition",
          "mediaType": "application/json",
          "size": 1,
          "limit": 1000,
          "offset": 0
        }
      },
      "startPayrollPeriod": "2026-03-24 00:00:00.000",
      "endPayrollPeriod": "2026-03-25 23:59:59.000"
}
```

> Example request for creating a Payroll with additional fields

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/payroll" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '{
            "organization": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                    "type": "organization",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
                }
            },
            "owner": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/employee/be4118c7-fda6-11f0-2555-e5d500000055",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                    "type": "employee",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#employee/edit?id=be4118c7-fda6-11f0-2555-e5d500000055"
                }
            },
            "shared": true,
            "moment": "2028-03-25 19:03:00.000",
            "applicable": true,
            "positions": [
                {
                    "employee": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/employee/e7b29e11-17d4-11f1-4095-ec9f00000027",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                            "type": "employee",
                            "mediaType": "application/json",
                            "uuidHref": "https://app.kladana.com/app/#employee/edit?id=e7b29e11-17d4-11f1-4095-ec9f00000027"
                        }
                    },
                    "baseSalary": 202000.0,
                    "pieceworkSalary": 202000.0
                }
            ],
            "attributes": [
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata/attributes/632bfc07-2861-11f1-ea19-6ef300000006",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "value": "attribute value"
                }
            ],
            "startPayrollPeriod": "2026-03-24 00:00:00.000",
            "endPayrollPeriod": "2026-03-25 23:59:59.000"
        }'
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the created Payroll.

```json
{
    "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/c760c87d-2861-11f1-cc6f-b56e00000016",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata",
        "type": "payroll",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#payroll/edit?id=c760c87d-2861-11f1-cc6f-b56e00000016"
    },
    "id": "c760c87d-2861-11f1-cc6f-b56e00000016",
    "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
    "owner": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/employee/be4118c7-fda6-11f0-2555-e5d500000055",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
            "type": "employee",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.com/app/#employee/edit?id=be4118c7-fda6-11f0-2555-e5d500000055"
        }
    },
    "shared": true,
    "group": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/group/bc657ddf-fda6-11f0-4e60-ea2900000002",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
            "type": "group",
            "mediaType": "application/json"
        }
    },
    "updated": "2026-03-25 20:16:34.655",
    "name": "second1",
    "externalCode": "5gxUJ5yfhkqmP5NiUCjhX3",
    "moment": "2028-03-25 19:03:00.000",
    "applicable": true,
    "sum": 404000.0,
    "organization": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
            "type": "organization",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
        }
    },
    "attributes": [
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata/attributes/632bfc07-2861-11f1-ea19-6ef300000006",
                "type": "attributemetadata",
                "mediaType": "application/json"
            },
            "id": "632bfc07-2861-11f1-ea19-6ef300000006",
            "name": "attribute",
            "type": "string",
            "value": "attribute value"
        }
    ],
    "created": "2026-03-25 20:16:34.695",
    "printed": false,
    "published": false,
    "files": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/c760c87d-2861-11f1-cc6f-b56e00000016/files",
            "type": "files",
            "mediaType": "application/json",
            "size": 0,
            "limit": 1000,
            "offset": 0
        }
    },
    "positions": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/c760c87d-2861-11f1-cc6f-b56e00000016/positions",
            "type": "payrollposition",
            "mediaType": "application/json",
            "size": 1,
            "limit": 1000,
            "offset": 0
        }
    },
    "startPayrollPeriod": "2026-03-24 00:00:00.000",
    "endPayrollPeriod": "2026-03-25 23:59:59.000"
}
```

> Example request for creating a Payroll with items in the request body

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/payroll" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '{
            "organization": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                    "type": "organization",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
                }
            },
            "positions": [
                {
                    "employee": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/employee/e7b29e11-17d4-11f1-4095-ec9f00000027",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                            "type": "employee",
                            "mediaType": "application/json",
                            "uuidHref": "https://app.kladana.com/app/#employee/edit?id=e7b29e11-17d4-11f1-4095-ec9f00000027"
                        }
                    },
                    "baseSalary": 22000.0,
                    "pieceworkSalary": 22000.0
                }
            ],
            "startPayrollPeriod": "2026-03-24 00:00:00.000",
            "endPayrollPeriod": "2026-03-25 23:59:59.000"
        }'
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the created Payroll.

```json
{
    "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/af40426e-286a-11f1-cc6f-b56e0000001c",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata",
        "type": "payroll",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#payroll/edit?id=af40426e-286a-11f1-cc6f-b56e0000001c"
    },
    "id": "af40426e-286a-11f1-cc6f-b56e0000001c",
    "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
    "owner": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/employee/be4118c7-fda6-11f0-2555-e5d500000055",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
            "type": "employee",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.com/app/#employee/edit?id=be4118c7-fda6-11f0-2555-e5d500000055"
        }
    },
    "shared": false,
    "group": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/group/bc657ddf-fda6-11f0-4e60-ea2900000002",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
            "type": "group",
            "mediaType": "application/json"
        }
    },
    "updated": "2026-03-26 08:00:55.482",
    "name": "00007",
    "externalCode": "870W7fEMihDT8bYyUwh0q3",
    "moment": "2026-03-26 08:00:00.000",
    "applicable": true,
    "sum": 44000.0,
    "organization": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
            "type": "organization",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
        }
    },
    "created": "2026-03-26 08:00:55.539",
    "printed": false,
    "published": false,
    "files": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/af40426e-286a-11f1-cc6f-b56e0000001c/files",
            "type": "files",
            "mediaType": "application/json",
            "size": 0,
            "limit": 1000,
            "offset": 0
        }
    },
    "positions": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/af40426e-286a-11f1-cc6f-b56e0000001c/positions",
            "type": "payrollposition",
            "mediaType": "application/json",
            "size": 1,
            "limit": 1000,
            "offset": 0
        }
    },
    "startPayrollPeriod": "2026-03-24 00:00:00.000",
    "endPayrollPeriod": "2026-03-25 23:59:59.000"
}
```

### Bulk creating and update of Payrolls

[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Payrolls.

In the request body, pass an array containing JSON representations of the Payrolls you want to create or update. Payrolls being updated must contain an identifier in the metadata.

> Example of creating and updating several Payrolls

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/payroll" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '[
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/63643c49-286c-11f1-cc6f-b56e00000021",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata",
                    "type": "payroll",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#payroll/edit?id=63643c49-286c-11f1-cc6f-b56e00000021"
                },
                "name": "updated",
                "positions": [
                    {
                        "employee": {
                            "meta": {
                                "href": "https://api.kladana.com/api/remap/1.2/entity/employee/e7b29e11-17d4-11f1-4095-ec9f00000027",
                                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                                "type": "employee",
                                "mediaType": "application/json",
                                "uuidHref": "https://app.kladana.com/app/#employee/edit?id=e7b29e11-17d4-11f1-4095-ec9f00000027"
                            }
                        },
                        "baseSalary": 22000.0,
                        "pieceworkSalary": 22000.0
                    }
                ],
                "startPayrollPeriod": "2026-03-24 00:00:00.000",
                "endPayrollPeriod": "2026-03-25 23:59:59.000"
            },
            {
                "organization": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                        "type": "organization",
                        "mediaType": "application/json",
                        "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
                    }
                },
                "positions": [
                    {
                        "employee": {
                            "meta": {
                                "href": "https://api.kladana.com/api/remap/1.2/entity/employee/e7b29e11-17d4-11f1-4095-ec9f00000027",
                                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                                "type": "employee",
                                "mediaType": "application/json",
                                "uuidHref": "https://app.kladana.com/app/#employee/edit?id=e7b29e11-17d4-11f1-4095-ec9f00000027"
                            }
                        },
                        "baseSalary": 1000.0,
                        "pieceworkSalary": 1000.0
                    }
                ],
                "startPayrollPeriod": "2026-03-24 00:00:00.000",
                "endPayrollPeriod": "2026-03-25 23:59:59.000"
            }
        ]'
```

> Response 200 (application/json)
Successful request. The result is an array of JSON representations of the created and updated Payrolls.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/63643c49-286c-11f1-cc6f-b56e00000021",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata",
      "type": "payroll",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#payroll/edit?id=63643c49-286c-11f1-cc6f-b56e00000021"
    },
    "id": "63643c49-286c-11f1-cc6f-b56e00000021",
    "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
    "owner": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/be4118c7-fda6-11f0-2555-e5d500000055",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=be4118c7-fda6-11f0-2555-e5d500000055"
      }
    },
    "shared": false,
    "group": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/group/bc657ddf-fda6-11f0-4e60-ea2900000002",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
        "type": "group",
        "mediaType": "application/json"
      }
    },
    "updated": "2026-03-26 08:15:15.045",
    "name": "updated",
    "externalCode": "8B0hkZJtgbNpQLsxmVdWV1",
    "moment": "2026-03-26 08:13:00.000",
    "applicable": true,
    "sum": 44000.0,
    "organization": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
        "type": "organization",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
      }
    },
    "created": "2026-03-26 08:13:07.269",
    "printed": false,
    "published": false,
    "files": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/63643c49-286c-11f1-cc6f-b56e00000021/files",
        "type": "files",
        "mediaType": "application/json",
        "size": 0,
        "limit": 1000,
        "offset": 0
      }
    },
    "positions": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/63643c49-286c-11f1-cc6f-b56e00000021/positions",
        "type": "payrollposition",
        "mediaType": "application/json",
        "size": 1,
        "limit": 1000,
        "offset": 0
      }
    },
    "startPayrollPeriod": "2026-03-24 00:00:00.000",
    "endPayrollPeriod": "2026-03-25 23:59:59.000"
  },
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/afa16f60-286c-11f1-cc6f-b56e0000002d",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata",
      "type": "payroll",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#payroll/edit?id=afa16f60-286c-11f1-cc6f-b56e0000002d"
    },
    "id": "afa16f60-286c-11f1-cc6f-b56e0000002d",
    "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
    "owner": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/be4118c7-fda6-11f0-2555-e5d500000055",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=be4118c7-fda6-11f0-2555-e5d500000055"
      }
    },
    "shared": false,
    "group": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/group/bc657ddf-fda6-11f0-4e60-ea2900000002",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
        "type": "group",
        "mediaType": "application/json"
      }
    },
    "updated": "2026-03-26 08:15:15.156",
    "name": "updated1",
    "externalCode": "-EyS840IieIkPeUdWixmP2",
    "moment": "2026-03-26 08:15:00.000",
    "applicable": true,
    "sum": 2000.0,
    "organization": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
        "type": "organization",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
      }
    },
    "created": "2026-03-26 08:15:15.185",
    "printed": false,
    "published": false,
    "files": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/afa16f60-286c-11f1-cc6f-b56e0000002d/files",
        "type": "files",
        "mediaType": "application/json",
        "size": 0,
        "limit": 1000,
        "offset": 0
      }
    },
    "positions": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/afa16f60-286c-11f1-cc6f-b56e0000002d/positions",
        "type": "payrollposition",
        "mediaType": "application/json",
        "size": 1,
        "limit": 1000,
        "offset": 0
      }
    },
    "startPayrollPeriod": "2026-03-24 00:00:00.000",
    "endPayrollPeriod": "2026-03-25 23:59:59.000"
  }
]
```

### Delete Payroll

**Parameters**

| Parameter | Description                                                                                 |
|-----------|---------------------------------------------------------------------------------------------|
| **id**    | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Payroll ID. |

> Request to delete the Payroll with the specified ID

```shell
curl --compressed -X DELETE \
  "https://api.kladana.com/api/remap/1.2/entity/payroll/7944ef04-f831-11e5-7a69-971500188b19" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
The Payroll was deleted successfully.

### Payroll Metadata

Request to get Payroll metadata. The result is a JSON object that includes:

| Parameter        | Description                                                                 |
|------------------|-----------------------------------------------------------------------------|
| **attributes**   | Array of Payroll additional field objects in [Metadata](../#kladana-json-api-general-info-metadata) format |
| **createShared** | Create new Payrolls with the "Shared" flag                          |
| **meta**         | Payroll metadata link                                               |
| **states**       | Array of Payroll statuses                                           |

The structure of an individual additional field object is described in detail in the [Additional fields](../#kladana-json-api-general-info-additional-fields) section.

> Payroll Metadata

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of Payroll metadata.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata",
    "mediaType": "application/json"
  },
  "attributes": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata/attributes",
      "type": "attributemetadata",
      "mediaType": "application/json",
      "size": 1,
      "limit": 1000,
      "offset": 0
    }
  },
  "states": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata/states/615bd402-1dd2-11f1-994a-b7f800000002",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata",
        "type": "state",
        "mediaType": "application/json"
      },
      "id": "615bd402-1dd2-11f1-994a-b7f800000002",
      "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
      "name": "Regular",
      "color": 10066329,
      "stateType": "Regular",
      "entityType": "payroll"
    }
  ],
  "createShared": false
}
```

### Bulk deletion of Payrolls

In the request body, pass an array containing JSON metadata of the Payrolls you want to delete.

> Request to bulk delete Payrolls

```shell
curl --compressed -X POST \
  "https://api.kladana.com/api/remap/1.2/entity/payroll/delete" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip" \
  -H "Content-Type: application/json" \
  -d '[
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/7944ef04-f831-11e5-7a69-971500188b1",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata",
            "type": "payroll",
            "mediaType": "application/json"
          }
        },
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/7944ef04-f831-11e5-7a69-971500188b2",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata",
            "type": "payroll",
            "mediaType": "application/json"
          }
        }
      ]'
```

> Response 200 (application/json)
Successful request. The result is JSON information about the deleted Payrolls.

```json
[
  {
    "info": "Entity 'payroll' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
  },
  {
    "info": "Entity 'payroll' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
  }
]
```

### Separate additional field

**Parameters**

| Parameter | Description                                                                                |
|-----------|--------------------------------------------------------------------------------------------|
| **id**    | `string` (required) *Example: 632bfc07-2861-11f1-ea19-6ef300000006* Additional field ID. |

#### Requests - Separate additional field

> Request to get information about a separate additional field

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata/attributes/632bfc07-2861-11f1-ea19-6ef300000006" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the separate additional field.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata/attributes/632bfc07-2861-11f1-ea19-6ef300000006",
    "type": "attributemetadata",
    "mediaType": "application/json"
  },
  "id": "632bfc07-2861-11f1-ea19-6ef300000006",
  "name": "attribute",
  "type": "string",
  "required": false,
  "show": true
}
```

### Payroll

### Get Payroll

**Parameters**

| Parameter | Description                                                                                 |
|-----------|---------------------------------------------------------------------------------------------|
| **id**    | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Payroll ID. |

> Request to get a separate Payroll with the specified ID

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/payroll/946f8595-17c3-11f1-4095-ec9f00000001" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the Payroll.

```json
{
    "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/946f8595-17c3-11f1-4095-ec9f00000001",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata",
        "type": "payroll",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#payroll/edit?id=946f8595-17c3-11f1-4095-ec9f00000001"
    },
    "id": "946f8595-17c3-11f1-4095-ec9f00000001",
    "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
    "owner": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/employee/be4118c7-fda6-11f0-2555-e5d500000055",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
            "type": "employee",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.com/app/#employee/edit?id=be4118c7-fda6-11f0-2555-e5d500000055"
        }
    },
    "shared": false,
    "group": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/group/bc657ddf-fda6-11f0-4e60-ea2900000002",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
            "type": "group",
            "mediaType": "application/json"
        }
    },
    "updated": "2026-03-12 08:15:10.678",
    "name": "00001",
    "externalCode": "EX0JefwKhGFRrJ7uS95aI0",
    "moment": "2026-03-04 15:13:00.000",
    "applicable": true,
    "sum": 60000.0,
    "organization": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
            "type": "organization",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
        }
    },
    "state": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata/states/615bd402-1dd2-11f1-994a-b7f800000002",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata",
            "type": "state",
            "mediaType": "application/json"
        }
    },
    "created": "2026-03-04 15:13:40.158",
    "printed": false,
    "published": false,
    "files": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/946f8595-17c3-11f1-4095-ec9f00000001/files",
            "type": "files",
            "mediaType": "application/json",
            "size": 0,
            "limit": 1000,
            "offset": 0
        }
    },
    "positions": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/946f8595-17c3-11f1-4095-ec9f00000001/positions",
            "type": "payrollposition",
            "mediaType": "application/json",
            "size": 2,
            "limit": 1000,
            "offset": 0
        }
    },
    "startPayrollPeriod": "2026-03-03 00:00:00.000",
    "endPayrollPeriod": "2026-03-04 23:59:59.000"
}
```

### Change Payroll

Request to update the Payroll with the specified ID. In the request body, specify only the fields that need to be changed, except for fields marked as `Read Only` in the entity attributes description.

**Parameters**

| Parameter | Description                                                                                 |
|-----------|---------------------------------------------------------------------------------------------|
| **id**    | `string` (required) *Example: 4ee9ddd8-285d-11f1-cc6f-b56e00000011* Payroll ID. |

> Example request to update a separate Payroll

```shell
  curl --compressed -X PUT \
    "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '{
            "organization": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                    "type": "organization",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
                }
            },
            "name": "putSecondesss",
            "startPayrollPeriod": "2026-03-24 00:00:00.000",
            "endPayrollPeriod": "2026-03-25 23:59:59.000"
        }'
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the updated Payroll.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata",
    "type": "payroll",
    "mediaType": "application/json",
    "uuidHref": "https://app.kladana.com/app/#payroll/edit?id=4ee9ddd8-285d-11f1-cc6f-b56e00000011"
  },
  "id": "4ee9ddd8-285d-11f1-cc6f-b56e00000011",
  "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/be4118c7-fda6-11f0-2555-e5d500000055",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=be4118c7-fda6-11f0-2555-e5d500000055"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/bc657ddf-fda6-11f0-4e60-ea2900000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2026-03-27 09:44:41.770",
  "name": "putSecondesss",
  "externalCode": "VpV4ADEPgtvGZSwcvakJg1",
  "moment": "2028-03-25 19:03:00.000",
  "applicable": true,
  "sum": 404000.0,
  "organization": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
      "type": "organization",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
    }
  },
  "created": "2026-03-25 19:44:34.603",
  "printed": false,
  "published": false,
  "files": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/files",
      "type": "files",
      "mediaType": "application/json",
      "size": 0,
      "limit": 1000,
      "offset": 0
    }
  },
  "positions": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/positions",
      "type": "payrollposition",
      "mediaType": "application/json",
      "size": 1,
      "limit": 1000,
      "offset": 0
    }
  },
  "startPayrollPeriod": "2026-03-24 00:00:00.000",
  "endPayrollPeriod": "2026-03-25 23:59:59.000"
}
```

> Example request to update a Payroll with additional fields

```shell
  curl --compressed -X PUT \
    "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '{
            "organization": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                    "type": "organization",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
                }
            },
            "name": "putSecondesss",
            "startPayrollPeriod": "2026-03-24 00:00:00.000",
            "endPayrollPeriod": "2026-03-25 23:59:59.000",
            "attributes": [
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata/attributes/632bfc07-2861-11f1-ea19-6ef300000006",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "value": "Updated Attribute"
                }
            ]
        }'
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the updated Payroll.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata",
    "type": "payroll",
    "mediaType": "application/json",
    "uuidHref": "https://app.kladana.com/app/#payroll/edit?id=4ee9ddd8-285d-11f1-cc6f-b56e00000011"
  },
  "id": "4ee9ddd8-285d-11f1-cc6f-b56e00000011",
  "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/be4118c7-fda6-11f0-2555-e5d500000055",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=be4118c7-fda6-11f0-2555-e5d500000055"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/bc657ddf-fda6-11f0-4e60-ea2900000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2026-03-27 09:44:41.770",
  "name": "putSecondesss",
  "externalCode": "VpV4ADEPgtvGZSwcvakJg1",
  "moment": "2028-03-25 19:03:00.000",
  "applicable": true,
  "sum": 404000.0,
  "organization": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
      "type": "organization",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
    }
  },
  "attributes": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata/attributes/632bfc07-2861-11f1-ea19-6ef300000006",
        "type": "attributemetadata",
        "mediaType": "application/json"
      },
      "id": "632bfc07-2861-11f1-ea19-6ef300000006",
      "name": "attribute",
      "type": "string",
      "value": "Updated Attribute"
    }
  ],
  "created": "2026-03-25 19:44:34.603",
  "printed": false,
  "published": false,
  "files": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/files",
      "type": "files",
      "mediaType": "application/json",
      "size": 0,
      "limit": 1000,
      "offset": 0
    }
  },
  "positions": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/positions",
      "type": "payrollposition",
      "mediaType": "application/json",
      "size": 1,
      "limit": 1000,
      "offset": 0
    }
  },
  "startPayrollPeriod": "2026-03-24 00:00:00.000",
  "endPayrollPeriod": "2026-03-25 23:59:59.000"
}
```

> Example request to update a Payroll with items in the request body

```shell
  curl --compressed -X PUT \
    "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '{
            "organization": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                    "type": "organization",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
                }
            },
            "positions": [
                {
                    "employee": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/employee/e7b29e11-17d4-11f1-4095-ec9f00000027",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                            "type": "employee",
                            "mediaType": "application/json",
                            "uuidHref": "https://app.kladana.com/app/#employee/edit?id=e7b29e11-17d4-11f1-4095-ec9f00000027"
                        }
                    },
                    "baseSalary": 200.00,
                    "pieceworkSalary": 300.0
                }
            ],
            "startPayrollPeriod": "2026-03-24 00:00:00.000",
            "endPayrollPeriod": "2026-03-25 23:59:59.000"
        }'
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the updated Payroll.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata",
    "type": "payroll",
    "mediaType": "application/json",
    "uuidHref": "https://app.kladana.com/app/#payroll/edit?id=4ee9ddd8-285d-11f1-cc6f-b56e00000011"
  },
  "id": "4ee9ddd8-285d-11f1-cc6f-b56e00000011",
  "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/be4118c7-fda6-11f0-2555-e5d500000055",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=be4118c7-fda6-11f0-2555-e5d500000055"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/bc657ddf-fda6-11f0-4e60-ea2900000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2026-03-27 09:54:21.536",
  "name": "putSecondesss",
  "externalCode": "VpV4ADEPgtvGZSwcvakJg1",
  "moment": "2028-03-25 19:03:00.000",
  "applicable": true,
  "sum": 500.0,
  "organization": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/organization/be919d95-fda6-11f0-2555-e5d5000000a1",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
      "type": "organization",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=be919d95-fda6-11f0-2555-e5d5000000a1"
    }
  },
  "attributes": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/metadata/attributes/632bfc07-2861-11f1-ea19-6ef300000006",
        "type": "attributemetadata",
        "mediaType": "application/json"
      },
      "id": "632bfc07-2861-11f1-ea19-6ef300000006",
      "name": "attribute",
      "type": "string",
      "value": "Updated Attribute"
    }
  ],
  "created": "2026-03-25 19:44:34.603",
  "printed": false,
  "published": false,
  "files": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/files",
      "type": "files",
      "mediaType": "application/json",
      "size": 0,
      "limit": 1000,
      "offset": 0
    }
  },
  "positions": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/positions",
      "type": "payrollposition",
      "mediaType": "application/json",
      "size": 1,
      "limit": 1000,
      "offset": 0
    }
  },
  "startPayrollPeriod": "2026-03-24 00:00:00.000",
  "endPayrollPeriod": "2026-03-25 23:59:59.000"
}
```

### Payroll Item Management

Separate resources for managing Payroll items. You can use them to manage items of a large transaction when the number of rows exceeds the limit for rows saved together with the transaction. This limit is 1000. Learn more about limits on the number of transaction rows and working with large transactions in [Working with transaction items](../#kladana-json-api-general-info-working-with-transaction-items).

### Get Items

Request to get a list of all items for the specified Payroll.

| Title       | Type                                               | Description                                           |
|-------------|----------------------------------------------------|-------------------------------------------------------|
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the employee who made the request.        |
| **meta**    | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata.                                    |
| **rows**    | Array(Object)                                      | An array of JSON objects representing Payroll items.  |

**Parameters**

| Parameter  | Description                                                                                                                         |
|------------|-------------------------------------------------------------------------------------------------------------------------------------|
| **id**     | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Payroll ID.                                         |
| **limit**  | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Offset in the list of returned entities.                                         |

> Get Items

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/payroll/946f8595-17c3-11f1-4095-ec9f00000001/positions" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the items list for a separate Payroll.

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
        "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/946f8595-17c3-11f1-4095-ec9f00000001/positions",
        "type": "payrollposition",
        "mediaType": "application/json",
        "size": 2,
        "limit": 1000,
        "offset": 0
    },
    "rows": [
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/946f8595-17c3-11f1-4095-ec9f00000001/positions/04955880-17d5-11f1-4095-ec9f00000030",
                "type": "payrollposition",
                "mediaType": "application/json"
            },
            "id": "04955880-17d5-11f1-4095-ec9f00000030",
            "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
            "employee": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/employee/e7b29e11-17d4-11f1-4095-ec9f00000027",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                    "type": "employee",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#employee/edit?id=e7b29e11-17d4-11f1-4095-ec9f00000027"
                }
            },
            "baseSalary": 100.0,
            "pieceworkSalary": 100.0
        },
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/946f8595-17c3-11f1-4095-ec9f00000001/positions/049567ca-17d5-11f1-4095-ec9f00000031",
                "type": "payrollposition",
                "mediaType": "application/json"
            },
            "id": "049567ca-17d5-11f1-4095-ec9f00000031",
            "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
            "employee": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/employee/be4118c7-fda6-11f0-2555-e5d500000055",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                    "type": "employee",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#employee/edit?id=be4118c7-fda6-11f0-2555-e5d500000055"
                }
            },
            "baseSalary": 200.0,
            "pieceworkSalary": 200.0
        }
    ]
}
```

### Payroll Item

### Get Item

**Parameters**

| Parameter      | Description                                                                                         |
|----------------|-----------------------------------------------------------------------------------------------------|
| **id**         | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Payroll ID.         |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b20* Payroll item ID. |

> Request to get a separate Payroll item with the specified ID

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/payroll/946f8595-17c3-11f1-4095-ec9f00000001/positions/04955880-17d5-11f1-4095-ec9f00000030" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the separate Payroll item.

```json
{
    "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/946f8595-17c3-11f1-4095-ec9f00000001/positions/04955880-17d5-11f1-4095-ec9f00000030",
        "type": "payrollposition",
        "mediaType": "application/json"
    },
    "id": "04955880-17d5-11f1-4095-ec9f00000030",
    "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
    "employee": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/employee/e7b29e11-17d4-11f1-4095-ec9f00000027",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
            "type": "employee",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.com/app/#employee/edit?id=e7b29e11-17d4-11f1-4095-ec9f00000027"
        }
    },
    "baseSalary": 100.0,
    "pieceworkSalary": 100.0
}
```

### Create Item

Request to create a new item in a Payroll.

For successful creation, specify the following fields in the request body:

+ **employee** - Reference to the employee represented by the item.
+ **baseSalary** - Base salary accrual for the employee. Must be positive, otherwise an error occurs. Rounded to the integer part.
+ **pieceworkSalary** - Piecework pay accrual for the employee. Must be positive, otherwise an error occurs. Rounded to the integer part.

**Parameters**

| Parameter | Description                                                                                 |
|-----------|---------------------------------------------------------------------------------------------|
| **id**    | `string` (required) *Example: 4ee9ddd8-285d-11f1-cc6f-b56e00000011* Payroll ID. |

> Example of creating one item in a Payroll

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/positions" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '{
            "employee": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/employee/be4118c7-fda6-11f0-2555-e5d500000055",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                    "type": "employee",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#employee/edit?id=be4118c7-fda6-11f0-2555-e5d500000055"
                }
            },
            "baseSalary": 2000.00,
            "pieceworkSalary": 3000.0
        }'
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the created item in a separate Payroll.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/positions/bd6c1d53-293b-11f1-3484-ec2700000017",
      "type": "payrollposition",
      "mediaType": "application/json"
    },
    "id": "bd6c1d53-293b-11f1-3484-ec2700000017",
    "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
    "employee": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/be4118c7-fda6-11f0-2555-e5d500000055",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=be4118c7-fda6-11f0-2555-e5d500000055"
      }
    },
    "baseSalary": 2000.0,
    "pieceworkSalary": 3000.0
  }
]
```

> Example of creating several items in a Payroll

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/positions" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '[
            {
                "employee": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/7b0d82db-2bf3-11f1-37a8-e68f00000004",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                        "type": "employee",
                        "mediaType": "application/json",
                        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=7b0d82db-2bf3-11f1-37a8-e68f00000004"
                    }
                },
                "baseSalary": 2000.00,
                "pieceworkSalary": 3000.0
            },
            {
                "employee": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/960fd277-2bf3-11f1-37a8-e68f00000008",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                        "type": "employee",
                        "mediaType": "application/json",
                        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=960fd277-2bf3-11f1-37a8-e68f00000008"
                    }
                },
                "baseSalary": 2010.00,
                "pieceworkSalary": 5000.0
            }
        ]'
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the created items list for a separate Payroll.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/positions/defaedc9-2bf3-11f1-37a8-e68f0000000c",
      "type": "payrollposition",
      "mediaType": "application/json"
    },
    "id": "defaedc9-2bf3-11f1-37a8-e68f0000000c",
    "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
    "employee": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/7b0d82db-2bf3-11f1-37a8-e68f00000004",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=7b0d82db-2bf3-11f1-37a8-e68f00000004"
      }
    },
    "baseSalary": 2000.00,
    "pieceworkSalary": 3000.00
  },
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/positions/defb003f-2bf3-11f1-37a8-e68f0000000d",
      "type": "payrollposition",
      "mediaType": "application/json"
    },
    "id": "defb003f-2bf3-11f1-37a8-e68f0000000d",
    "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
    "employee": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/960fd277-2bf3-11f1-37a8-e68f00000008",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=960fd277-2bf3-11f1-37a8-e68f00000008"
      }
    },
    "baseSalary": 2010.00,
    "pieceworkSalary": 5000.00
  }
]
```

### Change Item

Request to update a separate Payroll item. There are no required fields for updating an item. Specify only the fields you want to update.

**Parameters**

| Parameter      | Description                                                                                         |
|----------------|-----------------------------------------------------------------------------------------------------|
| **id**         | `string` (required) *Example: 4ee9ddd8-285d-11f1-cc6f-b56e00000011* Payroll ID.         |
| **positionID** | `string` (required) *Example: defb003f-2bf3-11f1-37a8-e68f0000000d* Payroll item ID. |

> Example request to update a separate Payroll item

```shell
  curl --compressed -X PUT \
    "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/positions/defb003f-2bf3-11f1-37a8-e68f0000000d" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '    {
                "baseSalary": 20.0,
                "pieceworkSalary": 5000.0
            }'
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the updated Payroll item.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/positions/defb003f-2bf3-11f1-37a8-e68f0000000d",
    "type": "payrollposition",
    "mediaType": "application/json"
  },
  "id": "defb003f-2bf3-11f1-37a8-e68f0000000d",
  "accountId": "bc637f03-fda6-11f0-4e60-ea2900000001",
  "employee": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/960fd277-2bf3-11f1-37a8-e68f00000008",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=960fd277-2bf3-11f1-37a8-e68f00000008"
    }
  },
  "baseSalary": 20.00,
  "pieceworkSalary": 5000.00
}
```

### Delete Item

**Parameters**

| Parameter      | Description                                                                                         |
|----------------|-----------------------------------------------------------------------------------------------------|
| **id**         | `string` (required) *Example: 4ee9ddd8-285d-11f1-cc6f-b56e00000011* Payroll ID.         |
| **positionID** | `string` (required) *Example: defb003f-2bf3-11f1-37a8-e68f0000000d* Payroll item ID. |

> Request to delete a separate Payroll item with the specified ID

```shell
curl --compressed -X DELETE \
  "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/positions/defb003f-2bf3-11f1-37a8-e68f0000000d" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
The Payroll item was deleted successfully.

### Bulk deletion of items

**Parameters**

| Parameter | Description                                                                                 |
|-----------|---------------------------------------------------------------------------------------------|
| **id**    | `string` (required) *Example: 4ee9ddd8-285d-11f1-cc6f-b56e00000011* Payroll ID. |

> Request to bulk delete Payroll items

```shell
curl --compressed -X POST \
  "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/positions/delete" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip" \
  -H "Content-Type: application/json" \
  -d '[
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/positions/7fce2da5-684d-11ee-ac12-000c000000a2",
            "type": "payrollposition",
            "mediaType": "application/json"
          }
        },
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/payroll/4ee9ddd8-285d-11f1-cc6f-b56e00000011/positions/7fce37a5-684d-11ee-ac12-000c000000a3",
            "type": "payrollposition",
            "mediaType": "application/json"
          }
        }
      ]'
```

> Response 200 (application/json)
Payroll items were deleted successfully.
