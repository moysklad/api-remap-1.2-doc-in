## Sales Return

Using the JSON API, you can create and update information about Sales Returns, query lists of Sales Returns, and information on individual Sales Returns. Sales Returns items can be managed both as part of a separate Return, and separately - using special resources for managing Sales Return items. The entity code for Sales Return in the JSON API is the **salesreturn** keyword.

### Sales Returns
#### Entity attributes

| Title | Type | Filtration | Description |
| ------ | ------- | -------- | -------- |
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **agent** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Counterparty metadata<br>`+Required when replying` `+Expand` `+Change-handler` |
| **agentAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Counterparty account metadata<br>`+Expand` `+Change-handler` |
| **applicable** | Boolean | `=` `!=` | Handling flag<br>`+Required when replying` `+Change-handler` |
| **attributes** | Array(Object) | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields) `+Change-handler` |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Sales Return Code |
| **contract** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Contract metadata<br>`+Expand` `+Change-handler` |
| **created** | datetime | `=` `!=` `<` `>` `<=` `>=` | Creation date<br>`+Required for response` `+Read-only` `+Change-handler` |
| **deleted** | datetime | `=` `!=` `<` `>` `<=` `>=` | Last delete date Sales Return<br>`+Read Only` |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Sales Return Comment<br>`+Change-handler` |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | Sales Return External Code<br>`+Required when replying` `+Change-handler` |
| **files** | MetaArray | | [Files](../dictionaries/#entities-files) array metadata (Maximum number of files - 100)<br>`+Required when replying` `+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID | `=` `!=` | Sales Return ID<br>`+Required for response` `+Read-only` `+Change-handler` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Sales Return Metadata<br>`+Required in response` `+Change-handler` |
| **moment** | datetime | `=` `!=` `<` `>` `<=` `>=` | Document date<br>`+Required when replying` `+Change-handler` |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Sales Return Name<br>`+Required when replying` `+Change-handler` |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Legal entity metadata<br>`+Required when responding` `+Expand` `+Required when creating` `+Change-handler` |
| **organizationAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Legal entity account metadata<br>`+Expand` `+Change-handler` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Required when replying` `+Expand` |
| **positions** | MetaArray | | Sales Return Item Metadata<br>`+Required in response` `+Expand` `+Change-handler` |
| **printed** | Boolean | `=` `!=` | Is the document printed<br>`+Required when responding` `+Read Only` |
| **project** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Project metadata<br>`+Expand` `+Change-handler` |
| **published** | Boolean | `=` `!=`| Is the document published<br>`+Required when replying` `+Read Only` |
| **rate** | object | | Currency. [More details here](../documents/#transactions-currency-in-transactions)<br>`+Required when replying` `+Change-handler` |
| **salesChannel** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Sales channel metadata<br>`+Expand` |
| **shared** | Boolean | `=` `!=` | Sharing<br>`+Required when replying` |
| **state** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Sales Return<br>`+Expand` status metadata `+Change-handler` |
| **store** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Warehouse metadata<br>`+Required when responding` `+Expand` `+Required when creating` `+Change-handler` |
| **sum** | int | `=` `!=` `<` `>` `<=` `>=` | Sales Return Total in rupees<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **syncId** | UUID | `=` `!=` | Synchronization ID. After filling it is not available for change |
| **updated** | datetime | `=` `!=` `<` `>` `<=` `>=` | Last update date Sales Return<br>`+Required for response` `+Read-only` `+Change-handler` |
| **vatEnabled** | Boolean | | Is VAT taken into account<br>`+Required when replying` `+Change-handler` |
| **vatIncluded** | Boolean | | Is VAT included in the price of `+Change-handler` |
| **vatSum** | float | | VAT amount<br>`+Required when replying` `+Change-handler` |

#### Links to other documents

| Title | Description |
| -------- | ----- |
| **demand** | Link to the shipment from which the return occurred in the format [Metadata](../#kladana-json-api-general-info-metadata) The field is required for a return with a reason. |
| **losses** | An array of links to related Write-offs in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **payments** | An array of links to related payments in the format [Metadata](../#kladana-json-api-general-info-metadata)|
| **paidSum** | Amount of outgoing payments by Sales Return |

#### Sales Return Items

Sales Return Items is the list of products, services, product variants.

The Sales Return element object contains the following fields:

| Title | Type | Description |
| ------| ------- |---------|
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of a product/service/series/modification, which is a item<br>`+Required when answering` `+Expand` `+Change-handler` |
| **cost** | int | Cost price (displayed if the document was created without a reason) |
| **country** | [Meta](../#kladana-json-api-general-info-metadata) | Country Metadata<br>`+Expand` |
| **discount** | int | The percentage of the discount or markup. The markup is indicated as a negative number, i.e. -10 will create a markup of 10%<br>`+Required when replying` `+Change-handler` |
| **id** | UUID | Item ID<br>`+Required for response` `+Read-only` `+Change-handler` |
| **pack** | object | Product packaging. [More here](../dictionaries/#entities-product-products-nested-entity-attributes-product-packaging) <br>`+Change-handler` |
| **price** | float | Price of goods/services in rupees<br>`+Required when answering` `+Change-handler` |
| **quantity** | int | The number of goods/services of this type in the item. If the item is a product with serial number accounting enabled, then the value in this field will always be equal to the number of serial numbers for this item in the document.<br>`+Required when replying` `+Change-handler` |
| **slot** | [Meta](../#kladana-json-api-general-info-metadata) | Cell in the warehouse. [More here](../dictionaries/#entities-warehouse-storage-bins)<br>`+Expand` |
| **things** | Array(String) | Serial numbers. The value of this attribute is ignored if the item item is not in serial accounting. Otherwise, the number of items in the item will be equal to the number of serial numbers passed in the attribute value. |
| **vat** | int | VAT applicable to the current item<br>`+Required when replying` `+Change-handler` |
| **vatEnabled** | Boolean | Whether VAT is included for the item. With this flag, you can set VAT = 0 or VAT = "excluding VAT" for an item. (vat = 0, vatEnabled = false) -> vat = "without VAT", (vat = 0, vatEnabled = true) -> vat = 0%.<br>`+Required when replying` `+Change-handler` |

You can work with items using special [resources for managing Sales Return items](../documents/#transactions-sales-return-sales-returns-sales-return-items),
and also as part of a separate Sales Return. When working as part of a separate Sales Return,
you can submit requests to create a separate Sales Return with included in the request body
an array of Sales Return items. If the number of items exceeds the maximum allowed, then for
further replenishment of items will need to work with a special resource "Sales Return Items".

Also, when working as part of a separate Sales Return, you can send requests to update the list of items
with an array of Sales Return items included in the request body. It is important to remember that the collection of items will
be perceived as "All Sales Return Items" and will completely replace the existing collection when updating the object. Superfluous items are deleted, new ones are added, existing ones are changed.

About working with fields of Returns of Sales Returns can be read [here](../#kladana-json-api-general-info-additional-fields)


### Get Sales Returns
Request all Sales Returns on this account.
Result: JSON object including fields:

| Title | Type | Description |
| ----------- | ------- | --------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Sales Returns. |

**Parameters**

| Parameter | Description |
| ----------| --------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Sales Returns

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/salesreturn"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of Sales Returns.

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
     "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
     "type": "sales return",
     "mediaType": "application/json",
     size: 2
     limit: 1000
     offset: 0
   },
   rows: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/90f337d1-3f80-11e6-8a84-bae5000000ac",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
         "type": "sales return",
         "mediaType": "application/json"
       },
       "id": "90f337d1-3f80-11e6-8a84-bae5000000ac",
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
       "updated": "2016-07-01 14:40:10",
       "name":"00001",
       "externalCode": "PDJ7P5kVhEWomlQtd67up2",
       "moment": "2016-07-01 14:39:00",
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
       sum: 25100
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
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/faf41a7b-2e58-11e6-8a84-bae500000051",
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
           "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/90f337d1-3f80-11e6-8a84-bae5000000ac/positions",
           "type": "sales return position",
           "mediaType": "application/json",
           size: 6
           limit: 1000
           offset: 0
         }
       },
       "demand": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/demand/3ebb140e-2e62-11e6-8a84-bae500000127",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
           "type": "demand",
           "mediaType": "application/json"
         }
       },
       "paidSum": 0
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/9b83cb6b-3f80-11e6-8a84-bae5000000bb",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
         "type": "sales return",
         "mediaType": "application/json"
       },
       "id": "9b83cb6b-3f80-11e6-8a84-bae5000000bb",
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
       "updated": "2016-07-01 14:40:27",
       "name": "00002",
       "externalCode": "3ZaZZNCVhYzDgTunfKsTy3",
       "moment": "2016-07-01 14:40:00",
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
       sum: 1100
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
       "salesChannel": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
           "type": "sales channel",
           "mediaType": "application/json"
         }
       },
       "vatEnabled": true
       "vatIncluded": true,
       positions: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/9b83cb6b-3f80-11e6-8a84-bae5000000bb/positions",
           "type": "sales return position",
           "mediaType": "application/json",
           size: 1
           limit: 1000
           offset: 0
         }
       },
       "demand": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/demand/d8937c31-3eb7-11e6-8a84-bae500000066",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
           "type": "demand",
           "mediaType": "application/json"
         }
       },
       "paidSum": 0
     }
   ]
}
```

### Create Sales Return
Required fields when creating a new Sales Return:

+ **organization** - Link to your legal entity in the format [Metadata](../#kladana-json-api-general-info-metadata)
+ **store** - Link to the warehouse in the format [Metadata](../#kladana-json-api-general-info-metadata)
+ **demand** - Link to the shipment from which the return occurred in the format [Metadata](../#kladana-json-api-general-info-metadata), required field only for returns by reason
+ **agent** - Link to the counterparty in the format [Metadata](../#kladana-json-api-general-info-metadata)
The counterparty specified in the request to create a return must match the counterparty specified in the document,
on which the refund is generated.

When creating a return:

+ When creating a return without a reason, the **demand** field does not need to be specified
+ The counterparty in the return and in the document on which it is created must match
+ Currency and legal entity in the return and in the document must also match
+ When creating a return based on another document, the items passed in the **positions** collection must match the items of the base document. You can set the quantity of goods in the item, but not more than in the base document. You cannot transfer items that are not in the base document and change the value of the **price** field.

> An example of creating a new Sales Return.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/salesreturn"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "0003",
             "description": "Angry defective return",
             "code": "k123e21451k",
             "externalCode": "w214t2141f",
             "moment": "2017-11-21 14:37:00",
             "applicable": false
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
                   "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/attributes/43dd9fd7-3f81-11e6-8a84-bae5000000db",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "part broken"
               },
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/attributes/50463893-3f81-11e6-8a84-bae5000000de",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": true
               }
             ],
             "positions": [
               {
                 quantity: 1
                 price: 0.0
                 discount: 0
                 vat: 0
                 "assortment": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/product/7a6f697f-3c64-11e6-8a84-bae500000006",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 }
               }
             ],
             "demand": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/demand/6b967815-3f84-11e6-8a84-bae5000000ea",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
                 "type": "demand",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Sales Return.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/a8b8e1e3-3f85-11e6-8a84-bae50000008d",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
     "type": "sales return",
     "mediaType": "application/json"
   },
   "id": "a8b8e1e3-3f85-11e6-8a84-bae50000008d",
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
   "updated": "2016-07-01 15:16:37",
   "name": "0003",
   "description": "Angry defective return",
   "code": "k123e21451k",
   "externalCode": "w214t2141f",
   "moment": "2017-11-21 14:37:00",
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
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/attributes/43dd9fd7-3f81-11e6-8a84-bae5000000db",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "43dd9fd7-3f81-11e6-8a84-bae5000000db",
       "name": "AttributeName1",
       "type": "string",
       "value": "part broken"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/attributes/50463893-3f81-11e6-8a84-bae5000000de",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "50463893-3f81-11e6-8a84-bae5000000de",
       "name": "AttributeName2",
       "type": "boolean",
       "value": true
     }
   ],
   "vatEnabled": true
   "vatIncluded": true,
   "created": "2007-02-07 17:16:41",
   "printed": true
   "published": true
   positions: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/a8b8e1e3-3f85-11e6-8a84-bae50000008d/positions",
       "type": "sales return position",
       "mediaType": "application/json",
       size: 1
       limit: 1000
       offset: 0
     }
   },
   "demand": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/6b967815-3f84-11e6-8a84-bae5000000ea",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
       "type": "demand",
       "mediaType": "application/json"
     }
   },
   "paidSum": 0
}
```

### Bulk create and update Sales Returns

[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) Sales Returns.
In the body of the request, you need to pass an array containing the JSON representation of the Sales Returns that you want to create or update.
Updated Sales Returns must contain the ID as metadata.

> Example of creating and updating multiple Sales Returns

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/salesreturn"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "0003",
               "description": "Angry defective return",
               "code": "k123e21451k",
               "externalCode": "w214t2141f",
               "moment": "2017-11-21 14:37:00",
               "applicable": false
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
                     "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/attributes/43dd9fd7-3f81-11e6-8a84-bae5000000db",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   "value": "part broken"
                 },
                 {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/attributes/50463893-3f81-11e6-8a84-bae5000000de",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   "value": true
                 }
               ],
               "positions": [
                 {
                   quantity: 1
                   price: 0.0
                   discount: 0
                   vat: 0
                   "assortment": {
                     "meta": {
                       "href": "https://app.kladana.in/api/remap/1.2/entity/product/7a6f697f-3c64-11e6-8a84-bae500000006",
                       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                       "type": "product",
                       "mediaType": "application/json"
                     }
                   }
                 }
               ],
               "demand": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/demand/6b967815-3f84-11e6-8a84-bae5000000ea",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
                   "type": "demand",
                   "mediaType": "application/json"
                 }
               }
             },
             {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/a8b8e1e3-3f85-11e6-8a84-bae50000008d",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
                 "type": "sales return",
                 "mediaType": "application/json"
               },
               "updated": "2016-07-01 15:16:37",
               "name": "00033",
               "description": "Angry return of a defective robot",
               "code": "k12eer3e21rre451k",
               "externalCode": "w214t2141f",
               "moment": "2017-11-21 14:37:00",
               "applicable": true
               state: {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/states/7073b255-3f81-11e6-8a84-bae5000000e3",
                   "type": "state",
                   "mediaType": "application/json"
                 }
               },
               "attributes": [
                 {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/attributes/43dd9fd7-3f81-11e6-8a84-bae5000000db",
                     "type": "attributemetadata",
                     "mediaType": "application/json"
                   },
                   "value": "leg broken off"
                 }
               ]
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the generated and updated Sales Returns.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/a8b8e1e3-3f85-11e6-8a84-bae50000008d",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
       "type": "sales return",
       "mediaType": "application/json"
     },
     "id": "a8b8e1e3-3f85-11e6-8a84-bae50000008d",
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
     "updated": "2016-07-01 15:16:37",
     "name": "0003",
     "description": "Angry defective return",
     "code": "k123e21451k",
     "externalCode": "w214t2141f",
     "moment": "2017-11-21 14:37:00",
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
           "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/attributes/43dd9fd7-3f81-11e6-8a84-bae5000000db",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "43dd9fd7-3f81-11e6-8a84-bae5000000db",
         "name": "AttributeName1",
         "type": "string",
         "value": "part broken"
       },
       {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/attributes/50463893-3f81-11e6-8a84-bae5000000de",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "50463893-3f81-11e6-8a84-bae5000000de",
         "name": "AttributeName2",
         "type": "boolean",
         "value": true
       }
     ],
     "vatEnabled": true
     "vatIncluded": true,
     "created": "2007-02-07 17:16:41",
     "printed": true
     "published": true
     positions: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/a8b8e1e3-3f85-11e6-8a84-bae50000008d/positions",
         "type": "sales return position",
         "mediaType": "application/json",
         size: 1
         limit: 1000
         offset: 0
       }
     },
     "demand": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/6b967815-3f84-11e6-8a84-bae5000000ea",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
         "type": "demand",
         "mediaType": "application/json"
       }
     },
     "paidSum": 0
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/a8b8e1e3-3f85-11e6-8a84-bae50000008d",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
       "type": "sales return",
       "mediaType": "application/json"
     },
     "id": "a8b8e1e3-3f85-11e6-8a84-bae50000008d",
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
     "updated": "2016-07-01 15:27:18",
     "name": "00033",
     "description": "Angry return of a defective robot",
     "code": "k12eer3e21rre451k",
     "externalCode": "w214t2141f",
     "moment": "2017-11-21 14:37:00",
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
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/states/7073b255-3f81-11e6-8a84-bae5000000e3",
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
     "salesChannel": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
         "type": "sales channel",
         "mediaType": "application/json"
       }
     },
     "attributes": [
       {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/attributes/43dd9fd7-3f81-11e6-8a84-bae5000000db",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "43dd9fd7-3f81-11e6-8a84-bae5000000db",
         "name": "AttributeName1",
         "type": "string",
         "value": "leg broken off"
       },
       {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/attributes/50463893-3f81-11e6-8a84-bae5000000de",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "50463893-3f81-11e6-8a84-bae5000000de",
         "name": "AttributeName2",
         "type": "boolean",
         "value": true
       }
     ],
     "vatEnabled": true
     "vatIncluded": true,
     "created": "2007-02-07 17:16:41",
     "printed": true
     "published": true
     positions: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/a8b8e1e3-3f85-11e6-8a84-bae50000008d/positions",
         "type": "sales return position",
         "mediaType": "application/json",
         size: 1
         limit: 1000
         offset: 0
       }
     },
     "demand": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/6b967815-3f84-11e6-8a84-bae5000000ea",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
         "type": "demand",
         "mediaType": "application/json"
       }
     },
     "paidSum": 0
   }
]
```

