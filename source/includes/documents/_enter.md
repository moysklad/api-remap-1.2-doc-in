## Stock Adjustment

Using the JSON API, you can create and update information about Stock Adjustments, request lists of Stock Adjustments, and information on individual Stock Adjustments. Stock Adjustment items can be managed both as part of a separate Stock Adjustment, and separately - using special resources for managing Stock Adjustment items. The entity code for Stock Adjustments in the JSON API is the **enter** keyword. Learn more about [Stock Adjustment](https://kladana.zendesk.com/hc/en-us/articles/4452352385553-Stock-Adjustment).

### Stock Adjustment
#### Entity attributes

| Title | Type                                               | Filtration | Description |
|---------|----------------------------------------------------| -------- |------|
| **accountId** | UUID                                               | `=` `!=` | Account ID<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **applicable** | Boolean                                            | `=` `!=` | Postmark<br>`+Required when replying` `+Change-handler` `+Update-provider` |
| **attributes** | Array(Object)                                      | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields) <br> `+Change-handler` `+Update-provider` |
| **code** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Stock Adjustment Code |
| **created** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Creation date<br>`+Required for response` `+Read-only` `+Change-handler` |
| **deleted** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Time of last deletion of Stock Adjustment<br>`+Read Only` |
| **description** | String(4096)                                       | `=` `!=` `~` `~=` `=~` | Stock Adjustment Comment <br> `+Change-handler` `+Update-provider` |
| **externalCode** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Stock Adjustment External Code<br>`+Required when replying` `+Change-handler` |
| **files** | MetaArray                                          | | [Files](../dictionaries/#entities-files) array metadata (Maximum number of files - 100)<br>`+Requiredwhen answering ` `+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID                                               | `=` `!=` | Stock Adjustment ID<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Stock Adjustment Metadata<br>`+Required when replying` `+Change-handler` |
| **moment** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Document date<br>`+Required for response` `+Change-handler` `+Update-provider` |
| **name** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Stock Adjustment Number<br>`+Required when replying` `+Change-handler` `+Update-provider` |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Legal entity metadata<br>`+Required when responding` `+Expand` `+Required when creating` `+Change-handler` `+Update-provider` |
| **overhead** | Object                                             | | Overhead expenses. [Learn more](../documents/#transactions-stock-adjustment-stock-adjustment-overhead-expenses). If Stock Adjustment items are not set, then overhead expenses cannot be set<br>`+Update-provider` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Required when replying` `+Expand` |
| **positions** | MetaArray                                          | | Stock Adjustment items matadata<br>`+Required when replying` `+Expand` `+Change-handler` `+Update-provider` |
| **printed** | Boolean                                            | `=` `!=` | Is the document printed<br>`+Required when responding` `+Read Only` |
| **project** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Project metadata<br>`+Expand` `+Change-handler` `+Update-provider` |
| **published** | Boolean                                            | `=` `!=` | Is the document publishednt<br>`+Required when replying` `+Read-only` |
| **rate** | Object                                             | | Currency. [Learn more](../documents/#transactions-currency-in-transactions)<br>`+Required when replying` `+Change-handler` `+Update-provider` |
| **shared** | Boolean                                            | `=` `!=` | Sharing<br>`+Required when replying` |
| **state** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Stock Adjustment status metadata<br>`+Expand` `+Change-handler` `+Update-provider` |
| **store** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Warehouse metadata<br>`+Required when responding` `+Expand` `+Required when creating` `+Change-handler` `+Update-provider` |
| **sum** | Int                                                | `=` `!=` `<` `>` `<=` `>=` | Stock Adjustment Total in paise<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **syncId** | UUID                                               | `=` `!=` | Synchronization ID. After filling it is not available for change |
| **updated** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Last updated time of Stock Adjustment<br>`+Required when replying` `+Read-only` `+Change-handler` |

#### Overhead Expenses

Description of overhead expenses fields.

| Title | Type | Description |
|---------|-------|------- |
| **sum** | Int | Stock Adjustment Total in paise<br>`+Required when replying` `+Update-provider` |
| **distribution** | Enum | Overhead expenses distribution `[weight, volume, price]` -> `[by weight, by volume, by price]`<br>`+Required when replying` `+Update-provider` |

#### Stock Adjustment Items

Stock Adjustment items is a list of products and product variants. Stock Adjustment item object contains the following fields:

| Title | Type                                               | Description |
|---------|----------------------------------------------------|--------|
| **accountId** | UUID                                               | Account ID<br>`+Required forvete` `+Read Only` `+Change-handler` |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of a product/service/series/product variant, which is an item<br>`+Required when replying` `+Expand` `+Change-handler` `+Update-provider` |
| **country** | [Meta](../#kladana-json-api-general-info-metadata) | Country metadata<br>`+Expand` |
| **id** | UUID                                               | Item ID<br>`+Required for response` `+Read-only` `+Change-handler` |
| **overhead** | Int                                                | Overhead expenses. [Learn more](../documents/#transactions-stock-adjustment-stock-adjustment-overhead-expenses). If Stock Adjustment items are not set, then no overhead expenses can be set<br>`+Required in response` `+Read-Only` |
| **pack** | Object                                             | Product packaging. [Learn more](../dictionaries/#entities-product-products-nested-entity-attributes-product-packaging) <br> `+Change-handler` `+Update-provider` |
| **price** | Float                                              | Product/service price in paise<br>`+Required when replying` `+Change-handler` `+Update-provider` |
| **quantity** | Int                                                | The number of gproducts/services of this type in the item. If the item is a product that has tracking by serial numbers enabled, then the value in the field will always be equal to the number of serial numbers for this item in the transaction.<br>`+Required when replying` `+Change-handler` `+Update-provider ` |
| **reason** | String(255)                                        | Reason of stock adjustment of the item|
| **slot** | [Meta](../#kladana-json-api-general-info-metadata) | Bin in the warehouse. [Learn more](../dictionaries/#entities-warehouse-storage-bins)<br>`+Expand` |
| **things** | Object(String)                                     | Serial numbers. The value of the attribute is ignored if the item item is not in serial accounting. Otherwise, the number of items in the item will be equal to the number of serial numbers passed in the attribute value. `+Change-handler` |

You can work with items using [special resources for managing Stock Adjustment items](../documents/#transactions-stock-adjustment),
and also as part of a separate Stock Adjustment. When working as part of a separate Stock Adjustment,
you can send requests to create a separate Stock Adjustments included in the request body
an array of Stock Adjustment items. If the number of items exceeds the maximum allowed, then for
further replenishment of items will need to work with a special resource "Stock Adjustment Items".

Also, when working as part of a separate Stock Adjustment, you can send requests to update the list of items
with an array of Stock Adjustment items included in the request body. It is important to remember that the collection of items will
be perceived as "All Stock Aadjustment items" and completely replace the existing collection when updating the object - redundant
items will be deleted, new ones added, existing ones changed.

Learn more about [Stock Adjustment additional fields](../#kladana-json-api-general-info-additional-fields).


### Get Stock Adjustments

All Stock Adjustments Request for this account.
Result: JSON object including fields:

| Title | Type | Description |
|---------|-------|------ |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Stock Adjustments. |

**Parameters**

| Parameter | Description |
|---------|-------|
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** | `string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Receive Stock Adjustments

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/enter"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Stock Adjustments.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/enter",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata",
     "type": "enter",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/enter/2e12d827-5338-11e6-8a84-bae50000008e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata",
         "type": "enter",
         "mediaType": "application/json"
       },
       "id": "2e12d827-5338-11e6-8a84-bae50000008e",
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
       "updated": "2016-07-26 16:52:23",
       "name": "00002",
       "externalCode": "xmlPt1lUie1p18VedA1M-3",
       "moment": "2016-07-26 16:51:00",
       "applicable": true,
       "created": "2007-02-07 17:16:41",
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
       "sum": 26400,
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
           "href": "https://api.kladana.com/api/remap/1.2/entity/enter/2e12d827-5338-11e6-8a84-bae50000008e/positions",
           "type": "enterposition",
           "mediaType": "application/json",
           "size": 5,
           "limit": 1000,
           "offset": 0
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/enter/bf19f3fe-4f28-11e6-8a84-bae50000006d",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata",
         "type": "enter",
         "mediaType": "application/json"
       },
       "id": "bf19f3fe-4f28-11e6-8a84-bae50000006d",
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
       "updated": "2016-07-21 12:51:50",
       "name": "00001",
       "externalCode": "9CC4OgVhhJwPTl3289w0q1",
       "moment": "2016-07-21 12:51:00",
       "applicable": true,
       "created": "2007-02-07 17:16:41",
       "printed": true,
       "published": true,
       "sum": 13200,
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
           "href": "https://api.kladana.com/api/remap/1.2/entity/enter/bf19f3fe-4f28-11e6-8a84-bae50000006d/positions",
           "type": "enterposition",
           "mediaType": "application/json",
           "size": 1,
           "limit": 1000,
           "offset": 0
         }
       }
     }
   ]
}
```

### Create Stock Adjustments

Request to create a new Stock Adjustment.
Mandatory fields to create:

| Title | Type | Description |
|---------|-------|------- |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | Legal entity metadata |
| **store** | [Meta](../#kladana-json-api-general-info-metadata) | Warehouse metadata |

> An example of creating a new Stock Adjustment with a request body containing only the required fields.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/enter"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "enter100",
             "externalCode": "34981sawfa42kek",
             "moment": "2016-06-21 16:56:52",
             "applicable": true,
             "sum": 51241240,
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
                 "href": "https://api.kladana.com/api/remap/1.2/entity/store/e94a6e65-4f64-11e6-8a84-bae500000066",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                 "type": "store",
                 "mediaType": "application/json"
               }
             },
             "positions": [
               {
                 "quantity": 1,
                 "price": 13200.0,
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/product/328b0454-2e62-11e6-8a84-bae500000118",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 },
                 "overhead": 0,
               },
               {
                 "quantity": 1,
                 "price": 13200.0,
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/product/328b0454-2e62-11e6-8a84-bae500000118",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 },
                 "reason": "ABYR",
                 "overhead": 0,
               },
               {
                 "quantity": 3,
                 "price": 333444.0,
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a83c422-3c64-11e6-8a84-bae500000012",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                     "type": "variant",
                     "mediaType": "application/json"
                   }
                 },
                 "reason": "Updated reason",
                 "overhead": 0,
               }
             ],
             "attributes": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9150cd-5338-11e6-8a84-bae50000009b",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "AttributeValue1"
               },
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9158b2-5338-11e6-8a84-bae50000009c",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": 404,
               }
             ],
             "overhead": {
               "sum": 40400,
               "distribution": "weight"
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Stock Adjustment.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7cfff21a-533b-11e6-8a84-bae50000001f",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata",
     "type": "enter",
     "mediaType": "application/json"
   },
   "id": "7cfff21a-533b-11e6-8a84-bae50000001f",
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
   "updated": "2016-07-26 17:16:04",
   "name": "enter100",
   "externalCode": "34981sawfa42kek",
   "moment": "2016-06-21 16:56:52",
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
   "sum": 1026732,
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/e94a6e65-4f64-11e6-8a84-bae500000066",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9150cd-5338-11e6-8a84-bae50000009b",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "6a9150cd-5338-11e6-8a84-bae50000009b",
       "name": "AttributeName1",
       "type": "string",
       "value": "AttributeValue1"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9158b2-5338-11e6-8a84-bae50000009c",
         "type":"attributemetadata",
         "mediaType": "application/json"
       },
       "id": "6a9158b2-5338-11e6-8a84-bae50000009c",
       "name": "AttributeName2",
       "type": "long",
       "value": 404
     }
   ],
   "created": "2007-02-07 17:16:41",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7cfff21a-533b-11e6-8a84-bae50000001f/positions",
       "type": "enterposition",
       "mediaType": "application/json",
       "size": 3,
       "limit": 1000,
       "offset": 0
     }
   },
   "overhead": {
     "sum": 40400,
     "distribution": "weight"
   }
}
```

### Stock Adjustments bulk creating and update

[Stock Adjustments bulk creating and update](../#kladana-json-api-general-info-create-and-update-multiple-objects).
In the body of the request, you need to pass an array containing the JSON representation of Stock Adjustments that you want to create or update.
Updated Stock Adjustments must contain the ID as metadata.

> Example of creating and updating multiple Stock Adjustments

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/enter"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
            {
                "name": "enter100",
                "externalCode": "34981sawfa42kek",
                "moment": "2016-06-21 16:56:52",
                "applicable": true,
                "sum": 51241240,
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
                        "href": "https://api.kladana.com/api/remap/1.2/entity/store/e94a6e65-4f64-11e6-8a84-bae500000066",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                        "type": "store",
                        "mediaType": "application/json"
                    }
                },
                "positions": [
                    {
                        "quantity": 1,
                        "price": 13200.0,
                        "assortment": {
                            "meta": {
                                "href": "https://api.kladana.com/api/remap/1.2/entity/product/328b0454-2e62-11e6-8a84-bae500000118",
                                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                                "type": "product",
                                "mediaType": "application/json"
                            }
                        },
                        "overhead": 0
                    },
                    {
                        "quantity": 1,
                        "price": 13200.0,
                        "assortment": {
                            "meta": {
                                "href": "https://api.kladana.com/api/remap/1.2/entity/product/328b0454-2e62-11e6-8a84-bae500000118",
                                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                                "type": "product",
                                "mediaType": "application/json"
                            }
                        },
                        "reason": "ABYR",
                        "overhead": 0
                    },
                    {
                        "quantity": 3,
                        "price": 333444.0,
                        "assortment": {
                            "meta": {
                                "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a83c422-3c64-11e6-8a84-bae500000012",
                                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                                "type": "variant",
                                "mediaType": "application/json"
                            }
                        },
                        "reason": "Updated reason",
                        "overhead": 0
                    }
                ],
                "attributes": [
                    {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9150cd-5338-11e6-8a84-bae50000009b",
                            "type": "attributemetadata",
                            "mediaType": "application/json"
                        },
                        "value": "AttributeValue1"
                    },
                    {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9158b2-5338-11e6-8a84-bae50000009c",
                            "type": "attributemetadata",
                            "mediaType": "application/json"
                        },
                        "value": 404
                    }
                ],
                "overhead": {
                    "sum": 40400,
                    "distribution": "weight"
                }
            },
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7cfff21a-533b-11e6-8a84-bae50000001f",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata",
                    "type": "enter",
                    "mediaType": "application/json"
                },
                "name": "xX0enter0Xx",
                "externalCode": "21721bddSAKDAbw21eh",
                "moment": "2012-12-21 13:46:22",
                "applicable": false,
                "sum": 333,
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
                        "href": "https://api.kladana.com/api/remap/1.2/entity/store/e94a6e65-4f64-11e6-8a84-bae500000066",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                        "type": "store",
                        "mediaType": "application/json"
                    }
                },
                "attributes": [
                    {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9150cd-5338-11e6-8a84-bae50000009b",
                            "type": "attributemetadata",
                            "mediaType": "application/json"
                        },
                        "value": "AttributeValue2"
                    },
                    {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9158b2-5338-11e6-8a84-bae50000009c",
                            "type": "attributemetadata",
                            "mediaType": "application/json"
                        },
                        "value": 501
                    }
                ],
                "positions": [],
                "overhead": {
                    "sum": 40400,
                    "distribution": "price"
                }
            }
          ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Stock Adjustments.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7cfff21a-533b-11e6-8a84-bae50000001f",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata",
       "type": "enter",
       "mediaType": "application/json"
     },
     "id": "7cfff21a-533b-11e6-8a84-bae50000001f",
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
     "updated": "2016-07-26 17:16:04",
     "name": "enter100",
     "externalCode": "34981sawfa42kek",
     "moment": "2016-06-21 16:56:52",
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
     "sum": 1026732,
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/e94a6e65-4f64-11e6-8a84-bae500000066",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       }
     },
     "attributes": [
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9150cd-5338-11e6-8a84-bae50000009b",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "6a9150cd-5338-11e6-8a84-bae50000009b",
         "name": "AttributeName1",
         "type": "string",
         "value":"AttributeValue1"
       },
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9158b2-5338-11e6-8a84-bae50000009c",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "6a9158b2-5338-11e6-8a84-bae50000009c",
         "name": "AttributeName2",
         "type": "long",
         "value": 404
       }
     ],
     "created": "2007-02-07 17:16:41",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7cfff21a-533b-11e6-8a84-bae50000001f/positions",
         "type": "enterposition",
         "mediaType": "application/json",
         "size": 3,
         "limit": 1000,
         "offset": 0
       }
     },
     "overhead": {
       "sum": 40400,
       "distribution": "weight"
     }
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7cfff21a-533b-11e6-8a84-bae50000001f",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata",
       "type": "enter",
       "mediaType": "application/json"
     },
     "id": "7cfff21a-533b-11e6-8a84-bae50000001f",
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
     "updated": "2016-07-26 17:21:18",
     "name": "xX0enter0Xx",
     "externalCode": "21721bddSAKDAbw21eh",
     "moment": "2012-12-21 12:46:22",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/e94a6e65-4f64-11e6-8a84-bae500000066",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       }
     },
     "attributes": [
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9150cd-5338-11e6-8a84-bae50000009b",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "6a9150cd-5338-11e6-8a84-bae50000009b",
         "name": "AttributeName1",
         "type": "string",
         "value": "AttributeValue2"
       },
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9158b2-5338-11e6-8a84-bae50000009c",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "6a9158b2-5338-11e6-8a84-bae50000009c",
         "name": "AttributeName2",
         "type": "long",
         "value": 501
       }
     ],
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7cfff21a-533b-11e6-8a84-bae50000001f/positions",
         "type": "enterposition",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     }
   }
]
```

