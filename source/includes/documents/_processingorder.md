## Production Order
### Production Orders

Using the JSON API, you can create and update information about Production Orders, request lists of Production Orders, and information on individual Production Orders. Production Order items can be managed both as part of a separate Production Order, and separately using special resources for managing Production Order items. The entity code for the Production Order as part of the JSON API is the **processingorder** keyword. Learn more about [Production Order](https://kladana.zendesk.com/hc/en-us/articles/7349092456721-Production-Orders).

#### Entity attributes

| Title | Type | Filtration | Description |
| ------- | -------- | --------|---------|
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **applicable** | Boolean | `=` `!=` | Check mark<br>`+Required when replying` |
| **attributes** | Array(Object) | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields)<br>`+Read only` |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Production Order Code |
| **created** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Creation date<br>`+Required when replying` `+Read only` |
| **deleted** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Time when the Production Order was last deleted<br>`+Read Only` |
| **deliveryPlannedMoment** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Planned production date |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Production Order Comment |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | External Production Order Code<br>`+Required when replying` |
| **files** | MetaArray | | [Files](../dictionaries/#entities-files) array metadata (Maximum number of files - 100)<br>`+Required when replying` `+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID| `=` `!=` | Production Order ID<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Production Order Metadata<br>`+Required when replying` `+Read Only` |
| **moment** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Document date<br>`+Required when replying` |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Production Order Name<br>`+Required when replying` `+Required when creating` |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Legal entity metadata<br>`+Required when replying` `+Expand` `+Required when creating` |
| **organizationAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Legal entity account metadata<br>`+Expand` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Expand` |
| **positions** | MetaArray | | Metadata of Production Order items<br>`+Required when replying` `+Expand` `+Required when creating` |
| **printed** | Boolean | `=` `!=` | Is the document printed<br>`+Required when replying` `+Read Only` |
| **processingPlan** | [Meta](../#kladana-json-api-general-info-metadata) | | Metadata of Bill of Materials<br>`+Required when replying` `+Expand` `+Required when creating` |
| **project** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Project metadata<br>`+Expand` |
| **published** | Boolean | `=` `!=` | Is the document published<br>`+Required when replying` `+Read Only` |
| **quantity** | Float | `=` `!=` `<` `>` `<=` `>=` | Production volume<br>`+Required when replying` `+Read only` |
| **shared** | Boolean| `=` `!=` | Sharing<br>`+Required when replying` `+Read Only` |
| **state** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Production Order Status Metadata<br>`+Expand` |
| **store** | [Meta](../#kladana-json-api-general-info-metadata) | | Warehouse metadata<br>`+Required when replying` `+Expand` `+Required when creating` |
| **syncId** | UUID | `=` `!=` | Synchronization ID. After filling it is not available for editing<br>`+Read-only` |
| **updated** | DateTime | `=` `!=` `<` `>` `<=` `>=` | When the Production Order was last updated<br>`+Required when replying` `+Read Only` |

#### Links to other transactions

| Title | Description |
| ------------ | --------------- |
| **processings** | An array of links to related production operations in the [Metadata](../#kladana-json-api-general-info-metadata) format |

#### Production Order Items
Production Order Items is a list of products and product variants corresponding to the materials of the BOM. The Order item object contains the following fields:

| Title | Type | Description |
| ------------ | --------------- |----------- |
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Read Only` |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of a product/service/batch/product variant which is an item<br>`+Required when replying` `+Expand` |
| **id** | UUID | Item ID<br>`+Required when replying` `+Read Only` |
| **pack** | Object | Product packaging. [Learn more](../dictionaries/#entities-product-products-nested-entity-attributes-product-packaging) |
| **quantity** | Float  | The number of goods/services of this type in the item. If an item is a product with serial number accounting enabled, then the value in this field will always be equal to the number of serial numbers for this item in the document.<br>`+Required when replying` |
| **reserve** | Float | Reserve this item<br>`+Required when replying`|

You can work with items using special resources for managing Production Order items,
and as part of a separate Production Order. When working as part of a separate Production Order,
you can send requests to create a separate Production Order with included in the request body
an array of Production Order items.

Also, when working as part of a separate Production Order, you can send requests to update the list of items
with an array of Production Order items included in the request body. Items with new products cannot be added to the Production Order.

About working with fields of Production Orders can be read [here](../#kladana-json-api-general-info-additional-fields)

### Get a list of Production Orders

Query all Production Orders on this account.
Result: JSON object including fields:

| Title | Type | Description |
| ------------ | --------------- |------------ |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Production Orders. |

**Parameters**

| Parameter | Description |
| ------------ | --------------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** | `string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Get a list of Production Orders

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/processingorder"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of Production Orders.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
     "type": "processingorder",
     "mediaType": "application/json",
     "size": 5,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/5fbf79f4-adac-11e6-5bed-427b0000006a",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
         "type": "processingorder",
         "mediaType": "application/json"
       },
       "id": "5fbf79f4-adac-11e6-5bed-427b0000006a",
       "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
       "owner": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-11-21 12:17:56.000",
       "name": "da",
       "description": "dsa",
       "externalCode": "Tzn6ewsegfp90BCJ6xgWe2",
       "moment": "2016-11-18 19:30:00.000",
       "applicable": true,
       "printed": true,
       "published": true,
       "store": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/d5e311c0-91f1-11e6-5bed-427b00000053",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json"
         }
       },
       "project": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/project/7f3a7d7a-97a1-11e6-5bed-427b0000009c",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/project/metadata",
           "type": "project",
           "mediaType": "application/json"
         }
       },
       "organization": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/a1331985-a1c8-11e6-5bed-427b00000084",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "deliveryPlannedMoment": "2016-11-22 12:17:00.000",
       "positions": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/5fbf79f4-adac-11e6-5bed-427b0000006a/positions",
           "type": "processingorderposition",
           "mediaType": "application/json",
           "size": 1,
           "limit": 1000,
           "offset": 0
         }
       },
       "quantity": 1,
       "processingPlan": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
           "type": "processingplan",
           "mediaType": "application/json"
         }
       },
       "processing": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/processing/bcd6e6b5-b002-11e6-5bed-427b0000000b",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processing/metadata",
             "type": "processing",
             "mediaType": "application/json"
           }
         },
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/processing/8450f4de-b002-11e6-5bed-427b00000000",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processing/metadata",
             "type": "processing",
             "mediaType": "application/json"
           }
         }
       ]
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/80191fbd-afcf-11e6-5bed-427b00000000",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
         "type": "processingorder",
         "mediaType": "application/json"
       },
       "id": "80191fbd-afcf-11e6-5bed-427b00000000",
       "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
       "owner": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-11-21 12:47:22",
       "name": "11da",
       "description": "dsa",
       "externalCode": "Tzn6ewsegfp90BCJ6xgWe2",
       "moment": "2016-11-18 19:30:00.000",
       "applicable": true,
       "printed": true,
       "published": true,
       "store": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/d5e311c0-91f1-11e6-5bed-427b00000053",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json"
         }
       },
       "project": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/project/7f3a7d7a-97a1-11e6-5bed-427b0000009c",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/project/metadata",
           "type": "project",
           "mediaType": "application/json"
         }
       },
       "organization": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/a1331985-a1c8-11e6-5bed-427b00000084",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "deliveryPlannedMoment": "2016-11-22 12:17:00.000",
       "positions": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/80191fbd-afcf-11e6-5bed-427b00000000/positions",
           "type": "processingorderposition",
           "mediaType": "application/json",
           "size":1,
           "limit": 1000,
           "offset": 0
         }
       },
       "quantity": 1,
       "processingPlan": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
           "type": "processingplan",
           "mediaType": "application/json"
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/8cbaa297-afc8-11e6-5bed-427b00000064",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
         "type": "processingorder",
         "mediaType": "application/json"
       },
       "id": "8cbaa297-afc8-11e6-5bed-427b00000064",
       "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
       "owner": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-11-21 11:58:36.000",
       "name": "1",
       "externalCode": "JZQBX9gshwrrTRcHkCcaR2",
       "moment": "2016-11-21 11:47:00.000",
       "applicable": true,
       "printed": true,
       "published": true,
       "store": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/d5e311c0-91f1-11e6-5bed-427b00000053",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json"
         }
       },
       "project": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/project/7f3a7d7a-97a1-11e6-5bed-427b0000009c",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/project/metadata",
           "type": "project",
           "mediaType": "application/json"
         }
       },
       "organization": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/a1331985-a1c8-11e6-5bed-427b00000084",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "deliveryPlannedMoment": "2016-11-02 11:57:00.000",
       "positions": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/8cbaa297-afc8-11e6-5bed-427b00000064/positions",
           "type": "processingorderposition",
           "mediaType": "application/json",
           "size": 1,
           "limit": 1000,
           "offset": 0
         }
       },
       "quantity": 1,
       "processingPlan": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
           "type": "processingplan",
           "mediaType": "application/json"
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/b5556153-b164-11e6-5bed-427b0000006f",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
         "type": "processingorder",
         "mediaType": "application/json"
       },
       "id": "b5556153-b164-11e6-5bed-427b0000006f",
       "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
       "owner": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-11-23 13:07:57",
       "name": "Production order",
       "description": "Comment",
       "externalCode": "wWAJXKZFgoOZVKd41Dzzz2",
       "moment": "2016-11-23 13:00:00.000",
       "applicable": true,
       "printed": true,
       "published": true,
       "store": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/d5e311c0-91f1-11e6-5bed-427b00000053",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json"
         }
       },
       "project": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/project/7f3a7d7a-97a1-11e6-5bed-427b0000009c",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/project/metadata",
           "type": "project",
           "mediaType": "application/json"
         }
       },
       "organization": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/a1331985-a1c8-11e6-5bed-427b00000084",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "deliveryPlannedMoment": "2016-11-23 13:07:00",
       "positions": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/b5556153-b164-11e6-5bed-427b0000006f/positions",
           "type": "processingorderposition",
           "mediaType": "application/json",
           "size": 2,
           "limit": 1000,
           "offset": 0
         }
       },
       "quantity": 5,
       "processingPlan": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
           "type": "processingplan",
           "mediaType": "application/json"
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c7201428-afcc-11e6-5bed-427b00000068",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
         "type": "processingorder",
         "mediaType": "application/json"
       },
       "id": "c7201428-afcc-11e6-5bed-427b00000068",
       "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
       "owner": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-11-21 17:46:15.000",
       "name": "2",
       "externalCode": "5nSDOrCfjyxt0W1RbY7XZ3",
       "moment": "2016-11-21 12:27:00.000",
       "applicable": true,
       "printed": true,
       "published": true,
       "store": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/d5e311c0-91f1-11e6-5bed-427b00000053",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json"
         }
       },
       "project": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/project/7f3a7d7a-97a1-11e6-5bed-427b0000009c",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/project/metadata",
           "type": "project",
           "mediaType": "application/json"
         }
       },
       "organization": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/a1331985-a1c8-11e6-5bed-427b00000084",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "deliveryPlannedMoment": "2016-11-02 17:43:00.000",
       "positions": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c7201428-afcc-11e6-5bed-427b00000068/positions",
           "type": "processingorderposition",
           "mediaType": "application/json",
           "size": 2,
           "limit": 1000,
           "offset": 0
         }
       },
       "quantity": 1,
       "processingPlan": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
           "type": "processingplan",
           "mediaType": "application/json"
         }
       },
       "processing": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/processing/493ddf6b-aff9-11e6-5bed-427b00000076",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processing/metadata",
             "type": "processing",
             "mediaType": "application/json"
           }
         }
       ]
     }
   ]
}
```

### Create Production Order

Request to create a new Production Order.
Mandatory fields to create:

+ **organization** - Link to your legal entity in the format [Metadata](../#kladana-json-api-general-info-metadata)
+ **processingPlan** - Link to those. map in the format [Metadata](../#kladana-json-api-general-info-metadata)
+ **positions** - Link to items in the Production Order in the format [Metadata](../#kladana-json-api-general-info-metadata)

> An example of creating a new Production Order with a request body containing only the required fields.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/processingorder"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "organization": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "processingPlan": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
                 "type": "processingplan",
                 "mediaType": "application/json"
               }
             },
             "positions": [
               {
                 "quantity": 111,
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/product/eeef177f-f648-11e5-8a84-bae50000007a",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 }
               }
             ]
           }
'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Production Order.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c49e83b3-01af-11e6-9464-e4de00000026",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
     "type": "processingorder",
     "mediaType": "application/json"
   },
   "id": "c49e83b3-01af-11e6-9464-e4de00000026",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-14 13:08:58",
   "name": "000034",
   "externalCode": "DAD9peGij6sDNii49Dkam2",
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
   "sum": 0,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2007-02-07 17:16:41",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c49e83b3-01af-11e6-9464-e4de00000026/positions",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
       "type": "processingorderposition",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   },
   "quantity": 5,
   "processingPlan": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
       "type": "processingplan",
       "mediaType": "application/json"
     }
   }
}
```

> Example withbuildings of a new Production Order with a large request body.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/processingorder"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "000034",
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
             "organization": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "moment": "2016-04-19 13:50:24",
             "applicable": false,
             "state": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
                 "type": "state",
                 "mediaType": "application/json"
               }
             },
             "quantity": 5,
             processingPlan: {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
                 "type": "processingplan",
                 "mediaType": "application/json"
               }
             },
             "positions": [
               {
                 "quantity": 111,
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/product/eeef177f-f648-11e5-8a84-bae50000007a",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Production Order.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c49e83b3-01af-11e6-9464-e4de00000026",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
     "type": "processingorder",
     "mediaType": "application/json"
   },
   "id": "c49e83b3-01af-11e6-9464-e4de00000026",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-14 13:08:58",
   "name": "000034",
   "externalCode": "DAD9peGij6sDNii49Dkam2",
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
   "sum": 0,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2007-02-07 17:16:41",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c49e83b3-01af-11e6-9464-e4de00000026/positions",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
       "type": "processingorderposition",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   },
   "quantity": 5,
   "processingPlan": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
       "type": "processingplan",
       "mediaType": "application/json"
     }
   }
}

```

