## Routing
Using the JSON API, you can create and update information about Routings, query lists of Routings, and query individual Routings.
Routings positions can be managed both as part of a separate Routing, and separately - using special resources for managing Routings positions.
The entity code for Routings as part of the JSON API is the **processingprocess** keyword. Learn more about [Routings](https://kladana.zendesk.com/hc/en-us/articles/8082376915857-Production-Operations-and-Routings#2).

### Routings
#### Entity attributes

| Title | Type | Filtration| Description | 
|------------|-----------|-------|---------------|
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **archived** | Boolean | `=` `!=` | Has Routing been archived<br>`+Required when replying` |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Comment Routing |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | External code Routing<br>`+Required for response` |
| **group** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID | `=` `!=` | Routing ID<br>`+Required for response` `+Read only` |
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | | Routing Metadata<br>`+Required in response` `+Read-only` |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Routing Name<br>`+Required for response` `+Required for creation` |
| **owner** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | `=` `!=` | Owner (Employee)<br>`+Required when replying` `+Expand` |
| **positions** | MetaArray | | Routing position metadata<br>`+Required when responding` `+Required when creating` `+Expand` |
| **shared** | Boolean | `=` `!=` | Sharing<br>`+Required when replying` |
| **updated** | datetime | `=` `!=` `<` `>` `<=` `>=` | When the entity was last updated<br>`+Required for response` `+Read-only` |

#### Nested entity attributes
##### Routing Positions
Routing Positions is a list of stages that are included in Routing. Routing can have from 1 to 100 positions.
The Routing position object contains the following fields:

| Title | Type | Description |
|------------|-----------|-------|
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Read Only` |
| **id** | UUID | Item ID<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Routing position metadata<br>`+Required for response` `+Read only` |
| **processingstage** | [Meta](../dictionaries/#suschnosti-jetap-proizwodstwa) | Stage metadata, which is a position<br>`+Required when responding` `+Required when creating` `+Expand` |

### Get the list of Routings

Query all Routings on a given account.
Result: JSON object including fields:

| Title | Type | Description |
|------------|-----------|-------|
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Issuance metadata |
| **context** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Metadata about the employee who made the request |
| **rows** | Array(Object) | An array of JSON objects representing Routings |

**Parameters**

| Parameter |Description |
| ------------| --------------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Request for list of Routings

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/processingprocess"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Routings list.

```json
{
   context: {
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
     "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess",
     "type": "processing",
     "mediaType": "application/json",
     size: 1
     limit: 1000
     offset: 0
   },
   rows: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/d5174779-862b-11eb-ac14-000900000007",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/metadata",
         "type": "processing",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#processingprocess/edit?id=d5174779-862b-11eb-ac14-000900000007"
       },
       "id": "d5174779-862b-11eb-ac14-000900000007",
       "accountId": "dbb8cfc1-cbfa-11e1-6dfb-889ffa6f49fd",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/872559f1-cbf3-11e1-9eb9-889ffa6f49fd",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#employee/edit?id=872559f1-cbf3-11e1-9eb9-889ffa6f49fd"
         }
       },
       shared: true
       group: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/f7eb1e3b-fd2a-42f7-b799-b3d1e6b3bf43",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2021-03-16 10:47:18.160",
       "name": "Main workflow",
       "externalCode": "F1l43a3ojXZShfnzJCKsG3",
       archived: false
       positions: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/d5174779-862b-11eb-ac14-000900000007/positions",
           "type": "processingprocessposition",
           "mediaType": "application/json",
           size: 1
           limit: 1000
           offset: 0
         }
       }
     }
   ]
}
```

### Get Routing

**Parameters**

| Parameter | Description |
| ------- |------------|
| **id** | `string` (required) *Example: d2308bcc-8fd9-11ed-ac12-000b000000c1* Routing ID. |

> Request to get a separate Routing with the specified ID.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/processingprocess/d2308bcc-8fd9-11ed-ac12-000b000000c1"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a Routing.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/d5174779-862b-11eb-ac14-000900000007",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/metadata",
     "type": "processing",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#processingprocess/edit?id=d5174779-862b-11eb-ac14-000900000007"
   },
   "id": "d5174779-862b-11eb-ac14-000900000007",
   "accountId": "dbb8cfc1-cbfa-11e1-6dfb-889ffa6f49fd",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/872559f1-cbf3-11e1-9eb9-889ffa6f49fd",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=872559f1-cbf3-11e1-9eb9-889ffa6f49fd"
     }
   },
   shared: true
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f7eb1e3b-fd2a-42f7-b799-b3d1e6b3bf43",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2021-03-16 10:47:18.160",
   "name": "Main workflow",
   "externalCode": "F1l43a3ojXZShfnzJCKsG3",
   archived: false
   positions: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/d5174779-862b-11eb-ac14-000900000007/positions",
       "type": "processingprocessposition",
       "mediaType": "application/json",
       size: 1
       limit: 1000
       offset: 0
     }
   }
}
```

