## Purchase Returns

Using the JSON API, you can create and update Returns to Suppliers information, request lists of Returns to Suppliers, and information on individual Returns to Suppliers. Items of Returns to Suppliers can be managed both as part of a separate Return, and separately using special resources for managing Purchase Return items. The entity code for Purchase Returns as part of the JSON API is the **purchasereturn** keyword.

### Purchase Returns
#### Entity attributes

| Title | Type | Filtration | Description |
| ----------| --------- | -------- | ----------- |
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **agent** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Counterparty metadata<br>`+Required when replying` `+Expand` `+Required when creating` |
| **agentAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Counterparty account metadata<br>`+Expand` |
| **applicable** | Boolean | `=` `!=` | Check mark<br>`+Required when answering` |
| **attributes** | Array(Object) | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields) |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Supplier Return Code |
| **contract** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Contract metadata<br>`+Expand` |
| **created** | datetime | `=` `!=` `<` `>` `<=` `>=` | Creation date<br>`+Required when replying` `+Read only` |
| **deleted** | datetime | `=` `!=` `<` `>` `<=` `>=` | Time of last Purchase Returns deletion<br>`+Read-only` |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Comment Purchase Returns|
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | Purchase Returns External Code<br>`+Required in response` |
| **files** | MetaArray | | [Files](../dictionaries/#entities-files) array metadata (Maximum number of files - 100)<br>`+Required when replying` `+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID | `=` `!=` | Purchase Returns ID<br>`+Required for response` `+Read Only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Purchase Returns Metadata<br>`+Required in response` |
| **moment** | datetime | `=` `!=` `<` `>` `<=` `>=` | Document date<br>`+Required when replying` |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Item Returned to Supplier<br>`+Required when replying` |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Legal entity metadata<br>`+Required when replying` `+Expand` |
| **organizationAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Legal entity account metadata<br>`+Expand` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Required when replying` `+Expand` |
| **printed** | Boolean | `=` `!=` | Is the document printed<br>`+Required when responding` `+Read Only` |
| **project** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Project metadata<br>`+Expand` |
| **published** | Boolean | `=` `!=` | Is the document published<br>`+Required when replying` `+Read-only`|
| **rate** | object | | Currency. [More details here](../documents/#transactions-currency-in-transactions)<br>`+Required when replying` |
| **shared** | Boolean | `=` `!=` | Sharing<br>`+Required when replying` |
| **state** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Purchase Returns status metadata<br>`+Expand` |
| **store** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Warehouse metadata<br>`+Required when replying` `+Expand` `+Required when creating` |
| **sum** | int | `=` `!=` `<` `>` `<=` `>=` | Amount Purchase Returns in rupees<br>`+Required when replying` `+Read Only` |
| **syncId** | UUID | `=` `!=` | Synchronization ID. After filling it is not available for change |
| **updated** | datetime | `=` `!=` `<` `>` `<=` `>=` | When was last updated Purchase Returns<br>`+Required when replying` `+Read-only` |
| **vatEnabled** | Boolean | | Is VAT taken into account<br>`+Required when answering` |
| **vatIncluded** | Boolean | | Is VAT included in the price |
| **vatSum** | float | | VAT amount<br>`+Required when answering` |

#### Links to other documents

| Title | Description |
| ------------| ------------- |
| **positions** | Link to Purchase Returns items in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **supply** | Reference to the acceptance from which the return occurred in the format [Metadata](../#kladana-json-api-general-info-metadata) The field is required to return with a reason. |
| **paidSum** | The amount of incoming payments for the return to the supplier |
| **payments** | An array of links to related payments in the format [Metadata](../#kladana-json-api-general-info-metadata) |

#### Purchase Returns Items

Purchase Returns Items is a list of products, services, and product variants. The Purchase Returns item object contains the following fields:

| Title | Type | Descriptions|
| ----------| --------- |-------- |
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Read Only` |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of a product/service/series/modification, which is an item<br>`+Required when answering` `+Expand` |
| **discount** | int | The percentage of the discount or markup. The markup is indicated as a negative number, i.e. -10 will create a markup of 10%<br>`+Required when replying` |
| **id** | UUID | Item ID<br>`+Required when replying` `+Read Only` |
| **pack** | object | Product packaging. [More here](../dictionaries/#entities-product-products-nested-entity-attributes-product-packaging) |
| **price** | float | The price of the product/service in rupees<br>`+Required when answering` |
| **quantity** | int | The number of goods/services of this type in the item. If an item is a product with serial number accounting enabled, then the value in this field will always be equal to the number of serial numbers for this item in the document.<br>`+Required when replying` |
| **slot** | [Meta](../#kladana-json-api-general-info-metadata) | Cell in the warehouse. [More here](../dictionaries/#entities-warehouse-storage-bins)<br>`+Expand` |
| **things** | Array(String) | Serial numbers. The value of this attribute is ignored if the  item is not in serial accounting. Otherwise, the number of items in the item will be equal to the number of serial numbers passed in the attribute value. |
| **vat** | int | VAT applicable to the current item<br>`+Required when replying` |
| **vatEnabled** | Boolean | Whether VAT is included for the item. With this flag, you can set VAT = 0 or VAT = "excluding VAT" for an item. (vat = 0, vatEnabled = false) -> vat = "excluding VAT", (vat = 0, vatEnabled = true) -> vat = 0%.<br>`+Required when replying` |

The value of this attribute is ignored if the item is not in serial accounting.
Otherwise, the number of items in the item will be equal to the number of serial numbers passed in the attribute value.

You can work with items using special [resources for managing Purchase Returns items](../documents/#transactions-purchase-order-purchase-orders-purchase-order-items), and as part of a separate Purchase Returns. When operating as part of a separate Purchase Returns,
you can send requests to create a separate Purchase Returns with included in the request body
an array of items Returned to the supplier. 

If the number of items exceeds the maximum allowed, then for
further replenishment of items, you will need to work with a special resource "Purchase Return Items".
Also, when working as part of a separate Purchase Returns, you can send requests to update the list of items
with m included in the request bodyan array of Purchase Returns items. 

It is important to remember that the collection of items will
be treated as "all items Returned to the supplier" and will completely replace the existing collection when updating the object. Superfluous items will be deleted, new ones added, existing ones changed.

About working with You can read the Purchase Returns fields [here](../#kladana-json-api-general-info-additional-fields)

### Get Returns to Suppliers

Request all Returns to suppliers on this account.
Result: JSON object including fields:

| Title | Type | Description |
| ----------| --------- |------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Returns to Suppliers. |

**Parameters**

| Parameter | Description |
| ----------| --------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Supplier Refunds

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/purchasereturn"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Returns to Suppliers list.

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
     "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
     "type": "purchase return",
     "mediaType": "application/json",
     size: 4
     limit: 1000
     offset: 0
   },
   rows: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/b875cc8f-313f-11e6-8a84-bae500000093",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
         "type": "purchase return",
         "mediaType": "application/json"
       },
       "id": "b875cc8f-313f-11e6-8a84-bae500000093",
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
       "updated": "2016-06-13 11:20:55",
       "name": "00001",
       "externalCode": "E4l6sMtVixklOjgfK6VQt3",
       "moment": "2016-06-13 11:20:00",
       "applicable": true
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
       organization: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       store: {
         "meta": {"href": "https://app.kladana.in/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json"
         }
       },
       agent: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/faf44002-2e58-11e6-8a84-bae500000053",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
           "type": "counter party",
           "mediaType": "application/json"
         }
       },
       organizationAccount: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "vatEnabled": true
       "vatIncluded": true,
       positions: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/b875cc8f-313f-11e6-8a84-bae500000093/positions",
           "type": "purchase return position",
           "mediaType": "application/json",
           size: 1
           limit: 1000
           offset: 0
         }
       },
       supply: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/supply/b1008773-313f-11e6-8a84-bae500000089",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/supply/metadata",
           "type": "supply",
           "mediaType": "application/json"
         }
       },
       "paidSum": 0
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/d43161ea-3140-11e6-8a84-bae5000000c6",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
         "type": "purchase return",
         "mediaType": "application/json"
       },
       "id": "d43161ea-3140-11e6-8a84-bae5000000c6",
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
       "updated": "2016-06-13 11:28:34",
       "name": "00002",
       "externalCode": "-5xto6PjiGhuL8RAky-9c3",
       "moment": "2016-06-13 11:22:00",
       "applicable": true
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
       sum: 273000
       organization: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       store: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json"
         }
       },
       agent: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/faf44002-2e58-11e6-8a84-bae500000053",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
           "type": "counter party",
           "mediaType": "application/json"
         }
       },
       organizationAccount: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "vatEnabled": true
       "vatIncluded": true,
       positions: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/d43161ea-3140-11e6-8a84-bae5000000c6/positions",
           "type": "purchase return position",
           "mediaType": "application/json",
           size: 2,
           limit: 1000
           offset: 0
         }
       },
       supply: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/supply/f39a60f5-313f-11e6-8a84-bae5000000b4",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/supply/metadata",
           "type": "supply",
           "mediaType": "application/json"
         }
       },
       "paidSum": 0
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/dc194230-41bd-11e6-8a84-bae5000000a9",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
         "type": "purchase return",
         "mediaType": "application/json"
       },
       "id": "dc194230-41bd-11e6-8a84-bae5000000a9",
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
       "updated": "2016-07-04 11:03:57",
       "name": "00003",
       "externalCode": "-SmYzmhBjSFQBveIJQ6uV0",
       "moment": "2016-07-04 11:03:00",
       "applicable": true
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
       sum: 28000
       organization: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       store: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
           "type": "store",
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
       organizationAccount: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       agentAccount: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/1489a08d-32ca-11e6-8a84-bae50000000d/accounts/1489ad8d-32ca-11e6-8a84-bae50000000e",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "vatEnabled": true
       "vatIncluded": true,
       positions: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/dc194230-41bd-11e6-8a84-bae5000000a9/positions",
           "type": "purchase return position",
           "mediaType": "application/json",
           size: 7
           limit: 1000
           offset: 0
         }
       },
       supply: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/supply/ceec2ca6-41bd-11e6-8a84-bae500000097",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/supply/metadata",
           "type": "supply",
           "mediaType": "application/json"
         }
       },
       "paidSum": 0
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/e699b298-41bd-11e6-8a84-bae5000000ba",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
         "type": "purchase return",
         "mediaType": "application/json"
       },
       "id": "e699b298-41bd-11e6-8a84-bae5000000ba",
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
       "updated": "2016-07-04 11:04:15",
       "name": "00004",
       "externalCode": "tBSZzXSgggWNL5MZ7IrYE2",
       "moment": "2016-07-04 11:04:00",
       "applicable": true
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
       sum: 43156000,
       organization: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       store: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json"
         }
       },
       contract: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/contract/91287d9a-41bc-11e6-8a84-bae500000082",
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
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/14bfc067-32ca-11e6-8a84-bae50000003f",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
           "type": "counter party",
           "mediaType": "application/json"
         }
       },
       organizationAccount: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "vatEnabled": true
       "vatIncluded": true,
       positions: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/e699b298-41bd-11e6-8a84-bae5000000ba/positions",
           "type": "purchase return position",
           "mediaType": "application/json",
           size: 7
           limit: 1000
           offset: 0
         }
       },
       supply: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/supply/80d04ebc-41bd-11e6-8a84-bae500000085",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/supply/metadata",
           "type": "supply",
           "mediaType": "application/json"
         }
       },
       "paidSum": 0
     }
   ]
}
```

### Create Purchase Returns

Required fields when creating a new Purchase Returns:
+ **organization** - Link to your legal entity in the format [Metadata](../#kladana-json-api-general-info-metadata)
+ **store** - Link to the warehouse in the format [Metadata](../#kladana-json-api-general-info-metadata)
+ **supply** - Link to the acceptance from which the return occurred in the format [Metadata](../#kladana-json-api-general-info-metadata), required field only for return based on
+ **agent** - Link to the counterparty in the format [Metadata](../#kladana-json-api-general-info-metadata)
The counterparty specified in the request to create a return must match the counterparty specified in the document,
on which the refund is generated.

When creating a return:
+ When creating a return without a reason, the **supply** field does not need to be specified
+ The counterparty in the return and in the document on which it is created must match
+ Currency and legal entity in the return and in the document must also match
+ When passing the **positions** collection in the body of the request to create a return, the passed items
must match the items in the document. The difference can only be in the number of goods in the item (less than or equal to the number in the document). You cannot transfer items that are not in the document.

> An example of creating a new Purchase Returns based on an acceptance.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/purchasereturn"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "77887",
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
             "description": "Purchase Returns created via API",
             "code": "8865255398",
             "externalCode": "fruitsareawesome124",
             "moment": "2016-11-21 14:37:00",
             "applicable": true
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
             store: {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
                 "type": "store",
                 "mediaType": "application/json"
               }
             },
             "attributes": [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e124-41be-11e6-8a84-bae5000000cb",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "detail"
               },
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e7e7-41be-11e6-8a84-bae5000000cc",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 value: false
               }
             ],
             "positions": [
               {
                 quantity: 1
                 "price": 1241200.0,
                 discount: 0
                 vat: 0
                 "assortment": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/product/e6447ee7-3303-11e6-8a84-bae5000149c2",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 }
               },
               {
                 quantity: 1
                 "price": 24100.0,
                 discount: 0
                 vat: 0
                 "assortment": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/product/e8517bc4-3303-11e6-8a84-bae500014de1",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 }
               },
               {
                 quantity: 1
                 "price": 421000.0,
                 discount: 0
                 vat: 0
                 "assortment": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/service/6767bc73-3d19-11e6-8a84-bae500000002",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                     "type": "service",
                     "mediaType": "application/json"
                   }
                 }
               },
               {
                 quantity: 1
                 "price": 2421000.0,
                 discount: 0
                 vat: 0
                 "assortment": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/product/e8563cc5-3303-11e6-8a84-bae500014df0",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 }
               }
             ],
             supply: {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/supply/7585391b-41c0-11e6-8a84-bae5000000de",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/supply/metadata",
                 "type": "supply",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Purchase Returns.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/6d5371fc-41c1-11e6-8a84-bae50000001c",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
     "type": "purchase return",
     "mediaType": "application/json"
   },
   "id": "6d5371fc-41c1-11e6-8a84-bae50000001c",
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
   "updated": "2016-07-04 11:29:29",
   "name": "77887",
   "description": "Purchase Returns created via API",
   "code": "8865255398",
   "externalCode": "fruitsareawesome124",
   "moment": "2016-11-21 14:37:00",
   "applicable": true
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
   sum: 4107300,
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   store: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
       "type": "store",
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
   organizationAccount: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   agentAccount: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e124-41be-11e6-8a84-bae5000000cb",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "4fc7e124-41be-11e6-8a84-bae5000000cb",
       "name": "AttributeName1",
       "type": "boolean",
       value: false
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e7e7-41be-11e6-8a84-bae5000000cc",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "4fc7e7e7-41be-11e6-8a84-bae5000000cc",
       "name": "AttributeName2",
       "type": "text",
       "value": "detail"
     }
   ],
   "vatEnabled": true
   "vatIncluded": true,
   "created": "2007-02-07 17:16:41",
   "printed": true
   "published": true
   positions: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/6d5371fc-41c1-11e6-8a84-bae50000001c/positions",
       "type": "purchase return item",
       "mediaType": "application/json",
       size: 4
       limit: 1000
       offset: 0
     }
   },
   supply: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/supply/7585391b-41c0-11e6-8a84-bae5000000de",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/supply/metadata",
       "type": "supply",
       "mediaType": "application/json"
     }
   },
   "paidSum": 0
}
```

