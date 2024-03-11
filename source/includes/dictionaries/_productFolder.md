## Product group
### Product groups
Using the JSON API, you can create and update information about Product Groups, request lists of Product Groups, and information on individual Product Groups. The entity code for a Product Group in the JSON API is the **productfolder** keyword.
This entity can be contextually searched using the special `search` parameter. More details can be found at [link](../#kladana-json-api-general-info-context-search).

The search among the objects of product groups to match the search string will be carried out using the following fields:

+ by name Product group (name)
+ by code Group of goods (code)

#### Entity attributes
| Title | Type                                               | Filtration | Description |
| ----- |----------------------------------------------------|------- | ------- |
| **accountId** | UUID                                               | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **archived** | Boolean                                            | `=` `!=` | Has the Product group been added to the archive<br>`+Required when replying` `+Read-only` |
| **code** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Product group code |
| **description** | String(4096)                                       | `=` `!=` `~` `~=` `=~` | Description Product groups |
| **effectiveVat** | Int                                                | | Real VAT %<br>`+Read only` |
| **effectiveVatEnabled** | Boolean                                            | | Additional characteristic for determining delimitation of real VAT = 0 or "without VAT". (effectiveVat = 0, effectiveVatEnabled = false) -> "without VAT", (effectiveVat = 0, effectiveVatEnabled = true) -> 0%.<br>`+Read Only` |
| **externalCode** | String(255)                                        | `=` `!=` `~` `~=` `=~` | External Code of Product group<br>`+Required when replying` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee department metadata<br>`+Required when replying` `+Expand` |
| **id** | UUID                                               | `=` `!=` | Product Group ID<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Product Group Metadata<br>`+Required when replying` |
| **name** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Product Group Name<br>`+ Mandatory forresponse` `+Required when creating` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee) metadata<br>`+Expand` |
| **pathName** | String                                             | `=` `!=` `~` `~=` `=~` | Name of the Product Group that this Product Group belongs to<br>`+Required when replying` `+Read Only` |
| **productFolder** | [Meta](../#kladana-json-api-general-info-metadata) | | Link to the Group of goods, which includes this Group of goods, in the Metadata format<br>`+Expand` |
| **shared** | Boolean                                            | `=` `!=` | Sharing<br>`+Required when replying` |
| **taxSystem** | Enum                                               | | Tax system code. [More here](../dictionaries/#entities-product-group-tax-system-code) |
| **updated** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | When the entity was last updated<br>`+Required for response` `+Read-only` |
| **useParentVat** | Boolean                                            | | Whether the VAT rate of the parent group is used. If true for the assortment unit, the rate set for the parent group will be applied.<br>`+Required when answering` |
| **vat** | Int                                                | | VAT % |
| **vatEnabled** | Boolean                                            | | Is VAT included for the group. With this flag, you can set VAT = 0 or VAT = "excluding VAT" for a group. (vat = 0, vatEnabled = false) -> vat = "excluding VAT", (vat = 0, vatEnabled = true) -> vat = 0%. |

### Tax system code
The values of the taxSystem field.

| Value | Description |
| ------- | ------------ |
| **GENERAL_TAX_SYSTEM** | DOS |
| **PATENT_BASED** | Patent |
| **PRESUMPTIVE_TAX_SYSTEM** | UTII |
| **SIMPLIFIED_TAX_SYSTEM_INCOME** | USN. Income |
| **SIMPLIFIED_TAX_SYSTEM_INCOME_OUTCOME** | USN. Income-Expense |
| **TAX_SYSTEM_SAME_AS_GROUP** | Same as group |
| **UNIFIED_AGRICULTURAL_TAX** | ESHN |

### Get a list of product groups
Query all Product Groups on a given account.
Result: JSON object including fields:

| Title | Type | Description |
| ------- | ------------ |-------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing product groups. |

**Parameters**

| Parameter | Description|
| ------- | ------------ |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get a list of product groups

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/productfolder"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Product Groups.

```json
{
   "context": {
     "employee": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/context/employee",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     }
   },
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/productFolder",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/productFolder/metadata",
     "type": "productfolder",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/productfolder/3ea73e1a-2cad-11e6-8a84-bae50000001d",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/productfolder/metadata",
         "type": "productfolder",
         "mediaType": "application/json"
       },
       "id": "3ea73e1a-2cad-11e6-8a84-bae50000001d",
       "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
       "owner": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-06-07 15:42:07",
       "name": "Vegetables",
       "code": "13321Fruits1",
       "externalCode": "mRQao-5IgY3soIY1EaI083",
       "archived": false,
       "pathName": "",
       "vatEnabled": false,
       "useParentVat": true
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/productfolder/275961ab-2cad-11e6-8a84-bae50000001a",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/productfolder/metadata",
         "type": "productfolder",
         "mediaType": "application/json"
       },
       "id": "275961ab-2cad-11e6-8a84-bae50000001a",
       "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
       "updated": "2016-06-07 15:41:28",
       "name": "Fruits",
       "code": "13321Fruits",
       "externalCode": "extFruits",
       "archived": false,
       "pathName": "",
       "vat": 3,
       "vatEnabled": true,
       "useParentVat": false,
       "effectiveVat": 3,
       "effectiveVatEnabled": true,
       "taxSystem": "GENERAL_TAX_SYSTEM"
     }
   ]
}
```

### Create a new product group
 
Request to create a new Product Group.
Mandatory fields for creating a Group of goods:

| Title | Description |
| ------------- | ------------|
| **name** | Product group name |

> An example of creating a new Product Group with a request body containing only the name field.

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/productfolder"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "Vegetables"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Product Group.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/productfolder/3ea73e1a-2cad-11e6-8a84-bae50000001d",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/productfolder/metadata",
     "type": "productfolder",
     "mediaType": "application/json"
   },
   "id": "3ea73e1a-2cad-11e6-8a84-bae50000001d",
   "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-06-07 15:42:07",
   "name": "Vegetables",
   "code": "13321Fruits1",
   "externalCode": "mRQao-5IgY3soIY1EaI083",
   "archived": false,
   "pathName": "",
   "vatEnabled": false,
   "useParentVat": true
}
```

> An example of creating a new Product Group with a richer request body.

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/productfolder"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "Fruits",
             "code": "13321Fruits",
             "externalCode": "extFruits",
             vat: 3,
             "effectiveVat": 3
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Product Group.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/productfolder/275961ab-2cad-11e6-8a84-bae50000001a",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/productfolder/metadata",
     "type": "productfolder",
     "mediaType": "application/json"
   },
   "id": "275961ab-2cad-11e6-8a84-bae50000001a",
   "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-06-07 15:41:28",
   "name": "Fruits",
   "code": "13321Fruits",
   "externalCode": "extFruits",
   "archived": false,
   "pathName": "",
   "vat": 3,
   "vatEnabled": true,
   "useParentVat": false,
   "effectiveVat": 3,
   "effectiveVatEnabled": true
}
```

