## Sales Invoice
### Sales Invoices

Using the JSON API, you can create and update information about the Sales Invoice and request lists of Sales Invoices. Sales Invoice items can be managed both as part of a Sales Invoice, and separately - with the help of special resources for managing Sales Invoice items. The entity code for the Sales Invoice as part of the JSON API is the **invoiceout** keyword. Learn more about [Sales Invoice](https://kladana.zendesk.com/hc/en-us/articles/360012048298).

#### Entity attributes

| Title | Type                                               | Filtration | Description |
| ---------|----------------------------------------------------| -------- | ------- |
| **accountId** | UUID                                               | `=` `!=` | Sales Invoice ID<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **agent** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Sales Invoice metadata<br>`+Required when replying` `+Expand` `+Required when creating` `+Change-handler` |
| **agentAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Counterparty Sales Invoice metadata<br>`+Expand` `+Change-handler` |
| **applicable** | Boolean                                            | `=` `!=` | Handling flag<br>`+Required when replying` `+Change-handler` |
| **attributes** | Array(Object)                                      | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields) `+Change-handler` |
| **code** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Sales Invoice Code |
| **contract** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Contract metadata<br>`+Expand` `+Change-handler` |
| **created** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Creation date<br>`+Required for response` `+Read-only` `+Change-handler` |
| **deleted** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | The moment of the last deletion of the Sales Invoice<br>`+Read Only` |
| **description** | String(4096)                                       | `=` `!=` `~` `~=` `=~` | Sales Invoice Comment<br> `+Change-handler` |
| **externalCode** | String(255)                                        | `=` `!=` `~` `~=` `=~` | External Sales Invoice code<br>`+Required when replying` `+Change-handler` |
| **files** | MetaArray                                          | | [Files](../dictionaries/#entities-files) array metadata (Maximum number of files - 100)<br>`+Required when replying` `+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID                                               | `=` `!=` | Sales Invoice ID<br>`+Required when replying` `+Read Only` `+Change-handler |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Sales Invoice Metadata<br>`+Required when replying` `+Change-handler` |
| **moment** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Document date<br>`+Required when replying` `+Change-handler` |
| **name** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Sales Invoice name<br>`+Required when replying` `+Change-handler` |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Legal entity metadata<br>`+Required when responding` `+Expand` `+Required when creating` `+Change-handler` |
| **organizationAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Legal entity Sales Invoice metadata<br>`+Expand` `+Change-handler` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Required when replying` `+Expand` |
| **paidSum** | Float                                              | | Amount of incoming payments on the Sales Invoice<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **paymentPlannedMoment** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Planned payment date<br>`+Change-handler` |
| **positions** | MetaArray                                          | | Sales Invoice Metadata<br>`+Required for response` `+Expand` `+Change-handler` |
| **printed** | Boolean                                            | `=` `!=` | Is the document printed<br>`+Required when responding` `+Read Only` |
| **project** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Project metadata<br>`+Expand` `+Change-handler` |
| **published** | Boolean                                            | `=` `!=` | Is the document published<br>`+Required when replying` `+Read Only` |
| **rate** | Object                                             || Currency. [More details here](../documents/#transactions-currency-in-transactions)<br>`+Required when replying` `+Change-handler` |
| **salesChannel** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Sales channel metadata<br>`+Expand` |
| **shared** | Boolean                                            | `=` `!=` | Sharing<br>`+Required when replying` |
| **shippedSum** | Float                                              | | Amount of shipped<br>`+Required for response` `+Read-only` `+Change-handler` |
| **state** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Sales Invoice status metadata<br>`+Expand` `+Change-handler` |
| **store** | [Meta](../#kladana-json-api-general-info-metadata) | | Warehouse metadata<br>`+Expand` `+Change-handler` |
| **sum** | Int                                                | `=` `!=` `<` `>` `<=` `>=` | Invoice amount in specified currency<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **syncId** | UUID                                               | `=` `!=` | Synchronization ID. After filling it is not available for change |
| **updated** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | The moment of the last update of the Sales Invoice<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **vatEnabled** | Boolean                                            | | Is VAT taken into Sales Invoice<br>`+Required when replying` `+Change-handler` |
| **vatIncluded** | Boolean                                            | | Is VAT included in the price<br>`+Change-handler` |
| **vatSum** | Float                                              | | VAT amount<br>`+Required when replying` `+Read-only` `+Change-handler` |

#### Links to other transactions

| Title | Description |
| ---------- | --------- |
| **customerOrder** | Purchase Order Link of the buyer with whom the Sales Invoice is linked in the format of [Metadata](../#kladana-json-api-general-info-metadata) |
| **payments** | An array of references to related operations in the format [Metadata](../#kladana-json-api-general-info-metadata) `Read-only` |
| **demands** | An array of links to related shipments in the format [Metadata](../#kladana-json-api-general-info-metadata) |

#### Sales Invoice items

Invoice Items is a list of products, product variants, bundles, and services. The Sales Invoice item object contains the following fields:

| Title | Type                                               | Description |
| ---------- |----------------------------------------------------|-------- |
| **accountId** | UUID                                               | Sales Invoice ID<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of a product/service/series/modification, which is a item<br>`+Required when answering` `+Expand` `+Change-handler` |
| **discount** | Int                                                | The percentage of the discount or markup. The markup is indicated as a negative number, i.e. -10 will create a markup of 10%<br>`+Required when replying` `+Change-handler` |
| **id** | UUID                                               | Item ID<br>`+Required for response` `+Read-only` `+Change-handler` |
| **pack** | Object                                             | Product packaging. [Read more here](../dictionaries/#entities-product-products-nested-entity-attributes-product-packaging)<br>`+Change-handler` |
| **price** | Float                                              | Price of goods/services in rupees<br>`+Required when answering` `+Change-handler` |
| **quantity** | Int                                                | The number of goods/services of this type in the item. If the item is a product with serial number accounting enabled, then the value in this field will always be equal to the number of serial numbers for this item in the document.<br>`+Required when replying` `+Change-handler` |
| **vat** | Int                                                | VAT applicable to the current item<br>`+Required when replying` `+Change-handler` |
| **vatEnabled** | Boolean                                            | Whether VAT is included for the item. With this flag, you can set VAT = 0 or VAT = "excluding VAT" for an item. (vat = 0, vatEnabled = false) -> vat = "without VAT", (vat = 0, vatEnabled = true) -> vat = 0%.<br>`+Required when replying` `+Change-handler` |

You can work with items using special resources for managing items Sales Invoices,
as well as as part of a separate Sales Invoice. When working as part of a separate Sales Invoice,
you can send requests to create a separate Sales Invoice  with included in the request body
an array of Sales Invoice items. If the number of items exceeds the maximum allowed, then for
further replenishment of items, you will need to work with a special resource "Items of the Sales Invoice".

Also, when working as part of a separate Sales Invoice, you can send requests to update the list of items with an array of Sales Invoice items included in the request body. 

It is important to remember that the collection of items will
be perceived as "All items of the Sales Invoice" and will completely replace the already existing collection when updating the object - superfluous
items will be deleted, new ones added, existing ones changed.

About working with Sales Invoice fields can be read [here](../#kladana-json-api-general-info-additional-fields)


### Get Sales Invoices

Query: all Sales Invoices.
Result: JSON object including fields:

| Title | Type | Description |
| ---------- | --------- |------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Sales Invoices. |

**Parameters**

| Parameter | Description |
| ---------- | --------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** | `string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Get Sales Invoice

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/invoiceout"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of Sales Invoices.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
     "type": "invoiceout",
     "mediaType": "application/json",
     "size": 3,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/0cb8d047-f664-11e5-8a84-bae500000095",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
         "type": "invoiceout",
         "mediaType": "application/json"
       },
       "id": "0cb8d047-f664-11e5-8a84-bae500000095",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
       "updated": "2016-03-30 16:48:13",
       "name": "00001",
       "externalCode": "TAXyoccKiJPtMhcBAsqqw1",
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
       "moment": "2016-03-30 13:41:00",
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
       "sum": 123000,
       "organization": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "store": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json"
         }
       },
       "agent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/850f1667-f504-11e5-8a84-bae500000163",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "organizationAccount": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/account/850c8af2-f504-11e5-8a84-bae50000015f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "agentAccount": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/account/850f1eab-f504-11e5-8a84-bae500000164",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "positions": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/0cb8d047-f664-11e5-8a84-bae500000095/positions",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
           "type": "invoiceposition",
           "mediaType": "application/json",
           "size": 6,
           "limit": 1000,
           "offset": 0
         }
       },
       "paidSum": 0,
       "shippedSum": 0,
       "salesChannel": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
           "type": "saleschannel",
           "mediaType": "application/json"
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/2ee1ce22-019e-11e6-9464-e4de0000007d",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
         "type": "invoiceout",
         "mediaType": "application/json"
       },
       "id": "2ee1ce22-019e-11e6-9464-e4de0000007d",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "updated": "2016-04-22 15:00:07",
       "name": "13212",
       "externalCode": "Vv-7tagmi46o0TTT6XI1a0",
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
       "moment": "2016-04-14 11:02:00",
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
       "sum": 408739611676,
       "organization": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "store": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json"
         }
       },
       "contract": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/contract/8ce3c179-015e-11e6-9464-e4de0000007a",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
           "type": "contract",
           "mediaType": "application/json"
         }
       },
       "agent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "organizationAccount": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/account/850c8af2-f504-11e5-8a84-bae50000015f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "agentAccount": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/account/9794f7a0-f689-11e5-8a84-bae500000079",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "positions": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/2ee1ce22-019e-11e6-9464-e4de0000007d/positions",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
           "type": "invoiceposition",
           "mediaType": "application/json",
           "size": 4,
           "limit": 1000,
           "offset": 0
         }
       },
       "paymentPlannedMoment": "2016-04-15 11:03:00",
       "paidSum": 0,
       "shippedSum": 0,
       "customerOrder": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/34efe2ee-015e-11e6-9464-e4de0000006b",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
           "type": "customerorder",
           "mediaType": "application/json"
         }
       },
       "salesChannel": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
           "type": "saleschannel",
           "mediaType": "application/json"
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/8a7a037d-0564-11e6-9464-e4de000000a2",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
         "type": "invoiceout",
         "mediaType": "application/json"
       },
       "id": "8a7a037d-0564-11e6-9464-e4de000000a2",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "updated": "2016-04-18 15:53:25",
       "name": "13213",
       "externalCode": "lLXQLQQrg2s1Q6j8vVt7g2",
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
       "moment": "2016-04-18 15:53:00",
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
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "store": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json"
         }
       },
       "project": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/project/51f263f9-0307-11e6-9464-e4de0000007c",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/project/metadata",
           "type": "project",
           "mediaType": "application/json"
         }
       },
       "agent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "organizationAccount": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/account/3a30e844-016f-11e6-9464-e4de00000068",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "agentAccount": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/account/3a30e844-016f-11e6-9464-e4de00000068",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "positions": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/8a7a037d-0564-11e6-9464-e4de000000a2/positions",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
           "type": "invoiceposition",
           "mediaType": "application/json",
           "size": 1,
           "limit": 1000,
           "offset": 0
         }
       },
       "paymentPlannedMoment": "2016-04-09 15:53:00",
       "paidSum": 0,
       "shippedSum": 0,
       "salesChannel": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
           "type": "saleschannel",
           "mediaType": "application/json"
         }
       }
     }
   ]
}
```

### Create Sales Invoice

Request to create a new Sales Invoice.
Mandatory fields to create:

| Parameter | Description |
| ---------- | --------- |
| **name** | Sales Invoice number |
| **organization** | Link to your legal entity in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **agent** | Link to the Sales Invoice in the format of[Metadata](../#kladana-json-api-general-info-metadata) |

> An example of creating a new Sales Invoice with a request body containing only the required fields.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/invoiceout"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "inv_out_name",
             "organization": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "agent": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/850f1667-f504-11e5-8a84-bae500000163",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                 "type": "counterparty",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Sales Invoice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/726e5b8c-0886-11e6-9464-e4de0000002a",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
     "type": "invoiceout",
     "mediaType": "application/json"
   },
   "id": "726e5b8c-0886-11e6-9464-e4de0000002a",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-22 16:02:47",
   "name": "inv_out_name",
   "externalCode": "BtPDebO1g1PlmStW1jr--2",
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
   "moment": "2016-04-22 16:02:47",
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/850f1667-f504-11e5-8a84-bae500000163",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/account/3a30e844-016f-11e6-9464-e4de00000068",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/account/850f1eab-f504-11e5-8a84-bae500000164",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/726e5b8c-0886-11e6-9464-e4de0000002a/positions",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
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

> An example of creating a new Sales Invoice with a larger request body.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/invoiceout"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "inv_out_name",
             "organization": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "agent": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/850f1667-f504-11e5-8a84-bae500000163",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                 "type": "counterparty",
                 "mediaType": "application/json"
               }
             },
             "code": "1243521",
             "externalCode": "666777666",
             "moment": "2016-04-19 13:50:24",
             "applicable": true,
             "description": "Account description",
             organizationAccount: {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/account/850c8af2-f504-11e5-8a84-bae50000015f",
                 "type": "account",
                 "mediaType": "application/json"
               }
             },
             "agentAccount": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/account/850f1eab-f504-11e5-8a84-bae500000164",
                 "type": "account",
                 "mediaType": "application/json"
               }
             },
             "store": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                 "type": "store",
                 "mediaType": "application/json"
               }
             },
             "salesChannel": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
                 "type": "saleschannel",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Sales Invoice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/128465fd-0887-11e6-9464-e4de0000002e",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
     "type": "invoiceout",
     "mediaType": "application/json"
   },
   "id": "128465fd-0887-11e6-9464-e4de0000002e",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-22 16:07:16",
   "name": "inv_out_name",
   "description": "Account description",
   "code": "1243521",
   "externalCode": "666777666",
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
   "moment": "2016-04-19 13:50:24",
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/850f1667-f504-11e5-8a84-bae500000163",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/account/850c8af2-f504-11e5-8a84-bae50000015f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/account/850f1eab-f504-11e5-8a84-bae500000164",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/128465fd-0887-11e6-9464-e4de0000002e/positions",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
       "type": "invoiceposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "shippedSum": 0,
   "salesChannel": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
       "type": "saleschannel",
       "mediaType": "application/json"
     }
   }
}
```