> An example of a request to create a Production Order with additional fields.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/processingorder"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "organization": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "processingPlan": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
                   "type": "processingplan",
                   "mediaType": "application/json"
                 }
             },
             "positions": [
               {
                 "quantity": 111,
                 "assortment": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/product/eeef177f-f648-11e5-8a84-bae50000007a",
                        "type": "product",
                        "mediaType": "application/json"
                    }
                 }
               }
             ],
             "attributes": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/attributes/c2ecd338-015e-11e6-9464-e4de0000008f",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "Order attribute",
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Production Order.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c49e83b3-01af-11e6-9464-e4de00000026",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
     "type": "processingorder",
     "mediaType": "application/json"
   },
   "id": "c49e83b3-01af-11e6-9464-e4de00000026",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-14 13:08:58",
   "name": "000034",
   "externalCode": "DAD9peGij6sDNii49Dkam2",
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
   "sum": 0,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2007-02-07 17:16:41",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c49e83b3-01af-11e6-9464-e4de00000026/positions",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
       "type": "processingorderposition",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   },"quantity": 5,
   "processingPlan": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
       "type": "processingplan",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/attributes/c2ecd338-015e-11e6-9464-e4de0000008f",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c2ecd338-015e-11e6-9464-e4de0000008f",
       "name": "AttributeName1",
       "type": "string",
       "value": "Order attribute"
     }
   ]
}
```

### Bulk creating and update of Production Orders

[Bulk creating and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Production orders.
In the body of the request, you need to pass an array containing JSON representations of the Production Orders that you want to create or update.
Updated Production Orders must contain the identifier in the form of metadata.

> Example of creating and updating multiple Production Orders

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/processingorder"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "organization": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                   "type": "organization",
                   "mediaType": "application/json"
                 }
               },
               "processingPlan": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
                   "type": "processingplan",
                   "mediaType": "application/json"
                 }
               },
               "positions": [
                 {
                   "quantity": 111,
                   "assortment": {
                     "meta": {
                       "href": "https://api.kladana.com/api/remap/1.2/entity/product/eeef177f-f648-11e5-8a84-bae50000007a",
                       "type": "product",
                       "mediaType": "application/json"
                     }
                   }
                 }
               ]
             },
             {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c49e83b3-01af-11e6-9464-e4de00000026",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
                 "type": "processingorder",
                 "mediaType": "application/json"
               },
               "name": "000034",
               "quantity": 5,
               processingPlan: {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
                   "type": "processingplan",
                   "mediaType": "application/json"
                 }
               }
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Production Orders.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c49e83b3-01af-11e6-9464-e4de00000026",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
       "type": "processingorder",
       "mediaType": "application/json"
     },
     "id": "c49e83b3-01af-11e6-9464-e4de00000026",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
     "updated": "2016-04-14 13:08:58",
     "name": "000034",
     "externalCode": "DAD9peGij6sDNii49Dkam2",
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
     "sum": 0,
     "organization": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     "state": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
         "type": "state",
         "mediaType": "application/json"
       }
     },
     "organizationAccount": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "created": "2007-02-07 17:16:41",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c49e83b3-01af-11e6-9464-e4de00000026/positions",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
         "type": "processingorderposition",
         "mediaType": "application/json",
         "size": 1,
         "limit": 1000,
         "offset": 0
       }
     },
     "quantity": 5,
     "processingPlan": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
         "type": "processingplan",
         "mediaType": "application/json"
       }
     }
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c49e83b3-01af-11e6-9464-e4de00000026",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
       "type": "processingorder",
       "mediaType": "application/json"
     },
     "id": "c49e83b3-01af-11e6-9464-e4de00000026",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
     "updated": "2016-04-14 13:08:58",
     "name": "000034",
     "externalCode": "DAD9peGij6sDNii49Dkam2",
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
     "sum": 0,
     "organization": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     "state": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
         "type": "state",
         "mediaType": "application/json"
       }
     },
     "organizationAccount": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "created": "2007-02-07 17:16:41",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c49e83b3-01af-11e6-9464-e4de00000026/positions",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
         "type": "processingorderposition",
         "mediaType": "application/json",
         "size": 1,
         "limit": 1000,
         "offset": 0
       }
     },
     "quantity": 5,
     "processingPlan": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
         "type": "processingplan",
         "mediaType": "application/json"
       }
     }
   }
]
```