> An example of creating a new Purchase Returns without a reason.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/purchasereturn"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "77887",
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
             "description": "Purchase Returns created via API",
             "code": "8865255398",
             "externalCode": "fruitsareawesome124",
             "moment": "2016-11-21 14:37:00",
             "applicable": true
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
             store: {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
                 "type": "store",
                 "mediaType": "application/json"
               }
             },
             "attributes": [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e124-41be-11e6-8a84-bae5000000cb",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "detail"
               },
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e7e7-41be-11e6-8a84-bae5000000cc",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 value: false
               }
             ],
             "positions": [
               {
                 quantity: 1
                 "price": 1241200.0,
                 discount: 0
                 vat: 0
                 "assortment": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/product/e6447ee7-3303-11e6-8a84-bae5000149c2",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 }
               },
               {
                 quantity: 1
                 "price": 24100.0,
                 discount: 0
                 vat: 0
                 "assortment": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/product/e8517bc4-3303-11e6-8a84-bae500014de1",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 }
               },
               {
                 quantity: 1
                 "price": 421000.0,
                 discount: 0
                 vat: 0
                 "assortment": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/service/6767bc73-3d19-11e6-8a84-bae500000002",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                     "type": "service",
                     "mediaType": "application/json"
                   }
                 }
               },
               {
                 quantity: 1
                 "price": 2421000.0,
                 discount: 0
                 vat: 0
                 "assortment": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/product/e8563cc5-3303-11e6-8a84-bae500014df0",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Purchase Returns.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/6d5371fc-41c1-11e6-8a84-bae50000001c",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
     "type": "purchase return",
     "mediaType": "application/json"
   },
   "id": "6d5371fc-41c1-11e6-8a84-bae50000001c",
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
   "updated": "2016-07-04 11:29:29",
   "name": "77887",
   "description": "Purchase Returns created via API",
   "code": "8865255398",
   "externalCode": "fruitsareawesome124",
   "moment": "2016-11-21 14:37:00",
   "applicable": true
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
   sum: 4107300,
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   store: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
       "type": "store",
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
   organizationAccount: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   agentAccount: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e124-41be-11e6-8a84-bae5000000cb",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "4fc7e124-41be-11e6-8a84-bae5000000cb",
       "name": "AttributeName1",
       "type": "boolean",
       value: false
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e7e7-41be-11e6-8a84-bae5000000cc",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "4fc7e7e7-41be-11e6-8a84-bae5000000cc",
       "name": "AttributeName2",
       "type": "text",
       "value": "detail"
     }
   ],
   "vatEnabled": true
   "vatIncluded": true,
   "created": "2007-02-07 17:16:41",
   "printed": true
   "published": true
   positions: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/6d5371fc-41c1-11e6-8a84-bae50000001c/positions",
       "type": "purchase return item",
       "mediaType": "application/json",
       size: 4
       limit: 100
       offset: 0
     }
   },
   "paidSum": 0
}
```

### Purchase Returns Bulk creating and update

[Bulk creating and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Purchase Returns.
In the body of the request, you need to pass an array containing the JSON representation of the Returns to the provider that you want to create or update.
Updated Returns to the supplier must contain the identifier in the form of metadata.

> Example of creating and updating multiple Purchase Returns

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/purchasereturn"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "77887",
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
               "description": "Purchase Returns created via API",
               "code": "8865255398",
               "externalCode": "fruitsareawesome124",
               "moment": "2016-11-21 14:37:00",
               "applicable": true
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
               store: {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
                   "type": "store",
                   "mediaType": "application/json"
                 }
               },
               "attributes": [
                 {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e124-41be-11e6-8a84-bae5000000cb",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   "value": "detail"
                 },
                 {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e7e7-41be-11e6-8a84-bae5000000cc",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   value: false
                 }
               ],"positions": [
                 {
                   quantity: 1
                   "price": 1241200.0,
                   discount: 0
                   vat: 0
                   "assortment": {
                     "meta": {
                       "href": "https://app.kladana.in/api/remap/1.2/entity/product/e6447ee7-3303-11e6-8a84-bae5000149c2",
                       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                       "type": "product",
                       "mediaType": "application/json"
                     }
                   }
                 },
                 {
                   quantity: 1
                   "price": 24100.0,
                   discount: 0
                   vat: 0
                   "assortment": {
                     "meta": {
                       "href": "https://app.kladana.in/api/remap/1.2/entity/product/e8517bc4-3303-11e6-8a84-bae500014de1",
                       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                       "type": "product",
                       "mediaType": "application/json"
                     }
                   }
                 },
                 {
                   quantity: 1
                   "price": 421000.0,
                   discount: 0
                   vat: 0
                   "assortment": {
                     "meta": {
                       "href": "https://app.kladana.in/api/remap/1.2/entity/service/6767bc73-3d19-11e6-8a84-bae500000002",
                       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                       "type": "service",
                       "mediaType": "application/json"
                     }
                   }
                 },
                 {
                   quantity: 1
                   "price": 2421000.0,
                   discount: 0
                   vat: 0
                   "assortment": {
                     "meta": {
                       "href": "https://app.kladana.in/api/remap/1.2/entity/product/e8563cc5-3303-11e6-8a84-bae500014df0",
                       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                       "type": "product",
                       "mediaType": "application/json"
                     }
                   }
                 }
               ],
               supply: {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/supply/7585391b-41c0-11e6-8a84-bae5000000de",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/supply/metadata",
                   "type": "supply",
                   "mediaType": "application/json"
                 }
               }
             },
             {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/6d5371fc-41c1-11e6-8a84-bae50000001c",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
                 "type": "purchase return",
                 "mediaType": "application/json"
               },
               "name": "763457",
               "owner": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/employee/1205364b-7f01-455a-a1b5-4ba0988c8308",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
                   "type": "employee",
                   "mediaType": "application/json"
                 }
               },
               shared: true
               group: {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/group/348d910b-6dc0-483f-b916-2237bc54a04e",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
                   "type": "group",
                   "mediaType": "application/json"
                 }
               },
               "description": "Purchase Returns created and updated via API",
               "code": "8865255398",
               "externalCode": "fruitsareawesome!!!",
               "moment": "2016-11-21 14:27:00",
               "applicable": false
               state: {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/states/69e39d04-41be-11e6-8a84-bae5000000d2",
                   "type": "state",
                   "mediaType": "application/json"
                 }
               },
               "attributes": [
                 {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e124-41be-11e6-8a84-bae5000000cb",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   "value": true
                 }
               ],"positions": [
                 {
                   quantity: 1
                   "price": 1241200.0,
                   discount: 0
                   vat: 0
                   "assortment": {
                     "meta": {
                       "href": "https://app.kladana.in/api/remap/1.2/entity/product/e6447ee7-3303-11e6-8a84-bae5000149c2",
                       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                       "type": "product",
                       "mediaType": "application/json"
                     }
                   }
                 },
                 {
                   quantity: 1
                   "price": 24100.0,
                   discount: 0
                   vat: 0
                   "assortment": {
                     "meta": {
                       "href": "https://app.kladana.in/api/remap/1.2/entity/product/e8517bc4-3303-11e6-8a84-bae500014de1",
                       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                       "type": "product",
                       "mediaType": "application/json"
                     }
                   }
                 },
                 {
                   quantity: 1
                   "price": 421000.0,
                   discount: 0
                   vat: 0
                   "assortment": {
                     "meta": {
                       "href": "https://app.kladana.in/api/remap/1.2/entity/service/6767bc73-3d19-11e6-8a84-bae500000002",
                       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                       "type": "service",
                       "mediaType": "application/json"
                     }
                   }
                 },
                 {
                   quantity: 1
                   "price": 2421000.0,
                   discount: 0
                   vat: 0
                   "assortment": {
                     "meta": {
                       "href": "https://app.kladana.in/api/remap/1.2/entity/product/e8563cc5-3303-11e6-8a84-bae500014df0",
                       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                       "type": "product",
                       "mediaType": "application/json"
                     }
                   }
                 },
                 {
                   quantity: 1
                   "price": 263000.0,
                   discount: 0
                   vat: 0
                   "assortment": {
                     "meta": {
                       "href": "https://app.kladana.in/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
                       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                       "type": "product",
                       "mediaType": "application/json"
                     }
                   }
                 }
               ]
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the generated and updated Purchase Returns.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/6d5371fc-41c1-11e6-8a84-bae50000001c",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
       "type": "purchase return",
       "mediaType": "application/json"
     },
     "id": "6d5371fc-41c1-11e6-8a84-bae50000001c",
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
     "updated": "2016-07-04 11:29:29",
     "name": "77887",
     "description": "Purchase Returns created via API",
     "code": "8865255398",
     "externalCode": "fruitsareawesome124",
     "moment": "2016-11-21 14:37:00",
     "applicable": true
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
     sum: 4107300,
     organization: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     store: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
         "type": "store",
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
     organizationAccount: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     agentAccount: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "attributes": [
       {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e124-41be-11e6-8a84-bae5000000cb",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "4fc7e124-41be-11e6-8a84-bae5000000cb",
         "name": "AttributeName1",
         "type": "boolean",
         value: false
       },
       {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e7e7-41be-11e6-8a84-bae5000000cc",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "4fc7e7e7-41be-11e6-8a84-bae5000000cc",
         "name": "AttributeName2",
         "type": "text",
         "value": "detail"
       }
     ],
     "vatEnabled": true
     "vatIncluded": true,
     "created": "2007-02-07 17:16:41",
     "printed": true
     "published": true
     positions: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/6d5371fc-41c1-11e6-8a84-bae50000001c/positions",
         "type": "purchase return item",
         "mediaType": "application/json",
         size: 4
         limit: 1000
         offset: 0
       }
     },
     supply: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/supply/7585391b-41c0-11e6-8a84-bae5000000de",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/supply/metadata",
         "type": "supply",
         "mediaType": "application/json"
       }
     },
     "paidSum": 0
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/6d5371fc-41c1-11e6-8a84-bae50000001c",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
       "type": "purchase return",
       "mediaType": "application/json"
     },
     "id": "6d5371fc-41c1-11e6-8a84-bae50000001c",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/1205364b-7f01-455a-a1b5-4ba0988c8308",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     shared: true
     group: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/348d910b-6dc0-483f-b916-2237bc54a04e",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-07-04 11:35:26",
     "name": "763457",
     "description": "Purchase Returns created and updated via API",
     "code": "8865255398",
     "externalCode": "fruitsareawesome!!!",
     "moment": "2016-11-21 14:27:00",
     "applicable": false
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
     sum: 4370300,
     organization: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },store: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
         "type": "store",
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
     state: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/states/69e39d04-41be-11e6-8a84-bae5000000d2",
         "type": "state",
         "mediaType": "application/json"
       }
     },
     organizationAccount: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     agentAccount: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "attributes": [
       {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e124-41be-11e6-8a84-bae5000000cb",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "4fc7e124-41be-11e6-8a84-bae5000000cb",
         "name": "AttributeName1",
         "type": "boolean",
         "value": true
       },
       {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e7e7-41be-11e6-8a84-bae5000000cc",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "4fc7e7e7-41be-11e6-8a84-bae5000000cc",
         "name": "AttributeName2",
         "type": "text",
         "value": "detail"
       }
     ],
     "vatEnabled": true
     "vatIncluded": true,
     "created": "2007-02-07 17:16:41",
     "printed": true
     "published": true
     positions: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/6d5371fc-41c1-11e6-8a84-bae50000001c/positions",
         "type": "purchase return item",
         "mediaType": "application/json",
         size: 5
         limit: 1000
         offset: 0
       }
     },
     supply: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/supply/7585391b-41c0-11e6-8a84-bae5000000de",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/supply/metadata",
         "type": "supply",
         "mediaType": "application/json"
       }
     },
     "paidSum": 0
   }
]
```