> An example of a request to create an Sales Invoice with additional fields.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/invoiceout"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "inv_out_name",
             "organization": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "agent": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/850f1667-f504-11e5-8a84-bae500000163",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                 "type": "counterparty",
                 "mediaType": "application/json"
               }
             },
             "code": "1243521",
             "externalCode": "666777666",
             "moment": "2016-04-19 13:50:24",
             "applicable": true,
             "description": "Invoice comment",
             "organizationAccount": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/account/850c8af2-f504-11e5-8a84-bae50000015f",
                 "type": "account",
                 "mediaType": "application/json"
               }
             },
             "agentAccount": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/account/850f1eab-f504-11e5-8a84-bae500000164",
                 "type": "account",
                 "mediaType": "application/json"
               }
             },
             "store": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                 "type": "store",
                 "mediaType": "application/json"
               }
             },
             "attributes": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "additional field value"
               }
             ],
             "salesChannel": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
                 "type": "saleschannel",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Sales Invoice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/c358e3ac-0887-11e6-9464-e4de00000032",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
     "type": "invoiceout",
     "mediaType": "application/json"
   },
   "id": "c358e3ac-0887-11e6-9464-e4de00000032",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-22 16:12:12",
   "name": "inv_out_name2",
   "description": "Invoice comment",
   "code": "124352133",
   "externalCode": "666777666",
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
   "moment": "2016-04-19 13:50:24",
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/850f1667-f504-11e5-8a84-bae500000163",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/account/850c8af2-f504-11e5-8a84-bae50000015f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/account/850f1eab-f504-11e5-8a84-bae500000164",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "51d191f4-0887-11e6-9464-e4de00000079",
       "name": "AttributeName1",
       "type": "string",
       "value": "additional field value"
     }
   ],
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/c358e3ac-0887-11e6-9464-e4de00000032/positions",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
       "type": "invoiceposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "shippedSum": 0,
   "salesChannel": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
       "type": "saleschannel",
       "mediaType": "application/json"
     }
   }
}
```

> An example of a request to create an Sales Invoice with items in the body of the request.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/invoiceout"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "inv_out_name3",
            "organization": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                    "type": "organizeion",
                    "mediaType": "application/json"
                }
            },
            "agent": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/850f1667-f504-11e5-8a84-bae500000163",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                    "type": "counterparty",
                    "mediaType": "application/json"
                }
            },
            "code": "12435213322",
            "externalCode": "666777666",
            "moment": "2016-04-19 13:50:24",
            "applicable": true,
            "description": "Invoice comment",
            "organizationAccount": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/account/850c8af2-f504-11e5-8a84-bae50000015f",
                    "type": "account",
                    "mediaType": "application/json"
                }
            },
            "agentAccount": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/account/850f1eab-f504-11e5-8a84-bae500000164",
                    "type": "account",
                    "mediaType": "application/json"
                }
            },
            "store": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                    "type": "store",
                    "mediaType": "application/json"
                }
            },
            "positions": [
                {
                    "quantity": 10,
                    "price": 100.0,
                    "discount": 0,
                    "vat": 0,
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/8b382799-f7d2-11e5-8a84-bae5000003a5",
                            "type": "product",
                            "mediaType": "application/json"
                        }
                    }
                },
                {
                    "quantity": 20,
                    "price": 200.0,
                    "discount": 0,
                    "vat": 21,
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/be903062-f504-11e5-8a84-bae50000019a",
                            "type": "product",
                            "mediaType": "application/json"
                        }
                    }
                }
            ]
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Sales Invoice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/6afee657-0888-11e6-9464-e4de00000037",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
     "type": "invoiceout",
     "mediaType": "application/json"
   },
   "id": "6afee657-0888-11e6-9464-e4de00000037",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-22 16:16:54",
   "name": "inv_out_name3",
   "description": "Invoice comment",
   "code": "12435213322",
   "externalCode": "666777666",
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
   "moment": "2016-04-19 13:50:24",
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
   "sum": 5840,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/850f1667-f504-11e5-8a84-bae500000163",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/account/850c8af2-f504-11e5-8a84-bae50000015f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/account/850f1eab-f504-11e5-8a84-bae500000164",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/6afee657-0888-11e6-9464-e4de00000037/positions",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
       "type": "invoiceposition",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "shippedSum": 0
}
```

