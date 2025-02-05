## Write-off

Using the JSON API, you can create and update information about Write-offs, request lists of Write-offs and information on individual Write-offs. Write-off items can be managed both as part of a separate Write-off, and separately - using special resources for managing Write-off items. The **loss** keyword is the entity code for Write-off as part of the JSON API. Learn more about [Write-off](https://kladana.zendesk.com/hc/en-us/articles/4452743258769-Write-off).

### Write-off
#### Entity attributes

| Title | Type    | Filtration| Description |
| --------- | ----------- | --------- | --------- |
| **accountId** | UUID                                               | `=` `!=` | Account ID<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **applicable** | Boolean                                            | `=` `!=` | Handling flag<br>`+Required when replying` `+Change-handler` |
| **attributes** | Array(Object)                                      | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields)<br> `+Change-handler` |
| **code** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Write-off Code |
| **created** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Creation date<br>`+Required for response` `+Read-only` `+Change-handler` |
| **deleted** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Time of last deletion of Write-off<br>`+Read Only` |
| **description** | String(4096)                                       | `=` `!=` `~` `~=` `=~` | Write-Off Comment<br>`+Change-handler` |
| **externalCode** | String(255)                                        | `=` `!=` `~` `~=` `=~` | External Code of Write-off<br>`+Required when replying` `+Change-handler` |
| **files** | MetaArray                                          | | [Files](../dictionaries/#entities-files) array metadata (Maximum number of files - 100)<br>`+Required when replying` `+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID                                               | `=` `!=` | Write-off ID<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Write-off Metadata<br>`+Required when replying` `+Change-handler` |
| **moment** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Document date<br>`+Required when replying` `+Change-handler` |
| **name** | string(255)                                        | `=` `!=` `~` `~=` `=~` | Write-off Name<br>`+Required when replying` `+Change-handler` |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Legal entity metadata<br>`+Required when responding` `+Expand` `+Required when creating` `+Change-handler` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Expand` |
| **positions** | MetaArray                                          | | Write-off item metadata<br>`+Required for response` `+Expand` `+Change-handler` |
| **printed** | Boolean                                            | `=` `!=` | Is the document printed<br>`+Required when responding` `+Read Only` |
| **project** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Project metadata<br>`+Expand` `+Change-handler` |
| **published** | Boolean                                            | `=` `!=` | Is the document published<br>`+Required when replying` `+Read Only` |
| **rate** | Object                                             | | Currency. [Learn more](../documents/#transactions-currency-in-transactions)<br>`+Required when replying` `+Change-handler` |
| **shared** | Boolean                                            | `=` `!=` | Sharing<br>`+Required when replying` |
| **state** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Write-off status metadata<br>`+Expand` `+Change-handler` |
| **store** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Warehouse metadata<br>`+Required when responding` `+Expand` `+Required when creating` `+Change-handler` |
| **sum** | Int                                                | `=` `!=` `<` `>` `<=` `>=` | Write-off amount in paise<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **syncId** | UUID                                               | `=` `!=` | Synchronization ID. After filling it is not available for change |
| **updated** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=`| Time when the Write-off was last updated<br>`+Required when replying` `+Read-only` `+Change-handler` |

#### Links to other documents

| Title | Description |
| ------- | -------- |
| **salesReturn** | Link to the related of Sales Return in [Metadata](../#kladana-json-api-general-info-metadata) format|
| **inventory**   | Link to the Inventory Count related to the Write-off in [Metadata](../#kladana-json-api-general-info-metadata) format |

#### Write-off Items

Write-off items is a list of products/product variants/batches. The Write-off item object contains the following fields:

| Title | Type                                               | Description|
| ------------|----------------------------------------------------| --------- |
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of a product/service/batch/product variant, which is an item<br>`+Required when replying` `+Expand` `+Change-handler` |
| **id** | UUID                                               | Item ID<br>`+Required for response` `+Read-only` `+Change-handler` |
| **pack** | Object                                             | Product packaging. [Learn more](../dictionaries/#entities-product-products-nested-entity-attributes-product-packaging)<br>`+Change-handler` |
| **price** | Float                                              | Price of products/services in paise<br>`+Required when replying` `+Change-handler` |
| **quantity** |  Float    | The number of products/services of this type in the item. If the item is a product with serial number accounting enabled, then the value in this field will always be equal to the number of serial numbers for this item in the transaction.<br>`+Required when replying` `+Change-handler` |
| **reason** | String(255)                                        | Reason for decommissioning this item |
| **slot** | [Meta](../#kladana-json-api-general-info-metadata) | Bin in the warehouse. [Learn more](../dictionaries/#entities-warehouse-warehouse-bins)<br>`+Expand` |
| **things** | Array(String)                                      | Serial numbers. The value of this attribute is ignored if the item is not in serial accounting. Otherwise, the number of items in the item will be equal to the number of serial numbers passed in the attribute value.<br>`+Change-handler` |

You can manage Write-off items using [special resources](../documents/#transactions-write-off-write-off-write-off-items) or within individual Write-offs. When working within a specific Write-off, you can send requests to create a Write-off with an array of items included in the request. If the number of items exceeds the maximum limit, you will need to use the 'Write-off Items' resource to add more items. You can also update the list of items within a Write-off by sending a request with an array of items. Note that the collection of items will replace the existing list, meaning extra items will be removed, new ones added, and existing ones updated.

[Learn more](../#kladana-json-api-general-info-additional-fields) about working with additional fields for Write-offs.


### Get Write-offs

Request all Write-offs on this account.
Result: JSON object including fields:

|Title | Type | Description |
| ------- | -------- |--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the Write-offs. |

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** | `string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Get Write-offs

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/loss"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the List of Write-offs.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/loss/",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata",
     "type": "loss",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/loss/6ddca2d7-4f28-11e6-8a84-bae500000066",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata",
         "type": "loss",
         "mediaType": "application/json"
       },
       "id": "6ddca2d7-4f28-11e6-8a84-bae500000066",
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
       "updated": "2016-07-21 15:22:54",
       "name": "00001",
       "externalCode": "o5GMiWUJhqhq1vmrUWwI-2",
       "moment": "2016-07-21 12:49:00",
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
       "sum": 3981730,
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
       "attributes": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata/attributes/d0912ad5-4f3d-11e6-8a84-bae500000082",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "d0912ad5-4f3d-11e6-8a84-bae500000082",
           "name": "AttributeName1",
           "type": "double",
           "value": 0.2
         }
       ],
       "positions": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/loss/6ddca2d7-4f28-11e6-8a84-bae500000066/positions",
           "type": "lossposition",
           "mediaType": "application/json",
           "size": 2,
           "limit": 1000,
           "offset": 0
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/loss/9d020efd-4f2a-11e6-8a84-bae500000078",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata",
         "type": "loss",
         "mediaType": "application/json"
       },
       "id": "9d020efd-4f2a-11e6-8a84-bae500000078",
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
       "updated": "2016-07-21 15:23:02",
       "name": "00002",
       "externalCode": "08cP74Ftgc7MrBTbGfGVJ3",
       "moment": "2016-07-21 13:05:00",
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
       "attributes": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata/attributes/d0912ad5-4f3d-11e6-8a84-bae500000082",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "d0912ad5-4f3d-11e6-8a84-bae500000082",
           "name": "AttributeName1",
           "type": "double",
           "value": 45.2
         }
       ],
       "positions": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/loss/9d020efd-4f2a-11e6-8a84-bae500000078/positions",
           "type": "lossposition",
           "mediaType": "application/json",
           "size": 1,
           "limit": 1000,
           "offset": 0
         }
       },
       "salesReturn": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/a8b8e1e3-3f85-11e6-8a84-bae50000008d",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/metadata",
           "type": "salesreturn",
           "mediaType": "application/json"
         }
       }
     }
   ]
}
```
### Create Write-off

Request to create a new Write-off. For successful creation, the following fields must be specified in the request body:

+ **organization** - Link to your legal entity in the format [Metadata](../#kladana-json-api-general-info-metadata) `Required`
+ **store** - Link to the warehouse in the format [Metadata](../#kladana-json-api-general-info-metadata) `Required`

> An example of creating a new Write-off.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/loss"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "store": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/store/b72f4f02-9b8b-11e6-8af5-581e0000009b",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                 "type": "store",
                 "mediaType": "application/json"
               }
             },
             "organization": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/organization/95920812-9609-11e6-8af5-581e000000d4",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "positions": [
               {
                 "quantity": 23,
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/product/987148b8-9a09-11e6-8af5-581e0000006f",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 }
               },
               {
                 "quantity": 12,
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/variant/987d77f1-9a09-11e6-8af5-581e00000074",
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
Successful request. The result is a JSON representation of the created Write-off.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/loss/b014dab4-4f42-11e6-8a84-bae500000006",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata",
     "type": "loss",
     "mediaType": "application/json"
   },
   "id": "b014dab4-4f42-11e6-8a84-bae500000006",
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
   "updated": "2016-07-21 15:57:32",
   "name": "00005",
   "externalCode": "itqCvT69hgSZFTJEL9cP70",
   "moment": "2016-07-21 15:57:32",
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
   "sum": 50000,
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
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/loss/b014dab4-4f42-11e6-8a84-bae500000006/positions",
       "type": "lossposition",
       "mediaType": "application/json",
       "size": 3,
       "limit": 1000,
       "offset": 0
     }
   },
   "salesReturn": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/166909e6-4a99-11e6-8a84-bae500000089",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/metadata",
       "type": "salesreturn",
       "mediaType": "application/json"
     }
   }
}
```

### Bulk creation and updating of Write-offs

[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Write-offs.
In the body of the request, you need to pass an array containing the JSON representation of the Write-offs that you want to create or update.
Updated Write-offs must contain the identifier in the form of metadata.

> Example of creating and updating multiple Write-offs

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/loss"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "store": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/store/b72f4f02-9b8b-11e6-8af5-581e0000009b",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata","type": "store",
                   "mediaType": "application/json"
                 }
               },
               "organization": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/organization/95920812-9609-11e6-8af5-581e000000d4",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                   "type": "organization",
                   "mediaType": "application/json"
                 }
               },
               "positions": [
                 {
                   "quantity": 23,
                   "assortment": {
                     "meta": {
                       "href": "https://api.kladana.com/api/remap/1.2/entity/product/987148b8-9a09-11e6-8af5-581e0000006f",
                       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                       "type": "product",
                       "mediaType": "application/json"
                     }
                   }
                 },
                 {
                   "quantity": 12,
                   "assortment": {
                     "meta": {
                       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/987d77f1-9a09-11e6-8af5-581e00000074",
                       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                       "type": "variant",
                       "mediaType": "application/json"
                     }
                   }
                 }
               ]
             },
             {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/loss/b014dab4-4f42-11e6-8a84-bae500000006",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata",
                 "type": "loss",
                 "mediaType": "application/json"
               },
               "name": "00606234",
               "externalCode": "3498142cook",
               "moment": "2016-07-21 15:57:32",
               "applicable": true,
               "sum": 50000,
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
               "positions": [],
               "salesReturn": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/9b83cb6b-3f80-11e6-8a84-bae5000000bb",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/metadata",
                   "type": "salesreturn",
                   "mediaType": "application/json"
                 }
               }
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of created and updated Write-offs.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/loss/b014dab4-4f42-11e6-8a84-bae500000006",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata",
       "type": "loss",
       "mediaType": "application/json"
     },
     "id": "b014dab4-4f42-11e6-8a84-bae500000006",
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
     "updated": "2016-07-21 15:57:32",
     "name": "00005",
     "externalCode": "itqCvT69hgSZFTJEL9cP70",
     "moment": "2016-07-21 15:57:32",
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
     "sum": 50000,
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
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/loss/b014dab4-4f42-11e6-8a84-bae500000006/positions",
         "type": "lossposition",
         "mediaType": "application/json",
         "size": 3,
         "limit": 1000,
         "offset": 0
       }
     },
     "salesReturn": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/166909e6-4a99-11e6-8a84-bae500000089",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/metadata",
         "type": "salesreturn",
         "mediaType": "application/json"
       }
     }
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/loss/b014dab4-4f42-11e6-8a84-bae500000006",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata",
       "type": "loss",
       "mediaType": "application/json"
     },
     "id": "b014dab4-4f42-11e6-8a84-bae500000006",
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
     "updated": "2016-07-21 16:05:11",
     "name": "00606234",
     "externalCode": "3498142cook",
     "moment": "2016-07-21 15:57:32",
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
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/loss/b014dab4-4f42-11e6-8a84-bae500000006/positions",
         "type": "lossposition",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     },
     "salesReturn": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/9b83cb6b-3f80-11e6-8a84-bae5000000bb",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/metadata",
         "type": "salesreturn",
         "mediaType": "application/json"
       }
     }
   }
]
```

### Delete of Write-offs

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Write-off id. |

> Request to delete the Write-off with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of the Write-off.

### Bulk deletion of Write-offs

In the request body, you need to pass an array containing JSON of the Write-offs metadata, whichwhich you want to delete.


> Request for bulk deletion of Write-offs.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/loss/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b1",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata",
                  "type": "loss",
                  "mediaType": "application/json"
              }
          },
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b2",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata",
                  "type": "loss",
                  "mediaType": "application/json"
              }
          }
        ]'
