## Bills of Materials

Using the JSON API, you can create and update information about Bills of Materials, query lists of the Bills of Materials, and information by a Bills of Material. Bills of Materials items can be managed both as part of a separate Bill of Materials, and separately - with the help of special resources for managing materials and products of a Bill of Materials. The entity code for a Bill of Materials in the JSON API is the **processingplan** keyword. Learn more about [Bills of Materials](https://kladana.zendesk.com/hc/en-us/articles/7349036390673-Bills-of-Materials).

### Bills of Materials
#### Entity attributes

| Title | Type                                               | Filtration | Description |
| ------ |----------------------------------------------------| ------ |-----|
| **accountId** | UUID                                               | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **code** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Code Bills of Materials |
| **cost** | Int                                                | | Production cost |
| **deleted** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | The moment of the last removal Bills of Materials<br>`+Read Only` |
| **externalCode** | String(255)                                        | `=` `!=` `~` `~=` `=~` | External code Bills of Materials<br>`+Required when answering` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID                                               | `=` `!=` | Bill of Materials ID<br>`+Required when replying` `+Read only` |
| **materials** | MetaArray                                          | | Material Metadata Collection Bills of Materials<br>`+Required when replying` `+Expand` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Metadata Bills of Materials<br>`+Required when answering` |
| **name** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Name Bills of Materials<br>`+Required when replying` `+Required when creating` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Required when replying` `+Expand` |
| **parent** | [Meta](../#kladana-json-api-general-info-metadata) | | Tech group metadata cards<br>`+Required when replying` `+Expand` |
| **pathName** | String                                             | | The name of the group that includes Bill of Materials<br>`+Required when replying` `+Read only` |
| **products** | MetaArray                                          | | Collection of finished products metadata Bills of Materials<br>`+Required when replying` `+Expand` `+Required when creating` |
| **shared** | Boolean                                            | `=` `!=` | Sharing<br>`+Required when replying` |
| **updated** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | The moment of the last update Bills of Materials<br>`+Required when replying` `+Read only` |

#### Bills of Materials

Bills of Materials are a list of products and product variants. Material object of Bills of Materials contains the following fields:

| Title                         | Type                                               | Description                                                                                                                                                                               |
|-------------------------------|----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **accountId**                 | UUID                                               | Account ID<br>`+Required when replying` `+Read Only`                                                                                                                                      |
| **assortment**                | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the item or item variant<br>`+Required when replying` `+Expand`                                                                                                               |
| **id**                        | UUID                                               | Stuff ID<br>`+Required when replying` `+Read Only`                                                                                                                                        |
| **product**                   | [Meta](../#kladana-json-api-general-info-metadata) | Item metadata. If a modification is specified in the **assortment** field, then this field contains the product to which this modification relates<br>`+Required when replying` `+Expand` |
| **quantity**                  | Int                                                | Quantity of goods of this type in item<br>`+Required when answering`                                                                                                                      |
| **processingProcessPosition** | [Meta](../#kladana-json-api-general-info-metadata) | Process item metadata<br>`+Required when replying`                                                                                                                                        |
| **materialProcessingPlan**    | [Meta](../#kladana-json-api-general-info-metadata) | Material BoM item metadata<br>`+Read Only`                                                                                                                                                |

Peculiarities: if you do not specify a connection with the item of the technological process when adding a material, then by default the material will be linked to the first item of the technological process.

#### Products of Bills of Materials

Products of Bills of Materials are a list of goods / modifications obtained during production.
Product Object of a Bill of Materials contains the following fields:

| Title | Type | Description |
| -------- | -------- |------- |
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Read Only` |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the item or item variant<br>`+Required when replying` `+Expand` |
| **id** | UUID | Product ID<br>`+Required when replying` `+Read Only` |
| **product** | [Meta](../#kladana-json-api-general-info-metadata) | Item metadata. If a modification is specified in the **assortment** field, then this field contains the product to which this modification relates<br>`+Required when replying` `+Expand` |
| **quantity** | Int | Quantity of goods of this type in item<br>`+Required when answering` |

You can work with materials and products using [special resources for managing items of Bills of Materials](../dictionaries/#entities-bills-of-materials),
and also as part of a separate Bills of Materials. When working as part of a separate Bills of Materials,
you can send requests to create a separate Bill of Materials included in the request body
arrays of materials and products of Bills of Materials. If the quantity of materials or products exceeds the maximum allowable, then for
further replenishment of materials and products will need to work with special resources "Dashboard Materials" and "Dashboard Products".

Also, when working as part of a separate Bill of Materials, you can send requests to update the list of materials and products
with arrays of materials and products included in the Bill of Materials request body. 

It is important to remember that collections of materials and products
will completely replace existing collections when updating an object - superfluous
items will be deleted, new ones added, existing ones changed.


### Get a list of Bills of Materials

Request all Bills of Materials on this account.
Result: JSON object including fields:

| Title | Type | Description |
| -------- | -------- |---- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the Bills of Materials. |

**Parameters**

| Parameter | Description |
| -------- | -------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** | `string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Get a list of Bills of Materials

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/processingplan"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Bill of Materials.

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
     "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplan/metadata",
     "type": "processingplan",
     "mediaType": "application/json",
     "size": 3,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplan/metadata",
         "type": "processingplan",
         "mediaType": "application/json"
       },
       "id": "1a18770e-ad9a-11e6-5bed-427b00000064",
       "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
       "owner": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": true,
       "group": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-11-21 14:55:08",
       "name": "Technical card",
       "externalCode": "4geOQkq5h7d5w1-tUATmt3",
       "pathName": "",
       "cost": 1000,
       "materials": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/materials",
           "type": "processingplanmaterial",
           "mediaType": "application/json",
           "size": 1,
           "limit": 1000,
           "offset": 0
         }
       },
       "products": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/products",
           "type": "processingplanresult",
           "mediaType": "application/json",
           "size": 2,
           "limit": 1000,
           "offset": 0
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/6b4ffbf7-ac12-11e6-5bed-427b00000091",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplan/metadata",
         "type": "processingplan",
         "mediaType": "application/json"
       },
       "id": "6b4ffbf7-ac12-11e6-5bed-427b00000091",
       "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
       "owner": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": true,
       "group": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-11-17 14:48:32",
       "name": "Technical card",
       "externalCode": "Lr9zJa9qgpvs6f6laIgtG2",
       "pathName": "Group",
       "parent": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/bfb6c5dc-acbb-11e6-5bed-427b00000001",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/metadata",
           "type": "processingplanfolder",
           "mediaType": "application/json"
         }
       },
       "cost": 2000,
       "materials": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/6b4ffbf7-ac12-11e6-5bed-427b00000091/materials",
           "type": "processingplanmaterial",
           "mediaType": "application/json",
           "size": 1,
           "limit": 1000,
           "offset": 0
         }
       },
       "products": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/6b4ffbf7-ac12-11e6-5bed-427b00000091/products",
           "type": "processingplanresult",
           "mediaType": "application/json",
           "size": 1,
           "limit": 1000,
           "offset": 0
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplan/metadata",
         "type": "processingplan",
         "mediaType": "application/json"
       },
       "id": "c38e50b0-acdc-11e6-5bed-427b0000009e",
       "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
       "owner": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": true,
       "group": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-11-17 18:44:45",
       "name": "Map",
       "externalCode": "QrWcKk6mhnNX2Jhi-WsIh2",
       "pathName": "Group",
       "parent": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/bfb6c5dc-acbb-11e6-5bed-427b00000001",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplanfolder/metadata",
           "type": "processingplanfolder",
           "mediaType": "application/json"
         }
       },
       "cost": 10000,
       "materials": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e/materials",
           "type": "processingplanmaterial",
           "mediaType": "application/json",
           "size": 2,
           "limit": 1000,
           "offset": 0
         }
       },
       "products": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e/products",
           "type": "processingplanresult",
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

### Create Bill of Materials

Request for the creation of a new Bill of Materials.
Mandatory fields to create:

+ **name** - Bill of Materials Name
+ **products** - List of finished products Bill of Materials in the format [Metadata](../#kladana-json-api-general-info-metadata)

> An example of creating a new Dashboard with a request body containing only the required fields.

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/processingplan"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "Example",
             "cost": 1000,
             "products": [
               {
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.in/api/remap/1.2/entity/product/0da78cd1-91f2-11e6-5bed-427b0000009a",
                     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 },
                 "quantity": 1
               },
               {
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.in/api/remap/1.2/entity/variant/0da78cd1-91f2-11e6-5bed-427b0000009a",
                     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/variant/metadata",
                     "type": "variant",
                     "mediaType": "application/json"
                   }
                 },
                 "quantity": 1
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Bills of Materials.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplan/metadata",
     "type": "processingplan",
     "mediaType": "application/json"
   },
   "id": "120a488b-b0bd-11e6-5bed-427b00000000",
   "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
   "owner": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-11-22 17:07:57",
   "name": "123sdf",
   "externalCode": "llZWq551h90XDJuYADvry0",
   "pathName": "",
   "cost": 1000,
   "materials": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/materials",
       "type": "processingplanmaterial",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "products": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/products",
       "type": "processingplanresult",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     }
   }
}
```

### Bulk creation and update of Bill of Materials
[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of a Bill of Materials.
In the body of the request, you need to pass an array containing the JSON representation of Bills of Materials you want to create or update.
Updated Bills of Materials must contain the identifier in the form of metadata.

> An example of creating and updating several Bills of Materials

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/processingplan"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
            {
                "name": "Example",
                "cost": 1000,
                "materials": [
                    {
                        "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
                        "assortment": {
                            "meta": {
                                "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
                                "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
                                "type": "product",
                                "mediaType": "application/json"
                            }
                        },
                        "processingProcessPosition": {
                            "meta": {
                                "href": "https://api.kladana.in/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf/positions/d8da461d-bbf9-11ed-ac12-0010000000c0",
                                "type": "processingprocessposition",
                                "mediaType": "application/json"
                            }
                        },
                        "quantity": 1
                    }
                ],
                "products": [
                    {
                        "assortment": {
                            "meta": {
                                "href": "https://api.kladana.in/api/remap/1.2/entity/product/0da78cd1-91f2-11e6-5bed-427b0000009a",
                                "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
                                "type": "product",
                                "mediaType": "application/json"
                            }
                        },
                        "quantity": 1
                    },
                    {
                        "assortment": {
                            "meta": {
                                "href": "https://api.kladana.in/api/remap/1.2/entity/variant/0da78cd1-91f2-11e6-5bed-427b0000009a",
                                "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/variant/metadata",
                                "type": "variant",
                                "mediaType": "application/json"
                            }
                        },
                        "quantity": 1
                    }
                ]
            },
            {
                "meta": {
                    "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064",
                    "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplan/metadata",
                    "type": "processingplan",
                    "mediaType": "application/json"
                },
                "name": "Technical card",
                "cost": 100000
            }
        ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations created and updated by Bill of Materials.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplan/metadata",
       "type": "processingplan",
       "mediaType": "application/json"
     },
     "id": "120a488b-b0bd-11e6-5bed-427b00000000",
     "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
     "owner": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": true,
     "group": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-11-22 17:07:57",
     "name": "123sdf",
     "externalCode": "llZWq551h90XDJuYADvry0",
     "pathName": "",
     "cost": 1000,
     "materials": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/materials",
         "type": "processingplanmaterial",
         "mediaType": "application/json",
         "size": 1,
         "limit": 1000,
         "offset": 0
       }
     },
     "products": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/products",
         "type": "processingplanresult",
         "mediaType": "application/json",
         "size": 2,
         "limit": 1000,
         "offset": 0
       }
     }
   },
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplan/metadata",
       "type": "processingplan",
       "mediaType": "application/json"
     },
     "id": "1a18770e-ad9a-11e6-5bed-427b00000064",
     "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
     "owner": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": true,
     "group": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-11-21 14:55:08",
     "name": "Technical card",
     "externalCode": "4geOQkq5h7d5w1-tUATmt3",
     "pathName": "",
     "cost": 100000,
     "materials": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/materials",
         "type": "processingplanmaterial",
         "mediaType": "application/json",
         "size": 1,
         "limit": 1000,
         "offset": 0
       }
     },
     "products": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/products",
         "type": "processingplanresult",
         "mediaType": "application/json",
         "size": 2,
         "limit": 1000,
         "offset": 0
       }
     }
   }
]
```

### Delete Bill of Materials

**Parameters**

| Parametr | Description |
| -------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bill of Materials id. |
 
> Request for deletion of Bills of Materials with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.in/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful removal of Bills of Materials.

### Bills of Materials Bulk deletion

In the body of the request, you need to pass an array containing JSON metadata Bills of Materials you want to delete.


> Bulk Deletion Request of Bills of Materials.

```shell
curl -X POST
   "https://api.kladana.in/api/remap/1.2/entity/processingplan/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
          {
              "meta": {
                  "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b1",
                  "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplan/metadata",
                  "type": "processingplan",
                  "mediaType": "application/json"
              }
          },
          {
              "meta": {
                  "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b2",
                  "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplan/metadata",
                  "type": "processingplan",
                  "mediaType": "application/json"
              }
          }
      ]'
