## Outgoing Payment
### Outgoing Payments

Using the JSON API, you can create and update information about an Outgoing payment, request lists of Outgoing payments, and information on individual Outgoing payments. The entity code for an Outgoing payment in the JSON API is the **paymentout** keyword. Learn more about [Outgoing Payment](https://kladana.zendesk.com/hc/en-us/articles/7572476566289-Payments).

#### Entity attributes

| Title | Type | Filtration | Description |
| ---------- | ---------- | ------- |----------|
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **agent** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Counterparty metadata<br>`+Required when replying` `+Expand` `+Required when creating` |
| **agentAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Counterparty account metadata<br>`+Expand` |
| **applicable** | Boolean | `=` `!=` | Check mark<br>`+Required when answering` |
| **attributes** | Array(Object) | [Operators of additional fields](../#mojsklad-json-api-obschie-swedeniq-fil-traciq-wyborki-s-pomosch-u-parametra-filter-fil-traciq-po-dopolnitel-nym-polqm) | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields) |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Outgoing payment code |
| **contract** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Contract metadata<br>`+Expand` |
| **created** | datetime | `=` `!=` `<` `>` `<=` `>=` | Creation date<br>`+Required when replying` `+Read only` |
| **deleted** | datetime | `=` `!=` `<` `>` `<=` `>=` | Moment of last deletion of Outgoing payment<br>`+Read only` |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Comment Outgoing payment |
| **expenseItem** | [Meta](../#kladana-json-api-general-info-metadata) | | Metadata Line Items<br>`+Required when replying` `+Expand` `+Required when creating` |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | Outgoing payment external code<br>`+Required when replying` |
| **files** | MetaArray | | [Files] array metadata(../dictionaries/#entities-fajly) (Maximum number of files - 100)<br>`+Required when replying` `+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID | `=` `!=` | Outgoing payment ID<br>`+Required for response` `+Read-only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Outgoing payment metadata<br>`+Required when replying` |
| **moment** | datetime | `=` `!=` `<` `>` `<=` `>=` | Document date<br>`+Required when replying` |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Outgoing payment name<br>`+Required when replying` |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Legal entity metadata<br>`+Required when replying` `+Expand` `+Required when creating` |
| **organizationAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Legal entity account metadata<br>`+Expand` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Required when replying` `+Expand` |
| **paymentPurpose** | String(255) | `=` `!=` `~` `~=` `=~` | Purpose of payment<br>`+Required when replying` |
| **printed** | Boolean | `=` `!=` | Is the document printed<br>`+Required when responding` `+Read Only` |
| **project** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Project metadata<br>`+Expand` |
| **published** | Boolean | `=` `!=` | Is the document published<br>`+Required when replying` `+Read Only` |
| **rate** | object | | Currency. [More details here](../documents/#transactions-teh-operaciq-valuta-w-dokumentah)<br>`+Required when replying` |
| **salesChannel** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Sales channel metadata<br>`+Expand` |
| **shared** | Boolean | `=` `!=` | Sharing<br>`+Required when replying` |
| **state** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Outgoing payment status metadata<br>`+Expand` |
| **sum** | int | `=` `!=` `<` `>` `<=` `>=` | Amount of the Incoming payment in the specified currency<br>`+Required when replying` `+Read only` |
| **syncId** | UUID | `=` `!=` | Synchronization ID. After filling it is not available for change |
| **updated** | datetime | `=` `!=` `<` `>` `<=` `>=` | Moment of the last update of the Outgoing payment<br>`+Required when replying` `+Read only` |
| **vatSum** | float | | VAT amount<br>`+Required when answering` |

#### Links to other transactions

| Title | Description |
| ---------| --------- |
| **operations** | An array of links to related operations in the format [Metadata](../#kladana-json-api-general-info-metadata). |

Allowed types of linked operations:

+ Sales Return (sales return)
+ Receiving (supply)
+ Supplier invoice (invoicein)
+ Order to the supplier (purchaseorder)

Learn more about Outgoing payment fields [here](../#kladana-json-api-general-info-additional-fields).


### Get Outgoing Payments

Request all Outgoing payments on this account.
Result: JSON object including fields:

| Title | Type | Description |
| ---------- | ---------- |-------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Outgoing payments. |

**Parameters**

| Parameter | Description |
| ---------- | ---------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** | `string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Get outgoing payments

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/paymentout"
   -H "Authorization: Basic <Credentials>"
```

>Response 200 (application/json)
Successful request. The result is a JSON representation of the Outgoing Payments list.

```json
{
   "context": {
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
     "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata",
     "type": "paymentout",
     "mediaType": "application/json",
     "size": 3,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/64aa2e8c-3f95-11e6-8a84-bae50000010f",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata",
         "type": "paymentout",
         "mediaType": "application/json"
       },
       "id": "64aa2e8c-3f95-11e6-8a84-bae50000010f",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-07-01 17:09:15",
       "name": "00001",
       "description": "We pay the counterparty",
       "externalCode": "1PPP5fDei13CwEHXYUpV62",
       "moment": "2016-07-01 17:07:00",
       "applicable": true,
       "created": "2016-08-25 19:55:00",
       "printed": true,
       "published": true,
       "rate": {
         "currency": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "sum": 12525000,
       "organization": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "contract": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/contract/4680d884-3f95-11e6-8a84-bae50000010c",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/contract/metadata",
           "type": "contract",
           "mediaType": "application/json"
         }
       },
       "project": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/project/722e39f0-313e-11e6-8a84-bae500000008",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
           "type": "project",
           "mediaType": "application/json"
         }
       },
       "agent": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/1496c09e-32ca-11e6-8a84-bae50000001b",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "organizationAccount": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "attributes": [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata/attributes/ebc69be9-3f91-11e6-8a84-bae500000104",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "ebc69be9-3f91-11e6-8a84-bae500000104",
           "name": "Entered",
           "type": "boolean",
           "value": false
         }
       ],
       "paymentPurpose": "Payment by Invoice for Acceptance",
       "expenseItem": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
           "type": "expenseitem",
           "mediaType": "application/json"
         }
       }
     },
     {"meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/6c527858-3f95-11e6-8a84-bae500000113",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata",
         "type": "paymentout",
         "mediaType": "application/json"
       },
       "id": "6c527858-3f95-11e6-8a84-bae500000113",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-07-01 17:09:28",
       "name": "00002",
       "externalCode": "ixPEZ2RyieYILZJ73FkAT1",
       "moment": "2016-07-01 17:09:00",
       "applicable": true,
       "created": "2016-08-25 19:55:00",
       "printed": true,
       "published": true,
       "rate": {
         "currency": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "sum": 0,
       "organization": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "agent": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/1489a08d-32ca-11e6-8a84-bae50000000d",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "organizationAccount": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "agentAccount": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/1489a08d-32ca-11e6-8a84-bae50000000d/accounts/1489ad8d-32ca-11e6-8a84-bae50000000e",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "attributes": [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata/attributes/ebc69be9-3f91-11e6-8a84-bae500000104",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "ebc69be9-3f91-11e6-8a84-bae500000104",
           "name": "Entered",
           "type": "boolean",
           "value": false
         }
       ],
       "expenseItem": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
           "type": "expenseitem",
           "mediaType": "application/json"
         }
       },
       "operations": [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/supply/90ba347d-6b8b-11e6-8a84-bae5000000bd",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/supply/metadata",
             "type": "supply",
             "mediaType": "application/json"
           },
           "linkedSum": 80000
         }
       ]
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/d557dabe-3d3e-11e6-8a84-bae500000000",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata",
         "type": "paymentout",
         "mediaType": "application/json"
       },
       "id": "d557dabe-3d3e-11e6-8a84-bae500000000",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-06-28 17:44:35",
       "name": "408",
       "externalCode": "Q7wBn7oYh-B70arUTG08u3",
       "moment": "2015-06-19 00:00:00",
       "applicable": true,
       "created": "2016-08-25 19:55:00",
       "printed": true,
       "published": true,
       "rate": {
         "currency": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "sum": 7283600,
       "organization": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "agent": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/c466c1a8-3d2d-11e6-8a84-bae500000000",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "organizationAccount": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "agentAccount": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/c466c1a8-3d2d-11e6-8a84-bae500000000/accounts/c4673735-3d2d-11e6-8a84-bae500000001",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "paymentPurpose": "Payment for a laptop on account No. 340 dated June 19, 2015 Without VAT",
       "expenseItem": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
           "type": "expenseitem",
           "mediaType": "application/json"
         }
       }
     }
   ]
}
```

### Create Outgoing payment

Request to create a new Outgoing payment.
Mandatory fields to create:

| Parameter | Description |
| ---------- | ---------- |
| **organization** | Link to your legal entity in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **agent** | Link to the counterparty in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **expenseItem** | Expense item in the format [Metadata](../#kladana-json-api-general-info-metadata) |

> An example of creating a new Outgoing payment with a request body containing only the required fields.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/paymentout
"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "organization": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "agent": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                 "type": "counterparty",
                 "mediaType": "application/json"
               }
             },
             "expenseItem": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
                 "type": "expenseitem",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated outgoinghis payment.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/99434e4c-3fa0-11e6-8a84-bae50000009c",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata",
     "type": "paymentout",
     "mediaType": "application/json"
   },
   "id": "99434e4c-3fa0-11e6-8a84-bae50000009c",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "name": "333222",
   "moment": "2016-06-27 17:52:24",
   "applicable": false,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 0,
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "expenseItem": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     }
   }
}
```

