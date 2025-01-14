## Receiving

Using the JSON API, you can create and update information about Receivings, query lists of Receives, and information on individual Receivings. Receiving items can be managed both as part of a separate Receiving, and separately - using special resources for managing Receiving items. The entity code for Accept as part of the JSON API is the **supply** keyword. Learm nore about [Receivings](https://kladana.zendesk.com/hc/en-us/articles/360012281717-Create-Receivings).

### Receivings
#### Entity attributes

| Title    | Type   | Filtration | Description |
| -------- | ------ | ---------- | ----------- |
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **agent** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Counterparty metadata<br>`+Required when replying` `+Expand` `+Required when creating` `+Change-handler` `+Update-provider` |
| **agentAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Counterparty account metadata<br>`+Expand` `+Change-handler` `+Update-provider` |
| **applicable** | Boolean | `=` `!=` | Postmark<br>`+Required when replying` `+Change-handler` `+Update-provider` |
| **attributes** | Array(Object) | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields)<br>`+Change-handler` `+Update-provider` |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Receiving Code |
| **contract** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Contract metadata<br>`+Expand` `+Change-handler` `+Update-provider` |
| **created** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Creation date<br>`+Required for response` `+Read-only` `+Change-handler` |
| **deleted** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Time when Receiving was last deleted<br>`+Read Only`|
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Receiving Comment<br>`+Change-handler` `+Update-provider` |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | External Receiving Code<br>`+Required in response` `+Change-handler` |
| **files** | MetaArray | | [Files](../dictionaries/#entities-files) array metadata (Maximum number of files - 100)<br>`+Required when replying` `+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID | `=` `!=` | Receive ID<br>`+Required for response` `+Read-only` `+Change-handler` |
| **incomingDate** | DateTime | | Incoming date<br>`+Change-handler` `+Update-provider` |
| **incomingNumber** | String(255) | | Incoming number<br>`+Change-handler` `+Update-provider` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Receiving Metadata<br>`+Required in response` `+Change-handler` |
| **moment** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Document date<br>`+Required for response` `+Change-handler` `+Update-provider` |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Name of Receiving<br>`+Required for response` `+Change-handler` `+Update-provider` |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Legal entity metadata<br>`+Required when responding` `+Expand` `+Required when creating` `+Change-handler` `+Update-provider` |
| **organizationAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Legal entity account metadata<br>`+Expand` `+Change-handler` `+Update-provider`|
| **overhead** | Object | | Overhead expenses. [Learn more](../documents/#transactions-receiving-receivings-overhead). If no Receiving Items are set, then Write-offs cannot be set<br>`+Update-provider` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Expand` |
| **paidSum** | Float | | Amount of incoming payments on Receiving<br>`+Required when replying` `+Read only` |
| **positions** | MetaArray | | Receiving item metadata<br>`+Required in response` `+Expand` `+Change-handler` `+Update-provider` |
| **printed** | Boolean | `=` `!=` | Is the document printed<br>`+Required when responding` `+Read Only` |
| **project** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Project metadata<br>`+Expand` `+Change-handler` `+Update-provider` |
| **published** | Boolean | `=` `!=` | Is the document published<br>`+Required when replying` `+Read Only` |
| **rate** | Object | | Currency. [Learn more](../documents/#transactions-currency-in-transactions)<br>`+Required when replying` `+Change-handler` `+Update-provider` |
| **shared** | Boolean | `=` `!=` | Sharing<br>`+Required when replying` |
| **state** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Receiving Status Metadata<br>`+Expand` `+Change-handler` `+Update-provider` |
| **store** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Warehouse metadata<br>`+Required when responding` `+Expand` `+Required when creating` `+Change-handler` `+Update-provider` |
| **sum** | Int | `=` `!=` `<` `>` `<=` `>=` | Receiving amount in paise<br>`+Required when replying` `+Read-only` `+Change-handler`|
| **syncId** | UUID | `=` `!=` | Synchronization ID. After filling it is not available for change |
| **updated** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Receiving last updated time<br>`+Required for response` `+Read-only` `+Change-handler` |
| **vatEnabled** | Boolean | | Is VAT taken into account<br>`+Required when replying` `+Change-handler` `+Update-provider` |
| **vatIncluded** | Boolean | | Is VAT included in the price<br>`+Change-handler` `+Update-provider` |
| **vatSum** | Float | | VAT amount<br>`+Required when replying` `+Read-only` `+Change-handler` |

#### Overhead expenses
Description of overhead expenses fields

| Title | Type | Description |
| ---------------- | --- | ------ |
| **sum** | Int | Amount in paise<br>`+Required when replying` `+Update-provider` |
| **distribution** | Enum | Overhead expenses allocation `[weight, volume, price]` -> `[by weight, by volume, by price]`<br>`+Required when replying` `+Update-provider`|

#### Links to other documents

| Title | Description |
| -------- | --------|
| **purchaseOrder** | Link to the related order to the supplier in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **invoicesIn** | An array of links to related supplier accounts in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **payments** | An array of links to related payments in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **returns** | An array of links to related returns in the format [Metadata](../#kladana-json-api-general-info-metadata) |

#### Receiving Items
Receiving Items is a list of goods/services/product variants/batches.
The Receiving item object contains the following fields:

| Title    | Type    | Description |
| -------- | ------- |------------ |
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the product/service/batch/product variant, which is an item<br>`+Required when replying` `+Expand` `+Change-handler` `+Update-provider`|
| **country** | [Meta](../#kladana-json-api-general-info-metadata) | Country metadata<br>`+Expand` |
| **discount** | Int                                                | The percentage of the discount or markup. The markup is indicated as a negative number, i.e. -10 will create a markup of 10%<br>`+Required when replying` `+Change-handler` `+Update-provider` |
| **id** | UUID                                               | Item ID<br>`+Required for response` `+Read-only` `+Change-handler` |
| **pack** | Object                                             | Product packaging. [Learn more](../dictionaries/#entities-product-products-nested-entity-attributes-product-packaging)<br>`+Change-handler` `+Update-provider` |
| **price** | Float                                              | Price of products/services in paise<br>`+Required when replying` `+Change-handler` `+Update-provider` |
| **quantity** | Float                                                | The number of products/services of this type in the item. If the item is a product that has tracking by serial numbers enabled, then the value in this field will always be equal to the number of serial numbers for this item in the transaction.<br>`+Required when replying` `+Change-handler` `+Update-provider ` |
| **slot** | [Meta](../#kladana-json-api-general-info-metadata) | Bin in the warehouse. [Learn more](../dictionaries/#entities-warehouse-warehouse-bins)<br>`+Expand` |
| **things** | Array(String)                                      | Serial numbers. The value of this attribute is ignored if the item item is not in serial accounting. Otherwise, the number of items in the item will be equal to the number of serial numbers passed in the attribute value. |
| **trackingCodes** | Array(Object)                                      | Codes for marking goods and transport packages. [Learn more](../documents/#transactions-receiving-receivings-codes-for-marking-goods-and-transport-packages) |
| **overhead** | Int                                                | Overhead expenses. [Learn more](../documents/#transactions-stock-adjustment-stock-adjustment-overhead-expenses). If no Receiving Items are set, Write-offs cannot be set.<br>`+Required in response` `+Read Only` |
| **vat** | Boolean                                            | VAT applicable to the current item<br>`+Required when replying` `+Change-handler` `+Update-provider` |
| **vatEnabled** | Boolean                                            | Whether VAT is included for the item. With this flag, you can set VAT = 0 or VAT = "excluding VAT" for an item. (vat = 0, vatEnabled = false) -> vat = "without VAT", (vat = 0, vatEnabled = true) -> vat = 0%.<br>`+Required when replying` `+Change-handler` ` +Update-provider` |

Items can be managed using [special resources for managing Receiving items](../documents/#transactions-receiving-receivings-receiving-items),
and also as part of a separate Receiving. When working as part of a separate Receiving,
you can send requests to create a separate Receiving with included in the request body
an array of Receiving items. 

If the number of items exceeds the maximum allowed, then for
further replenishment of items, you will need to work with a special resource "Receiving items".
Also, when working as part of a separate Receiving, you can send requests to update the list of items
with an array of Receiving items included in the request body. 

It is important to remember that the collection of items will
be perceived as "all items of Receiving" and will completely replace the existingcollection when updating an object - redundant
items will be deleted, new ones added, existing ones changed.

About working with Receiving fields can be read [here](../#kladana-json-api-general-info-additional-fields).

#### Codes for marking goods and transport packages

Supported as a hierarchical JSON structure.

| Title | Type | Description |
| -------- | --------|------ |
| **cis** | string | Marking code value<br>`+Required when replying` `+Required when creating` |
| **type** | Enum | Marking code type. Possible values: `trackingcode`, `consumerpack`, `transportpack`<br>`+Required when replying` `+Required when creating` |
| **trackingCodes** | Array(Object) | An array of nested marking codes. Can only be present if **type** is `consumerpack` or `transportpack` |

The code value is specified in the **cis** attribute.
For each code, the **type** type is specified: `trackingcode` (product labeling code), `consumerpack` (consumer package labeling code) or `transportpack` (shipping packaging code).
Nesting of product labeling codes in shipping packages is allowed. Shipping packages cannot have nested packages.
Packing codes may be missing - in this case the structure will not be nested.

If the product is not tagged, then the tagging codes for the item will not be saved.
The number of marking codes may differ from the actual number of product units.

#### Peculiarities of working with marking codes and serial numbers for a transaction item

When working with the Receiving item, the following features should be considered.

+ The number of **trackingCodes** marking codes in a document item does not affect the number of **quantity** units in the item.
+ The number of serial numbers **things** in the item of the document strictly corresponds to the number of **quantity** units in the item.
   Changing **quantity** to a value that does not match the number of serial numbers is not allowed.
+ To update the list of tracking codes **trackingCodes** and the list of serial numbers **things** of the Receiving item,
   it is necessary to transfer their complete list, including both old and new values. Missing values will be removed during the update.

Duplicate marking codes and serial numbers should not be saved inside the Receiving document.

### Get list of Receivings

Request all Receivings on this account.
Result: JSON object including fields:

| Title | Type | Description |
| -------- | --------|---------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Receivings. |

**Parameters**

| Parameter | Description |
| -------- | --------|
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** | `string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Get List of Receivings

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/supply"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Receivings.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/supply",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
     "type": "supply",
     "mediaType": "application/json",
     "size": 3,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/a3a404e4-2e5d-11e6-8a84-bae5000000fd",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
         "type": "supply",
         "mediaType": "application/json"
       },
       "id": "a3a404e4-2e5d-11e6-8a84-bae5000000fd",
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
       "updated": "2016-06-27 10:48:47",
       "name": "00001",
       "externalCode": "0ULmxwN1jHJwT9nYPawwO2",
       "moment": "2016-06-10 09:26:00",
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
       "sum": 16136135600,
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
           "href": "https://api.kladana.com/api/remap/1.2/entity/supply/a3a404e4-2e5d-11e6-8a84-bae5000000fd/positions",
           "type": "supplyposition",
           "mediaType": "application/json",
           "size": 1,
           "limit": 1000,
           "offset": 0
         }
       },
       "paidSum": 0,
       "incomingDate": "2016-06-04 00:00:00"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/b1008773-313f-11e6-8a84-bae500000089",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
         "type": "supply",
         "mediaType": "application/json"
       },
       "id": "b1008773-313f-11e6-8a84-bae500000089",
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
       "updated": "2016-06-13 11:20:30",
       "name": "00002",
       "externalCode": "zDCH0byNj4OtLFybETa560",
       "moment": "2016-06-13 11:20:00",
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
           "href": "https://api.kladana.com/api/remap/1.2/entity/supply/b1008773-313f-11e6-8a84-bae500000089/positions",
           "type": "supplyposition",
           "mediaType": "application/json",
           "size": 2,
           "limit": 1000,
           "offset": 0
         }
       },
       "paidSum": 0
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/f39a60f5-313f-11e6-8a84-bae5000000b4",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
         "type": "supply",
         "mediaType": "application/json"
       },
       "id": "f39a60f5-313f-11e6-8a84-bae5000000b4",
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
       "updated": "2016-06-15 12:22:08",
       "name": "00003",
       "externalCode": "M69h5veIhqsaDAZI88LUy0",
       "moment": "2016-06-13 11:21:00",
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
       "sum": 16000,
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
           "href": "https://api.kladana.com/api/remap/1.2/entity/supply/f39a60f5-313f-11e6-8a84-bae5000000b4/positions",
           "type": "supplyposition",
           "mediaType": "application/json",
           "size": 3,
           "limit": 1000,
           "offset": 0
         }
       },
       "paidSum": 0
     }
   ]
}
```

### Create Receiving
Request to create a new Receiving.
Mandatory fields to create:

| Parameter | Description |
| -------- | --------|
| **organization** | Link to your legal entity in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **agent** | Link to the counterparty in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **store** | Link to the warehouse in the format [Metadata](../#kladana-json-api-general-info-metadata) |

> An example of creating a new Receiving.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/supply"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "404050",
             "description": "Receiving from 12/12/12",
             "code": "776762312",
             "externalCode": "77sea2as12",
             "moment": "2012-12-12 12:12:12",
             "applicable": true,
             "vatEnabled": false,
             "vatIncluded": false,
             rate: {
               currency: {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                   "type": "currency",
                   "mediaType": "application/json"
                 }
               },
               "value": 71
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
             "store": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                 "type": "store",
                 "mediaType": "application/json"
               }
             },
             "state": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/states/918e5abd-3f66-11e6-8a84-bae500000083",
                 "type": "state",
                 "mediaType": "application/json"
               }
             },
             "incomingNumber": "12412412",
             "incomingDate": "2012-12-12 12:12:12"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Receiving.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/supply/f106723d-3f66-11e6-8a84-bae500000037",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
     "type": "supply",
     "mediaType": "application/json"
   },
   "id": "f106723d-3f66-11e6-8a84-bae500000037",
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
   "updated": "2016-07-01 11:36:44",
   "name": "404050",
   "description": "Receiving from 12/12/12",
   "code": "776762312",
   "externalCode": "77sea2as12",
   "moment": "2012-12-12 11:12:12",
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
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/states/918e5abd-3f66-11e6-8a84-bae500000083",
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "vatEnabled": false,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/f106723d-3f66-11e6-8a84-bae500000037/positions",
       "type": "supplyposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "incomingNumber": "12412412",
   "incomingDate": "2012-12-12 11:12:12"
}
```

> An example of a request to create an Receiving with additional fields.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/supply"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "404050124",
             "description": "Receiving from 909090",
             "code": "776762312",
             "externalCode": "77sea2as12",
             "moment": "2016-02-22 22:22:53",
             "applicable": true,
             "vatEnabled": true,
             "vatIncluded": true,
             "rate": {
               "currency": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                   "type": "currency",
                   "mediaType": "application/json"
                 }
               },
               "value": 71
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
             "store": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                 "type": "store",
                 "mediaType": "application/json"
               }
             },
             state: {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/states/918e5abd-3f66-11e6-8a84-bae500000083",
                 "type": "state",
                 "mediaType": "application/json"
               }
             },
             "incomingNumber": "12412412",
             "incomingDate": "2012-12-12 12:12:12",
             "attributes": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/a31685ae-3f62-11e6-8a84-bae50000007b",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "2017-02-22 02:12:53"
               },
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/c16fd9aa-3f62-11e6-8a84-bae50000007e",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": 47
               },
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/c16fe013-3f62-11e6-8a84-bae50000007f",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "Successful trade example"
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Receiving.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/supply/ad890c61-3f67-11e6-8a84-bae50000003b",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
     "type": "supply",
     "mediaType": "application/json"
   },
   "id": "ad890c61-3f67-11e6-8a84-bae50000003b",
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
   "updated": "2016-07-01 11:42:00",
   "name": "404050124",
   "description": "Receiving from 909090",
   "code": "776762312",
   "externalCode": "77sea2as12",
   "moment": "2016-02-22 22:22:53",
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
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/states/918e5abd-3f66-11e6-8a84-bae500000083",
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/a31685ae-3f62-11e6-8a84-bae50000007b",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "a31685ae-3f62-11e6-8a84-bae50000007b",
       "name": "AttributeName1",
       "type": "time",
       "value": "2017-02-22 02:12:53"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/c16fd9aa-3f62-11e6-8a84-bae50000007e",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c16fd9aa-3f62-11e6-8a84-bae50000007e",
       "name": "AttributeName2",
       "type": "long",
       "value": 47
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/c16fe013-3f62-11e6-8a84-bae50000007f",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c16fe013-3f62-11e6-8a84-bae50000007f",
       "name": "AttributeName3",
       "type": "text",
       "value": "Successful trade example"
     }
   ],
   "vatEnabled": true,
   "vatIncluded": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/ad890c61-3f67-11e6-8a84-bae50000003b/positions",
       "type": "supplyposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "incomingNumber": "12412412",
   "incomingDate": "2012-12-12 11:12:12"
}
```

> An example of a request to create an Receiving with items in the body of the request.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/supply"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "2000124",
            "description": "Receiving from 909090",
            "code": "776762312",
            "externalCode": "77sea2as12",
            "moment": "2016-02-22 22:22:53",
            "applicable": true,
            "vatEnabled": true,
            "vatIncluded": true,
            "rate": {
                "currency": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                        "type": "currency",
                        "mediaType": "application/json"
                    }
                },
                "value": 71
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
            "store": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                    "type": "store",
                    "mediaType": "application/json"
                }
            },
            "state": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/states/918e5abd-3f66-11e6-8a84-bae500000083",
                    "type": "state",
                    "mediaType": "application/json"
                }
            },
            "incomingNumber": "12412412",
            "incomingDate": "2012-12-12 12:12:12",
            "attributes": [
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/a31685ae-3f62-11e6-8a84-bae50000007b",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "value": "2017-02-22 02:12:53"
                },
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/c16fd9aa-3f62-11e6-8a84-bae50000007e",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "value": 47
                },
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/c16fe013-3f62-11e6-8a84-bae50000007f",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "value": "Successful trade example"
                }
            ],
            "positions": [
                {
                    "quantity": 10,
                    "price": 100,
                    "discount": 0,
                    "vat": 0,
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a7daa6b-3c64-11e6-8a84-bae50000000a",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                            "type": "variant",
                            "mediaType": "application/json"
                        }
                    },
                    "overhead": 10
                },
                {
                    "quantity": 20,
                    "price": 200,
                    "discount": 0,
                    "vat": 21,
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                            "type": "variant",
                            "mediaType": "application/json"
                        }
                    },
                    "trackingCodes": [
                        {
                            "cis": "012345678912345672",
                            "type": "transportpack",
                            "trackingCodes": [
                                {
                                    "cis": "010463003759026521uHpIIf2111111",
                                    "type": "trackingcode"
                                },
                                {
                                    "cis": "010463003759026521uHpIIf2111114",
                                    "type": "trackingcode"
                                }
                            ]
                        }
                    ],
                    "overhead": 20
                }
            ]
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Receiving.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/supply/5b493f0e-3f68-11e6-8a84-bae500000042",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
     "type": "supply",
     "mediaType": "application/json"
   },
   "id": "5b493f0e-3f68-11e6-8a84-bae500000042",
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
   "updated": "2016-07-01 11:46:52",
   "name": "2000124",
   "description": "Receiving from 909090",
   "code": "776762312",
   "externalCode": "77sea2as12",
   "moment": "2016-02-22 22:22:53",
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
   "sum": 5000,
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
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/states/918e5abd-3f66-11e6-8a84-bae500000083",
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/a31685ae-3f62-11e6-8a84-bae50000007b",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "a31685ae-3f62-11e6-8a84-bae50000007b",
       "name": "AttributeName1",
       "type": "time",
       "value": "2017-02-22 02:12:53"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/c16fd9aa-3f62-11e6-8a84-bae50000007e",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c16fd9aa-3f62-11e6-8a84-bae50000007e",
       "name": "AttributeName2",
       "type": "long",
       "value": 47
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/c16fe013-3f62-11e6-8a84-bae50000007f",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c16fe013-3f62-11e6-8a84-bae50000007f","name": "AttributeName3",
       "type": "text",
       "value": "Successful trade example"
     }
   ],
   "vatEnabled": true,
   "vatIncluded": true,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/5b493f0e-3f68-11e6-8a84-bae500000042/positions",
       "type": "supplyposition",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "incomingNumber": "12412412",
   "incomingDate": "2012-12-12 11:12:12",
   "overhead": {
     "sum": 30,
     "distribution": "price"
   }
}
```

### Bulk creating and update of Receivings

[Bulk creating and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Receiving.
In the body of the request, you need to pass an array containing the JSON of the Receivings that you want to create or update.
Updated Receivings must contain the identifier in the form of metadata.

> Example of creating and updating multiple Receivings

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/supply"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "404050",
               "description": "Receiving from 12/12/12",
               "code": "776762312",
               "externalCode": "77sea2as12",
               "moment": "2012-12-12 12:12:12",
               "applicable": true,
               "vatEnabled": false,
               "vatIncluded": false,
               "rate": {
                 "currency": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                     "type": "currency",
                     "mediaType": "application/json"
                   }
                 },
                 "value": 71
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
               "store": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                   "type": "store",
                   "mediaType": "application/json"
                 }
               },
               "state": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/states/918e5abd-3f66-11e6-8a84-bae500000083",
                   "type": "state",
                   "mediaType": "application/json"
                 }
               },
               "incomingNumber": "12412412",
               "incomingDate": "2012-12-12 12:12:12"
             },
             {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/supply/5b493f0e-3f68-11e6-8a84-bae500000042",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
                 "type": "supply",
                 "mediaType": "application/json"
               },
               "name": "2000700",
               "description": "Receiving from counterparty",
               "code": "1241242y421",
               "externalCode": "keksea2as12",
               "moment": "2011-12-12 11:11:11",
               "applicable": false,
               "vatEnabled": true,
               "vatIncluded": false,
               "rate": {
                 "currency": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/currency/cdbc62de-3f68-11e6-8a84-bae500000050",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                     "type": "currency",
                     "mediaType": "application/json"
                   }
                 },
                 "value": 33
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
               "store": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                   "type": "store",
                   "mediaType": "application/json"
                 }
               },
               "state": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/states/918e5abd-3f66-11e6-8a84-bae500000083",
                   "type": "state",
                   "mediaType": "application/json"
                 }
               },
               "incomingNumber": "12412412",
               "incomingDate": "2012-12-12 12:12:12",
               "attributes": [
                 {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/a31685ae-3f62-11e6-8a84-bae50000007b",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   "value": "2082-02-22 02:12:53"
                 },
                 {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/c16fd9aa-3f62-11e6-8a84-bae50000007e",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   "value": "Example of a very successful trade"
                 }
               ],
               "positions": [
                 {
                   "quantity": 101,
                   "price": 190.0,
                   "discount": 0,
                   "vat": 0,
                   "assortment": {
                     "meta": {
                       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a7daa6b-3c64-11e6-8a84-bae50000000a",
                       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                       "type": "variant",
                       "mediaType": "application/json"
                     }
                   }
                 },
                 {
                   "quantity": 20,
                   "price": 2.0,
                   "discount": 0,
                   "vat": 21,
                   "assortment": {
                     "meta": {
                       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
                       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                       "type": "variant",
                       "mediaType": "application/json"
                     }
                   }
                 }
               ]
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the generated and updated Receivings.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/f106723d-3f66-11e6-8a84-bae500000037",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
       "type": "supply",
       "mediaType": "application/json"
     },
     "id": "f106723d-3f66-11e6-8a84-bae500000037",
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
     "updated": "2016-07-01 11:36:44",
     "name": "404050",
     "description": "Receiving from 12/12/12",
     "code": "776762312",
     "externalCode": "77sea2as12",
     "moment": "2012-12-12 11:12:12",
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
     "state": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/states/918e5abd-3f66-11e6-8a84-bae500000083",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "vatEnabled": false,
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/f106723d-3f66-11e6-8a84-bae500000037/positions",
         "type": "supplyposition",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     },
     "paidSum": 0,
     "incomingNumber": "12412412",
     "incomingDate": "2012-12-12 11:12:12"
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/5b493f0e-3f68-11e6-8a84-bae500000042",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
       "type": "supply",
       "mediaType": "application/json"
     },
     "id": "5b493f0e-3f68-11e6-8a84-bae500000042",
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
     "updated": "2016-07-01 11:51:34",
     "name": "2000700",
     "description": "Receiving from counterparty",
     "code": "1241242y421",
     "externalCode": "keksea2as12",
     "moment": "2011-12-12 10:11:11",
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
     "sum": 19238,
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
     "state": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/states/918e5abd-3f66-11e6-8a84-bae500000083",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "attributes": [
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/a31685ae-3f62-11e6-8a84-bae50000007b",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "a31685ae-3f62-11e6-8a84-bae50000007b",
         "name": "AttributeName1",
         "type": "time",
         "value": "2082-02-22 02:12:53"
       },
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/c16fd9aa-3f62-11e6-8a84-bae50000007e",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "c16fd9aa-3f62-11e6-8a84-bae50000007e",
         "name": "AttributeName2",
         "type": "long",
         "value": 47
       },
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/c16fe013-3f62-11e6-8a84-bae50000007f",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "c16fe013-3f62-11e6-8a84-bae50000007f",
         "name": "AttributeName3",
         "type": "text",
         "value": "Example of a very successful trade"
       }
     ],
     "vatEnabled": true,
     "vatIncluded": false,
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/5b493f0e-3f68-11e6-8a84-bae500000042/positions",
         "type": "supplyposition",
         "mediaType": "application/json",
         "size": 2,
         "limit": 1000,
         "offset": 0
       }
     },
     "paidSum": 0,
     "incomingNumber": "12412412",
     "incomingDate": "2012-12-12 11:12:12"
   }
]

```

