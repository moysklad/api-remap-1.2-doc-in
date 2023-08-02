## Country
### Countries
Using the JSON API, you can create and update information about Countries, request lists of Countries and information on individual Countries. The entity code for Country in the JSON API is the **country** keyword.
This entity can be contextually searched using the special `search` parameter. More details can be found at [link](../#mojsklad-json-api-obschie-swedeniq-kontextnyj-poisk). The search with the search parameter differs from others in that the search is not prefixed, without tokenization, and only goes through one field at a time. Searches for strings that include the value of the search string.

The search among country objects for matching the search string will be carried out using the following fields:

+ by country name **name**
+ by country description **description**

#### Entity attributes
| Title | Type | Filtration | Description |
| -------| ------ | -------- |----- |
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Read Only` |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Country Code |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Description Countries |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | External Country Code<br>`+Required when replying` |
| **group** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | `=` `!=` | Department-owner<br>`+Expand` `+For custom countries` |
| **id** | UUID | `=` `!=` | Country ID<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | | Country Metadata<br>`+Required when answering` |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Country Name<br>`+Required when replying` `+Required when creating` |
| **owner** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | `=` `!=` | Employee-owner<br>`+Expand` `+For custom countries` |
| **shared** | Boolean | `=` `!=` | Flag Share<br>`+For custom countries` |
| **updated** | datetime | `=` `!=` `<` `>` `<=` `>=` | When the entity was last updated<br>`+Required for response` `+Read-only` |

### Get Countries
Request to get a list of all Countries for this account.
Result: JSON object including fields:

| Title | Type | Description |
| -------| ------ | -------- |
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Issuance metadata, |
| **context** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing [Countries](../dictionaries/#suschnosti-strana). |

**Parameters**

| Parameter | Description |
| -------| ------ |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get countries

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/country"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Countries.

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
     "href": "https://app.kladana.in/api/remap/1.2/entity/country/?limit=5",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
     "type": "country",
     "mediaType": "application/json",
     "size": 248,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/country/000d77a9-3000-4f81-a995-6b9cffdee1d2",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#country/edit?id=000d77a9-3000-4f81-a995-6b9cffdee1d2"
       },
       "id": "000d77a9-3000-4f81-a995-6b9cffdee1d2",
       "updated": "2012-11-02 11:04:13",
       "name": "Morocco",
       "description": "Kingdom of Morocco",
       "code": "504",
       "externalCode": "504"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/country/00999522-23d6-40e6-870e-ec7f7bd8d354",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#country/edit?id=00999522-23d6-40e6-870e-ec7f7bd8d354"
       },
       "id": "00999522-23d6-40e6-870e-ec7f7bd8d354",
       "updated": "2012-11-02 11:04:15",
       "name": "Japan",
       "code": "392",
       "externalCode": "392"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/country/0238a888-c602-4e78-a199-d8f49c4d6c18",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#country/edit?id=0238a888-c602-4e78-a199-d8f49c4d6c18"
       },
       "id": "0238a888-c602-4e78-a199-d8f49c4d6c18",
       "updated": "2012-11-02 11:04:15",
       "name": "Croatia",
       "description": "Republic of Croatia",
       "code": "191",
       "externalCode": "191"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/country/02dc7934-0a88-49ea-a733-2da517a000c2",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#country/edit?id=02dc7934-0a88-49ea-a733-2da517a000c2"
       },
       "id": "02dc7934-0a88-49ea-a733-2da517a000c2",
       "updated": "2012-11-02 11:04:15",
       "name": "Philippines",
       "description": "Republic of the Philippines",
       "code": "608",
       "externalCode": "608"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/country/04cc9c56-96b1-4ccf-aa7f-78735710381c",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#country/edit?id=04cc9c56-96b1-4ccf-aa7f-78735710381c"
       },
       "id": "04cc9c56-96b1-4ccf-aa7f-78735710381c",
       "updated": "2012-11-02 11:04:15",
       "name": "Ecuador",
       "description": "Republic of Ecuador",
       "code": "218",
       "externalCode": "218"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/country/04cc9c56-96b1-4ccf-aa7f-78735710381c",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#country/edit?id=04cc9c56-96b1-4ccf-aa7f-78735710381c"
       },
       "accountId": "95004e42-79f2-11e8-1a0d-4e0d00000001",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9bc5de98-79f2-11e8-1a0d-4e0d0000002b",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#employee/edit?id=9bc5de98-79f2-11e8-1a0d-4e0d0000002b"
         }
       },
       "shared": true,
       "group": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/9504054f-79f2-11e8-1a0d-4e0d00000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "id": "04cc9c56-96b1-4ccf-aa7f-78735710381c",
       "updated": "2012-11-02 11:04:15",
       "name": "My country",
       "description": "My custom country",
       "code": "999",
       "externalCode": "999"
     }
   ]
}
```

### Create Country
Request to create a new country on this account.
The only field that must be present inrequest body
to create a Country - field **name**.

> An example of a request to create a new country.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/country"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "Panama 2",
             "description": "We created Panama",
             "code": "PanamaCode",
             "externalCode": "panamaExtCode"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Country.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/country/04331e4f-24c8-11e6-8a84-bae500000016",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
     "type": "country",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#country/edit?id=04331e4f-24c8-11e6-8a84-bae500000016"
   },
   "id": "04331e4f-24c8-11e6-8a84-bae500000016",
   "accountId": "45489428-24a5-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9bc5de98-79f2-11e8-1a0d-4e0d0000002b",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=9bc5de98-79f2-11e8-1a0d-4e0d0000002b"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/9504054f-79f2-11e8-1a0d-4e0d00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-05-30 09:02:21",
   "name": "Panama 2",
   "description": "We created Panama",
   "code": "PanamaCode",
   "externalCode": "panamaExtCode"
}
```

### Bulk creation and update of Countries
[Bulk creation and update](../#mojsklad-json-api-obschie-swedeniq-sozdanie-i-obnowlenie-neskol-kih-ob-ektow)
In the body of the request, you need to pass an array containing the JSON representation of the Countries that you want to create or update.
Updated Countries must contain the identifier in the form of metadata.

> Example of creating and updating multiple countries

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/country"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "Panama 2",
               "description": "We created Panama",
               "code": "PanamaCode",
               "externalCode": "panamaExtCode"
             },
             {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/country/810b5344-24ca-11e6-8a84-bae500000018",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
                 "type": "country",
                 "mediaType": "application/json"
               },
               "name": "Other Russia",
               "description": "Anyone can change Russia, but only if he created it himself",
               "code": "no1russia",
               "externalCode": "gogorussia"
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Countries.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/country/04331e4f-24c8-11e6-8a84-bae500000016",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
       "type": "country",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#country/edit?id=04331e4f-24c8-11e6-8a84-bae500000016"
     },
     "id": "04331e4f-24c8-11e6-8a84-bae500000016",
     "accountId": "45489428-24a5-11e6-8a84-bae500000001",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9bc5de98-79f2-11e8-1a0d-4e0d0000002b",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#employee/edit?id=9bc5de98-79f2-11e8-1a0d-4e0d0000002b"
       }
     },
     "shared": true,
     "group": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/9504054f-79f2-11e8-1a0d-4e0d00000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-05-30 09:02:21",
     "name": "Panama 2",
     "description": "We created Panama",
     "code": "PanamaCode",
     "externalCode": "panamaExtCode"
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/country/810b5344-24ca-11e6-8a84-bae500000018",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
       "type": "country",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#country/edit?id=810b5344-24ca-11e6-8a84-bae500000018"
     },
     "id": "810b5344-24ca-11e6-8a84-bae500000018",
     "accountId": "45489428-24a5-11e6-8a84-bae500000001",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9bc5de98-79f2-11e8-1a0d-4e0d0000002b",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#employee/edit?id=9bc5de98-79f2-11e8-1a0d-4e0d0000002b"
       }
     },
     "shared": true,
     "group": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/9504054f-79f2-11e8-1a0d-4e0d00000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-05-30 09:20:10",
     "name": "Other Russia",
     "description": "Anyone can change Russia, but only if he created it himself",
     "code": "no1russia",
     "externalCode": "gogorussia"
   }
]
```

