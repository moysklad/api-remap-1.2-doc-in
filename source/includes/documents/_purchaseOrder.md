## Purchase Order
### Purchase Orders

Using the JSON API, you can create and update information about Purchase Orders, request lists of Orders, and information on individual Purchase Orders. Purchase Order items can be managed both as part of a separate Purchase Order, and separately using special resources for managing Order items. The entity code for a Purchase Order as part of the JSON API is the **purchaseorder** keyword. Learn more about [Purchase Order](https://kladana.zendesk.com/hc/en-us/articles/360017685558-Create-Purchase-Orders).

#### Entity attributes

| Title | Type | Filtration | Description |
| ---------- | ------- | --------|--------|
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **agent** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Counterparty metadata<br>`+Required when replying` `+Expand` `+Required when creating` |
| **agentAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Counterparty account metadata<br>`+Expand` |
| **applicable** | Boolean | `=` `!=` | Check mark<br>`+Required when replying` |
| **attributes** | Array(Object) | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields) |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Purchase Order Code |
| **contract** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Contract metadata<br>`+Expand` |
| **created** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Creation date<br>`+Required when replying` `+Read only` |
| **deleted** | DateTime | `=` `!=` `<` `>` `<=` `>=` | The moment of last deletion of the Purchase Order<br>`+Read Only` |
| **deliveryPlannedMoment** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Planned date of shipment |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Purchase Order Comment |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | External code of the Purchase Order<br>`+Required when replying` |
| **files** | MetaArray | | [Files](../dictionaries/#entities-files) array metadata (Maximum number of files - 100)<br>`+Required when replying` `+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Departmentemployee l<br>`+Required when replying` `+Expand` |
| **id** | UUID | `=` `!=` | Purchase Order ID<br>`+Required when replying` `+Read Only` |
| **invoicedSum** | Float | | Purchase invoice amount<br>`+Read-only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Purchase Order Metadata<br>`+Required when replying` |
| **moment** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Document date<br>`+Required when replying` |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Purchase Order Name<br>`+Required when replying` |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Legal entity metadata<br>`+Required when replying` `+Expand` `+Required when creating` |
| **organizationAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Legal entity account metadata<br>`+Expand` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Expand` |
| **paidSum** | Float | | Amount of incoming payments for the Order<br>`+Read Only` |
| **positions** | MetaArray | | Metadata of Purchase Order items<br>`+Required for response` `+Expand` |
| **printed** | Boolean | `=` `!=` | Is the document printed<br>`+Required when responding` `+Read Only` |
| **project** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Project metadata<br>`+Expand` |
| **published** | Boolean | `=` `!=` | Is the document published<br>`+Required``+Read-Only`` |
| **rate** | Object | | Currency. [Learn more](../documents/#transactions-currency-in-transactions)<br>`+Required when replying` |
| **shared** | Boolean | `=` `!=` | Sharing<br>`+Required when replying` |
| **shippedSum** | Float | | Amount accepted<br>`+Read only` |
| **state** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Order status metadata<br>`+Expand` |
| **store** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Warehouse metadata<br>`+Expand` |
| **sum** | Int | `=` `!=` `<` `>` `<=` `>=` | The amount of the Purchase Order in the specified currency<br>`+Read only` |
| **syncId** | UUID | `=` `!=` | Synchronization ID. After filling it is not available for change |
| **updated** | DateTime | `=` `!=` `<` `>` `<=` `>=` | The moment of the last update of the Purchase Order<br>`+Required when replying` `+Read only` |
| **vatEnabled** | Boolean | | Is VAT taken into account<br>`+Required when replying` |
| **vatIncluded** | Boolean | | Is VAT included in the price |
| **vatSum** | Float | | VAT amount<br>`+Read only` |
| **waitSum** | Float | | Amount of goods in transit<br> |

#### Links to other documents

| Title | Description |
| ------------ | ---------- |
| **customerOrders** | An array of links to related customer orders in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **invoicesIn** | An array of links to related supplier accounts in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **payments** | An array of links to related payments in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **supplies** | An array of links to related acceptances in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **internalOrder** | An internal order associated with a Purchase order, in the format [Metadata](../#kladana-json-api-general-info-metadata) |

#### Purchase Order Items

Purchase Order Items is a list of products, services, and product variants.The Purchase Order item object contains the following fields:

| Title | Type | Description |
| ------------ | ---------- |--------- |
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Read Only` |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of a product, service, batch, or product variant, which is an item<br>`+Required when replying` `+Expand` |
| **discount** | Float | The percentage of the discount or markup. The markup is indicated as a negative number, i.e. -10 will create a markup of 10%<br>`+Required when replying` |
| **id** | UUID | Item ID<br>`+Required when replying` `+Read Only` |
| **pack** | Object | Product packaging. [Learn more](../dictionaries/#entities-product-products-nested-entity-attributes-product-packaging) |
| **price** | Float | The price of the product/service in paise<br>`+Required when replying` |
| **quantity** | Float | The number of products/services of this type in the item. If an item is a product with serial number accounting enabled, then the value in this field will always be equal to the number of serial numbers for this item in the transaction.<br>`+Required when replying` |
| **shipped** | Float | Accepted<br>`+Required when replying` |
| **inTransit** | Float | Waiting<br>`+Required for response` |
| **vat** | Int | VAT applicable to the current item<br>`+Required when replying` |
| **vatEnabled** | Boolean | Whether VAT is included for the item. With this item flag, you canset VAT = 0 or VAT = "without VAT". (vat = 0, vatEnabled = false) -> vat = "excluding VAT", (vat = 0, vatEnabled = true) -> vat = 0%.<br>`+Required when replying` |

You can work with items using special resources for managing Order items,
and also as part of a separate Purchase Order. When working as part of a separate Purchase Order,
you can send requests to create a separate Purchase Order with included in the request body
an array of Order items. If the number of items exceeds the maximum allowed, then for
further replenishment of items, you will need to work with a special resource "Items of the Purchase Order".
Also, when working as part of a separate Purchase Order, you can send requests to update the list of items
with an array of Order items included in the request body. It is important to remember that the collection of items will
be perceived as "All items of the Order" and completely replace the existing collection when updating the object. Superfluous
items will be deleted, new ones added, existing ones changed.

About working with fields of the Purchase Orders can be read [here](../#kladana-json-api-general-info-additional-fields)

### Get a list of Purchase Orders

Request all Purchase Orders on this account.
Result: JSON object including fields:

| Title | Type | Description |
| ------------ | ---------- |--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Purchase Orders. |

**Parameters**

| Parameter | Description |
| ------------ | ---------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** | `string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Get a list of Purchase Orders

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/purchaseorder"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Purchase Orders.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata",
     "type": "purchaseorder",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/172fb2f6-3f70-11e6-8a84-bae50000008e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata",
         "type": "purchaseorder",
         "mediaType": "application/json"
       },
       "id": "172fb2f6-3f70-11e6-8a84-bae50000008e",
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
       "updated": "2016-07-01 12:42:13",
       "name": "00002",
       "description": "Order description",
       "externalCode": "FfSmVuSKi7h8L-jLADHV80",
       "moment": "2016-07-01 12:40:00",
       "applicable": true,
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
       "sum": 5900,
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
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/14ae5431-32ca-11e6-8a84-bae50000002d",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "state": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/states/11f5becd-3f70-11e6-8a84-bae50000008b",
           "type": "state",
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
           "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/172fb2f6-3f70-11e6-8a84-bae50000008e/positions",
           "type": "purchaseorderposition",
           "mediaType": "application/json",
           "size": 5,
           "limit": 1000,
           "offset": 0
         }
       },
       "deliveryPlannedMoment": "2016-07-15 12:40:00",
       "paidSum": 0,
       "shippedSum": 0,
       "invoicedSum": 0,
       "waitSum": 5900
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/403e7ea0-2e63-11e6-8a84-bae500000131",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata",
         "type": "purchaseorder",
         "mediaType": "application/json"
       },
       "id": "403e7ea0-2e63-11e6-8a84-bae500000131",
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
       "updated": "2016-06-10 10:06:46",
       "name": "00001",
       "externalCode": "pk6fh0NthbBSgrqI931uA0",
       "moment": "2016-06-10 10:06:00",
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
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/faf44002-2e58-11e6-8a84-bae500000053",
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
           "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/403e7ea0-2e63-11e6-8a84-bae500000131/positions",
           "type": "purchaseorderposition",
           "mediaType": "application/json",
           "size": 2,
           "limit": 1000,
           "offset": 0
         }
       },
       "deliveryPlannedMoment": "2016-06-11 10:06:00",
       "paidSum": 0,
       "shippedSum": 0,
       "invoicedSum": 0,
       "waitSum": 0
     }
   ]
}
```
        
### Create Purchase Order

Request to create a new Purchase Order.
Mandatory fields to create:

| Parameter | Description |
| ------------ | ---------- |
| **organization** | Link to your legal entity in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **agent** | Link to the counterparty (supplier) in the format [Metadata](../#kladana-json-api-general-info-metadata) |

> An example of creating a new Order.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/purchaseorder"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "103034",
             "description": "Typical Purchase order",
             "organization": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "code": "404",
             "moment": "2016-12-05 15:30:14",
             "applicable": true,
             "vatEnabled": true,
             "vatIncluded": true,
             "agent": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/1483952f-32ca-11e6-8a84-bae500000007",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                 "type": "counterparty",
                 "mediaType": "application/json"
               }
             },
             "state": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/states/11f5becd-3f70-11e6-8a84-bae50000008b",
                 "type": "state",
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
             "rate": {
               "currency": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/currency/cdbc62de-3f68-11e6-8a84-bae500000050",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                   "type": "currency",
                   "mediaType": "application/json"
                 }
               }
             },
             "deliveryPlannedMoment": "2015-02-15 14:12:19",
             "attributes": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a885b1b-3f70-11e6-8a84-bae50000009d",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "Black"
               },
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a88619c-3f70-11e6-8a84-bae50000009e",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": 0.4
               },
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a886744-3f70-11e6-8a84-bae50000009f",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": true
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Purchase Order.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/22b4caaa-3f74-11e6-8a84-bae500000069",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata",
     "type": "purchaseorder",
     "mediaType": "application/json"
   },
   "id": "22b4caaa-3f74-11e6-8a84-bae500000069",
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
   "updated": "2016-07-01 13:11:11",
   "name": "103034",
   "description": "Typical Purchase order",
   "code": "404",
   "externalCode": "s30P0zlwg-1qxSZnRVONF0",
   "moment": "2016-12-05 15:30:14",
   "applicable": true,
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
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/states/11f5becd-3f70-11e6-8a84-bae50000008b",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {"href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
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
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a885b1b-3f70-11e6-8a84-bae50000009d",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "6a885b1b-3f70-11e6-8a84-bae50000009d",
       "name": "AttributeName1",
       "type": "string",
       "value": "Black"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a88619c-3f70-11e6-8a84-bae50000009e",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "6a88619c-3f70-11e6-8a84-bae50000009e",
       "name": "AttributeName2",
       "type": "double",
       "value": 0.4
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a886744-3f70-11e6-8a84-bae50000009f",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "6a886744-3f70-11e6-8a84-bae50000009f",
       "name": "AttributeName3",
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/22b4caaa-3f74-11e6-8a84-bae500000069/positions",
       "type": "purchaseorderposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "deliveryPlannedMoment": "2015-02-15 14:12:19",
   "paidSum": 0,
   "shippedSum": 0,
   "invoicedSum": 0,
   "waitSum": 0
}
```

> An example of a request to create a Purchase Order with positions in the body of the request.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/purchaseorder"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "777",
             "description": "Typical Purchase order",
             "organization": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "code": "404",
             "moment": "2016-12-05 15:30:14",
             "applicable": true,
             "vatEnabled": true,
             "vatIncluded": true,
             "agent": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/1483952f-32ca-11e6-8a84-bae500000007",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                 "type": "counterparty",
                 "mediaType": "application/json"
               }
             },
             "state": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/states/11f5becd-3f70-11e6-8a84-bae50000008b",
                 "type": "state",
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
             "rate": {
               "currency": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/currency/cdbc62de-3f68-11e6-8a84-bae500000050",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                   "type": "currency",
                   "mediaType": "application/json"
                 }
               }
             },
             "deliveryPlannedMoment": "2015-02-15 14:12:19",
             "attributes": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a885b1b-3f70-11e6-8a84-bae50000009d",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "Black"
               },
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a88619c-3f70-11e6-8a84-bae50000009e",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": 0.4
               },
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a886744-3f70-11e6-8a84-bae50000009f",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": true
               }
             ],
             "positions": [
               {
                 "quantity": 12,
                 "price": 300.0,
                 "vat": 0,
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                     "type": "variant",
                     "mediaType": "application/json"
                   }
                 },
                 "inTransit": 11
               },
               {
                 "quantity": 3,
                 "price": 1000.0,
                 "discount": 0,
                 "vat": 10,
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/product/7a6f697f-3c64-11e6-8a84-bae500000006",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 },
                 "inTransit": 1
               },
               {
                 "quantity": 404,
                 "price": 454.0,
                 "discount": 200,
                 "vat": 21,
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a83c422-3c64-11e6-8a84-bae500000012",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                     "type": "variant",
                     "mediaType": "application/json"
                   }
                 },
                 "inTransit": 216
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Purchase Order.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/ae7fa9fb-3f74-11e6-8a84-bae500000070",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata",
     "type": "purchaseorder",
     "mediaType": "application/json"
   },
   "id": "ae7fa9fb-3f74-11e6-8a84-bae500000070",
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
   "updated": "2016-07-01 13:15:05",
   "name": "777",
   "description": "Typical Purchase order",
   "code": "404",
   "externalCode": "37KNBm71gw7Zm00T5JdAt0",
   "moment": "2016-12-05 15:30:14",
   "applicable": true,
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
   "sum": 176816,
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
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/states/11f5becd-3f70-11e6-8a84-bae50000008b",
       "type": "state",
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
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a885b1b-3f70-11e6-8a84-bae50000009d",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "6a885b1b-3f70-11e6-8a84-bae50000009d",
       "name": "AttributeName1",
       "type": "string",
       "value": "Black"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a88619c-3f70-11e6-8a84-bae50000009e",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "6a88619c-3f70-11e6-8a84-bae50000009e",
       "name": "AttributeName2",
       "type": "double",
       "value": 0.4
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a886744-3f70-11e6-8a84-bae50000009f",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "6a886744-3f70-11e6-8a84-bae50000009f",
       "name": "AttributeName3",
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/ae7fa9fb-3f74-11e6-8a84-bae500000070/positions",
       "type": "purchaseorderposition",
       "mediaType": "application/json",
       "size": 3,
       "limit": 1000,
       "offset": 0
     }
   },
   "deliveryPlannedMoment": "2015-02-15 14:12:19",
   "paidSum": 0,
   "shippedSum": 0,
   "invoicedSum": 0,
   "waitSum": 5907132
}
```

