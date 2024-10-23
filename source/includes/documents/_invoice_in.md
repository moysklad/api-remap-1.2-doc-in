## Supplier Invoice
### Supplier Invoices

Using the JSON API, you can create and update Supplier Invoice information, query lists of Accounts, and query individual Supplier Invoices. Account items can be managed both as part of a separate Account, and separately with the help of special resources for managing Supplier Invoice items. The entity code for the Supplier Invoice as part of the JSON API is the **invoicein** keyword. [Learn more ](https://kladana.zendesk.com/hc/en-us/articles/360017534277-Create-Supplier-Invoices) about Supplier Invoices and how to work with them in Kladana. 

#### Entity attributes

| Title | Type     | Filtration | Description |
| ------ | --------- | -------- | ------- |
| **accountId** | UUID                                               | `=` `!=` | Account ID<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **agent** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Account metadata<br>`+Required when replying` `+Expand` `+Required when creating` `+Change-handler` |
| **agentAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Counterparty account metadata<br>`+Expand` `+Change-handler` |
| **applicable** | Boolean                                            | `=` `!=` | Handling flag<br>`+Required when replying` `+Change-handler` |
| **attributes** | Array(Object)                                      | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields)<br>`+Change-handler` |
| **code** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Supplier Invoice Code |
| **contract** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Contract metadata<br>`+Expand` `+Change-handler` |
| **created** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Creation date<br>`+Required for response` `+Read-only` `+Change-handler` |
| **deleted** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | The moment of the last deletion of the Supplier Invoice<br>`+Read Only`|
| **description** | String(4096)                                       | `=` `!=` `~` `~=` `=~` | Supplier Invoice Comment<br>`+Change-handler` |
| **externalCode** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Supplier Invoice external code<br>`+Required when replying` `+Change-handler` |
| **files** | MetaArray                                          | | [Files](../dictionaries/#entities-files) array metadata (Maximum number of files - 100)<br>`+Required when replying` `+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID                                               | `=` `!=` | Supplier Invoice ID<br>`+Required for response` `+Read-only` `+Change-handler` |
| **incomingDate** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Incoming date<br>`+Change-handler` |
| **incomingNumber** | Float                                              | `=` `!=` `~` `~=` `=~` | Incoming number<br>`+Change-handler` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Supplier Invoice Metadata<br>`+Required on Response` `+Change-handler` |
| **moment** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Document date<br>`+Required when replying` `+Change-handler` |
| **name** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Supplier Invoice Name<br>`+Required when replying` `+Change-handler` |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Legal entity metadata<br>`+Required when responding` `+Expand` `+Required when creating` `+Change-handler` |
| **organizationAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Legal entity account metadata<br>`+Expand` `+Change-handler` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`| Owner (Employee)<br>`+Expand` |
| **paidSum** | Float                                              | | Amount of incoming payments on Supplier's Account<br>`+Required for response` `+Read-only` `+Change-handler` |
| **paymentPlannedMoment** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Planned payment date<br>`+Change-handler` |
| **positions** | MetaArray                                          | | Supplier Invoice item metadata<br>`+Required for response` `+Expand` `+Change-handler` |
| **printed** | Boolean                                            | `=` `!=` | Is the document printed<br>`+Required when responding` `+Read Only` |
| **project** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Project metadata<br>`+Expand` `+Change-handler` |
| **published** | Boolean                                            | `=` `!=` | Is the document published<br>`+Required when replying` `+Read Only` |
| **rate** | Object                                             | | Currency. [Learn more](../documents/#transactions-currency-in-transactions)<br>`+Required when replying` `+Change-handler` |
| **shared** | Boolean                                            | `=` `!=` | Sharing<br>`+Required when replying` |
| **shippedSum** | Float                                              | | Amount of shipped<br>`+Required for response` `+Read-only` `+Change-handler` |
| **state** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Account status metadata<br>`+Expand` `+Change-handler` |
| **store** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Warehouse metadata<br>`+Expand` `+Change-handler` |
| **sum** | Int                                                | `=` `!=` `<` `>` `<=` `>=` | Invoice amount in specified currency<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **syncId** | UUID                                               | `=` `!=` | Synchronization ID. After filling it is not available for change |
| **updated** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | When the Supplier Invoice was last updated<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **vatEnabled** | Boolean                                            | | Is VAT taken into account<br>`+Required when replying` `+Change-handler` |
| **vatIncluded** | Boolean                                            | | Is VAT included in the price<br>`+Change-handler` |
| **vatSum** | Float                                              | | VAT amount<br>`+Required when replying` `+Read-only` `+Change-handler` |

#### Links to other documents

| Title | Description |
| ----------- | --------- |
| **payments** | An array of references to related operations in the format [Metadata](../#kladana-json-api-general-info-metadata) `Read-only` |
| **purchaseOrder** | Link to the related order to the supplier in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **supplies** | Links to related acceptances in the format [Metadata](../#kladana-json-api-general-info-metadata) |

#### Supplier Invoice Items

Invoice Items is a list of goods/services/product variants/batches.
The Account item object contains the following fields:

| Title | Type  | Description |
| ------- | ----------- | --------- |
| **accountId** | UUID   | Account ID<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of a product/service/batch/product variant, which is a item<br>`+Required when answering` `+Expand` `+Change-handler` |
| **discount** | Int                                                | The percentage of the discount or markup. The markup is indicated as a negative number, i.e. -10 will create a markup of 10%<br>`+Required when replying` `+Change-handler` |
| **id** | UUID   | Item ID<br>`+Required for response` `+Read-only` `+Change-handler` |
| **pack** | Object   | Product packaging. [Learn more](../dictionaries/#entities-product-products-nested-entity-attributes-product-packaging)<br>`+Change-handler` |
| **price** | Float                                              | Price of products/services in paise<br>`+Required when answering` `+Change-handler` |
| **quantity** | Float                                             | The number of products/services of this type in the item. If the item is a product with serial number accounting enabled, then the value in this field will always be equal to the number of serial numbers for this item in the transaction.<br>`+Required when replying` `+Change-handler` |
| **vat** | Int                                                | VAT applicable to the current item<br>`+Required when replying` `+Change-handler` |
| **vatEnabled** | Boolean                                            | Whether VAT is included for the item. With this flag, you can set VAT = 0 or VAT = "excluding VAT" for an item. (vat = 0, vatEnabled = false) -> vat = "without VAT", (vat = 0, vatEnabled = true) -> vat = 0%.<br>`+Required when replying` `+Change-handler` |

You can work with items using special resources for managing items Accounts,
and as part of a separate Supplier Invoice. When working as part of a separate Account,
you can send requests to create a separate Supplier Invoice with included in the request body
an array of Account items. If the number of items exceeds the maximum allowed, then for
further replenishment of items, you will need to work with a special resource "Supplier's Account items".

Also, when working as part of a separate Account, you can send requests to update the list of items
with an array of Account items included in the request body. It is important to remember that the collection of items will
be perceived as "All items of the Account" and will completely replace the already existing collection when updating the object - superfluous items will be deleted, new ones added, existing ones changed.

About working with Supplier Invoice fields can be read [here](../#kladana-json-api-general-info-additional-fields).


### Get Supplier Invoices

Query all Supplier Invoices on this account.
Result: JSON object including fields:

| Title | Type | Description |
| ----------- | --------- |--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Accounts. |

**Parameters**

| Parameter | Description |
| ----------- | --------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** | `string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Get Supplier Invoices

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/invoicein"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```
 
> Response 200(application/json)
Successful request. The result is a JSON representation of a list of Supplier Invoices.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
     "type": "invoicein",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/af6f9b4c-2e64-11e6-8a84-bae500000149",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
         "type": "invoicein",
         "mediaType": "application/json"
       },
       "id": "af6f9b4c-2e64-11e6-8a84-bae500000149",
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
       "updated": "2016-06-10 17:04:15",
       "name": "00001",
       "externalCode": "tGOteo8phk7xjWaYInNdo3",
       "moment": "2016-06-10 10:16:00",
       "applicable": true,
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
       "organization": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "store": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json"
         }
       },
       "agent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/faf41a7b-2e58-11e6-8a84-bae500000051",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "organizationAccount": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "vatEnabled": true,
       "vatIncluded": true,
       "positions": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/af6f9b4c-2e64-11e6-8a84-bae500000149/positions",
           "type": "invoiceposition",
           "mediaType": "application/json",
           "size": 1,
           "limit": 1000,
           "offset": 0
         }
       },
       "paidSum": 0,
       "shippedSum": 0,
       "incomingNumber": "2"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/36c000ad-3f52-11e6-8a84-bae500000069",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
         "type": "invoicein",
         "mediaType": "application/json"
       },
       "id": "36c000ad-3f52-11e6-8a84-bae500000069",
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
       "updated": "2016-07-01 09:08:21",
       "name": "00002",
       "externalCode": "oS8jXsK8hHmxYzn8MzT1d0",
       "moment": "2016-07-01 09:07:00",
       "applicable": true,
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
       "organization": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "store": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
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
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/1489a08d-32ca-11e6-8a84-bae50000000d",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "organizationAccount": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "agentAccount": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/1489a08d-32ca-11e6-8a84-bae50000000d/accounts/1489ad8d-32ca-11e6-8a84-bae50000000e",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "vatEnabled": true,
       "vatIncluded": true,
       "positions": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/36c000ad-3f52-11e6-8a84-bae500000069/positions",
           "type": "invoiceposition",
           "mediaType": "application/json",
           "size": 2,
           "limit": 1000,
           "offset": 0
         }
       },
       "paymentPlannedMoment": "2016-07-07 09:07:00",
       "paidSum": 0,
       "shippedSum": 0,
       "incomingNumber": "124124",
       "incomingDate": "2016-07-28 00:00:00"
     }
   ]
}
```

### Create Supplier Invoice

Request to create a new Supplier Invoice.
Mandatory fields to create:

| Parameter | Description |
| ----------- | --------- |
| **name** | Supplier Invoicet Number |
| **organization** | Link to your legal entity in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **agent** | Link to the counterparty (supplier) in the format [Metadata](../#kladana-json-api-general-info-metadata) |

> An example of creating a new Account with a request body containing only the required fields.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/invoicein"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "007232",
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
            }
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Supplier Invoice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/06fdb416-3f55-11e6-8a84-bae500000007",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
     "type": "invoicein",
     "mediaType": "application/json"
   },
   "id": "06fdb416-3f55-11e6-8a84-bae500000007",
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
   "updated": "2016-07-01 09:28:30",
   "name": "007232",
   "externalCode": "zpLXS2--gsfaXr1VEn8Xv1",
   "moment": "2016-07-01 09:28:30",
   "applicable": true,
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
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/06fdb416-3f55-11e6-8a84-bae500000007/positions",
       "type": "invoiceposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "shippedSum": 0
}
```