```

> Successful request. Result - JSON information about deleting Write-offs.

```json
[
   {
     "info":"Entity 'loss' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'loss' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Write-off metadata
#### Write-off Metadata

Request to receive the Write-offs metadata. The result is a JSON object including:

| Parameter | Description |
| ------- | -------- |
| **meta** | Link to Metadata of Write-offs |
| **attributes** | Array of objects additional Write-off fields in the [Metadata](../#kladana-json-api-general-info-metadata) format |
| **states** | Array of Write-off statuses |
| **createShared** | create new Write-offs labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Metadata of Write-offs

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/loss/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Write-offs metadata.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata/attributes/d0911efc-4f3d-11e6-8a84-bae500000081",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "d0911efc-4f3d-11e6-8a84-bae500000081",
       "name": "AttributeName1",
       "type": "string",
       "required": false
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata/attributes/d0912ad5-4f3d-11e6-8a84-bae500000082",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "d0912ad5-4f3d-11e6-8a84-bae500000082",
       "name": "AttributeName2",
       "type": "double",
       "required": true
     }
   ],
   "createShared": false
}
```

### Separate additional field

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Field ID. |
 
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/loss/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata/attributes/d0912ad5-4f3d-11e6-8a84-bae500000082",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "d0912ad5-4f3d-11e6-8a84-bae500000082",
   "name": "AttributeName1",
   "type": "double",
   "required": true
}
```

