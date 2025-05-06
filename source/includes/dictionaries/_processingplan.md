## Bills of Materials

Using the JSON API, you can create and update information about Bills of Materials, query lists of the Bills of Materials, and information by a Bills of Material. Bills of Materials items can be managed both as part of a separate Bill of Materials, and using special resources for managing materials and products of a Bill of Materials. The entity code for a Bill of Materials in the JSON API is the **processingplan** keyword. Learn more about [Bills of Materials](https://kladana.zendesk.com/hc/en-us/articles/7349036390673-Bills-of-Materials).

### Bills of Materials
#### Entity attributes

| Title | Type   | Filtration | Description |
| ------ | ------- | ------ | ----- |
| **accountId** | UUID                                               | `=` `!=` | Account ID<br>`+Required when answering` `+Read Only` |
| **archived**  | Boolean   | `=` `!=`  | Is the Bill of Materials archived or not<br>`+Required when answering` |
| **code** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Code of the Bill of Materials |
| **cost** | Int                                                | | Production cost |
| **costDistributionType** | Enum | | Cost of distribution type. Possible values: `BY_PRICE`, `BY_PRODUCTION`<br>`+Required if answered` `+Read-only` |
| **externalCode** | String(255)                                        | `=` `!=` `~` `~=` `=~` | External code Bills of Materials<br>`+Required when answering` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when answering` `+Expand` |
|**stages** | MetaArray | | Collection of metadata of the Bill of Materials' operations <br>`+Required when answering` `+Expand` |
| **id** | UUID                                               | `=` `!=` | Bill of Materials ID<br>`+Required when answering` `+Read only` |
| **materials** | MetaArray                                          | | Material Metadata Collection Bills of Materials<br>`+Required when answering` `+Expand` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Metadata Bills of Materials<br>`+Required when answering` |
| **name** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Name Bills of Materials<br>`+Required when answering` `+Required when creating` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Expand` |
| **parent** | [Meta](../#kladana-json-api-general-info-metadata) | | Tech group metadata cards<br>`+Required when answering` `+Expand` |
| **pathName** | String                                             | | The name of the group that includes Bill of Materials<br>`+Required when answering` `+Read only` |
| **processingProcess** | [Meta](../#kladana-json-api-general-info-metadata) | | Bill of Materials Metadata<br>`+Required in response` `+Expand` |
| **products** | MetaArray                                          | | Collection of finished products metadata Bills of Materials<br>`+Required when answering` `+Expand` `+Required when creating` |
| **shared** | Boolean                                            | `=` `!=` | Sharing<br>`+Required when answering` |
| **updated** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | The moment of the last update Bills of Materials<br>`+Required when answering` `+Read only` |

For costDistributionType, the value BY_PRODUCTION is only available for Bills of Materials with two or more product items. When the number of product items changes to a value less than 2, it automatically changes to BY_PRICE.

#### Production operations of Bills of Materials

The object of the production operation in the Bill of Materials contains the following fields:

| Name | Type | Description |
| ----- | ---- | ------- |
| **accountId** | UUID | Account ID<br>`+Required when answering` `+Read-only` |
| **enableHourAccounting** | Boolean | Is standard hours accounting enabled<br>`+Required when replying` |
| **id** | UUID | Raw material ID<br>`+Required when answering` `+Read-only` |
| **cost** | Double | Production cost of a certain production operation `+Required when answering` |
| **labourCost** | Double | Labor cost of a certain production operation `+Required when answering` |
| **standardHour** | Double | Standard hours of a production operation `+Required when answering` |
| **standardHourCost** | Double | Standard Hour cost of a certain production operation<br>`+Required when replying` `+Read-only` |
| **processingProcessPosition** | [Meta](../#kladana-json-api-general-info-metadata) | Bill of Materials item metadata<br>`+Required when answering` |

Production operations of a Bill of Materials strictly correspond to the stages of the linked production process.

It is not possible to simultaneously transfer the total production cost for the Bill of Materials and the production cost for a production operation.

#### Raw Materials of Bills of Materials

Bill of Materials' raw materials are the list of products and product variants used for producing finished products.

Raw material object in Bills of Materials contains the following fields:

| Title   | Type   | Description   |
| ------- | ------ | ------------- |
| **accountId** | UUID    | Account ID<br>`+Required when answering` `+Read Only`    |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Product or product variant item metadata<br>`+Required when answering` `+Expand` |
| **id** | UUID | Raw material ID<br>`+Required when answering` `+Read-only` |
| **product** | [Meta](../#kladana-json-api-general-info-metadata) | Product item metadata. If the **assortment** field specifies a product variant, the field contains the product to which the product variant applies<br>`+Required when answering` `+Expand` |
| **quantity** | Float | Quantity of products of the type in the item<br>`+Required when answering` |
| **processingProcessPosition** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Bill of Materials' item<br>`+Required in response` |
| **materialProcessingPlan** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Bill of Materials' raw material<br>`+Read-only` |

If you do not specify a link to a Bill of Materials item when adding a raw material, the material will be linked by default to the first item in the Bill of Materials.

#### Products of Bills of Materials

Products of Bills of Materials are a list of products/ product variants obtained during production.
Product Object of a Bill of Materials contains the following fields:

| Title | Type | Description |
| -------- | -------- |------- |
| **accountId** | UUID | Account ID<br>`+Required when answering` `+Read Only` |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the item or item variant<br>`+Required when answering` `+Expand` |
| **id** | UUID | Product ID<br>`+Required when answering` `+Read Only` |
| **product** | [Meta](../#kladana-json-api-general-info-metadata) | Item metadata. If a product variant is specified in the **assortment** field, the field contains the product to which the product variant relates<br>`+Required when answering` `+Expand` |
| **quantity** | Int | Quantity of products of this type in item<br>`+Required when answering` |

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
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
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
   "https://api.kladana.com/api/remap/1.2/entity/processingplan"
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
        "href": "https://api.kladana.com/api/remap/1.2/context/employee",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json"
      }
    }
  },
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
    "type": "processingplan",
    "mediaType": "application/json",
    "size": 3,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
        "type": "processingplan",
        "mediaType": "application/json"
      },
      "id": "1a18770e-ad9a-11e6-5bed-427b00000064",
      "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2016-11-21 14:55:08",
      "name": "Bill of Materials",
      "externalCode": "4geOQkq5h7d5w1-tUATmt3",
      "archived": false,
      "pathName": "",
      "processingProcess": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/metadata",
          "type": "processingprocess",
          "mediaType": "application/json"
        }
      },
      "cost": 1000,
      "costDistributionType": "BY_PRICE",
      "stages": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/stages",
          "type": "processingplanstages",
          "mediaType": "application/json",
          "size": 1,
          "limit": 1000,
          "offset": 0
        }
      },
      "materials": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/materials",
          "type": "processingplanmaterial",
          "mediaType": "application/json",
          "size": 1,
          "limit": 1000,
          "offset": 0
        }
      },
      "products": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/products",
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
        "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/6b4ffbf7-ac12-11e6-5bed-427b00000091",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
        "type": "processingplan",
        "mediaType": "application/json"
      },
      "id": "6b4ffbf7-ac12-11e6-5bed-427b00000091",
      "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2016-11-17 14:48:32",
      "name": "Bill of Materials",
      "externalCode": "Lr9zJa9qgpvs6f6laIgtG2",
      "archived": false,
      "pathName": "Group",
      "parent": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/processingplanfolder/bfb6c5dc-acbb-11e6-5bed-427b00000001",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplanfolder/metadata",
          "type": "processingplanfolder",
          "mediaType": "application/json"
        }
      },
      "processingProcess": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/metadata",
          "type": "processingprocess",
          "mediaType": "application/json"
        }
      },
      "cost": 2000,
      "costDistributionType": "BY_PRICE",
      "stages": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/6b4ffbf7-ac12-11e6-5bed-427b00000091/stages",
          "type": "processingplanstages",
          "mediaType": "application/json",
          "size": 1,
          "limit": 1000,
          "offset": 0
        }
      },
      "materials": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/6b4ffbf7-ac12-11e6-5bed-427b00000091/materials",
          "type": "processingplanmaterial",
          "mediaType": "application/json",
          "size": 1,
          "limit": 1000,
          "offset": 0
        }
      },
      "products": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/6b4ffbf7-ac12-11e6-5bed-427b00000091/products",
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
        "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
        "type": "processingplan",
        "mediaType": "application/json"
      },
      "id": "c38e50b0-acdc-11e6-5bed-427b0000009e",
      "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2016-11-17 18:44:45",
      "name": "Bill of Materials",
      "externalCode": "QrWcKk6mhnNX2Jhi-WsIh2",
      "archived": false,
      "pathName": "Group",
      "parent": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/processingplanfolder/bfb6c5dc-acbb-11e6-5bed-427b00000001",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplanfolder/metadata",
          "type": "processingplanfolder",
          "mediaType": "application/json"
        }
      },
      "processingProcess": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/metadata",
          "type": "processingprocess",
          "mediaType": "application/json"
        }
      },
      "cost": 10000,
      "costDistributionType": "BY_PRICE",
      "stages": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e/stages",
          "type": "processingplanstages",
          "mediaType": "application/json",
          "size": 2,
          "limit": 1000,
          "offset": 0
        }
      },
      "materials": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e/materials",
          "type": "processingplanmaterial",
          "mediaType": "application/json",
          "size": 2,
          "limit": 1000,
          "offset": 0
        }
      },
      "products": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/c38e50b0-acdc-11e6-5bed-427b0000009e/products",
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

