## Incoming Payment
### Incoming Payments

Using the JSON API, you can create and update payment information, request lists of Incoming payments and information on individual Incoming payments. The entity code for an Incoming payment in the JSON API is the **paymentin** keyword. Learn more about [Incoming Payment](https://kladana.zendesk.com/hc/en-us/articles/7572476566289-Payments).

#### Entity attributes

| Title | Type | Filtration | Description |
| ------ | -------- | -------- |-----------|
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **agent** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Counterparty metadata<br>`+Required when replying` `+Expand` `+Required when creating` |
| **agentAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Counterparty account metadata<br>`+Expand` |
| **applicable** | Boolean | `=` `!=` | Check mark<br>`+Required when answering` |
| **attributes** | Array(Object) | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields) |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Incoming payment code |
| **contract** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Contract metadata<br>`+Expand` |
| **created** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Creation date<br>`+Required when replying` `+Read only` |
| **deleted** | DateTime | `=` `!=` `<` `>` `<=` `>=` | The moment of the last deletion of the Incoming payment<br>`+Read only` |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Comment of Incoming payment |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | External code of the Incoming payment<br>`+Required when replying` |
| **files** | MetaArray | | [Files](../dictionaries/#entities-files) array metadata (Maximumnumber of files - 100)<br>`+Required when answering` `+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID | `=` `!=` | Incoming payment ID<br>`+Required for response` `+Read only` |
| **incomingDate** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Incoming date |
| **incomingNumber** | Int | `=` `!=` `~` `~=` `=~` | Incoming number |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Incoming payment metadata<br>`+Required when replying` |
| **moment** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Document date<br>`+Required when replying` |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Incoming payment name<br>`+Required when replying` |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Legal entity metadata<br>`+Required when replying` `+Expand` `+Required when creating` |
| **organizationAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Legal entity account metadata<br>`+Expand` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Required when replying` `+Expand` |
| **paymentPurpose** | String(255) | `=` `!=` `~` `~=` `=~` | Purpose of payment<br>`+Required when replying` |
| **printed** | Boolean | `=` `!=` | Is the document printed<br>`+Required when responding` `+Read Only` |
| **project** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Project metadata<br>`+Expand`|
| **published** | Boolean | `=` `!=` | Is the document published<br>`+Required when replying` `+Read Only` |
| **rate** | Object | | Currency. [More details here](../documents/#transactions-currency-in-transactions)<br>`+Required when replying` |
| **shared** | Boolean | `=` `!=` | Sharing<br>`+Required when replying` |
| **salesChannel** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Sales channel metadata<br>`+Expand` |
| **state** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Incoming payment status metadata<br>`+Expand` |
| **sum** | Int | `=` `!=` `<` `>` `<=` `>=` | Amount of the Incoming payment in the specified currency<br>`+Required when replying` `+Read only` |
| **syncId** | UUID | `=` `!=` | Synchronization ID. After filling it is not available for change |
| **updated** | DateTime | `=` `!=` `<` `>` `<=` `>=` | The moment of the last update of the Incoming payment<br>`+Required when replying` `+Read only` |

#### Links to other transactions

| Title| Description|
| --------|---------- |
| **operations** | An array of links to related operations in the format [Metadata](../#kladana-json-api-general-info-metadata) |

Allowed types of linked operations:

+ Buyer order (customerorder)
+ Return to supplier (purchasereturn)
+ Shipment (demand)
+ Invoice to the buyer (invoiceout)

About working with Incoming payments fields can be read [here](../#kladana-json-api-general-info-additional-fields)

### Get Incoming Payments

Request all Incoming payments on this account.
Result: JSON object including fields:

| Title | Type | Description |
| --------|---------- |--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Incoming payments. |

**Parameters**

| Parameter | Description |
| --------|---------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset**| `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** | `string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Receive incoming payments

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/paymentin"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Incoming payments.

```json
{
   "context": {
     "employee": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/context/employee",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     }
   },
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata",
     "type": "paymentin",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/ad1ffc02-3f8e-11e6-8a84-bae5000000fa",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata",
         "type": "paymentin",
         "mediaType": "application/json"
       },
       "id": "ad1ffc02-3f8e-11e6-8a84-bae5000000fa",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "owner": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-07-01 16:21:10",
       "name": "00001",
       "description": "Payment for beautiful eyes",
       "externalCode": "8hBoVBUMiDeumkozzjwX83",
       "moment": "2016-07-01 16:19:00",
       "applicable": true,
       "created": "2016-08-25 19:55:00",
       "printed": true,
       "published": true,
       "rate": {
         "currency": {
           "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "sum": 124124100,
       "organization": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "contract": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/contract/2b34d43f-3f52-11e6-8a84-bae500000066",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/contract/metadata",
           "type": "contract",
           "mediaType": "application/json"
         }
       },
       "project": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/project/722e39f0-313e-11e6-8a84-bae500000008",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/project/metadata",
           "type": "project",
           "mediaType": "application/json"
         }
       },
       "agent": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/1489a08d-32ca-11e6-8a84-bae50000000d",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "state": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata/states/ab8f5213-3f8e-11e6-8a84-bae5000000f5",
           "type": "state",
           "mediaType": "application/json"
         }
       },
       "organizationAccount": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "agentAccount": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/1489a08d-32ca-11e6-8a84-bae50000000d/accounts/1489ad8d-32ca-11e6-8a84-bae50000000e",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "paymentPurpose": "For beautiful eyes",
       "incomingNumber": "12412569",
       "incomingDate": "2016-07-22 00:00:00",
       "operations": [
         {
           "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/retailshift/90ba347d-6b8b-11e6-8a84-bae5000000bd",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/retailshift/metadata",
             "type": "retailshift",
             "mediaType": "application/json"
           },
           "linkedSum": 80000
         }
       ]
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/d57389cb-3d3e-11e6-8a84-bae500000001",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata",
         "type": "paymentin",
         "mediaType": "application/json"
       },
       "id": "d57389cb-3d3e-11e6-8a84-bae500000001",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "owner": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-06-28 17:44:35",
       "name": "00001",
       "externalCode": "221dSpiQiVQuVfCbRun623",
       "moment": "2015-06-22 00:00:00",
       "applicable": true,
       "created": "2016-08-25 19:55:00",
       "printed": true,
       "published": true,
       "rate": {
         "currency": {
           "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "sum": 440000,
       "organization": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "agent": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/c4a418a7-3d2d-11e6-8a84-bae500000003",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "organizationAccount": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "agentAccount": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/c4a418a7-3d2d-11e6-8a84-bae500000003/accounts/c4a423fd-3d2d-11e6-8a84-bae500000004",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "paymentPurpose": "Payment under invoice No. 19111167 dated 06/19/2015 for the provision of the \"Kladana\" service under the offer agreement on the website www.kladana.in/subscription Including VAT (18%), 671.29 rubles",
       "incomingNumber": "408",
       "incomingDate": "2015-06-19 00:00:00",
       "operations": [
         {
           "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/retailshift/90ba347d-6b8b-11e6-8a84-bae5000000bd",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/retailshift/metadata",
             "type": "retailshift",
             "mediaType": "application/json"
           },
           "linkedSum": 80000
         }
       ]
     }
   ]
}
```

### Create Incoming payment

Request to create a new Incoming payment.
Mandatory fields to create:

| Parameter | Description |
| --------|---------- |
| **organization** | Link to your legal entity in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **agent** | Link to the counterparty in the format [Metadata](../#kladana-json-api-general-info-metadata) |

> An example of creating a new Incoming payment with a request body containing only the required fields.

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/paymentin"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "organization": {
               "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                 "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/organization/metadata",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "agent": {
               "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
                 "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                 "type": "counterparty",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Incoming payment.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/85cf9c48-3f92-11e6-8a84-bae500000096",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata",
     "type": "paymentin",
     "mediaType": "application/json"
   },
   "id": "85cf9c48-3f92-11e6-8a84-bae500000096",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-07-01 16:48:42",
   "name": "333222",
   "moment": "2016-06-27 17:52:24",
   "applicable": false,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 0,
   "organization": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
       "type": "account",
       "mediaType": "application/json"
     }
   }
}
```