### Delete Receiving

**Parameters**

| Parameter | Description |
| -------- | --------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Receiving id. |

> Request to remove the Receiving with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of Receiving.

### Bulk deletion of Receivings

In the body of the request, you need to pass an array containing the JSON metadata of the Receivings that you want to remove.


> Bulk Deletion Request Receiving.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/supply/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b1",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
                    "type": "supply",
                    "mediaType": "application/json"
                }
            },
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b2",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
                    "type": "supply",
                    "mediaType": "application/json"
                }
            }
          ]'
```

> Successful request. The result is JSON information about the removal of Receivings.

```json
[
   {
     "info":"Entity 'supply' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'supply' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Receiving Metadata
#### Receiving Metadata
Request for Receiving metadata. The result is a JSON object including:

| Parameter | Description |
| -------- | --------|
| **meta**| Link to Metadata Receivings |
| **attributes** | Array of objects additional Receiving fields in [Metadata](../#kladana-json-api-general-info-metadata) format |
| **states** | Array of Receiving statuses |
| **createShared** | create new Receiving labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Receiving Metadata

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/supply/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional Receiving fields.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/a31685ae-3f62-11e6-8a84-bae50000007b",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "a31685ae-3f62-11e6-8a84-bae50000007b",
       "name": "AttributeName1",
       "type": "time",
       "required": false
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/c16fd9aa-3f62-11e6-8a84-bae50000007e",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c16fd9aa-3f62-11e6-8a84-bae50000007e",
       "name": "AttributeName2",
       "type": "long",
       "required": false
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/c16fe013-3f62-11e6-8a84-bae50000007f",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c16fe013-3f62-11e6-8a84-bae50000007f",
       "name": "AttributeName3",
       "type": "text",
       "required": false
     }
   ],
   "createShared": false
}