### Create Routing
Request to create a new Routing.
Required fields for creating:

+ **name** - Routing name
+ **positions** - Links to Routing positions in [Metadata](../#mojsklad-json-api-obschie-swedeniq-metadannye) format

> Request to create a new Routing with a request body containing only the required fields.

```shell
curl -X POST
"https://app.kladana.in/api/remap/1.2/entity/processingprocess"
-H "Authorization: Basic <Credentials>"
-H "Content-Type: application/json"
-d '{
"name": "We make the engine",
"positions": [
{
"processing stage": {
"meta": {
"href": "https://app.kladana.in/api/remap/1.2/entity/processingstage/364b1107-9bd3-11ed-ac12-000c0000006a",
"metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingstage/metadata",
"type": "processing stage",
"mediaType": "application/json",
"uuidHref": "https://app.kladana.in/app/#processingstage/edit?id=364b1107-9bd3-11ed-ac12-000c0000006a"
         }
       }
     }
   ]
}'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Routing.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/63b86a2e-a6ac-11ed-ac12-00090000000a",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/metadata",
     "type": "processing",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#processingprocess/edit?id=63b86a2e-a6ac-11ed-ac12-00090000000a"
   },
   "id": "63b86a2e-a6ac-11ed-ac12-00090000000a",
   "accountId": "c0b1ef18-9aea-11ed-ac12-000b00000011",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/c0f98b1e-9aea-11ed-ac12-000e00000050",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=c0f98b1e-9aea-11ed-ac12-000e00000050"
     }
   },
   shared: true
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/c0b230f9-9aea-11ed-ac12-000b00000012",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2023-02-07 08:58:05.574",
   "name": "We make the engine",
   "externalCode": "Jsi3Cs2fipoDAZcFrrxX01",
   archived: false
   positions: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/63b86a2e-a6ac-11ed-ac12-00090000000a/positions",
       "type": "processingprocessposition",
       "mediaType": "application/json",
       size: 1
       limit: 1000
       offset: 0
     }
   }
}
```

### Change Routing
In the body of the request, specify the fields that need to be changed for Routing

**Parameters**

| Parameter | Description |
| ------- |-----------|
| **id** | `string` (required) *Example: 117cae13-a612-11ed-ac12-000900000022* Routing ID. |

> Request to update Routing with the replacement of the stage of the existing position and the creation of a new position.

```shell
curl -X PUT
"https://app.kladana.in/api/remap/1.2/entity/processingprocess/117cae13-a612-11ed-ac12-000900000022"
-H "Authorization: Basic <Credentials>"
-H "Content-Type: application/json"
-d'
{
"name": "We are making engine #2",
"externalCode": "dfsafsfsd1231231",
archived: false
"positions": [
{
"meta": {
"href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/117cae13-a612-11ed-ac12-000900000022/positions/117cb64b-a612-11ed-ac12-000900000024",
"type": "processingprocessposition",
"mediaType": "application/json"
},
"processing stage": {
"meta": {
"href": "https://app.kladana.in/api/remap/1.2/entity/processingstage/c18373c0-9aea-11ed-ac12-000e000000c2",
"metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingstage/metadata",
"type": "processing stage",
"mediaType": "application/json"
     }
   }
},
{
"processing stage": {
"meta": {
"href": "https://app.kladana.in/api/remap/1.2/entity/processingstage/364b1107-9bd3-11ed-ac12-000c0000006a",
"metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingstage/metadata",
"type": "processing stage",
"mediaType": "application/json"
         }
       }
     }
   ]
}'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Routing.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/117cae13-a612-11ed-ac12-000900000022",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/metadata",
     "type": "processing",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#processingprocess/edit?id=117cae13-a612-11ed-ac12-000900000022"
   },
   "id": "117cae13-a612-11ed-ac12-000900000022",
   "accountId": "c0b1ef18-9aea-11ed-ac12-000b00000011",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/c0f98b1e-9aea-11ed-ac12-000e00000050",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=c0f98b1e-9aea-11ed-ac12-000e00000050"
     }
   },
   shared: true
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/c0b230f9-9aea-11ed-ac12-000b00000012",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2023-02-07 09:43:38.713",
   "name": "We are making engine #2",
   "externalCode": "dfsafsfsd1231231",
   archived: false
   positions: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/117cae13-a612-11ed-ac12-000900000022/positions",
       "type": "processingprocessposition",
       "mediaType": "application/json",
       size: 2
       limit: 1000
       offset: 0
     }
   }
}
```

### Remove Routing

**Parameters**

| Parameter | Description |
| ------- |----------|
| **id** | `string` (required) *Example: d2308bcc-8fd9-11ed-ac12-000b000000c1* Routing ID. |

> Request to remove the Routing with the specified ID.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/processingprocess/d2308bcc-8fd9-11ed-ac12-000b000000c1"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful removal of Routing

### Positions Routing

In essence, a position limit of 100 items is set. Learn more about line limits and working with
a large number of positions can be read on the example of working with document positions [here] (../#mojsklad-json-api-obschie-swedeniq-rabota-s-poziciqmi-dokumentow).

#### Routing position attributes
| Title | Type | Description |
|----------|--------|----------|
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Read Only` |
| **id** | UUID | Item ID<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Routing position metadata<br>`+Required for response` `+Read only` |
| **processingstage** | [Meta](../dictionaries/#suschnosti-jetap-proizwodstwa) | Stage metadata, which is a position<br>`+Required when responding` `+Required when creating` `+Expand` |

### Get Routing positions
Request to get a list of all positions of this Routing.

| Title | Type | Description |
|----------|--------|----------|
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Issuance metadata, |
| **context** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Routing positions. |

**Parameters**

| Parameter | Description |
|----------|--------|
| **id** | `string` (required) *Example: d5069703-988e-11ed-ac19-000400000029* Routing ID.|
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to retrieve.`Allowed values are 1 - 1000`.|
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Request for a list of positions Routing

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/processingprocess/d5069703-988e-11ed-ac19-000400000029/positions"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of individual Routing positions.

```json
{
   context: {
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
     "href": "hauto_awesome
Translate from: English
5,000 / 5,000
Translation results
Translation result
ttps://app.kladana.in/api/remap/1.2/entity/processingprocess/d5069703-988e-11ed-ac19-000400000029/positions",
     "type": "processingprocessposition",
     "mediaType": "application/json",
     size: 1
     limit: 1000
     offset: 0
   },
   rows: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/d5069703-988e-11ed-ac19-000400000029/positions/d5069da5-988e-11ed-ac19-00040000002a",
         "type": "processingprocessposition",
         "mediaType": "application/json"
       },
       "id": "d5069da5-988e-11ed-ac19-00040000002a",
       "accountId": "dbb8cfc1-cbfa-11e1-6dfb-889ffa6f49fd",
       "processing stage": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/processingstage/d4fed5b7-988e-11ed-ac19-000400000023",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingstage/metadata",
           "type": "processing stage",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#processingstage/edit?id=d4fed5b7-988e-11ed-ac19-000400000023"
         }
       }
     }
   ]
}
```

### Get Routing line item

**Parameters**

| Parameter | Description|
|----------|--------|
| **id** | `string` (required) *Example: 1d4adde5-a6bb-11ed-ac12-00090000003f* Routing ID. |
| **positionID** | `string` (required) *Example: 23a62e19-a6bb-11ed-ac12-000900000043* Routing position ID.|

> Request to get an individual Routing item with the specified ID.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/processingprocess/1d4adde5-a6bb-11ed-ac12-00090000003f/positions/23a62e19-a6bb-11ed-ac12-000900000043"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a single Routing item.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/1d4adde5-a6bb-11ed-ac12-00090000003f/positions/23a62e19-a6bb-11ed-ac12-000900000043",
     "type": "processingprocessposition",
     "mediaType": "application/json"
   },
   "id": "23a62e19-a6bb-11ed-ac12-000900000043",
   "accountId": "c0b1ef18-9aea-11ed-ac12-000b00000011",
   "processing stage": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/processingstage/4b5662f4-9bd3-11ed-ac12-000c00000070",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingstage/metadata",
       "type": "processing stage",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#processingstage/edit?id=4b5662f4-9bd3-11ed-ac12-000c00000070"
     }
   }
}
```

