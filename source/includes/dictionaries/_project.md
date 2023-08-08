## Project
### Projects
Using the JSON API, you can create and update information about Projects, request lists of Projects, and information on individual Projects. The entity code for a Project in the JSON API is the **project** keyword. Learn more about [Projects](https://kladana.zendesk.com/hc/en-us/articles/6506440075549-Projects).
This entity can be contextually searched using the special `search` parameter. More details can be found at [link](../#kladana-json-api-general-info-context-search). The search with the search parameter differs from others in that the search is not prefixed, without tokenization, and only goes through one field at a time. Searches for strings that include the value of the search string.

The search among the project objects for matching the search string will be carried out using the following fields:

+ by Project name **name**
+ according to the Project description **description**

#### Entity attributes
| Title | Type | Filtration | Description |
| ----- | ------ | ------- | ---------- |
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **archived** | Boolean | `=` `!=` | Has the Project been archived<br>`+Required when replying` |
| **attributes** | Array(Object) | [Operators of additional fields](../#mojsklad-json-api-obschie-swedeniq-fil-traciq-wyborki-s-pomosch-u-parametra-filter-fil-traciq-po-dopolnitel-nym-polqm) | Collection of additional fields |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Project Code |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Project Description |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | Project external code<br>`+Required when replying` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee department metadata<br>`+Required when replying` `+Expand` |
| **id** | UUID | `=` `!=` | Project ID<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Project Metadata<br>`+Required when replying` |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Project Name<br>`+Required when replying` `+Required when creating` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | MetadataOwner's (Employee)<br>`+Expand` |
| **shared** | Boolean | `=` `!=` | Sharing<br>`+Required when replying` |
| **updated** | datetime | `=` `!=` `<` `>` `<=` `>=` | When the entity was last updated<br>`+Required for response` `+Read-only` |

About working with Project fields can be read [here](../#kladana-json-api-general-info-additional-fields)


### Get Projects
Request to get a list of all projects on the given account.
Result: JSON object including fields:

| Title | Type | Description |
| ------- | ---------- |------ |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing projects. |

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Projects

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/project"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of projects.

```json
{
   "context": {
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
     "href": "https://app.kladana.in/api/remap/1.2/entity/project",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
     "type": "project",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/project/51f263f9-0307-11e6-9464-e4de0000007c",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
         "type": "project",
         "mediaType": "application/json"
       },
       "id": "51f263f9-0307-11e6-9464-e4de0000007c",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-04-15 15:41:05",
       "name": "Tomato Paste Aggregator",
       "description": "Tomato paste collection and processing project from all suppliers",
       "code": "1248y12hrd",
       "externalCode": "HZV7dGc8iAnf0aNjrvQvN0",
       "archived": false,
       "attributes": [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/project/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "ddff1ee8-12c1-11e6-9464-e4de0000007a",
           "name": "Project priority",
           "type": "string",
           "value": "High"
         }
       ]
     },{
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/project/8477d916-0aef-11e6-9464-e4de00000103",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
         "type": "project",
         "mediaType": "application/json"
       },
       "id": "8477d916-0aef-11e6-9464-e4de00000103",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-04-25 17:10:51",
       "name": "Plan",
       "description": "Project tracking the implementation of the sales plan",
       "code": "124721fsavy",
       "externalCode": "lv7MmPK4jvaqq-nA3g3NL2",
       "archived": false,
       "attributes": [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/project/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "ddff1ee8-12c1-11e6-9464-e4de0000007a",
           "name": "Project priority",
           "type": "string",
           "value": "Low"
         }
       ]
     }
   ]
}
```

### Create Project
Request to create a new project. The only required field in the request body
to create a project is **name**.

> An example of a request to create a new project.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/project"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "Supplier vertical integration project",
             "description": "Integration with the main counterparty",
             "code": "006",
             "externalCode": "814fhsafiwb124"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created project.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/project/2c013eeb-0af0-11e6-9464-e4de00000026",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
     "type": "project",
     "mediaType": "application/json"
   },
   "id": "2c013eeb-0af0-11e6-9464-e4de00000026",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-04-25 17:15:32",
   "name": "Supplier vertical integration project",
   "description": "Integration with the main counterparty",
   "code": "006",
   "externalCode": "814fhsafiwb124",
   "archived": false
}
```


> An example of a request to create a new project with additional fields in the request body.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/project"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "New accounting system",
             "description": "Project for the transition to a new product accounting system",
             "code": "0026",
             "externalCode": "213zzz",
             "attributes": [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/project/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "Medium"
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created project.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/project/169ed74e-12c3-11e6-9464-e4de00000000",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
     "type": "project",
     "mediaType": "application/json"
   },
   "id": "169ed74e-12c3-11e6-9464-e4de00000000",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-05-05 16:12:58",
   "name": "New accounting system",
   "description": "Project for the transition to a new product accounting system",
   "code": "0026",
   "externalCode": "213zzz",
   "archived": false,
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/project/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "ddff1ee8-12c1-11e6-9464-e4de0000007a",
       "name": "Project priority",
       "type": "string",
       "value": "Medium"
     }
   ]
}
```

### Bulk creating and update of Projects
[Bulk creating and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Projects.
In the body of the request, you need to pass an array containing the JSON representation of the Projects that you want to create or update.
Updated Projects must contain the identifier in the form of metadata.

> An example of creating and updating several Projects

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/project"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "Supplier vertical integration project",
               "description": "Integration with the main counterparty",
               "code": "006",
               "externalCode": "814fhsafiwb124"
             },
             {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/project/76e88dff-3f9b-11e6-8a84-bae50000009b",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
                 "type": "project",
                 "mediaType": "application/json"
               },
               "description": "Project update",
               "code": "9999",
               "externalCode": "dfDGFSG44"
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Projects.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/project/2c013eeb-0af0-11e6-9464-e4de00000026",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
       "type": "project",
       "mediaType": "application/json"
     },
     "id": "2c013eeb-0af0-11e6-9464-e4de00000026",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": false,
     "group": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-04-25 17:15:32",
     "name": "Supplier vertical integration project",
     "description": "Integration with the main counterparty",
     "code": "006",
     "externalCode": "814fhsafiwb124",
     "archived": false
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/project/76e88dff-3f9b-11e6-8a84-bae50000009b",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
       "type": "project",
       "mediaType": "application/json"
     },
     "id": "76e88dff-3f9b-11e6-8a84-bae50000009b",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": false,
     "group": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },"updated": "2016-04-25 17:17:21",
     "name": "Important project",
     "description": "Project update",
     "code": "9999",
     "externalCode": "dfDGFSG44",
     "archived": false
   }
]
```

### Delete Project

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Project id. |

> Request to delete the Project with the specified id.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/project/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of the Project.

### Bulk deletion of Projects

In the body of the request, you need to pass an array containing the JSON metadata of the Projects that you want to delete.


> Request for bulk deletion of Projects.

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/project/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d'[
        {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/project/7944ef04-f831-11e5-7a69-971500188b1",
                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
                "type": "project",
                "mediaType": "application/json"
            }
        },
        {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/project/7944ef04-f831-11e5-7a69-971500188b2",
                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
                "type": "project",
                "mediaType": "application/json"
            }
        }
    ]'
```