### Purchase Order Bulk creating and update

[Bulk creating and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Purchase orders.
In the body of the request, you need to pass an array containing JSON representations of the Purchase Orders that you want to create or update.
Updated Purchase Orders must contain the identifier in the form of metadata.

> Example of creating and updating multiple Purchase Orders

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/purchaseorder"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "103034",
               "description": "Typical Purchase order",
               "organization": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                   "type": "organization",
                   "mediaType": "application/json"
                 }
               },
               "code": "404",
               "moment": "2016-12-05 15:30:14",
               "applicable": true,
               "vatEnabled": true,
               "vatIncluded": true,
               "agent": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/1483952f-32ca-11e6-8a84-bae500000007",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                   "type": "counterparty",
                   "mediaType": "application/json"
                 }
               },
               "state": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/states/11f5becd-3f70-11e6-8a84-bae50000008b",
                   "type": "state",
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
               contract: {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/contract/e105a2e7-3f6f-11e6-8a84-bae500000087",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
                   "type": "contract",
                   "mediaType": "application/json"
                 }
               },
               "rate": {
                 "currency": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/currency/cdbc62de-3f68-11e6-8a84-bae500000050",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                     "type": "currency",
                     "mediaType": "application/json"
                   }
                 }
               },
               "deliveryPlannedMoment": "2015-02-15 14:12:19",
               "attributes": [
                 {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a885b1b-3f70-11e6-8a84-bae50000009d",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   "value": "Black"
                 },
                 {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a88619c-3f70-11e6-8a84-bae50000009e",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   "value": 0.4
                 },
                 {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a886744-3f70-11e6-8a84-bae50000009f",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   "value": true
                 }
               ]
             },
             {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/ae7fa9fb-3f74-11e6-8a84-bae500000070",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata",
                 "type": "purchaseorder",
                 "mediaType": "application/json"
               },
               "updated": "2016-07-01 13:15:05",
               "name": "777",
               "description": "Typical Purchase Order, with contract, other currency",
               "code": "404",
               "externalCode": "37KNBm7Ф1gw7Zm00T5JdAt0",
               "moment": "2016-12-05 15:30:14",
               "applicable": false,
               "rate": {
                 currency: {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                     "type": "currency",
                     "mediaType": "application/json"
                   }
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
                   "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/1485d676-32ca-11e6-8a84-bae500000009",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                   "type": "counterparty",
                   "mediaType": "application/json"
                 }
               },
               "state": null,
               organizationAccount: {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
                   "type": "account",
                   "mediaType": "application/json"
                 }
               },
               "attributes": [
                 {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a885b1b-3f70-11e6-8a84-bae50000009d",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   "value": "AttributeValue1"
                 },
                 {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a88619c-3f70-11e6-8a84-bae50000009e",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   "value": 0.99
                 },
                 {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a886744-3f70-11e6-8a84-bae50000009f",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   "value": true
                 }
               ],
               "vatEnabled": true,
               "vatIncluded": false,
               "positions": [],
               "deliveryPlannedMoment": "2016-02-15 14:12:19"
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is an array of JSON representations of the created and updated Purchase Orders.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/22b4caaa-3f74-11e6-8a84-bae500000069",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata",
       "type": "purchaseorder",
       "mediaType": "application/json"
     },
     "id": "22b4caaa-3f74-11e6-8a84-bae500000069",
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
     "updated": "2016-07-01 13:11:11",
     "name": "103034",
     "description": "Typical Purchase order",
     "code": "404",
     "externalCode": "s30P0zlwg-1qxSZnRVONF0",
     "moment": "2016-12-05 15:30:14",
     "applicable": true,
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
     "state": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/states/11f5becd-3f70-11e6-8a84-bae50000008b",
         "type": "state",
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
     "attributes": [
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a885b1b-3f70-11e6-8a84-bae50000009d",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "6a885b1b-3f70-11e6-8a84-bae50000009d",
         "name": "AttributeName1",
         "type": "string",
         "value": "AttributeValue1"
       },
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a88619c-3f70-11e6-8a84-bae50000009e",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "6a88619c-3f70-11e6-8a84-bae50000009e",
         "name": "AttributeName2",
         "type": "double",
         "value": 0.4
       },
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a886744-3f70-11e6-8a84-bae50000009f",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "6a886744-3f70-11e6-8a84-bae50000009f",
         "name": "AttributeName1",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/22b4caaa-3f74-11e6-8a84-bae500000069/positions",
         "type": "purchaseorderposition",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     },
     "deliveryPlannedMoment": "2015-02-15 14:12:19",
     "paidSum": 0,
     "shippedSum": 0,
     "invoicedSum": 0,
     "waitSum": 0
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/ae7fa9fb-3f74-11e6-8a84-bae500000070",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata",
       "type": "purchaseorder",
       "mediaType": "application/json"
     },
     "id": "ae7fa9fb-3f74-11e6-8a84-bae500000070",
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
     "updated": "2016-07-01 13:23:26",
     "name": "777",
     "description": "Typical Purchase Order, with contract, other currency",
     "code": "404",
     "externalCode": "37KNBm7Ф1gw7Zm00T5JdAt0",
     "moment": "2016-12-05 15:30:14",
     "applicable": false,
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/1485d676-32ca-11e6-8a84-bae500000009",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
         "type": "counterparty",
         "mediaType": "application/json"
       }
     },
     "state": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/states/11f5becd-3f70-11e6-8a84-bae50000008b",
         "type": "state",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/1485d676-32ca-11e6-8a84-bae500000009/accounts/1485e43e-32ca-11e6-8a84-bae50000000a",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "attributes": [
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a885b1b-3f70-11e6-8a84-bae50000009d",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "6a885b1b-3f70-11e6-8a84-bae50000009d",
         "name": "AttributeName1",
         "type": "string",
         "value": "AttributeValue1"
       },
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a88619c-3f70-11e6-8a84-bae50000009e",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "6a88619c-3f70-11e6-8a84-bae50000009e",
         "name": "AttributeName2",
         "type": "double",
         "value": 0.99
       },
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a886744-3f70-11e6-8a84-bae50000009f",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "6a886744-3f70-11e6-8a84-bae50000009f",
         "name": "AttributeName3",
         "type": "boolean",
         "value": true
       }
     ],
     "vatEnabled": true,
     "vatIncluded": false,
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/ae7fa9fb-3f74-11e6-8a84-bae500000070/positions",
         "type": "purchaseorderposition",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     },
     "deliveryPlannedMoment": "2016-02-15 14:12:19",
     "paidSum": 0,
     "shippedSum": 0,
     "invoicedSum": 0,
     "waitSum": 0
   }
]
```

### Delete Purchase Order

**Parameters**

| Parameter | Description |
| ------------ | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Purchase Order id. |

> Request to delete the Purchase Order with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of the Purchase Order.

### Purchase Oreder Bulk deletion

In the body of the request, you need to pass an array containing JSON metadata of the Purchase Orders you want to remove.


> Request for bulk deletion of Purchase Orders.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b1",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata",
                "type": "purchaseorder",
                "mediaType": "application/json"
            }
        },
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b2",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata",
                "type": "purchaseorder",
                "mediaType": "application/json"
            }
        }
      ]'
```