### Create Routing Items

**Parameters**

| Parameter | Description |
|----------|--------|
| **id** | `string` (required) *Example: 1d4adde5-a6bb-11ed-ac12-00090000003f* Routing ID. |

> Request to create Routing positions

```shell
curl -X POST
"https://app.kladana.in/api/remap/1.2/entity/processingprocess/1d4adde5-a6bb-11ed-ac12-00090000003f/positions"
-H "Authorization: Basic <Credentials>"
-H "Content-Type: application/json"
-d'
   [
{
"processing stage": {
"meta": {
"href": "https://app.kladana.in/api/remap/1.2/entity/processingstage/4b5662f4-9bd3-11ed-ac12-000c00000070",
"metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingstage/metadata",
"type": "processing stage",
"mediaType": "application/json"
        }
      }
   }
]'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Routing positions.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/1d4adde5-a6bb-11ed-ac12-00090000003f/positions/23a62e19-a6bb-11ed-ac12-000900000043",
       "type": "processingprocessposition",
       "mediaType": "application/json"
     },
     "id": "23a62e19-a6bb-11ed-ac12-000900000043",
     "accountId": "c0b1ef18-9aea-11ed-ac12-000b00000011",
     "processing stage": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/processingstage/4b5662f4-9bd3-11ed-ac12-000c00000070",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingstage/metadata",
         "type": "processing stage",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#processingstage/edit?id=4b5662f4-9bd3-11ed-ac12-000c00000070"
       }
     }
   }
]
```