### Remove Stock Adjustment

**Parameters**

| Parameter | Description |
|---------|-------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Stock Adjustment id. |

> Request to remove the Stock Adjustment with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful removal of Stock Adjustment.

### Stock Adjustments bulk deletion

In the body of the request, you need to pass an array,containing the JSON Stock Adjustment metadata you want to remove.


> Request Stock Adjustment bulk deletion.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/enter/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b1",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata",
                "type": "enter",
                "mediaType": "application/json"
            }
        },
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b2",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata",
                "type": "enter",
                "mediaType": "application/json"
            }
        }
      ]'
```

> Successful request. The result is JSON information about the removal of Stock Adjustments.

```json
[
   {
     "info":"Entity 'enter' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'enter' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Stock Adjustments Metadata
#### Stock Adjustments Metadata

Request to get of Stock Adjustments metadata. The result is a JSON object including:

| Parameter | Description |
|---------|-------|
| **meta** | Link to Stock Adjustment metadata |
| **attributes** | Array of additional fields of Stock Adjustment in [metadata](../#kladana-json-api-general-info-metadata) format |
| **states** | Array of statuses of Stock Adjustments |
| **createShared** | create new Stock Adjustments labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Stock Adjustment Metadata

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/enter/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Stock Adjustments metadata.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9150cd-5338-11e6-8a84-bae50000009b",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "6a9150cd-5338-11e6-8a84-bae50000009b",
       "name": "AttributeName1",
       "type": "boolean",
       "required": false
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9158b2-5338-11e6-8a84-bae50000009c",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "6a9158b2-5338-11e6-8a84-bae50000009c",
       "name": "AttributeName2",
       "type": "long",
       "required": false
     }
   ],
   "createShared": false
}