> An example of creating a new Account with a richer request body.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/invoicein"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "00732",
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
            "code": "77881123",
            "externalCode": "33443",
            "moment": "2016-06-27 10:52:24",
            "applicable": true,
            "description": "Supplier invoice",
            "organizationAccount": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
                    "type": "account",
                    "mediaType": "application/json"
                }
            },
            "store": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                    "type": "store",
                    "mediaType": "application/json"
                }
            },
            "incomingNumber": "12412412",
            "incomingDate": "2016-06-17 10:52:24"
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Supplier Invoice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/6d4d1628-3f54-11e6-8a84-bae500000000",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
     "type": "invoicein",
     "mediaType": "application/json"
   },
   "id": "6d4d1628-3f54-11e6-8a84-bae500000000",
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
   "updated": "2016-07-01 09:24:12",
   "name": "00732",
   "description": "Supplier invoice",
   "code": "77881123",
   "externalCode": "33443",
   "moment": "2016-06-27 10:52:24",
   "applicable": true,
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
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
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
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/6d4d1628-3f54-11e6-8a84-bae500000000/positions",
       "type": "invoiceposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "shippedSum": 0,
   "incomingNumber": "12412412",
   "incomingDate": "2016-06-17 10:52:24"
}
```

> An example of a request to create a Supplier Invoice with additional fields.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/invoicein"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "5500732",
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
            "code": "77881123",
            "externalCode": "33443",
            "moment": "2016-06-27 10:52:24",
            "applicable": true,
            "description": "Supplier invoice",
            "organizationAccount": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
                    "type": "account",
                    "mediaType": "application/json"
                }
            },
            "store": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                    "type": "store",
                    "mediaType": "application/json"
                }
            },
            "incomingNumber": "12412412",
            "incomingDate": "2016-06-17 10:52:24",
            "attributes": [
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata/attributes/e97c5ea8-3f52-11e6-8a84-bae50000006f",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "value": 5
                },
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata/attributes/48c7b9af-3f55-11e6-8a84-bae500000076",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "value": true
                }
            ]
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Supplier Invoice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/ab4486eb-3f55-11e6-8a84-bae50000000b",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
     "type": "invoicein",
     "mediaType": "application/json"
   },
   "id": "ab4486eb-3f55-11e6-8a84-bae50000000b",
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
   "updated": "2016-07-01 09:33:05",
   "name": "5500732",
   "description": "Supplier invoice",
   "code": "77881123",
   "externalCode": "33443",
   "moment": "2016-06-27 10:52:24",
   "applicable": true,
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
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
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
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata/attributes/e97c5ea8-3f52-11e6-8a84-bae50000006f",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "e97c5ea8-3f52-11e6-8a84-bae50000006f",
       "name": "AttributeName1",
       "type": "long",
       "value": 5
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata/attributes/48c7b9af-3f55-11e6-8a84-bae500000076",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "48c7b9af-3f55-11e6-8a84-bae500000076",
       "name": "AttributeName2",
       "type": "boolean",
       "value": true
     }
   ],
   "vatEnabled": true,
   "vatIncluded": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/ab4486eb-3f55-11e6-8a84-bae50000000b/positions",
       "type": "invoiceposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "shippedSum": 0,
   "incomingNumber": "12412412",
   "incomingDate": "2016-06-17 10:52:24"
}
```