### Bulk creating and update of Incoming payments

[Bulk creating and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Incoming payments.
In the body of the request, you need to pass an array containing the JSON representation of the Incoming Payments that you want to create or update.
Updated Incoming payments must contain the identifier in the form of metadata.

> Example of creating and updating multiple Incoming payments

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/paymentin"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "333222",
               "organization": {
                 "meta": {
                   "href": "https://api.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                   "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/organization/metadata",
                   "type": "organization",
                   "mediaType": "application/json"
                 }
                },
               "agent": {
                 "meta": {
                   "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
                   "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                   "type": "counterparty",
                   "mediaType": "application/json"
                 }
               }
             },
             {
               "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/85cf9c48-3f92-11e6-8a84-bae500000096",
                 "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata",
                 "type": "paymentin",
                 "mediaType": "application/json"
               },
               "name": "333444",
               "description": "Not Quite New Incoming Payment",
               "code": "101010001",
               "externalCode": "2213sfkksbajf214812slkanf",
               "moment": "2012-06-27 17:52:24",
               "applicable": true,
               "sum": 40020,
               "incomingNumber": "3",
               "incomingDate": "2016-03-17 10:52:24"
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Incoming Payments.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/85cf9c48-3f92-11e6-8a84-bae500000096",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata",
       "type": "paymentin",
       "mediaType": "application/json"
     },
     "id": "85cf9c48-3f92-11e6-8a84-bae500000096",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "owner": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": false,
     "group": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-07-01 16:48:42",
     "name": "333222",
     "moment": "2016-06-27 17:52:24",
     "applicable": false,
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "rate": {
       "currency": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       }
     },
     "sum": 0,
     "organization": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     "agent": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
         "type": "counterparty",
         "mediaType": "application/json"
       }
     },
     "organizationAccount": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "agentAccount": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
         "type": "account",
         "mediaType": "application/json"
       }
     }
   },
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/85cf9c48-3f92-11e6-8a84-bae500000096",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata",
       "type": "paymentin",
       "mediaType": "application/json"
     },
     "id": "85cf9c48-3f92-11e6-8a84-bae500000096",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "owner": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": false,
     "group": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-07-01 16:50:51",
     "name": "333444",
     "description": "Not Quite New Incoming Payment",
     "code": "101010001",
     "externalCode": "2213sfkksbajf214812slkanf",
     "moment": "2012-06-27 16:52:24",
     "applicable": true,
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "rate": {
       "currency": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       }
     },
     "sum": 40020,
     "organization": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     "agent": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
         "type": "counterparty",
         "mediaType": "application/json"
       }
     },
     "organizationAccount": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "agentAccount": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "incomingNumber": "3",
     "incomingDate": "2016-03-17 10:52:24"
   }
]
```

### Delete Incoming payment

**Parameters**

| Parameter | Description |
| --------|---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Incoming payment id. |

> Request to delete an Incoming payment with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.in/api/remap/1.2/entity/paymentin/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of the Incoming payment.

### Bulk deletion of Incoming payments

In the body of the request, you need to pass an array containing the JSON metadata of the Incoming payments that you want to delete.


> Request for bulk deletion of Incoming payments.

```shell
  curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/paymentin/delete"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
     -d'[
          {
              "meta": {
                  "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/7944ef04-f831-11e5-7a69-971500188b1",
                  "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata",
                  "type": "paymentin",
                  "mediaType": "application/json"
              }
          },
          {
              "meta": {
                  "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/7944ef04-f831-11e5-7a69-971500188b2",
                  "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata",
                  "type": "paymentin",
                  "mediaType": "application/json"
              }
          }
        ]'
