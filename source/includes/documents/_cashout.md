## Outgoing Cash Payment
### Outgoing Cash Payments

Using the JSON API, you can create and update information about an Outgoing Cash Payment, request lists of Outgoing Cash Payments, and information on individual Outgoing Cash Payments. The entity code for a Pay Order in the JSON API is the **cashout** keyword.

#### Entity attributes

| Title | Type | Filtration | Description                                                                                                                   |
| ------- | ------- | ----|-------------------------------------------------------------------------------------------------------------------------------|
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only`                                                                          |
| **agent** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Counterparty metadata<br>`+Required when replying` `+Expand` `+Required when creating`                                        |
| **applicable** | Boolean | `=` `!=` | Check mark<br>`+Required when replying`                                                                                      |
| **attributes** | Array(Object) | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields)                   |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Outgoing Cash Payment Code                                                                                                    |
| **contract** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Contract metadata<br>`+Expand`                                                                                                |
| **created** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Creation date<br>`+Required when replying` `+Read only`                                                                       |
| **deleted** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Time of the last deletion of the Disbursement Note<br>`+Read Only`                                                            |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Disbursement note commentary                                                                                                  |
| **expenseItem** | [Meta](../#kladana-json-api-general-info-metadata) | | Metadata Line Items<br>`+Required when replying` `+Expand` `+Required when creating`                                          |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | Outgoing Cash Payment External Code<br>`+Required when replying`                                                              |
| **files** | MetaArray | | [Files](../dictionaries/#entities-files) array metadata (Maximum number of files - 100)<br>`+Required when replying` `+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`| Employee's department<br>`+Required when replying` `+Expand`  |
| **noClosingDocs**   | Boolean |  | A sign of the possibility of linking closing documents and disabling mutual settlements with the counterparty for this payment<br>`+Required when replying` `+Read Only` |
| **id** | UUID | `=` `!=` | Disbursement Note ID<br>`+Required when replying` `+Read Only`                                                                |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Disbursement note metadata<br>`+Required when replying`                                                                       |
| **moment** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Document date<br>`+Required when replying`                                                                                    |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Name of the Outgoing Order<br>`+Required when replying`                                                                       |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Legal entity metadata<br>`+Required when replying` `+Expand` `+Required when creating`                                        |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br> `+Expand`                                                                       |
| **paymentPurpose** | String(255) | `=` `!=` `~` `~=` `=~` | Reason<br>`+Required when replying`                                                                                          |
| **printed** | Boolean | `=` `!=` | Is the document printed<br>`+Required when replying` `+Read Only`                                                           |
| **project** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Project metadata<br>`+Expand`                                                                                                 |
| **published** | Boolean | `=` `!=` | Is the document published<br>`+Required when replying` `+Read Only`                                                           |
| **rate** | object | | Currency. [Learn more](../documents/#transactions-currency-in-transactions)<br>`+Required when replying`               |
| **salesChannel** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Sales channel metadata<br>`+Expand`                                                                                           |
| **shared** | Boolean | `=` `!=`| Sharing<br>`+Required when replying`                                                                                          |
| **state** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Expenditure note status metadata<br>`+Expand`                                                                                 |
| **sum** | Int | `=` `!=` `<` `>` `<=` `>=` | Amount of the Outgoing Cash Payment in the specified currency<br>`+Required when replying` |
| **syncId** | UUID | `=` `!=` | Synchronization ID. After filling it is not available for change                                                              |
| **updated** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Time when the Disbursement Note was last updated<br>`+Required when replying` `+Read Only`                                    |
| **vatSum** | Float | | VAT amount<br>`+Required when replying`                                                                                      |


#### Links to other documents

| Title | Description |
| --------- | ------ |
| **factureIn** | Lint to the related Incoming Cash Payment in the [Metadata](../#kladana-json-api-general-info-metadata) format |
| **operations** | An array of links to related operations in the [Metadata](../#kladana-json-api-general-info-metadata) format |

Allowed types of linked operations:

+ Sales Return (salesreturn)
+ Receiving (supply)
+ Supplier invoice (invoicein)
+ Order to the supplier (purchaseorder)

About working with fields of the Outgoing Orders can be read [here](../#kladana-json-api-general-info-additional-fields)


### Get Outgoing Cash Payment

Query all Outgoing Cash Payments on this account.
Result: JSON object including fields:

| Title | Type | Description |
| ------- | ----- | ------ |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the Outgoing Cash Payments. |

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** | `string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Get Outgoing Cash Payments

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/cashout"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of Outgoing Cash Payments.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/cashout",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata",
     "type": "cashout",
     "mediaType": "application/json",
     "size": 3,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/235c14cf-41b1-11e6-8a84-bae500000073",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata",
         "type": "cashout",
         "mediaType": "application/json"
       },
       "id": "235c14cf-41b1-11e6-8a84-bae500000073",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "owner": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": true,
       "group": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-07-04 09:32:53",
       "name": "00002",
       "description": "Order description",
       "externalCode": "wWfQT10VjQztCieUrE72r2",
       "moment": "2016-07-04 09:31:00",
       "applicable": true,
       "created": "2016-08-25 19:55:00",
       "printed": true,
       "published": true,
       "rate": {
         "currency": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "sum": 35000,
       "organization": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "contract": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/contract/2b34d43f-3f52-11e6-8a84-bae500000066",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
           "type": "contract",
           "mediaType": "application/json"
         }
       },
       "agent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/1489a08d-32ca-11e6-8a84-bae50000000d",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "state": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/states/0eda7963-41b1-11e6-8a84-bae50000006e",
           "type": "state",
           "mediaType": "application/json"
         }
       },
       "attributes": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c8857703-3f8e-11e6-8a84-bae5000000ff",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "c8857703-3f8e-11e6-8a84-bae5000000ff",
           "name": "AttributeName1",
           "type": "boolean",
           "value": false
         }
       ],
       "paymentPurpose": "Pay for another acceptance",
       "expenseItem": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/metadata",
           "type": "expenseitem",
           "mediaType": "application/json"
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/489afb43-41b1-11e6-8a84-bae50000007a",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata",
         "type": "cashout",
         "mediaType": "application/json"
       },
       "id": "489afb43-41b1-11e6-8a84-bae50000007a",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
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
       "updated": "2016-07-04 09:33:56",
       "name": "00003",
       "description": "Lmao",
       "externalCode": "Q9wiyzIQiOhYhqpVkq6IE2",
       "moment": "2016-07-04 09:32:00",
       "applicable": true,
       "created": "2016-08-25 19:55:00",
       "printed": true,
       "published": true,
       "rate": {
         "currency": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "sum": 3535000,
       "organization": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "contract": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/contract/37def9c0-41b1-11e6-8a84-bae500000077",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
           "type": "contract",
           "mediaType": "application/json"
         }
       },
       "project": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/project/722e39f0-313e-11e6-8a84-bae500000008",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/project/metadata",
           "type": "project",
           "mediaType": "application/json"
         }
       },
       "agent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/1509a2f7-32ca-11e6-8a84-bae500000068",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "state": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/states/0eda7963-41b1-11e6-8a84-bae50000006e",
           "type": "state",
           "mediaType": "application/json"
         }
       },
       "attributes": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c8857703-3f8e-11e6-8a84-bae5000000ff",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "c8857703-3f8e-11e6-8a84-bae5000000ff",
           "name": "AttributeName2",
           "type": "boolean",
           "value": false
         }
       ],
       "paymentPurpose": "Pay for another acceptance",
       "expenseItem": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/metadata",
           "type": "expenseitem",
           "mediaType": "application/json"
         }
       },
       "operations": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/supply/90ba347d-6b8b-11e6-8a84-bae5000000bd",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
             "type": "supply",
             "mediaType": "application/json"
           },
           "linkedSum": 80000
         }
       ]
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/fd9b07ea-41b0-11e6-8a84-bae500000069",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata",
         "type": "cashout",
         "mediaType": "application/json"
       },
       "id": "fd9b07ea-41b0-11e6-8a84-bae500000069",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
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
       "updated": "2016-07-04 09:34:14",
       "name": "00001",
       "description": "Order created via UI.",
       "externalCode": "Biim5OxdjUnFcC2saaU551",
       "moment": "2016-07-04 09:30:00",
       "applicable": true,
       "created": "2016-08-25 19:55:00",
       "printed": true,
       "published": true,
       "rate": {
         "currency": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/currency/cdbc62de-3f68-11e6-8a84-bae500000050",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         },
         "value": 63
       },
       "sum": 3174603,
       "organization": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "contract": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/contract/e16fc992-41b0-11e6-8a84-bae500000066",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
           "type": "contract",
           "mediaType": "application/json"
         }
       },
       "project": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/project/722e39f0-313e-11e6-8a84-bae500000008",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/project/metadata",
           "type": "project",
           "mediaType": "application/json"
         }
       },
       "agent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "state": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/states/0eda8542-41b1-11e6-8a84-bae500000070",
           "type": "state",
           "mediaType": "application/json"
         }
       },
       "attributes": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c8857703-3f8e-11e6-8a84-bae5000000ff",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "c8857703-3f8e-11e6-8a84-bae5000000ff",
           "name": "AttributeName3",
           "type": "boolean",
           "value": false
         }
       ],
       "paymentPurpose": "Acceptance payment",
       "expenseItem": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/82031d62-2e58-11e6-ab5c-d8cb8a84bae5",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/metadata",
           "type": "expenseitem",
           "mediaType": "application/json"
         }
       }
     }
   ]
}