Request to create a new Bill of Materials. When creating a Bill of Materials, if the Routing is not specified, then “Main routing” will be substituted by default.

Required fields for creation:

+ **name** - Bill of Materials Name
+ **products** - List of finished products Bill of Materials in the format [Metadata](../#kladana-json-api-general-info-metadata)

> An example of creating a new Dashboard with a request body containing only the required fields.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/processingplan"
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
                     "href": "https://api.kladana.com/api/remap/1.2/entity/product/0da78cd1-91f2-11e6-5bed-427b0000009a",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 },
                 "quantity": 1
               },
               {
                 "assortment": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/variant/0da78cd1-91f2-11e6-5bed-427b0000009a",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
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
    "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
    "type": "processingplan",
    "mediaType": "application/json"
  },
  "id": "120a488b-b0bd-11e6-5bed-427b00000000",
  "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2016-11-22 17:07:57",
  "name": "123sdf",
  "externalCode": "llZWq551h90XDJuYADvry0",
  "archived": false,
  "pathName": "",
  "processingProcess": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/metadata",
      "type": "processingprocess",
      "mediaType": "application/json"
    }
  },
  "cost": 1000,
  "costDistributionType": "BY_PRICE",
  "stages": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/stages",
      "type": "processingplanstages",
      "mediaType": "application/json",
      "size": 2,
      "limit": 1000,
      "offset": 0
    }
  },
  "materials": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/materials",
      "type": "processingplanmaterial",
      "mediaType": "application/json",
      "size": 0,
      "limit": 1000,
      "offset": 0
    }
  },
  "products": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/products",
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