```

### Receiving Template
#### Receiving Template
> Request to receive an Receiving template pre-filled with default values without being associated with any document.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/supply/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d''
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Receiving.

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
   "moment": "2017-11-22 19:05:33",
   "applicable": true,
   "sum": 0,
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/463f8970-ca1f-11e7-6a80-332a00000053",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#warehouse/edit?id=463f8970-ca1f-11e7-6a80-332a00000053"
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/f106723d-3f66-11e6-8a84-bae500000037/documents",
       "mediaType": "application/json",
       "size": 0,
       "limit": 100,
       "offset": 0
     }
   },
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/5b493f0e-3f68-11e6-8a84-bae500000042/positions",
       "type": "supplyposition",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     }
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "paidSum": 0
}
```

### Receiving template based on Purchase Order

Request to receive a pre-filled Receiving based on a vendor order. As a result of the request, a pre-filled Receiving template will be created based on the passed supplier order.

> Request to create an Receiving based on a vendor order.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/supply/new"
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
Successful request. The result is a JSON representation of the prefilled Receiving.

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
   "moment": "2017-11-22 16:16:29",
   "applicable": true,
   "sum": 0,
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/463f8970-ca1f-11e7-6a80-332a00000053",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#warehouse/edit?id=463f8970-ca1f-11e7-6a80-332a00000053"
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/f106723d-3f66-11e6-8a84-bae500000037/documents",
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
         "price": 1000.0,
         "discount": 0,
         "vat": 0,
         "vatEnabled": false,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/variant/b5d94dd1-cab0-11e7-6a80-332a00000011",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
             "type": "variant",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
           }
         },
         "overhead": 0
       }
     ]
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "paidSum": 0,
   "invoicesIn": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/dbf1e704-cf7b-11e7-6a80-332a00000000",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
         "type": "invoicein",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#invoicein/edit?id=dbf1e704-cf7b-11e7-6a80-332a00000000"
       }
     }
   ],
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