> An example of a request to create a Supplier Invoice with items in the body of the request.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/invoicein"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "69375",
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
            "code": "77881123",
            "externalCode": "33443",
            "moment": "2016-06-27 10:52:24",
            "applicable": true,
            "description": "Supplier invoice",
            "organizationAccount": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
                    "type": "account",
                    "mediaType": "application/json"
                }
            },
            "store": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                    "type": "store",
                    "mediaType": "application/json"
                }
            },
            "incomingNumber": "12412412",
            "incomingDate": "2016-06-17 10:52:24",
            "positions": [
                {
                    "quantity": 1,
                    "price": 0.0,
                    "discount": 0,
                    "vat": 0,
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/00f1f397-3303-11e6-8a84-bae500000380",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                            "type": "product",
                            "mediaType": "application/json"
                        }
                    }
                },
                {
                    "quantity": 1,
                    "price": 0.0,
                    "discount": 0,
                    "vat": 0,
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/00dacbec-3303-11e6-8a84-bae50000033a",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                            "type": "product",
                            "mediaType": "application/json"
                        }
                    }
                },
                {
                    "quantity": 1,
                    "price": 0.0,
                    "discount": 0,
                    "vat": 0,
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/e84aed23-3303-11e6-8a84-bae500014dcd",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                            "type": "product",
                            "mediaType": "application/json"
                        }
                    }
                },
                {
                    "quantity": 1,
                    "price": 263000.0,
                    "discount": 0,
                    "vat": 0,
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                            "type": "product",
                            "mediaType": "application/json"
                        }
                    }
                }
            ]
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Supplier Invoice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/13607115-3f56-11e6-8a84-bae500000011",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
     "type": "invoicein",
     "mediaType": "application/json"
   },
   "id": "13607115-3f56-11e6-8a84-bae500000011",
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
   "updated": "2016-07-01 09:36:00",
   "name": "69375",
   "description": "Supplier invoice",
   "code": "77881123",
   "externalCode": "33443",
   "moment": "2016-06-27 10:52:24",
   "applicable": true,
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
   "sum": 263000,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
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
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/13607115-3f56-11e6-8a84-bae500000011/positions",
       "type": "invoiceposition",
       "mediaType": "application/json",
       "size": 4,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "shippedSum": 0,
   "incomingNumber": "12412412",
   "incomingDate": "2016-06-17 10:52:24"
}
```

### Bulk creating and update of Supplier Invoices

[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Supplier Invoices.
In the body of the request, you need to pass an array containing the JSON representation of the Developer Accounts you want to create or update.
Updated Supplier Invoices must contain the identifier in the form of metadata.

> Example of creating and updating multiple Supplier Invoices

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/invoicein"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
            {
                "name": "007232",
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
                }
            },
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/13607115-3f56-11e6-8a84-bae500000011",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
                    "type": "invoicein",
                    "mediaType": "application/json"
                },
                "name": "4040228",
                "description": "Deal with a new supplier",
                "code": "1234124152",
                "externalCode": "8756248",
                "moment": "2016-06-29 10:59:24",
                "applicable": false,
                "sum": 125712521,
                "organization": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                        "type": "organization",
                        "mediaType": "application/json"
                    }
                },
                "store": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                        "type": "store",
                        "mediaType": "application/json"
                    }
                },
                "agent": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/149b96ba-32ca-11e6-8a84-bae50000001f",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                        "type": "counterparty",
                        "mediaType": "application/json"
                    }
                },
                "agentAccount": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/149b96ba-32ca-11e6-8a84-bae50000001f/accounts/149ba387-32ca-11e6-8a84-bae500000020",
                        "type": "account",
                        "mediaType": "application/json"
                    }
                },
                "vatEnabled": true,
                "vatIncluded": false,
                "positions": [],
                "paidSum": 700,
                "shippedSum": 1230,
                "incomingNumber": "66355",
                "incomingDate": "2016-12-05 11:42:54"
            }
          ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Supplier Invoices.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/06fdb416-3f55-11e6-8a84-bae500000007",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
       "type": "invoicein",
       "mediaType": "application/json"
     },
     "id": "06fdb416-3f55-11e6-8a84-bae500000007",
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
     "updated": "2016-07-01 09:28:30",
     "name": "007232",
     "externalCode": "zpLXS2--gsfaXr1VEn8Xv1",
     "moment": "2016-07-01 09:28:30",
     "applicable": true,
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
     "organizationAccount": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "agentAccount": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "vatEnabled": true,
     "vatIncluded": true,
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/06fdb416-3f55-11e6-8a84-bae500000007/positions",
         "type": "invoiceposition",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     },
     "paidSum": 0,
     "shippedSum": 0
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/13607115-3f56-11e6-8a84-bae500000011",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
       "type": "invoicein",
       "mediaType": "application/json"
     },
     "id": "13607115-3f56-11e6-8a84-bae500000011",
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
     "updated": "2016-07-01 09:42:42",
     "name": "4040228",
     "description": "Deal with a new supplier",
     "code": "1234124152",
     "externalCode": "8756248",
     "moment": "2016-06-29 10:59:24",
     "applicable": false,
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
     "organization": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     "store": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       }
     },
     "agent": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/149b96ba-32ca-11e6-8a84-bae50000001f",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
         "type": "counterparty",
         "mediaType": "application/json"
       }
     },
     "organizationAccount": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "agentAccount": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/149b96ba-32ca-11e6-8a84-bae50000001f/accounts/149ba387-32ca-11e6-8a84-bae500000020",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "vatEnabled": true,
     "vatIncluded": false,
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/13607115-3f56-11e6-8a84-bae500000011/positions",
         "type": "invoiceposition",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     },
     "paidSum": 0,
     "shippedSum": 0,
     "incomingNumber": "66355",
     "incomingDate": "2016-12-05 11:42:54"
   }
]
```