### Delete Purchase Returns

**Parameters**

| Parameter | Description |
| ----------| --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Purchase Returns id |
 
> Request to remove the Return to the supplier with the specified id.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of Purchase Returns.

### Bulk deletion of Purchase Returns

In the body of the request, you need to pass an array containing JSON metadata of the Returns to providers that you want to remove.


> Bulk delete request for Purchase Returns.

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d'[
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b1",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
             "type": "purchase return",
             "mediaType": "application/json"
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b2",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
             "type": "purchase return",
             "mediaType": "application/json"
         }
       ]'
```

> Successful request. The result is JSON information about the removal of Returns to suppliers.

```json
[
   {
     "info":"Entity 'purchasereturn' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 success has been removed"
   },
   {
     "info":"Entity 'purchasereturn' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Purchase Returns Metadata
#### Purchase Returns Metadata

Request to get Purchase Returns metadata. The result is a JSON object including:

| Parameter | Description |
| ----------| --------- |
| **meta** | Link to Returns to Supplier metadata |
| **attributes** | Array of objects additional fields of Purchase Returns in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **states** | Array of Returns to Suppliers statuses |
| **createShared** | create new Purchase Returns labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Metadata of Returns to Suppliers

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional fields Purchase Returns.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e124-41be-11e6-8a84-bae5000000cb",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "4fc7e124-41be-11e6-8a84-bae5000000cb",
       "name": "AttributeName1",
       "type": "boolean",
       "required": false
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e7e7-41be-11e6-8a84-bae5000000cc",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "4fc7e7e7-41be-11e6-8a84-bae5000000cc",
       "name": "AttributeName2",
       "type": "text",
       "required": false
     }
   ],
   "states": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/states/69e394ff-41be-11e6-8a84-bae5000000d0",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "69e394ff-41be-11e6-8a84-bae5000000d0",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Designed",
       "color": 9245744,
       "stateType": "Regular",
       "entityType": "purchasereturn"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/states/69e39958-41be-11e6-8a84-bae5000000d1",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "69e39958-41be-11e6-8a84-bae5000000d1",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Partially produced",
       "color": 4354177,
       "stateType": "Regular",
       "entityType": "purchasereturn"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/states/69e39d04-41be-11e6-8a84-bae5000000d2",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "69e39d04-41be-11e6-8a84-bae5000000d2",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Produced",
       "color": 8825440,
       "stateType": "Regular",
       "entityType": "purchasereturn"
     }
   ],
   "createShared": false
}
```

### Separate additional field

**Parameters**

| Parameter | Description |
| ----------| --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id fields. |
 
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e7e7-41be-11e6-8a84-bae5000000cc",
     "type": "attribute metadata",
     "mediaType": "application/json"
   },
   "id": "4fc7e7e7-41be-11e6-8a84-bae5000000cc",
   "name": "AttributeName1",
   "type": "text",
   "required": false
}
```