```

### Create Outgoing Cash Payment
Request to create a new Outgoing Cash Payment.
Mandatory fields to create:

| Parameter | Description |
| ----- | ------ |
| **organization** | Link to your legal entity in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **agent** | Link to the counterparty in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **expenseItem** | Expense item in the format [Metadata](../#kladana-json-api-general-info-metadata) |

> An example of creating a new Disbursement Note with a request body containing only the required fields.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/cashout"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "organization": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                    "type": "organization",
                    "mediaType": "application/json"
                }
            },
            "agent": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                    "type": "counterparty",
                    "mediaType": "application/json"
                }
            },
            "expenseItem": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/metadata",
                    "type": "expenseitem",
                    "mediaType": "application/json"
                }
            }
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Outgoing Cash Payment.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/e446a227-41b1-11e6-8a84-bae500000005",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata",
     "type": "cashout",
     "mediaType": "application/json"
   },
   "id": "e446a227-41b1-11e6-8a84-bae500000005",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "name": "0721",
   "moment": "2012-06-27 16:52:24",
   "applicable": false,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "expenseItem": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     }
   }
}
```

### Outgoing Cash Payment bulk creating and update

[Bulk creating and update of Outgoing Cash Payments](../#kladana-json-api-general-info-create-and-update-multiple-objects).
In the body of the request, you need to pass an array containing JSON representations of the Outgoing Cash Payments that you want to create or update.
Updatable Outgoing Cash Payments must contain the identifier in the form of metadata.

> Example of creating and updating multiple Outgoing Cash Payments

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/cashout"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "0721",
               "organization": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                   "type": "organization",
                   "mediaType": "application/json"
                 }
               },
               "agent": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                   "type": "counterparty",
                   "mediaType": "application/json"
                 }
               },
               "expenseItem": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/metadata",
                   "type": "expenseitem",
                   "mediaType": "application/json"
                 }
               }
             },
             {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/e446a227-41b1-11e6-8a84-bae500000005",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata",
                 "type": "cashout",
                 "mediaType": "application/json"
               },
               "shared": true,
               "name": "0722",
               "description": "Invoice created and updated viaAPI",
               "code": "12412470912",
               "externalCode": "unreal777slknf",
               "moment": "2016-06-27 16:52:24",
               "applicable": true,
               "sum": 25190,
               "paymentPurpose": "Paying a new order to the supplier",
               "expenseItem": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/1be23a18-0479-11e5-a260-448a5b426e7e",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/metadata",
                   "type": "expenseitem",
                   "mediaType": "application/json"
                 }
               },
               "attributes": [
                 {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c88569fc-3f8e-11e6-8a84-bae5000000fd",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   "value": 0.49
                 },
                 {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c88570d2-3f8e-11e6-8a84-bae5000000fe",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   "value": 7501
                 },
                 {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c8857703-3f8e-11e6-8a84-bae5000000ff",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   "value": true
                 }
               ]
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Outgoing Cash Payments.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/e446a227-41b1-11e6-8a84-bae500000005",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata",
       "type": "cashout",
       "mediaType": "application/json"
     },
     "id": "e446a227-41b1-11e6-8a84-bae500000005",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "owner": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "group": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "name": "0721",
     "moment": "2012-06-27 16:52:24",
     "applicable": false,
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "rate": {
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       }
     },
     "organization": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     "agent": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
         "type": "counterparty",
         "mediaType": "application/json"
       }
     },
     "expenseItem": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/metadata",
         "type": "expenseitem",
         "mediaType": "application/json"
       }
     }
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/e446a227-41b1-11e6-8a84-bae500000005",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata",
       "type": "cashout",
       "mediaType": "application/json"
     },
     "id": "e446a227-41b1-11e6-8a84-bae500000005",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "owner": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": true,
     "group": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-07-04 09:41:17",
     "name": "0722",
     "description": "Payment order created and updated via API",
     "code": "12412470912",
     "externalCode": "unreal777slknf",
     "moment": "2016-06-27 16:52:24",
     "applicable": true,
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "rate": {
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       }
     },
     "sum": 900,
     "organization": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     "agent": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
         "type": "counterparty",
         "mediaType": "application/json"
       }
     },
     "attributes": [
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c88569fc-3f8e-11e6-8a84-bae5000000fd",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "c88569fc-3f8e-11e6-8a84-bae5000000fd",
         "name": "AttributeName1",
         "type": "double",
         "value": 0.49
       },
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c88570d2-3f8e-11e6-8a84-bae5000000fe",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "c88570d2-3f8e-11e6-8a84-bae5000000fe",
         "name": "AttributeName2",
         "type": "long",
         "value": 7501
       },
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c8857703-3f8e-11e6-8a84-bae5000000ff",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "c8857703-3f8e-11e6-8a84-bae5000000ff",
         "name": "AttributeName3",
         "type": "boolean",
         "value": true
       }
     ],
     "paymentPurpose": "Paying a new order to the supplier",
     "expenseItem": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/1be23a18-0479-11e5-a260-448a5b426e7e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/metadata",
         "type": "expenseitem",
         "mediaType": "application/json"
       }
     }
   }
]