> Successful request. Result - JSON information about deleting Purchase Orders.

```json
[
   {
     "info":"Entity 'purchaseorder' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'purchaseorder' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```
### Purchase Orders Metadata
#### Purchase Orders Metadata

Request for metadata of Purchase Orders. The result is a JSON object including:

| Parameter | Description |
| ------------ | ---------- |
| **meta** | Link to metadata of Purchase Orders|
| **attributes** | Array of objects additional Purchase Order fields in [Metadata](../#kladana-json-api-general-info-metadata) format |
| **states** | Array of statuses of Purchase Orders |
| **createShared** | create new Purchase Orders labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Metadata of Purchase Orders

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional fields of Purchase Orders.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a885b1b-3f70-11e6-8a84-bae50000009d",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "6a885b1b-3f70-11e6-8a84-bae50000009d",
       "name": "AttributeName1",
       "type": "string",
       "required": false
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a88619c-3f70-11e6-8a84-bae50000009e",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "6a88619c-3f70-11e6-8a84-bae50000009e",
       "name": "AttributeName2",
       "type": "double",
       "required": false
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a886744-3f70-11e6-8a84-bae50000009f",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "6a886744-3f70-11e6-8a84-bae50000009f",
       "name": "AttributeName3",
       "type": "boolean",
       "required": false
     }
   ],
   "states": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/states/11f5becd-3f70-11e6-8a84-bae50000008b",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "11f5becd-3f70-11e6-8a84-bae50000008b",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Awaiting submission",
       "color": 10066329,
       "stateType": "Regular",
       "entityType": "purchaseorder"
     }
   ],
   "createShared": false
}
```

### Separate additional field

#### Separate additional field

**Parameters**

| Parameter | Description |
| ------------ | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Field ID. |
 
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a88619c-3f70-11e6-8a84-bae50000009e",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "6a88619c-3f70-11e6-8a84-bae50000009e",
   "name": "AttributeName3",
   "type": "double",
   "required": false
}
```