### Delete Supplier Invoice

**Parameters**

| Parameter | Description |
| ------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Supplier invoice id. |

> Request to delete the Developer Account with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of the Developer Account.

### Bulk deletion of Supplier Invoices

In the body of the request, you need to pass an array containing the JSON metadata of the Supplier Invoices that you want to delete.


> Bulk deletion request for Developer Accounts.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/invoicein/delete"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
     -d'[
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b1",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
                    "type": "invoicein",
                    "mediaType": "application/json"
                }
            },
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b2",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
                    "type": "invoicein",
                    "mediaType": "application/json"
                }
            }
          ]'
```

> Successful request. The result is JSON information about the deletion of Suppliers' Invoices.

```json
[
   {
     "info":"Entity 'invoicein' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'invoicein' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Supplier Invoice Metadata
#### Supplier Invoice Metadata

Request for metadata of Supplier Invoices. The result is a JSON object including:

| Parameter | Description |
| ------- | --------- |
| **meta** | Link to Supplier Invoice Metadata |
| **attributes** | Array of objects additional Supplier Invoice fields in [Metadata](../#kladana-json-api-general-info-metadata) format |
| **states** | Array of statuses of Supplier Invoices |
| **createShared** | Create new Supplier Invoices labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Supplier Invoice Metadata

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional fields of Suppliers' invoices.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata/attributes/e97c5ea8-3f52-11e6-8a84-bae50000006f",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "e97c5ea8-3f52-11e6-8a84-bae50000006f",
       "name": "AttributeName1",
       "type": "long",
       "required": false
     }
   ],
   "createShared": false
}
```

### Separate additional field
#### Separate additional field

**Parameters**

| Parameter | Description |
| ------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Field ID. |
 
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata/attributes/48c7b9af-3f55-11e6-8a84-bae500000076",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "48c7b9af-3f55-11e6-8a84-bae500000076",
   "name": "AttributeName1",
   "type": "boolean",
   "required": false
}
```