### Purchase Returns Template
#### Purchase Returns Template

A request to receive a Purchase Returns template pre-populated with default values without being associated with any document.

> Create a Purchase Returns template with an empty request body

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d''
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a prefilled Purchase Returns.

```json
{
   "applicable": false
   sum: 0
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   store: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "created": "2007-02-07 17:16:41",
   "printed": true
   "published": true
   positions: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2",
       "type": "purchase return item",
       "mediaType": "application/json",
       size: 0
       limit: 1000
       offset: 0
     },
     rows: []
   },
   "vatEnabled": true
   "vatIncluded": true,
   "paidSum": 0
}
```

### Purchase Returns template

Request for a pre-filled Purchase Returns template based on the submitted acceptance.
The response to the request will return a pre-filled Purchase Returns template, which
can then be used to create a new return using a POST request.

> Sample request to create a Purchase Returns template based on acceptance.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             supply: {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/supply/373d2925-4a98-11e6-8a84-bae500000069",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/supply/metadata",
                 "type": "supply",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a prefilled Purchase Returns.

```json
{
   "applicable": false
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
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/1485d676-32ca-11e6-8a84-bae500000009",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   store: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   agent: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   organizationAccount: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   agentAccount: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/1485d676-32ca-11e6-8a84-bae500000009/accounts/1485e43e-32ca-11e6-8a84-bae50000000a",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2007-02-07 17:16:41",
   "printed": true
   "published": true
   positions: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2",
       "type": "purchase return item",
       "mediaType": "application/json",
       size: 0
       limit: 1000
       offset: 0
     },
     rows:[]
   },
   "vatEnabled": true
   "vatIncluded": true,
   supply: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/supply/373d2925-4a98-11e6-8a84-bae500000069",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/supply/metadata",
       "type": "supply",
       "mediaType": "application/json"
     }
   },
   "paidSum": 0
}
```

### Receive Purchase Returns

**Parameters**

| Parameter | Description |
| ----------| --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Purchase Returns id. |
 
> Request for a separate Return to the supplier with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Return to the provider with the specified id.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/e699b298-41bd-11e6-8a84-bae5000000ba",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
     "type": "purchase return",
     "mediaType": "application/json"
   },
   "id": "e699b298-41bd-11e6-8a84-bae5000000ba",
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
   "updated": "2016-07-04 11:04:15",
   "name": "00004",
   "externalCode": "tBSZzXSgggWNL5MZ7IrYE2",
   "moment": "2016-07-04 11:04:00",
   "applicable": true
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
   sum: 43156000,
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   store: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   contract: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/contract/91287d9a-41bc-11e6-8a84-bae500000082",
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
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/14bfc067-32ca-11e6-8a84-bae50000003f",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   organizationAccount: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "vatEnabled": true
   "vatIncluded": true,
   positions: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/e699b298-41bd-11e6-8a84-bae5000000ba/positions",
       "type": "purchase return item",
       "mediaType": "application/json",
       size: 7
       limit: 1000
       offset: 0
     }
   },
   supply: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/supply/80d04ebc-41bd-11e6-8a84-bae500000085",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/supply/metadata",
       "type": "supply",
       "mediaType": "application/json"
     }
   },
   "paidSum": 0
}
```

### Change Purchase Returns

Request to update Return to the supplier with the specified id.
In the body of the request, you can specify only those fields that need to be changed in the Purchase Returns, except for those that
are marked `Read Only` in the description of [Purchase Return Attributes](../documents/#transactions-purchase-returns).
When updating the **organization** and **agent** fields, you must also update the **organizationAccount** and
**agentAccount** respectively, otherwise an error will occur.
The counterparty must match the counterparty specified in the document for which the refund is generated.

When updating return:

+ The following fields cannot be changed: **agentAccount**, **agent**, **supply**
+ You can not set a currency other than the currency in the document
+ You cannot add items that are not among the items in the document.

**Parameters**

| Parameter | Description |
| ----------| --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Purchase Returns id. |

> Example of a Purchase Return update request.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "763457",
             "owner": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/employee/1205364b-7f01-455a-a1b5-4ba0988c8308",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
                 "type": "employee",
                 "mediaType": "application/json"
               }
             },
             shared: true
             group: {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/group/348d910b-6dc0-483f-b916-2237bc54a04e",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
                 "type": "group",
                 "mediaType": "application/json"
               }
             },
             "description": "Purchase Return created and updated via API",
             "code": "8865255398",
             "externalCode": "fruitsareawesome!!!",
             "moment": "2016-11-21 14:27:00",
             "applicable": false
             state: {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/states/69e39d04-41be-11e6-8a84-bae5000000d2",
                 "type": "state",
                 "mediaType": "application/json"
               }
             },
             "attributes": [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e124-41be-11e6-8a84-bae5000000cb",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": true
               }
             ],
             "positions": [
               {
                 quantity: 1
                 "price": 1241200.0,
                 discount: 0
                 vat: 0
                 "assortment": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/product/e6447ee7-3303-11e6-8a84-bae5000149c2",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 }
               },
               {
                 quantity: 1
                 "price": 24100.0,
                 discount: 0
                 vat: 0
                 "assortment": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/product/e8517bc4-3303-11e6-8a84-bae500014de1",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 }
               },
               {
                 quantity: 1
                 "price": 421000.0,
                 discount: 0
                 vat: 0
                 "assortment": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/service/6767bc73-3d19-11e6-8a84-bae500000002",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                     "type": "service",
                     "mediaType": "application/json"
                   }
                 }
               },
               {
                 quantity: 1
                 "price": 2421000.0,
                 discount: 0
                 vat: 0
                 "assortment": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/product/e8563cc5-3303-11e6-8a84-bae500014df0",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 }
               },
               {
                 quantity: 1
                 "price": 263000.0,
                 discount: 0
                 vat: 0
                 "assortment": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Purchase Returns.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/6d5371fc-41c1-11e6-8a84-bae50000001c",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata",
     "type": "purchase return",
     "mediaType": "application/json"
   },
   "id": "6d5371fc-41c1-11e6-8a84-bae50000001c",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/1205364b-7f01-455a-a1b5-4ba0988c8308",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   shared: true
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/348d910b-6dc0-483f-b916-2237bc54a04e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-07-04 11:35:26",
   "name": "763457",
   "description": "Purchase Return created and updated via API",
   "code": "8865255398",
   "externalCode": "fruitsareawesome!!!",
   "moment": "2016-11-21 14:27:00",
   "applicable": false
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
   sum: 4370300,
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   store: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
       "type": "store",
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
   state: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/states/69e39d04-41be-11e6-8a84-bae5000000d2",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   organizationAccount: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e/accounts/fae39d66-2e58-11e6-8a84-bae50000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   agentAccount: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e124-41be-11e6-8a84-bae5000000cb",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "4fc7e124-41be-11e6-8a84-bae5000000cb",
       "name": "AttributeName1",
       "type": "boolean",
       "value": true
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/metadata/attributes/4fc7e7e7-41be-11e6-8a84-bae5000000cc",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "4fc7e7e7-41be-11e6-8a84-bae5000000cc",
       "name": "AttributeName1",
       "type": "text",
       "value": "detail"
     }
   ],
   "vatEnabled": true
   "vatIncluded": true,
   "created": "2007-02-07 17:16:41",
   "printed": true
   "published": true
   positions: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/6d5371fc-41c1-11e6-8a84-bae50000001c/positions",
       "type": "purchase return item",
       "mediaType": "application/json",
       size: 5
       limit: 1000
       offset: 0
     }
   },
   supply: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/supply/7585391b-41c0-11e6-8a84-bae5000000de",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/supply/metadata",
       "type": "supply",
       "mediaType": "application/json"
     }
   },
   "paidSum": 0
}
```