### Write-off Template
#### Write-off Template

> Request to receive a write-off template pre-filled with standard values without connection to any document.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/loss/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d''
```

> Response 200(application/json)
Successful request. Result - JSON npresentation of a pre-filled write-off.

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
       "href": "https://api.kladana.com/api/remap/1.2/loss/b014dab4-4f42-11e6-8a84-bae500000006/positions",
       "type": "lossposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   }
}
```

### Write-off template based on Sales Return

Request for a prefilled Write-off based on Sales Return.
As a result of the request, a pre-filled Write-off template will be created based on the passed Sales Return.

> Order example (application/json)

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/loss/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "salesReturn": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/166909e6-4a99-11e6-8a84-bae500000089",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/metadata",
                 "type": "salesreturn",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Write-off.

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
   "sum": 28000,
   "organization": {
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
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/loss/166909e6-4a99-11e6-8a84-bae500000089/positions",
       "type": "lossposition",
       "mediaType": "application/json",
       "size": 3,
       "limit": 1000,
       "offset": 0
     },
     "rows": [
       {
         "meta": {
           "type": "lossposition",
           "mediaType": "application/json"
         },
         "quantity": 1,
         "price": 20000.0,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
           }
         }
       },
       {
         "meta": {
           "type": "lossposition",
           "mediaType": "application/json"
         },
         "quantity": 1,
         "price": 10000.0,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/328b0454-2e62-11e6-8a84-bae500000118",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
           }
         }
       },
       {
         "meta": {
           "type": "lossposition",
           "mediaType": "application/json"
         },
         "quantity": 1,
         "price": 20000.0,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#good/edit?id=392c045c-2842-11e9-ac12-000a00000002"}
         }
       }
     ]
   },
   "salesReturn": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/166909e6-4a99-11e6-8a84-bae500000089",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/metadata",
       "type": "salesreturn",
       "mediaType": "application/json"
     }
   }
}

