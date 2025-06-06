## Production Operations
Using the JSON API, you can query and update lists of Production Operations and information on individual Production Operations. The entity code for Production Operations in the JSON API is the **processingstage** keyword. Learn more about [Production Operations](https://kladana.zendesk.com/hc/en-us/articles/8082376915857-Production-Operations-and-Routings).

### Production Operations
#### Entity attributes

| Title | Type    | Filtration | Description |
| ------- | ----- | ---------- | ----------- |
| **accountId** | UUID                                               | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **allPerformers**   | Boolean |  | Availability indicator for assignment to any employee stage<br>`+Required when replying` |
| **archived** | Boolean                                            | `=` `!=` | Has the Production Operation been added to the archive<br>`+Required when replying` |
| **description** | String(4096)                                       | `=` `!=` `~` `~=` `=~` | Production Operation Comment |
| **externalCode** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Outer Production Operation code<br>`+Required when replying` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID                                               | `=` `!=` | Production Operation ID<br>`+Required when replying` `+Read only` |
| **materialStore** | [Meta](../#kladana-json-api-general-info-metadata) | | Material warehouse metadata<br>`+Read-only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Production Operation Metadata<br>`+Required when replying` `+Read Only` |
| **name** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Production Operation Name<br>`+Required when replying` `+Required for creation` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Expand` |
| **performers** | MetaArray | | Metadata of possible performers<br>`+Required when replying` |
| **shared** | Boolean | `=` `!=` | Sharing<br>`+Required when replying` |
| **standardHourCost** | Double | | Standard Hour cost of a certain production operation<br>`+Required when replying` |
| **updated** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Production Operation last update time<br>`+Required when replying` `+Read only` |

Features of work:<br>
If the allperformers flag=true AND the performers[] list is empty, then this state is: “Any active employee can be assigned as the performer of this stage.”<br>
If the allperformers flag=false AND the performers[] list is empty, then this state is: “No one can be assigned as the performer of this stage.”<br>
If the allperformers flag=false AND the performers[] list is returned with data, then this state is: “Only an employee from the selection can be assigned as the performer of this stage.”<br>
When passing only allperformers=true in the request, the performers array will be automatically cleared. Also, when passing only the performers array, the allperformers value will be automatically changed to false.

### Get the list of Production Operation

Request all Production Operations on this account.
Result: JSON object including fields:

| Title | Type | Description |
| ------- |----------|------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the employee who made the request. |
| **rows** | Array(Object) | Array of JSON objects representing Production Operations.|

**Parameters**

| Parameter | Description |
| ------- |----------|
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get a list of Production Operations

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/processingstage"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Production Operations.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/processingstage",
     "type": "processingstage",
     "mediaType": "application/json",
     "size": 1,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/processingstage/d2308bcc-8fd9-11ed-ac12-000b000000c1",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingstage/metadata",
         "type": "processingstage",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#processingstage/edit?id=d2308bcc-8fd9-11ed-ac12-000b000000c1"
       },
       "id": "d2308bcc-8fd9-11ed-ac12-000b000000c1",
       "accountId": "d063f3f3-8fd9-11ed-ac12-000e00000000",
       "owner": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d105a6bf-8fd9-11ed-ac12-000b0000004f",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#employee/edit?id=d105a6bf-8fd9-11ed-ac12-000b0000004f"
         }
       },
       "shared": true,
       "group": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/group/d0668856-8fd9-11ed-ac12-000e00000001",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2023-01-11 09:01:18.363",
       "name": "Main Production Operation",
       "externalCode": "sTV9PL-HjZkNgDMUqvKKe3",
       "archived": false,
       "allPerformers": false,
       "performers": [
        {
          "meta": {
            "href": "http://api.kladana.com/api/remap/1.2/entity/employee/83db6e80-761b-4e3d-aee8-641299ed0898",
            "metadataHref": "http://api.kladana.com/api/remap/1.2/entity/employee/metadata",
            "type": "employee",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.com/app/#employee/edit?id=83db6e80-761b-4e3d-aee8-641299ed0898"
          }
        }
      ]
     }
   ]
}
```

### Create Production Operation

Create new production operation.

#### Description
The Production Operation is created based on the passed JSON object, which contains a representation of the new Production Operation.
The result is a JSON representation of the created Production Operation.
To create a new Production Operation, it is necessary and sufficient to specify a non-empty `name` field in the passed object.

> An example of the most complete request in terms of the number of fields.

   ```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/processingstage"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "Production Operation 1",
             "externalCode": "456",
             "description": "Preparation",
             "allPerformers" : true
           }'
   ```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Production Operation.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/processingstage/d2308bcc-8fd9-11ed-ac12-000b000000c1",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingstage/metadata",
     "type": "processingstage",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#processingstage/edit?id=d2308bcc-8fd9-11ed-ac12-000b000000c1"
   },
   "id": "d2308bcc-8fd9-11ed-ac12-000b000000c1",
   "accountId": "d063f3f3-8fd9-11ed-ac12-000e00000000",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d105a6bf-8fd9-11ed-ac12-000b0000004f",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#employee/edit?id=d105a6bf-8fd9-11ed-ac12-000b0000004f"
     }
   },
   "shared": true,
   "standardHourCost": 0.0,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/d0668856-8fd9-11ed-ac12-000e00000001",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2023-01-11 09:01:18.363",
   "name": "Production Operation 1",
   "description": "Preparation",
   "externalCode": "456",
   "archived": false,
   "allPerformers": true,
   "performers": []
}
```

### Production Operations bulk creation and update
[Production Operations bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects).
In the body of the request, you need to pass an array containing the JSON representation of the steps you want to create or update.
Updated Production Operations must contain the identifier in the form of metadata.

> Example of creating and updating multiple Production Operations

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/processingstage"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "Production Operation 2"
             },
             {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/processingstage/d2308bcc-8fd9-11ed-ac12-000b000000c1",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingstage/metadata",
                 "type": "processingstage",
                 "mediaType": "application/json",
                 "uuidHref": "https://app.kladana.com/app/#processingstage/edit?id=d2308bcc-8fd9-11ed-ac12-000b000000c1"
               },
               "name": "Production Operation 1",
               "description": "Preparation"
             }
           ]'
```
> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated steps.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingstage/d2308bcc-8fd9-11ed-ac12-000b000000c2",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingstage/metadata",
       "type": "processingstage",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#processingstage/edit?id=d2308bcc-8fd9-11ed-ac12-000b000000c2"
     },
     "id": "d2308bcc-8fd9-11ed-ac12-000b000000c2",
     "accountId": "d063f3f3-8fd9-11ed-ac12-000e00000000",
     "owner": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d105a6bf-8fd9-11ed-ac12-000b0000004f",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#employee/edit?id=d105a6bf-8fd9-11ed-ac12-000b0000004f"
       }
     },
     "shared": true,
     "standardHourCost": 0.0,
     "group": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/group/d0668856-8fd9-11ed-ac12-000e00000001",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2023-01-31 11:47:09.193",
     "name": "Step 2",
     "externalCode": "hsthsrehs",
     "archived": false,
     "allPerformers": true,
     "performers": []
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/processingstage/d2308bcc-8fd9-11ed-ac12-000b000000c1",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingstage/metadata",
       "type": "processingstage",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#processingstage/edit?id=d2308bcc-8fd9-11ed-ac12-000b000000c1"
     },
     "id": "d2308bcc-8fd9-11ed-ac12-000b000000c1",
     "accountId": "d063f3f3-8fd9-11ed-ac12-000e00000000",
     "owner": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d105a6bf-8fd9-11ed-ac12-000b0000004f",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#employee/edit?id=d105a6bf-8fd9-11ed-ac12-000b0000004f"
       }
     },
     "shared": true,
     "standardHourCost": 0.0,
     "group": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/group/d0668856-8fd9-11ed-ac12-000e00000001",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2023-01-31 11:47:09.559",
     "name": "Production Operation 1",
     "description": "Preparation",
     "externalCode": "sTV9PL-HjZkNgDMUqvKKe3",
     "archived": false,
     "allPerformers": true,
     "performers": []
   }
]
```

### Delet Production Operation

**Parameters**

| Parameter | Description |
| ------- |----------|
| **id** | `string` (required) *Example: d2308bcc-8fd9-11ed-ac12-000b000000c2* Production Operation id. |

> Request to remove the Production Operation with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/processingstage/d2308bcc-8fd9-11ed-ac12-000b000000c2"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of the Production Operation.

### Production Operations bulk deletion

In the body of the request, you need to pass an array containing the JSON metadata of the Production Operations that you want to remove.


> Request for bulk deletion of Production Operations.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/processingstage/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/processingstage/d2308bcc-8fd9-11ed-ac12-000b000000c2",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingstage/metadata",
                  "type": "processingstage",
                  "mediaType": "application/json"
              }
          },
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/processingstage/d2308bcc-8fd9-11ed-ac12-000b000000c1",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingstage/metadata",
                  "type": "processingstage",
                  "mediaType": "application/json"
              }
          }
      ]'
```