### Purchase Order Template
#### Purchase Orderr Template

A request to receive an order template pre-filled with standard values to a supplier without being associated with any document.

> Purchase Order template

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/new
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d''
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the pre-filled Purchase Order.

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
   "moment": "2016-11-25 17:33:33",
   "applicable": true,
   "sum": 0,
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/b942743c-9128-11e6-8a84-bae500000053",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
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
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051/accounts/b932bc5b-9128-11e6-8a84-bae500000052",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/ae7fa9fb-3f74-11e6-8a84-bae500000070/positions",
       "type": "purchaseorderposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "printed": true,
   "published": true,
   "paidSum": 0,
   "shippedSum": 0,
   "invoicedSum": 0
}
```

### Purchase Order Template based on Sales Order

A request to receive a pre-filled order template from a Purchase Order based on an internal order or a Sales order.
In response to the request, a pre-filled Purchase Order template will be returned to the supplier.

There will be no `agent` field in the template,
because The supplier of the goods (`agent` in the order template to the supplier) does not match the Buyer (`agent` in the Sales Order), you need to fill it out yourself. The template can then be used to create a new order using a POST request.

When creating a document based on a Sales Order containing bundles in items, bandles will be automatically broken down into their constituent components into separate items.

If the document specified as the basis already has a Purchase Order associated with it, then the items specified in it
will not be specified in the created template.

> Sample request for a Purchase Order template based on an internal order.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "internalOrder": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/internalorder/64e426af-b0d8-11e6-8a84-bae500000064",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/internalorder/metadata",
                 "type": "internalorder",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the pre-filled Purchase Order.

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
   "moment": "2016-11-25 17:34:37",
   "applicable": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/b942e6f2-9128-11e6-8a84-bae500000058",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 9910,
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/b942743c-9128-11e6-8a84-bae500000053",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
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
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "rows": [
       {
         "quantity": 1,
         "price": 2230.0,
         "discount": 0,
         "vat": 0,
         "vatEnabled": false,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
           }
         },
         "shipped": 0,
         "inTransit": 0
       },
       {
         "quantity": 1,
         "price": 100.0,
         "discount": 10,
         "vat": 10,
         "vatEnabled": true,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
           }
         },
         "shipped": 0,
         "inTransit": 0
       },
       {
         "quantity": 2,
         "price": 500.0,
         "discount": 10,
         "vat": 18,
         "vatEnabled": true,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#good/edit?id=392c045c-2842-11e9-ac12-000a00000002"
           }
         },
         "shipped": 0,
         "inTransit": 0
       },
       {
         "quantity": 3,
         "price": 2230.0,
         "discount": 0,
         "vat": 0,
         "vatEnabled": false,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#good/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
           }
         },
         "shipped": 0,
         "inTransit": 0
       }
     ]
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "paidSum": 0,
   "shippedSum": 0,
   "invoicedSum": 0,
   "internalOrder": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/internalorder/64e426af-b0d8-11e6-8a84-bae500000064",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/internalorder/metadata",
       "type": "internalorder",
       "mediaType": "application/json"
     }
   }
}
```