### Delete Sales Return

**Parameters**

| Parameter | Description |
| ------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Return id. |

> Request to delete the Sales Return with the specified id.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of Sales Return.

### Sales Return bulk deletion

In the body of the request, you need to pass an array containing the JSON metadata of the Sales Returns that you want to remove.


> Bulk deletion request for Sales Returns.

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/salesreturn/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d'[
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b1",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
             "type": "sales return",
             "mediaType": "application/json"
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b2",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
             "type": "sales return",
             "mediaType": "application/json"
         }
       ]'
```

> Successful request. The result is JSON information about deleting Sales Returns.

```json
[
   {
     "info":"Entity 'salesreturn' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'salesreturn' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Sales Returns Metadata
#### Sales Returns Metadata
Request for metadata of Sales Returns. The result is a JSON object including:

| Parameter | Description |
| ------- | --------- |
| **meta** | Link to Metadata of Sales Returns |
| **attributes** | Array of objects additional Sales Returns fields in [Metadata](../#kladana-json-api-general-info-metadata) format |
| **states** | Array of Sales Returns statuses |
| **createShared** | create new Sales Returns labeled "General" |

The structure of a separate object representing the additional field is described in detail in the section [Working with additionaloptional fields](../#kladana-json-api-general-info-additional-fields).

> Metadata of Sales Returns

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional Sales Returns fields.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/attributes/43dd9fd7-3f81-11e6-8a84-bae5000000db",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "43dd9fd7-3f81-11e6-8a84-bae5000000db",
       "name": "AttributeName1",
       "type": "string",
       "required": false
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/attributes/50463893-3f81-11e6-8a84-bae5000000de",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "50463893-3f81-11e6-8a84-bae5000000de",
       "name": "AttributeName2",
       "type": "boolean",
       "required": false
     }
   ],
   "states": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/states/7073ae24-3f81-11e6-8a84-bae5000000e2",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "7073ae24-3f81-11e6-8a84-bae5000000e2",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Open",
       "color": 10066329,
       "stateType": "Regular",
       "entityType": "sales return"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/states/7073b255-3f81-11e6-8a84-bae5000000e3",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "7073b255-3f81-11e6-8a84-bae5000000e3",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Completed",
       "color": 15280409,
       "stateType": "Regular",
       "entityType": "sales return"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/states/7073b5aa-3f81-11e6-8a84-bae5000000e4",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "7073b5aa-3f81-11e6-8a84-bae5000000e4",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Partially Done",
       "color": 15106326,
       "stateType": "Regular",
       "entityType": "sales return"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/states/7073b99b-3f81-11e6-8a84-bae5000000e5",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "7073b99b-3f81-11e6-8a84-bae5000000e5",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "On clearance",
       "color": 34617,
       "stateType": "Regular",
       "entityType": "sales return"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/states/7073bd44-3f81-11e6-8a84-bae5000000e6",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "7073bd44-3f81-11e6-8a84-bae5000000e6",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Designed",
       "color": 9245744,
       "stateType": "Regular",
       "entityType": "sales return"
     }
   ],
   "createShared": false
}
```

### Separate additional field

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id fields. |

> Request for information on a separate additional field.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/attributes/50463893-3f81-11e6-8a84-bae5000000de",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "50463893-3f81-11e6-8a84-bae5000000de",
   "name": "AttributeName1",
   "type": "boolean",
   "required": false
}
```