### Delete Production order

**Parameters**

| Parameter | Description |
| ------------ | --------------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Production order id. |
 
> Request to delete the Production Order with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/processingorder/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of the Production Order.

### Bulk deletion of Production Orders

In the body of the request, you need to pass an array containing the JSON metadata of the Production Orders that you want to delete.


> Request for bulk deletion of Production Orders.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/processingorder/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/7944ef04-f831-11e5-7a69-971500188b1",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
                  "type": "processingorder",
                  "mediaType": "application/json"
              }
          },
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/7944ef04-f831-11e5-7a69-971500188b2",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
                  "type": "processingorder",
                  "mediaType": "application/json"
              }
          }
        ]'
```

> Successful request. The result is JSON information about the deletion of Production Orders.

```json
[
   {
     "info":"Entity 'processingorder' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'processingorder' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Metadata of Production Orders
#### Metadata of Production Orders

Request for metadata of Production Orders. The result is a JSON object including:

| Parameter | Description |
| ------------ | --------------- |
| **meta** | Link to Metadata of Production Orders |
| **attributes** | Array of objects additional fields of Production Orders in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **states** | Array of statuses of Production Orders |
| **createShared** | create new Production Orders labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Metadata of Production Orders

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional fields of Production Orders.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/attributes/c2ecd338-015e-11e6-9464-e4de0000008f",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c2ecd338-015e-11e6-9464-e4de0000008f",
       "name": "AttributeName1",
       "type": "string",
       "required": false
     }
   ],
   "states": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56c504-2e58-11e6-8a84-bae500000069",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "New",
       "color": 15106326,
       "stateType": "Regular",
       "entityType": "processingorder"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/states/fb56cae3-2e58-11e6-8a84-bae50000006a",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56cae3-2e58-11e6-8a84-bae50000006a",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Confirmed",
       "color": 40931,
       "stateType": "Regular",
       "entityType": "processingorder"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/states/fb56cf4f-2e58-11e6-8a84-bae50000006b",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56cf4f-2e58-11e6-8a84-bae50000006b",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Assembled",
       "color": 8767198,
       "stateType": "Regular",
       "entityType": "processingorder"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/states/fb56d433-2e58-11e6-8a84-bae50000006c",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56d433-2e58-11e6-8a84-bae50000006c",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Shipped",
       "color": 10774205,
       "stateType": "Regular",
       "entityType": "processingorder"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/states/fb56d92f-2e58-11e6-8a84-bae50000006d",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56d92f-2e58-11e6-8a84-bae50000006d",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Delivered",
       "color": 8825440,
       "stateType": "Successful",
       "entityType": "processingorder"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/states/fb56de0a-2e58-11e6-8a84-bae50000006e",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56de0a-2e58-11e6-8a84-bae50000006e",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Return",
       "color": 15280409,
       "stateType": "Unsuccessful",
       "entityType": "processingorder"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/states/fb56e2b4-2e58-11e6-8a84-bae50000006f",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56e2b4-2e58-11e6-8a84-bae50000006f",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Cancelled",
       "color": 15280409,
       "stateType": "Unsuccessful",
       "entityType": "processingorder"
     }
   ],
   "createShared": false
}