> An example of a request for a Purchase Order template based on a Sales order.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "customerOrders": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/e9350b05-5751-11e8-9109-f8fc0010fba3",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
                   "type": "customerorder",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the pre-filled Purchase Order.

```json
{
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/8187b9ca-5751-11e8-9107-504800110aa3",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/816f2c7e-5751-11e8-9109-f8fc0000534e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "name": "",
   "moment": "2018-05-14 11:39:50",
   "applicable": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/819ac910-5751-11e8-9107-504800110ad2",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 10000,
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/819ab5e8-5751-11e8-9107-504800110acd",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/81995e7d-5751-11e8-9107-504800110acb",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "positions": {
     "rows": [
       {
         "quantity": 20,
         "price": 500.0,
         "discount": 0,
         "vat": 18,
         "vatEnabled": true,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/cbe0b7bc-5751-11e8-9ff4-31500010c0aa",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#good/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
           }
         },
         "shipped": 0,
         "inTransit": 0
       }
     ]
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "printed": true,
   "published": true,
   "paidSum": 0,
   "shippedSum": 0,
   "invoicedSum": 0,
   "waitSum": 0,
   "customerOrders": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/e9350b05-5751-11e8-9109-f8fc0010fba3",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
         "type": "customerorder",
         "mediaType": "application/json"
       }
     }
   ]
}

```