### Bulk creating and update of Sales Invoices

[Bulk creating and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Sales Invoices.
In the body of the request, you need to pass an array containing the JSON representation of the Sales Invoices that you want to create or update.
Updated Sales Invoices must contain the identifier in the form of metadata.

> An example of creating and updating multiple Sales Invoices

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/invoiceout"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
            {
                "name": "inv_out_name",
                "organization": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                        "type": "organization",
                        "mediaType": "application/json"
                    }
                },
                "agent": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/850f1667-f504-11e5-8a84-bae500000163",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                        "type": "counterparty",
                        "mediaType": "application/json"
                    }
                }
            },
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/6afee657-0888-11e6-9464-e4de00000037",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
                    "type": "invoiceout",
                    "mediaType": "application/json"
                },
                "name": "change name",
                "code": "change_code",
                "externalCode": "666777666",
                "moment": "2016-04-19 13:50:24",
                "applicable": false,
                "description": "Invoice comment",
                "store": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                        "type": "store",
                        "mediaType": "application/json"
                    }
                }
            }
          ]'
```

> Response 200(application/json)
Successful request. The result is an array of JSON representations of created and updated Sales Invoices.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/726e5b8c-0886-11e6-9464-e4de0000002a",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
       "type": "invoiceout",
       "mediaType": "application/json"
     },
     "id": "726e5b8c-0886-11e6-9464-e4de0000002a",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
     "updated": "2016-04-22 16:02:47",
     "name": "inv_out_name",
     "externalCode": "BtPDebO1g1PlmStW1jr--2",
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
     "moment": "2016-04-22 16:02:47",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     "agent": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/850f1667-f504-11e5-8a84-bae500000163",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
         "type": "counterparty",
         "mediaType": "application/json"
       }
     },
     "organizationAccount": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/account/3a30e844-016f-11e6-9464-e4de00000068",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "agentAccount": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/account/850f1eab-f504-11e5-8a84-bae500000164",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/726e5b8c-0886-11e6-9464-e4de0000002a/positions",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
         "type": "invoiceposition",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     },
     "paidSum": 0,
     "shippedSum": 0,
     "salesChannel": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
         "type": "saleschannel",
         "mediaType": "application/json"
       }
     }
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/6afee657-0888-11e6-9464-e4de00000037",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
       "type": "invoiceout",
       "mediaType": "application/json"
     },
     "id": "6afee657-0888-11e6-9464-e4de00000037",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
     "updated": "2016-04-22 16:21:19",
     "name": "change name",
     "description": "Invoice comment",
     "code": "change_code",
     "externalCode": "666777666",
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
     "moment": "2016-04-19 13:50:24",
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
     "sum": 5840,
     "organization": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     "store": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       }
     },
     "agent": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/850f1667-f504-11e5-8a84-bae500000163",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
         "type": "counterparty",
         "mediaType": "application/json"
       }
     },
     "organizationAccount": {
       "meta": {"href": "https://api.kladana.com/api/remap/1.2/account/850c8af2-f504-11e5-8a84-bae50000015f",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "agentAccount": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/account/850f1eab-f504-11e5-8a84-bae500000164",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/6afee657-0888-11e6-9464-e4de00000037/positions",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
         "type": "invoiceposition",
         "mediaType": "application/json",
         "size": 2,
         "limit": 1000,
         "offset": 0
       }
     },
     "paidSum": 0,
     "shippedSum": 0,
     "salesChannel": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
         "type": "saleschannel",
         "mediaType": "application/json"
       }
     }
   }
]
```