### Bulk creating and update of Outgoing payments

[Bulk creating and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Outgoing payments.
In the body of the request, you need to pass an array containing the JSON representation of the Outgoing Payments that you want to create or update.
Updated Outgoing payments must contain the identifier in the form of metadata.

> Example of creating and updating multiple outgoing payments

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/paymentout"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "333222",
               "organization": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
                   "type": "organization",
                   "mediaType": "application/json"
                 }
               },
               "agent": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                   "type": "counterparty",
                   "mediaType": "application/json"
                 }
               },
               "expenseItem": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
                   "type": "expenseitem",
                   "mediaType": "application/json"
                 }
               }
             },
             {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/99434e4c-3fa0-11e6-8a84-bae50000009c",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata",
                 "type": "paymentout",
                 "mediaType": "application/json"
               },
               "name": "888",
               "description": "NPC",
               "sum": 999,
               "code": "39393",
               "externalCode": "o34bajf214812slkanf",
               "moment": "2012-10-31 15:52:24",
               "applicable": true
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Outgoing payments.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/99434e4c-3fa0-11e6-8a84-bae50000009c",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata",
       "type": "paymentout",
       "mediaType": "application/json"
     },
     "id": "99434e4c-3fa0-11e6-8a84-bae50000009c",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": false,
     "group": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "name": "333222",
     "moment": "2016-06-27 17:52:24",
     "applicable": false,
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "rate": {
       "currency": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       }
     },
     "sum": 0,
     "organization": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     "agent": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
         "type": "counterparty",
         "mediaType": "application/json"
       }
     },
     "organizationAccount": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "agentAccount": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "expenseItem": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
         "type": "expenseitem",
         "mediaType": "application/json"
       }
     }
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/99434e4c-3fa0-11e6-8a84-bae50000009c",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata",
       "type": "paymentout",
       "mediaType": "application/json"
     },
     "id": "99434e4c-3fa0-11e6-8a84-bae50000009c",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": false,
     "group": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-07-01 18:32:14",
     "name": "888",
     "description": "NPC",
     "code": "39393",
     "externalCode": "o34bajf214812slkanf",
     "moment":"2012-10-31 14:52:24",
     "applicable": true,
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "rate": {
       "currency": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       }
     },
     "sum": 999,
     "organization": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     "agent": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
         "type": "counterparty",
         "mediaType": "application/json"
       }
     },
     "organizationAccount": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "agentAccount": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "expenseItem": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
         "type": "expenseitem",
         "mediaType": "application/json"
       }
     }
   }
]
```

### Delete Outgoing payment

**Parameters**

| Parameter | Description |
| ---------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Outgoing payment id. |

> Request to delete an Outgoing payment with the specified id.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/paymentout/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of the Outgoing payment.

### Bulk deletion of Outgoing payments

In the body of the request, you need to pass an array containing the JSON metadata of the Outgoing payments that you want to delete.


> Request for bulk deletion of Outgoing payments.

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/paymentout/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d'[
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/7944ef04-f831-11e5-7a69-971500188b1",
                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata",
                "type": "paymentout",
                "mediaType": "application/json"
            },
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/7944ef04-f831-11e5-7a69-971500188b2",
                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata",
                "type": "paymentout",
                "mediaType": "application/json"
            }
        ]'
```