### Purchase Order

### Get Purchase Order

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Purchase Order id. |
 
> Request for a separate Purchase Order with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Purchase Order.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/172fb2f6-3f70-11e6-8a84-bae50000008e",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata",
     "type": "purchaseorder",
     "mediaType": "application/json"
   },
   "id": "172fb2f6-3f70-11e6-8a84-bae50000008e",
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
   "updated": "2016-07-01 12:42:13",
   "name": "00002",
   "description": "Order description",
   "externalCode": "FfSmVuSKi7h8L-jLADHV80",
   "moment": "2016-07-01 12:40:00",
   "applicable": true,
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
   "sum": 5900,
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/14ae5431-32ca-11e6-8a84-bae50000002d",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/states/11f5becd-3f70-11e6-8a84-bae50000008b",
       "type": "state",
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
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/172fb2f6-3f70-11e6-8a84-bae50000008e/positions",
       "type": "purchaseorderposition",
       "mediaType": "application/json",
       "size": 5,
       "limit": 1000,
       "offset": 0
     }
   },
   "deliveryPlannedMoment": "2016-07-15 12:40:00",
   "paidSum": 0,
   "shippedSum": 0,
   "invoicedSum": 0,
   "waitSum": 5900
}
```

### Change Purchase Order

Request to update the Purchase Order with the specified id.
In the body of the request, you can specify only those fields that need to be changed for the Purchase Order, except for those that
are marked `Read-Only` in the description of the [Purchase Order attributes](../documents/#transactions-purchase-order).
When updating the **organization** and **agent** fields, you must also update the **organizationAccount** and
**agentAccount** respectively, otherwise an error will occur.

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Purchase Order id. |

> An example of a request to update a single Purchase Order.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "updated": "2016-07-01 13:15:05",
             "name": "777",
             "description": "Typical Purchase Order, with contract, other currency",
             "code": "404",
             "externalCode": "37KNBm7Ф1gw7Zm00T5JdAt0",
             "moment": "2016-12-05 15:30:14",
             "applicable": false,
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
                 "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/1485d676-32ca-11e6-8a84-bae500000009",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                 "type": "counterparty",
                 "mediaType": "application/json"
               }
             },
             "state": null,
             "organizationAccount": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
                 "type": "account",
                 "mediaType": "application/json"
               }
             },
             "attributes": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a885b1b-3f70-11e6-8a84-bae50000009d",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "AttributeValue1"
               },
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a88619c-3f70-11e6-8a84-bae50000009e",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": 0.99
               },
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a886744-3f70-11e6-8a84-bae50000009f",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": true
               }
             ],
             "vatEnabled": true,
             "vatIncluded": false,
             "positions": [],
             "deliveryPlannedMoment": "2016-02-15 14:12:19"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Purchase Order.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/ae7fa9fb-3f74-11e6-8a84-bae500000070",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata",
     "type": "purchaseorder",
     "mediaType": "application/json"
   },
   "id": "ae7fa9fb-3f74-11e6-8a84-bae500000070",
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
   "updated": "2016-07-01 13:23:26",
   "name": "777",
   "description": "Typical Purchase Order, with contract, other currency",
   "code": "404",
   "externalCode": "37KNBm7Ф1gw7Zm00T5JdAt0",
   "moment": "2016-12-05 15:30:14",
   "applicable": false,
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/1485d676-32ca-11e6-8a84-bae500000009",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/states/11f5becd-3f70-11e6-8a84-bae50000008b",
       "type": "state",
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/1485d676-32ca-11e6-8a84-bae500000009/accounts/1485e43e-32ca-11e6-8a84-bae50000000a",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a885b1b-3f70-11e6-8a84-bae50000009d",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "6a885b1b-3f70-11e6-8a84-bae50000009d",
       "name": "AttributeName1",
       "type": "string",
       "value": "AttributeValue1"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a88619c-3f70-11e6-8a84-bae50000009e",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "6a88619c-3f70-11e6-8a84-bae50000009e",
       "name": "AttributeName2",
       "type": "double",
       "value": 0.99
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata/attributes/6a886744-3f70-11e6-8a84-bae50000009f",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "6a886744-3f70-11e6-8a84-bae50000009f",
       "name": "AttributeName3",
       "type": "boolean",
       "value": true
     }
   ],
   "vatEnabled": true,
   "vatIncluded": false,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/ae7fa9fb-3f74-11e6-8a84-bae500000070/positions",
       "type": "purchaseorderposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "deliveryPlannedMoment": "2016-02-15 14:12:19",
   "paidSum": 0,
   "shippedSum": 0,
   "invoicedSum": 0,
   "waitSum": 0
}
```