Assigning another Routing will delete the materials assigned to the previous Routing. When creating a Bill of Materials, if no Routing is specified, “Main routing” will be substituted by default.

> An example of creating and updating several Bills of Materials

```shell
  curl -X POST
    "https://api.kladana.com/api/remap/1.2/entity/processingplan"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '[
            {
              "name": "Example",
              "cost": 1000,
              "processingProcess": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/25980515-923e-11ed-c0a8-30040000002d",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/metadata",
                  "type": "processingprocess",
                  "mediaType": "application/json"
                }
              },
              "materials": [
                {
                  "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
                  "assortment": {
                    "meta": {
                      "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
                      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                      "type": "product",
                      "mediaType": "application/json"
                    }
                  },
                  "processingProcessPosition": {
                    "meta": {
                      "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/25980515-923e-11ed-c0a8-30040000002d/positions/d8da461d-bbf9-11ed-ac12-0010000000c1",
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
                      "href": "https://api.kladana.com/api/remap/1.2/entity/product/0da78cd1-91f2-11e6-5bed-427b0000009a",
                      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                      "type": "product",
                      "mediaType": "application/json"
                    }
                  },
                  "quantity": 1
                },
                {
                  "assortment": {
                    "meta": {
                      "href": "https://api.kladana.com/api/remap/1.2/entity/variant/0da78cd1-91f2-11e6-5bed-427b0000009a",
                      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
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
                "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
                "type": "processingplan",
                "mediaType": "application/json"
              },
              "name": "Bill of Materials",
              "cost": 100000
            }
          ]'  
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations created and updated Bill of Materials.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
      "type": "processingplan",
      "mediaType": "application/json"
    },
    "id": "120a488b-b0bd-11e6-5bed-427b00000000",
    "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
    "owner": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json"
      }
    },
    "shared": true,
    "group": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
        "type": "group",
        "mediaType": "application/json"
      }
    },
    "updated": "2016-11-22 17:07:57",
    "name": "Example",
    "externalCode": "llZWq551h90XDJuYADvry0",
    "archived": false,
    "pathName": "",
    "processingProcess": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/25980515-923e-11ed-c0a8-30040000002d",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/metadata",
        "type": "processingprocess",
        "mediaType": "application/json"
      }
    },
    "cost": 1000,
    "costDistributionType": "BY_PRICE",
    "stages": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/stages",
        "type": "processingplanstages",
        "mediaType": "application/json",
        "size": 1,
        "limit": 1000,
        "offset": 0
      }
    },
    "materials": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/materials",
        "type": "processingplanmaterial",
        "mediaType": "application/json",
        "size": 1,
        "limit": 1000,
        "offset": 0
      }
    },
    "products": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/products",
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
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
      "type": "processingplan",
      "mediaType": "application/json"
    },
    "id": "1a18770e-ad9a-11e6-5bed-427b00000064",
    "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
    "owner": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json"
      }
    },
    "shared": true,
    "group": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
        "type": "group",
        "mediaType": "application/json"
      }
    },
    "updated": "2016-11-21 14:55:08",
    "name": "Bill of Materials",
    "externalCode": "4geOQkq5h7d5w1-tUATmt3",
    "archived": false,
    "pathName": "",
    "processingProcess": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/metadata",
        "type": "processingprocess",
        "mediaType": "application/json"
      }
    },
    "cost": 100000,
    "costDistributionType": "BY_PRICE",
    "stages": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/stages",
        "type": "processingplanstages",
        "mediaType": "application/json",
        "size": 1,
        "limit": 1000,
        "offset": 0
      }
    },
    "materials": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/materials",
        "type": "processingplanmaterial",
        "mediaType": "application/json",
        "size": 1,
        "limit": 1000,
        "offset": 0
      }
    },
    "products": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/products",
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
 
> Request for deletion of Bill of Materials with the specified ID.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
The Bill of Materials is successfully deleted.

### Bills of Materials Bulk Deletion

In the body of the request, you need to pass an array containing JSON metadata Bills of Materials you want to delete.


> Bulk Deletion Request of Bills of Materials.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/processingplan/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b1",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
                  "type": "processingplan",
                  "mediaType": "application/json"
              }
          },
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b2",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
                  "type": "processingplan",
                  "mediaType": "application/json"
              }
          }
      ]'
```

