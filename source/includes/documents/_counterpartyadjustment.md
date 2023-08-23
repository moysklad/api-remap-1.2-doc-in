## Counterparty balance adjustment

Using the JSON API, you can create and update information about Counterparty Balance Adjustments, query lists of Counterparty Balance Adjustments, and information on individual Counterparty Balance Adjustments.

The entity code for Counterparty Balance Adjustment as part of the JSON API is the **counterpartyadjustment** keyword. Learn more about [counterparty balance adjusting](https://kladana.zendesk.com/hc/en-us/articles/6512840609821-How-to-adjust-balance-of-counterparty).

### Counterparty balance adjustments
#### Entity attributes

| Title | | Filtration | Description |
| ------- | ---- | ---- | ----- |
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **agent** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Counterparty metadata<br>`+Required when replying` `+Expand` `+Required when creating` |
| **applicable** | Boolean | `=` `!=` | Check mark<br>`+Required when answering` |
| **attributes** | Array(Object) | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields) |
| **created** | datetime | `=` `!=` `<` `>` `<=` `>=` | Creation date<br>`+Required when replying` `+Read only` |
| **deleted** | datetime | `=` `!=` `<` `>` `<=` `>=` | Moment of last deletion Counterparty balance adjustments<br>`+Read-only` |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Comment Counterparty balance adjustments |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | External code Counterparty balance adjustment<br>`+Required when replying` |
| **files** | MetaArray | | [Files](../dictionaries/#entities-files) array metadata array metadata (Maximum number of files - 100)<br>`+Required when replying` `+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID | `=` `!=` | Counterparty Balance Adjustment ID<br>`+Required when replying` `+Read only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Metadata Counterparty balance adjustments<br>`+Required when replying` |
| **moment** | datetime| `=` `!=` `<` `>` `<=` `>=` | Document date<br>`+Required when replying` |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Name Counterparty balance adjustments<br>`+Required when replying` |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Legal entity metadata<br>`+Required when replying` `+Expand` `+Required when creating` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Required when replying` `+Expand` |
| **printed** | Boolean | | Is the document printed<br>`+Required when responding` `+Read Only` |
| **published** | Boolean | | Is the document published<br>`+Required when replying` `+Read Only` |
| **shared** | Boolean | `=` `!=` | Sharing<br>`+Required when replying` |
| **sum** | int | `=` `!=` `<` `>` `<=` `>=` | Amount of Counterparty Balance Adjustment in rupees<br>`+Required when replying` `+Read only` |
| **updated** | datetime | `=` `!=` `<` `>` `<=` `>=` | Moment of last update Counterparty balance adjustments<br>`+Required when replying` `+Read-only` |

### Get a list of Counterparty Balance Adjustments
Request for all Counterparty Balance Adjustments on a given account.
Result: JSON object including fields:

| Title | Type | Description |
| ----------- | ------- | -------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing counterparty balance adjustments. |

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** |`string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Get a list of Counterparty Balance Adjustments

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of Counterparty Balance Adjustments.

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
     "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/",
     "type": "counterpartyadjustment",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/1bb899bc-0b17-11ec-ac16-000a00000006",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/metadata",
         "type": "counterpartyadjustment",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#counterpartyadjustment/edit?id=1bb899bc-0b17-11ec-ac16-000a00000006"
       },
       "id": "1bb899bc-0b17-11ec-ac16-000a00000006",
       "accountId": "9067e733-099c-11ec-ac16-000c00000001",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9334c6a2-099c-11ec-ac16-000b00000042",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#employee/edit?id=9334c6a2-099c-11ec-ac16-000b00000042"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/906f1cd6-099c-11ec-ac16-000c00000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2021-09-01 14:24:01.814",
       "name": "00002",
       "externalCode": "uUqTX1fBhBcEReQytuMOa2",
       "moment": "2021-09-01 14:24:00.000",
       "applicable": true,
       "sum": 12.0,
       "agent": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/947ebfcd-099c-11ec-ac16-000b00000083",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#company/edit?id=947ebfcd-099c-11ec-ac16-000b00000083"
         }
       },
       "organization": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/94527995-099c-11ec-ac16-000b0000007e",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#mycompany/edit?id=94527995-099c-11ec-ac16-000b0000007e"
         }
       },
       "created": "2021-09-01 14:24:01.873",
       "printed": false,
       "published": false,
       "attributes": [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/metadata/attributes/f478774c-0bfb-11ec-ac12-000d000000d1",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "f478774c-0bfb-11ec-ac12-000d000000d1",
           "name": "Address of residence",
           "type": "string",
           "value": "Gorokhovaya street, 666"
         }
       ],
       "files": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/1bb899bc-0b17-11ec-ac16-000a00000006/files",
           "type": "files",
           "mediaType": "application/json",
           "size": 0,
           "limit": 1000,
           "offset": 0
         }
       }
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/24d56ba6-0b14-11ec-ac16-000b00000013",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/metadata",
         "type": "counterpartyadjustment",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#counterpartyadjustment/edit?id=24d56ba6-0b14-11ec-ac16-000b00000013"
       },
       "id": "24d56ba6-0b14-11ec-ac16-000b00000013",
       "accountId": "9067e733-099c-11ec-ac16-000c00000001",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9334c6a2-099c-11ec-ac16-000b00000042",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#employee/edit?id=9334c6a2-099c-11ec-ac16-000b00000042"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/906f1cd6-099c-11ec-ac16-000c00000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2021-09-01 14:19:49.993",
       "name": "00001",
       "description": "description",
       "externalCode": "W5JWJ02SgTK5JRdcyQBUN0",
       "moment": "2021-09-01 14:02:00.000",
       "applicable": true,
       "sum": 21300.0,
       "agent": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/947ebfcd-099c-11ec-ac16-000b00000083",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#company/edit?id=947ebfcd-099c-11ec-ac16-000b00000083"
         }
       },
       "organization": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/94527995-099c-11ec-ac16-000b0000007e",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#mycompany/edit?id=94527995-099c-11ec-ac16-000b0000007e"
         }
       },
       "created": "2021-09-01 14:02:48.685",
       "printed": false,
       "published": false,
       "files": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/24d56ba6-0b14-11ec-ac16-000b00000013/files",
           "type": "files",
           "mediaType": "application/json",
           "size": 0,
           "limit": 1000,
           "offset": 0
         }
       }
     }
   ]
}
```

### Create Counterparty Balance Adjustment
Request to create a new Counterparty Balance Adjustment.
Mandatory fields to create:

| Parameter | Description |
| ------- | -------- |
| **organization** | Link to your legal entity in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **agent** | Link to the counterparty in the format [Metadata](../#kladana-json-api-general-info-metadata) |

> An example of creating a new Counterparty Balance Adjustment.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "agent": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/947ebfcd-099c-11ec-ac16-000b00000083",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                 "type": "counterparty",
                 "mediaType": "application/json",
                 "uuidHref": "https://app.kladana.in/app/#company/edit?id=947ebfcd-099c-11ec-ac16-000b00000083"
               }
             },
             "organization": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/organization/94527995-099c-11ec-ac16-000b0000007e",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
                 "type": "organization",
                 "mediaType": "application/json",
                 "uuidHref": "https://app.kladana.in/app/#mycompany/edit?id=94527995-099c-11ec-ac16-000b0000007e"
               }
             },
             "sum": 12.5
           }
'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Counterparty Balance Adjustment.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/2775d672-0b1a-11ec-ac16-000a0000000a",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/metadata",
     "type": "counterpartyadjustment",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#counterpartyadjustment/edit?id=2775d672-0b1a-11ec-ac16-000a0000000a"
   },
   "id": "2775d672-0b1a-11ec-ac16-000a0000000a",
   "accountId": "9067e733-099c-11ec-ac16-000c00000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9334c6a2-099c-11ec-ac16-000b00000042",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=9334c6a2-099c-11ec-ac16-000b00000042"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/906f1cd6-099c-11ec-ac16-000c00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2021-09-01 14:45:50.001",
   "name": "00003",
   "externalCode": "TKlkN7I6jVg9lbUPJlvK-0",
   "moment": "2021-09-01 14:45:00.000",
   "applicable": true,
   "sum": 12.5,
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/947ebfcd-099c-11ec-ac16-000b00000083",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#company/edit?id=947ebfcd-099c-11ec-ac16-000b00000083"
     }
   },
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/94527995-099c-11ec-ac16-000b0000007e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#mycompany/edit?id=94527995-099c-11ec-ac16-000b0000007e"
     }
   },
   "created": "2021-09-01 14:45:50.060",
   "printed": false,
   "published": false,
   "files": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/2775d672-0b1a-11ec-ac16-000a0000000a/files",
       "type": "files",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   }
}
```