### Change Routing Position

**Parameters**

| Parameter | Description |
|----------|--------|
| **id** | `string` (required) *Example: 1d4adde5-a6bb-11ed-ac12-00090000003f* Routing ID. |
| **positionID** | `string` (required) *Example: 23a62e19-a6bb-11ed-ac12-000900000043* Routing position ID.|

> Request to update position Routing

```shell
curl -X PUT
"https://app.kladana.in/api/remap/1.2/entity/processingprocess/1d4adde5-a6bb-11ed-ac12-00090000003f/positions/23a62e19-a6bb-11ed-ac12-000900000043"
-H "Authorization: Basic <Credentials>"
-H "Content-Type: application/json"
-d'
{
"processing stage": {
"meta": {
"href": "https://app.kladana.in/api/remap/1.2/entity/processingstage/4b5662f4-9bd3-11ed-ac12-000c00000070",
"metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingstage/metadata",
"type": "processing stage",
"mediaType": "application/json"
   }
 }
}'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Routing position.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/1d4adde5-a6bb-11ed-ac12-00090000003f/positions/23a62e19-a6bb-11ed-ac12-000900000043",
     "type": "processingprocessposition",
     "mediaType": "application/json"
   },
   "id": "23a62e19-a6bb-11ed-ac12-000900000043",
   "accountId": "c0b1ef18-9aea-11ed-ac12-000b00000011",
   "processing stage": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/processingstage/4b5662f4-9bd3-11ed-ac12-000c00000070",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingstage/metadata",
       "type": "processing stage",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#processingstage/edit?id=4b5662f4-9bd3-11ed-ac12-000c00000070"
     }
   }
}
```

### Delete position Routing

**Parameters**

| Parameter | Description |
|----------|--------|
| **id** | `string` (required) *Example: d5069703-988e-11ed-ac19-000400000029* Routing ID. |
| **positionID** | `string` (required) *Example: d5069da5-988e-11ed-ac19-00040000002a* Routing position ID.|

> Request to delete the Routing item with the specified ID.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/processingprocess/d5069703-988e-11ed-ac19-000400000029/positions/d5069da5-988e-11ed-ac19-00040000002a"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of line item Routing

