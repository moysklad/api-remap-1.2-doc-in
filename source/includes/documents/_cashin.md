## Incoming Cash Payment
### Incoming Cash Payments

Using the JSON API, you can create and update information about Incoming Cash Payments and query lists of Incoming Cash Payments. The entity code for a Incoming Cash Payment in the JSON API is the **cashin** keyword.

#### Entity attributes

| Title | Type | Filtration | Description |
| ------- | ------ | ------- |-------|
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **agent** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Counterparty metadata<br>`+Required when replying` `+Expand` `+Required when creating` |
| **applicable** | Boolean | `=` `!=` | Check mark<br>`+Required when answering` |
| **attributes** | Array(Object) | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields) |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Incoming Cash Payment Code |
| **contract** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Contract metadata<br>`+Expand` |
| **created** | datetime | `=` `!=` `<` `>` `<=` `>=` | Creation date<br>`+Required when replying` `+Read only` |
| **deleted** | datetime | `=` `!=` `<` `>` `<=` `>=` | Time of last deletion of the Incoming Cash Payment<br>`+Read Only` |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Incoming Cash Payment Commentary |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | External Code of the Incoming Cash Payment<br>`+Required when replying` |
| **files** | MetaArray || [Files] array metadata(../dictionaries/#entities-fajly) (Maximum number of files - 100)<br>`+Required when replying` `+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID | `=` `!=` | Incoming Cash Payment ID<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Incoming Cash Payment Metadata<br>`+Required when replying` |
| **moment** | datetime | `=` `!=` `<` `>` `<=` `>=` | Document date<br>`+Required when replying` |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Name of Incoming Cash Payment<br>`+Required when replying` |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Legal entity metadata<br>`+Required when replying` `+Expand` `+Required when creating` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Required when replying` `+Expand` |
| **paymentPurpose** | String(255) | `=` `!=` `~` `~=` `=~` | Reason<br>`+Required when answering` |
| **printed** | Boolean | `=` `!=` | Is the document printed<br>`+Required when responding` `+Read Only` |
| **project** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Project metadata<br>`+Expand` |
| **published** | Boolean | `=` `!=` | Is the document published<br>`+Required when replying` `+Read Only` |
| **rate** | object | | Currency. [More details here](../documents/#transactions-currency-in-transactions)<br>`+Required when replying` |
| **salesChannel** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Sales channel metadata<br>`+Expand`|
| **shared** | Boolean | `=` `!=` | Sharing<br>`+Required when replying` |
| **state** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Incoming Cash Payment Status Metadata<br>`+Expand` |
| **sum** | int | `=` `!=` `<` `>` `<=` `>=` | Amount of the Incoming Cash Payment in the specified currency<br>`+Required when replying` `+Read Only` |
| **syncId** | UUID | `=` `!=` | Synchronization ID. After filling it is not available for change |
| **updated** | datetime | `=` `!=` `<` `>` `<=` `>=` | Time of last update of the Incoming Cash Payment<br>`+Required when replying` `+Read Only` |
| **vatSum** | float | | VAT amount<br>`+Required when answering` |

#### Links to other transactions

| Title | Description |
| --------- | ------------- |
| **operations** | An array of links to related operations in the format [Metadata](../#kladana-json-api-general-info-metadata) |

Allowed types of linked operations:

+ Buyer order (customerorder)
+ Return to supplier (purchasereturn)
+ Shipment (demand)
+ Invoice to the buyer (invoiceout)

About working with fields of Incoming Cash Payments can be read [here](../#kladana-json-api-general-info-additional-fields)


### Get Incoming Cash Payments

Request all Incoming Cash Payments on this account.
Result: JSON object including fields:

| Title | Type | Description |
| ------- | ------- |-------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Incoming Cash Payments. |

**Parameters**

| Parameter | Description |
| ------- |-------|
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** | `string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Get Incoming Cash Payments

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/cash"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Incoming Cash Payments list.

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
     "href": "https://app.kladana.in/api/remap/1.2/entity/cashin",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata",
     "type": "cash",
     "mediaType": "application/json",
     size: 3
     limit: 1000
     offset: 0
   },
   rows: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/07ea2c6f-3fad-11e6-8a84-bae50000013f",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata",
         "type": "cash",
         "mediaType": "application/json"
       },
       "id": "07ea2c6f-3fad-11e6-8a84-bae50000013f",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       shared: false
       group: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-07-04 08:58:24",
       "name": "00003",
       "description": "And another incoming cash payment",
       "externalCode": "0fI6AjAHh-x1oYYNwBYeN1",
       "moment": "2016-07-04 08:57:00",
       "applicable": false
       "created": "2016-08-25 19:55:00",
       "printed": true
       "published": true
       rate: {
         currency: {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       sum: 132000
       organization: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       contract: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/contract/0028cec8-3fad-11e6-8a84-bae50000013c",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/contract/metadata",
           "type": "contract",
           "mediaType": "application/json"
         }
       },
       agent: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/15121cef-32ca-11e6-8a84-bae500000072",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
           "type": "counter party",
           "mediaType": "application/json"
         }
       },
       state: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/states/aaa6d501-3fac-11e6-8a84-bae50000012e",
           "type": "state",
           "mediaType": "application/json"
         }
       },
       "paymentPurpose": "And one more order payment.",
       operations: [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/retailshift/90ba347d-6b8b-11e6-8a84-bae5000000bd",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/retailshift/metadata",
             "type": "retailshift",
             "mediaType": "application/json"
           },
           "linkedSum": 80000
         }
       ]
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/b0ec3c98-3fac-11e6-8a84-bae500000131",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata",
         "type": "cash",
         "mediaType": "application/json"
       },
       "id": "b0ec3c98-3fac-11e6-8a84-bae500000131",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       shared: true
       group: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-07-04 08:55:58",
       "name": "00001",
       "description": "Incoming Cash Payment.",
       "externalCode": "E7vH1TaKii9bkuw2pekD22",
       "moment": "2016-07-04 08:54:00",
       "applicable": true
       "created": "2016-08-25 19:55:00",
       "printed": true
       "published": true
       rate: {
         currency: {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/currency/cdbc62de-3f68-11e6-8a84-bae500000050",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         },
         value: 63
       },
       sum: 3189
       organization: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       contract: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/contract/2b34d43f-3f52-11e6-8a84-bae500000066",
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
       agent: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/1489a08d-32ca-11e6-8a84-bae50000000d",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
           "type": "counter party",
           "mediaType": "application/json"
         }
       },
       state: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/states/aaa6c45a-3fac-11e6-8a84-bae50000012b",
           "type": "state",
           "mediaType": "application/json"
         }
       },
       "paymentPurpose": "Order payment",
       operations: [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/retailshift/90ba347d-6b8b-11e6-8a84-bae5000000bd",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/retailshift/metadata",
             "type": "retailshift",
             "mediaType": "application/json"
           },
           "linkedSum": 80000
         }
       ]
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/df861103-3fac-11e6-8a84-bae500000137",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata",
         "type": "cash",
         "mediaType": "application/json"
       },
       "id": "df861103-3fac-11e6-8a84-bae500000137",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       shared: false
       group: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-07-04 08:57:19",
       "name": "00002",
       "description": "Another credit note.",
       "externalCode": "FEYR3meShqh5ICWNygGeq0",
       "moment": "2016-07-04 08:56:00",
       "applicable": true
       "created": "2016-08-25 19:55:00",
       "printed": true
       "published": true
       rate: {
         currency: {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       sum: 1700000
       organization: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       contract: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/contract/c556343a-3fac-11e6-8a84-bae500000134",
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
       agent: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/14c505eb-32ca-11e6-8a84-bae500000045",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
           "type": "counter party",
           "mediaType": "application/json"
         }
       },
       state: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/states/aaa6cfcf-3fac-11e6-8a84-bae50000012d",
           "type": "state",
           "mediaType": "application/json"
         }
       },
       "paymentPurpose": "Second order payment"
     }
   ]
}
```

### Create Incoming Cash Payment

Request to create a new Incoming Cash Payment.
Mandatory fields to create:

| Title | Description |
| ------- |-------|
| **organization** | Link to your legal entity in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **agent** | Link to the counterparty in the format [Metadata](../#kladana-json-api-general-info-metadata) |

> An example of creating a new Incoming Cash Payment with a request body containing only the required fields.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/cash"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             organization: {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             agent: {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                 "type": "counter party",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Incoming Cash Payment.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/3fd08b2d-41b0-11e6-8a84-bae500000000",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata",
     "type": "cash",
     "mediaType": "application/json"
   },
   "id": "3fd08b2d-41b0-11e6-8a84-bae500000000",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "name": "000712",
   "moment": "2012-06-10 09:52:24",
   rate: {
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   agent: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   }
}
```