```

> Successful request. Result - JSON information about deleting Incoming payments.

```json
[
   {
     "info":"Entity 'paymentin' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'paymentin' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Incoming Payments Metadata
#### Incoming Payments Metadata

Request to receive metadata of Incoming payments. The result is a JSON object including:

| Parameter | Description |
| --------|---------- |
| **meta** | Link to metadata of Incoming payments |
| **attributes** | Array of objects additional fields of Incoming payments in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **states** | Array of statuses of Incoming payments |
| **createShared** | create new Incoming payments labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Incoming Payments Metadata

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional fields of Incoming payments.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata/attributes/fd6114e2-3f91-11e6-8a84-bae500000107",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "fd6114e2-3f91-11e6-8a84-bae500000107",
       "name": "Share",
       "type": "long",
       "required": false
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata/attributes/fd611bc1-3f91-11e6-8a84-bae500000108",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "fd611bc1-3f91-11e6-8a84-bae500000108",
       "name": "Tries",
       "type": "long",
       "required": false
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata/attributes/fd612138-3f91-11e6-8a84-bae500000109",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "fd612138-3f91-11e6-8a84-bae500000109",
       "name": "Entered",
       "type": "boolean",
       "required": false
     }
   ],
   "states": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata/states/ab8f5213-3f8e-11e6-8a84-bae5000000f5",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "ab8f5213-3f8e-11e6-8a84-bae5000000f5",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Designed",
       "color": 10066329,
       "stateType": "Regular",
       "entityType": "paymentin"
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata/states/ab8f5a56-3f8e-11e6-8a84-bae5000000f6",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "ab8f5a56-3f8e-11e6-8a84-bae5000000f6",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Translated",
       "color": 10066329,
       "stateType": "Regular",
       "entityType": "paymentin"
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata/states/ab8f612b-3f8e-11e6-8a84-bae5000000f7",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "ab8f612b-3f8e-11e6-8a84-bae5000000f7",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Received",
       "color": 10066329,
       "stateType": "Regular",
       "entityType": "paymentin"
     }
   ],
   "createShared": false
}
```

### Separate additional field

**Parameters**

| Parameter | Description |
| --------|---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id fields. |
 
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata/attributes/04d7d27c-558b-11e6-8a84-bae500000075",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "04d7d27c-558b-11e6-8a84-bae500000075",
   "name": "Imported from bank",
   "type": "boolean",
   "required": false
}
```