> Successful request. Result is JSON information about deletion of Bills of Materials.

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
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bills of Materials ID. |
 
> Request for a separate Bill of Materials with the specified ID.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of Bills of Materials.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
    "type": "processingplan",
    "mediaType": "application/json"
  },
  "id": "1a18770e-ad9a-11e6-5bed-427b00000064",
  "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2016-11-21 14:55:08",
  "name": "Bill of Materials",
  "externalCode": "4geOQkq5h7d5w1-tUATmt3",
  "archived": false,
  "pathName": "",
  "processingProcess": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/metadata",
      "type": "processingprocess",
      "mediaType": "application/json"
    }
  },
  "cost": 1000,
  "costDistributionType": "BY_PRICE",
  "stages": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/stages",
      "type": "processingplanstages",
      "mediaType": "application/json",
      "size": 1,
      "limit": 1000,
      "offset": 0
    }
  },
  "materials": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/materials",
      "type": "processingplanmaterial",
      "mediaType": "application/json",
      "size": 1,
      "limit": 1000,
      "offset": 0
    }
  },
  "products": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/products",
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

Linking another Routing will delete materials linked to the previous Routing.

**Parameters**

| Parameter | Description |
| -------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bill of Materials ID. |

> An example of a request to update a separate Bill of Materials.

```shell
  curl -X PUT
    "https://api.kladana.com/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "name": "Bill of Materials",
            "cost": 100000
          }'  
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Bill of Materials.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingplan/metadata",
    "type": "processingplan",
    "mediaType": "application/json"
  },
  "id": "1a18770e-ad9a-11e6-5bed-427b00000064",
  "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d5ad957e-91f1-11e6-5bed-427b0000002a",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/d55da707-91f1-11e6-5bed-427b00000001",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2016-11-21 14:55:08",
  "name": "Bill of Materials",
  "externalCode": "4geOQkq5h7d5w1-tUATmt3",
  "archived": false,
  "pathName": "",
  "processingProcess": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/metadata",
      "type": "processingprocess",
      "mediaType": "application/json"
    }
  },
  "cost": 100000,
  "costDistributionType": "BY_PRICE",
  "stages": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/stages",
      "type": "processingplanstages",
      "mediaType": "application/json",
      "size": 1,
      "limit": 1000,
      "offset": 0
    }
  },
  "materials": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/materials",
      "type": "processingplanmaterial",
      "mediaType": "application/json",
      "size": 1,
      "limit": 1000,
      "offset": 0
    }
  },
  "products": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/1a18770e-ad9a-11e6-5bed-427b00000064/products",
      "type": "processingplanresult",
      "mediaType": "application/json",
      "size": 2,
      "limit": 1000,
      "offset": 0
    }
  }
}
```
### Operations of Bill of Materials