### Bulk creation and updating of counterparty balance adjustments

[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Counterparty balance adjustments.
In the body of the request, you need to pass an array containing a JSON representation of the Counterparty Balance Adjustments that you want to create or update.
Updated Counterparty Balance Adjustments must contain the identifier in the form of metadata.

> Example of creating and updating multiple Counterparty Balance Adjustments

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "agent": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/947ebfcd-099c-11ec-ac16-000b00000083",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                   "type": "counterparty",
                   "mediaType": "application/json",
                   "uuidHref": "https://app.kladana.in/app/#company/edit?id=947ebfcd-099c-11ec-ac16-000b00000083"
                 }
               },
               organization: {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/organization/94527995-099c-11ec-ac16-000b0000007e",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
                   "type": "organization",
                   "mediaType": "application/json",
                   "uuidHref": "https://app.kladana.in/app/#mycompany/edit?id=94527995-099c-11ec-ac16-000b0000007e"
                 }
               },
               "sum": 12.5
             },
             {
               "agent": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/947ebfcd-099c-11ec-ac16-000b00000055",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                   "type": "counterparty",
                   "mediaType": "application/json",
                   "uuidHref": "https://app.kladana.in/app/#company/edit?id=947ebfcd-099c-11ec-ac16-000b00000055"
                 }
               },
               organization: {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/organization/94527995-099c-11ec-ac16-000b00000066",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
                   "type": "organization",
                   "mediaType": "application/json",
                   "uuidHref": "https://app.kladana.in/app/#mycompany/edit?id=94527995-099c-11ec-ac16-000b00000066"
                 }
               },
               "sum": 32
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of created and updated Counterparty Balance Adjustments.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/13bf011a-0b1b-11ec-ac16-000a0000000e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/metadata",
       "type": "counterpartyadjustment",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#counterpartyadjustment/edit?id=13bf011a-0b1b-11ec-ac16-000a0000000e"
     },
     "id": "13bf011a-0b1b-11ec-ac16-000a0000000e",
     "accountId": "9067e733-099c-11ec-ac16-000c00000001",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9334c6a2-099c-11ec-ac16-000b00000042",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#employee/edit?id=9334c6a2-099c-11ec-ac16-000b00000042"
       }
     },
     "shared": false,
     "group": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/906f1cd6-099c-11ec-ac16-000c00000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2021-09-01 14:52:26.430",
     "name": "00004",
     "externalCode": "WWA5w--1ggqvF29G28atu1",
     "moment": "2021-09-01 14:52:00.000",
     "applicable": true,
     "sum": 12.5,
     "agent": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/947ebfcd-099c-11ec-ac16-000b00000083",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
         "type": "counterparty",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#company/edit?id=947ebfcd-099c-11ec-ac16-000b00000083"
       }
     },
     "organization": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/organization/94527995-099c-11ec-ac16-000b0000007e",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#mycompany/edit?id=94527995-099c-11ec-ac16-000b0000007e"
       }
     },
     "created": "2021-09-01 14:52:26.476",
     "printed": false,
     "published": false,
     "files": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/13bf011a-0b1b-11ec-ac16-000a0000000e/files",
         "type": "files",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     }
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/13cc2d25-0b1b-11ec-ac16-000a00000012",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/metadata",
       "type": "counterpartyadjustment",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#counterpartyadjustment/edit?id=13cc2d25-0b1b-11ec-ac16-000a00000012"
     },
     "id": "13cc2d25-0b1b-11ec-ac16-000a00000012",
     "accountId": "9067e733-099c-11ec-ac16-000c00000001",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9334c6a2-099c-11ec-ac16-000b00000042",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#employee/edit?id=9334c6a2-099c-11ec-ac16-000b00000042"
       }
     },
     "shared": false,
     "group": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/906f1cd6-099c-11ec-ac16-000c00000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2021-09-01 14:52:26.560",
     "name": "00005",
     "externalCode": "qDER7dHnjwb-cSk62SHAu2",
     "moment": "2021-09-01 14:52:00.000",
     "applicable": true,
     "sum": 32.0,
     "agent": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/947ebfcd-099c-11ec-ac16-000b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
         "type": "counterparty",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#company/edit?id=947ebfcd-099c-11ec-ac16-000b00000055"
       }
     },
     "organization": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/organization/94527995-099c-11ec-ac16-000b00000066",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#mycompany/edit?id=94527995-099c-11ec-ac16-000b00000066"
       }
     },
     "created": "2021-09-01 14:52:26.576",
     "printed": false,
     "published": false,
     "files": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/13cc2d25-0b1b-11ec-ac16-000a00000012/files",
         "type": "files",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     }
   }
]
```

### Delete counterparty balance adjustment

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id Counterparty balance adjustments. |

> Request to delete Account adjustments of the counterparty with the specified id.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of Counterparty Balance Adjustments.

### Bulk deletion of counterparty balance adjustments

In the body of the request, you need to pass an array containing JSON of the metadata of the Counterparty Balance Adjustments that you want to delete.


> Request for bulk deletion of counterparty balance adjustments.

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d'[
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/7944ef04-f831-11e5-7a69-971500188b1",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/metadata",
             "type": "counterpartyadjustment",
             "mediaType": "application/json"
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/7944ef04-f831-11e5-7a69-971500188b2",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/metadata",
             "type": "counterpartyadjustment",
             "mediaType": "application/json"
         }
       ]'
```