### Incoming payment template
#### Incoming payment template

> Request to receive an incoming payment template pre-filled with standard values without linking to any document.

```shell
   curl -X PUT
     "https://api.kladana.in/api/remap/1.2/entity/paymentin/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d''
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled incoming payment.

```json
{
   "applicable": true,
   "sum": 0,
   "organization": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   }
}
```

### Incoming payment template based on another transaction

Request to receive a prefilled incoming payment based on another transaction.
As a result of the request, a pre-filled incoming payment template will be created based on the submitted document.

> Request for an incoming payment template based on a Sales order.

```shell
   curl -X PUT
     "https://api.kladana.in/api/remap/1.2/entity/paymentin/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "operations": [
               {
                 "meta": {
                   "href": "https://api.kladana.in/api/remap/1.2/entity/customerorder/559adab5-915c-11e6-8a84-bae500000014",
                   "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/customerorder/metadata",
                   "type": "customerorder",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled incoming payment.

```json
{
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 0,
   "agent": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051/accounts/b932bc5b-9128-11e6-8a84-bae500000052",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051/accounts/b932bc5b-9128-11e6-8a84-bae500000052",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "paymentPurpose": "Payment for order No. 0302201 dated 2016-10-13 12:38:00. Amount: 0.00 excluding VAT",
   "operations": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/customerorder/559adab5-915c-11e6-8a84-bae500000014",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/customerorder/metadata",
         "type": "customerorder",
         "mediaType": "application/json"
       },
       "linkedSum": 0
     }
   ]
}
```

> Request for an incoming payment template based on a Purchase return.

```shell
   curl -X PUT
     "https://api.kladana.in/api/remap/1.2/entity/paymentin/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "operations": [
               {
                 "meta": {
                   "href": "https://api.kladana.in/api/remap/1.2/entity/purchasereturn/4f5e259b-961a-11e6-8a84-bae500000066",
                   "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
                   "type": "purchasereturn",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled incoming payment.

```json
{
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 0,
   "agent": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051/accounts/b932bc5b-9128-11e6-8a84-bae500000052",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051/accounts/b932bc5b-9128-11e6-8a84-bae500000052",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "paymentPurpose": "Payment on return to supplier No. 00001 dated 2016-10-19 19:37:00. Amount: 0.00 excluding VAT",
   "operations": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/purchasereturn/4f5e259b-961a-11e6-8a84-bae500000066",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
         "type": "purchasereturn",
         "mediaType": "application/json"
       },
       "linkedSum": 0
     }
   ]
}
```

> Request to receive an incoming payment template based on a Shipment.

```shell
   curl -X PUT
     "https://api.kladana.in/api/remap/1.2/entity/paymentin/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "operations": [
               {
                 "meta": {
                   "href": "https://api.kladana.in/api/remap/1.2/entity/demand/06406b97-9138-11e6-8a84-bae500000000",
                   "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/demand/metadata",
                   "type": "demand",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled incoming payment.

```json
{
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 0,
   "agent": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051/accounts/b932bc5b-9128-11e6-8a84-bae500000052",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051/accounts/b932bc5b-9128-11e6-8a84-bae500000052",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "paymentPurpose": "Payment for shipment No. 000201 dated 2016-10-13 12:38:00. Amount: 0.00 excluding VAT",
   "operations": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/demand/06406b97-9138-11e6-8a84-bae500000000",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/demand/metadata",
         "type": "demand",
         "mediaType": "application/json"
       },
       "linkedSum": 0
     }
   ]
}
```

> Request for an incoming payment template based on the Sales Invoice.

```shell
   curl -X PUT
     "https://api.kladana.in/api/remap/1.2/entity/paymentin/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "operations": [
               {
                 "meta": {
                   "href": "https://api.kladana.in/api/remap/1.2/entity/invoiceout/6cb87758-95f4-11e6-8a84-bae500000067",
                   "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/invoiceout/metadata",
                   "type": "invoiceout",
                   "mediaType": "application/json"
                 }
               }
             ]
            }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled incoming payment.

```json
 {
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 0,
   "agent": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/2b0f10e4-9169-11e6-8a84-bae500000000",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051/accounts/b932bc5b-9128-11e6-8a84-bae500000052",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "paymentPurpose": "Payment on account No. 53252 dated 2016-10-19 15:06:00. Amount: 0.00 excluding VAT",
   "operations": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/invoiceout/6cb87758-95f4-11e6-8a84-bae500000067",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/invoiceout/metadata",
         "type": "invoiceout",
         "mediaType": "application/json"
       },
       "linkedSum": 0
     }
   ]
 }
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled incoming payment.