This is a separate resource for managing the operations of a Bill of Materials. Use it to manage the productions operations of a large Bill of Materials, the number of operations in which exceeds the limit on the number of items stored with this document. The limit is 1000. Learn more about the [limits](../#kladana-json-api-limitations). 

Arbitrary creation and deletion of productions operations in Bills of Materials is not supported. Each production operation of a Bill of Materials strictly corresponds to the operations in the items of the linked Routing.

### Get Operations of Bill of Materials
Request to obtain a list of all Operations of a Bill of Materials.

| Name | Type | Description |
| ---- | ---- | ----------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the issue. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the employee who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the production operation of a Bill of Materials. |

**Parameters**

| Parameter | Description |
| --------- | ------------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bill of Materials ID. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to extract. `Possible values ​​1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get the production operations of a Bill of Materials

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19/stages"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. Result is JSON representation of the list of production operations of a separate Bill of Materials.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/908f9690-bcac-11ed-ac1c-000b0000001e/stages",
    "type": "processingplanstages",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/908f9690-bcac-11ed-ac1c-000b0000001e/stages/4ca1e0fe-c161-11ed-ac1c-000b00000006",
        "type": "processingplanstages",
        "mediaType": "application/json"
      },
      "id": "4ca1e0fe-c161-11ed-ac1c-000b00000006",
      "accountId": "2f09c84d-bbd0-11ed-ac1c-000f00000001",
      "processingProcessPosition": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/32dd4604-bbd0-11ed-ac1c-000b000000bf/positions/32dd4bac-bbd0-11ed-ac1c-000b000000c0",
          "type": "processingprocessposition",
          "mediaType": "application/json"
        }
      },
      "cost": 1100.0,
      "labourCost": 100.0,
      "standardHour": 200.0
    }
  ]
}
```

### Get Production Operation of Bill of Materials

**Parameters**

| Parameter | Description |
| --------- | ------------- |
| **id**         | `string` (required) *Example: d72b4281-b000-11e6-8af5-581e00000074* Bill of Materials ID.         |
| **stagesID**   | `string` (required) *Example: 9560e3e3-9609-11e6-8af5-581e00000008* Production operation ID.   |

> Request to get a single production operation of a Bill of Materials with the specified ID.

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/processingplan/d72b4281-b000-11e6-8af5-581e00000074/stages/9560e3e3-9609-11e6-8af5-581e00000008"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. Result is a JSON representation of a single production operation of a Bill of Materials.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/908f9690-bcac-11ed-ac1c-000b0000001e/stages/9560e3e3-9609-11e6-8af5-581e00000008",
    "type": "processingplanstages",
    "mediaType": "application/json"
  },
  "id": "9560e3e3-9609-11e6-8af5-581e00000008",
  "accountId": "2f09c84d-bbd0-11ed-ac1c-000f00000001",
  "processingProcessPosition": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/32dd4604-bbd0-11ed-ac1c-000b000000bf/positions/32dd4bac-bbd0-11ed-ac1c-000b000000c0",
      "type": "processingprocessposition",
      "mediaType": "application/json"
    }
  },
  "cost": 1100.0,
  "labourCost": 100.0,
  "standardHour": 200.0
}
```

### Update Production Operation of Bill of Materials
There are no required fields in the request body to update a Production Operation of a Bill of Materials. Specify only the fields you want to update.

**Parameters**

| Parameter | Description |
| ------- | ------------- |
| **id** | `string` (required) *Example: d72b4281-b000-11e6-8af5-581e00000074* Bill of Materials ID. |
| **stagesID** | `string` (required) *Example: 9560e3e3-9609-11e6-8af5-581e00000008* ID of the Production Operation of a Bill of Materials. |

> Example of a request to update a Production Operation of a Bill of Materials.

```shell
  curl -X PUT
    "https://api.kladana.com/api/remap/1.2/entity/processingplan/d72b4281-b000-11e6-8af5-581e00000074/stages/9560e3e3-9609-11e6-8af5-581e00000008"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "cost": 5.5
          }'  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the updated Production Operation of a Bill of Materials.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/908f9690-bcac-11ed-ac1c-000b0000001e/stages/9560e3e3-9609-11e6-8af5-581e00000008",
    "type": "processingplanstages",
    "mediaType": "application/json"
  },
  "id": "9560e3e3-9609-11e6-8af5-581e00000008",
  "accountId": "2f09c84d-bbd0-11ed-ac1c-000f00000001",
  "processingProcessPosition": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/32dd4604-bbd0-11ed-ac1c-000b000000bf/positions/32dd4bac-bbd0-11ed-ac1c-000b000000c0",
      "type": "processingprocessposition",
      "mediaType": "application/json"
    }
  },
  "cost": 5.5,
  "labourCost": 10.0,
  "standardHour": 15.0
}
```

### Materials in Bill of Materials 

Separate resource for managing raw materials of a Bill of Materials allows you to manage materials of a large Bill of Materials which number of materials exceeds the limit on the number of materials stored with the document. The limit is 1000. Learn more about the [limits](../#kladana-json-api-limitations).

### Get Materials in Bill of Materials  
Request to get the list of all raw materials in a Bill of Materials.

| Name | Type | Description |
| ---- | ----- | ---------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the issue. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the employee who performed the request. |
| **rows** | Array(Object) | Array of JSON objects representing the materials of the Bill of Materials. |

**Parameters**

| Parameter | Description |
| --------- | ----------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bill of Materials ID. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to retrieve. `Possible values ​​are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Bill of Materials' raw materials

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19/materials"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the list of raw materials for a separate Bill of Materials.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/materials",
    "type": "processingplanmaterial",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/materials/120b4591-b0bd-11e6-5bed-427b00000001",
        "type": "processingplanmaterial",
        "mediaType": "application/json"
      },
      "id": "120b4591-b0bd-11e6-5bed-427b00000001",
      "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
      "product": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json"
        }
      },
      "assortment": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json"
        }
      },
      "quantity": 1,
      "processingProcessPosition": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf/positions/d8da461d-bbf9-11ed-ac12-0010000000c0",
          "type": "processingprocessposition",
          "mediaType": "application/json"
        }
      }
    }
  ]
}
```

### Material of Bill of Materials

### Get Material

**Parameters**

| Parameter | Description |
| ------------- | ---------- |
| **id** | `string` (required) *Example: d72b4281-b000-11e6-8af5-581e00000074* Bill of Materials ID. |
| **positionID** | `string` (required) *Example: 9560e3e3-9609-11e6-8af5-581e00000008* Item ID of the Bill of Materials. |

> Request to get a separate Bill of Materials material with the specified ID.

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/processingplan/d72b4281-b000-11e6-8af5-581e00000074/materials/9560e3e3-9609-11e6-8af5-581e00000008"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. Result is a JSON representation of a separate Bill of Materials' item.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/materials/120b4591-b0bd-11e6-5bed-427b00000001",
    "type": "processingplanmaterial",
    "mediaType": "application/json"
  },
  "id": "120b4591-b0bd-11e6-5bed-427b00000001",
  "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
  "product": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json"
    }
  },
  "assortment": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json"
    }
  },
  "quantity": 1,
  "processingProcessPosition": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf/positions/d8da461d-bbf9-11ed-ac12-0010000000c0",
      "type": "processingprocessposition",
      "mediaType": "application/json"
    }
  }
}
```