### Incoming Cash Payment bulk creating and update

[Bulk creating and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) Incoming Cash Payments.
In the body of the request, you need to pass an array containing JSON representations of the Incoming Cash Payments that you want to create or update.
Incoming Cash Payments that are updated must contain the identifier in the form of metadata.

> Example of creating and updating multiple Incoming Cash Payments

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/cash"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "000712",
               organization: {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
                   "type": "organization",
                   "mediaType": "application/json"
                 }
               },
               agent: {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                   "type": "counter party",
                   "mediaType": "application/json"
                 }
               }
             },
             {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/3fd08b2d-41b0-11e6-8a84-bae500000000",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata",
                 "type": "cash",
                 "mediaType": "application/json"
               },
               "owner": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/employee/f3c5d206-dafc-4eb3-8678-f97e76964e1d",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
                   "type": "employee",
                   "mediaType": "application/json"
                 }
               },
               shared: true
               "name": "000722",
               "description": "Incoming Cash Payment created and modified via API",
               "code": "333712366",
               "externalCode": "103kek312",
               "moment": "2016-06-10 09:52:24",
               "applicable": false
               sum: 555000
               "paymentPurpose": "Payment for order #0046",
               "attributes": [
                 {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/attributes/c57c1f22-3fae-11e6-8a84-bae500000142",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   value: 12
                 },
                 {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/attributes/c57c2526-3fae-11e6-8a84-bae500000143",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   "value": true
                 },
                 {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/attributes/c57c2a5c-3fae-11e6-8a84-bae500000144",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   value: 3.13
                 }
               ]
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Incoming Cash Payments.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/3fd08b2d-41b0-11e6-8a84-bae500000000",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata",
       "type": "cash",
       "mediaType": "application/json"
     },
     "id": "3fd08b2d-41b0-11e6-8a84-bae500000000",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     group: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "name": "000712",
     "moment": "2012-06-10 09:52:24",
     rate: {
       currency: {"meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       }
     },
     organization: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     agent: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
         "type": "counter party",
         "mediaType": "application/json"
       }
     }
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/3fd08b2d-41b0-11e6-8a84-bae500000000",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata",
       "type": "cash",
       "mediaType": "application/json"
     },
     "id": "3fd08b2d-41b0-11e6-8a84-bae500000000",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/f3c5d206-dafc-4eb3-8678-f97e76964e1d",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     shared: true
     group: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-07-04 09:54:38",
     "name": "000722",
     "description": "Incoming Cash Payment created and modified via API",
     "code": "333712366",
     "externalCode": "103kek312",
     "moment": "2016-06-10 09:52:24",
     "applicable": false
     "created": "2016-08-25 19:55:00",
     "printed": true
     "published": true
     rate: {
       currency: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       }
     },
     sum: 3700
     organization: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     agent: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
         "type": "counter party",
         "mediaType": "application/json"
       }
     },
     "attributes": [
       {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/attributes/c57c1f22-3fae-11e6-8a84-bae500000142",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "c57c1f22-3fae-11e6-8a84-bae500000142",
         "name": "AttributeName1",
         "type": "long",
         value: 12
       },
       {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/attributes/c57c2526-3fae-11e6-8a84-bae500000143",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "c57c2526-3fae-11e6-8a84-bae500000143",
         "name": "AttributeName2",
         "type": "boolean",
         "value": true
       },
       {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/attributes/c57c2a5c-3fae-11e6-8a84-bae500000144",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "c57c2a5c-3fae-11e6-8a84-bae500000144",
         "name": "AttributeName3",
         "type": "double",
         value: 3.13
       }
     ],
     "paymentPurpose": "Payment for order #0046"
   }
]
```

### Delete Incoming Cash Payment

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Incoming Cash Payment id. |

> Request to delete a Incoming Cash Payment with specified id.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/cashin/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of the Incoming Cash Payment.

### Bulk deletion of Incoming Cash Payments

In the body of the request, you need to pass an array containing the JSON metadata of the Incoming Cash Payments that you want to delete.


> Request for bulk deletion of Incoming Cash Payments.

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/cashin/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d'[
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/7944ef04-f831-11e5-7a69-971500188b1",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata",
             "type": "cash",
             "mediaType": "application/json"
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/7944ef04-f831-11e5-7a69-971500188b2",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata",
             "type": "cash",
             "mediaType": "application/json"
         }
       ]'
```