### Supplier Invoice Template
#### Supplier Invoice Template

> Request to receive a supplier invoice template pre-filled with standard values without being associated with any document.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/invoicein/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d''
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled supplier invoice.

```json
{
   "applicable": false,
   "sum": 0,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2",
       "type": "invoiceposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "paidSum": 0,
   "shippedSum": 0
}
```

### Supplier Invoice template based on another transactions

Request for a prefilled Supplier Invoice based on a Purchase order or Supplier Invoice.
As a result of the request, a pre-filled supplier invoice template will be created based on the submitted
document.

> Request to create a Supplier Invoice based on a Purchase order.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/invoicein/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "purchaseOrder": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/22b4caaa-3f74-11e6-8a84-bae500000069",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata",
                 "type": "purchaseorder",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled supplier invoice.

```json
{
   "applicable": false,
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
   "sum": 0,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "contract": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/contract/e105a2e7-3f6f-11e6-8a84-bae500000087",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
       "type": "contract",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/1483952f-32ca-11e6-8a84-bae500000007",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/1483952f-32ca-11e6-8a84-bae500000007/accounts/1483a4fa-32ca-11e6-8a84-bae500000008",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2",
       "type": "invoiceposition",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     },
     "rows": [
       {
         "meta": {
           "type": "invoiceposition",
           "mediaType": "application/json"
         },
         "quantity": 1,
         "price": 0.0,
         "discount": 0,
         "vat": 0,
         "vatEnabled": false,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
             "type": "variant",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#feature/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
           }
         }
       }
     ]
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "paidSum": 0,
   "shippedSum": 0,
   "purchaseOrder": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/22b4caaa-3f74-11e6-8a84-bae500000069",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata",
       "type": "purchaseorder",
       "mediaType": "application/json"
     }
   }
}
```

> Request to create a Supplier Invoice based on an acceptance.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/invoicein/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "supplies": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/supply/60c7896d-cf7c-11e7-6a80-332a00000004",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
                   "type": "supply",
                   "mediaType": "application/json",
                   "uuidHref": "https://app.kladana.com/app/#supply/edit?id=60c7896d-cf7c-11e7-6a80-332a00000004"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled supplier invoice.

```json
{
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/46073d61-ca1f-11e7-6a80-332a0000002a",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#employee/edit?id=46073d61-ca1f-11e7-6a80-332a0000002a"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/452fb22f-ca1f-11e7-6a80-332a00000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "name": "",
   "moment": "2017-11-22 19:08:01",
   "applicable": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/464062ac-ca1f-11e7-6a80-332a00000058",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#currency/edit?id=464062ac-ca1f-11e7-6a80-332a00000058"
       }
     }
   },
   "sum": 100000,
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/463f8970-ca1f-11e7-6a80-332a00000053",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#warehouse/edit?id=463f8970-ca1f-11e7-6a80-332a00000053"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/463fb76d-ca1f-11e7-6a80-332a00000054",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#company/edit?id=463fb76d-ca1f-11e7-6a80-332a00000054"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/463a706e-ca1f-11e7-6a80-332a00000051",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=463a706e-ca1f-11e7-6a80-332a00000051"
     }
   },
   "documents": {
     "meta": {
       "href": "https://online.moysklad.ru/api/remap/1.2/entity/invoicein/af6f9b4c-2e64-11e6-8a84-bae500000149/documents",
       "mediaType": "application/json",
       "size": 0,
       "limit": 100,
       "offset": 0
     }
   },
   "positions": {
     "rows": [
       {
         "quantity": 1,
         "price": 100000.0,
         "discount": 0,
         "vat": 0,
         "vatEnabled": false,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/variant/b5d328b3-cab0-11e7-6a80-332a0000000d",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
             "type": "variant",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#feature/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
           }
         }
       }
     ]
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "paidSum": 0,
   "shippedSum": 0,
   "supplies": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/60c7896d-cf7c-11e7-6a80-332a00000004",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
         "type": "supply",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#supply/edit?id=60c7896d-cf7c-11e7-6a80-332a00000004"
       }
     }
   ]
}
```

### Supplier Invoice
 
### Get Supplier Invoice

**Parameters**

| Parameter | Description |
| ------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Supplier invoice id. |
 