### Create Material
Request to create a new material in the Bill of Materials.
If you do not specify a link to the Routing item when adding a material, the material will be linked to the first item of the Routing by default.
For successful creation, you must specify the following fields in the request body:

+ **product** - Link to the product that the item represents.
+ **quantity** - Quantity of products in the item.

**Parameters**

| Parameter | Description |
| ------- | ----------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bill of Materials ID. |

> Example of creating one material in the Bill of Materials.

```shell
  curl -X POST
    "https://api.kladana.com/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19/materials"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '[
            {
              "assortment": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                  "type": "product",
                  "mediaType": "application/json"
                }
              },
              "quantity": 1
            }
          ]'  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the created material of a separate Bill of Materials.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/materials/120b4591-b0bd-11e6-5bed-427b00000001",
      "type": "processingplanmaterial",
      "mediaType": "application/json"
    },
    "id": "120b4591-b0bd-11e6-5bed-427b00000001",
    "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
    "product": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
      }
    },
    "assortment": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
      }
    },
    "quantity": 1,
    "processingProcessPosition": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf/positions/d8da461d-bbf9-11ed-ac12-0010000000c0",
        "type": "processingprocessposition",
        "mediaType": "application/json"
      }
    }
  }
]
```

> An example of creating several materials at once in the Bill of Materials with and without binding to the positions of the Routing

```shell
  curl -X POST
    "https://api.kladana.com/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19/materials"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '[
            {
              "assortment": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                  "type": "product",
                  "mediaType": "application/json"
                }
              },
              "quantity": 1,
              "processingProcessPosition": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf/positions/934b5505-ac45-11ed-ac12-000f0000002c",
                  "type": "processingprocessposition",
                  "mediaType": "application/json"
                }
              }
            },
            {
              "assortment": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/variant/0de151c1-acdc-11e6-5bed-427b00000079",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                  "type": "variant",
                  "mediaType": "application/json"
                }
              },
              "quantity": 2
            }
          ]'  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the list of created materials of a separate Bill of Materials.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/materials/120b4591-b0bd-11e6-5bed-427b00000001",
      "type": "processingplanmaterial",
      "mediaType": "application/json"
    },
    "id": "120b4591-b0bd-11e6-5bed-427b00000001",
    "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
    "product": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
      }
    },
    "assortment": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
      }
    },
    "quantity": 1,
    "processingProcessPosition": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf/positions/934b5505-ac45-11ed-ac12-000f0000002c",
        "type": "processingprocessposition",
        "mediaType": "application/json"
      }
    }
  },
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/materials/120b4591-b0bd-11e6-5bed-427b00000002",
      "type": "processingplanmaterial",
      "mediaType": "application/json"
    },
    "id": "120b4591-b0bd-11e6-5bed-427b00000002",
    "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
    "product": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000081",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
      }
    },
    "assortment": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/variant/0de151c1-acdc-11e6-5bed-427b00000079",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
        "type": "variant",
        "mediaType": "application/json"
      }
    },
    "quantity": 2,
    "processingProcessPosition": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf/positions/d8da461d-bbf9-11ed-ac12-0010000000c0",
        "type": "processingprocessposition",
        "mediaType": "application/json"
      }
    }
  }
]
```

### Edit Material
Request to update a single material of Bill of Materials. There are no required fields in the request body to update a material. Specify only the fields you want to update.

**Parameters**

| Parameter | Description |
| ---------- | -------- |
| **id** | `string` (required) *Example: d72b4281-b000-11e6-8af5-581e00000074* Bill of Materials ID. |
| **positionID** | `string` (required) *Example: 9560e3e3-9609-11e6-8af5-581e00000008* Item ID of the Bill of Materials. |

> Example of a request to update a single material in Bill of Materials.

```shell
  curl -X PUT
    "https://api.kladana.com/api/remap/1.2/entity/processingplan/d72b4281-b000-11e6-8af5-581e00000074/materials/9560e3e3-9609-11e6-8af5-581e00000008"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "quantity": 5
          }'  
```