```

> Successful request. Result - JSON information about deletion of Bills of Materials.

```json
[
   {
     "info":"Entity 'processingplan' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'processingplan' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Bill of Materials

### Get Bill of Materials

**Parameters**

| Parameter | Description |
| -------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bills of Materials id. |
 
> Request for a separate Bill of Materials with the specified id.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of Bills of Materials.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplan/metadata",
     "type": "processingplan",
     "mediaType": "application/json"
   },
   "id": "1a18770e-ad9a-11e6-5bed-427b00000064",
   "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
   "owner": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-11-21 14:55:08",
   "name": "Technical card",
   "externalCode": "4geOQkq5h7d5w1-tUATmt3",
   "pathName": "",
   "cost": 1000,
   "materials": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/materials",
       "type": "processingplanmaterial",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   },
   "products": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/products",
       "type": "processingplanresult",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     }
   }
}

```

### Edit Bill of Materials

Update Request Bills of Materials with the specified id.
In the body of the request, you can specify only those fields that need to be changed in Bill of Materials other than those
are marked `Read-Only` in the description of [Bill of Materials Attribute](../dictionaries/#entities-bills-of-materials).

**Parameters**

| Parameter | Description |
| -------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bill of Materials id. |

> An example of a request to update a separate Bill of Materials.

```shellcurl -X PUT
     "https://api.kladana.in/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "Technical card",
             "cost": 100000
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Bill of Materials.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/processingplan/metadata",
     "type": "processingplan",
     "mediaType": "application/json"
   },
   "id": "1a18770e-ad9a-11e6-5bed-427b00000064",
   "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
   "owner": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-11-21 14:55:08",
   "name": "Technical card",
   "externalCode": "4geOQkq5h7d5w1-tUATmt3",
   "pathName": "",
   "cost": 100000,
   "materials": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/materials",
       "type": "processingplanmaterial",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   },
   "products": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/products",
       "type": "processingplanresult",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     }
   }
}
```

### Bills of Materials

Separate resource for materials management Bill of Materials. With it, you can manage the content of a larger document, the amount of content in which exceeds the limit on the amount of content saved with the document. This limit is 1000. You can read more about limits on the number of document lines and working with large documents [here](../#kladana-json-api-general-info-working-with-transaction-items).

### Get Bill of Materials

Request for a list of all materials of the Bill of Materials.

| Title | Type | Description |
| -------- | -------- |------ |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the Bill of Materials. |

**Parameters**

| Parameter | Description |
| -------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bill of Materials. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Bill of Materials

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19/materials"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of materials of a separate Bill of Materials.

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
     "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/materials",
     "type": "processingplanmaterial",
     "mediaType": "application/json",
     "size": 1,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/materials/120b4591-b0bd-11e6-5bed-427b00000001",
         "type": "processingplanmaterial",
         "mediaType": "application/json"
       },
       "id": "120b4591-b0bd-11e6-5bed-427b00000001",
       "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
       "product": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json"
         }
       },
       "assortment": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json"
         }
       },
       "quantity": 1,
       "processingProcessPosition": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf/positions/d8da461d-bbf9-11ed-ac12-0010000000c0",
           "type": "processingprocessposition",
           "mediaType": "application/json"
         }
       }
     }
   ]
}
```