> Successful request. Result - JSON information about deleting Outgoing payments.

```json
[
   {
     "info":"Entity 'paymentout' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 was deleted successfully"
   },
   {
     "info":"Entity 'paymentout' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Outgoing Payments Metadata
#### Outgoing Payments Metadata
Request to receive metadata of Outgoing payments. The result is a JSON object including:

| Parameter | Description |
| ---------- | ---------- |
| **meta** | Link to Outgoing Payment Metadata |
| **attributes** | Array of objects additional fields of Outgoing payments in the [Metadata](../#kladana-json-api-general-info-metadata) format |
| **states** | Array of statuses of Outgoing payments|
| **createShared** | create new Outgoing payments labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Outgoing Payments Metadata

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional Outgoing payment fields.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata/attributes/ebc68f7a-3f91-11e6-8a84-bae500000102",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "ebc68f7a-3f91-11e6-8a84-bae500000102",
       "name": "Share",
       "type": "double",
       "required": false
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata/attributes/ebc69606-3f91-11e6-8a84-bae500000103",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "ebc69606-3f91-11e6-8a84-bae500000103",
       "name": "Tries",
       "type": "long",
       "required": false
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata/attributes/ebc69be9-3f91-11e6-8a84-bae500000104",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "ebc69be9-3f91-11e6-8a84-bae500000104",
       "name": "Entered",
       "type": "boolean",
       "required": false
     }
   ],
   "createShared": false
}
```

