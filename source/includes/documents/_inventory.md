## Inventory Count

Using the JSON API, you can create and update Inventory Count information, query Inventory Count lists, and query individual Inventory Counts. Inventory Count items can be managed both as part of a separate Inventory Count, and separately - using special resources for Inventory Count items managing means. The entity code of Inventory Count in JSON API is an **inventory** keyword. Learn more about [Inventory Count](https://kladana.zendesk.com/hc/en-us/articles/360013596157-Create-Inventory-Count).

### Inventory Count
#### Entity attributes

| Title            | Type                                               | Filtration                                                                                                                                            | Description                                                                                                                    |
|------------------|----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| **accountId**    | UUID                                               | `=` `!=`                                                                                                                                              | Account ID<br>`+Required when replying` `+Read Only`                                                                           |
| **attributes**   | Array(Object)                                      | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields)                    |
| **code**         | String(255)                                        | `=` `!=` `~` `~=` `=~`                                                                                                                                | Code of issued Inventory Counts                                                                                                |
| **created**      | DateTime                                           | `=` `!=` `<` `>` `<=` `>=`                                                                                                                            | Creation date<br>`+Required when replying` `+Read only`                                                                        |
| **deleted**      | DateTime                                           | `=` `!=` `<` `>` `<=` `>=`                                                                                                                            | Last delete time of Inventory Count<br>`+Read Only`                                                                            |
| **description**  | String(4096)                                       | `=` `!=` `~` `~=` `=~`                                                                                                                                | Comment of Inventory                                                                                                           |
| **externalCode** | String(255)                                        | `=` `!=` `~` `~=` `=~`                                                                                                                                | External ID of the returned Inventory Count<br>`+Required when replying`                                                       |
| **files**        | MetaArray                                          |                                                                                                                                                       | [Files](../dictionaries/#entities-files) array metadata (Maximum number of files - 100)<br>`+Required when replying` `+Expand` |
| **group**        | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                                                                                                                                              | Employee's department<br>`+Required when replying` `+Expand`                                                                   |
| **id**           | UUID                                               | `=` `!=`                                                                                                                                              | Inventory Count ID<br>`+Required when replying` `+Read only`                                                                   |
| **meta**         | [Meta](../#kladana-json-api-general-info-metadata) |                                                                                                                                                       | Inventory Count Metadata<br>`+Required when replying`                                                                          |
| **moment**       | DateTime                                           | `=` `!=` `<` `>` `<=` `>=`                                                                                                                            | Document date<br>`+Required when replying`                                                                                     |
| **name**         | String(255)                                        | `=` `!=` `~` `~=` `=~`                                                                                                                                | Name of returned Inventory Count<br>`+Required when replying`                                                                  |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                                                                                                                                              | Legal entity metadata<br>`+Required when replying` `+Expand` `+Required when creating`                                         |
| **owner**        | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                                                                                                                                              | Owner (Employee)<br>`+Expand`                                                                                                  |
| **positions**    | MetaArray                                          |                                                                                                                                                       | Inventory Count Items Metadata<br>`+Required when replying` `+Expand`                                                          |
| **printed**      | Boolean                                            | `=` `!=`                                                                                                                                              | Is the document printed<br>`+Required when replying` `+Read Only`                                                              |
| **published**    | Boolean                                            | `=` `!=`                                                                                                                                              | Is the document published<br>`+Required when replying` `+Read Only`                                                            |
| **shared**       | Boolean                                            | `=` `!=`                                                                                                                                              | Sharing<br>`+Required when replying`                                                                                           |
| **state**        | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                                                                                                                                              | Inventory Count Status Metadata<br>`+Expand`                                                                                   |
| **store**        | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                                                                                                                                              | Warehouse metadata<br>`+Required when replying` `+Expand` `+Required when creating`                                            |
| **sum**          | Int                                                | `=` `!=` `<` `>` `<=` `>=`                                                                                                                            | Inventory Count Total in paise<br>`+Required when replying` `+Read only`                                                       |
| **syncId**       | UUID                                               | `=` `!=`                                                                                                                                              | Synchronization ID. After filling it is not available for change                                                               |
| **updated**      | DateTime                                           | `=` `!=` `<` `>` `<=` `>=`                                                                                                                            | Last update time of Inventory Count<br>`+Required when replying` `+Read Only`                                                  |

#### Links to other transactions

| Title      | Description                                                                                                |
|------------|------------------------------------------------------------------------------------------------------------|
| **enters** | Link to Inventory Count related receipt in [Metadata](../#kladana-json-api-general-info-metadata) format   |
| **losses** | Link to Inventory Count related Write-off in [Metadata](../#kladana-json-api-general-info-metadata) format |

#### Inventory Count Items
Inventory Count Items is the liast of products and product variants. Inventory Count item object contains the following fields:

| Title                  | Type                                               | Description                                                                                                                                                                                                                                                              |
|------------------------|----------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **accountId**          | UUID                                               | Account ID<br>`+Required when replying` `+Read Only`                                                                                                                                                                                                                     |
| **assortment**         | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of a product/service/batch/product variant, which is an item<br>`+Required when replying` `+Expand`                                                                                                                                                             |
| **calculatedQuantity** | Float                                              | Estimated balance<br>`+Required when replying`                                                                                                                                                                                                                           |
| **correctionAmount**   | Float                                              | Difference between calculated balance and actual balance<br>`+Required when replying` `+Read only`                                                                                                                                                                       |
| **correctionSum**      | Float                                              | Excess/shortage<br>`+Required when replying` `+Read only`                                                                                                                                                                                                                |
| **id**                 | UUID                                               | Item ID<br>`+Required when replying` `+Read Only`                                                                                                                                                                                                                        |
| **pack**               | Object                                             | Product packaging. [Learn more](../dictionaries/#entities-product-products-nested-entity-attributes-product-packaging)                                                                                                                                                   |
| **price**              | Float                                              | The price of the product/service in paise<br>`+Required when replying`                                                                                                                                                                                                   |
| **quantity**           | Float                                              | The number of products/services of this type in the item. If an item is a product with serial number accounting enabled, then the value in the field will always be equal to the number of serial numbers for this item in the transaction.<br>`+Required when replying` |

You can work with items using [special resources for Inventory Count items managing](../documents/#transactions-inventory-count-inventory-count-inventory-count-items),
and also as part of a separate Inventory Count. When working as part of a separate Inventory Count,
you can send requests to create separate Inventory Counts with included in the request body
an array of Inventory Count Items. If the number of items exceeds the maximum allowed, then for
further replenishment of items will need to work with a special resource "Inventory Count Items".
Also, when working as part of a separate Inventory Count, you can send requests to update the list of items
with the Inventory Count items array included in the request body. It is important to remember that the collection of items will
be perceived as "all Inventory Count items" and will completely replace the already existing collection when updating an object - redundant
items will be deleted, new ones added, existing ones changed.

Learm more about [Inventory Count additional fields](../#kladana-json-api-general-info-additional-fields)


### Get Inventory Counts
Query of all Inventory Counts on the given account.
Result: JSON object including fields:

| Title | Type | Description |
| ----------- | -------- |------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Inventory Counts. |

**Parameters**

| Parameter | Description |
| ----------- | -------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** | `string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Get Inventory Counts

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/inventory"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Inventory Counts.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/inventory",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata",
     "type": "inventory",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/7ee45d2d-ad65-11e6-8a84-bc52000000db",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata",
         "type": "inventory",
         "mediaType": "application/json"
       },
       "id": "7ee45d2d-ad65-11e6-8a84-bc52000000db",
       "accountId": "c3cc7e30-99bb-11e6-8a84-bc5200000001",
       "owner": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/employee/c4b17cf2-99bb-11e6-8a84-bc520000002a",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/group/c3cff163-99bb-11e6-8a84-bc5200000002",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-11-18 11:03:31",
       "name": "00001",
       "externalCode": "HCUtF6T2jnNOzNbh-ZNNo1",
       "moment": "2016-11-18 11:03:00",
       "sum": 480000,
       "printed": true,
       "published": true,
       "store": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/c4eddfc8-99bb-11e6-8a84-bc5200000053",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json"
         }
       },
       "organization": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/c4dee133-99bb-11e6-8a84-bc5200000051",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "positions": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/7ee45d2d-ad65-11e6-8a84-bc52000000db/positions",
           "type": "inventoryposition",
           "mediaType": "application/json",
           "size": 1,
           "limit": 1000,
           "offset": 0
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/8c3e615a-ad65-11e6-8a84-bc52000000df",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata",
         "type": "inventory",
         "mediaType": "application/json"
       },
       "id": "8c3e615a-ad65-11e6-8a84-bc52000000df",
       "accountId": "c3cc7e30-99bb-11e6-8a84-bc5200000001",
       "owner": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/employee/c4b17cf2-99bb-11e6-8a84-bc520000002a",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/group/c3cff163-99bb-11e6-8a84-bc5200000002",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-11-18 11:03:53",
       "name": "00002",
       "externalCode": "aNpAW66rhIjZ4VmhA4igz0",
       "moment": "2016-11-18 11:03:00",
       "sum": 1020000,
       "store": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/c4eddfc8-99bb-11e6-8a84-bc5200000053",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json"
         }
       },
       "organization": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/c4dee133-99bb-11e6-8a84-bc5200000051",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "positions": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/8c3e615a-ad65-11e6-8a84-bc52000000df/positions",
           "type": "inventoryposition",
           "mediaType": "application/json",
           "size": 2,
           "limit": 1000,
           "offset": 0
         }
       }
     }
   ]
}
```

### Create Inventory Count

Request to create new Inventory Count.

Mandatory fields to create:

+ **organization** - Link to your legal entity in the format [Metadata](../#kladana-json-api-general-info-metadata)
+ **store** - Link to the warehouse in the format [Metadata](../#kladana-json-api-general-info-metadata)

> An example of creating a new Inventory Count with a request body containing only the required fields.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/inventory"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "store": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/store/c4eddfc8-99bb-11e6-8a84-bc5200000053",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                    "type": "store",
                    "mediaType": "application/json"
                }
            },
            "organization": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/c4dee133-99bb-11e6-8a84-bc5200000051",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                    "type": "organization",
                    "mediaType": "application/json"
                }
            }
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Inventory Count.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/8a2a5d07-ad6d-11e6-8a84-bc520000000a",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata",
     "type": "inventory",
     "mediaType": "application/json"
   },
   "id": "8a2a5d07-ad6d-11e6-8a84-bc520000000a",
   "accountId": "c3cc7e30-99bb-11e6-8a84-bc5200000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/c4b17cf2-99bb-11e6-8a84-bc520000002a",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/c3cff163-99bb-11e6-8a84-bc5200000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-11-18 12:01:06",
   "name": "00005",
   "externalCode": "n0vO68WUgOh9OcHApWSVc2",
   "moment": "2016-11-18 12:01:06",
   "sum": 0,
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/c4eddfc8-99bb-11e6-8a84-bc5200000053",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/c4dee133-99bb-11e6-8a84-bc5200000051",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "created": "2007-02-07 17:16:41",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/8a2a5d07-ad6d-11e6-8a84-bc520000000a/positions",
       "type": "inventoryposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   }
}
```

### Bulk Inventory Count creating and update

[Bulk Inventory Count creating and update](../#kladana-json-api-general-info-create-and-update-multiple-objects).
In the body of the request, you need to pass an array containing the JSON representation of the Inventory Counts that you want to create or update.
Updated Inventory Counts must contain the identifier in the form of metadata.

> Example of creating and updating multiple Inventory Counts

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/inventory"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
            {
                "store": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/store/c4eddfc8-99bb-11e6-8a84-bc5200000053",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                        "type": "store",
                        "mediaType": "application/json"
                    }
                },
                "organization": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/organization/c4dee133-99bb-11e6-8a84-bc5200000051",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                        "type": "organization",
                        "mediaType": "application/json"
                    }
                }
            },
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/57a0bbfb-ad6d-11e6-8a84-bc52000000e7",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata",
                    "type": "inventory",
                    "mediaType": "application/json"
                },
                "name": "newname",
                "positions": {
                    "rows": [
                        {
                            "quantity": 140,
                            "price": 5000.0,
                            "assortment": {
                                "meta": {
                                    "href": "https://api.kladana.com/api/remap/1.2/entity/product/b6be720e-ad63-11e6-8a84-bc520000008f",
                                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                                    "type": "product",
                                    "mediaType": "application/json"
                                }
                            },
                            "correctionAmount": -60,
                            "calculatedQuantity": 200,
                            "correctionSum": -300000
                        },
                        {
                            "quantity": 80,
                            "price": 4000.0,
                            "assortment": {
                                "meta": {
                                    "href": "https://api.kladana.com/api/remap/1.2/entity/product/58948866-ad65-11e6-8a84-bc52000000cf",
                                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                                    "type": "product",
                                    "mediaType": "application/json"
                                }
                            },
                            "correctionAmount": -20,
                            "calculatedQuantity": 100,
                            "correctionSum": -80000
                        }
                    ]
                }
            }
          ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Inventory Counts.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/8a2a5d07-ad6d-11e6-8a84-bc520000000a",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata",
       "type": "inventory",
       "mediaType": "application/json"
     },
     "id": "8a2a5d07-ad6d-11e6-8a84-bc520000000a",
     "accountId": "c3cc7e30-99bb-11e6-8a84-bc5200000001",
     "owner": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/employee/c4b17cf2-99bb-11e6-8a84-bc520000002a",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": false,
     "group": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/group/c3cff163-99bb-11e6-8a84-bc5200000002",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-11-18 12:01:06",
     "name": "00005",
     "externalCode": "n0vO68WUgOh9OcHApWSVc2",
     "moment": "2016-11-18 12:01:06",
     "sum": 0,
     "store": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/c4eddfc8-99bb-11e6-8a84-bc5200000053",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       }
     },
     "organization": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/c4dee133-99bb-11e6-8a84-bc5200000051",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     "created": "2007-02-07 17:16:41",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/8a2a5d07-ad6d-11e6-8a84-bc520000000a/positions",
         "type": "inventoryposition",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     }
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/57a0bbfb-ad6d-11e6-8a84-bc52000000e7",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata",
       "type": "inventory",
       "mediaType": "application/json"
     },
     "id": "57a0bbfb-ad6d-11e6-8a84-bc52000000e7",
     "accountId": "c3cc7e30-99bb-11e6-8a84-bc5200000001",
     "owner": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/employee/c4b17cf2-99bb-11e6-8a84-bc520000002a",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": false,
     "group": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/group/c3cff163-99bb-11e6-8a84-bc5200000002",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-11-18 12:12:27",
     "name": "newname",
     "externalCode": "6iP5E4LLhpzxRKezcuKE90",
     "moment": "2016-11-18 11:59:00",
     "sum": 1020000,
     "store": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/c4eddfc8-99bb-11e6-8a84-bc5200000053",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       }
     },
     "organization": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/c4dee133-99bb-11e6-8a84-bc5200000051",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     "created": "2007-02-07 17:16:41",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/57a0bbfb-ad6d-11e6-8a84-bc52000000e7/positions",
         "type": "inventoryposition",
         "mediaType": "application/json",
         "size": 2,
         "limit": 1000,
         "offset": 0
       }
     }
   }
]
```

### Delete Inventory Count

**Parameters**

| Parameter | Description |
| ----------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Inventory Count id. |
 
> Request to delete Inventory Count with specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of Inventory Count.

### Inventory Count bulk deletion

In the body of the request, you need to pass an array containing JSON with metadata of Inventory Counts you want to delete.


> Inventory Count bulk deletion request.

```shell
  curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/inventory/delete"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
     -d'[
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b1",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata",
                    "type": "inventory",
                    "mediaType": "application/json"
                }
            },
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b2",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata",
                    "type": "inventory",
                    "mediaType": "application/json"
                }
            }
          ]'
```

> Successful request. The result is JSON information about deleting Inventory Counts.

```json
[
   {
     "info":"Entity 'inventory' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'inventory' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Inventory Count Metadata
#### Inventory Count Metadata

Request to get Inventory Count metadata. The result is a JSON object including:

| Parameter | Description |
| ----------- | -------- |
| **meta** | Link to Inventory Count metadata |
| **attributes** | Array of objects additional fields Inventory Counts in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **states** | Array of statuses Inventory Counts |
| **createShared** | create new Inventory Counts labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Inventory Counts Metadata

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Inventory Count metadata.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata/attributes/1f7dbb1b-ad6e-11e6-8a84-bc52000000eb",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "1f7dbb1b-ad6e-11e6-8a84-bc52000000eb",
       "name": "AttributeName1",
       "type": "string",
       "required": false
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata/attributes/1f7dc230-ad6e-11e6-8a84-bc52000000ec",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "1f7dc230-ad6e-11e6-8a84-bc52000000ec",
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
| ----------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Field ID. |
 
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata/attributes/1f7dbb1b-ad6e-11e6-8a84-bc52000000eb",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "1f7dbb1b-ad6e-11e6-8a84-bc52000000eb",
   "name": "AttributeName1",
   "type": "string",
   "required": false
}
```

### Inventory Count Template
#### Inventory Count Template

> Request to get a template prefilled with standard Inventory Count values without being associated with any document.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/inventory/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d''
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled write-off.

```json
{
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/c4b17cf2-99bb-11e6-8a84-bc520000002a",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/c3cff163-99bb-11e6-8a84-bc5200000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2016-11-25 17:52:33",
   "sum": 0,
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/c4eddfc8-99bb-11e6-8a84-bc5200000053",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/c4dee133-99bb-11e6-8a84-bc5200000051",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "printed": true,
   "published": true,
   "positions": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/57a0bbfb-ad6d-11e6-8a84-bc52000000e7/positions",
         "type": "inventoryposition",
         "mediaType": "application/json",
         "size": 2,
         "limit": 1000,
         "offset": 0
       }
   }
}
```

### Inventory Count

### Get Inventory Count

**Parameters**

| Parameter | Description |
| ----------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Inventory Count id. |
 
> Request for a separate Inventory Count with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Inventory Count.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/57a0bbfb-ad6d-11e6-8a84-bc52000000e7",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata",
     "type": "inventory",
     "mediaType": "application/json"
   },
   "id": "57a0bbfb-ad6d-11e6-8a84-bc52000000e7",
   "accountId": "c3cc7e30-99bb-11e6-8a84-bc5200000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/c4b17cf2-99bb-11e6-8a84-bc520000002a",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/c3cff163-99bb-11e6-8a84-bc5200000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-11-18 11:59:41",
   "name": "00004",
   "externalCode": "6iP5E4LLhpzxRKezcuKE90",
   "moment": "2016-11-18 11:59:00",
   "sum": 0,
   "printed": true,
   "published": true,
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/c4eddfc8-99bb-11e6-8a84-bc5200000053",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/c4dee133-99bb-11e6-8a84-bc5200000051",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/57a0bbfb-ad6d-11e6-8a84-bc52000000e7/positions",
       "type": "inventoryposition",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   }
}
```

### Change Inventory Count

Request to update the Inventory Count with the specified ID.

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Inventory Count id. |

> An example request to update a single Inventory Count.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "newname",
            "positions": {
                "rows": [
                    {
                        "quantity": 140,
                        "price": 5000.0,
                        "assortment": {
                            "meta": {
                                "href": "https://api.kladana.com/api/remap/1.2/entity/product/b6be720e-ad63-11e6-8a84-bc520000008f",
                                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                                "type": "product",
                                "mediaType": "application/json"
                            }
                        },
                        "correctionAmount": -60,
                        "calculatedQuantity": 200,
                        "correctionSum": -300000
                    },
                    {
                        "quantity": 80,
                        "price": 4000.0,
                        "assortment": {
                            "meta": {
                                "href": "https://api.kladana.com/api/remap/1.2/entity/product/58948866-ad65-11e6-8a84-bc52000000cf",
                                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                                "type": "product",
                                "mediaType": "application/json"
                            }
                        },
                        "correctionAmount": -20,
                        "calculatedQuantity": 100,
                        "correctionSum": -80000
                    }
                ]
            }
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Inventory Count.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/57a0bbfb-ad6d-11e6-8a84-bc52000000e7",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata",
     "type": "inventory",
     "mediaType": "application/json"
   },
   "id": "57a0bbfb-ad6d-11e6-8a84-bc52000000e7",
   "accountId": "c3cc7e30-99bb-11e6-8a84-bc5200000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/c4b17cf2-99bb-11e6-8a84-bc520000002a",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/c3cff163-99bb-11e6-8a84-bc5200000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-11-18 12:12:27",
   "name": "newname",
   "externalCode": "6iP5E4LLhpzxRKezcuKE90",
   "moment": "2016-11-18 11:59:00",
   "sum": 1020000,
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/c4eddfc8-99bb-11e6-8a84-bc5200000053",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/c4dee133-99bb-11e6-8a84-bc5200000051",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "created": "2007-02-07 17:16:41",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/57a0bbfb-ad6d-11e6-8a84-bc52000000e7/positions",
       "type": "inventoryposition",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     }
   }
}
```