### Delete Sales Invoice

**Parameters**

| Parameter | Description |
| ---------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Invoice id. |

> Request to delete the Sales Invoice with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/invoiceout/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of the Sales Invoice.

### Sales Invoice Bulk deletion

In the body of the request, you need to pass an array containing JSON of the metadata of the Sales Invoices that you want to delete.


> Request for bulk deletion of Sales Invoices.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/invoiceout/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/7944ef04-f831-11e5-7a69-971500188b1",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
                  "type": "invoiceout",
                  "mediaType": "application/json"
              }
          },
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/7944ef04-f831-11e5-7a69-971500188b2",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
                  "type": "invoiceout",
                  "mediaType": "application/json"
              }
          }
        ]'
```

> Successful request. Result - JSON information about the deletion of Sales Invoices.

```json
[
   {
     "info":"Entity 'invoiceout' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'invoiceout' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Sales Invoice Metadata
#### Sales Invoice Metadata

Request for metadata of Sales Invoices. The result is a JSON object including:

| Parameter | Description |
| ---------- | --------- |
| **meta** | Link to Invoice metadata |
| **attributes** | Array of objects additional fields of Sales Invoices in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **states** | Array of statuses of Sales Invoices |
| **createShared** | create new Sales Invoices labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Metadata of Sales Invoices

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional fields of Sales Invoices.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata/attributes/51d191f4-0887-11e6-9464-e4de00000079",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "51d191f4-0887-11e6-9464-e4de00000079",
       "name": "AttributeName1",
       "type": "string",
       "required": false
     }
   ],
   "createShared": false
}
```

### Separate additional field

**Parameters**

| Parameter | Description |
| ---------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id fields. |
 
#### Separate additional field
 
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata/attributes/d91965f1-558b-11e6-8a84-bae500000087",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "d91965f1-558b-11e6-8a84-bae500000087",
   "name": "AttributeName1",
   "type": "double",
   "required": false
}
```