### Separate additional field

**Parameters**

| Parameter | Description |
| ---------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id fields. |
 
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata/attributes/ed00a639-558a-11e6-8a84-bae500000072",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "customEntityMeta": {
     "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/metadata/customEntities/a27aa372-5311-11e6-8a84-bae500000001",
     "type": "customentitymetadata",
     "mediaType": "application/json"
   },
   "id": "ed00a639-558a-11e6-8a84-bae500000072",
   "name": "Entities",
   "type": "customentity",
   "required": false
}
```

### Outgoing payment template
#### Outgoing payment template

> Request to receive an outgoing payment template pre-filled with standard values without being associated with any document.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/paymentout/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d''
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled outgoing payment.

```json
{
   "applicable": true,
   "sum": 0,
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "expenseItem": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     }
   }
}
```

### Outgoing payment template based on another transaction

Request to create a receipt for a prefilled Outgoing payment based on another transaction.
As a result of the request, a pre-filled outgoing payment template will be created based on the submitted document.
> Request for an outgoing payment template based on an order to a vendor.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/paymentout/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             operations: [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/purchaseorder/17a06771-961b-11e6-8a84-bae500000080",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchaseorder/metadata",
                   "type": "purchase order",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled outgoing payment.

```json
{
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 0,
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/b942953e-9128-11e6-8a84-bae500000054",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051/accounts/b932bc5b-9128-11e6-8a84-bae500000052",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "paymentPurpose": "Payment for order No. 00001 dated 2016-10-19 19:42:00. Amount: 0.00 excluding VAT",
   "operations": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchaseorder/17a06771-961b-11e6-8a84-bae500000080",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchaseorder/metadata",
         "type": "purchase order",
         "mediaType": "application/json"
       },
       "linkedSum": 0
     }
   ],
   "expenseItem": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     }
   }
}
```

> Request for outgoing payment template based on Sales Return.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/paymentout/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "operations": [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/3b0f51a4-961b-11e6-8a84-bae500000086",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
                   "type": "sales return",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled outgoing payment.

```json
{
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 0,
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/2b0f10e4-9169-11e6-8a84-bae500000000",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051/accounts/b932bc5b-9128-11e6-8a84-bae500000052",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "paymentPurpose": "Return on invoice No. 00001 dated 2016-10-19 19:43:00. Amount: 0.00 excluding VAT",
   "operations": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/3b0f51a4-961b-11e6-8a84-bae500000086",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
         "type": "sales return",
         "mediaType": "application/json"
       },
       "linkedSum": 0
     }
   ],
   "expenseItem": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/1be2395a-0479-11e5-baee-448a5b426e7e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     }
   }
}
```

> Request to receive an outgoing payment template based on acceptance.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/paymentout/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "operations": [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/supply/0f57efd5-91f3-11e6-8a84-bae500000086",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/supply/metadata",
                   "type": "supply",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled outgoing payment.

```json
{
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 0,
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/b942c396-9128-11e6-8a84-bae500000056",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051/accounts/b932bc5b-9128-11e6-8a84-bae500000052",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "paymentPurpose": "Payment by invoice No. 123 dated 2016-10-14 12:46:00. Amount: 0.00 excluding VAT",
   "operations": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/supply/0f57efd5-91f3-11e6-8a84-bae500000086",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/supply/metadata",
         "type": "supply",
         "mediaType": "application/json"
       },
       "linkedSum": 0
     }
   ],
   "expenseItem": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     }
   }
}
```

> Request for an outgoing payment template based on a vendor invoice.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/paymentout/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "operations": [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/invoicein/e43b34bc-961a-11e6-8a84-bae50000006f",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/invoicein/metadata",
                   "type": "invoice",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled outgoing payment.

```json
{
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 0,
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/b942c396-9128-11e6-8a84-bae500000056",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata","type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051/accounts/b932bc5b-9128-11e6-8a84-bae500000052",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "paymentPurpose": "Payment on account No. 00001 dated 2016-10-19 19:41:00. Amount: 0.00 excluding VAT",
   "operations": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/invoicein/e43b34bc-961a-11e6-8a84-bae50000006f",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/invoicein/metadata",
         "type": "invoice",
         "mediaType": "application/json"
       },
       "linkedSum": 0
     }
   ],
   "expenseItem": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     }
   }
}
```
### Outgoing payment
  
### Get Outgoing payment

**Parameters**

| Parameter | Description |
| ---------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Outgoing payment id. |
  
> Request to receive a separate Outgoing payment with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/paymentout/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Outgoing payment.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/64aa2e8c-3f95-11e6-8a84-bae50000010f",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata",
     "type": "paymentout",
     "mediaType": "application/json"
   },
   "id": "64aa2e8c-3f95-11e6-8a84-bae50000010f",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-07-01 17:09:15",
   "name": "00001",
   "description": "We pay the counterparty",
   "externalCode": "1PPP5fDei13CwEHXYUpV62",
   "moment": "2016-07-01 17:07:00",
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 12525000,
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "contract": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/contract/4680d884-3f95-11e6-8a84-bae50000010c",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/contract/metadata",
       "type": "contract",
       "mediaType": "application/json"
     }
   },
   "project": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/project/722e39f0-313e-11e6-8a84-bae500000008",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
       "type": "project",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/1496c09e-32ca-11e6-8a84-bae50000001b",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata/attributes/ebc69be9-3f91-11e6-8a84-bae500000104",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "ebc69be9-3f91-11e6-8a84-bae500000104",
       "name": "Entered",
       "type": "boolean",
       "value": false
     }
   ],
   "paymentPurpose": "Payment by Invoice for Acceptance",
   "expenseItem": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     }
   },
   "operations": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/supply/90ba347d-6b8b-11e6-8a84-bae5000000bd",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/supply/metadata",
         "type": "supply",
         "mediaType": "application/json"
       },
       "linkedSum": 80000
     }
   ]
}
```