> Request to create an Receiving based on the vendor invoice.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/supply/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "invoicesIn": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/dbf1e704-cf7b-11e7-6a80-332a00000000",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
                   "type": "invoicein",
                   "mediaType": "application/json",
                   "uuidHref": "https://app.kladana.com/app/#invoicein/edit?id=dbf1e704-cf7b-11e7-6a80-332a00000000"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Receiving.

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
   "moment": "2017-11-22 16:16:29",
   "applicable": true,
   "sum": 0,
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/463f8970-ca1f-11e7-6a80-332a00000053",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#warehouse/edit?id=463f8970-ca1f-11e7-6a80-332a00000053"
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/f106723d-3f66-11e6-8a84-bae500000037/documents",
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
         "price": 1000.0,
         "discount": 0,
         "vat": 0,
         "vatEnabled": false,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/variant/b5d94dd1-cab0-11e7-6a80-332a00000011",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
             "type": "variant",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
           }
         },
         "overhead": 0
       }
     ]
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "paidSum": 0,
   "invoicesIn": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/invoicein/dbf1e704-cf7b-11e7-6a80-332a00000000",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoicein/metadata",
         "type": "invoicein",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#invoicein/edit?id=dbf1e704-cf7b-11e7-6a80-332a00000000"
       }
     }
   ]
}
```

### Separate additional field
  
### Separate additional field

**Parameters**

| Parameter | Description |
| -------- | --------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Field ID. |
 
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/a31685ae-3f62-11e6-8a84-bae50000007b",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "a31685ae-3f62-11e6-8a84-bae50000007b",
   "name": "AttributeName1",
   "type": "time",
   "required": false
}
```