### Sales Return Template
#### Sales Return Template

A request to get a Sales Return template prefilled with standard values without being associated with any document.

> Create a Sales Return template with an empty request body

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/salesretrn/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d''
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Sales Return.

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
       "type": "sales return position",
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

### Sales Return template based on Shipment

Request for a pre-filled Sales Return template based on the submitted shipment.
In response to the request, a pre-filled Sales Return template will be returned, which
can then be used to create a new return using a POST request.

> Sample request to create a Sales Return template based on a shipment.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/salesreturn/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "demand": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/demand/3ebb140e-2e62-11e6-8a84-bae500000127",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
                 "type": "demand",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Sales Return.

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
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/faf41a7b-2e58-11e6-8a84-bae500000051",
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
   "created": "2007-02-07 17:16:41",
   "printed": true
   "published": true
   positions: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2",
       "type": "sales return position",
       "mediaType": "application/json",
       size: 0
       limit: 1000
       offset: 0
     },
     rows: []
   },
   "vatEnabled": true
   "vatIncluded": true,
   "demand": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/3ebb140e-2e62-11e6-8a84-bae500000127",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
       "type": "demand",
       "mediaType": "application/json"
     }
   },
   "paidSum": 0
}
```

### Sales Return

### Get Sales Return

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Return id. |
 
> Request for a separate Sales Return with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Sales Return with the specified id.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/90f337d1-3f80-11e6-8a84-bae5000000ac",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
     "type": "sales return",
     "mediaType": "application/json"
   },
   "id": "90f337d1-3f80-11e6-8a84-bae5000000ac",
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
   "updated": "2016-07-01 14:40:10",
   "name": "00001",
   "externalCode": "PDJ7P5kVhEWomlQtd67up2",
   "moment": "2016-07-01 14:39:00",
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
   sum: 25100
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
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/faf41a7b-2e58-11e6-8a84-bae500000051",
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
   "salesChannel": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
       "type": "sales channel",
       "mediaType": "application/json"
     }
   },
   "vatEnabled": true
   "vatIncluded": true,
   positions: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/90f337d1-3f80-11e6-8a84-bae5000000ac/positions",
       "type": "sales return position",
       "mediaType": "application/json",
       size: 6
       limit: 1000
       offset: 0
     }
   },
   "demand": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/3ebb140e-2e62-11e6-8a84-bae500000127",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
       "type": "demand",
       "mediaType": "application/json"
     }
   },
   "paidSum": 0
}
```

