## Transfer

Using the JSON API, you can create and update information about Transfers, request lists of Transfers, and information on individual Transfers. Transfer items can be managed both as part of a separate Transfer, and separately - with the help of special resources for managing Transfer items. The entity code for Transfer in the JSON API is the **move** keyword.

### Transfer
#### Entity attributes

| Title     | Type    | Filtration   | Description   |
| --------- | ------- | ---------- | --------------- |
| **accountId**     | UUID    | `=` `!=`  | Account ID<br>`+Required when replying``+Read-only``+Change-handler`  |
| **applicable**    | Boolean   | `=` `!=`  | Postmark<br>`+Required for response``+Change-handler` `+Update-provider`  |
| **attributes**    | Array(Object)   | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields)<br> `+Change-handler` `+Update-provider`             |
| **code**          | String(255)                                        | `=` `!=` `~` `~=` `=~`                                                                                                                                      | Transfer Code                                                                                                                                                                       |
| **created**       | DateTime                                           | `=` `!=` `<` `>` `<=` `>=`                                                                                                                                  | Creation date<br>`+Required when replying` `+Read-only``+Change-handler`                                                                                                            |
| **deleted**       | DateTime                                           | `=` `!=` `<` `>` `<=` `>=`                                                                                                                                  | Moments<br>`+Read Only`                                                                                                                                                             |
**demand** | [Meta](../#kladana-json-api-general-info-metadata) | | Metadata of Shipment associated with the Transfer<br>`+Read-only` `+Expand` |
| **description**   | String(4096)                                       | `=` `!=` `~` `~=` `=~`                                                                                                                                      | Transfer Comment<br>`+Change-handler` `+Update-provider`                                                                                                                            |
| **externalCode**  | String(255)                                        | `=` `!=` `~` `~=` `=~`                                                                                                                                      | Transfer External Code<br>`+Required on response``+Change-handler`                                                                                                                  |
| **files**         | MetaArray                                          |                                                                                                                                                             | [Files](../dictionaries/#entities-files) array metadata (Maximum number of files - 100)<br>`+Required when replying` `+Expand`                                                    |
| **group**         | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                                                                                                                                                    | Employee's department<br>`+Required when replying` `+Expand`                                                                                                                        |
| **id**            | UUID                                               | `=` `!=`                                                                                                                                                    | Transfer ID<br>`+Required for response` `+Read-only``+Change-handler`                                                                                                               |
| **internalOrder** | [Meta](../#kladana-json-api-general-info-metadata) |                                                                                                                                                             | Metadata of the Internal order associated with the Transfer<br>`+Expand`                                                                                                            |
| **customerOrder** | [Meta](../#kladana-json-api-general-info-metadata) |                                                                                                                                                             | Metadata of the Sales Order associated with the Transfer<br>`+Expand`                                                                                                               |
| **meta**          | [Meta](../#kladana-json-api-general-info-metadata) |                                                                                                                                                             | Transfer Metadata<br>`+Required on Response``+Change-handler`                                                                                                                       |
| **moment**        | DateTime                                           | `=` `!=` `<` `>` `<=` `>=`                                                                                                                                  | Document date<br>`+Required for response``+Change-handler` `+Update-provider`                                                                                                       |
| **name**          | String(255)                                        | `=` `!=` `~` `~=` `=~`                                                                                                                                      | Name of Change<br>`+Required for response``+Change-handler` `+Update-provider`                                                                                                      |
| **organization**  | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                                                                                                                                                    | Legal entity metadata<br>`+Required when responding` `+Expand` `+Required when creating``+Change-handler` `+Update-provider`                                                        |
| **overhead**      | Object                                             |                                                                                                                                                             | Overhead expenses. [Learn more](../documents/#transactions-transfer-transfer-overhead-expenses). If Transfer items are not set, the overhead expenses cannot be set<br>`+Update-provider` |
| **owner**         | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`  | Owner (Employee)<br>`+Expand`  |
| **positions**     | MetaArray                                          |                                                                                                                                                             | Item Metadata                                                                                                                                                                       |
| **printed**       | Boolean                                            | `=` `!=`                                                                                                                                                    | Is the document printed<br>`+Required when responding` `+Read Only`                                                                                                                 |
| **project**       | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                                                                                                                                                    | Project metadata<br>`+Expand``+Change-handler` `+Update-provider`                                                                                                                   |
| **published**     | Boolean                                            | `=` `!=`                                                                                                                                                    | Is the document published<br>`+Required when replying` `+Read Only`                                                                                                                 |
| **rate**          | Object                                             |                                                                                                                                                             | Currency. [Learn more](../documents/#transactions-currency-in-transactions)<br>`+Required when replying``+Change-handler` `+Update-provider`                            |
| **shared**        | Boolean                                            | `=` `!=`                                                                                                                                                    | Sharing<br>`+Required when replying`                                                                                                                                                |
| **sourceStore**   | [Meta](../#kladana-json-api-general-info-metadata) |                                                                                                                                                             | Metadata of the warehouse from which the Transfer is made<br>`+Required when responding` `+Expand` `+Required when creating``+Change-handler` `+Update-provider`                    |
| **state**         | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                                                                                                                                                    | Transfer status metadata<br>`+Expand` `+Change-handler` `+Update-provider`                                                                                                          |
| **sum**           | Int                                                | `=` `!=` `<` `>` `<=` `>=`   | Transfer amount in paise<br>`+Required when replying` `+Read-only``+Change-handler`   |
| **supply** | [Meta](../#kladana-json-api-general-info-metadata) | | Metadata of the Receiving associated with the Transfer<br>`+Read-only` `+Expand` |
| **syncId**        | UUID                                               | `=` `!=`                                                                                                                                                    | Synchronization ID. After filling it is not available for change                                                                                                                    |
| **targetStore**   | [Meta](../#kladana-json-api-general-info-metadata) |                                                                                                                                                             | Metadata of the warehouse being Transfer to<br>`+Required when responding` `+Expand` `+Required when creating``+Change-handler` `+Update-provider`                                  |
| **updated**       | DateTime                                           | `=` `!=` `<` `>` `<=` `>=`                                                                                                                                  | Last update time Transfers<br>`+Required when replying` `+Read-only``+Change-handler`                                                                                               |

#### Overhead Expenses

Description of overhead expenses fields

| Title | Type | Description |
| ------- | ---------- |------- |
| **sum** | Int | Amount in paise<br>`+Required when replying` `+Update-provider` |
| **distribution** | Enum | Overhead expenses distribution `[weight, volume, price]` -> `[by weight, by volume, by price]`<br>`+Required when replying` `+Update-provider` |

#### Transfer items

Transfer Items is a list of products, product variants or batches. The Transfer item object contains the following fields:

| Title | Type                                               | Description |
| ------- |----------------------------------------------------|----------|
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Read-only``+Change-handler` |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of a product, service, batch or product variant which is an item<br>`+Required when replying` `+Expand``+Change-handler` `+Update-provider` |
| **id** | UUID                                               | Item ID<br>`+Required for response` `+Read-only``+Change-handler` |
| **overhead** | Int                                                | Overhead expenses. [Learn more](../documents/#transactions-stock-adjustment-stock-adjustment-overhead-expenses). If Transfer items are not set, no overhead expenses can be set<br>`+Required in response` `+Read-Only` |
| **pack** | Object                                             | Product packaging. [Learn more](../dictionaries/#entities-product-products-nested-entity-attributes-product-packaging)<br>`+Change-handler` `+Update-provider` |
| **price** | Float                                              | Price of products/services in paise<br>`+Required when replying``+Change-handler` `+Update-provider` |
| **quantity** | Float                                               | The number of products/services of this type in the item. If the item is a product that has tracking by serial numbers enabled, then the value in this field will always be equal to the number of serial numbers for this item in the transaction.<br>`+Required when replying``+Change-handler` `+Update-provider ` |
| **sourceSlot** | [Meta](../#kladana-json-api-general-info-metadata) | The location in the warehouse from which the transfer is made. [Learn more](../dictionaries/#entities-warehouse-warehouse-bins)<br>`+Expand` |
| **targetSlot** | [Meta](../#kladana-json-api-general-info-metadata) | The cell in the warehouse to which the transfer is made. [Learn more](../dictionaries/#entities-warehouse-warehouse-bins)<br>`+Expand` |
| **things** | Array(String)                                      | Serial numbers. The value of this attribute is ignored if the item item is not in serial accounting. Otherwise, the number of products in the item will be equal to the number of serial numbers passed in the attribute value.`+Change-handler` |

The value of this attribute is ignored if the item item is not in serial accounting.
Otherwise, the number of items in the item will be equal to the number of serial numbers passed in the attribute value.

You can work with items using special resources for managing items
as well as as part of a separate Transfer. When working as part of a separate Transfer,
you can send requests to create a separate Transfer with included in the request body
an array of Transfer items. If the number of items exceeds the maximum allowed, then for
further replenishment of items, you will need to work with a special resource "Transfer items".

Also, when working as part of a separate Transfer, you can send requests to update the list of items
with an array of Transfer items included in the request body. It is important to remember that the collection of items will
be perceived as "all Transfer items" and will completely replace the existing collection when updating the object. Superfluous items are deleted, new ones are added, existing ones are changed.

[Learn more](../#kladana-json-api-general-info-additional-fields) about working with additional fields.

### Get Transfers
 
**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** | `string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Get Transfers

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/move"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Transfers.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/move",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/move/metadata",
     "type": "move",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/5ac52c9a-4f67-11e6-8a84-bae500000084",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/move/metadata",
         "type": "move",
         "mediaType": "application/json"
       },
       "id": "5ac52c9a-4f67-11e6-8a84-bae500000084",
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
       "updated": "2016-07-21 20:20:19",
       "name": "00002",
       "externalCode": "Avqi0FZqi8W400cwO1oHh2",
       "moment": "2016-07-21 20:19:00",
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
       "project": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/project/722e39f0-313e-11e6-8a84-bae500000008",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/project/metadata",
           "type": "project",
           "mediaType": "application/json"
         }
       },
       "state": {
         "meta": {"href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata/states/64c4689e-4f67-11e6-8a84-bae5000000b5",
           "type": "state",
           "mediaType": "application/json"
         }
       },
       "positions": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/move/5ac52c9a-4f67-11e6-8a84-bae500000084/positions",
           "type": "moveposition",
           "mediaType": "application/json",
           "size": 15,
           "limit": 1000,
           "offset": 0
         }
       },
       "sourceStore": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json"
         }
       },
       "targetStore": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/e94a6e65-4f64-11e6-8a84-bae500000066",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json"
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/ec94d9ff-4f64-11e6-8a84-bae500000069",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/move/metadata",
         "type": "move",
         "mediaType": "application/json"
       },
       "id": "ec94d9ff-4f64-11e6-8a84-bae500000069",
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
       "updated": "2016-07-21 20:02:36",
       "name": "00001",
       "externalCode": "l7eb7QKZj1DtnXCLBuuUa1",
       "moment": "2016-07-21 19:37:00",
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
       "positions": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/move/ec94d9ff-4f64-11e6-8a84-bae500000069/positions",
           "type": "moveposition",
           "mediaType": "application/json",
           "size": 2,
           "limit": 1000,
           "offset": 0
         }
       },
       "sourceStore": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/e94a6e65-4f64-11e6-8a84-bae500000066",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json"
         }
       },
       "targetStore": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json"
         }
       }
     }
   ]
}
```
        
### Create Transfer

Request to create a new Transfer. Mandatory fields to create:

+ **organization** - Link to your legal entity in the format [Metadata](../#kladana-json-api-general-info-metadata)
+ **sourceStore** - Link to the warehouse from which the transfer is made, in the format [Metadata](../#kladana-json-api-general-info-metadata)
+ **targetStore** - Link to the warehouse to which the Transfer is made, in the format [Metadata](../#kladana-json-api-general-info-metadata)

> An example of creating a new Transfer with a request body containing only the required fields.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/move"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "organization": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "targetStore": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                 "type": "store",
                 "mediaType": "application/json"
               }
             },
             "sourceStore": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/store/e94a6e65-4f64-11e6-8a84-bae500000066",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                 "type": "store",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Transfer.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/move/544236cb-4f6a-11e6-8a84-bae500000003",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/move/metadata",
     "type": "move",
     "mediaType": "application/json"
   },
   "id": "544236cb-4f6a-11e6-8a84-bae500000003",
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
   "updated": "2007-02-07 17:16:41",
   "name": "705",
   "externalCode": "vosdjnodsfne3124pasf",
   "moment": "2016-07-21 15:44:33",
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
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata/states/64c4689e-4f67-11e6-8a84-bae5000000b5",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/move/544236cb-4f6a-11e6-8a84-bae500000003/positions",
       "type": "moveposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "sourceStore": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/e94a6e65-4f64-11e6-8a84-bae500000066",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "targetStore": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   }
}
```

### Bulk create and update Transfers

[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Transfers.
In the body of the request, you need to pass an array containing the JSON representation of the Transfers that you want to create or update.
Updated Transfers must contain the identifier in the form of metadata.

> Example of creating and updating multiple Transfers

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/move"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
            {
                "organization": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                        "type": "organization",
                        "mediaType": "application/json"
                    }
                },
                "targetStore": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                        "type": "store",
                        "mediaType": "application/json"
                    }
                },
                "sourceStore": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/store/e94a6e65-4f64-11e6-8a84-bae500000066",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                        "type": "store",
                        "mediaType": "application/json"
                    }
                }
            },
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/move/544236cb-4f6a-11e6-8a84-bae500000003",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/move/metadata",
                    "type": "move",
                    "mediaType": "application/json"
                },
                "name": "705507",
                "description": "Moving 2",
                "code": "12345",
                "externalCode": "12345678",
                "moment": "2016-07-21 19:44:33",
                "applicable": false,
                "state": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata/states/64c4689e-4f67-11e6-8a84-bae5000000b5",
                        "type": "state",
                        "mediaType": "application/json"
                    }
                },
                "overhead": {
                    "sum": 5555,
                    "distribution": "weight"
                },
                "organization": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                        "type": "organization",
                        "mediaType": "application/json"
                    }
                },
                "targetStore": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                        "type": "store",
                        "mediaType": "application/json"
                    }
                },
                "sourceStore": {
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
                            "href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata/attributes/954d6ab9-4f67-11e6-8a84-bae5000000bc",
                            "type": "attributemetadata",
                            "mediaType": "application/json"
                        },
                        "value": 43
                    }
                ],
                "positions": []
            }
        ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Transfers.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/move/544236cb-4f6a-11e6-8a84-bae500000003",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/move/metadata",
       "type": "move",
       "mediaType": "application/json"
     },
     "id": "544236cb-4f6a-11e6-8a84-bae500000003",
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
     "updated": "2007-02-07 17:16:41",
     "name": "705",
     "externalCode": "vosdjnodsfne3124pasf",
     "moment": "2016-07-21 15:44:33",
     "applicable": true,
     "rate": {
       "currency": {"meta": {
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
     "state": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata/states/64c4689e-4f67-11e6-8a84-bae5000000b5",
         "type": "state",
         "mediaType": "application/json"
       }
     },
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/544236cb-4f6a-11e6-8a84-bae500000003/positions",
         "type": "moveposition",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     },
     "sourceStore": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/e94a6e65-4f64-11e6-8a84-bae500000066",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       }
     },
     "targetStore": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       }
     }
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/move/544236cb-4f6a-11e6-8a84-bae500000003",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/move/metadata",
       "type": "move",
       "mediaType": "application/json"
     },
     "id": "544236cb-4f6a-11e6-8a84-bae500000003",
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
     "updated": "2016-07-21 20:44:20",
     "name": "705507",
     "description": "Moving 2",
     "code": "12345",
     "externalCode": "12345678",
     "moment": "2016-07-21 19:44:33",
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
     "state": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata/states/64c4689e-4f67-11e6-8a84-bae5000000b5",
         "type": "state",
         "mediaType": "application/json"
       }
     },
     "attributes": [
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata/attributes/954d62cc-4f67-11e6-8a84-bae5000000bb",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "954d62cc-4f67-11e6-8a84-bae5000000bb",
         "name": "AttributeName1",
         "type": "time",
         "value": "2016-07-21 20:28:53"
       },
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata/attributes/954d6ab9-4f67-11e6-8a84-bae5000000bc",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "954d6ab9-4f67-11e6-8a84-bae5000000bc",
         "name": "AttributeName2",
         "type": "long",
         "value": 43
       }
     ],
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/544236cb-4f6a-11e6-8a84-bae500000003/positions",
         "type": "moveposition",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     },
     "sourceStore": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/e94a6e65-4f64-11e6-8a84-bae500000066",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       }
     },
     "targetStore": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       }
     }
   }
]
```

### Delete Transfer

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Transfer id. |
  
> Request to delete Transfers with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of Transfer.

### Bulk deletion of Transfers

In the body of the request, you need to pass an array containing the JSON metadata of the Transfers that you want to Transfer.

> Request for bulk deletion of Transfers.

```shell
  curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/move/delete"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
     -d'[
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b1",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/move/metadata",
                    "type": "move",
                    "mediaType": "application/json"
                }
            },
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b2",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/move/metadata",
                    "type": "move",
                    "mediaType": "application/json"
                }
            }
        ]'
```

> Successful request. The result is JSON information about deleting Transfers.

```json
[
   {
     "info":"Entity 'move' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully removed"
   },
   {
     "info":"Entity 'move' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully removed"
   }
]
```

### Transfer Pattern
#### Transfer Pattern

> A request to get a pre-populated Transfer template without being linked to any document.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/move/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d''
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Transfer.

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
   "moment": "2016-11-25 18:02:50",
   "applicable": true,
   "printed": true,
   "published": true,
   "sum": 0,
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
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/move/544236cb-4f6a-11e6-8a84-bae500000003/positions",
       "type": "moveposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   }
}
```

### Transfer pattern based on Internal Order

Request for a pre-filled transfer template based on an Internal Order or a Sales Order. The response to the request will return a pre-filled Transfer template, which can then be used to create a new Transfer using a POST request.

> Sample request for a transfer template based on an Internal Order.

```shell
   curl -X PUT"https://api.kladana.com/api/remap/1.2/entity/move/new"
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
Successful request. The result is a JSON representation of the prefilled Transfer.

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
   "moment": "2016-11-25 18:02:21",
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
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
           }
         },
         "overhead": 0
       },
       {
         "quantity": 1,
         "price": 100.0,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
           }
         },
         "overhead": 0
       },
       {
         "quantity": 2,
         "price": 500.0,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#good/edit?id=392c045c-2842-11e9-ac12-000a00000002"
           }
         },
         "overhead": 0
       },
       {
         "quantity": 3,
         "price": 2230.0,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#good/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
           }
         },
         "overhead": 0
       }
     ]
   },
   "targetStore": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/b942743c-9128-11e6-8a84-bae500000053",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
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