### Sales Invoice Template
#### Sales Invoice Template

A request to receive a Sales Invoice template pre-filled with standard values for the buyer without being associated with any transaction.

> Empty request body (application/json)

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/invoiceout/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d''
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Sales Invoice.

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

### Sales Invoice template based on another transaction

Request a pre-filled Sales invoice based on a Sales Order or shipment. As a result of the request, a pre-filled Sales Invoice template will be created based on the submitted
document.

> Request to create an Sales Invoice based on the Sales Order.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/invoiceout/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "customerOrder": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/451cb4c0-3d1d-11e6-8a84-bae500000004",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
                 "type": "customerorder",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Sales invoice.

```json
{
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/6792c8d5-3d19-11e6-8a84-bae500000005",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
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
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/invoiceout/726e5b8c-0886-11e6-9464-e4de0000002a/positions",
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
   "shippedSum": 0,
   "customerOrder": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/451cb4c0-3d1d-11e6-8a84-bae500000004",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
       "type": "customerorder",
       "mediaType": "application/json"
     }
   }
}
```

> Request to create an Sales Invoice based on the Shipment.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/invoiceout/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "demands": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/demand/94e39314-cba5-11e7-6a80-332a00000035",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/demand/metadata",
                   "type": "demand",
                   "mediaType": "application/json",
                   "uuidHref": "https://app.kladana.com/app/#demand/edit?id=94e39314-cba5-11e7-6a80-332a00000035"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Sales invoice.

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
   "moment": "2017-11-22 19:08:56",
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
   "sum": 90000,
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/463fe231-ca1f-11e7-6a80-332a00000056",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#company/edit?id=463fe231-ca1f-11e7-6a80-332a00000056"
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
       "href": "https://online.moysklad.ru/api/remap/1.2/entity/invoiceout/726e5b8c-0886-11e6-9464-e4de0000002a/documents",
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
         "price": 90000.0,
         "discount": 0,
         "vat": 0,
         "vatEnabled": false,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/variant/b5d328b3-cab0-11e7-6a80-332a0000000d",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
             "type": "variant",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
           }
         }
       }
     ]
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "paidSum": 0,
   "shippedSum": 0,
   "demands": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/demand/94e39314-cba5-11e7-6a80-332a00000035",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/demand/metadata",
         "type": "demand",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#demand/edit?id=94e39314-cba5-11e7-6a80-332a00000035"
       }
     }
   ]
}
```

### Sales Invoice
### Get Sales Invoice

**Parameters**

| Parameter | Description |
| ---------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Invoice id. |
 
> Request for a separate Sales Invoice with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/invoiceout/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Sales Invoice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/0cb8d047-f664-11e5-8a84-bae500000095",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
     "type": "invoiceout",
     "mediaType": "application/json"
   },
   "id": "0cb8d047-f664-11e5-8a84-bae500000095",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-03-30 16:48:13",
   "name": "00001",
   "externalCode": "TAXyoccKiJPtMhcBAsqqw1",
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
   "moment": "2016-03-30 13:41:00",
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
   "sum": 123000,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/850f1667-f504-11e5-8a84-bae500000163",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/account/850c8af2-f504-11e5-8a84-bae50000015f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/account/850f1eab-f504-11e5-8a84-bae500000164",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/0cb8d047-f664-11e5-8a84-bae500000095/positions",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
       "type": "invoiceposition",
       "mediaType": "application/json",
       "size": 6,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "shippedSum": 0,
   "salesChannel": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
       "type": "saleschannel",
       "mediaType": "application/json"
     }
   }
}
```