```json
{
   "owner": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/employee/b905bfb0-9128-11e6-8a84-bae50000002a",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/group/b8ba0d3f-9128-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2016-11-25 18:13:31",
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 10350000,
   "contract": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/contract/c3057574-ab01-11e6-8a84-bae500000070",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/contract/metadata",
       "type": "contract",
       "mediaType": "application/json"
     }
   },
   "project": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/project/6c6dd3f9-97a1-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/project/metadata",
       "type": "project",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/b942c396-9128-11e6-8a84-bae500000056",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051/accounts/b932bc5b-9128-11e6-8a84-bae500000052",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "paymentPurpose": "Payment according to the received commission agent's report No. 0000000000000001 dated 2016-11-25 18:07:00. Amount: 103,500.00 excluding VAT",
   "vatSum": 0,
   "operations": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/commissionreportin/fe44fe4f-b320-11e6-8a84-bae500000092",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/commissionreportin/metadata",
         "type": "commissionreportin",
         "mediaType": "application/json"
       },
       "linkedSum": 10350000
     }
   ]
}
```

### Receive Incoming payment

**Parameters**

| Parameter | Description |
| --------|---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Incoming payment id. |
 
> Request to receive a separate Incoming payment with the specified id.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/paymentin/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Incoming payment.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/ad1ffc02-3f8e-11e6-8a84-bae5000000fa",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata",
     "type": "paymentin",
     "mediaType": "application/json"
   },
   "id": "ad1ffc02-3f8e-11e6-8a84-bae5000000fa",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-07-01 16:21:10",
   "name": "00001",
   "description": "Payment for beautiful eyes",
   "externalCode": "8hBoVBUMiDeumkozzjwX83",
   "moment": "2016-07-01 16:19:00",
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 124124100,
   "organization": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "contract": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/contract/2b34d43f-3f52-11e6-8a84-bae500000066",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/contract/metadata",
       "type": "contract",
       "mediaType": "application/json"
     }
   },
   "project": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/project/722e39f0-313e-11e6-8a84-bae500000008",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/project/metadata",
       "type": "project",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/1489a08d-32ca-11e6-8a84-bae50000000d",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata/states/ab8f5213-3f8e-11e6-8a84-bae5000000f5",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/1489a08d-32ca-11e6-8a84-bae50000000d/accounts/1489ad8d-32ca-11e6-8a84-bae50000000e",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "paymentPurpose": "For beautiful eyes",
   "incomingNumber": "12412569",
   "incomingDate": "2016-07-22 00:00:00"
}
```

### Edit Incoming payment

Request to update an Incoming payment with the specified id.
In the request body, you can specify only those fields that need to be changed for the Incoming payment, except for those that
are marked `Read Only` in the description of [Incoming payment attributes](../documents/#transactions-incoming-payment).
When updating the **organization** and **agent** fields, you must also update the **organizationAccount** and
**agentAccount** respectively, otherwise an error will occur. 

To link an incoming payment to other documents
you need to put in the field under the name **operations** all **meta** of those documents to which you want to link the financial transaction.
Also, for each document, you can specify the amount paid for this document from this payment **linkedSum**.

**Parameters**

| Parameter | Description |
| --------|---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Incoming payment id. |

> An example of a request to update a single Incoming payment.

```shell
   curl -X PUT
     "https://api.kladana.in/api/remap/1.2/entity/paymentin/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "333444",
             "description": "Not Quite New Incoming Payment",
             "code": "101010001",
             "externalCode": "2213sfkksbajf214812slkanf",
             "moment": "2012-06-27 17:52:24",
             "applicable": true,
             "sum": 40020,
             "incomingNumber": "3",
             "incomingDate": "2016-03-17 10:52:24"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Incoming Payment.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/paymentin/85cf9c48-3f92-11e6-8a84-bae500000096",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/paymentin/metadata",
     "type": "paymentin",
     "mediaType": "application/json"
   },
   "id": "85cf9c48-3f92-11e6-8a84-bae500000096",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-07-01 16:50:51",
   "name": "333444",
   "description": "Not Quite New Incoming Payment",
   "code": "101010001",
   "externalCode": "2213sfkksbajf214812slkanf",
   "moment": "2012-06-27 16:52:24",
   "applicable": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 40020,
   "organization": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "incomingNumber": "3",
   "incomingDate": "2016-03-17 10:52:24"
}