### Receiving

### Get Receiving

**Parameters**

| Parameter | Description |
| -------- | --------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Receiving id. |
 
> Request for a separate Receiving with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Receiving.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/supply/a3a404e4-2e5d-11e6-8a84-bae5000000fd",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
     "type": "supply",
     "mediaType": "application/json"
   },
   "id": "a3a404e4-2e5d-11e6-8a84-bae5000000fd",
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
       "mediaType": "application/json"}
   },
   "updated": "2016-06-27 10:48:47",
   "name": "00001",
   "externalCode": "0ULmxwN1jHJwT9nYPawwO2",
   "moment": "2016-06-10 09:26:00",
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
   "sum": 16136135600,
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/a3a404e4-2e5d-11e6-8a84-bae5000000fd/positions",
       "type": "supplyposition",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "incomingDate": "2016-06-04 00:00:00"
}

```

### Change Receiving
Request to update Receiving with specified id.
In the body of the request, you can specify only those fields that need to be changed in Receiving, except for those that
are marked `Read-Only` in the description of [Receiving attributes](../documents/#transactions-receiving).
When updating the **organization** and **agent** fields, you must also update the **organizationAccount** and
**agentAccount** respectively, otherwise an error will occur.

**Parameters**

| Parameter | Description |
| -------- | --------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Receiving id. |

> An example of a request to update a single Receiving.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "2000700",
             "description": "Receiving from counterparty",
             "code": "1241242y421",
             "externalCode": "keksea2as12",
             "moment": "2011-12-12 11:11:11",
             "applicable": false,
             "vatEnabled": true,
             "vatIncluded": false,
             "rate": {
               "currency": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/currency/cdbc62de-3f68-11e6-8a84-bae500000050",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                   "type": "currency",
                   "mediaType": "application/json"
                 }
               },
               "value": 33
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
             "store": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                 "type": "store",
                 "mediaType": "application/json"
               }
             },
             "state": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/states/918e5abd-3f66-11e6-8a84-bae500000083",
                 "type": "state",
                 "mediaType": "application/json"
               }
             },
             "incomingNumber": "12412412",
             "incomingDate": "2012-12-12 12:12:12",
             "attributes": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/a31685ae-3f62-11e6-8a84-bae50000007b",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "2082-02-22 02:12:53"
               },
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/c16fd9aa-3f62-11e6-8a84-bae50000007e",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "Example of a very successful trade"
               }
             ],
             "positions": [
               {
                 "quantity": 101,
                 "price": 190.0,
                 "discount": 0,
                 "vat": 0,
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a7daa6b-3c64-11e6-8a84-bae50000000a",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                     "type": "variant",
                     "mediaType": "application/json"
                   }
                 }
               },
               {
                 "quantity": 20,
                 "price": 2.0,
                 "discount": 0,
                 "vat": 21,
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                     "type": "variant",
                     "mediaType": "application/json"
                   }
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Receiving.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/supply/5b493f0e-3f68-11e6-8a84-bae500000042",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
     "type": "supply",
     "mediaType": "application/json"
   },
   "id": "5b493f0e-3f68-11e6-8a84-bae500000042",
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
   "updated": "2016-07-01 11:51:34",
   "name": "2000700",
   "description": "Receiving from Counterparty",
   "code": "1241242y421",
   "externalCode": "keksea2as12",
   "moment": "2011-12-12 10:11:11",
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
   "sum": 19238,
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
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/states/918e5abd-3f66-11e6-8a84-bae500000083",
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004/accounts/147c3231-32ca-11e6-8a84-bae500000005",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/a31685ae-3f62-11e6-8a84-bae50000007b",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "a31685ae-3f62-11e6-8a84-bae50000007b",
       "name": "AttributeName1",
       "type": "time",
       "value": "2082-02-22 02:12:53"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/c16fd9aa-3f62-11e6-8a84-bae50000007e",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c16fd9aa-3f62-11e6-8a84-bae50000007e",
       "name": "AttributeName2",
       "type": "long",
       "value": 47
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata/attributes/c16fe013-3f62-11e6-8a84-bae50000007f",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c16fe013-3f62-11e6-8a84-bae50000007f",
       "name": "AttributeName3",
       "type": "text",
       "value": "Example of a very successful trade"
     }
   ],
   "vatEnabled": true,
   "vatIncluded": false,
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/5b493f0e-3f68-11e6-8a84-bae500000042/positions",
       "type": "supplyposition",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "incomingNumber": "12412412",
   "incomingDate": "2012-12-12 11:12:12"
}
```