```

### Delete Outgoing Cash Payment

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Outgoing Cash Payment id. |

> Request to delete an Outgoing Cash Payment with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/cashout/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of the Outgoing Cash Payment.

### Bulk deletion of Outgoing Cash Payments

In the body of the request, you need to pass an array containing the JSON metadata of the Outgoing Cash Payments that you want to delete.


> Request for bulk deletion of Outgoing Cash Payments.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/cashout/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/7944ef04-f831-11e5-7a69-971500188b1",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata",
             "type": "cashout",
             "mediaType": "application/json"
         },
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/7944ef04-f831-11e5-7a69-971500188b2",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata",
             "type": "cashout",
             "mediaType": "application/json"
         }
       ]'
```

> Successful request. The result is JSON information about the deletion of Outgoing Cash Payments.

```json
[
   {
     "info":"Entity 'cashout' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'cashout' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Outgoing Cash Payment Metadata
#### Outgoing Cash Payment Metadata
Request for Outgoing Cash Payment metadata. The result is a JSON object including:

| Parameter | Description |
| ----- | ------ |
| **meta** | Link to Outgoing Cash Payment Metadata |
| **attributes** | Array of objects additional fields of Outgoing Cash Payments in the [Metadata](../#kladana-json-api-general-info-metadata) format |
| **states** | Array of Outgoing Cash Payment statuses |
| **createShared** | create new Outgoing Orders labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Metadata of Outgoing Cash Payments

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional fields of Outgoing Cash Payments.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c88569fc-3f8e-11e6-8a84-bae5000000fd",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c88569fc-3f8e-11e6-8a84-bae5000000fd",
       "name": "AttributeName1",
       "type": "double",
       "required": false
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c88570d2-3f8e-11e6-8a84-bae5000000fe",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c88570d2-3f8e-11e6-8a84-bae5000000fe",
       "name": "AttributeName2",
       "type": "long",
       "required": false
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c8857703-3f8e-11e6-8a84-bae5000000ff",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c8857703-3f8e-11e6-8a84-bae5000000ff",
       "name": "AttributeName3",
       "type": "boolean",
       "required": false
     }
   ],
   "states": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/states/0eda7963-41b1-11e6-8a84-bae50000006e",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "0eda7963-41b1-11e6-8a84-bae50000006e",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Pending execution",
       "color": 10667543,
       "stateType": "Regular",
       "entityType": "cashout"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/states/0eda80ad-41b1-11e6-8a84-bae50000006f",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "0eda80ad-41b1-11e6-8a84-bae50000006f",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Approved",
       "color": 4354177,
       "stateType": "Regular",
       "entityType": "cashout"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/states/0eda8542-41b1-11e6-8a84-bae500000070",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "0eda8542-41b1-11e6-8a84-bae500000070",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Signed",
       "color": 15491487,
       "stateType": "Regular",
       "entityType": "cashout"
     }
   ],
   "createShared": false
}
```