```

### Separate additional field

**Parameters**

| Parameter | Description |
| ------------ | --------------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Fields ID |

 
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/attributes/57ab884e-558b-11e6-8a84-bae500000078",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "57ab884e-558b-11e6-8a84-bae500000078",
   "name": "AttributeName1",
   "type": "productfolder",
   "required": false
}
```

### Production Order Template

#### Production Order template for production based on another transaction

Request for a pre-filled Production Order based on another transaction.
As a result of the request, a pre-filled Production Order template will be created based on the submitted document.

> Request for a Production Order template based on Bills of Materials.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/processingorder/new"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "processingPlan": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/5fbf79f4-adac-11e6-5bed-427b0000006a",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
                 "type": "processingplan",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled Production Order.

```json
{
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2016-12-05 14:35:47",
   "applicable": true,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/a1331985-a1c8-11e6-5bed-427b00000084",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "quantity": 1,
   "processingPlan": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
       "type": "processingplan",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/d5e311c0-91f1-11e6-5bed-427b00000053",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "created": "2007-02-07 17:16:41",
   "printed": true,
   "published": true,
   "positions": {
     "rows": [
       {
         "quantity": 1,
         "assortment": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
           }
         }
       }
     ]
   }
}
```

### Production Order

### Get Production Order

**Parameters**