### Delete Country
Request to delete a country. Unable to delete preset countries (countries available on the account by default).
You can only delete countries created through the main interface or through the POST method.

**Parameters**

| Parameter | Description |
| -------| ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Country id. |

> Delete Country

```shell
   curl -X DELETE
     "https://app.kladana.in/api/remap/1.2/entity/country/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of Retail.

### Bulk removal of countries

In the body of the request, you need to pass an array containing the JSON metadata of the Countries that you want to remove.


> Request for bulk deletion of countries.

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/country/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d'[
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/country/7944ef04-f831-11e5-7a69-971500188b1",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
             "type": "country",
             "mediaType": "application/json"
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/country/7944ef04-f831-11e5-7a69-971500188b2",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
             "type": "country",
             "mediaType": "application/json"
         }
       ]'
```

> Successful request. The result is JSON information about deleting countries.

```json
[
   {
     "info":"Entity 'country' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'country' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 was deleted successfully"
   }
]
```

### Country

**Parameters**

| Parameter | Description |
|------ | -------- |
| **id** | `7944ef04-f831-11e5-7a69-971500188b19` (required, string) - Country id |

### Get Country

**Parameters**

| Parameter | Description |
| ------ | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Country id. |
 
> Request to get the country with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/country/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Country with the specified id.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/country/000d77a9-3000-4f81-a995-6b9cffdee1d2",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
     "type": "country",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#country/edit?id=000d77a9-3000-4f81-a995-6b9cffdee1d2"
   },
   "id": "000d77a9-3000-4f81-a995-6b9cffdee1d2",
   "updated": "2012-11-02 11:04:13",
   "name": "Morocco",
   "description": "Kingdom of Morocco",
   "code": "504",
   "externalCode": "504"
}
```

### Change Country
A request to change an object that represents a country. It is impossible to change the preset countries (countries available on the account by default).
Only countries created through the main interface or through the POST method can be changed.

**Parameters**

| Parameter | Description |
| ------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Country id. |

> Sample country update request.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/country/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "Other Russia",
             "description": "Anyone can change Russia, but only if he created it himself",
             "code": "no1russia",
             "externalCode": "gogorussia"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Country.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/country/810b5344-24ca-11e6-8a84-bae500000018",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
     "type": "country",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#country/edit?id=810b5344-24ca-11e6-8a84-bae500000018"
   },
   "id": "810b5344-24ca-11e6-8a84-bae500000018",
   "accountId": "45489428-24a5-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9bc5de98-79f2-11e8-1a0d-4e0d0000002b",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=9bc5de98-79f2-11e8-1a0d-4e0d0000002b"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/9504054f-79f2-11e8-1a0d-4e0d00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-05-30 09:20:10",
   "name": "Other Russia",
   "description": "Anyone can change Russia, but only if he created it himself",
   "code": "no1russia",
   "externalCode": "gogorussia"
}
```
