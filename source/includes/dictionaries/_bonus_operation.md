## Bonus operation
### Bonus operations

Using the JSON API, you can create and update information about Bonus Operations, request lists of Bonus Operations and information on individual Bonus Operations. The entity code for a Bonus Transaction as part of the JSON API is the **bonustransaction** keyword.

##### Entity attributes

| Title                 | Type                                               | Filtering                  | Description                                                                                                                         |
|-----------------------|----------------------------------------------------|----------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| **accountId**         | UUID                                               | `=` `!=`                   | Account ID<br>`+Required when answering` `+Read Only`                                                                               |
| **agent**             | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                   | Metadata of the Counterparty associated with the bonus operation<br>`+Required when answering` `+Expand` `+Required when creating`  |
| **applicable**        | Boolean                                            | `=` `!=`                   | Check mark<br>`+Required when answering`                                                                                            |
| **bonusProgram**      | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                   | Bonus program metadata<br>`+Expand`                                                                                                 |
| **bonusValue**        | Int                                                | `=` `!=` `<` `>` `<=` `>=` | Number of bonus points                                                                                                              |
| **categoryType**      | Enum                                               |                            | Bonus operation category. Possible values: `REGULAR`, `WELCOME`<br>`+Read Only`                                                     |
| **code**              | String(255)                                        | `=` `!=` `~` `~=` `=~`     | Bonus Transaction Code                                                                                                              |
| **created**           | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Moment of Bonus operation creation<br>`+Required when answering` `+Read Only`                                                       |
| **description**       | String(4096)                                       | `=` `!=` `~` `~=` `=~`     | Comment to Bonus Operations                                                                                                         |
| **executionDate**     | DateTime                                           |                            | Date of the bonus operation                                                                                                         |
| **externalCode**      | String(255)                                        | `=` `!=` `~` `~=` `=~`     | External code of the Bonus operation<br>`+Required when replying`                                                                   |
| **group**             | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                   | Employee's department<br>`+Required when replying` `+Expand`                                                                        |
| **id**                | UUID                                               | `=` `!=`                   | Bonus transaction ID<br>`+Required when replying` `+Read-only`                                                                      |
| **meta**              | [Meta](../#kladana-json-api-general-info-metadata) |                            | Bonus operation metadata<br>`+Required when replying`                                                                               |
| **moment**            | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Time of the bonus operation                                                                                                         |
| **name**              | String(255)                                        | `=` `!=` `~` `~=` `=~`     | Name of the Bonus transaction                                                                                                       |
| **organization**      | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                   | Legal entity metadata<br>`+Expand`                                                                                                  |
| **owner**             | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                   | Owner (Employee)<br>`+Expand`                                                                                                       |
| **parentDocument**    | [Meta](../#kladana-json-api-general-info-metadata) |                            | St. Metadataof the linked document of the bonus operation<br>`+Expand`                                                              |
| **shared**            | Boolean                                            | `=` `!=`                   | Sharing<br>`+Required when answering`                                                                                               |
| **transactionStatus** | Enum                                               |                            | Status of the bonus operation. Possible values: `WAIT_PROCESSING`, `COMPLETED`, `CANCELED`<br>`+Read Only`                          |
| **transactionType**   | Enum                                               |                            | Type of bonus operation. Possible values: `EARNING`, `SPENDING`<br>`+Required when answering` `+Required when creating`             |
| **updated**           | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Moment of the last update of the Bonus operation<br>`+Required when answering`                                                      |
| **updatedBy**         | UID                                                | `=` `!=`                   | The author of the last update of the bonus operation in the format `uid` (`admin@admin`) (The attribute is used only for filtering) |

##### The "executionDate" attribute
When creating or editing a bonus accrual transaction, this attribute allows you to specify the transaction processing date.
If the attribute is not specified, then the operation will be processed immediately, without delay.

To be able to specify the date of processing in the future, the tariff option "Extended bonus program" must be enabled.


### Get Bonus Transactions

Request for a list of all Bonus Operations for this account.
Result: JSON object including fields:

| Title | Type | Description |
| ----------- | ------------- | -------------------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Bonus Operations. |

**Parameters**

| Parameter | Description |
| --------- | ------------|
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Bonus Transactions

```shell
curl --compressed -X GET \
   "https://api.kladana.com/api/remap/1.2/entity/bonustransaction" \
   -H "Authorization: Basic <Credentials>" \
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Bonus Operations.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/?limit=5",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/metadata",
    "type": "bonustransaction",
    "mediaType": "application/json",
    "size": 4,
    "limit": 5,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/7c6ecd51-b738-11e8-727d-307300000028",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/metadata",
        "type": "bonustransaction",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#bonustransaction/edit?id=7c6ecd51-b738-11e8-727d-307300000028"
      },
      "id": "7c6ecd51-b738-11e8-727d-307300000028",
      "accountId": "ba5d8717-d6e7-4741-9f2e-4e343a447fb9",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/4a980e02-b685-11e8-727d-30730000002b",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=4a980e02-b685-11e8-727d-30730000002b"
        }
      },
      "shared": false,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/4427b6f1-b685-11e8-727d-307300000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2018-09-13 12:36:26",
      "name": "d00001",
      "externalCode": "htdrUVpciRX4kldKIN7VL0",
      "moment": "2018-09-13 12:36:26",
      "applicable": true,
      "agent": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9fea1d90-d488-4271-97bc-a9ad1b9fbcc0",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
          "type": "counterparty",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#company/edit?id=9fea1d90-d488-4271-97bc-a9ad1b9fbcc0"
        }
      },
      "created": "2018-09-13 12:36:26",
      "bonusProgram": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/956f6ff7-718f-4849-be47-7509fdd18db9",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/metadata",
          "type": "bonusprogram",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#discount/edit?id=956f6ff7-718f-4849-be47-7509fdd18db9"
        }
      },
      "bonusValue": 15,
      "transactionType": "EARNING",
      "transactionStatus": "COMPLETED",
      "executionDate": "2021-05-03 12:20:32",
      "categoryType": "REGULAR"
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/7c6ecd51-b738-11e8-727d-307300000029",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/metadata",
        "type": "bonustransaction",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#bonustransaction/edit?id=7c6ecd51-b738-11e8-727d-307300000029"
      },
      "id": "7c6ecd51-b738-11e8-727d-307300000029",
      "accountId": "ba5d8717-d6e7-4741-9f2e-4e343a447fb9",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/4a980e02-b685-11e8-727d-30730000002b",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=4a980e02-b685-11e8-727d-30730000002b"
        }
      },
      "shared": false,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/4427b6f1-b685-11e8-727d-307300000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2018-09-13 12:36:26",
      "name": "updated_name",
      "externalCode": "atdrUVpciRX4kljKIN7iL8",
      "moment": "2018-09-13 12:36:26",
      "applicable": true,
      "agent": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9fea1d90-d488-4271-97bc-a9ad1b9fbcc0",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
          "type": "counterparty",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#company/edit?id=9fea1d90-d488-4271-97bc-a9ad1b9fbcc0"
        }
      },
      "created": "2018-09-13 12:36:26",
      "bonusProgram": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/956f6ff7-718f-4849-be47-7509fdd18db9",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/metadata",
          "type": "bonusprogram",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#discount/edit?id=956f6ff7-718f-4849-be47-7509fdd18db9"
        }
      },
      "bonusValue": 1235,
      "transactionType": "EARNING",
      "transactionStatus": "COMPLETED",
      "executionDate": "2021-05-03 12:20:32",
      "categoryType": "REGULAR"
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/7c6ecd51-b738-11e8-727d-307300000038",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/metadata",
        "type": "bonustransaction",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#bonustransaction/edit?id=7c6ecd51-b738-11e8-727d-307300000038"
      },
      "id": "7c6ecd51-b738-11e8-727d-307300000038",
      "accountId": "ba5d8717-d6e7-4741-9f2e-4e343a447fb9",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/4a980e02-b685-11e8-727d-30730000002b",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=4a980e02-b685-11e8-727d-30730000002b"
        }
      },
      "shared": false,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/4427b6f1-b685-11e8-727d-307300000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2018-09-13 12:36:26",
      "name": "d00003",
      "externalCode": "ald88VpciRX4kkklIN7123",
      "moment": "2018-09-13 12:36:26",
      "applicable": true,
      "agent": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9fea1d90-d488-4271-97bc-a9ad1b9fbcc0",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
          "type": "counterparty",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#company/edit?id=9fea1d90-d488-4271-97bc-a9ad1b9fbcc0"
        }
      },
      "created": "2018-09-13 12:36:26",
      "bonusProgram": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/956f6ff7-718f-4849-be47-7509fdd18db9",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/metadata",
          "type": "bonusprogram",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#discount/edit?id=956f6ff7-718f-4849-be47-7509fdd18db9"
        }
      },
      "bonusValue": 100500,
      "transactionType": "SPENDING",
      "transactionStatus": "COMPLETED",
      "executionDate": "2021-05-03 12:20:32",
      "categoryType": "REGULAR"
    }
  ]
}
```

### Create Bonus Transaction

Request to create a new bonus operation on this account.
Mandatory fields to create:

| Title               | Type | Description |
|---------------------| --------------------- | --------------------- |
| **agent**           | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Counterparty associated with the bonus operation<br>`+Required when answering` `+Expand` `+Required when creating` |
| **bonusProgram**   | [Meta](../#kladana-json-api-general-info-metadata) | Bonus Program Metadata<br>`+Required when answering` `+Expand` `+Required when creating` |
| **transactionType** | Enum | Type of bonus operation<br>`+Required when answering` `+Required when creating` |

> An example of a request to create a new bonus operation.

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/bonustransaction" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '{
            "name": "d00001",
            "applicable": true,
            "agent": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/45457cb8-f473-4618-ab19-2294c328f4ba",
                "type": "counterparty",
                "mediaType": "application/json"
              }
            },
            "bonusProgram": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/fc2666ba-5d39-4a60-8105-4b678180b059",
                "type": "bonusprogram",
                "mediaType": "application/json"
              }
            },
            "parentDocument": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/retaildemand/0b0b7d56-2a44-4aa2-adc2-a49dadd61af0",
                "type": "retaildemand",
                "mediaType": "application/json"
              }
            },
            "transactionType": "EARNING",
            "bonusValue": 15
          }'  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the created bonus operation.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/7c6ecd51-b738-11e8-727d-307300000028",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/metadata",
    "type": "bonustransaction",
    "mediaType": "application/json",
    "uuidHref": "https://app.kladana.com/app/#bonustransaction/edit?id=7c6ecd51-b738-11e8-727d-307300000028"
  },
  "id": "7c6ecd51-b738-11e8-727d-307300000028",
  "accountId": "44245b3a-b685-11e8-727d-307300000001",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/4a980e02-b685-11e8-727d-30730000002b",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=4a980e02-b685-11e8-727d-30730000002b"
    }
  },
  "shared": false,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/4427b6f1-b685-11e8-727d-307300000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2018-09-13 12:36:26",
  "name": "d000001",
  "externalCode": "htdrUVpciRX4kldKIN7VL0",
  "moment": "2018-09-13 12:36:00",
  "applicable": true,
  "agent": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/341a6b49-b688-11e8-727d-307300000012",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
      "type": "counterparty",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#company/edit?id=341a6b49-b688-11e8-727d-307300000012"
    }
  },
  "created": "2018-09-13 12:36:26",
  "parentDocument": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/retaildemand/e182ab48-b726-11e8-727d-3073000000b4",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/retaildemand/metadata",
      "type": "retaildemand",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#retaildemand/edit?id=e182ab48-b726-11e8-727d-3073000000b4"
    }
  },
  "bonusProgram": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/3cc6edd8-b688-11e8-727d-30730000001b",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/metadata",
      "type": "bonusprogram",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#discount/edit?id=3cc6edd8-b688-11e8-727d-30730000001b"
    }
  },
  "bonusValue": 15,
  "transactionType": "EARNING",
  "transactionStatus": "COMPLETED",
  "executionDate": "2018-09-13 12:36:26",
  "categoryType": "REGULAR"
}
```

### Bonus operations bulk creation and update

[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Bonus operations.
In the body of the request, you need to pass an array containing JSON representations of the Bonus Operations that you want to create or update.
Updated Bonus Transactions must contain the identifier in the form of metadata.

> An example of creating and updating several Bonus Operations

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/bonustransaction" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '[
            {
              "name": "d00001",
              "applicable": true,
              "agent": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9fea1d90-d488-4271-97bc-a9ad1b9fbcc0",
                  "type": "counterparty",
                  "mediaType": "application/json"
                }
              },
              "bonusProgram": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/956f6ff7-718f-4849-be47-7509fdd18db9",
                  "type": "bonusprogram",
                  "mediaType": "application/json"
                }
              },
              "transactionType": "EARNING",
              "bonusValue": 15
            },
            {
              "agent": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9fea1d90-d488-4271-97bc-a9ad1b9fbcc0",
                  "type": "counterparty",
                  "mediaType": "application/json"
                }
              },
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/956f6ff7-718f-4849-be47-7509fdd18db9",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/metadata",
                "type": "bonustransaction",
                "mediaType": "application/json"
              },
              "name": "updated_name",
              "bonusValue": 1235
            },
            {
              "name": "d00003",
              "applicable": true,
              "agent": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9fea1d90-d488-4271-97bc-a9ad1b9fbcc0",
                  "type": "counterparty",
                  "mediaType": "application/json"
                }
              },
              "bonusProgram": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/956f6ff7-718f-4849-be47-7509fdd18db9",
                  "type": "bonusprogram",
                  "mediaType": "application/json"
                }
              },
              "transactionType": "SPENDING",
              "bonusValue": 100500
            }
          ]'  
```