> Successful request. The result is JSON information about deleting Projects.

```json
[
   {
     "info":"Entity 'project' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 was deleted successfully"
   },
   {
     "info":"Entity 'project' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 was deleted successfully"
   }
]
```

### Project Metadata
#### Project Metadata
Request for obtaining Projects metadata. The result is a JSON object including:

| Title | Type | Description |
| ------- | ---------- |-------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Project Metadata<br>`+Required when replying` |
| **attributes** | Array(Object) | Collection of additional fields |
| **createShared** | Boolean | Create new Projects with tag "General"<br>`+Required when replying` |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Project method data

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/project/metadata"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional fields of projects.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "id": "5290a290-0313-11e6-9464-e4de00000020",
       "name": "attribute_name",
       "type": "boolean",
       "required": false
     }
   ],
   "createShared": true
}
```

### Separate additional field

 
**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 5290a290-0313-11e6-9464-e4de00000020* Fields ID. |

> Request for information on a separate additional field.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/project/metadata/attributes/5290a290-0313-11e6-9464-e4de00000020"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/project/metadata/attributes/5290a290-0313-11e6-9464-e4de00000020",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "5290a290-0313-11e6-9464-e4de00000020",
   "name": "attribute_name",
   "type": "boolean",
   "required": false
}
```

### Project

**Parameters**

| Parameter | Description |
| ------- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Project id. |

### Get Project
> Request to get a separate project with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/project/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the project.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/project/51f263f9-0307-11e6-9464-e4de0000007c",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
     "type": "project",
     "mediaType": "application/json"
   },
   "id": "51f263f9-0307-11e6-9464-e4de0000007c",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-04-15 15:41:05",
   "name": "Tomato Paste Aggregator",
   "description": "Tomato paste collection and processing project from all suppliers",
   "code": "1248y12hrd",
   "externalCode": "HZV7dGc8iAnf0aNjrvQvN0",
   "archived": false,
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/project/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "ddff1ee8-12c1-11e6-9464-e4de0000007a",
       "name": "Project priority",
       "type": "string",
       "value": "Medium"
     }
   ]
}
```

### Edit Project
Request to update an existing project with the specified id.

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Project id. |

> An example of a request to update an existing project.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/project/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "Supplier vertical integration project",
             "description": "Integration with a key counterparty",
             "code": "006_1",
             "externalCode": "cas12rgs"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated project.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/project/2c013eeb-0af0-11e6-9464-e4de00000026",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
     "type": "project",
     "mediaType": "application/json"
   },
   "id": "2c013eeb-0af0-11e6-9464-e4de00000026",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-04-25 17:17:21",
   "name": "Supplier vertical integration project",
   "description": "Integration with a key counterparty",
   "code": "006_1",
   "externalCode": "cas12rgs",
   "archived": false
}
```

> An example of a request to update an existing project with additional fields in the request body.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/project/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "New accounting and sales system",
             "description": "Project for the transition to a new system of accounting and marketing of products",
             "code": "123",
             "externalCode": "fbeuf21dof1f",
             "attributes": [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/project/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a","type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "Extremely high"
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated project.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/project/169ed74e-12c3-11e6-9464-e4de00000000",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
     "type": "project",
     "mediaType": "application/json"
   },
   "id": "169ed74e-12c3-11e6-9464-e4de00000000",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-05-05 16:18:18",
   "name": "New accounting and sales system",
   "description": "Project for the transition to a new system of accounting and marketing of products",
   "code": "123",
   "externalCode": "fbeuf21dof1f",
   "archived": false,
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/project/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "ddff1ee8-12c1-11e6-9464-e4de0000007a",
       "name": "Project priority",
       "type": "string",
       "value": "Extremely high"
     }
   ]
}
```