### Product group bulk creating an update
[Product group bulk creating ang update](../#kladana-json-api-general-info-create-and-update-multiple-objects).
In the body of the request, you need to pass an array containing the JSON representation of the Product Groups that you want to create or update.
Updated Product Groups must contain the identifier in the form of metadata.

> Example of creating and updating several Product Groups

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/productfolder"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "Vegetables"
             },
             {
               "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/productfolder/3ea73e1a-2cad-11e6-8a84-bae50000001d",
                 "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/productfolder/metadata",
                 "type": "productfolder",
                 "mediaType": "application/json"
               },
               "name": "Group Vegetables",
               "code": "vegetableFolderCode",
               "externalCode": "extVegCode",
               "vat": 5,
               "effectiveVat": 5
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Product Groups.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/productfolder/3ea73e1a-2cad-11e6-8a84-bae50000001d",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/productfolder/metadata",
       "type": "productfolder",
       "mediaType": "application/json"
     },
     "id": "3ea73e1a-2cad-11e6-8a84-bae50000001d",
     "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
     "owner": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": false,
     "group": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-06-07 15:42:07",
     "name": "Vegetables",
     "code": "13321Fruits1",
     "externalCode": "mRQao-5IgY3soIY1EaI083",
     "archived": false,
     "pathName": "",
     "vatEnabled": false,
     "useParentVat": true
   },
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/productfolder/3ea73e1a-2cad-11e6-8a84-bae50000001d",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/productfolder/metadata",
       "type": "productfolder",
       "mediaType": "application/json"
     },
     "id": "3ea73e1a-2cad-11e6-8a84-bae50000001d",
     "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
     "owner": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": false,
     "group": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-06-07 15:45:28",
     "name": "Group Vegetables",
     "code": "vegetableFolderCode",
     "externalCode": "extVegCode",
     "archived": false,
     "pathName": "",
     "vat": 5,
     "vatEnabled": true,
     "useParentVat": false,
     "effectiveVat": 5,
     "effectiveVatEnabled": true
   }
]
```

### Delete Product Group

**Parameters**

| Parameter | Description |
| ------- | ------------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product group id. |

> Request to delete the Group of goods with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.in/api/remap/1.2/entity/productfolder/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of the Product group.

### Bulk deletion of Product group

In the body of the request, you need to pass an array containing the JSON metadata of the Product Groups that you want to remove.


> Request for bulk deletion of Product Groups.

```shell
curl -X POST
   "https://api.kladana.in/api/remap/1.2/entity/productfolder/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
          {
              "meta": {
                  "href": "https://api.kladana.in/api/remap/1.2/entity/productfolder/7944ef04-f831-11e5-7a69-971500188b1",
                  "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/productfolder/metadata",
                  "type": "productfolder",
                  "mediaType": "application/json"
              }
          },
          {
              "meta": {
                  "href": "https://api.kladana.in/api/remap/1.2/entity/productfolder/7944ef04-f831-11e5-7a69-971500188b2",
                  "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/productfolder/metadata",
                  "type": "productfolder",
                  "mediaType": "application/json"
              }
          }
      ]'