### Purchase Return Items

Separate resource for managing Purchase Return items. With it, you can manage the items of a larger document that has more lines than the limit on the number of lines saved with the document. This limit is 1000. You can read more about limits on the number of document lines and working with large documents [here](../#kladana-json-api-general-info-working-with-transaction-items).

### Get items

Request for a list of all items of the Purchase Return.

| Title | Type | Description |
| ----------| ----- | ---- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Purchase Return items. |

**Parameters**

| Parameter | Description |
| ----------| --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Purchase Return id. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get items

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19/positions"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of Purchase Return items.

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
     "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19/positions",
     "type": "purchase return item",
     "mediaType": "application/json",
     size: 7
     limit: 1000
     offset: 0
   },
   rows: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19/positions/e699bc75-41bd-11e6-8a84-bae5000000bb",
         "type": "purchase return item",
         "mediaType": "application/json"
       },
       "id": "e699bc75-41bd-11e6-8a84-bae5000000bb",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 40,
       "price": 34400.0,
       discount: 0
       vat: 0
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/a69fe5c3-3303-11e6-8a84-bae50000dfab",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
         }
       }
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19/positions/e699c2b5-41bd-11e6-8a84-bae5000000bc",
         "type": "purchase return item",
         "mediaType": "application/json"
       },
       "id": "e699c2b5-41bd-11e6-8a84-bae5000000bc",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 52,
       "price": 556000.0,
       discount: 0
       vat: 0
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/0464a192-3304-11e6-8a84-bae500017f51",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
         }
       }
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19/positions/e699c804-41bd-11e6-8a84-bae5000000bd",
         "type": "purchase return item",
         "mediaType": "application/json"
       },
       "id": "e699c804-41bd-11e6-8a84-bae5000000bd",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 32,
       "price": 200000.0
       discount: 0
       vat: 0
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/044e812a-3304-11e6-8a84-bae500017f34",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#good/edit?id=392c045c-2842-11e9-ac12-000a00000002"
         }
       }
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19/positions/e699cd72-41bd-11e6-8a84-bae5000000be",
         "type": "purchase return item",
         "mediaType": "application/json"
       },
       "id": "e699cd72-41bd-11e6-8a84-bae5000000be",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 112,
       "price": 34000.0,
       discount: 0
       vat: 0
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/048b1a8b-3304-11e6-8a84-bae500017f84",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#good/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
         }
       }
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19/positions/e699d288-41bd-11e6-8a84-bae5000000bf",
         "type": "purchase return item",
         "mediaType": "application/json"
       },
       "id": "e699d288-41bd-11e6-8a84-bae5000000bf",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 76,
       "price": 35000.0,
       discount: 0
       vat: 0
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/27eba7b5-3303-11e6-8a84-bae500002b72",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#good/edit?id=3bad99f1-2842-11e9-ac12-000c0000005c"
         }
       }
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19/positions/e699d76d-41bd-11e6-8a84-bae5000000c0",
         "type": "purchase return item",
         "mediaType": "application/json"
       },
       "id": "e699d76d-41bd-11e6-8a84-bae5000000c0",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 6000,
       price: 0.0
       discount: 0
       vat: 0
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/130a02d7-3303-11e6-8a84-bae500001887",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#good/edit?id=3c3c1618-2842-11e9-ac12-000c0000006f"
         }
       }
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19/positions/e699dcb4-41bd-11e6-8a84-bae5000000c1",
         "type": "purchase return item",
         "mediaType": "application/json"
       },
       "id": "e699dcb4-41bd-11e6-8a84-bae5000000c1",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       quantity:75,
       price: 0.0
       discount: 0
       vat: 0
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/3b9a7d0c-2842-11e9-ac12-000c0000005a",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#good/edit?id=0475cacb-3303-11e6-8a84-bae500000765"
         }
       }
     }
   ]
}