> An example of an Inventory Count change request with additional fields.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             store: {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/store/c4eddfc8-99bb-11e6-8a84-bc5200000053",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                 "type": "store",
                 "mediaType": "application/json"
               }
             },
             organization: {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/organization/c4dee133-99bb-11e6-8a84-bc5200000051",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "attributes": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata/attributes/1f7dbb1b-ad6e-11e6-8a84-bc52000000eb",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "name": "AttributeName1",
                 "type": "string",
                 "value": "text"
               },
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata/attributes/1f7dc230-ad6e-11e6-8a84-bc52000000ec",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "name": "AttributeName2",
                 "type": "long",
                 value: 42
               }]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Inventory Count.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/57a0bbfb-ad6d-11e6-8a84-bc52000000e7",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata",
     "type": "inventory",
     "mediaType": "application/json"
   },
   "id": "57a0bbfb-ad6d-11e6-8a84-bc52000000e7",
   "accountId": "c3cc7e30-99bb-11e6-8a84-bc5200000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/c4b17cf2-99bb-11e6-8a84-bc520000002a",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/c3cff163-99bb-11e6-8a84-bc5200000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-11-18 12:12:27",
   "name": "newname",
   "externalCode": "6iP5E4LLhpzxRKezcuKE90",
   "moment": "2016-11-18 11:59:00",
   "sum": 1020000,
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/c4eddfc8-99bb-11e6-8a84-bc5200000053",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/c4dee133-99bb-11e6-8a84-bc5200000051",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata/attributes/1f7dbb1b-ad6e-11e6-8a84-bc52000000eb",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "1f7dbb1b-ad6e-11e6-8a84-bc52000000eb",
       "name": "AttributeName1",
       "type": "string",
       "value": "text"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/metadata/attributes/1f7dc230-ad6e-11e6-8a84-bc52000000ec",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "1f7dc230-ad6e-11e6-8a84-bc52000000ec",
       "name": "AttributeName2",
       "type": "long",
       "value": 42
     }
   ],
   "created": "2007-02-07 17:16:41",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/57a0bbfb-ad6d-11e6-8a84-bc52000000e7/positions",
       "type": "inventoryposition",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     }
   }
}
```

### Inventory Count Items

A separate resource for managing Inventory Count items. With it, you can manage the items of a larger document that has more lines than the limit on the number of lines saved with the document. This limit is 1000. You can read more about limits on the number of document lines and working with large documents [here](../#kladana-json-api-general-info-working-with-transaction-items).

### Get Items

A request to get a list of all items in a given Inventory Count.

| Title | Type | Description |
| ----------- | -------- |------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the Inventory Count items. |

**Parameters**

| Parameter | Description |
| --------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Inventory Count id. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Inventory Count item

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b19/positions"
   -H "Authorization: Basic < Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of items in a single Inventory Count.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b19/positions",
     "type": "inventoryposition",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b19/positions/201452a2-ad6f-11e6-8a84-bc5200000010",
         "type": "inventoryposition",
         "mediaType": "application/json"
       },
       "id": "201452a2-ad6f-11e6-8a84-bc5200000010",
       "accountId": "c3cc7e30-99bb-11e6-8a84-bc5200000001",
       "quantity": 140,
       "price": 5000.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/b6be720e-ad63-11e6-8a84-bc520000008f",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
         }
       },
       "correctionAmount": -60,
       "calculatedQuantity": 200,
       "correctionSum": -300000
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b19/positions/20145d98-ad6f-11e6-8a84-bc5200000011",
         "type": "inventoryposition",
         "mediaType": "application/json"
       },
       "id": "20145d98-ad6f-11e6-8a84-bc5200000011",
       "accountId": "c3cc7e30-99bb-11e6-8a84-bc5200000001",
       "quantity": 80,
       "price": 4000.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/58948866-ad65-11e6-8a84-bc52000000cf",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
         }
       },
       "correctionAmount": -20,
       "calculatedQuantity": 100,
       "correctionSum": -80000
     }
   ]
}
```
### Inventory Count Item
### Get Item