### Change Sales Invoice

Request to update the Sales Invoice with the specified id. In the body of the request, you can specify only those fields that need to be changed for the Sales Invoice, except for those that are marked `Read-Only` in the description of the [Sales Invoice attributes](../documents/#transactions-sales-invoice).

When updating the **organization** and **agent** fields, you must also update the **organizationAccount** and
**agentAccount** respectively, otherwise an error will occur.

**Parameters**

| Parameter | Description |
| ---------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Invoice id. |

> An example of a request to update a Sales Invoice.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/invoiceout/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "change name",
             "code": "change_code",
             "externalCode": "666777666",
             "moment": "2016-04-19 13:50:24",
             "applicable": false,
             "description": "Invoice comment",
             "store": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                 "type": "store",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Sales Invoice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/6afee657-0888-11e6-9464-e4de00000037",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
     "type": "invoiceout",
     "mediaType": "application/json"
   },
   "id": "6afee657-0888-11e6-9464-e4de00000037",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-22 16:21:19",
   "name": "change name",
   "description": "Invoice comment",
   "code": "change_code",
   "externalCode": "666777666",
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
   "moment": "2016-04-19 13:50:24",
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
   "sum": 5840,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/850f1667-f504-11e5-8a84-bae500000163",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/account/850c8af2-f504-11e5-8a84-bae50000015f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/account/850f1eab-f504-11e5-8a84-bae500000164",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/6afee657-0888-11e6-9464-e4de00000037/positions",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
       "type": "invoiceposition",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "shippedSum": 0,
   "salesChannel": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
       "type": "saleschannel",
       "mediaType": "application/json"
     }
   }
}
```

> An example of a request to change the Sales Invoice with additional fields.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/invoiceout/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "change name",
             "code": "change_code",
             "externalCode": "666777666",
             "moment": "2016-04-19 13:50:24",
             "applicable": false,
             "description": "Invoice comment",
             "store": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                 "type": "store",
                 "mediaType": "application/json"
               }
             },
             "attributes": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "new_val"
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Sales Invoice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/6afee657-0888-11e6-9464-e4de00000037",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
     "type": "invoiceout",
     "mediaType": "application/json"
   },
   "id": "6afee657-0888-11e6-9464-e4de00000037",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-22 16:21:19",
   "name": "change name",
   "description": "Invoice comment",
   "code": "change_code",
   "externalCode": "666777666",
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
   "moment": "2016-04-19 13:50:24",
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
   "sum": 5840,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/850f1667-f504-11e5-8a84-bae500000163",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/account/850c8af2-f504-11e5-8a84-bae50000015f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/account/850f1eab-f504-11e5-8a84-bae500000164",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
         "type":"attributemetadata",
         "mediaType": "application/json"
       },
       "id": "51d191f4-0887-11e6-9464-e4de00000079",
       "name": "AttributeName1",
       "type": "string",
       "value": "new_val"
     }
   ],
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/6afee657-0888-11e6-9464-e4de00000037/positions",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
       "type": "invoiceposition",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "shippedSum": 0,
   "salesChannel": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
       "type": "saleschannel",
       "mediaType": "application/json"
     }
   }
}
```