```

### Separate additional field

**Parameters**

| Parameter | Description |
|---------|-------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Field ID. |
 
#### Separate additional field
 
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9150cd-5338-11e6-8a84-bae50000009b",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "6a9150cd-5338-11e6-8a84-bae50000009b",
   "name": "AttributeName1",
   "type": "string",
   "required": false
}
```

###Stock Adjustment

### Get Stock Adjustment

**Parameters**

| Parameter | Description |
|---------|-------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Stock Adjustment id. |
 
> Request for a separate Stock Adjustments with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of Stock Adjustment.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/enter/2e12d827-5338-11e6-8a84-bae50000008e",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata",
     "type": "enter",
     "mediaType": "application/json"
   },
   "id": "2e12d827-5338-11e6-8a84-bae50000008e",
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
   "updated": "2016-07-26 16:52:23",
   "name": "00002",
   "externalCode": "xmlPt1lUie1p18VedA1M-3",
   "moment": "2016-07-26 16:51:00",
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
   "sum": 26400,
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/enter/2e12d827-5338-11e6-8a84-bae50000008e/positions",
       "type": "enterposition",
       "mediaType": "application/json",
       "size": 5,
       "limit": 1000,
       "offset": 0
     }
   }
}
```

### Change Stock Adjustment

Request to update of Stock Adjustment with specified id.

**Parameters**

| Parameter | Description |
|---------|-------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Stock Adjustment id. |

> An example of a request to update a single Stock Adjustment.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "xX0enter0Xx",
            "externalCode": "21721bddSAKDAbw21eh",
            "moment": "2012-12-21 13:46:22",
            "applicable": false,
            "sum": 333,
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
                    "href": "https://api.kladana.com/api/remap/1.2/entity/store/e94a6e65-4f64-11e6-8a84-bae500000066",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                    "type": "store",
                    "mediaType": "application/json"
                }
            },
            "attributes": [
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9150cd-5338-11e6-8a84-bae50000009b",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "value": "AttributeValue1"
                },
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9158b2-5338-11e6-8a84-bae50000009c",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "value": 501
                }
            ],
            "positions": [],
            "overhead": {
                "sum": 40400,
                "distribution": "price"
            }
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Stock Adjustment.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7cfff21a-533b-11e6-8a84-bae50000001f",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata",
     "type": "enter",
     "mediaType": "application/json"
   },
   "id": "7cfff21a-533b-11e6-8a84-bae50000001f",
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
   "updated": "2016-07-26 17:21:18",
   "name": "xX0enter0Xx",
   "externalCode": "21721bddSAKDAbw21eh",
   "moment": "2012-12-21 12:46:22",
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/e94a6e65-4f64-11e6-8a84-bae500000066",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9150cd-5338-11e6-8a84-bae50000009b",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "6a9150cd-5338-11e6-8a84-bae50000009b",
       "name": "AttributeName1",
       "type": "string",
       "value": "AttributeValue1"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/enter/metadata/attributes/6a9158b2-5338-11e6-8a84-bae50000009c",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "6a9158b2-5338-11e6-8a84-bae50000009c",
       "name": "AttributeName2",
       "type": "long",
       "value": 501
     }
   ],
   "created": "2007-02-07 17:16:41",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7cfff21a-533b-11e6-8a84-bae50000001f/positions",
       "type": "enterposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   }
}
```