### Create Bill of Materials

Request to create a new material in a Bill of Materials.
If, when adding a material, you do not specify a link with the item of the technological process, then by default the material will be linked to the first item of the technological process.
For successful creation, the following fields must be specified in the request body:

+ **product** - Link to the product, which is a item.
+ **quantity** - Quantity of goods in the item.

**Parameters**

| Parameter | Description |
| -------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bill of Materials. |

> An example of creating one material in a Bill of Materials.

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19/materials"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
                   "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
                   "type": "product",
                   "mediaType": "application/json"
                 }
               },
               "quantity": 1
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created material of a separate Bill of Materials.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/materials/120b4591-b0bd-11e6-5bed-427b00000001",
       "type": "processingplanmaterial",
       "mediaType": "application/json"
     },
     "id": "120b4591-b0bd-11e6-5bed-427b00000001",
     "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
     "product": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       }
     },
     "assortment": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       }
     },
     "quantity": 1,
     "processingProcessPosition": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf/positions/d8da461d-bbf9-11ed-ac12-0010000000c0",
         "type": "processingprocessposition",
         "mediaType": "application/json"
       }
     }
   }
]
```

> An example of creating several materials at once in a Bill of Materials with and without reference to technical process positions

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19/materials"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
                   "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
                   "type": "product",
                   "mediaType": "application/json"
                 }
               },
               "quantity": 1,
               "processingProcessPosition": {
                 "meta": {
                   "href": "https://api.kladana.in/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf/positions/934b5505-ac45-11ed-ac12-000f0000002c",
                   "type": "processingprocessposition",
                   "mediaType": "application/json"
                 }
               }
             },
             {
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.in/api/remap/1.2/entity/variant/0de151c1-acdc-11e6-5bed-427b00000079",
                   "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/variant/metadata",
                   "type": "variant",
                   "mediaType": "application/json"
                 }
               },
               "quantity": 2
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of created materials of a separate Bill of Materials.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/materials/120b4591-b0bd-11e6-5bed-427b00000001",
       "type": "processingplanmaterial",
       "mediaType": "application/json"
     },
     "id": "120b4591-b0bd-11e6-5bed-427b00000001",
     "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
     "product": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       }
     },
     "assortment": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       }
     },
     "quantity": 1,
     "processingProcessPosition": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf/positions/934b5505-ac45-11ed-ac12-000f0000002c",
         "type": "processingprocessposition",
         "mediaType": "application/json"
       }
     }
   },
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/materials/120b4591-b0bd-11e6-5bed-427b00000002",
       "type": "processingplanmaterial",
       "mediaType": "application/json"
     },
     "id": "120b4591-b0bd-11e6-5bed-427b00000002",
     "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
     "product": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000081",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       }
     },
     "assortment": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/variant/0de151c1-acdc-11e6-5bed-427b00000079",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       }
     },
     "quantity": 2,
     "processingProcessPosition": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf/positions/d8da461d-bbf9-11ed-ac12-0010000000c0",
         "type": "processingprocessposition",
         "mediaType": "application/json"
       }
     }
   }
]
```