> An example of request to get a Transfer template based on a Sales Order.

```shell
  curl -X PUT
    "https://api.kladana.com/api/remap/1.2/entity/move/new"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "customerOrder": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/64e426af-b0d8-11e6-8a84-bae500000064",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
                "type": "customerorder",
                "mediaType": "application/json"
              }
            }
          }'  
```

> Response 200 (application/json)
Successful request. Result is a JSON representation of the prefilled Transfer.

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
  "moment": "2016-11-25 18:02:21",
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
        "assortment": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
            "type": "product",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
          }
        },
        "overhead": 0
      },
      {
        "quantity": 1,
        "price": 100.0,
        "assortment": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
            "type": "product",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
          }
        },
        "overhead": 0
      },
      {
        "quantity": 2,
        "price": 500.0,
        "assortment": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
            "type": "product",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#good/edit?id=392c045c-2842-11e9-ac12-000a00000002"
          }
        },
        "overhead": 0
      },
      {
        "quantity": 3,
        "price": 2230.0,
        "assortment": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
            "type": "product",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#good/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
          }
        },
        "overhead": 0
      }
    ]
  },
  "targetStore": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/store/b942743c-9128-11e6-8a84-bae500000053",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
      "type": "store",
      "mediaType": "application/json"
    }
  },
  "customerOrder": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/64e426af-b0d8-11e6-8a84-bae500000064",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
      "type": "customerorder",
      "mediaType": "application/json"
    }
  }
}
```

### Transfer Metadata
#### Transfer Metadata

Request to get Transfers metadata. The result is a JSON object including:

| Parameter | Description |
| ------- | ---------- |
| **meta** | Link to Transfers metadata |
| **attributes** | Array of objects additional Navigate fields in [Metadata](../#kladana-json-api-general-info-metadata) format |
| **states** | Array of Transfer statuses |
| **createShared** | create new Transfers labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Transfer Metadata

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/move/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Transfers metadata.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata/attributes/954d62cc-4f67-11e6-8a84-bae5000000bb",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "954d62cc-4f67-11e6-8a84-bae5000000bb",
       "name": "AttributeName1",
       "type": "time",
       "required": false
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata/attributes/954d6ab9-4f67-11e6-8a84-bae5000000bc",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "954d6ab9-4f67-11e6-8a84-bae5000000bc",
       "name": "AttributeName2",
       "type": "long",
       "required": false
     }
   ],
   "states": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata/states/64c4689e-4f67-11e6-8a84-bae5000000b5",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "64c4689e-4f67-11e6-8a84-bae5000000b5",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Pending execution",
       "color": 10066329,
       "stateType": "Regular",
       "entityType": "move"
     }
   ],
   "createShared": false
}
```