| Parameter | Description |
| ------------ | --------------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Production Order ID |
 
> Request to receive a separate Production Order with the specified ID.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/processingorder/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Production Order.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/b5556153-b164-11e6-5bed-427b0000006f",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
     "type": "processingorder",
     "mediaType": "application/json"
   },
   "id": "b5556153-b164-11e6-5bed-427b0000006f",
   "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-11-23 13:07:57",
   "name": "Production order",
   "description": "Comment",
   "externalCode": "wWAJXKZFgoOZVKd41Dzzz2",
   "moment": "2016-11-23 13:00:00",
   "applicable": true,
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/d5e311c0-91f1-11e6-5bed-427b00000053",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "project": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/project/7f3a7d7a-97a1-11e6-5bed-427b0000009c",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/project/metadata",
       "type": "project",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/a1331985-a1c8-11e6-5bed-427b00000084",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "deliveryPlannedMoment": "2016-11-23 13:07:00",
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/b5556153-b164-11e6-5bed-427b0000006f/positions",
       "type": "processingorderposition",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     }
   },
   "quantity": 5,
   "processingPlan": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
       "type": "processingplan",
       "mediaType": "application/json"
     }
   }
}
```

### Change Production Order

Request to update the Production Order with the specified id.
In the body of the request, you must specify the meta **processingPlan** field (even if it does not change), and also indicate those fields that need to be changed on the Production Order, except for those marked `Read Only` in the description [Production Order attributes](../documents/#transactions-production-order).

When you update the **organization** field, you must also update the **organizationAccount** field, otherwise an error will occur.

**Parameters**

| Parameter | Description |
| ------------ | --------------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Production Order ID |

> An example of a request to update a Production Order.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/processingorder/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "000034",
             "processingPlan": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
                 "type": "processingplan",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Production Order.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c49e83b3-01af-11e6-9464-e4de00000026",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
     "type": "processingorder",
     "mediaType": "application/json"
   },
   "id": "c49e83b3-01af-11e6-9464-e4de00000026",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-14 13:08:58",
   "name": "000034",
   "externalCode": "DAD9peGij6sDNii49Dkam2",
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
   "sum": 0,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2007-02-07 17:16:41",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c49e83b3-01af-11e6-9464-e4de00000026/positions",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
       "type": "processingorderposition",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   },
   "quantity": 5,
   "processingPlan": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
       "type": "processingplan",
       "mediaType": "application/json"
     }
   }
}
```

