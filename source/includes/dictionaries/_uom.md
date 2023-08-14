## Unit of measure
### Units of measure
This entity can be contextually searched using the special `search` parameter. More details can be found at [link](../#kladana-json-api-general-info-context-search). The search with the search parameter differs from others in that the search is not prefixed, without tokenization, and only goes through one field at a time. Searches for strings that include the value of the search string.

The search among objects of units of measurement for matching the search string will be carried out in the following fields:

+ by name Units **name**
+ according to description Units **description**

#### Entity attributes

| Title | Type                                               | Filtration | Description |
| ------- |----------------------------------------------------|------ | -------- |
| **accountId** | UUID                                               | `=` `!=` | Account ID<br>`+Read Only` |
| **code** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Code Units |
| **description** | String(4096)                                       | `=` `!=` `~` `~=` `=~` | Description Units |
| **externalCode** | String(255)                                        | `=` `!=` `~` `~=` `=~` | External code Units<br>`+Required when replying` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Department Employee<br>`+Expand` `+For custom units. measurements` |
| **id** | UUID                                               | `=` `!=` | ID Units<br>`+Required for response` `+Read only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Metadata Units<br>`+Required when replying` |
| **name** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Name Units of measurement<br>`+Required when answering` `+Required when creating` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Expand` `+For custom units. measurements` |
| **shared** | Boolean                                            | `=` `!=` | Sharing<br>`+Required when replying` `+For custom units. measurements` |
| **updated** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Last update time Units<br>`+Required when replying` `+Read-only` |

### Get Units of measure
Request to get a list of all units of measure for the given account.
Result: JSON object including fields:

| Title | Type | Description |
| ------- | -------- |----- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Units of Measure. |

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Units

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/uom"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of units of measure.

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
     "href": "https://app.kladana.in/api/remap/1.2/entity/uom?limit=5",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
     "type": "uom",
     "mediaType": "application/json",
     "size": 60,
     "limit": 5,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/uom/061721df-9197-49a5-b637-7f5b4d3be969",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
         "type": "uom",
         "mediaType": "application/json"
       },
       "id": "061721df-9197-49a5-b637-7f5b4d3be969",
       "updated": "2012-11-02 11:07:44",
       "name": "inch",
       "description": "Inch (25.4 mm)",
       "code": "039",
       "externalCode": "039"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/uom/0dd4fe8b-e59e-486e-bde5-b52fe0e25415",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
         "type": "uom",
         "mediaType": "application/json"
       },
       "id": "0dd4fe8b-e59e-486e-bde5-b52fe0e25415",
       "updated": "2012-11-02 11:07:44",
       "name": "month",
       "description": "Month",
       "code": "362",
       "externalCode": "362"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/uom/151af5a2-3df9-4aca-851c-814c8b3a65e6",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
         "type": "uom",
         "mediaType": "application/json"
       },
       "id": "151af5a2-3df9-4aca-851c-814c8b3a65e6",
       "updated": "2012-11-02 11:07:44",
       "name": "c",
       "description": "centner (metric) (100 kg); hectokilogram; quintal1 (metric); deciton",
       "code": "206",
       "externalCode": "206"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/uom/1700dfba-e9e7-4c98-9857-8d984ab48b2b",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
         "type": "uom",
         "mediaType": "application/json"
       },
       "id": "1700dfba-e9e7-4c98-9857-8d984ab48b2b",
       "updated": "2012-11-02 11:07:44",
       "name": "h",
       "description": "Hour",
       "code": "356",
       "externalCode": "356"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
         "type": "uom",
         "mediaType": "application/json"
       },
       "id": "19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
       "updated": "2012-11-02 11:07:44",
       "name": "piece",
       "description": "Thing",
       "code": "796",
       "externalCode": "796"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/uom/79e6d170-7df6-11e8-7e04-3e5a00000097",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
         "type": "uom",
         "mediaType": "application/json"
       },
       "id": "79e6d170-7df6-11e8-7e04-3e5a00000097",
       "accountId": "1902785b-7df4-11e8-7e04-3e5a00000001",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/1fe747fc-7df4-11e8-7e04-3e5a0000002d",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#employee/edit?id=1fe747fc-7df4-11e8-7e04-3e5a0000002d"
         }
       },
       "shared": true,
       "group": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/19062b38-7df4-11e8-7e04-3e5a00000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2018-07-02 15:50:19",
       "name": "Parrots",
       "description": "To measure boas",
       "code": "papagei",
       "externalCode": "parrotUnitOfMeasure"
     }
   ]
}
```

### Create Unit of Measure
Request to create a new unit of measure on this account.
The only field that must be present in the request body
to create Units of measurement - field **name**.

> An example of a request to create a new unit of measure.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/uom"
     -H"Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "Parrots",
             "description": "To measure boas",
             "code": "papagei",
             "externalCode": "parrotUnitOfMeasure"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated unit of measure.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/uom/b25681fd-24d0-11e6-8a84-bae500000019",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
     "type": "uom",
     "mediaType": "application/json"
   },
   "id": "b25681fd-24d0-11e6-8a84-bae500000019",
   "accountId": "45489428-24a5-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/1fe747fc-7df4-11e8-7e04-3e5a0000002d",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=1fe747fc-7df4-11e8-7e04-3e5a0000002d"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/19062b38-7df4-11e8-7e04-3e5a00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-05-30 10:04:29",
   "name": "Parrots",
   "description": "To measure boas",
   "code": "papagei",
   "externalCode": "parrotUnitOfMeasure"
}
```