```

### Get Write-off

**Parameters**

| Parameter | Description |
| ------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Write-off id. |
 
> Request to receive a separate Write-off with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Write-off.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/loss/6ddca2d7-4f28-11e6-8a84-bae500000066",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata",
     "type": "loss",
     "mediaType": "application/json"
   },
   "id": "6ddca2d7-4f28-11e6-8a84-bae500000066",
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
   "updated": "2016-07-21 15:22:54",
   "name": "00001",
   "externalCode": "o5GMiWUJhqhq1vmrUWwI-2",
   "moment": "2016-07-21 12:49:00",
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
   "sum": 3981730,
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
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata/attributes/d0912ad5-4f3d-11e6-8a84-bae500000082",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "d0912ad5-4f3d-11e6-8a84-bae500000082",
       "name": "AttributeName1",
       "type": "double",
       "value": 0.2
     }
   ],
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/loss/6ddca2d7-4f28-11e6-8a84-bae500000066/positions",
       "type": "lossposition",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     }
   }
}
```

### Change Write-off

**Parameters**

| Parameter | Description |
| ------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Write-off id. |
 
Request to update the write-off with the specified id.

> An example of a request to update a separate Write-off.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "00606234",
             "externalCode": "3498142cook",
             "moment": "2016-07-21 15:57:32",
             "applicable": true,
             "sum": 50000,
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
             "positions": [],
             "salesReturn": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/9b83cb6b-3f80-11e6-8a84-bae5000000bb",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/metadata",
                 "type": "salesreturn",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Write-off.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/loss/b014dab4-4f42-11e6-8a84-bae500000006",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata",
     "type": "loss",
     "mediaType": "application/json"
   },
   "id": "b014dab4-4f42-11e6-8a84-bae500000006",
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
   "updated": "2016-07-21 16:05:11",
   "name": "00606234",
   "externalCode": "3498142cook",
   "moment": "2016-07-21 15:57:32",
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
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/loss/b014dab4-4f42-11e6-8a84-bae500000006/positions",
       "type": "lossposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "salesReturn": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/9b83cb6b-3f80-11e6-8a84-bae5000000bb",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/metadata",
       "type": "salesreturn",
       "mediaType": "application/json"
     }
   }
}
```

> An example of a request to change the Write-off with additional fields.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "00606234",
             "externalCode": "3498142cook",
             "moment": "2016-07-21 15:57:32",
             "applicable": true,
             "sum": 50000,
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
             "positions": [],
             "salesReturn": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/9b83cb6b-3f80-11e6-8a84-bae5000000bb",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/metadata",
                 "type": "salesreturn",
                 "mediaType": "application/json"
               }
             },
             "attributes": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata/attributes/d0912ad5-4f3d-11e6-8a84-bae500000082",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": 0.7643
               },
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata/attributes/d0911efc-4f3d-11e6-8a84-bae500000081",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "String value"
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Write-off.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/loss/b014dab4-4f42-11e6-8a84-bae500000006",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata",
     "type": "loss",
     "mediaType": "application/json"
   },
   "id": "b014dab4-4f42-11e6-8a84-bae500000006",
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
   "updated": "2016-07-21 16:05:11",
   "name": "00606234",
   "externalCode": "3498142cook",
   "moment": "2016-07-21 15:57:32",
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
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata/attributes/d0911efc-4f3d-11e6-8a84-bae500000081",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "d0911efc-4f3d-11e6-8a84-bae500000081",
       "name": "AttributeName1",
       "type": "string",
       "value": "String value"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/loss/metadata/attributes/d0912ad5-4f3d-11e6-8a84-bae500000082",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "d0912ad5-4f3d-11e6-8a84-bae500000082",
       "name": "AttributeName2",
       "type": "double",
       "value": 0.7643
     }
   ],
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/loss/b014dab4-4f42-11e6-8a84-bae500000006/positions",
       "type": "lossposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "salesReturn": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/9b83cb6b-3f80-11e6-8a84-bae5000000bb",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/salesreturn/metadata",
       "type": "salesreturn",
       "mediaType": "application/json"
     }
   }
}
```