### Separate additional field
 
**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Field ID. |
 
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/move/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata/attributes/954d6ab9-4f67-11e6-8a84-bae5000000bc",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "954d6ab9-4f67-11e6-8a84-bae5000000bc",
   "name": "AttributeName1",
   "type": "long",
   "required": false
}
```

### Transfer
 
### Get Transfer

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Transfer id. |

> Request to receive a separate Transfer with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Transfer.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/move/5ac52c9a-4f67-11e6-8a84-bae500000084",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/move/metadata","type": "move",
     "mediaType": "application/json"
   },
   "id": "5ac52c9a-4f67-11e6-8a84-bae500000084",
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
   "updated": "2016-07-21 20:20:19",
   "name": "00002",
   "externalCode": "Avqi0FZqi8W400cwO1oHh2",
   "moment": "2016-07-21 20:19:00",
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
   "project": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/project/722e39f0-313e-11e6-8a84-bae500000008",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/project/metadata",
       "type": "project",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata/states/64c4689e-4f67-11e6-8a84-bae5000000b5",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/move/5ac52c9a-4f67-11e6-8a84-bae500000084/positions",
       "type": "moveposition",
       "mediaType": "application/json",
       "size": 15,
       "limit": 1000,
       "offset": 0
     }
   },
   "sourceStore": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "targetStore": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/e94a6e65-4f64-11e6-8a84-bae500000066",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   }
}
```