```

> Successful request. Result - JSON information about deleting Product Groups.

```json
[
   {
     "info":"Entity 'productfolder' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'productfolder' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Product Group Metadata
#### Product Group Metadata
 
Request to get metadata of Product Groups. The result is a JSON object including:

| Title | Type | Description |
| ------- | ------------ |---- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Product Groups Metadata<br>`+Required when replying` |
| **attributes** | Array(Object) | Collection of additional fields |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Get product group metadata

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/productfolder/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional Product Group fields.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/productfolder/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "id": "5290a290-0313-11e6-9464-e4de00000020",
       "name": "attribute_name",
       "type": "boolean",
       "required": false
     }
   ]
}
```
  
### Separate additional field

**Parameters**

| Parameter | Description |
| ------- | ------------ |
| **id** | `string` (required) *Example: 5290a290-0313-11e6-9464-e4de00000020* id fields. |

#### Separate additional field
 
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/productfolder/metadata/attributes/5290a290-0313-11e6-9464-e4de00000020"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/productfolder/metadata/attributes/5290a290-0313-11e6-9464-e4de00000020",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "5290a290-0313-11e6-9464-e4de00000020",
   "name": "attribute_name",
   "type": "boolean",
   "required": false
}
```
 
### Product group

**Parameters**

| Parameter | Description |
| ------- | ------------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product group id. |

### Get Product Group
 
> Request to receive a separate group of goods with the specified id.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/productfolder/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Product Group.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/productfolder/3ea73e1a-2cad-11e6-8a84-bae50000001d",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/productfolder/metadata",
     "type": "productfolder",
     "mediaType": "application/json"
   },
   "id": "3ea73e1a-2cad-11e6-8a84-bae50000001d",
   "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-06-07 15:42:07",
   "name": "Vegetables",
   "code": "13321Fruits1",
   "externalCode": "mRQao-5IgY3soIY1EaI083",
   "archived": false,
   "pathName": "",
   "vatEnabled": false,
   "useParentVat": true
}
```

### Change Product Group
 
Request to update the Product group with the specified id.
In the request body, you can specify only those fields that need to be changed for the Product group, except for those that
are marked `Read Only` in the description of [Product Group attributes](../dictionaries/#entities-product-group).
To update the **pathName** field, you need to update the link to the parent Product Group, i.e. update field
**productFolder**

**Parameters**

| Parameter | Description |
| ------- | ------------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product group id. |

> An example of a request to update a specific Product Group.

```shell
   curl -X PUT
     "https://api.kladana.in/api/remap/1.2/entity/productfolder/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "Group Vegetables",
             "code": "vegetableFolderCode",
             "externalCode": "extVegCode",
             "vat": 5,
             "effectiveVat": 5
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Product Group.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/productfolder/3ea73e1a-2cad-11e6-8a84-bae50000001d",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/productfolder/metadata",
     "type": "productfolder",
     "mediaType": "application/json"
   },
   "id": "3ea73e1a-2cad-11e6-8a84-bae50000001d",
   "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-06-07 15:45:28",
   "name": "Group Vegetables",
   "code": "vegetableFolderCode",
   "externalCode": "extVegCode",
   "archived": false,
   "pathName": "",
   "vat": 5,
   "vatEnabled": true,
   "useParentVat": false,
   "effectiveVat": 5,
   "effectiveVatEnabled": true
}
```