### Write-off Items

A separate resource for managing Write-Off items. With it, you can manage the items of a larger document that has more lines than the limit on the number of lines saved with the document. This limit is 1000. [Learn more](../#kladana-json-api-general-info-working-with-transaction-items) about document line limits and how to work with large documents. 

### Get Write-off items

Request to receive a list of all items of the Write-off.

| Title | Type | Description |
| ------- | --------- |------ |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the Write-off items. |

**Parameters**

| Parameter | Description |
| ------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Write-off id. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Write-off Items

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19/positions"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of items of a separate Write-off.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19/positions",
     "type": "lossposition",
     "mediaType": "application/json",
     "size": 3,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19/positions/0b615a22-4f42-11e6-8a84-bae50000008e",
         "type": "lossposition",
         "mediaType": "application/json"
       },
       "id": "0b615a22-4f42-11e6-8a84-bae50000008e",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 2,
       "price": 20000.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=392c045c-2842-11e9-ac12-000a00000002"
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19/positions/0b61605f-4f42-11e6-8a84-bae50000008f",
         "type": "lossposition",
         "mediaType": "application/json"
       },
       "id": "0b61605f-4f42-11e6-8a84-bae50000008f",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 6,
       "price": 10000.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/328b0454-2e62-11e6-8a84-bae500000118",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19/positions/0b616604-4f42-11e6-8a84-bae500000090",
         "type": "lossposition",
         "mediaType": "application/json"
       },
       "id": "0b616604-4f42-11e6-8a84-bae500000090",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "quantity": 1,
       "price": 33000.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/328b0454-2e62-11e6-8a84-bae500000118",
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