> Response 200 (application/json)
Successful request. Result is a JSON representation of the updated Bill of Materials.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/materials/120b4591-b0bd-11e6-5bed-427b00000001",
      "type": "processingplanmaterial",
      "mediaType": "application/json"
    },
    "id": "120b4591-b0bd-11e6-5bed-427b00000001",
    "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
    "product": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
      }
    },
    "assortment": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
      }
    },
    "quantity": 5,
    "processingProcessPosition": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/processingprocess/d8da40e9-bbf9-11ed-ac12-0010000000bf/positions/d8da461d-bbf9-11ed-ac12-0010000000c0",
        "type": "processingprocessposition",
        "mediaType": "application/json"
      }
    }
  }
]
```

### Delete Material

**Parameters**

| Parameter | Description |
| --------- | ----------- |
| **id** | `string` (required) *Example: d72b4281-b000-11e6-8af5-581e00000074* Bill of Materials ID. |
| **positionID** | `string` (required) *Example: 9560e3e3-9609-11e6-8af5-581e00000008* Item ID of the Bill of Materials. |

> Request to delete the Bill of Materials' material with the specified ID.

```shell
curl -X DELETE
  "https://api.kladana.com/api/remap/1.2/entity/processingplan/d72b4281-b000-11e6-8af5-581e00000074/materials/9560e3e3-9609-11e6-8af5-581e00000008"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successfully removed material of the Bill of Materials.

### Bulk Deletion of Materials

The request body must contain an array containing JSON metadata of the Bill of Materials materials that need to be deleted.

> Request for bulk deletion of Bill of Materials materials.

```shell
curl -X POST
  "https://api.kladana.com/api/remap/1.2/entity/processingplan/e435045e-7274-11ee-c0a8-e00e00000030/materials/delete"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
  -H "Content-Type: application/json"
    -d '[
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/e435045e-7274-11ee-c0a8-e00e00000030/materials/e43514c2-7274-11ee-c0a8-e00e00000031",
                  "type": "processingplanmaterial",
                  "mediaType": "application/json"
              }
          },
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/e435045e-7274-11ee-c0a8-e00e00000030/materials/d9c4688e-7274-11ee-c0a8-e00e00000025",
                  "type": "processingplanmaterial",
                  "mediaType": "application/json"
              }
          }
       ]' 
```

> Response 200 (application/json)
Successfully removed materials from Bill of Materials.

### Products of Bill of Materials 
Separate resource for managing raw materials of a Bill of Materials allows you to manage materials of a large Bill of Materials which number of materials exceeds the limit on the number of materials stored with the document. The limit is 1000. Learn more about the [limits](../#kladana-json-api-limitations).

### Get Bill of Materials Products
Request to get a list of all products in a Bill of Materials.

| Name | Type | Description |
| ----- | ------- | ---------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the issue. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the employee who made the request. |
| **rows** | Array(Object) | Array of JSON objects representing the Bill of Materials products.|

**Parameters**

| Parameter | Description |
| --------- | ----------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bill of Materials ID. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to retrieve. `Valid values ​​are 1 - 1000`.|
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indentation in the returned list of entities. |

> Get Bill of Materials products

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19/products"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of a list of products of a Bill of Materials.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/products",
    "type": "processingplanresult",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/products/120b4591-b0bd-11e6-5bed-427b00000001",
        "type": "processingplanresult",
        "mediaType": "application/json"
      },
      "id": "120b4591-b0bd-11e6-5bed-427b00000001",
      "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
      "product": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json"
        }
      },
      "assortment": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json"
        }
      },
      "quantity": 1
    }
  ]
}
```

### Product of Bill of Materials

###  Get Product

**Parameters**

| Parameter | Description |
| --------- | ----------- |
| **id** | `string` (required) *Example: d72b4281-b000-11e6-8af5-581e00000074* Bill of Materials ID. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product ID of the Bill of Materials.|

> Request to get a single Bill of Materials product with the specified ID.

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/processingplan/d72b4281-b000-11e6-8af5-581e00000074/products/9560e3e3-9609-11e6-8af5-581e00000008"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. Result is a JSON representation of a separate product of the Bill of Materials.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/products/120b4591-b0bd-11e6-5bed-427b00000001",
      "type": "processingplanresult",
      "mediaType": "application/json"
    },
    "id": "120b4591-b0bd-11e6-5bed-427b00000001",
    "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
    "product": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
      }
    },
    "assortment": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
      }
    },
    "quantity": 1
  }
]
```

### Create a product
Request to create a new product in Bill of Materials.
For successful creation, the following fields must be specified in the request body:

+ **product** - Link to the product that the item represents.
+ **quantity** - Quantity of products in the item.

**Parameters**

| Parameter | Description |
| ------- | ------------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bill of Materials ID. |

> Example of creating one product in Bill of Materials.