> Successful request. The result is JSON information about deleting Incoming Cash Payments.

```json
[
   {
     "info":"Entity 'cashin' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 deleted successfully"
   },
   {
     "info":"Entity 'cashin' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Incoming Cash Payment Metadata
#### Incoming Cash Payment Metadata
Request to receive metadata of Incoming Cash Payments. The result is a JSON object including:

| Parameter | Description |
| -------- | --------- |
| **meta** | Link to Incoming Cash Payments Metadata |
| **attributes** | Array of objects additional fields of Incoming Cash Payments in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **states** | Array of statuses of Incoming Cash Payments |
| **createShared** | create new Incoming Cash Payments labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Metadata of Incoming Cash Payments

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional fields of Incoming Cash Payments.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/attributes/c57c1f22-3fae-11e6-8a84-bae500000142",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c57c1f22-3fae-11e6-8a84-bae500000142",
       "name": "AttributeName1",
       "type": "long",
       "required": false
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/attributes/c57c2526-3fae-11e6-8a84-bae500000143",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c57c2526-3fae-11e6-8a84-bae500000143",
       "name": "AttributeName2",
       "type": "boolean",
       "required": false
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/attributes/c57c2a5c-3fae-11e6-8a84-bae500000144",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c57c2a5c-3fae-11e6-8a84-bae500000144",
       "name": "AttributeName3",
       "type": "double",
       "required": false
     }
   ],
   "states": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/states/aaa6c45a-3fac-11e6-8a84-bae50000012b",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "aaa6c45a-3fac-11e6-8a84-bae50000012b",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Sent",
       "color": 15280409,
       "stateType": "Regular",
       "entityType": "cache"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/states/aaa6ca7a-3fac-11e6-8a84-bae50000012c",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "aaa6ca7a-3fac-11e6-8a84-bae50000012c",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Accepted",
       "color": 34617,
       "stateType": "Regular",
       "entityType": "cache"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/states/aaa6cfcf-3fac-11e6-8a84-bae50000012d",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "aaa6cfcf-3fac-11e6-8a84-bae50000012d",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Expected",
       "color": 15106326,
       "stateType": "Regular",
       "entityType": "cache"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/states/aaa6d501-3fac-11e6-8a84-bae50000012e",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "aaa6d501-3fac-11e6-8a84-bae50000012e",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Designed",
       "color": 10774205,
       "stateType": "Regular",
       "entityType": "cache"
     }
   ],
   "createShared": false
}

```