> Response 200 (application/json)
Successful request. The result is a JSON array of representations of the created and updated Bonus Operations.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/7c6ecd51-b738-11e8-727d-307300000028",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/metadata",
      "type": "bonustransaction",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#bonustransaction/edit?id=7c6ecd51-b738-11e8-727d-307300000028"
    },
    "id": "7c6ecd51-b738-11e8-727d-307300000028",
    "accountId": "ba5d8717-d6e7-4741-9f2e-4e343a447fb9",
    "owner": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/4a980e02-b685-11e8-727d-30730000002b",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=4a980e02-b685-11e8-727d-30730000002b"
      }
    },
    "shared": false,
    "group": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/group/4427b6f1-b685-11e8-727d-307300000002",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
        "type": "group",
        "mediaType": "application/json"
      }
    },
    "updated": "2018-09-13 12:36:26",
    "name": "d00001",
    "externalCode": "htdrUVpciRX4kldKIN7VL0",
    "moment": "2018-09-13 12:36:26",
    "applicable": true,
    "agent": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9fea1d90-d488-4271-97bc-a9ad1b9fbcc0",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
        "type": "counterparty",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#company/edit?id=9fea1d90-d488-4271-97bc-a9ad1b9fbcc0"
      }
    },
    "created": "2018-09-13 12:36:26",
    "bonusProgram": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/956f6ff7-718f-4849-be47-7509fdd18db9",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/metadata",
        "type": "bonusprogram",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#discount/edit?id=956f6ff7-718f-4849-be47-7509fdd18db9"
      }
    },
    "bonusValue": 15,
    "transactionType": "EARNING",
    "transactionStatus": "COMPLETED",
    "executionDate": "2018-09-13 12:36:26",
    "categoryType": "REGULAR"
  },
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/7c6ecd51-b738-11e8-727d-307300000029",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/metadata",
      "type": "bonustransaction",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#bonustransaction/edit?id=7c6ecd51-b738-11e8-727d-307300000029"
    },
    "id": "7c6ecd51-b738-11e8-727d-307300000029",
    "accountId": "ba5d8717-d6e7-4741-9f2e-4e343a447fb9",
    "owner": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/4a980e02-b685-11e8-727d-30730000002b",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=4a980e02-b685-11e8-727d-30730000002b"
      }
    },
    "shared": false,
    "group": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/group/4427b6f1-b685-11e8-727d-307300000002",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
        "type": "group",
        "mediaType": "application/json"
      }
    },
    "updated": "2018-09-13 12:36:26",
    "name": "updated_name",
    "externalCode": "atdrUVpciRX4kljKIN7iL8",
    "moment": "2018-09-13 12:36:26",
    "applicable": true,
    "agent": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9fea1d90-d488-4271-97bc-a9ad1b9fbcc0",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
        "type": "counterparty",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#company/edit?id=9fea1d90-d488-4271-97bc-a9ad1b9fbcc0"
      }
    },
    "created": "2018-09-13 12:36:26",
    "bonusProgram": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/956f6ff7-718f-4849-be47-7509fdd18db9",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/metadata",
        "type": "bonusprogram",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#discount/edit?id=956f6ff7-718f-4849-be47-7509fdd18db9"
      }
    },
    "bonusValue": 1235,
    "transactionType": "EARNING",
    "transactionStatus": "COMPLETED",
    "executionDate": "2018-09-13 12:36:26",
    "categoryType": "REGULAR"
  },
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/7c6ecd51-b738-11e8-727d-307300000038",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/metadata",
      "type": "bonustransaction",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#bonustransaction/edit?id=7c6ecd51-b738-11e8-727d-307300000038"
    },
    "id": "7c6ecd51-b738-11e8-727d-307300000038",
    "accountId": "ba5d8717-d6e7-4741-9f2e-4e343a447fb9",
    "owner": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/4a980e02-b685-11e8-727d-30730000002b",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=4a980e02-b685-11e8-727d-30730000002b"
      }
    },
    "shared": false,
    "group": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/group/4427b6f1-b685-11e8-727d-307300000002",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
        "type": "group",
        "mediaType": "application/json"
      }
    },
    "updated": "2018-09-13 12:36:26",
    "name": "d00003",
    "externalCode": "ald88VpciRX4kkklIN7123",
    "moment": "2018-09-13 12:36:26",
    "applicable": true,
    "agent": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9fea1d90-d488-4271-97bc-a9ad1b9fbcc0",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
        "type": "counterparty",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#company/edit?id=9fea1d90-d488-4271-97bc-a9ad1b9fbcc0"
      }
    },
    "created": "2018-09-13 12:36:26",
    "bonusProgram": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/956f6ff7-718f-4849-be47-7509fdd18db9",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/metadata",
        "type": "bonusprogram",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#discount/edit?id=956f6ff7-718f-4849-be47-7509fdd18db9"
      }
    },
    "bonusValue": 100500,
    "transactionType": "SPENDING",
    "transactionStatus": "COMPLETED",
    "executionDate": "2018-09-13 12:36:26",
    "categoryType": "REGULAR"
  }
]
```

### Delete Bonus operation

**Parameters**

| Parameter | Description |
| ------- | --------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bonus transaction id. |

> Request to delete a bonus operation.

```shell
curl --compressed -X DELETE \
   "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/7944ef04-f831-11e5-7a69-971500188b19" \
   -H "Authorization: Basic <Credentials>" \
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful removal of the Bonus operation.