### Bill of Materials
 
### Get Bill of Materials

**Parameters**

| Parameter | Description |
| -------- | -------- |
| **id** | `string` (required) *Example: d72b4281-b000-11e6-8af5-581e00000074* Bill of Materials id. |
| **positionID** | `string` (required) *Example: 9560e3e3-9609-11e6-8af5-581e00000008* Bill of Materials item id. |
 
> Request for separate Bill of Materials with the specified id.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/processingplan/d72b4281-b000-11e6-8af5-581e00000074/materials/9560e3e3-9609-11e6-8af5-581e00000008"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate Bill of Materials.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/materials/120b4591-b0bd-11e6-5bed-427b00000001",
     "type": "processingplanmaterial",
     "mediaType": "application/json"
   },
   "id": "120b4591-b0bd-11e6-5bed-427b00000001",
   "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
   "product": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json"
     }
   },
   "assortment": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json"
     }
   },
   "quantity": 1,
   "processingProcessPosition": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf/positions/d8da461d-bbf9-11ed-ac12-0010000000c0",
       "type": "processingprocessposition",
       "mediaType": "application/json"
     }
   }
}
```

### Change material
Request for updating a separate Bill of Materials. To update the material there is no
  required fields in the body of the request. Only the ones you want to update.

**Parameters**

| Parameter | Description |
| -------- | -------- |
| **id** | `string` (required) *Example: d72b4281-b000-11e6-8af5-581e00000074* Bill of Materials id. |
| **positionID** | `string` (required) *Example: 9560e3e3-9609-11e6-8af5-581e00000008* Bill of Materials item id. |

> An example of a request to update a particular material in a Bill of Materials.

```shell
   curl -X PUT
     "https://api.kladana.in/api/remap/1.2/entity/processingplan/d72b4281-b000-11e6-8af5-581e00000074/materials/9560e3e3-9609-11e6-8af5-581e00000008"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "quantity": 5
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Tech material. cards.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/materials/120b4591-b0bd-11e6-5bed-427b00000001",
       "type": "processingplanmaterial",
       "mediaType": "application/json"
     },
     "id": "120b4591-b0bd-11e6-5bed-427b00000001",
     "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
     "product": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       }
     },
     "assortment": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       }
     },
     "quantity": 5,
     "processingProcessPosition": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf/positions/d8da461d-bbf9-11ed-ac12-0010000000c0",
         "type": "processingprocessposition",
         "mediaType": "application/json"
       }
     }
   }
]
```

### Delete material

**Parameters**

| Parameter | Description |
| -------- | -------- |
| **id** | `string` (required) *Example: d72b4281-b000-11e6-8af5-581e00000074* Bill of Materials id. |
| **positionID** | `string` (required) *Example: 9560e3e3-9609-11e6-8af5-581e00000008* Bills of Materials item id. |

> Request to remove a Bill of Materials with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.in/api/remap/1.2/entity/processingplan/d72b4281-b000-11e6-8af5-581e00000074/materials/9560e3e3-9609-11e6-8af5-581e00000008"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful removal of a Bill of Materials.

### Bills of Materials Products
Dedicated resource for product management Bills of Materials. With it, you can manage the products of a larger document, the number of products in which exceeds the limit on the number of products saved with the document. This limit is 1000. You can read more about limits on the number of document lines and working with large documents [here](../#kladana-json-api-general-info-working-with-transaction-items).

### Get Bills of Materials Products
Request for a list of all products of the Bill of Materials.

| Title |Type | Description |
| -------- | -------- |------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the products of Bills of Materials. |

**Parameters**

| Parameter | Description |
| -------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bill of Materials id. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get products Bills of Materials

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19/products"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of products of a particular Bill of Materials.

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
     "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/products",
     "type": "processingplanresult",
     "mediaType": "application/json",
     "size": 1,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/products/120b4591-b0bd-11e6-5bed-427b00000001",
         "type": "processingplanresult",
         "mediaType": "application/json"
       },
       "id": "120b4591-b0bd-11e6-5bed-427b00000001",
       "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
       "product": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json"
         }
       },
       "assortment": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json"
         }
       },
       "quantity": 1
     }
   ]
}
```