### Receiving Items

A separate resource for managing Receiving items. With it, you can manage the items of a larger document that has more lines than the limit on the number of lines saved with the document. This limit is 1000. You can read more about limits on the number of document lines and working with large documents [here](../#kladana-json-api-general-info-working-with-transaction-items).

### Get Receiving Items
Request for a list of all items in the Receiving.

| Title | Type | Description |
| -------- | --------|-------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the Receiving items. |

**Parameters**

| Parameter | Description |
| -------- | --------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Receiving id. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Receiving Items

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b19/positions"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of individual Receiving items.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b19/positions",
     "type": "supplyposition",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b19/positions/b100a7fc-313f-11e6-8a84-bae50000008a",
         "type": "supplyposition",
         "mediaType": "application/json"
       },
       "id": "b100a7fc-313f-11e6-8a84-bae50000008a",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 1241,
       "price": 0.0,
       "discount": 0,
       "vat": 0,
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/328b0454-2e62-11e6-8a84-bae500000118",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b19/positions/b100b367-313f-11e6-8a84-bae50000008b",
         "type": "supplyposition",
         "mediaType": "application/json"
       },
       "id": "b100b367-313f-11e6-8a84-bae50000008b",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 700,
       "price": 0.0,
       "discount": 0,
       "vat": 0,
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=392c045c-2842-11e9-ac12-000a00000002"
         }
       }
     }
   ]
}
```


> Example with marking codes

```shell
curl --location --request GET 'https://api.kladana.com/api/remap/1.2/entity/supply/63918a49-886e-11ea-0a80-151b0000007f?expand=positions' \
--header 'Authorization: Basic <Credentials>'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of individual Receiving items.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/supply/63918a49-886e-11ea-0a80-151b0000007f?expand=positions",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
     "type": "supply",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#supply/edit?id=63918a49-886e-11ea-0a80-151b0000007f"
   },
   "id": "63918a49-886e-11ea-0a80-151b0000007f",
   "accountId": "de6b5113-8491-11ea-0a80-134500000014",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/de79b4a8-8491-11ea-0a80-037a00000271",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#employee/edit?id=de79b4a8-8491-11ea-0a80-037a00000271"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/de6baafa-8491-11ea-0a80-134500000015",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2020-04-28 15:53:04.288",
   "name": "00008",
   "description": "Import Receiving from EDF dated 25.09.2017",
   "externalCode": "k-nV33MtgVIeGt7S-XY4R3",
   "moment": "2020-04-27 13:03:00.000",
   "applicable": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/de8b754f-8491-11ea-0a80-037a000002b4",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#currency/edit?id=de8b754f-8491-11ea-0a80-037a000002b4"
       }
     }
   },
   "sum": 244200.0,
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/de8b4d0e-8491-11ea-0a80-037a000002af",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#warehouse/edit?id=de8b4d0e-8491-11ea-0a80-037a000002af"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/de965214-8491-11ea-0a80-037a000002c1",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#company/edit?id=de965214-8491-11ea-0a80-037a000002c1"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/de8a609d-8491-11ea-0a80-037a000002ad",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=de8a609d-8491-11ea-0a80-037a000002ad"
     }
   },
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/63918a49-886e-11ea-0a80-151b0000007f/positions",
       "type": "supplyposition",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     },
     "rows": [
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/supply/63918a49-886e-11ea-0a80-151b0000007f/positions/6391a58a-886e-11ea-0a80-151b00000080",
           "type": "supplyposition",
           "mediaType": "application/json"
         },
         "id": "6391a58a-886e-11ea-0a80-151b00000080",
         "accountId": "de6b5113-8491-11ea-0a80-134500000014",
         "quantity": 10.0,
         "price": 11100.0,
         "discount": 0.0,
         "vat": 0,
         "vatEnabled": false,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/aa1b1814-8493-11ea-0a80-037a00000307",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#good/edit?id=aa1b0d42-8493-11ea-0a80-037a00000305"
           }
         },
         "trackingCodes": [
           {
             "cis": "012345678912345678",
             "type": "transportpack"
           },
           {
             "cis": "012345678912345678",
             "type": "transportpack",
             "trackingCodes": [
               {
                 "cis": "010463003759026521uHpIIf-nXIH>0",
                 "type": "trackingcode"
               },
               {
                 "cis": "010463003759026521uHpIIf-nXIH>4",
                 "type": "trackingcode"
               },
               {
                 "cis": "010463003759026521uHpIIf-111114",
                 "type": "trackingcode"
               }
             ]
           },
           {
             "cis": "010463003759026521uHpIIf-111114",
             "type": "trackingcode"
           },
           {
             "cis": "010463003759026521uHpIIf-nXIH>4",
             "type": "trackingcode"
           },
           {
             "cis": "010463003759026521uHpIIf-nXIH>0",
             "type": "trackingcode"
           }
         ],
         "overhead": 0.0
       },
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/supply/63918a49-886e-11ea-0a80-151b0000007f/positions/639235ac-886e-11ea-0a80-151b000000ad",
           "type": "supplyposition",
           "mediaType": "application/json"
         },
         "id": "639235ac-886e-11ea-0a80-151b000000ad",
         "accountId": "de6b5113-8491-11ea-0a80-134500000014",
         "quantity": 12.0,
         "price": 11100.0,
         "discount": 0.0,
         "vat": 0,
         "vatEnabled": false,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/aa1b1814-8493-11ea-0a80-037a00000307",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#good/edit?id=aa1b0d42-8493-11ea-0a80-037a00000305"
           }
         },
         "trackingCodes": [
           {
             "cis": "123456123456123456",
             "type": "transportpack"
           },
           {
             "cis": "012345678901234567",
             "type": "transportpack"
           }
         ],
         "overhead": 0.0
       }
     ]
   },
   "vatEnabled": true,
   "vatIncluded": false,
   "vatSum": 0.0,
   "paidSum": 0.0,
   "incomingNumber": "1",
   "incomingDate": "2017-09-25 00:00:00.000"
}
```

### Receiving Item
 
### Get Item

**Parameters**

| Parameter | Description |
| -------- | --------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Receiving ID. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Receiving item ID. |
 
> Request to get a separate Receiving item with the specified ID.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a single Receiving item.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
     "type": "supplyposition",
     "mediaType": "application/json"
   },
   "id": "34f6344f-015e-11e6-9464-e4de0000006c",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "quantity": 1241,
   "price": 0.0,
   "discount": 0,
   "vat": 0,
   "vatEnabled": false,
   "assortment": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/328b0454-2e62-11e6-8a84-bae500000118",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#good/edit?id=392c045c-2842-11e9-ac12-000a00000002"
     }
   },
   "overhead": 0
}
```