### Unit of measure bulk creating and update

[Unit of measure bulk creating and update](../#kladana-json-api-general-info-create-and-update-multiple-objects).
In the body of the request, you need to pass an array containing JSON representations of the units of measure that you want to create or update.
Updated units of measure must contain the identifier in the form of metadata.

> Example of creating and updating multiple units of measure

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/uom"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "Parrots",
               "description": "To measure boas",
               "code": "papagei",
               "externalCode": "parrotUnitOfMeasure"
             },
             {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/uom/01be5f70-24d1-11e6-8a84-bae50000001a",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
                 "type": "uom",
                 "mediaType": "application/json"
               },
               "name": "Parrot",
               "description": "For accurate measurement of boas",
               "code": "papagai",
               "externalCode": "papagaitUnitOfMeasure"
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the generated and updated units of measure.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/uom/b25681fd-24d0-11e6-8a84-bae500000019",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
       "type": "uom",
       "mediaType": "application/json"
     },
     "id": "b25681fd-24d0-11e6-8a84-bae500000019",
     "accountId": "45489428-24a5-11e6-8a84-bae500000001",
     "updated": "2016-05-30 10:04:29",
     "name": "Parrots",
     "description": "To measure boas",
     "code": "papagei",
     "externalCode": "parrotUnitOfMeasure"
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/uom/01be5f70-24d1-11e6-8a84-bae50000001a",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
       "type": "uom",
       "mediaType": "application/json"
     },
     "id": "01be5f70-24d1-11e6-8a84-bae50000001a",
     "accountId": "45489428-24a5-11e6-8a84-bae500000001",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/1fe747fc-7df4-11e8-7e04-3e5a0000002d",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#employee/edit?id=1fe747fc-7df4-11e8-7e04-3e5a0000002d"
       }
     },
     "shared": true,
     "group": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/19062b38-7df4-11e8-7e04-3e5a00000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-05-30 10:06:42",
     "name": "Parrot",
     "description": "For accurate measurement of boas",
     "code": "papagai",
     "externalCode": "papagaitUnitOfMeasure"
   }
]
```

### Delete Unit of measure
Request to remove a unit of measure. It is not possible to delete the preset units of measurement (the units of measurement available on the account by default).
You can only delete units of measure created through the main interface or through the POST method.


**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id The unit of measure. |

> Delete Unit

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/uom/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of Retail.

### Unit of measure bulk deletion

In the body of the request, you need to pass an array containing JSON metadata of the Units of Measure that you want to remove.


> Bulk delete request Units.

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/uom/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d'[
        {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/uom/7944ef04-f831-11e5-7a69-971500188b1",
                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
                "type": "uom",
                "mediaType": "application/json"
            }
        },
        {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/uom/7944ef04-f831-11e5-7a69-971500188b2",
                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
                "type": "uom",
                "mediaType": "application/json"
            }
        }
    ]'
```

> Successful request. The result is JSON information about the removal of Units.

```json
[
   {
     "info":"Entity 'uom' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'uom' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```
  
### Get Unit of measure

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id The unit of measure. |
 
> Request to get a unit of measure with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/uom/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Unit of Measure with the specified id.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/uom/061721df-9197-49a5-b637-7f5b4d3be969",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
     "type": "uom",
     "mediaType": "application/json"
   },
   "id": "061721df-9197-49a5-b637-7f5b4d3be969",
   "updated": "2012-11-02 11:07:44",
   "name": "inch",
   "description": "Inch (25.4 mm)",
   "code": "039",
   "externalCode": "039"
}
```

### Change Unit of Measure
A request to change an object that represents a unit of measure. Unable to change preset units of measure
  (units of measure available on the account by default).
You can only change units of measure created through the main interface or through the POST method.

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id The unit of measure. |

> Example of a request to update a new unit of measure.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/uom/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "Parrot",
             "description": "For accurate measurement of boas",
             "code": "papagai",
             "externalCode": "papagaitUnitOfMeasure"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Unit of Measure.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/uom/01be5f70-24d1-11e6-8a84-bae50000001a",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
     "type": "uom",
     "mediaType": "application/json"
   },
   "id": "01be5f70-24d1-11e6-8a84-bae50000001a",
   "accountId": "45489428-24a5-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/1fe747fc-7df4-11e8-7e04-3e5a0000002d",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=1fe747fc-7df4-11e8-7e04-3e5a0000002d"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/19062b38-7df4-11e8-7e04-3e5a00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-05-30 10:06:42",
   "name": "Parrot",
   "description": "For accurate measurement of boas",
   "code": "papagai",
   "externalCode": "papagaitUnitOfMeasure"
}
```