**Parameters**

| Parameter | Description |
| --------- | ----------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Inventory ID. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b20* Item ID. |

> Request to get a single Inventory Count item with the specified ID.

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. Result is a JSON representation of a single Inventory Count item.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20",
    "type": "inventoryposition",
    "mediaType": "application/json"
  },
  "id": "7944ef04-f831-11e5-7a69-971500188b20",
  "accountId": "c3cc7e30-99bb-11e6-8a84-bc5200000001",
  "quantity": 140,
  "price": 5000.0,
  "assortment": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/b6be720e-ad63-11e6-8a84-bc520000008f",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
    }
  },
  "correctionAmount": -60,
  "calculatedQuantity": 200,
  "correctionSum": -300000
}
```

### Create Inventory Count Item

Request to create a new item in Inventory Count.
For successful creation, the following fields must be specified in the request body:

+ **assortment** - Link to the product/batch/product variant that the item represents. You can read more about this field in the description [Inventory Count item](../documents/#transactions-inventory-count-inventory-count-inventory-count-items).
+ **quantity** - Quantity of the specified item. Must be positive, otherwise an error will occur.
You can create both one and Inventory Count items at the same time. All items created by this query
will be added to the existing ones.

**Parameters**

| Parameter | Description |
| ----------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Inventory Count id. |

> An example of creating items in Inventory Count.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b19/positions"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b19/positions/201452a2-ad6f-11e6-8a84-bc5200000010",
                "type": "inventoryposition",
                "mediaType": "application/json"
            },
            "id": "201452a2-ad6f-11e6-8a84-bc5200000010",
            "accountId": "c3cc7e30-99bb-11e6-8a84-bc5200000001",
            "quantity": 140,
            "price": 2000.0,
            "assortment": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/product/b6be720e-ad63-11e6-8a84-bc520000008f",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                    "type": "product",
                    "mediaType": "application/json"
                }
            }
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created item of a separate Inventory Count.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b19/positions/201452a2-ad6f-11e6-8a84-bc5200000010",
       "type": "inventoryposition",
       "mediaType": "application/json"
     },
     "id": "201452a2-ad6f-11e6-8a84-bc5200000010",
     "accountId": "c3cc7e30-99bb-11e6-8a84-bc5200000001",
     "quantity": 140,
     "price": 2000.0,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/b6be720e-ad63-11e6-8a84-bc520000008f",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
       }
     },
     "correctionAmount": -60,
     "calculatedQuantity": 200,
     "correctionSum": -120000
   }
]
```