> Request for a separate Supplier Invoice with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Supplier Invoice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/36c000ad-3f52-11e6-8a84-bae500000069",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
     "type": "invoicein",
     "mediaType": "application/json"
   },
   "id": "36c000ad-3f52-11e6-8a84-bae500000069",
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
   "updated": "2016-07-01 09:08:21",
   "name": "00002",
   "externalCode": "oS8jXsK8hHmxYzn8MzT1d0",
   "moment": "2016-07-01 09:07:00",
   "applicable": true,
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
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/1489a08d-32ca-11e6-8a84-bae50000000d",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/1489a08d-32ca-11e6-8a84-bae50000000d/accounts/1489ad8d-32ca-11e6-8a84-bae50000000e",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/36c000ad-3f52-11e6-8a84-bae500000069/positions",
       "type": "invoiceposition",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     }
   },
   "paymentPlannedMoment": "2016-07-07 09:07:00",
   "paidSum": 0,
   "shippedSum": 0,
   "incomingNumber": "124124",
   "incomingDate": "2016-07-28 00:00:00"
}
```

### Change Supplier Invoice

Request to update the Supplier Invoice with the specified id.
In the body of the request, you can specify only those fields that need to be changed for the developer account, except for those that
are marked `Read-Only` in the description of the [Supplier Invoice attributes](../documents/#transactions-supplier-invoice).
When updating the **organization** and **agent** fields, you must also update the **organizationAccount** and
**agentAccount** respectively, otherwise an error will occur.

**Parameters**

| Parameter | Description |
| ------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Supplier invoice id. |

> An example of a request to update a single Supplier Invoice.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "4040228",
            "description": "Deal with a new supplier",
            "code": "1234124152",
            "externalCode": "8756248",
            "moment": "2016-06-29 10:59:24",
            "applicable": false,
            "sum": 125712521,
            "organization": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                    "type": "organization",
                    "mediaType": "application/json"
                }
            },
            "store": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                    "type": "store",
                    "mediaType": "application/json"
                }
            },
            "agent": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/149b96ba-32ca-11e6-8a84-bae50000001f",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                    "type": "counterparty",
                    "mediaType": "application/json"
                }
            },
            "agentAccount": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/149b96ba-32ca-11e6-8a84-bae50000001f/accounts/149ba387-32ca-11e6-8a84-bae500000020",
                    "type": "account",
                    "mediaType": "application/json"
                }
            },
            "vatEnabled": true,
            "vatIncluded": false,
            "positions": [],
            "paidSum": 700,
            "shippedSum": 1230,
            "incomingNumber": "66355",
            "incomingDate": "2016-12-05 11:42:54"
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Supplier Invoice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/13607115-3f56-11e6-8a84-bae500000011",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
     "type": "invoicein",
     "mediaType": "application/json"
   },
   "id": "13607115-3f56-11e6-8a84-bae500000011",
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
   "updated": "2016-07-01 09:42:42",
   "name": "4040228",
   "description": "Deal with a new supplier",
   "code": "1234124152",
   "externalCode": "8756248",
   "moment": "2016-06-29 10:59:24",
   "applicable": false,
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
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/149b96ba-32ca-11e6-8a84-bae50000001f",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/149b96ba-32ca-11e6-8a84-bae50000001f/accounts/149ba387-32ca-11e6-8a84-bae500000020",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "vatEnabled": true,
   "vatIncluded": false,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/13607115-3f56-11e6-8a84-bae500000011/positions",
       "type": "invoiceposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "shippedSum": 0,
   "incomingNumber": "66355",
   "incomingDate": "2016-12-05 11:42:54"
}
```