### Create Bill of Materials Product
Request for the creation of a new product in a Bill of Materials.
For successful creation, the following fields must be specified in the request body:

+ **product** - Link to the product, which is a item.
+ **quantity** - Quantity of goods in the item.

**Parameters**

| Parameter | Description |
| -------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bill of Materials id. |

> An example of creating one product in a Bill of Materials.

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19/products"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
                   "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
                   "type": "product",
                   "mediaType": "application/json"
                 }
               },
               "quantity": 1
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created product of a separate Bill of Materials.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/products/120b4591-b0bd-11e6-5bed-427b00000001",
       "type": "processingplanresult",
       "mediaType": "application/json"
     },
     "id": "120b4591-b0bd-11e6-5bed-427b00000001",
     "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
     "product": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       }
     },
     "assortment": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       }
     },
     "quantity": 1
   }
]
```

> An example of creating several products at once in a Bill of Materials.

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19/products"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
                   "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
                   "type": "product",
                   "mediaType": "application/json"
                 }
               },
               "quantity": 1
             },
             {
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.in/api/remap/1.2/entity/variant/0de151c1-acdc-11e6-5bed-427b00000081",
                   "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/variant/metadata",
                   "type": "variant",
                   "mediaType": "application/json"
                 }
               },
               "quantity": 2
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of created products of a particular Bill of Materials.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/products/120b4591-b0bd-11e6-5bed-427b00000001",
       "type": "processingplanresult",
       "mediaType": "application/json"
     },
     "id": "120b4591-b0bd-11e6-5bed-427b00000001",
     "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
     "product": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       }
     },
     "assortment": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       }
     },
     "quantity": 1
   },
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/products/120b4591-b0bd-11e6-5bed-427b00000002",
       "type": "processingplanresult",
       "mediaType": "application/json"
     },
     "id": "120b4591-b0bd-11e6-5bed-427b00000002",
     "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
     "assortment": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/variant/0de151c1-acdc-11e6-5bed-427b00000081",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       }
     },
     "product": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000079",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       }
     },
     "quantity": 2
   }
]
```