### Separate additional field

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Additional fields id. |

> Request for information on a separate additional field.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/b54f1d9c-558a-11e6-8a84-bae50000006c",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "b54f1d9c-558a-11e6-8a84-bae50000006c",
   "name": "AttributeName1",
   "type": "string",
   "required": false
}
```

### Outgoing Cash Payment template
#### Outgoing Cash Payment template

> Request to receive an Outgoing Cash Payment template pre-filled with standard values without being associated with any document.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/cashout/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d''
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Outgoing Cash Payment.

```json
{
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "sum": 0,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "expenseItem": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     }
   }
}
```

### Outgoing Cash Payment template based on another transaction

Request for a pre-filled Outgoing Cash Payment representation based on another transaction.

> Request for an Outgoing Cash Payment template based on a vendor order.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/cashout/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "operations": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/17a06771-961b-11e6-8a84-bae500000080",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata",
                   "type": "purchaseorder",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Outgoing Cash Payment.

```json
{
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 0,
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/b942953e-9128-11e6-8a84-bae500000054",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "paymentPurpose": "Payment for order No. 00001 dated 2016-10-19 19:42:00. Amount: 0.00 excluding VAT",
   "operations": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/17a06771-961b-11e6-8a84-bae500000080",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata",
         "type": "purchaseorder",
         "mediaType": "application/json"
       },
       "linkedSum": 0
     }
   ],
   "expenseItem": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     }
   }
}
```

> Request for an Outgoing Cash Payment template based on Sales Return.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/cashout/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "operations": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/3b0f51a4-961b-11e6-8a84-bae500000086",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/metadata",
                   "type": "salesreturn",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Outgoing Cash Payment.

```json
{
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 0,
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/2b0f10e4-9169-11e6-8a84-bae500000000",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "paymentPurpose": "Return on invoice No. 00001 dated 2016-10-19 19:43:00. Amount: 0.00 excluding VAT",
   "operations": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/3b0f51a4-961b-11e6-8a84-bae500000086",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/metadata",
         "type": "salesreturn",
         "mediaType": "application/json"
       },
       "linkedSum": 0
     }
   ],
   "expenseItem": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/1be2395a-0479-11e5-baee-448a5b426e7e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     }
   }
}
```

> Request for an Outgoing Cash Payment template based on receipt.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/cashout/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             operations: [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/supply/0f57efd5-91f3-11e6-8a84-bae500000086",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
                   "type": "supply",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Outgoing Cash Payment.

```json
{
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 0,
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/b942c396-9128-11e6-8a84-bae500000056",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "paymentPurpose": "Payment by invoice No. 123 dated 2016-10-14 12:46:00. Amount: 0.00 excluding VAT",
   "operations": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/0f57efd5-91f3-11e6-8a84-bae500000086",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
         "type": "supply",
         "mediaType": "application/json"
       },
       "linkedSum": 0
     }
   ],
   "expenseItem": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     }
   }
}
```

> Request for an Outgoing Cash Payment template based on a vendor invoice.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/cashout/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "operations": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/e43b34bc-961a-11e6-8a84-bae50000006f",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
                   "type": "invoicein",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Outgoing Cash Payment.

```json
{
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 0,
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/b942c396-9128-11e6-8a84-bae500000056",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "paymentPurpose": "Payment on account No. 00001 dated 2016-10-19 19:41:00. Amount: 0.00 excluding VAT",
   "operations": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/e43b34bc-961a-11e6-8a84-bae50000006f",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
         "type": "invoicein",
         "mediaType": "application/json"
       },
       "linkedSum": 0
     }
   ],
   "expenseItem": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     }
   }
}
```

> Request for an Outgoing Cash Payment template based on the issued commission agent report.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/cashout/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "operations": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/commissionreportout/394e3f39-b322-11e6-8a84-bae50000009e",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/commissionreportout/metadata",
                   "type": "commissionreportout",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Outgoing Cash Payment.

```json
{
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/b905bfb0-9128-11e6-8a84-bae50000002a",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/b8ba0d3f-9128-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2016-11-25 18:17:38",
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 10200850,
   "contract": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/contract/c3057574-ab01-11e6-8a84-bae500000070",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
       "type": "contract",
       "mediaType": "application/json"
     }
   },
   "project": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/project/6c6dd3f9-97a1-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/project/metadata",
       "type": "project",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/b942c396-9128-11e6-8a84-bae500000056",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "vatSum": 0,
   "operations": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/commissionreportout/394e3f39-b322-11e6-8a84-bae50000009e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/commissionreportout/metadata",
         "type": "commissionreportout",
         "mediaType": "application/json"
       },
       "linkedSum": 10200850
     }
   ],
   "expenseItem": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     }
   }
}
```

### Outgoing Cash Payment

### Get Outgoing Cash Payment

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Outgoing Cash Payment id. |

> Request for a separate Outgoing Cash Payment with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/cashout/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Outgoing Cash Payment.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/fd9b07ea-41b0-11e6-8a84-bae500000069",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata",
     "type": "cashout",
     "mediaType": "application/json"
   },
   "id": "fd9b07ea-41b0-11e6-8a84-bae500000069",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
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
   "updated": "2016-07-04 09:34:14",
   "name": "00001",
   "description": "Order created via UI.",
   "externalCode": "Biim5OxdjUnFcC2saaU551",
   "moment": "2016-07-04 09:30:00",
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/cdbc62de-3f68-11e6-8a84-bae500000050",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     },
     "value": 63
   },
   "sum": 3174603,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "contract": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/contract/e16fc992-41b0-11e6-8a84-bae500000066",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
       "type": "contract",
       "mediaType": "application/json"
     }
   },
   "project": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/project/722e39f0-313e-11e6-8a84-bae500000008",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/project/metadata",
       "type": "project",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/states/0eda8542-41b1-11e6-8a84-bae500000070",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c8857703-3f8e-11e6-8a84-bae5000000ff",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c8857703-3f8e-11e6-8a84-bae5000000ff",
       "name": "AttributeName1",
       "type": "boolean",
       "value": false
     }
   ],
   "paymentPurpose": "Acceptance payment",
   "expenseItem": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/82031d62-2e58-11e6-ab5c-d8cb8a84bae5",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     }
   },
   "operations": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/90ba347d-6b8b-11e6-8a84-bae5000000bd",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
         "type": "supply",
         "mediaType": "application/json"
       },
       "linkedSum": 80000
     }
   ]
}
```