### Purchase Order Items

A separate resource for managing the items of the Purchase Order. With it, you can manage the items of a larger document that has more lines than the limit on the number of lines saved with the document. This limit is 1000. You can read more about limits on the number of document lines and working with large documents [here](../#kladana-json-api-general-info-working-with-transaction-items).

### Get Purchase Order Items

Request for a list of all items of the Purchase Order.


| Title | Type | Description |
| ------- | -------- |--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the items in the Purchase Order. |

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Purchase Order id. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Purchase Order Items

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/purchaseOrder/7944ef04-f831-11e5-7a69-971500188b19/positions"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of items of an individual Purchase Order.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b19/positions/",
     "type": "purchaseorderposition",
     "mediaType": "application/json",
     "size": 5,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href":"https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b19/positions/17307520-3f70-11e6-8a84-bae50000008f",
         "type": "purchaseorderposition",
         "mediaType": "application/json"
       },
       "id": "17307520-3f70-11e6-8a84-bae50000008f",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 1,
       "price": 4300.0,
       "discount": 0,
       "vat": 0,
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/0a89c6f1-3303-11e6-8a84-bae500000cda",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
         }
       },
       "shipped": 0,
       "inTransit": 1
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b19/positions/17308a33-3f70-11e6-8a84-bae500000090",
         "type": "purchaseorderposition",
         "mediaType": "application/json"
       },
       "id": "17308a33-3f70-11e6-8a84-bae500000090",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 1,
       "price": 600.0,
       "discount": 0,
       "vat": 0,
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/0163030c-3303-11e6-8a84-bae5000004de",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=392c045c-2842-11e9-ac12-000a00000002"
         }
       },
       "shipped": 0,
       "inTransit": 1
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b19/positions/17309bf8-3f70-11e6-8a84-bae500000091",
         "type": "purchaseorderposition",
         "mediaType": "application/json"
       },
       "id": "17309bf8-3f70-11e6-8a84-bae500000091",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 1,
       "price": 0.0,
       "discount": 0,
       "vat": 0,
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/4f918196-3304-11e6-8a84-bae50001c6d2",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
         }
       },
       "shipped": 0,
       "inTransit": 1
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b19/positions/1730ac60-3f70-11e6-8a84-bae500000092",
         "type": "purchaseorderposition",
         "mediaType": "application/json"
       },
       "id": "1730ac60-3f70-11e6-8a84-bae500000092",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 1,
       "price": 0.0,
       "discount": 0,
       "vat": 0,
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/4f785efd-3304-11e6-8a84-bae50001c6c4",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
         }
       },
       "shipped": 0,
       "inTransit": 1
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b19/positions/1730bb31-3f70-11e6-8a84-bae500000093",
         "type": "purchaseorderposition",
         "mediaType": "application/json"
       },
       "id": "1730bb31-3f70-11e6-8a84-bae500000093",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 1,
       "price": 1000.0,
       "discount": 0,
       "vat": 0,
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/7b37adef-3303-11e6-8a84-bae50000bbf7",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=3c3c1618-2842-11e9-ac12-000c0000006f"
         }
       },
       "shipped": 0,
       "inTransit": 1
     }
   ]
}
```

### Purchase Order Items

Purchase Order item with the specified item ID.

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Purchase Order ID. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Purchase Order item ID. |

### Get Purchase Order Items

> Request to receive a separate item of the Purchase Order with the specified ID.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a single item of the Purchase Order.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
     "type": "purchaseorderposition",
     "mediaType": "application/json"
   },
   "id": "34f6344f-015e-11e6-9464-e4de0000006c",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "quantity": 1,
   "price": 1000.0,
   "discount": 0,
   "vat": 0,
   "vatEnabled": false,
   "assortment": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/7b37adef-3303-11e6-8a84-bae50000bbf7",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
     }
   },
   "shipped": 0,
   "inTransit": 1
}
```
### Create Purchase Order Item

Request to create a new item in the Purchase Order.
For successful creation, the following fields must be specified in the request body:

+**assortment** - Link to the product, service, batch, or product variant that the item represents. You can read more about this field in the description of the [Order item](../documents/#transactions-purchase-order-purchase-orders-purchase-order-items)
+ **quantity** - Quantity of the specified item. Must be positive, otherwise an error will occur.

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Purchase Order id. |

> An example of creating one item in the Purchase Order.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/purchaseOrder/7944ef04-f831-11e5-7a69-971500188b19/positions"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "quantity": 49,
             "price": 451.0,
             "discount": 0,
             "vat": 10,
             "assortment": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a7daa6b-3c64-11e6-8a84-bae50000000a",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                 "type": "variant",
                 "mediaType": "application/json"
               }
             },
             "shipped": 20,
             "inTransit": 19
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created item of a single Purchase Order.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b19/positions/574b6485-3f71-11e6-8a84-bae50000005b",
       "type": "purchaseorderposition",
       "mediaType": "application/json"
     },
     "id": "574b6485-3f71-11e6-8a84-bae50000005b",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 49,
     "price": 451.0,
     "discount": 0,
     "vat": 10,
     "vatEnabled": true,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a7daa6b-3c64-11e6-8a84-bae50000000a",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3c3c1618-2842-11e9-ac12-000c0000006f"
       }
     },
     "shipped": 0,
     "inTransit": 19
   }
]
```

> An example of creating several items at once in the Purchase Order.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/purchaseOrder/7944ef04-f831-11e5-7a69-971500188b19/positions"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "quantity": 12,
               "price": 300.0,
               "vat": 0,
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                   "type": "variant",
                   "mediaType": "application/json"
                 }
               },
               "inTransit": 11
             },
             {
               "quantity": 3,
               "price": 1000.0
               "discount": 0,
               "vat": 10,
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/product/7a6f697f-3c64-11e6-8a84-bae500000006",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                   "type": "product",
                   "mediaType": "application/json"
                 }
               },
               "inTransit": 1
             },
             {
               "quantity": 404,
               "price": 454.0,
               "discount": 200,
               "vat": 21,
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a83c422-3c64-11e6-8a84-bae500000012",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                   "type": "variant",
                   "mediaType": "application/json"
                 }
               },
               "inTransit": 216
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of created items of a single Purchase Order.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b19/positions/f389488d-3f71-11e6-8a84-bae50000005f",
       "type": "purchaseorderposition",
       "mediaType": "application/json"
     },
     "id": "f389488d-3f71-11e6-8a84-bae50000005f",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 12,
     "price": 300.0,
     "discount": 0,
     "vat": 0,
     "vatEnabled": false,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3c3c1618-2842-11e9-ac12-000c0000006f"
       }
     },
     "shipped": 0,
     "inTransit": 11
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b19/positions/f389521b-3f71-11e6-8a84-bae500000060",
       "type": "purchaseorderposition",
       "mediaType": "application/json"
     },
     "id": "f389521b-3f71-11e6-8a84-bae500000060",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 3,
     "price": 1000.0,
     "discount": 0,
     "vat": 10,
     "vatEnabled": true,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/7a6f697f-3c64-11e6-8a84-bae500000006",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
       }
     },
     "shipped": 0,
     "inTransit": 1
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b19/positions/f3895aa1-3f71-11e6-8a84-bae500000061",
       "type": "purchaseorderposition",
       "mediaType": "application/json"
     },
     "id": "f3895aa1-3f71-11e6-8a84-bae500000061",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 404,
     "price": 454.0,
     "discount": 200,
     "vat": 21,
     "vatEnabled": true,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a83c422-3c64-11e6-8a84-bae500000012",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
       }
     },
     "shipped": 0,
     "inTransit": 216
   }
]
```

### Change Purchase Order Items

Request to update a line item of the Order. There is no way to update the item required fields in the body of the request. Only the ones you want to update.

**Parameters**

| Parameter | Description |
| ------------ | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Purchase Order id. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Purchase Order item id. |

> An example of a request to update a line item in a Purchase Order.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "quantity": 44,
             "price": 4540.0,
             "discount": 150,
             "vat": 10,
             "assortment": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a83c422-3c64-11e6-8a84-bae500000012",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                 "type": "variant",
                 "mediaType": "application/json"
               }
             },
             "shipped": 10,
             "inTransit": 200
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Purchase Order items.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
     "type": "purchaseorderposition",
     "mediaType": "application/json"
   },
   "id": "34f6344f-015e-11e6-9464-e4de0000006c",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "quantity": 44,
   "price": 4540.0,
   "discount": 150,
   "vat": 10,
   "vatEnabled": true,
   "assortment": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a83c422-3c64-11e6-8a84-bae500000012",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
       "type": "variant",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
     }
   },
   "shipped": 0,
   "inTransit": 200
}
```

### Delete Purchase Order Items

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Purchase Order ID. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Purchase Order item ID. |
 
> Request to delete an individual Order item with the specified ID.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of the Order item.

### Bulk Deletion of Items

**Parameters**

| Parameter | Description |
| --------- | ----------- |
| **id**    | `string` (required) *Example: 3e1c03bb-684f-11ee-ac12-000c000000b0* Purchase Order ID.|

> Request for bulk deletion of Purchase Order items.

```shell
curl -X POST
  "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/delete"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
  -H "Content-Type: application/json"
  -d '[
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/7fce2da5-684d-11ee-ac12-000c000000a2",
            "type": "purchaseorderposition",
            "mediaType": "application/json"
          }
        },
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/7fce37a5-684d-11ee-ac12-000c000000a3",
            "type": "purchaseorderposition",
            "mediaType": "application/json"
          }
        }
      ]'  
```

> Response 200 (application/json)
Purchase Order items were successfully deleted. 