> Example of a change request for a Production Order with additional fields.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/processingorder/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "processingPlan": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
                 "type": "processingplan",
                 "mediaType": "application/json"
               }
             }
             "attributes": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/attributes/c2ecd338-015e-11e6-9464-e4de0000008f",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "Updated Order Attribute"
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Production Order.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c49e83b3-01af-11e6-9464-e4de00000026",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
     "type": "processingorder",
     "mediaType": "application/json"
   },
   "id": "c49e83b3-01af-11e6-9464-e4de00000026",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-14 13:08:58",
   "name": "000034",
   "externalCode": "DAD9peGij6sDNii49Dkam2",
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
   "sum": 0,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2007-02-07 17:16:41",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c49e83b3-01af-11e6-9464-e4de00000026/positions",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
       "type": "processingorderposition",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   },
   "quantity": 5,
   "processingPlan": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
       "type": "processingplan",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/attributes/c2ecd338-015e-11e6-9464-e4de0000008f",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c2ecd338-015e-11e6-9464-e4de0000008f",
       "name": "AttributeName1",
       "type": "string",
       "value": "Updated Order Attribute"
     }
   ]
}
```

> An example of a request to update a Production Order with items in the body of the request.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/processingorder/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "processingPlan": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
                 "type": "processingplan",
                 "mediaType": "application/json"
               }
             }
             "positions": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/34efe2ee-015e-11e6-9464-e4de0000006b/positions/34f6344f-015e-11e6-9464-e4de0000006c",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
                   "type": "processingorderposition",
                   "mediaType": "application/json"
                 },
                 "id": "34f6344f-015e-11e6-9464-e4de0000006c",
                 "quantity": 10,
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/product/8b382799-f7d2-11e5-8a84-bae5000003a5",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 }
               },
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/34efe2ee-015e-11e6-9464-e4de0000006b/positions/34f6344f-015e-11e6-9464-e4de0000007c",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
                   "type": "processingorderposition",
                   "mediaType": "application/json"
                 },
                 "id": "34f6344f-015e-11e6-9464-e4de0000007c",
                 "quantity": 20,
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/product/be903062-f504-11e5-8a84-bae50000019a",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 }
               },
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/34efe2ee-015e-11e6-9464-e4de0000006b/positions/34f6344f-015e-11e6-9464-e4de0000008c",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
                   "type": "processingorderposition",
                   "mediaType": "application/json"
                 },
                 "id": "34f6344f-015e-11e6-9464-e4de0000008c",
                 "quantity": 30,
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/product/c02e3a5c-007e-11e6-9464-e4de00000006",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Production Order.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c49e83b3-01af-11e6-9464-e4de00000026",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
     "type": "processingorder",
     "mediaType": "application/json"
   },
   "id": "c49e83b3-01af-11e6-9464-e4de00000026",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-14 13:08:58",
   "name": "000034",
   "externalCode": "DAD9peGij6sDNii49Dkam2",
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
   "sum": 0,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2007-02-07 17:16:41",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/c49e83b3-01af-11e6-9464-e4de00000026/positions",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
       "type": "processingorderposition",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   },
   "quantity": 5,
   "processingPlan": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
       "type": "processingplan",
       "mediaType": "application/json"
     }
   }
}
```

