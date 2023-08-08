## Region

### Regions
Using the JSON API, you can request a list of Russian regions and information on individual regions.
The entity code for Regions in the JSON API is the **region** keyword.

#### Entity attributes
| Title | Type | Filtration | Description |
| ------- |  ------- | ---- | -------- |
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Region Code |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | External Region Code<br>`+Required when replying` |
| **id** | UUID | `=` `!=` | Region ID<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Region metadata<br>`+Required when replying` |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Region Name<br>`+Required when replying` `+Required when creating` |
| **updated** | datetime | `=` `!=` `<` `>` `<=` `>=` | When the entity was last updated<br>`+Required for response` `+Read-only` |
| **version** | int | | Entity version<br>`+Required for response` `+Read-only` |


#### Attributes available for sorting
| Title | Description |
| ------- | ----------- |
| **code** | Region Code |
| **externalCode** | External Region Code |
| **id** | ID in UUID format |
| **name** | Name of the Region |
| **updated** | The moment when the entity was last updated |
| **version** | Entity version |


### Get Regions
Get a list of all Regions.
Result: JSON object including fields:

| Title | Type | Description |
| ------- | ----------- |---------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing [Regions](../dictionaries/#entities-region). |

**Parameters**

| Parameter | Description |
| ------- | ----------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Regions

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/region"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. Result - JSON representation of the list of Regions

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
     "href": "https://app.kladana.in/api/remap/1.2/entity/region/",
     "type": "region",
     "mediaType": "application/json",
     size: 86
     limit: 25
     offset: 0
     "nextHref": "https://app.kladana.in/api/remap/1.2/entity/region/?limit=25&offset=25"
   },
   rows: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000001",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000001",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Rep. Adygea",
       "code": "01",
       "externalCode": "01"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000002",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Rep. Bashkortostan",
       "code": "02",
       "externalCode": "02"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000003",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000003",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Rep. Buryatia",
       "code": "03",
       "externalCode": "03"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000004",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000004",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Resp Altai",
       "code": "04",
       "externalCode": "04"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000005",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000005",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Rep. Dagestan",
       "code": "05",
       "externalCode": "05"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000006",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000006",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Rep. Ingushetia",
       "code": "06",
       "externalCode": "06"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000007",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000007",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Kabardino-Balkarian Republic",
       "code": "07",
       "externalCode": "07"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000008",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000008",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Rep. Kalmykia",
       "code": "08",
       "externalCode": "08"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000009",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000009",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Karachay-Cherkess Republic",
       "code": "09",
       "externalCode": "09"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000010",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000010",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Rep. Karelia",
       "code": "10",
       "externalCode": "10"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000011",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000011",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Resp Komi",
       "code": "11",
       "externalCode": "11"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000012",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000012",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Resp Mari El",
       "code": "12",
       "externalCode": "12"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000013",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000013",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Rep. Mordovia",
       "code": "13",
       "externalCode": "13"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000014",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000014",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Rep. Sakha /Yakutia/",
       "code": "14",
       "externalCode": "14"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000015",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000015",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Rep. North Ossetia - Alania",
       "code": "15",
       "externalCode": "15"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000016",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000016",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Rep. Tatarstan",
       "code": "16",
       "externalCode": "16"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000017",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000017",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Rep Tyva",
       "code": "17",
       "externalCode": "17"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000018",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000018",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Udmurt Republic",
       "code": "18",
       "externalCode": "18"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000019",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000019",
       version: 0
       "updated": "2018-11-29 00:00:00","name": "Rep Khakassia",
       "code": "19",
       "externalCode": "19"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000020",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000020",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Chechen Republic",
       "code": "20",
       "externalCode": "20"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000021",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000021",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Chuvash Republic - Chuvashia",
       "code": "21",
       "externalCode": "21"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000022",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000022",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Altai Territory",
       "code": "22",
       "externalCode": "22"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000023",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000023",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Krasnodar Territory",
       "code": "23",
       "externalCode": "23"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000024",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000024",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Krasnoyarsk Territory",
       "code": "24",
       "externalCode": "24"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000025",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       },
       "id": "00000000-0000-0000-0000-000000000025",
       version: 0
       "updated": "2018-11-29 00:00:00",
       "name": "Primorsky Territory",
       "code": "25",
       "externalCode": "25"
     }
   ]
}
```

### Region

### Get Region

**Parameters**

| Parameter | Description |
| ------- | ----------- |
| **id** | `string` (required) *Example: 00000000-0000-0000-0000-000000000077* Region id. |

> Request to get a separate Region with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Region with the specified id.

```json
  
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
     "type": "region",
     "mediaType": "application/json"
   },
   "id": "00000000-0000-0000-0000-000000000077",
   version: 0
   "updated": "2018-11-29 00:00:00",
   "name": "Moscow",
   "code": "77",
   "externalCode": "77"
}
```