### Separate additional field

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id fields. |

> Request for information on a separate additional field.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/attributes/c7f589f9-558a-11e6-8a84-bae50000006f",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "c7f589f9-558a-11e6-8a84-bae50000006f",
   "name": "AttributeName1",
   "type": "long",
   "required": false
}
```

### Incoming Cash Payment Template
#### Incoming Cash Payment Template
> Request for a pre-filled incoming receipt with standard fields without linking to any other documents.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/cashin/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d''
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Incoming Cash Payment.

```json
{
   "applicable": true
   sum: 0
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   }
}
```

### Incoming Cash Payment template based on another transaction

Request to receive a receipt template based on another transaction.
As a result of the request, there will be a pre-filled Incoming Cash Payment based on the transferred document.

> Request a receipt template based on a Sales order.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/cashin/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             operations: [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/559adab5-915c-11e6-8a84-bae500000014",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/customerorder/metadata",
                   "type": "customer order",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Incoming Cash Payment.

```json
{
   "applicable": true
   "created": "2016-08-25 19:55:00",
   "printed": true
   "published": true
   rate: {
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   sum: 0
   agent: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "paymentPurpose": "Payment for order No. 0302201 dated 2016-10-13 12:38:00. Amount: 0.00 excluding VAT",
   operations: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/559adab5-915c-11e6-8a84-bae500000014",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/customerorder/metadata",
         "type": "customer order",
         "mediaType": "application/json"
       },
       "linkedSum": 0
     }
   ]
}
```

> Request for receipt template based on return to vendor.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/cashin/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             operations: [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/4f5e259b-961a-11e6-8a84-bae500000066",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
                   "type": "purchase return",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Incoming Cash Payment.

```json
{
   "applicable": true
   "created": "2016-08-25 19:55:00",
   "printed": true
   "published": true
   rate: {
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   sum: 0
   agent: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "paymentPurpose": "Payment on return to supplier No. 00001 dated 2016-10-19 19:37:00. Amount: 0.00 excluding VAT",
   operations: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/4f5e259b-961a-11e6-8a84-bae500000066",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
         "type": "purchase return",
         "mediaType": "application/json"
       },
       "linkedSum": 0
     }
   ]
}
```

> Request a receipt template based on a shipment.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/cashin/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             operations: [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/demand/06406b97-9138-11e6-8a84-bae500000000",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
                   "type": "demand",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Incoming Cash Payment.

```json
{
   "applicable": true
   "created": "2016-08-25 19:55:00",
   "printed": true
   "published": true
   rate: {
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   sum: 0
   agent: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "paymentPurpose": "Payment for shipment No. 000201 dated 2016-10-13 12:38:00. Amount: 0.00 without VAT",
   operations: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/06406b97-9138-11e6-8a84-bae500000000",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
         "type": "demand",
         "mediaType": "application/json"
       },
       "linkedSum": 0
     }
   ]
}
```

> Request for a receipt template based on a customer invoice.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/cashin/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             operations: [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/invoiceout/6cb87758-95f4-11e6-8a84-bae500000067",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/invoiceout/metadata",
                   "type": "invoiceout",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Incoming Cash Payment.

```json
{
   "applicable": true
   "created": "2016-08-25 19:55:00",
   "printed": true
   "published": true
   rate: {
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   sum: 0
   agent: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/2b0f10e4-9169-11e6-8a84-bae500000000",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "paymentPurpose": "Payment on account No. 53252 dated 2016-10-19 15:06:00. Amount: 0.00 excluding VAT",
   operations: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/invoiceout/6cb87758-95f4-11e6-8a84-bae500000067",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/invoiceout/metadata",
         "type": "invoiceout",
         "mediaType": "application/json"
       },
       "linkedSum": 0
     }
   ]
}