### Production Order Items

A separate resource for managing the items of the Production Order. With it, you can manage the items of a larger document that has more lines than the limit on the number of lines saved with the document. This limit is 1000. You can read more about limits on the number of document lines and working with large documents [here](../#kladana-json-api-general-info-working-with-transaction-items).

### Get Production Order Items

Request to get a list of all items of this Production Order.

| Title | Type | Description |
| ----- | ------- |------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the items of the Production Order. |

**Parameters**

| Parameter | Description |
| ---------| -----------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Production Order ID |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Production Order Items

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/processingorder/7944ef04-f831-11e5-7a69-971500188b19/positions"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the item list of a single Production Order.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/7944ef04-f831-11e5-7a69-971500188b19/positions",
     "type": "processingorderposition",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/7944ef04-f831-11e5-7a69-971500188b19/positions/c7218ccd-afcc-11e6-5bed-427b00000069",
         "type": "processingorderposition",
         "mediaType": "application/json"
       },
       "id": "c7218ccd-afcc-11e6-5bed-427b00000069",
       "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
       "quantity": 45,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
         }
       },
       "reserve": 45
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/7944ef04-f831-11e5-7a69-971500188b19/positions/c72196c6-afcc-11e6-5bed-427b0000006a",
         "type": "processingorderposition",
         "mediaType": "application/json"
       },
       "id": "c72196c6-afcc-11e6-5bed-427b0000006a",
       "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
       "quantity": 45,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/1267a23f-acdc-11e6-5bed-427b00000086",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
         }
       },
       "reserve": 45
     }
   ]
}
```

### Production Order Item

Line item of the Production Order with the specified item id.

### Get Item

**Parameters**

| Parameter | Description |
| ------------ | --------------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* The of the production order. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Production Order item id. |
 
> Request to receive a separate item of the Production Order with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/processingorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a line item of the Production Order.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
     "type": "processingorderposition",
     "mediaType": "application/json"
   },
   "id": "34f6344f-015e-11e6-9464-e4de0000006c",
   "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
   "quantity": 45,
   "assortment": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
     }
   },
   "reserve": 45
}

```