> Successful request. The result is JSON information about deleting Production Operations.

```json
[
   {
     "info":"Entity 'processingstage' with UUID: d2308bcc-8fd9-11ed-ac12-000b000000c2 successfully removed"
   },
   {
     "info":"Entity 'processingstage' with UUID: d2308bcc-8fd9-11ed-ac12-000b000000c1 successfully deleted"
   }
]
```

### Production Operation

### Get Production Operation

**Parameters**

| Parameter | Description |
| ------- |----------|
| **id** | `string` (required) *Example: d2308bcc-8fd9-11ed-ac12-000b000000c1* Production Operation id. |
 
> Request to receive a separate Production Operation with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/processingstage/d2308bcc-8fd9-11ed-ac12-000b000000c1"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Production Operation.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/processingstage/d2308bcc-8fd9-11ed-ac12-000b000000c1",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingstage/metadata",
     "type": "processingstage",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#processingstage/edit?id=d2308bcc-8fd9-11ed-ac12-000b000000c1"
   },
   "id": "d2308bcc-8fd9-11ed-ac12-000b000000c1",
   "accountId": "d063f3f3-8fd9-11ed-ac12-000e00000000",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d105a6bf-8fd9-11ed-ac12-000b0000004f",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#employee/edit?id=d105a6bf-8fd9-11ed-ac12-000b0000004f"
     }
   },
   "shared": true,
   "standardHourCost": 0.0,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/d0668856-8fd9-11ed-ac12-000e00000001",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2023-01-11 09:01:18.363",
   "name": "Main Production Operation",
   "externalCode": "sTV9PL-HjZkNgDMUqvKKe3",
   "archived": false,
   "allPerformers": true,
   "performers": []
}
```

### Change Production Operation
Request to update an existing Production Operation.

**Parameters**

| Parameter | Description |
| ------- |----------|
| **id** | `string` (required) *Example: d2308bcc-8fd9-11ed-ac12-000b000000c1* Production Operation id.|

> Example of the Production Operation Update Request

  ```shell
    curl -X PUT
      "https://api.kladana.com/api/remap/1.2/entity/processingstage/d2308bcc-8fd9-11ed-ac12-000b000000c1"
      -H "Authorization: Basic <Credentials>"
      -H "Accept-Encoding: gzip"
      -H "Content-Type: application/json"
        -d '{
              "name": "Production Operation 1.1",
              "performers": [
               {
                 "meta": {
                   "href": "http://api.kladana.com/api/remap/1.2/entity/employee/83db6e80-761b-4e3d-aee8-641299ed0898",
                   "metadataHref": "http://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                   "type": "employee",
                   "mediaType": "application/json",
                   "uuidHref": "https://app.kladana.com/app/#employee/edit?id=83db6e80-761b-4e3d-aee8-641299ed0898"
                 }
               }
             ]
            }'
  ```
> Response 200(application/json)
Successful request. The result is a JSON representation of the Production Operation.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/processingstage/d2308bcc-8fd9-11ed-ac12-000b000000c1",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/processingstage/metadata",
     "type": "processingstage",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#processingstage/edit?id=d2308bcc-8fd9-11ed-ac12-000b000000c1"
   },
   "id": "d2308bcc-8fd9-11ed-ac12-000b000000c1",
   "accountId": "d063f3f3-8fd9-11ed-ac12-000e00000000",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d105a6bf-8fd9-11ed-ac12-000b0000004f",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#employee/edit?id=d105a6bf-8fd9-11ed-ac12-000b0000004f"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/d0668856-8fd9-11ed-ac12-000e00000001",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2023-01-11 09:01:18.363",
   "name": "Production Operation 1.1",
   "externalCode": "sTV9PL-HjZkNgDMUqvKKe3",
   "archived": false,
   "allPerformers" : false,
  "performers": [
    {
      "meta": {
        "href": "http://api.kladana.com/api/remap/1.2/entity/employee/83db6e80-761b-4e3d-aee8-641299ed0898",
        "metadataHref": "http://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=83db6e80-761b-4e3d-aee8-641299ed0898"
      }
    }
  ]
}
```