### Change Transfer

Request to update Transfers with the specified id.

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Transfer id. |

> An example of a request to update a single Transfer.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "705507",
             "description": "Moving 2",
             "code": "12345",
             "externalCode": "12345678",
             "moment": "2016-07-21 19:44:33",
             "applicable": false,
             "state": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata/states/64c4689e-4f67-11e6-8a84-bae5000000b5",
                 "type": "state",
                 "mediaType": "application/json"
               }
             },
             "overhead": {
               "sum": 5555,
               "distribution": "weight"
             },
             "organization": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/organization/fae3561a-2e58-11e6-8a84-bae50000004e",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "targetStore": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                 "type": "store",
                 "mediaType": "application/json"
               }
             },
             "sourceStore": {
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
                   "href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata/attributes/954d6ab9-4f67-11e6-8a84-bae5000000bc",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": 43
               }
             ],
             "positions": []
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Transfer.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/move/544236cb-4f6a-11e6-8a84-bae500000003",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/move/metadata",
     "type": "move",
     "mediaType": "application/json"
   },
   "id": "544236cb-4f6a-11e6-8a84-bae500000003",
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
   "updated": "2016-07-21 20:44:20",
   "name": "705507",
   "description": "Moving 2",
   "code": "12345",
   "externalCode": "12345678",
   "moment": "2016-07-21 19:44:33",
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
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata/states/64c4689e-4f67-11e6-8a84-bae5000000b5",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata/attributes/954d62cc-4f67-11e6-8a84-bae5000000bb",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "954d62cc-4f67-11e6-8a84-bae5000000bb",
       "name": "AttributeName1",
       "type": "time",
       "value": "2016-07-21 20:28:53"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/metadata/attributes/954d6ab9-4f67-11e6-8a84-bae5000000bc",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "954d6ab9-4f67-11e6-8a84-bae5000000bc",
       "name": "AttributeName2",
       "type": "long",
       "value": 43
     }
   ],
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/move/544236cb-4f6a-11e6-8a84-bae500000003/positions",
       "type": "moveposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "sourceStore": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/e94a6e65-4f64-11e6-8a84-bae500000066",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "targetStore": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   }
}
```

### Transfer Items

A separate resource for managing items Transfers. With it, you can manage the items of a larger document that has more lines than the limit on the number of lines saved with the document. This limit is 1000. Learn more about document line limits and working with painour documents can be read [here](../#kladana-json-api-general-info-working-with-transaction-items).
  
### Get Items

A request to get a list of all items in this Transfer.

| Title | Type | Description |
| ------- | ----------|---------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Transfers. |

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Transfer id. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** | `string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Get items

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of individual Transfer positions.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions",
     "type": "moveposition",
     "mediaType": "application/json",
     "size": 15,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/5ac5407b-4f67-11e6-8a84-bae500000085",
         "type": "moveposition",
         "mediaType": "application/json"
       },
       "id": "5ac5407b-4f67-11e6-8a84-bae500000085",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 2,
       "price": 0.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/e6447ee7-3303-11e6-8a84-bae5000149c2",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/5ac54d7a-4f67-11e6-8a84-bae500000086",
         "type": "moveposition",
         "mediaType": "application/json"
       },
       "id": "5ac54d7a-4f67-11e6-8a84-bae500000086",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 3,
       "price": 0.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/e6475862-3303-11e6-8a84-bae5000149cc",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/5ac55815-4f67-11e6-8a84-bae500000087",
         "type": "moveposition",
         "mediaType": "application/json"
       },
       "id": "5ac55815-4f67-11e6-8a84-bae500000087",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 4,
       "price": 0.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/e84aed23-3303-11e6-8a84-bae500014dcd",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
         }
       },
       "overhead": 0
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/5ac56175-4f67-11e6-8a84-bae500000088",
         "type": "moveposition",
         "mediaType": "application/json"
       },
       "id": "5ac56175-4f67-11e6-8a84-bae500000088",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 5,
       "price": 0.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/e84e52e5-3303-11e6-8a84-bae500014dd7",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
         }
       },
       "overhead": 0
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/5ac56a34-4f67-11e6-8a84-bae500000089",
         "type": "moveposition",
         "mediaType": "application/json"
       },
       "id": "5ac56a34-4f67-11e6-8a84-bae500000089",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 2,
       "price": 0.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/e8530f64-3303-11e6-8a84-bae500014de6",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000042"
         }
       },
       "overhead": 0
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/5ac572cd-4f67-11e6-8a84-bae50000008a",
         "type": "moveposition",
         "mediaType": "application/json"
       },
       "id": "5ac572cd-4f67-11e6-8a84-bae50000008a",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 1,
       "price": 0.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/328b0454-2e62-11e6-8a84-bae500000118",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000043"
         }
       },
       "overhead": 0
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/5ac57b59-4f67-11e6-8a84-bae50000008b",
         "type": "moveposition",
         "mediaType": "application/json"
       },
       "id": "5ac57b59-4f67-11e6-8a84-bae50000008b",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 32,
       "price": 0.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/0744d71b-2e59-11e6-8a84-bae50000007f",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000045"
         }
       },
       "overhead": 0
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/5ac5843a-4f67-11e6-8a84-bae50000008c",
         "type": "moveposition",
         "mediaType": "application/json"
       },
       "id": "5ac5843a-4f67-11e6-8a84-bae50000008c",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 14,
       "price": 0.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a7daa6b-3c64-11e6-8a84-bae50000000a",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
           "type": "variant",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#feature/edit?id=e64d0a86-2a99-11e9-ac12-000c00000046"
         }
       },
       "overhead": 0
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/5ac58ea6-4f67-11e6-8a84-bae50000008d",
         "type": "moveposition",
         "mediaType": "application/json"
       },
       "id": "5ac58ea6-4f67-11e6-8a84-bae50000008d",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 5,
       "price": 0.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
           "type": "variant",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#feature/edit?id=e64d0a86-2a99-11e9-ac12-000c00000047"
         }
       },
       "overhead": 0
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/5ac596ca-4f67-11e6-8a84-bae50000008e",
         "type": "moveposition",
         "mediaType": "application/json"
       },
       "id": "5ac596ca-4f67-11e6-8a84-bae50000008e",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 6,
       "price": 0.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a83c422-3c64-11e6-8a84-bae500000012",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
           "type": "variant",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#feature/edit?id=e64d0a86-2a99-11e9-ac12-000c00000048"
         }
       },
       "overhead": 0
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/5ac59eb7-4f67-11e6-8a84-bae50000008f",
         "type": "moveposition",
         "mediaType": "application/json"
       },
       "id": "5ac59eb7-4f67-11e6-8a84-bae50000008f",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 34,
       "price": 0.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/4f05a1f2-3304-11e6-8a84-bae50001c687",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000049"
         }
       },
       "overhead": 0
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/5ac5a711-4f67-11e6-8a84-bae500000090",
         "type": "moveposition",
         "mediaType": "application/json"
       },
       "id": "5ac5a711-4f67-11e6-8a84-bae500000090",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 32,
       "price": 0.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/4f785efd-3304-11e6-8a84-bae50001c6c4",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000040"
         }
       },
       "overhead": 0
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/5ac5af07-4f67-11e6-8a84-bae500000091",
         "type": "moveposition",
         "mediaType": "application/json"
       },
       "id": "5ac5af07-4f67-11e6-8a84-bae500000091",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 12,
       "price": 0.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/4f918196-3304-11e6-8a84-bae50001c6d2",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000051"
         }
       },
       "overhead": 0
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/5ac5c872-4f67-11e6-8a84-bae500000092",
         "type": "moveposition",
         "mediaType": "application/json"
       },
       "id": "5ac5c872-4f67-11e6-8a84-bae500000092",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 43,
       "price": 0.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/4f2a0659-3304-11e6-8a84-bae50001c6a1",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000052"
         }
       },
       "overhead": 0
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/5ac5d0e5-4f67-11e6-8a84-bae500000093",
         "type": "moveposition",
         "mediaType": "application/json"
       },
       "id": "5ac5d0e5-4f67-11e6-8a84-bae500000093",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 32,
       "price": 0.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/27eba7b5-3303-11e6-8a84-bae500002b72",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000053"
         }
       },
       "overhead": 0
     }
   ]
}
```
### Transfer Item

### Get Item

**Parameters**

| Parameter | Description |
| ------------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Transfer ID. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b20* Transfer item ID. |

> Request to get a single Transfer item with the specified id.

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. Result is a JSON representation of a single Transfer item.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20",
    "type": "moveposition",
    "mediaType": "application/json"
  },
  "id": "7944ef04-f831-11e5-7a69-971500188b20",
  "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
  "quantity": 4,
  "price": 0.0,
  "assortment": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/e84aed23-3303-11e6-8a84-bae500014dcd",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json",
      "uuidHref": "https://api.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
    }
  },
  "overhead": 0
}
```