### Change Item

Request to update a line item of the Production Order. There is no way to update the item required fields in the body of the request. Only the ones you want to update.

**Parameters**

| Parameter | Description |
| ----------| ------------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Production Order ID |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Production Order item ID|

> An example of a request to update a line item in a Production Order.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/processingorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
               "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
               "type": "processingorderposition",
               "mediaType": "application/json"
             },
             "id": "34f6344f-015e-11e6-9464-e4de0000006c",
             "quantity": 111,
             "assortment": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/product/eeef177f-f648-11e5-8a84-bae50000007a",
                 "type": "product",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Production Order item.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingorder/metadata",
     "type": "processingorderposition",
     "mediaType": "application/json"
   },
   "id": "34f6344f-015e-11e6-9464-e4de0000006c",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "quantity": 111,
   "assortment": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/eeef177f-f648-11e5-8a84-bae50000007a",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
     }
   },
   "reserve": 0
}
```

### Delete item

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Production Order ID |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Production Order item ID |
 
> Request to delete a Production Order item with the specified ID.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/processingorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of the Production Order item.


### Bulk deletion of items

**Parameters**

| Parameter | Description |
| **id**  | `string` (required) *Example: 3e1c03bb-684f-11ee-ac12-000c000000b0* Production Order ID. |

> Request to bulk delete the Production Order items.

```shell
curl -X POST
  "https://api.kladana.com/api/remap/1.2/entity/processingorder/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/delete"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
  -H "Content-Type: application/json"
  -d '[
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/7fce2da5-684d-11ee-ac12-000c000000a2",
            "type": "processingorderposition",
            "mediaType": "application/json"
          }
        },
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/processingorder/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/7fce37a5-684d-11ee-ac12-000c000000a3",
            "type": "processingorderposition",
            "mediaType": "application/json"
          }
        }
      ]'  
```

> Response 200 (application/json)
Successful deletion of the Production Order items.