### Change Sales Return

Update request of Sales Return with the specified id.
In the body of the request, you can specify only those fields that need to be changed for the Sales Return, except for those that
are marked `Read Only` in the description of the [Sales Return attribute](../documents/#transactions-sales-return).
When updating the **organization** field, you must also update the **organizationAccount** field, otherwise an error will occur.
The counterparty must match the counterparty specified in the document for which the refund is generated.

When updating return:

+ The following fields cannot be changed: **agentAccount**, **agent**, **demand**
+ You can not set a currency other than the currency in the document
+ You cannot add items that are not among the items in the document.

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Return id. |

> Sample request to update Sales Return.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "updated": "2016-07-01 15:16:37",
             "name": "00033",
             "description": "Angry return of a defective robot",
             "code": "k12eer3e21rre451k",
             "externalCode": "w214t2141f",
             "moment": "2017-11-21 14:37:00",
             "applicable": true
             state: {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/states/7073b255-3f81-11e6-8a84-bae5000000e3",
                 "type": "state",
                 "mediaType": "application/json"
               }
             },
             "attributes": [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/attributes/43dd9fd7-3f81-11e6-8a84-bae5000000db",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "leg broken off"
               }
             ],
             positions: {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/a8b8e1e3-3f85-11e6-8a84-bae50000008d/positions",
                 "type": "sales return position",
                 "mediaType": "application/json",
                 size: 1
                 limit: 1000
                 offset: 0
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Sales Return.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/a8b8e1e3-3f85-11e6-8a84-bae50000008d",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
     "type": "sales return",
     "mediaType": "application/json"
   },
   "id": "a8b8e1e3-3f85-11e6-8a84-bae50000008d",
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
   "updated": "2016-07-01 15:27:18",
   "name": "00033",
   "description": "Angry return of a defective robot",
   "code": "k12eer3e21rre451k",
   "externalCode": "w214t2141f",
   "moment": "2017-11-21 14:37:00",
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
       "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/states/7073b255-3f81-11e6-8a84-bae5000000e3",
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
   "salesChannel": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
       "type": "sales channel",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/attributes/43dd9fd7-3f81-11e6-8a84-bae5000000db",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "43dd9fd7-3f81-11e6-8a84-bae5000000db",
       "name": "AttributeName1",
       "type": "string",
       "value": "leg broken off"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata/attributes/50463893-3f81-11e6-8a84-bae5000000de",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "50463893-3f81-11e6-8a84-bae5000000de",
       "name": "AttributeName2",
       "type": "boolean",
       "value": true
     }
   ],
   "vatEnabled": true
   "vatIncluded": true,
   "created": "2007-02-07 17:16:41",
   "printed": true
   "published": true
   positions: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/a8b8e1e3-3f85-11e6-8a84-bae50000008d/positions",
       "type": "sales return position",
       "mediaType": "application/json",
       size: 1
       limit: 1000
       offset: 0
     }
   },
   "demand": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/6b967815-3f84-11e6-8a84-bae5000000ea",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
       "type": "demand",
       "mediaType": "application/json"
     }
   },
   "paidSum": 0
}
```

### Sales Return items

Separate resource for managing Sales Return items. With it, you can manage the items of a larger document that has more lines than the limit on the number of lines saved with the document. This limit is 1000. Learn more about limits on the number of document lines and working with large documents [here](../#kladana-json-api-general-info-working-with-transaction-items).

### Get items

Request to get a list of all items of this Sales Return.

| Title | Type | Description |
| ------| ------- |------ |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Sales Return items. |

**Parameters**

| Parameter | Description |
| --------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Return id.|
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Items

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Sales Return items list.

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
     "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions",
     "type": "sales return position",
     "mediaType": "application/json",
     size: 6
     limit: 1000
     offset: 0
   },
   rows: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions/90f3f201-3f80-11e6-8a84-bae5000000ad",
         "type": "sales return position",
         "mediaType": "application/json"
       },
       "id": "90f3f201-3f80-11e6-8a84-bae5000000ad",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 900,
       price: 0.0
       discount: 0
       vat: 0
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/328b0454-2e62-11e6-8a84-bae500000118",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
         }
       },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions/90f3fc5f-3f80-11e6-8a84-bae5000000ae",
         "type": "sales return position",
         "mediaType": "application/json"
       },
       "id": "90f3fc5f-3f80-11e6-8a84-bae5000000ae",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       quantity: 1
       price: 0.0
       discount: 0
       vat: 0
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
         }
       },
       cost: 10
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions/90f41291-3f80-11e6-8a84-bae5000000af",
         "type": "sales return position",
         "mediaType": "application/json"
       },
       "id": "90f41291-3f80-11e6-8a84-bae5000000af",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       quantity: 1
       price: 0.0
       discount: 0
       vat: 0
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/4f785efd-3304-11e6-8a84-bae50001c6c4",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#good/edit?id=392c045c-2842-11e9-ac12-000a00000002"
         }
       },
       cost: 10
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions/90f41a94-3f80-11e6-8a84-bae5000000b0",
         "type": "sales return position",
         "mediaType": "application/json"
       },
       "id": "90f41a94-3f80-11e6-8a84-bae5000000b0",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       quantity: 1
       "price": 8600.0,
       discount: 0
       vat: 0
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/58f32700-3303-11e6-8a84-bae50000853c",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#good/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
         }
       },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions/90f4218b-3f80-11e6-8a84-bae5000000b1",
         "type": "sales return position",
         "mediaType": "application/json"
       },
       "id": "90f4218b-3f80-11e6-8a84-bae5000000b1",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       quantity: 1
       price: 0.0
       discount: 0
       vat: 0
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/67aa1d09-3d19-11e6-8a84-bae50000000b",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#good/edit?id=3bad99f1-2842-11e9-ac12-000c0000005c"
         }
       },
       cost: 10
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions/90f427d1-3f80-11e6-8a84-bae5000000b2",
         "type": "sales return position",
         "mediaType": "application/json"
       },
       "id": "90f427d1-3f80-11e6-8a84-bae5000000b2",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       quantity: 1
       "price": 16500.0,
       discount: 0
       vat: 0
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/0ae4836f-3303-11e6-8a84-bae500000d39",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json","uuidHref": "https://app.kladana.in/app/#good/edit?id=3c3c1618-2842-11e9-ac12-000c0000006f"
         }
       },
       cost: 10
     }
   ]
}

```