> Example of a request to change a Supplier Invoice with additional fields.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "4040228",
            "description": "Deal with a new supplier",
            "code": "1234124152",
            "externalCode": "8756248",
            "moment": "2016-06-29 10:59:24",
            "applicable": false,
            "sum": 125712521,
            "organization": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                    "type": "organization",
                    "mediaType": "application/json"
                }
            },
            "store": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                    "type": "store",
                    "mediaType": "application/json"
                }
            },
            "agent": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/149b96ba-32ca-11e6-8a84-bae50000001f",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                    "type": "counterparty",
                    "mediaType": "application/json"
                }
            },
            "agentAccount": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/149b96ba-32ca-11e6-8a84-bae50000001f/accounts/149ba387-32ca-11e6-8a84-bae500000020",
                    "type": "account",
                    "mediaType": "application/json"
                }
            },
            "vatEnabled": true,
            "vatIncluded": false,
            "positions": [],
            "attributes": [
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata/attributes/e97c5ea8-3f52-11e6-8a84-bae50000006f",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "value": 1
                },
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata/attributes/48c7b9af-3f55-11e6-8a84-bae500000076",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "value": false
                }
            ],
            "paidSum": 700,
            "shippedSum": 1230,
            "incomingNumber": "66355",
            "incomingDate": "2016-12-05 11:42:54"
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Supplier Invoice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/13607115-3f56-11e6-8a84-bae500000011",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
     "type": "invoicein",
     "mediaType": "application/json"
   },
   "id": "13607115-3f56-11e6-8a84-bae500000011",
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
   "updated": "2016-07-01 09:42:42",
   "name": "4040228",
   "description": "Deal with a new supplier",
   "code": "1234124152",
   "externalCode": "8756248",
   "moment": "2016-06-29 10:59:24",
   "applicable": false,
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
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/149b96ba-32ca-11e6-8a84-bae50000001f",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/149b96ba-32ca-11e6-8a84-bae50000001f/accounts/149ba387-32ca-11e6-8a84-bae500000020",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata/attributes/e97c5ea8-3f52-11e6-8a84-bae50000006f",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "e97c5ea8-3f52-11e6-8a84-bae50000006f",
       "name": "AttributeName1",
       "type": "long",
       "value": 1
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata/attributes/48c7b9af-3f55-11e6-8a84-bae500000076",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "48c7b9af-3f55-11e6-8a84-bae500000076",
       "name": "AttributeName1",
       "type": "boolean",
       "value": false
     }
   ],
   "vatEnabled": true,
   "vatIncluded": false,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/13607115-3f56-11e6-8a84-bae500000011/positions",
       "type": "invoiceposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "shippedSum": 0,"incomingNumber": "66355",
   "incomingDate": "2016-12-05 11:42:54"
}
```

> An example of a request to update the Supplier Invoice with items in the body of the request.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "4040228",
            "description": "Deal with a new supplier",
            "code": "1234124152",
            "externalCode": "8756248",
            "moment": "2016-06-29 10:59:24",
            "applicable": false,
            "sum": 125712521,
            "organization": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                    "type": "organization",
                    "mediaType": "application/json"
                }
            },
            "store": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                    "type": "store",
                    "mediaType": "application/json"
                }
            },
            "agent": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/149b96ba-32ca-11e6-8a84-bae50000001f",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                    "type": "counterparty",
                    "mediaType": "application/json"
                }
            },
            "agentAccount": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/149b96ba-32ca-11e6-8a84-bae50000001f/accounts/149ba387-32ca-11e6-8a84-bae500000020",
                    "type": "account",
                    "mediaType": "application/json"
                }
            },
            "vatEnabled": true,
            "vatIncluded": false,
            "positions": [
                {
                    "quantity": 1,
                    "price": 0.0,
                    "discount": 0,
                    "vat": 0,
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/00f1f397-3303-11e6-8a84-bae500000380",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                            "type": "product",
                            "mediaType": "application/json"
                        }
                    }
                },
                {
                    "quantity": 1,
                    "price": 0.0,
                    "discount": 0,
                    "vat": 0,
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/00dacbec-3303-11e6-8a84-bae50000033a",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                            "type": "product",
                            "mediaType": "application/json"
                        }
                    }
                }
            ],
            "attributes": [
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata/attributes/e97c5ea8-3f52-11e6-8a84-bae50000006f",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "value": 1
                },
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata/attributes/48c7b9af-3f55-11e6-8a84-bae500000076",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "value": false
                }
            ],
            "paidSum": 700,
            "shippedSum": 1230,
            "incomingNumber": "66355",
            "incomingDate": "2016-12-05 11:42:54"
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Supplier Invoice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/13607115-3f56-11e6-8a84-bae500000011",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
     "type": "invoicein",
     "mediaType": "application/json"
   },
   "id": "13607115-3f56-11e6-8a84-bae500000011",
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
   "updated": "2016-07-01 09:44:23",
   "name": "4040228",
   "description": "Deal with a new supplier",
   "code": "1234124152",
   "externalCode": "8756248",
   "moment": "2016-06-29 10:59:24",
   "applicable": false,
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
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/149b96ba-32ca-11e6-8a84-bae50000001f",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/149b96ba-32ca-11e6-8a84-bae50000001f/accounts/149ba387-32ca-11e6-8a84-bae500000020",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata/attributes/e97c5ea8-3f52-11e6-8a84-bae50000006f",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "e97c5ea8-3f52-11e6-8a84-bae50000006f",
       "name": "AttributeName1",
       "type": "long",
       "value": 1
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata/attributes/48c7b9af-3f55-11e6-8a84-bae500000076",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "48c7b9af-3f55-11e6-8a84-bae500000076",
       "name": "AttributeName1",
       "type": "boolean",
       "value": false
     }
   ],
   "vatEnabled": true,
   "vatIncluded": false,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/13607115-3f56-11e6-8a84-bae500000011/positions",
       "type": "invoiceposition",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "shippedSum": 0,
   "incomingNumber": "66355",
   "incomingDate": "2016-12-05 11:42:54"
}
```
 
### Supplier Invoice Items