```

### Create item

Request to create a new item in Purchase Returns.
For successful creation, the following fields must be specified in the request body:

+ **assortment** - Link to the product/service/series/modification that the item represents.
You can also specify a field named **service**, **variant** according to the indicated item. You can read more about this field in the description of the [Purchase Return item](../documents/#transactions-purchase-order-purchase-orders-purchase-order-items).

+ **quantity** - Quantity of the specified item. Must be positive, otherwise an error will occur.
You can create one or more Purchase Returns items at the same time. All items created by this request
will be added to the existing ones.
You cannot create items that are different from the items in the document for which the return is being created. Permissible only
difference in **quantity** items (the quantity in the item in the return can be less than or equal to the quantity in the item in the document).

**Parameters**

| Parameter | Description |
| ----------| --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Purchase Return id. |

> An example of a request to create items in the Purchase Returns.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19/positions"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               quantity: 1
               "price": 263000.0,
               discount: 0
               vat: 0
               "assortment": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                   "type": "product",
                   "mediaType": "application/json"
                 }
               }
             },
             {
               quantity: 1
               "price": 10000.0
               discount: 0
               vat: 0
               "assortment": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/product/0744d71b-2e59-11e6-8a84-bae50000007f",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                   "type": "product",
                   "mediaType": "application/json"
                 }
               }
             }
           ]
'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created items.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19/positions/9cfa8b56-41bf-11e6-8a84-bae500000014",
       "type": "purchase return item",
       "mediaType": "application/json"
     },
     "id": "9cfa8b56-41bf-11e6-8a84-bae500000014",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     quantity: 1
     "price": 263000.0,
     discount: 0
     vat: 0
     "vatEnabled": false,
     "assortment": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
       }
     }
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19/positions/9cfa9b0e-41bf-11e6-8a84-bae500000015",
       "type": "purchase return item",
       "mediaType": "application/json"
     },
     "id": "9cfa9b0e-41bf-11e6-8a84-bae500000015",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     quantity: 1
     "price": 10000.0
     discount: 0
     vat: 0
     "vatEnabled": false,
     "assortment": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/0744d71b-2e59-11e6-8a84-bae50000007f",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
       }
     }
   }
]

```