### Stock Adjustment Items

A separate resource for managing Stock Adjustment items. With it, you can manage the items of a larger document that has more lines than the limit on the number of lines saved with the document. This limit is 1000. You can read more about limits on the number of document lines and working with large documents [here](../#kladana-json-api-general-info-working-with-transaction-items).
  
### Get Stock Adjustment Items

Request to get a list of all items of the given Stock Adjustment.

| Title | Type | Description |
|---------|-------|---------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the Stock Adjustment items. |

**Parameters**

| Parameter | Description |
| ---------| ----- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Stock Adjustment id. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Stock Adjustment items

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b19/positions"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of items of a single Stock Adjustment.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b19/positions",
     "type": "enterposition",
     "mediaType": "application/json",
     "size": 5,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b19/positions/2e12e9aa-5338-11e6-8a84-bae50000008f",
         "type": "enterposition",
         "mediaType": "application/json"
       },
       "id": "2e12e9aa-5338-11e6-8a84-bae50000008f",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 1,
       "price": 0.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/4f785efd-3304-11e6-8a84-bae50001c6c4",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b19/positions/2e12f062-5338-11e6-8a84-bae500000090",
         "type": "enterposition",
         "mediaType": "application/json"
       },
       "id": "2e12f062-5338-11e6-8a84-bae500000090",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 1,
       "price": 0.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/00de5b31-3303-11e6-8a84-bae500000344",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
         }
       },
       "reason": "REQUIRED",
       "overhead": 0
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b19/positions/2e12f5d2-5338-11e6-8a84-bae500000091",
         "type": "enterposition",
         "mediaType": "application/json"
       },
       "id": "2e12f5d2-5338-11e6-8a84-bae500000091",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 1,
       "price": 0.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/0572d2fc-3303-11e6-8a84-bae500000842",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=392c045c-2842-11e9-ac12-000a00000002"
         }
       },
       "overhead": 0
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b19/positions/2e12fb31-5338-11e6-8a84-bae500000092",
         "type": "enterposition",
         "mediaType": "application/json"
       },
       "id": "2e12fb31-5338-11e6-8a84-bae500000092",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 1,
       "price": 13200.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/328b0454-2e62-11e6-8a84-bae500000118",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
         }
       },
       "overhead": 0
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b19/positions/2e1300c8-5338-11e6-8a84-bae500000093",
         "type": "enterposition",
         "mediaType": "application/json"
       },
       "id": "2e1300c8-5338-11e6-8a84-bae500000093",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 1,
       "price": 13200.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/328b0454-2e62-11e6-8a84-bae500000118",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=3bad99f1-2842-11e9-ac12-000c0000005c"
         }
       }
     }
   ]
}
```

### Create Stock Adjustment item

Request to create a new item in the Stock Adjustment. For successful creation, the following fields must be specified in the request body:

+ **assortment** - Link to the product/service/series/product variant that the item represents.
You can also specify a field named **service** or **variant** depending on what the indicated item is. Learn more about this field in the description of [Stock Adjustment items](../documents/#transactions-stock-adjustment-stock-adjustment-stock-adjustment-items).
+ **quantity** - Quantity of the specified item. It must be positive, otherwise an error occurs.
You can create both one and some Stock Adjustment items at the same time. All items created by this request will be added to the existing ones.

**Parameters**

| Parameter | Description |
|---------|-------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Stock Adjustment id. |

> An example of creating items in Stock Adjustment.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b19/positions"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "quantity": 103,
               "price": 566230.0,
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a83c422-3c64-11e6-8a84-bae500000012",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                   "type": "variant",
                   "mediaType": "application/json"
                 }
               },
               "reason": "Urgent need",
               "overhead": 305
             },
             {
               "quantity": 13,
               "price": 12560.0,
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                   "type": "variant",
                   "mediaType": "application/json"
                 }
               },
               "reason": "Required item",
               "overhead": 50607080
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created item of a single Stock Adjustment.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b19/positions/7ffb0be4-5339-11e6-8a84-bae500000016",
       "type": "enterposition",
       "mediaType": "application/json"
     },
     "id": "7ffb0be4-5339-11e6-8a84-bae500000016",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 103,
     "price": 566230.0,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a83c422-3c64-11e6-8a84-bae500000012",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3bad99f1-2842-11e9-ac12-000c0000005c"
       }
     },
     "reason": "Urgent need",
     "overhead": 0
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b19/positions/7ffb1271-5339-11e6-8a84-bae500000017",
       "type": "enterposition",
       "mediaType": "application/json"
     },
     "id": "7ffb1271-5339-11e6-8a84-bae500000017",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 13,
     "price": 12560.0,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
       }
     },
     "reason": "Required item",
     "overhead": 0
   }
]
```