### Edit Outgoing Cash Payment

Request to update an Outgoing Cash Payment with the specified id.
In the body of the request, you can specify only those fields that need to be changed for the Outgoing Cash Payment, except for those that are marked `Read-Only` in the description of the [Outgoing Cash Payment Attributes](../documents/#transactions-outgoing-cash-payment).

When updating the **organization** and **agent** fields, you must also update the **organizationAccount** and
**agentAccount** respectively, otherwise an error will occur. 

To link an Outgoing Cash Payment to other documents
you need to put in the field under the name **operations** all **meta** of those documents to which you want to link the financial transaction.
Also, for each document, you can specify the amount paid for this document from this payment **linkedSum**.

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Outgoing Cash Payment id. |

> An example of a request to update a single Outgoing Cash Payment.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/cashout/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "shared": true,
             "name": "0722",
             "description": "Payment order created and updated via API",
             "code": "12412470912",
             "externalCode": "unreal777slknf",
             "moment": "2016-06-27 16:52:24",
             "applicable": true,
             "sum": 25190,
             "paymentPurpose": "Paying a new order to the supplier",
             "expenseItem": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/1be23a18-0479-11e5-a260-448a5b426e7e",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/metadata",
                 "type": "expenseitem",
                 "mediaType": "application/json"
               }
             },
             "attributes": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c88569fc-3f8e-11e6-8a84-bae5000000fd",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": 0.49
               },
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c88570d2-3f8e-11e6-8a84-bae5000000fe",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": 7501
               },
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c8857703-3f8e-11e6-8a84-bae5000000ff",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": true
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Outgoing Cash Payment.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/e446a227-41b1-11e6-8a84-bae500000005",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata",
     "type": "cashout",
     "mediaType": "application/json"
   },
   "id": "e446a227-41b1-11e6-8a84-bae500000005",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-07-04 09:41:17",
   "name": "0722",
   "description": "Payment order created and updated via API",
   "code": "12412470912",
   "externalCode": "unreal777slknf",
   "moment": "2016-06-27 16:52:24",
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 900,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c88569fc-3f8e-11e6-8a84-bae5000000fd",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c88569fc-3f8e-11e6-8a84-bae5000000fd",
       "name": "AttributeName1",
       "type": "double",
       "value": 0.49
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c88570d2-3f8e-11e6-8a84-bae5000000fe",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c88570d2-3f8e-11e6-8a84-bae5000000fe",
       "name": "AttributeName2",
       "type": "long",
       "value": 7501
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/cashout/metadata/attributes/c8857703-3f8e-11e6-8a84-bae5000000ff",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c8857703-3f8e-11e6-8a84-bae5000000ff",
       "name": "AttributeName3",
       "type": "boolean",
       "value": true
     }
   ],
   "paymentPurpose": "Paying a new order to the supplier",
   "expenseItem": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/1be23a18-0479-11e5-a260-448a5b426e7e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     }
   }
}
```