### Create Item

Request to create a new item in Receiving.
For successful creation, the following fields must be specified in the request body:

+ **assortment** - Link to the products, services, batches, product variants that the item represents.
You can also specify a field named **service**, **variant** according to
what the indicated item is. You can read more about this field in the description of the [Receiving item](../documents/#transactions-receiving-receivings-receiving-items)
+ **quantity** - Quantity of the specified item. Must be positive, otherwise an error will occur.
You can create one or more Receiving items at the same time. All items created by this request
will be added to the existing ones.

**Parameters**

| Parameter | Description|
| -------- | --------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Receiving id. |

> An example of creating one item in Receiving.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b19/positions"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
              "quantity": 44,
              "price": 700.0,
              "discount": 23,
              "vat": 10,
              "assortment": {
                  "meta": {
                      "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a7daa6b-3c64-11e6-8a84-bae50000000a",
                      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                      "type": "variant",
                      "mediaType": "application/json"
                  }
              },
              "country": {
                  "meta": {
                      "href": "https://api.kladana.com/api/remap/1.2/entity/country/000d77a9-3000-4f81-a995-6b9cffdee1d2",
                      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
                      "type": "country",
                      "mediaType": "application/json"
                  }
              },
              "overhead": 300
          }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created single Receiving item.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b19/positions/e33f101b-3f64-11e6-8a84-bae500000025",
       "type": "supplyposition",
       "mediaType": "application/json"
     },
     "id": "e33f101b-3f64-11e6-8a84-bae500000025",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 44,
     "price": 700.0,
     "discount": 23,
     "vat": 10,
     "vatEnabled": true,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a7daa6b-3c64-11e6-8a84-bae50000000a",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
       }
     },
     "country": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/country/000d77a9-3000-4f81-a995-6b9cffdee1d2",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json"
       }
     },
     "overhead": 0
   }
]
```

> An example of creating several items at once in Receiving.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b19/positions"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
            {
                "quantity": 44,
                "price": 700.0,
                "discount": 23,
                "vat": 10,
                "assortment": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a7daa6b-3c64-11e6-8a84-bae50000000a",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                        "type": "variant",
                        "mediaType": "application/json"
                    }
                },
                "country": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/country/000d77a9-3000-4f81-a995-6b9cffdee1d2",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
                        "type": "country",
                        "mediaType": "application/json"
                    }
                },
                "overhead": 300
            },
            {
                "quantity": 3,
                "price": 3500.0,
                "discount": 0,
                "vat": 7,
                "assortment": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                        "type": "variant",
                        "mediaType": "application/json"
                    }
                }
            },
            {
                "quantity": 21,
                "price": 2300.0,
                "discount": 0,
                "vat": 21,
                "assortment": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                        "type": "variant",
                        "mediaType": "application/json"
                    }
                }
            }
          ]'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of created items of a single Receiving.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b19/positions/3b5fdebd-3f65-11e6-8a84-bae50000002a",
       "type": "supplyposition",
       "mediaType": "application/json"
     },
     "id": "3b5fdebd-3f65-11e6-8a84-bae50000002a",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 44,
     "price": 700.0,
     "discount": 23,
     "vat": 10,
     "vatEnabled": true,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a7daa6b-3c64-11e6-8a84-bae50000000a",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
       }
     },
     "country": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/country/000d77a9-3000-4f81-a995-6b9cffdee1d2",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json"
       }
     },
     "overhead": 0
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b19/positions/3b5fe7b8-3f65-11e6-8a84-bae50000002b",
       "type": "supplyposition",
       "mediaType": "application/json"
     },
     "id": "3b5fe7b8-3f65-11e6-8a84-bae50000002b",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 3,
     "price": 3500.0,
     "discount": 0,
     "vat": 7,
     "vatEnabled": true,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#feature/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
       }
     },
     "overhead": 0
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b19/positions/3b5ffcfd-3f65-11e6-8a84-bae50000002c",
       "type": "supplyposition",
       "mediaType": "application/json"
     },
     "id": "3b5ffcfd-3f65-11e6-8a84-bae50000002c",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 21,
     "price": 2300.0,
     "discount": 0,
     "vat": 21,
     "vatEnabled": true,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#feature/edit?id=392c045c-2842-11e9-ac12-000a00000002"
       }
     },
     "overhead": 0
   }
]
```