A separate resource for managing Supplier Invoice items. With it, you can manage the items of a larger document that has more lines than the limit on the number of lines saved with the document. This limit is 1000. You can read more about limits on the number of document lines and working with large documents [here](../#kladana-json-api-general-info-working-with-transaction-items).

### Get Supplier Invoice Items

Request to get a list of all items of this Supplier Invoice.

| Title | Type | Description |
| ------- | --------- |-------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the Supplier Invoice items. |

**Parameters**

| Parameter | Description|
| ------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Supplier invoice id. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Supplier Invoice Items

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b19/positions"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of items in a single Supplier Invoice.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b19/positions",
     "type": "invoiceposition",
     "mediaType": "application/json",
     "size": 4,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b19/positions/36c018f9-3f52-11e6-8a84-bae50000006a",
         "type": "invoiceposition",
         "mediaType": "application/json"
       },
       "id": "36c018f9-3f52-11e6-8a84-bae50000006a",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 1,
       "price": 0.0,
       "discount": 0,
       "vat": 0,
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/00f1f397-3303-11e6-8a84-bae500000380",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b19/positions/36c021a2-3f52-11e6-8a84-bae50000006b",
         "type": "invoiceposition",
         "mediaType": "application/json"
       },
       "id": "36c021a2-3f52-11e6-8a84-bae50000006b",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 1,
       "price": 0.0,
       "discount": 0,
       "vat": 0,
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/00dacbec-3303-11e6-8a84-bae50000033a",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b19/positions/1ab34547-3f53-11e6-8a84-bae500000072",
         "type": "invoiceposition",
         "mediaType": "application/json"
       },
       "id": "1ab34547-3f53-11e6-8a84-bae500000072",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 1,
       "price": 0.0,
       "discount": 0,
       "vat": 0,
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/e84aed23-3303-11e6-8a84-bae500014dcd",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=392c045c-2842-11e9-ac12-000a00000002"
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b19/positions/1ab353de-3f53-11e6-8a84-bae500000073",
         "type": "invoiceposition",
         "mediaType": "application/json"
       },
       "id": "1ab353de-3f53-11e6-8a84-bae500000073",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 1,
       "price": 263000.0,
       "discount": 0,
       "vat": 0,
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
         }
       }
     }
   ]
}
```

### Supplier Invoice Item

Single Supplier Invoice item with the specified item ID.

**Parameters**

| Parameter | Description |
| -------- | ------------- |
| **id**         | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Supplier Invoice ID.         |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Supplier Invoice Item ID. |

### Get Item

> Request to get a single Supplier Invoice item with the specified ID.

```shell
curl -X GET
  "https://app.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. Result is a JSON representation of a single Supplier Invoice item.

```json
{
  "meta": {
    "href": "https://app.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
    "type": "invoiceposition",
    "mediaType": "application/json"
  },
  "id": "34f6344f-015e-11e6-9464-e4de0000006c",
  "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
  "quantity": 1,
  "price": 0.0,
  "discount": 0,
  "vat": 0,
  "vatEnabled": false,
  "assortment": {
    "meta": {
      "href": "https://app.kladana.com/api/remap/1.2/entity/product/00f1f397-3303-11e6-8a84-bae500000380",
      "metadataHref": "https://api.moysklad.ru/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#good/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
    }
  }
}
```

### Create Item

Request to create a new item in the Supplier Invoice.
For successful creation, the following fields must be specified in the request body:

+ **assortment** - Link to the product/service/batch/product variant that the item represents.
You can also specify a field named **service**, **variant** according to
what the indicated item is. More information about this field can be found in the description of [Supplier Invoice item](../documents/#transactions-supplier-invoice-supplier-invoices-supplier-invoice-items).
+ **quantity** - Quantity of the specified item. Must be positive, otherwise an error will occur.

**Parameters**

| Parameter | Description |
| ------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Supplier invoice id. |

> An example of creating a item in the Supplier Invoice.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b19/positions"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "quantity": 12,
             "price": 999.0
             "discount": 1,
             "assortment": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a7daa6b-3c64-11e6-8a84-bae50000000a",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                 "type": "variant",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the item created for the individual Supplier Invoice.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b19/positions/c3b264eb-3f54-11e6-8a84-bae500000004",
       "type": "invoiceposition",
       "mediaType": "application/json"
     },
     "id": "c3b264eb-3f54-11e6-8a84-bae500000004",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 12,
     "price": 999.0,
     "discount": 1,
     "vat": 0,
     "vatEnabled": false,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a7daa6b-3c64-11e6-8a84-bae50000000a",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
       }
     }
   }
]
```

### Change Item

Request to update a line item in an Invoice. There is no way to update the item
aboutrequired fields in the body of the request. Only the ones you want to update.

**Parameters**

| Parameter | Description |
| ----------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Supplier invoice id. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Supplier Invoice item ID. |
 
> An example of a request to update a Supplier Invoice item.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "quantity": 47,
             "price": 303.0,
             "discount": 0,
             "vat": 11,
             "assortment": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a7daa6b-3c64-11e6-8a84-bae50000000a",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                 "type": "variant",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Supplier Invoice item.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
     "type": "invoiceposition",
     "mediaType": "application/json"
   },
   "id": "34f6344f-015e-11e6-9464-e4de0000006c",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "quantity": 47,
   "price": 303.0,
   "discount": 0,
   "vat": 11,
   "vatEnabled": true,
   "assortment": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a7daa6b-3c64-11e6-8a84-bae50000000a",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
       "type": "variant",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
     }
   }
}
```

### Delete item

**Parameters**

| Parameter | Description |
|--------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Supplier invoice ID. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Supplier Invoice item ID. |

> Request to delete a separate Supplier Invoice item with the specified ID.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/invoicein/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of a Supplier Invoice item.

### Bulk deletion of Items

**Parameters**

| Parameter | Description |
| --------- | ----------- |
| **id** | `string` (required) *Example: 3e1c03bb-684f-11ee-ac12-000c000000b0* Supplier Invoice ID. |

> Request for bulk deletion of Supplier Invoice items.

```shell
curl -X POST
  "https://api.kladana.com/api/remap/1.2/entity/invoicein/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/delete"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
  -H "Content-Type: application/json"
  -d '[
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/7fce2da5-684d-11ee-ac12-000c000000a2",
            "type": "invoiceposition",
            "mediaType": "application/json"
          }
        },
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/7fce37a5-684d-11ee-ac12-000c000000a3",
            "type": "invoiceposition",
            "mediaType": "application/json"
          }
        }
      ]'  
```

> Response 200 (application/json)
Supplier Invoice items were successfully deleted.