### Stock Adjustment Item
 
### Get item
 
**Parameters**

| Parameter | Description |
|---------|-------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Stock Adjustment id. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b20* item id. |

> Request for a separate Stock Adjustment item with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a single Stock Adjustment item.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20",
     "type": "enterposition",
     "mediaType": "application/json"
   },
   "id": "7944ef04-f831-11e5-7a69-971500188b20",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "quantity": 1,
   "price": 0.0,
   "assortment": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/00de5b31-3303-11e6-8a84-bae500000344",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#good/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
     }
   },
   "reason": "REQUIRED",
   "overhead": 0
}
```

### Change item

Request to update an individual Stock Adjustment item. There is no way to update the item required fields in the body of the request. Only the ones you want to update.
 
  **Parameters**
 
| Parameter | Description |
|---------|-------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Stock Adjustment id. |
| **itemID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b20* item id. |
 
> An example of a request to update a line item in Stock Adjustment.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "quantity": 3,
             "price": 333444.0,
             "assortment": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a83c422-3c64-11e6-8a84-bae500000012",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                 "type": "variant",
                 "mediaType": "application/json"
               }
             },
             "reason": "Updated reason"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Stock Adjustment item.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20",
     "type": "enterposition",
     "mediaType": "application/json"
   },
   "id": "7944ef04-f831-11e5-7a69-971500188b20",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "quantity": 3,
   "price": 333444.0,
   "assortment": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a83c422-3c64-11e6-8a84-bae500000012",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
       "type": "variant",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
     }
   },
   "reason": "Updated reason",
   "overhead": 0
}
```

### Delete item

**Parameters**

| Parameter | Description |
|---------|-------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Stock Adjustment id. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b20* item id. |

> Request to remove a single Stock Adjustment item with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/enter/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful removal of Stock Adjustment item.