```
> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Incoming Cash Payment.

```json
{
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/b905bfb0-9128-11e6-8a84-bae50000002a",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   shared: false
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/b8ba0d3f-9128-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2016-11-25 18:09:50",
   "applicable": true
   "created": "2016-08-25 19:55:00",
   "printed": true
   "published": true
   rate: {
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   sum: 10350000,
   contract: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/contract/c3057574-ab01-11e6-8a84-bae500000070",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/contract/metadata",
       "type": "contract",
       "mediaType": "application/json"
     }
   },
   "project": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/project/6c6dd3f9-97a1-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
       "type": "project",
       "mediaType": "application/json"
     }
   },
   agent: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/b942c396-9128-11e6-8a84-bae500000056",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "vatSum": 0,
   operations: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/commissionreportin/fe44fe4f-b320-11e6-8a84-bae500000092",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/commissionreportin/metadata",
         "type": "commission report",
         "mediaType": "application/json"
       },
       "linkedSum": 10350000
     }
   ]
}
```

### Incoming Cash Payment

### Get Incoming Cash Payment

**Parameters**

| Parameter | Description |
| ------- |-------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Incoming Cash Payment. |

> Request for a separate Incoming Cash Payment with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/cashin/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Incoming Cash Payment.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/b0ec3c98-3fac-11e6-8a84-bae500000131",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata",
     "type": "cash",
     "mediaType": "application/json"
   },
   "id": "b0ec3c98-3fac-11e6-8a84-bae500000131",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   shared: true
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-07-04 08:55:58",
   "name": "00001",
   "description": "Incoming Cash Payment.",
   "externalCode": "E7vH1TaKii9bkuw2pekD22",
   "moment": "2016-07-04 08:54:00",
   "applicable": true
   "created": "2016-08-25 19:55:00",
   "printed": true
   "published": true
   rate: {
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/cdbc62de-3f68-11e6-8a84-bae500000050",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     },
     value: 63
   },
   sum: 3189
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   contract: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/contract/2b34d43f-3f52-11e6-8a84-bae500000066",
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
   agent: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/1489a08d-32ca-11e6-8a84-bae50000000d",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   state: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/states/aaa6c45a-3fac-11e6-8a84-bae50000012b",
       "type": "state",
       mediatype:"application/json"
     }
   },
   "paymentPurpose": "Order payment",
   operations: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/retailshift/90ba347d-6b8b-11e6-8a84-bae5000000bd",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/retailshift/metadata",
         "type": "retailshift",
         "mediaType": "application/json"
       },
       "linkedSum": 80000
     }
   ]
}
```