> Example with marking codes

```shell
curl --location --request POST 'https://api.kladana.com/api/remap/1.2/entity/supply/63918a49-886e-11ea-0a80-151b0000007f/positions' \
--header 'Authorization: Basic <Credentials>' \
--header 'Content-Type: application/json' \
--data-raw '{
                "quantity":10.0,
                "price":11100.0,
                "discount":0.0,
                "vat":0,
                "assortment": {
                   "meta": {
                      "href":"https://api.kladana.com/api/remap/1.2/entity/product/aa1b1814-8493-11ea-0a80-037a00000307",
                      "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                      "type":"product",
                      "mediaType":"application/json",
                      "uuidHref":"https://app.kladana.com/app/#good/edit?id=aa1b0d42-8493-11ea-0a80-037a00000305"
                   }
                },
                "trackingCodes":[
                   {
                      "cis":"012345678912345671",
                      "type":"transportpack"
                   },
                   {
                      "cis":"012345678912345678",
                      "type":"transportpack",
                      "trackingCodes":[
                         {
                            "cis":"010463003759026521uHpIIf-111114",
                            "type": "trackingcode"
                         },
                         {
                            "cis":"010463003759026521uHpIIf-nXIH>4",
                            "type": "trackingcode"
                         },
                         {
                            "cis":"010463003759026521uHpIIf-nXIH>0",
                            "type": "trackingcode"
                         }
                      ]
                   },
                   {
                      "cis":"010463003759026521uHpIIf-nXIH>1",
                      "type": "trackingcode"
                   },
                   {
                      "cis":"010463003759026521uHpIIf-nXIH>2",
                      "type": "trackingcode"
                   },
                   {
                      "cis":"010463003759026521uHpIIf-111122",
                      "type": "trackingcode"
                   }
                ]
            }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created posea separate Receiving.

```json
[
    {
       "meta": {
          "href":"https://api.kladana.com/api/remap/1.2/entity/supply/63918a49-886e-11ea-0a80-151b0000007f/positions/94d7af93-894f-11ea-0a80-05770000000d",
          "type":"supplyposition",
          "mediaType":"application/json"
       },
       "id":"94d7af93-894f-11ea-0a80-05770000000d",
       "accountId":"de6b5113-8491-11ea-0a80-134500000014",
       "quantity":10.0,
       "price":11100.0,
       "discount":0.0,
       "vat":0,
       "vatEnabled": false,
       "assortment": {
          "meta": {
             "href":"https://api.kladana.com/api/remap/1.2/entity/product/aa1b1814-8493-11ea-0a80-037a00000307",
             "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/product/metadata",
             "type":"product",
             "mediaType":"application/json",
             "uuidHref":"https://app.kladana.com/app/#good/edit?id=aa1b0d42-8493-11ea-0a80-037a00000305"
          }
       },
       "trackingCodes":[
          {
             "cis":"012345678912345678",
             "type":"transportpack",
             "trackingCodes":[
                {
                   "cis":"010463003759026521uHpIIf-nXIH>4",
                   "type": "trackingcode"
                },
                {
                   "cis":"010463003759026521uHpIIf-111114",
                   "type": "trackingcode"
                },
                {
                   "cis":"010463003759026521uHpIIf-nXIH>0",
                   "type": "trackingcode"
                }
             ]
          },
          {
             "cis":"010463003759026521uHpIIf-111122",
             "type": "trackingcode"
          },
          {
             "cis":"010463003759026521uHpIIf-nXIH>2",
             "type": "trackingcode"
          },
          {
             "cis":"012345678912345671",
             "type":"transportpack"
          },
          {
             "cis":"010463003759026521uHpIIf-nXIH>1",
             "type": "trackingcode"
          }
       ],
       "overhead":0.0
    }
]
```

### Change Item

Request to update an individual Receiving item. There is no way to update the item required fields in the body of the request. Only the ones you want to update.

When updating the list of marking codes, take into account that their number may differ from the actual number of product units.
To change the number of product units, you must use the **quantity** parameter.

**Parameters**

| Parameter | Description |
| -------- | --------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Receiving id. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Receiving item id. |
 
> Example of a line item update request in Receiving.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "quantity": 700,
             "price": 2355.0,
             "discount": 69,
             "vat": 10
             "assortment": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                 "type": "variant",
                 "mediaType": "application/json"
               }
             },
             "overhead": 2
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Receiving item.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
     "type": "supplyposition",
     "mediaType": "application/json"
   },
   "id": "34f6344f-015e-11e6-9464-e4de0000006c",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "quantity": 700,
   "price": 2355.0,
   "discount": 69,
   "vat": 10,
   "vatEnabled": true,
   "assortment": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
       "type": "variant",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#feature/edit?id=392c045c-2842-11e9-ac12-000a00000002"
     }
   },
   "overhead": 0
}
```

### Delete Item

**Parameters**

| Parameter | Description |
| -------- | --------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Receiving ID. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Receiving item ID. |
 
> Request to delete a separate Receiving item with the specified ID.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/supply/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of the Receiving item.

### Bulk deletion of items

**Parameters**

| Parameter | Description |
| -------- | --------|
| **id**   | `string` (required) *Example: 3e1c03bb-684f-11ee-ac12-000c000000b0* Receiving ID. |

> Request for bulk deletion of Receiving items.

```shell
curl -X POST
  "https://api.kladana.com/api/remap/1.2/entity/supply/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/delete"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
  -H "Content-Type: application/json"
  -d '[
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/supply/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/7fce2da5-684d-11ee-ac12-000c000000a2",
            "type": "supplyposition",
            "mediaType": "application/json"
          }
        },
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/supply/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/7fce37a5-684d-11ee-ac12-000c000000a3",
            "type": "supplyposition",
            "mediaType": "application/json"
          }
        }
      ]'  
```

> Response 200 (application/json)
Successful deletion of Receiving items. 