### Write-off Item
### Get Item

**Parameters**

| Parameter | Description |
| ----------- | ----------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Write-off ID. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b20* Write-off item ID. |

> Request to get a single Write-off item with the specified ID.

```shell
curl -X GET
  "https://app.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of a single Write-off item.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20",
    "type": "lossposition",
    "mediaType": "application/json"
  },
  "id": "7944ef04-f831-11e5-7a69-971500188b20",
  "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
  "quantity": 2,
  "price": 20000.0,
  "assortment": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
      "metadataHref": "https://app.kladana.com/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002"
    }
  }
}
```

### Create Item

Request to create a new item in the Write-off.
For successful creation, the following fields must be specified in the request body:

+ **assortment** - Link to the product/service/batch/product variant that the item represents.
You can also specify a field named **service**, **variant** according to
what the indicated item is. You can read more about this field in the description of the [Write-off item](../documents/#transactions-write-off-write-off-write-off-items).
+ **quantity** - Quantity of the specified item. Must be positive, otherwise an error will occur.
You can create one or more write-off items at the same time. All items created by this request
will be added to the existing ones.

**Parameters**

| Parameter | Description |
| ------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Write-off id. |

> An example of creating items in a Write-off.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19/positions"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19/positions/0b615a22-4f42-11e6-8a84-bae50000008e",
                 "type": "lossposition",
                 "mediaType": "application/json"
               },
               "quantity": 321,
               "price": 53000.0,
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                   "type": "product",
                   "mediaType": "application/json"
                 }
               },
               "reason": "breakdown"
             },
             {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19/positions/0b615a22-4f42-11e6-8a84-bae50000008e",
                 "type": "lossposition",
                 "mediaType": "application/json"
               },
               "quantity": 12,
               "price": 2645.0,
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                   "type": "product",
                   "mediaType": "application/json"
                 }
               },
               "reason": "marriage"
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created item of a separate Write-off.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19/positions/0b615a22-4f42-11e6-8a84-bae50000008e",
       "type": "lossposition",
       "mediaType": "application/json"
     },
     "id": "0b615a22-4f42-11e6-8a84-bae50000008e",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 321,
     "price": 53000.0,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
       }
     },
     "reason": "breakdown"
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19/positions/0b615a22-4f42-11e6-8a84-bae50000008e",
       "type": "lossposition",
       "mediaType": "application/json"
     },
     "id": "0b615a22-4f42-11e6-8a84-bae50000008e",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 12,
     "price": 2645.0,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002"
       }
     },
     "reason": "marriage"
   }
]
```

### Change Item

Request to update a separate line item of the Write-off. There is no way to update the item required fields in the body of the request. Only the ones you want to update.

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Write-off id. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b20* Item id. |
 
> An example of a request to update a line item in a Write-off.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "quantity": 172,
             "price": 7777.0,
             "reason": "Broken"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Write-off item.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20",
     "type": "lossposition",
     "mediaType": "application/json"
   },
   "id": "7944ef04-f831-11e5-7a69-971500188b20",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "quantity": 172,
   "price": 7777.0,
   "assortment": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/20485cfd-2e62-11e6-8a84-bae500000112",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002"
     }
   },
   "reason": "Broken"
}
```

### Delete item

**Parameters**

| Parameter | Description |
| ------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Write-off id. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b20* Item id. |
 
> Request to delete a separate Write-off item with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/loss/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of a Write-off item.


### Bulk deletion of items

**Parameters**

| Parameter | Description |
| ----------- | ------------|
| **id** | `string` (required) *Example: 3e1c03bb-684f-11ee-ac12-000c000000b0* Write-off ID. |

> Request for bulk deletion of Write-off Items.

```shell
curl -X POST
  "https://api.kladana.com/remap/1.2/entity/loss/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/delete"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
  -H "Content-Type: application/json"
  -d '[
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/loss/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/7fce2da5-684d-11ee-ac12-000c000000a2",
            "type": "lossposition",
            "mediaType": "application/json"
          }
        },
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/loss/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/7fce37a5-684d-11ee-ac12-000c000000a3",
            "type": "lossposition",
            "mediaType": "application/json"
          }
        }
      ]'  
```

> Response 200 (application/json)
Write-off items were successfully deleted.