> Successful request. Result - JSON information about the deletion of counterparty balance adjustments.

```json
[
   {
     "info":"Entity 'counterpartyadjustment' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully removed"
   },
   {
     "info":"Entity 'counterpartyadjustment' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully removed"
   }
]
```

### Metadata of Counterparty Balance Adjustments
#### Metadata of Counterparty Balance Adjustments

Request to receive metadata of counterparty balance adjustments. The result is a JSON object including:

| Parameter | Description |
| ------- | -------- |
| **meta** | Link to metadata of counterparty balance adjustments |
| **attributes** | Array of objects additional counterparty balance adjustment fields in the [Metadata](../#kladana-json-api-general-info-metadata) format |
| **createShared** | create new counterparty balance adjustments labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Metadata of Counterparty Balance Adjustments

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/metadata"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional counterparty balance adjustment fields.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/metadata",
     "mediaType": "application/json"
   },
   "attributes": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/metadata/attributes",
       "type": "attributemetadata",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "createShared": false
}
```

### Counterparty balance adjustment

### Get counterparty balance adjustment

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id Counterparty balance adjustments. |

> Request to receive a separate Counterparty Balance Adjustment with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of Counterparty Balance Adjustments.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/7944ef04-f831-11e5-7a69-971500188b19",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/metadata",
     "type": "counterpartyadjustment",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#counterpartyadjustment/edit?id=7944ef04-f831-11e5-7a69-971500188b19"
   },
   "id": "7944ef04-f831-11e5-7a69-971500188b19",
   "accountId": "9067e733-099c-11ec-ac16-000c00000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9334c6a2-099c-11ec-ac16-000b00000042",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=9334c6a2-099c-11ec-ac16-000b00000042"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/906f1cd6-099c-11ec-ac16-000c00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2021-09-01 14:52:26.430",
   "name": "00004",
   "externalCode": "WWA5w--1ggqvF29G28atu1",
   "moment": "2021-09-01 14:52:00.000",
   "applicable": true,
   "sum": 12.5,
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/947ebfcd-099c-11ec-ac16-000b00000083",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#company/edit?id=947ebfcd-099c-11ec-ac16-000b00000083"
     }
   },
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/94527995-099c-11ec-ac16-000b0000007e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#mycompany/edit?id=94527995-099c-11ec-ac16-000b0000007e"
     }
   },
   "created": "2021-09-01 14:52:26.476",
   "printed": false,
   "published": false,
   "files": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/7944ef04-f831-11e5-7a69-971500188b19/files",
       "type": "files",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   }
}
```