### Bill of Materials Product
 
### Get Bill of Materials product

**Parameters**

| Parameter | Description |
| -------- | -------- |
| **id** | `string` (required) *Example: d72b4281-b000-11e6-8af5-581e00000074* Bill of Materials id. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bill of Materials product id. |
 
> Request for a specific Bill of Materials product with the specified id.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/processingplan/d72b4281-b000-11e6-8af5-581e00000074/products/9560e3e3-9609-11e6-8af5-581e00000008"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a single product Bills of Materials.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/products/120b4591-b0bd-11e6-5bed-427b00000001",
       "type": "processingplanresult",
       "mediaType": "application/json"
     },
     "id": "120b4591-b0bd-11e6-5bed-427b00000001",
     "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
     "product": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       }
     },
     "assortment": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       }
     },
     "quantity": 1
   }
]
```

### Change product

Single Product Update Request Bills of Materials. There is no need to update the product
  required fields in the body of the request. Only the ones you want to update.

**Parameters**

| Parameter | Description |
| -------- | -------- |
| **id** | `string` (required) *Example: d72b4281-b000-11e6-8af5-581e00000074* Bill of Materials id. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bill of Materials product id. |

> Example of a single product update request in a Bill of Materials.

```shell
   curl -X PUT
     "https://api.kladana.in/api/remap/1.2/entity/processingplan/d72b4281-b000-11e6-8af5-581e00000074/products/9560e3e3-9609-11e6-8af5-581e00000008"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "quantity": 5
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Bill of Materials products.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/products/120b4591-b0bd-11e6-5bed-427b00000001",
       "type": "processingplanresult",
       "mediaType": "application/json"
     },
     "id": "120b4591-b0bd-11e6-5bed-427b00000001",
     "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
     "product": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       }
     },
     "assortment": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       }
     },
     "quantity": 5
   }
]

```

### Delete product

**Parameters**

| Parameter | Description |
| ---------- | ---------- |
| **id** | `string` (required) *Example: d72b4281-b000-11e6-8af5-581e00000074* Bills of Materials id. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* product id Bills of Materials. |
 
> Product Removal Request Bills of Materials with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.in/api/remap/1.2/entity/processingplan/d72b4281-b000-11e6-8af5-581e00000074/products/9560e3e3-9609-11e6-8af5-581e00000008"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful removal of the product Bills of Materials.