> An example of a request to update the Sales Invoice with items in the body of the request.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/invoiceout/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "change name again",
             "code": "change_code_again",
             "externalCode": "666777666",
             "moment": "2016-04-19 13:50:24",
             "applicable": false,
             "description": "Now with 1 item",
             "store": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                 "type": "store",
                 "mediaType": "application/json"
               }
             },
             "attributes": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "new_val_again"
               }
             ],
             "positions": [
               {
                 "quantity": 20,
                 "price": 200.0,
                 "discount": 0,
                 "vat": 21,
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/product/be903062-f504-11e5-8a84-bae50000019a",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Sales Invoice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/6afee657-0888-11e6-9464-e4de00000037",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
     "type": "invoiceout",
     "mediaType": "application/json"
   },
   "id": "6afee657-0888-11e6-9464-e4de00000037",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-22 16:25:06",
   "name": "change name again",
   "description": "Now with 1 item",
   "code": "change_code_again",
   "externalCode": "666777666",
   "owner": {
     "name": "Administrator"
   },
   "shared": false,
   "group": {
     "name": "Main"
   },
   "moment": "2016-04-19 13:50:24",
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
   "sum": 4000,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/850f1667-f504-11e5-8a84-bae500000163",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/account/850c8af2-f504-11e5-8a84-bae50000015f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/account/850f1eab-f504-11e5-8a84-bae500000164",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "51d191f4-0887-11e6-9464-e4de00000079",
       "name": "AttributeName1",
       "type": "string",
       "value": "new_val_again"
     }
   ],
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/6afee657-0888-11e6-9464-e4de00000037/positions",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
       "type": "invoiceposition",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "shippedSum": 0,
   "salesChannel": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
       "type": "saleschannel",
       "mediaType": "application/json"
     }
   }
}
```

### Sales Invoice Item

A separate resource for managing the items of the Sales Invoice. With it, you can manage the items of a larger document that has more lines than the limit on the number of lines saved with the document. This limit is 1000. You can read more about limits on the number of document lines and working with large documents [here](../#kladana-json-api-general-info-working-with-transaction-items).
  
### Get Sales Invoice items

Request for a list of all items of the Sales Invoice.

| Title | Type | Description |
| ---------- | --------- |-------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the items in the Sales Invoice. |

**Parameters**

| Parameter | Description |
| ---------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Invoice id. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Sales Invoice

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/invoiceout/7944ef04-f831-11e5-7a69-971500188b19/positions"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of items of a particular Sales Invoice.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/7944ef04-f831-11e5-7a69-971500188b19/positions",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
     "type": "invoiceposition",
     "mediaType": "application/json",
     "size": 1,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/7944ef04-f831-11e5-7a69-971500188b19/positions/90572e91-0889-11e6-9464-e4de00000043",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
         "type": "invoiceposition",
         "mediaType": "application/json"
       },
       "id": "90572e91-0889-11e6-9464-e4de00000043",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "quantity": 20,
       "price": 200.0,
       "discount": 0,
       "vat": 0,
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/be903062-f504-11e5-8a84-bae50000019a",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
         }
       }
     }
   ]
}
```