### Change counterparty balance adjustment

Request to update the balance adjustment of the counterparty with the specified id.
In the body of the request, you can specify only those fields that need to be changed in the Adjustment of the balance of the counterparty, except for those that
are marked `Read-only` in the description of [Attributes of Counterparty Balance Adjustment](../documents/#transactions-counterparty-balance-adjustment).

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id Counterparty balance adjustments. |

> An example of a request to update a single Counterparty Balance Adjustment.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "sum": 123
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Counterparty Balance Adjustment.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/7944ef04-f831-11e5-7a69-971500188b19",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/metadata",
     "type": "counterpartyadjustment",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#counterpartyadjustment/edit?id=7944ef04-f831-11e5-7a69-971500188b19"
   },
   "id": "7944ef04-f831-11e5-7a69-971500188b19",
   "accountId": "9067e733-099c-11ec-ac16-000c00000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9334c6a2-099c-11ec-ac16-000b00000042",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=9334c6a2-099c-11ec-ac16-000b00000042"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/906f1cd6-099c-11ec-ac16-000c00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2021-09-01 14:52:26.430",
   "name": "00004",
   "externalCode": "WWA5w--1ggqvF29G28atu1",
   "moment": "2021-09-01 14:52:00.000",
   "applicable": true,
   "sum": 123.0,
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/947ebfcd-099c-11ec-ac16-000b00000083",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#company/edit?id=947ebfcd-099c-11ec-ac16-000b00000083"
     }
   },
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/94527995-099c-11ec-ac16-000b0000007e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#mycompany/edit?id=94527995-099c-11ec-ac16-000b0000007e"
     }
   },
   "created": "2021-09-01 14:52:26.476",
   "printed": false,
   "published": false,
   "files": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterpartyadjustment/7944ef04-f831-11e5-7a69-971500188b19/files",
       "type": "files",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   }
}
```