### Change Item

Request to update an individual Inventory Count item. There is no way to update the item required fields in the body of the request. Only the ones you want to update.

**Parameters**

| Parameter | Description |
| ----------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Inventory Count id. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b20* Item id. |

> An example of a request to update a line item in Inventory Count.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20",
               "type": "inventoryposition",
               "mediaType": "application/json"
             },
             "id": "201452a2-ad6f-11e6-8a84-bc5200000010",
             "accountId": "c3cc7e30-99bb-11e6-8a84-bc5200000001",
             "quantity": 45,
             "price": 1000.0,
             "assortment": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/product/b6be720e-ad63-11e6-8a84-bc520000008f",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                 "type": "product",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Inventory Count item.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20",
     "type": "inventoryposition",
     "mediaType": "application/json"
   },
   "id": "7944ef04-f831-11e5-7a69-971500188b20",
   "accountId": "c3cc7e30-99bb-11e6-8a84-bc5200000001",
   "quantity": 45,
   "price": 1000.0,
   "assortment": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/b6be720e-ad63-11e6-8a84-bc520000008f",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
     }
   },
   "correctionAmount": -155,
   "calculatedQuantity": 200,
   "correctionSum": -155000
}
```

### Delete Item

**Parameters**

| Parameter | Description |
| ----------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Inventory Count id. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b20* Item id. |
 
> Request to delete a single Inventory Count item with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/inventory/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of Inventory Count item.

### Bulk deletion of items

**Parameters**

| Parameter | Description |
| --------- | ------------ |
| **id** | `string` (required) *Example: 3e1c03bb-684f-11ee-ac12-000c000000b0* Inventory Count ID. |

> Request for bulk deletion of Inventory Count items.

```shell
curl -X POST
  "https://api.kladana.com/api/remap/1.2/entity/inventory/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/delete"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
  -H "Content-Type: application/json"
  -d '[
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/7fce2da5-684d-11ee-ac12-000c000000a2",
            "type": "inventoryposition",
            "mediaType": "application/json"
          }
        },
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/inventory/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/7fce37a5-684d-11ee-ac12-000c000000a3",
            "type": "inventoryposition",
            "mediaType": "application/json"
          }
        }
      ]'  
```

> Response 200 (application/json)
Successfully deleted of Inventory Count items.