### Create Item
Request to create a new item in Sales Return.
For successful creation, the following fields must be specified in the request body:

+ **assortmet** - Link to the product/service/series/modification that the item represents.
You can also specify a field named **service**, **variant** according to
what the indicated item is. You can read more about this field in the description of [Sales Return items](../documents/#transactions-sales-return-sales-returns-sales-return-items).
+ **quantity** - Quantity of the specified item. Must be positive, otherwise an error will occur.
You can create both one and some Sales Return items at the same time. All items created by this request
will be added to the existing ones.
You cannot create items that are different from the items in the document for which the return is being created. Permissible only
difference in **quantity** items (the quantity in the item in the return can be less than or equal to the quantity in the item in the document).

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Return id. |

> Sample request to create items in Sales Return.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "quantity": 900,
               price: 0.0
               discount: 0
               vat: 0
               "assortment": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/product/328b0454-2e62-11e6-8a84-bae500000118",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                   "type": "product",
                   "mediaType": "application/json"
                 }
               },
               cost: 10
             },
             {
               quantity: 1
               price: 0.0
               discount: 0
               vat: 0
               "assortment": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                   "type": "product",
                   "mediaType": "application/json"
                 }
               },
               cost: 10
             },
             {
               quantity: 1
               price: 0.0
               discount: 0
               vat: 0
               "assortment": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/product/4f785efd-3304-11e6-8a84-bae50001c6c4",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                   "type": "product",
                   "mediaType": "application/json"
                 }
               },
               cost: 11
             },
             {
               quantity: 1
               "price": 8600.0,
               discount: 0
               vat: 0
               "assortment": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/product/58f32700-3303-11e6-8a84-bae50000853c",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                   "type": "product",
                   "mediaType": "application/json"
                 }
               },
               cost: 13
             },
             {
               "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
               quantity: 1
               price: 0.0
               discount: 0
               vat: 0
               "assortment": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/product/67aa1d09-3d19-11e6-8a84-bae50000000b",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                   "type": "product",
                   "mediaType": "application/json"
                 }
               },
               cost: 15
             },
             {
               quantity: 1
               "price": 16500.0,
               discount: 0
               vat: 0
               "assortment": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/product/0ae4836f-3303-11e6-8a84-bae500000d39",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                   "type": "product",
                   "mediaType": "application/json"
                 }
               },
               cost: 17
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created items.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions/ea8f2771-3f82-11e6-8a84-bae50000007f",
       "type": "sales return position",
       "mediaType": "application/json"
     },
     "id": "ea8f2771-3f82-11e6-8a84-bae50000007f",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 900,
     price: 0.0
     discount: 0
     vat: 0
     "vatEnabled": false,
     "assortment": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/328b0454-2e62-11e6-8a84-bae500000118",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#good/edit?id=3c3c1618-2842-11e9-ac12-000c0000006f"
       }
     },
     cost: 10
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions/ea8f2f2e-3f82-11e6-8a84-bae500000080",
       "type": "sales return position",
       "mediaType": "application/json"
     },
     "id": "ea8f2f2e-3f82-11e6-8a84-bae500000080",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     quantity: 1
     price: 0.0
     discount: 0
     vat: 0
     "vatEnabled": false,
     "assortment": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#good/edit?id=3bad99f1-2842-11e9-ac12-000c0000005c"
       }
     },
     cost: 10
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions/ea8f35ca-3f82-11e6-8a84-bae500000081",
       "type": "sales return position",
       "mediaType": "application/json"
     },
     "id": "ea8f35ca-3f82-11e6-8a84-bae500000081",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     quantity: 1
     price: 0.0
     discount: 0
     vat: 0
     "vatEnabled": false,
     "assortment": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/4f785efd-3304-11e6-8a84-bae50001c6c4",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#good/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
       }
     },
     cost: 11
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions/ea8f3bce-3f82-11e6-8a84-bae500000082",
       "type": "sales return position",
       "mediaType": "application/json"
     },
     "id": "ea8f3bce-3f82-11e6-8a84-bae500000082",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     quantity: 1
     "price": 8600.0,
     discount: 0
     vat: 0
     "vatEnabled": false,
     "assortment": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/58f32700-3303-11e6-8a84-bae50000853c",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#good/edit?id=392c045c-2842-11e9-ac12-000a00000002"
       }
     },
     cost: 13
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions/ea8f41a9-3f82-11e6-8a84-bae500000083",
       "type": "sales return position",
       "mediaType": "application/json"
     },
     "id": "ea8f41a9-3f82-11e6-8a84-bae500000083",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     quantity: 1
     price: 0.0
     discount: 0
     vat: 0
     "vatEnabled": false,
     "assortment": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/67aa1d09-3d19-11e6-8a84-bae50000000b",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
       }
     },
     cost: 15
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions/ea8f477b-3f82-11e6-8a84-bae500000084",
       "type": "sales return position",
       "mediaType": "application/json"
     },
     "id": "ea8f477b-3f82-11e6-8a84-bae500000084",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     quantity: 1
     "price": 16500.0,
     discount: 0
     vat: 0
     "vatEnabled": false,
     "assortment": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/0ae4836f-3303-11e6-8a84-bae500000d39",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
       }
     },
     cost: 17
   }
]
```

### Sales Return Items

### Get Item
 
**Parameters**

| Parameter | Description |
| -------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Return id. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Sales Return item id. |

> Request to receive a separate Sales Return items with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a single Sales Return item.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006",
     "type": "sales return position",
     "mediaType": "application/json"
   },
   "id": "34f6344f-015e-11e6-9464-e4de0000006",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   quantity: 1
   price: 0.0
   discount: 0
   vat: 0
   "vatEnabled": false,
   "assortment": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/product/4f785efd-3304-11e6-8a84-bae50001c6c4",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
     }
   },
   cost: 10
}
```

### Change Item

Request to update an individual Sales Return item.
When you update a line item in a return, you can only change the quantity of that line item.
Moreover, this number must be within , where n is the number of the item in the document for which the return is created.

**Parameters**

| Parameter | Description |
| ------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Return id. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Sales Return item id. |

> An example of a request to update a line item in Sales Return.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             quantity: 1
             "price": 16500.0,
             discount: 0
             vat: 0
             "assortment": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/product/0ae4836f-3303-11e6-8a84-bae500000d39",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                 "type": "product",
                 "mediaType": "application/json"
               }
             },
             cost: 100
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Sales Return item.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
     "type": "sales return position",
     "mediaType": "application/json"
   },
   "id": "34f6344f-015e-11e6-9464-e4de0000006c",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   quantity: 1
   "price": 16500.0,
   discount: 0
   vat: 0
   "vatEnabled": false,
   "assortment": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/product/0ae4836f-3303-11e6-8a84-bae500000d39",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
     }
   },
   cost: 100
}
```

### Delete Item

**Parameters**

| Parameter | Description |
| ------------ | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Return id. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Sales Return item id. |
 
> Request to delete an individual Sales Return item with the specified id.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/salesreturn/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of the Sales Return item.