### Bulk deletion of Bonus Operations

In the body of the request, pass an array containing the JSON metadata of the Bonus Operations that you want to remove.


> Request for bulk deletion of Bonus Transactions.

```shell
curl --compressed -X POST \
  "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/delete" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip" \
  -H "Content-Type: application/json" \
  -d '[
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/7944ef04-f831-11e5-7a69-971500188b1",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/metadata",
                "type": "bonustransaction",
                "mediaType": "application/json"
            }
        },
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/7944ef04-f831-11e5-7a69-971500188b2",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/metadata",
                "type": "bonustransaction",
                "mediaType": "application/json"
            }
        }
      ]'
```        

> Successful request. The result is JSON information about deleting Bonus transactions.

```json
[
   {
     "info":"Entity 'bonustransaction' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'bonustransaction' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Bonus operation

### Get Bonus operation

**Parameters**

| Parameter | Description |
| ------- | ------------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bonus transaction id. |

> Request for a bonus transaction with the specified id.

```shell
curl --compressed -X GET \
   "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/7944ef04-f831-11e5-7a69-971500188b19" \
   -H "Authorization: Basic <Credentials>" \
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Bonus transaction with the specified ID.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/7c6ecd51-b738-11e8-727d-307300000028",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/metadata",
    "type": "bonustransaction",
    "mediaType": "application/json",
    "uuidHref": "https://app.kladana.com/app/#bonustransaction/edit?id=7c6ecd51-b738-11e8-727d-307300000028"
  },
  "id": "7c6ecd51-b738-11e8-727d-307300000028",
  "accountId": "44245b3a-b685-11e8-727d-307300000001",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/4a980e02-b685-11e8-727d-30730000002b",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=4a980e02-b685-11e8-727d-30730000002b"
    }
  },
  "shared": false,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/4427b6f1-b685-11e8-727d-307300000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2018-09-13 12:36:26",
  "name": "d000013",
  "externalCode": "htdrUVpciRX4kldKIN7VL0",
  "moment": "2018-09-13 12:36:00",
  "applicable": true,
  "agent": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/341a6b49-b688-11e8-727d-307300000012",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
      "type": "counterparty",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#company/edit?id=341a6b49-b688-11e8-727d-307300000012"
    }
  },
  "created": "2018-09-13 12:36:26",
  "parentDocument": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/retaildemand/e182ab48-b726-11e8-727d-3073000000b4",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/retaildemand/metadata",
      "type": "retaildemand",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#retaildemand/edit?id=e182ab48-b726-11e8-727d-3073000000b4"
    }
  },
  "bonusProgram": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/3cc6edd8-b688-11e8-727d-30730000001b",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/metadata",
      "type": "bonusprogram",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#discount/edit?id=3cc6edd8-b688-11e8-727d-30730000001b"
    }
  },
  "bonusValue": 15,
  "transactionType": "EARNING",
  "transactionStatus": "COMPLETED",
  "executionDate": "2018-09-13 12:36:26",
  "categoryType": "REGULAR"
}
```

### Change Bonus operation

A request to change an object representing a bonus operation. It is not possible to change the type of bonus operation.

**Parameters**

| Parameter | Description |
| ------- | ----------- |
| **id**   | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bonus operation ID. |

> An example of a request to update a Bonus operation.

```shell
  curl --compressed -X PUT \
    "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/7944ef04-f831-11e5-7a69-971500188b19" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '{
            "bonusValue": 15524
          }'  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the updated Bonus operation.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/d8dda7b8-b76d-11e8-727d-3073000000a2",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonustransaction/metadata",
    "type": "bonustransaction",
    "mediaType": "application/json",
    "uuidHref": "https://app.kladana.com/app/#bonustransaction/edit?id=d8dda7b8-b76d-11e8-727d-3073000000a2"
  },
  "id": "d8dda7b8-b76d-11e8-727d-3073000000a2",
  "accountId": "44245b3a-b685-11e8-727d-307300000001",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/4a980e02-b685-11e8-727d-30730000002b",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=4a980e02-b685-11e8-727d-30730000002b"
    }
  },
  "shared": false,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/4427b6f1-b685-11e8-727d-307300000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2018-09-14 10:19:54",
  "name": "name_change",
  "externalCode": "dzmLEueIjUHccIa6GP6UX2",
  "moment": "2018-09-13 18:58:00",
  "applicable": true,
  "agent": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/4ac8d7ea-b685-11e8-727d-307300000056",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
      "type": "counterparty",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#company/edit?id=4ac8d7ea-b685-11e8-727d-307300000056"
    }
  },
  "created": "2018-09-13 18:58:25",
  "parentDocument": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/retaildemand/90f4f8df-b76b-11e8-727d-307300000090",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/retaildemand/metadata",
      "type": "retaildemand",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#retaildemand/edit?id=90f4f8df-b76b-11e8-727d-307300000090"
    }
  },
  "bonusProgram": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/3cc6edd8-b688-11e8-727d-30730000001b",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/metadata",
      "type": "bonusprogram",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#discount/edit?id=3cc6edd8-b688-11e8-727d-30730000001b"
    }
  },
  "bonusValue": 15524,
  "transactionType": "SPENDING",
  "transactionStatus": "COMPLETED",
  "executionDate": "2018-09-13 12:36:26",
  "categoryType": "REGULAR"
}
```