### Change Incoming Cash Payment

Request to update the Incoming Cash Payment with the specified id.
In the request body, you can specify only those fields that need to be changed for the Incoming Cash Payment, except for those that
are marked `Read-only` in the description of the [Incoming Cash Payment Attributes](../documents/#transactions-incoming-cash-payment).

When updating the **organization** and **agent** fields, you must also update the **organizationAccount** and
**agentAccount** respectively, otherwise an error will occur.

To link a Incoming Cash Payment to other documents
you need to put in the field under the name **operations** all **meta** of those documents to which you want to link the financial transaction.
Also, for each document, you can specify the amount paid for this document from this payment **linkedSum**.

**Parameters**

| Parameter | Description |
| ------- |-------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Incoming Cash Payment id. |

> An example of a request to update a single Incoming Cash Payment.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/cashin/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "owner": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/employee/f3c5d206-dafc-4eb3-8678-f97e76964e1d",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
                 "type": "employee",
                 "mediaType": "application/json"
               }
             },
             shared: true
             "name": "000722",
             "description": "Incoming Cash Payment created and modified via API",
             "code": "333712366",
             "externalCode": "103kek312",
             "moment": "2016-06-10 09:52:24",
             "applicable": false
             sum: 555000
             "paymentPurpose": "Payment for order #0046",
             "attributes": [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/attributes/c57c1f22-3fae-11e6-8a84-bae500000142",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 value: 12
               },
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/attributes/c57c2526-3fae-11e6-8a84-bae500000143",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": true
               },
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/attributes/c57c2a5c-3fae-11e6-8a84-bae500000144",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 value: 3.13
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Incoming Cash Payment.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/3fd08b2d-41b0-11e6-8a84-bae500000000",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata",
     "type": "cash",
     "mediaType": "application/json"
   },
   "id": "3fd08b2d-41b0-11e6-8a84-bae500000000",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/f3c5d206-dafc-4eb3-8678-f97e76964e1d",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   shared: true
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-07-04 09:54:38",
   "name": "000722",
   "description": "Incoming Cash Payment created and modified via API",
   "code": "333712366",
   "externalCode": "103kek312",
   "moment": "2016-06-10 09:52:24",
   "applicable": false
   "created": "2016-08-25 19:55:00",
   "print": true,
   "published": true
   rate: {
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   sum: 3700
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   agent: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/attributes/c57c1f22-3fae-11e6-8a84-bae500000142",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c57c1f22-3fae-11e6-8a84-bae500000142",
       "name": "AttributeName1",
       "type": "long",
       value: 12
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/attributes/c57c2526-3fae-11e6-8a84-bae500000143",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c57c2526-3fae-11e6-8a84-bae500000143",
       "name": "AttributeName2",
       "type": "boolean",
       "value": true
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata/attributes/c57c2a5c-3fae-11e6-8a84-bae500000144",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c57c2a5c-3fae-11e6-8a84-bae500000144",
       "name": "AttributeName3",
       "type": "double",
       value: 3.13
     }
   ],
   "paymentPurpose": "Payment for order #0046"
}
```