### Routings bulk creation and update
With [bulk creation and update](../#mojsklad-json-api-obschie-swedeniq-sozdanie-i-obnowlenie-neskol-kih-ob-ektow) of Routings, an array must be passed in the request body,
containing the JSON representation of the Routings you want to create or update. The identifier for updated Routings is [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye).

> Request to create and update multiple Routings

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/processingprocess"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
     -d'
     [
       {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/1d4adde5-a6bb-11ed-ac12-00090000003f",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/metadata",
           "type": "processing",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#processingprocess/edit?id=1d4adde5-a6bb-11ed-ac12-00090000003f"
         },
         "name": "Punch"
       },
       {
         "name": "Galvanized",
         "positions": [
           {
             "processing stage": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/processingstage/364b1107-9bd3-11ed-ac12-000c0000006a",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingstage/metadata",
                 "type": "processing stage",
                 "mediaType": "application/json",
                 "uuidHref": "https://app.kladana.in/app/#processingstage/edit?id=364b1107-9bd3-11ed-ac12-000c0000006a"
               }
             }
           }
         ]
       }
     ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the generated and updated Routings.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/1d4adde5-a6bb-11ed-ac12-00090000003f",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/metadata",
       "type": "processing",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#processingprocess/edit?id=1d4adde5-a6bb-11ed-ac12-00090000003f"
     },
     "id": "1d4adde5-a6bb-11ed-ac12-00090000003f",
     "accountId": "c0b1ef18-9aea-11ed-ac12-000b00000011",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/c0f98b1e-9aea-11ed-ac12-000e00000050",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#employee/edit?id=c0f98b1e-9aea-11ed-ac12-000e00000050"
       }
     },
     "shared": true
     group: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/c0b230f9-9aea-11ed-ac12-000b00000012",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2023-02-07 13:21:36.610",
     "name": "Punch",
     "externalCode": "qcz9MXKjgZ4CAXXXzvrXK2",
     archived: false
     positions: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/1d4adde5-a6bb-11ed-ac12-00090000003f/positions",
         "type": "processingprocessposition",
         "mediaType": "application/json",
         size: 2
         limit: 1000
         offset: 0
       }
     }
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/33d6ee5c-a6d1-11ed-ac12-000900000046",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/metadata",
       "type": "processing",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#processingprocess/edit?id=33d6ee5c-a6d1-11ed-ac12-000900000046"
     },
     "id": "33d6ee5c-a6d1-11ed-ac12-000900000046",
     "accountId": "c0b1ef18-9aea-11ed-ac12-000b00000011",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/c0f98b1e-9aea-11ed-ac12-000e00000050",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#employee/edit?id=c0f98b1e-9aea-11ed-ac12-000e00000050"
       }
     },
     shared: true
     group: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/c0b230f9-9aea-11ed-ac12-000b00000012",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2023-02-07 13:21:36.637",
     "name": "Galvanized",
     "externalCode": "94GR5hU-hmU7wkVnkS8D53",
     archived: false
     positions: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/33d6ee5c-a6d1-11ed-ac12-000900000046/positions",
         "type": "processingprocessposition",
         "mediaType": "application/json",
         size: 1
         limit: 1000
         offset: 0
       }
     }
   }
]
```

### Routings bulk deletion

In the body of the request, you need to pass an array containing JSON of the Routings metadata that you want to remove.

> Request for Routings bulk deletion.

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/processingprocess/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d'
   [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/1d4adde5-a6bb-11ed-ac12-00090000003f",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/metadata",
         "type": "processing",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#processingprocess/edit?id=1d4adde5-a6bb-11ed-ac12-00090000003f"
       }
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/33d6ee5c-a6d1-11ed-ac12-000900000046",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/processingprocess/metadata",
         "type": "processing",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#processingprocess/edit?id=33d6ee5c-a6d1-11ed-ac12-000900000046"
       }
     }
   ]'
```

> Successful request. The result is JSON information about the deletion of the Technical Processes.

```json
[
   {
     "info": "Entity 'processingprocess' with UUID: 1d4adde5-a6bb-11ed-ac12-00090000003f successfully deleted"
   },
   {
     "info": "Entity 'processingprocess' with UUID: 33d6ee5c-a6d1-11ed-ac12-000900000046 successfully deleted"
   }
]
```