### Create Item

Request to create a new item in the Transfer.
For successful creation, the following fields must be specified in the request body:

+ **assortment** - Link to the product, service, batch, or product variant that the item represents.
You can also specify a field named **service**, **variant** according to
what the indicated item is. You can read more about this field in the description of the [Transfer item](../documents/#transactions-transfer-transfer-transfer-items).
+ **quantity** - Quantity of the specified item. Must be positive, otherwise an error will occur.
You can create one or more Transfer items at the same time. All items created by this request
will be added to the existing ones.

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Transfer id. |

> An example of creating items in the Transfer.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "quantity": 43,
               "price": 670.0,
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/product/4f2a0659-3304-11e6-8a84-bae50001c6a1",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                   "type": "product",
                   "mediaType": "application/json"
                 }
               },
               "overhead": 70
             },
             {
               "quantity": 32,
               "price": 640.0,
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/product/27eba7b5-3303-11e6-8a84-bae500002b72",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                   "type": "product",
                   "mediaType": "application/json"
                 }
               },
               "overhead": 65
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created item of the individual Transfer.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/476d9c48-4f6b-11e6-8a84-bae500000013",
       "type": "moveposition",
       "mediaType": "application/json"
     },
     "id": "476d9c48-4f6b-11e6-8a84-bae500000013",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 43,
     "price": 670.0,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/4f2a0659-3304-11e6-8a84-bae50001c6a1",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
       }
     },
     "overhead": 0
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/476da9ce-4f6b-11e6-8a84-bae500000014",
       "type": "moveposition",
       "mediaType": "application/json"
     },
     "id": "476da9ce-4f6b-11e6-8a84-bae500000014",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 32,
     "price": 640.0,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/27eba7b5-3303-11e6-8a84-bae500002b72",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
       }
     },
     "overhead": 0
   }
]
```

### Change Item

Request to update a line item Transfers. There is no way to update the item required fields in the body of the request. Only the ones you want to update.

**Parameters**

| Parameter | Description |
| --------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Transfer id. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b20* Transfer id. |

> An example of a request to update a line item in a Transfer.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "quantity": 44,
             "price": 222222.0
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Transfer item.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20",
     "type": "moveposition",
     "mediaType": "application/json"
   },
   "id": "7944ef04-f831-11e5-7a69-971500188b20",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "quantity": 44,
   "price": 222222.0,
   "assortment": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/4f2a0659-3304-11e6-8a84-bae50001c6a1",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
     }
   },
   "overhead": 0
}
```

### Delete Item

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Transfer id. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b20* Transfer id. |
 
> Request to delete a separate Transfer item with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of the Transfer item.

### Bulk deletion of items

**Parameters**

| Parameter | Description |
| ------------ | -------- |
| **id** | `string` (required) *Example: 3e1c03bb-684f-11ee-ac12-000c000000b0* Transfer ID. |

> Request for bulk deletion of Transfer items.

```shell
curl -X POST
  "https://api.kladana.com/api/remap/1.2/entity/move/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/delete"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
  -H "Content-Type: application/json"
  -d '[
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/move/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/7fce2da5-684d-11ee-ac12-000c000000a2",
            "type": "moveposition",
            "mediaType": "application/json"
          }
        },
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/move/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/7fce37a5-684d-11ee-ac12-000c000000a3",
            "type": "moveposition",
            "mediaType": "application/json"
          }
        }
      ]'  
```

> Response 200 (application/json)
Transfer items were successfully removed.