### Change Outgoing payment

Request to update the Outgoing payment with the specified id.
In the body of the request, you can specify only those fields that need to be changed for Outgoing payment, except for those that
are marked `Read-only` in the description of the [outgoing payment attributes](../documents/#transactions-ishodqschij-platezh).

When updating the **organization** and **agent** fields, you must also update the **organizationAccount** and
**agentAccount** respectively, otherwise an error will occur.

To link an outgoing payment to other documents
you need to put in the field under the name **operations** all **meta** of those documents to which you want to link the financial transaction.

Also, for each document, you can specify the amount paid for this document from this payment **linkedSum**.

**Parameters**

| Parameter | Description |
| ---------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Outgoing payment id. |

> Sample request to update a single outgoing payment.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/paymentout/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "888",
             "description": "NPC",
             "sum": 999,
             "code": "39393",
             "externalCode": "o34bajf214812slkanf",
             "moment": "2012-10-31 15:52:24",
             "applicable": true
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Outgoing Payment.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/paymentout/99434e4c-3fa0-11e6-8a84-bae50000009c",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/paymentout/metadata",
     "type": "paymentout",
     "mediaType": "application/json"
   },
   "id": "99434e4c-3fa0-11e6-8a84-bae50000009c",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-07-01 18:32:14",
   "name": "888",
   "description": "NPC",
   "code": "39393",
   "externalCode": "o34bajf214812slkanf",
   "moment": "2012-10-31 14:52:24",
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 999,
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediatype":"application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "expenseItem": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     }
   }
}
```