### Add Item to Sales Invoice

Request to create a new item in the Sales Invoice.
For successful creation, the following fields must be specified in the request body:

+ **assortment** - Link to the product/service/series/modification that the item represents.
You can also specify a field named **service**, **variant** according to
what the indicated item is. You can read more about this field in the description of the [Invoice item](../documents/#transactions-sales-invoice-sales-invoices-sales-invoice-items)
+ **quantity** - Quantity of the specified item. Must be positive, otherwise an error will occur.
Just like when working with [Sales Order Items](../documents/#transactions-sales-order-sales-orders-sales-orders-items), you can create one or more items in one request.

**Parameters**

| Parameter | Description |
| ---------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Invoice id. |

> An example of creating a item in a Sales Invoice.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/invoiceout/7944ef04-f831-11e5-7a69-971500188b19/positions"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "quantity": 12,
             "price": 999.0,
             "discount": 1,
             "assortment": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/variant/671402e4-f7d2-11e5-8a84-bae50000007c",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                 "type": "variant",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created item of a Sales Invoice.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/7944ef04-f831-11e5-7a69-971500188b19/positions/8a43c5a3-088a-11e6-9464-e4de00000046",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
       "type": "invoiceposition",
       "mediaType": "application/json"
     },
     "id": "8a43c5a3-088a-11e6-9464-e4de00000046",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "quantity": 12,
     "price": 999.0,
     "discount": 1,
     "vat": 0,
     "vatEnabled": false,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/671402e4-f7d2-11e5-8a84-bae50000007c",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#feature/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
       }
     }
   }
]
```

### Sales Invoice Item

Request an item of Sales Invoice with the specified item id.
  
### Get Sales Invoice Item

**Parameters**

| Parameter | Description |
| ---------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Invoice id. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* item id of the Sales Invoice. |
 
> Request to receive a separate item of the Sales Invoice with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/invoiceout/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the line item of the Sales Invoice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
     "type": "invoiceposition",
     "mediaType": "application/json"
   },
   "id": "34f6344f-015e-11e6-9464-e4de0000006c",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "quantity": 12,
   "price": 999.0,
   "discount": 1,
   "vat": 0,
   "vatEnabled": false,
   "assortment": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/671402e4-f7d2-11e5-8a84-bae50000007c",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
       "type": "variant",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#feature/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
     }
   }
}
```
        
### Change Sales Invoice Item

Request to update a line item in an Invoice. There is no way to update the item required fields in the body of the request. Only the ones you want to update.

**Parameters**

| Parameter | Description |
| ---------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Invoice id. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* item id of the Sales Invoice. |
 
> An example of a request to update a line item in a Sales Invoice.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/invoiceout/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "quantity": 22,
             "price": 1000.0,
             "discount": 0,
             "vat": 12
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Sales Invoice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
     "type": "invoiceposition",
     "mediaType": "application/json"
   },
   "id": "34f6344f-015e-11e6-9464-e4de0000006c",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "quantity": 22,
   "price": 1000.0,
   "discount": 0,
   "vat": 0,
   "vatEnabled": false,
   "assortment": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/671402e4-f7d2-11e5-8a84-bae50000007c",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
       "type": "variant",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#feature/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
     }
   }
}
```

### Delete Item

**Parameters**

| Parameter | Description |
| ---------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Invoice id. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* item id of the Sales Invoice. |
 
> Request to delete a separate item of the Sales Invoice with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/invoiceout/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of an Sales Invoice item.