```shell
  curl -X POST
    "https://api.kladana.com/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19/products"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '[
            {
              "assortment": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                  "type": "product",
                  "mediaType": "application/json"
                }
              },
              "quantity": 1
            }
          ]'  
```

> Response 200 (application/json)
Successful request. Result is a JSON representation of the created product of a separate Bill of Materials.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/products/120b4591-b0bd-11e6-5bed-427b00000001",
      "type": "processingplanresult",
      "mediaType": "application/json"
    },
    "id": "120b4591-b0bd-11e6-5bed-427b00000001",
    "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
    "product": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
      }
    },
    "assortment": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
      }
    },
    "quantity": 1
  }
]
```

> An example of creating multiple products at once in Bill of Materials.

```shell
  curl -X POST
    "https://api.kladana.com/api/remap/1.2/entity/processingplan/7944ef04-f831-11e5-7a69-971500188b19/products"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '[
            {
              "assortment": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                  "type": "product",
                  "mediaType": "application/json"
                }
              },
              "quantity": 1
            },
            {
              "assortment": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/variant/0de151c1-acdc-11e6-5bed-427b00000081",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                  "type": "variant",
                  "mediaType": "application/json"
                }
              },
              "quantity": 2
            }
          ]'  
```

> Response 200 (application/json)
Successful request. Result is a JSON representation of the list of created products of a separate Bill of Materials.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/products/120b4591-b0bd-11e6-5bed-427b00000001",
      "type": "processingplanresult",
      "mediaType": "application/json"
    },
    "id": "120b4591-b0bd-11e6-5bed-427b00000001",
    "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
    "product": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
      }
    },
    "assortment": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
      }
    },
    "quantity": 1
  },
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/products/120b4591-b0bd-11e6-5bed-427b00000002",
      "type": "processingplanresult",
      "mediaType": "application/json"
    },
    "id": "120b4591-b0bd-11e6-5bed-427b00000002",
    "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
    "assortment": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/variant/0de151c1-acdc-11e6-5bed-427b00000081",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
        "type": "variant",
        "mediaType": "application/json"
      }
    },
    "product": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000079",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
      }
    },
    "quantity": 2
  }
]
```

### Edit Product
Request to update a single product of a Bill of Materials. To update a product, specify only the fields you want to update in the request body.

**Parameters**

| Parameter | Description |
| -------- | ------------ |
| **id** | `string` (required) *Example: d72b4281-b000-11e6-8af5-581e00000074* Bill of Materials ID. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product ID in the Bill of Materials. |

> Example of a request to update a single product in a Bill of Materials.

```shell
  curl -X PUT
    "https://api.kladana.com/api/remap/1.2/entity/processingplan/d72b4281-b000-11e6-8af5-581e00000074/products/9560e3e3-9609-11e6-8af5-581e00000008"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "quantity": 5
          }'  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the Bill of Materials updated product.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/120a488b-b0bd-11e6-5bed-427b00000000/products/120b4591-b0bd-11e6-5bed-427b00000001",
      "type": "processingplanresult",
      "mediaType": "application/json"
    },
    "id": "120b4591-b0bd-11e6-5bed-427b00000001",
    "accountId": "d55cbfba-91f1-11e6-5bed-427b00000000",
    "product": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
      }
    },
    "assortment": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/0de151c1-acdc-11e6-5bed-427b00000080",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
      }
    },
    "quantity": 5
  }
]

```

### Delete Product

**Parameters**

| Parameter | Description |
| --------- | ----------- |
| **id** | `string` (required) *Example: d72b4281-b000-11e6-8af5-581e00000074* Bill of Materials ID. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product ID of the Bill of Materials. |

> Request to delete the Bill of Materials product with the specified ID.

```shell
curl -X DELETE
  "https://api.kladana.com/api/remap/1.2/entity/processingplan/d72b4281-b000-11e6-8af5-581e00000074/products/9560e3e3-9609-11e6-8af5-581e00000008"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successfully removed product from the Bill of Materials.

### Bulk delete product

The request body must contain an array containing JSON metadata of the Bill of Materials products to be deleted.

> Request to bulk deletion of the Bill of Materials products.

```shell
curl -X POST
  "https://api.kladana.com/api/remap/1.2/entity/processingplan/d9c43e3b-7274-11ee-c0a8-e00e00000023/products/delete"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
  -H "Content-Type: application/json"
    -d '[
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/d9c43e3b-7274-11ee-c0a8-e00e00000023/products/270b59e1-7305-11ee-c0a8-e00d00000000",
                  "type": "processingplanresult",
                  "mediaType": "application/json"
              }
          },
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/processingplan/d9c43e3b-7274-11ee-c0a8-e00e00000023/products/dd495ae2-7277-11ee-c0a8-e00e00000044",
                  "type": "processingplanresult",
                  "mediaType": "application/json"
              }
          }
       ]' 
```

> Response 200 (application/json)
Bill of Materials products were successfully removed.