### Purchase Return Item
 
### Get Purchase Return Item

**Parameters**

| Parameter | Description |
| ----------| --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Purchase Return id. |
| **positionIDv** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Purchase Returns item id. |
 
> Request to receive a single item Returned to the supplier with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a Purchase Returns line item.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
     "type": "purchase return item",
     "mediaType": "application/json"
   },
   "id": "34f6344f-015e-11e6-9464-e4de0000006c",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "quantity": 76,
   "price": 35000.0,
   discount: 0
   vat: 0
   "vatEnabled": false,
   "assortment": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/product/27eba7b5-3303-11e6-8a84-bae500002b72",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
     }
   }
}

```

### Change Purchase Return Item

Request to update a Purchase Return line item.
When you update a line item in a return, you can only change the quantity of that line item.
Moreover, this number must be within , where n is the number of this item in the document for which the return is created.

**Parameters**

| Parameter | Description |
| ----------| --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Purchase Return id. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Purchase Returns item id. |

> An example of a request to update a line item in Purchase Returns.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "quantity": 6754
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Purchase Returns item.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
     "type": "purchase return item",
     "mediaType": "application/json"
   },
   "id": "34f6344f-015e-11e6-9464-e4de0000006c",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "quantity": 6754,
   price: 0.0
   discount: 0
   vat: 0
   "vatEnabled": false,
   "assortment": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/product/130a02d7-3303-11e6-8a84-bae500001887",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
     }
   }
}
```

### Delete Purchase Return Item

**Parameters**

| Parameter | Description |
| ----------| --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Purchase Returns id. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Purchase Returns item id. |
 
> Request to delete a single item Returned to the supplier with the specified id.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/purchasereturn/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
   -H "Authorization: Basic <Credentials>"
```

> Response200 (application/json)
Successful deletion of the Purchase Returns item.
