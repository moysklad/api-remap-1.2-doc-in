## Entity
Using the JSON API, you can create and update information about legal entities, request lists of legal entities and information on individual legal entities. With the help of a special resource, you can manage the accounts of a separate legal entity. The entity code for a legal entity in the JSON API is the **organization** keyword.
This entity can be contextually searched using the special `search` parameter. More details can be found at [link](../#kladana-json-api-general-info-context-search).

Search among objects of legal entities to match the search string will be carried out in the following fields:

+ By the name of the legal entity **name**
+ By legal entity code **code**
+ By the full name of the legal entity **legalTitle**
+ By e-mail address **email**
+ By landline phone number **phone**
+ By discount card number

### Legal entity

| Title                      | Type                                               | Filtration | Description                                                                                                                                                                                                                              |
|----------------------------|----------------------------------------------------| -------- |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **accountId**              | UUID                                               | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only`                                                                                                                                                                                     |
| **actualAddress**          | String(255)                                        | `=` `!=` `~` `~=` `=~` | Actual address of the legal entity                                                                                                                                                                                                       |
| **actualAddressFull**      | Object                                             | | The actual address of the Legal entity with details on individual fields. [More here](../dictionaries/#entities-entity-legal-entity-attributes-of-entity-address)                                                                        |
| **archived**               | Boolean                                            | `=` `!=` | Has the legal entity been added to the archive<br>`+Required when replying`                                                                                                                                                              |
| **bonusPoints**            | Int                                                | | Bonus points for an active bonus program<br>`+Read Only`                                                                                                                                                                                 |
| **bonusProgram**           | [Meta](../#kladana-json-api-general-info-metadata) | | Metadata of the active bonus program<br>`+Expand`                                                                                                                                                                                        |
| **code**                   | String(255)                                        | `=` `!=` `~` `~=` `=~` | Legal entity code                                                                                                                                                                                                                        |
| **companyType**            | Enum                                               | `=` `!=` | Legal entity type. Depending on the value of this field, the set of displayed details of the legal entity may change. [More details here](../dictionaries/#entities-entity-legal-entity-legal-entity-type)<br>`+Required when answering` |
| **created**                | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Creation date<br>`+Required when replying`                                                                                                                                                                                               |
| **description**            | String(4096)                                       | `=` `!=` `~` `~=` `=~` | Comment to Yurlitsa                                                                                                                                                                                                                      |
| **externalCode**           | String(255)                                        | `=` `!=` `~` `~=` `=~` | External code of a legal entity<br>`+Required when replying`                                                                                                                                                                             |
| **group**                  | [Meta](../#kladana-json-api-general-info-metadata) | | Employee's department<br>`+Required when replying` `+Expand`                                                                                                                                                                             |
| **id**                     | UUID                                               | `=` `!=`| Legal entity ID<br>`+Required when replying` `+Read only`                                                                                                                                                                                |
| **meta**                   | [Meta](../#kladana-json-api-general-info-metadata) | | Legal entity metadata<br>`+Required when replying`                                                                                                                                                                                       |
| **name**                   | String(255)                                        | `=` `!=` `~` `~=` `=~` | Legal entity name<br>`+Required when replying` `+Required when creating`                                                                                                                                                                 |
| **owner**                  | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Expand`                                                                                                                                                                                                            |
| **shared**                 | Boolean                                            | `=` `!=` | Sharing<br>`+Required when replying`                                                                                                                                                                                                     |
| **syncId**                 | UUID                                               | `=` `!=` | Synchronization ID<br>`+Cannot be changed after filling`                                                                                                                                                                                 |
| **trackingContractDate**   | DateTime                                           | | Date of agreement with CRPT                                                                                                                                                                                                              |
| **trackingContractNumber** | String(255)                                        | | Contract number with CRPT                                                                                                                                                                                                                |
| **updated**                | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Moment of the last update of the Legal entity<br>`+Required when replying` `+Read-only`                                                                                                                                                  |

#### Detail fields

| Title                 | Type          | Filtration | Description                                                                                                                                    |
|-----------------------|---------------| -------- |------------------------------------------------------------------------------------------------------------------------------------------------|
| **accounts**          | Array(Object) | | Legal entity accounts metadata<br>`+Required when replying` `+Expand`                                                                          |
| **attributes**        | Array(Object) | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Array of metadata of additional fields of a legal entity                                                                                       |
| **ChiefAccountSign**  | Object        | | Signature of the chief accountant. [More here](../dictionaries/#entities-entity-legal-entity-attributes-of-entity-address-signatures-and-seal) |
| **ChiefAccountant**   | String(255)   | | Chief accountant                                                                                                                               |
| **director**          | String(255)   || Head                                                                                                                                           |
| **directorPosition**  | String(255)   | | Head position                                                                                                                                  |
| **directorSign**      | Object        | | Leader's signature. [More here](../dictionaries/#entities-entity-legal-entity-attributes-of-entity-address-signatures-and-seal)                |
| **email**             | String(255)   | `=` `!=` `~` `~=` `=~` | Email address                                                                                                                                  |
| **fax**               | String(255)   | `=` `!=` `~` `~=` `=~` | Fax number                                                                                                                                     |
| **mod\_\_requisites\_\_in** | Object       | | Requisites for legal entity of the type `[Legal entity. India]` with details on individual fields |
| **inn**               | String(255)  | `=` `!=` `~` `~=` `=~` | PAN for legal entity of the type `[Legal entity]`                                                                                              |
| **fsrarId**           | String(255)   | | Identifier in FSRAR                                                                                                                            |
| **isEgaisEnable**     | Boolean       | | Is EGAIS enabled for this legal entity                                                                                                         |
| **legalAddress**      | String(255)   | `=` `!=` `~` `~=` `=~` | Legal address Legal entity                                                                                                                     |
| **legalAddressFull**  | Object        | | Legal address of a legal entity with details on individual fields                                                                              |
| **legalTitle**        | String(4096)  | `=` `!=` `~` `~=` `=~` | Full name                                                                                                                                      |
| **payerVat**          | Boolean       | | Is this legal entity a VAT payer                                                                                                               |
| **phone**             | String(255)   | `=` `!=` `~` `~=` `=~` | City phone number                                                                                                                              |
| **stamp**             | Object        | | Seal. [More here](../dictionaries/#entities-entity-legal-entity-attributes-of-entity-address-signatures-and-seal)                              |
| **utmUrl**            | String(255)   | | UTM IP address                                                                                                                                 |

#### Nested entity attributes
#### Attributes of entity Address

| Title | Type | Description|
| ---------| -----| ----------|
| **addInfo** | String(255) | Other |
| **apartment** | String(30) | Apartment |
| **city** | String(255) | City |
| **comment** | String(255) | Comment |
| **country** | [Meta](../#kladana-json-api-general-info-metadata) | Country metadata |
| **house** | String(30) | House |
| **postalCode** | String(6) | Postcode |
| **region** | [Meta](../#kladana-json-api-general-info-metadata) | Region metadata |
| **street** | String(255) | Street |

The address string is a concatenation of the structured address fields in the following order: postalCode -> country -> region -> city -> street -> house -> apartment -> addInfo, using a comma as a separator.
When transferring entities with an address to Kladana, use either a string address or a structured one.
When passing both addresses, the string will be ignored.
When passing only a string, it will be reflected both in the string field and in the addInfo of the structured address.
[`null` value](../#kladana-json-api-general-info-null-support) is not supported for address. Passing `null` to this attribute will not remove it.
To delete an address, you need to pass an empty string `""` to the string field `actualAddress`.

##### Requisites of Legal entity
| Title   | Type | Description |
|---------| ------- |-------------|
| **pan** | String(255) | PAN         |
Only for legal entity with type `Legal entity. India`.

##### Signatures and seal

| Title | Type                                               | Description|
| ---------|----------------------------------------------------| ----------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **title** | String(255)                                        | Image Title<br>`+Required when replying` |
| **filename** | String(255)                                        | File name<br>`+Required when replying` |
| **size** | Int                                                | File size in bytes<br>`+Required when replying` |
| **updated** | DateTime                                           | File upload time to server<br>`+Required when replying` |
| **miniature** | [Meta](../#kladana-json-api-general-info-metadata) | Image thumbnail metadata<br>`+Required when replying` |

##### Legal entity accounts

| Title | Type                                               | Description|
| ---------|----------------------------------------------------| ----------|
| **accountId** | UUID                                               |Account ID<br>`+Required when replying` `+Read Only` |
| **accountNumber** | String(255)                                        | Account number<br>`+Required when replying` `+Required when creating` |
| **agent** | [Meta](../#kladana-json-api-general-info-metadata) | Legal entity metadata<br>`+Required when replying` |
| **bankLocation** | String(255)                                        | Bank address |
| **bankName** | String(255)                                        | Bank name |
| **bic** | String(255)                                        | BIC |
| **correspondentAccount** | String(255)                                        | Corr account |
| **id** | UUID                                               | Account ID<br>`+Required when replying` `+Read only` |
| **isDefault** | Boolean                                            | Is the account the main account of a legal entity<br>`+Required when answering` |
| **updated** | DateTime                                           | Moment of the last update of the legal entity<br>`+Required when replying` `+Read only` |

#### Legal entity type
Depending on the legal entity type **companyType**, its object will display different sets of details.
Legal entity types and corresponding values that can be passed to the value of this field:

| CompanyType field value | Region               | Legal entity type   |
|-----------------------|----------------------|---------------------|
| **legal**             | International, India | Legal entity        |
| **legalIN**           | India                | Legal entity. India |

<br>

If the legal entity type is `Legal entity`, the following fields of details will be displayed:

| title            | description                     |
|------------------|---------------------------------|
| **legalTitle**   | Full name of the legal entity   |
| **legalAddress** | Legal address of a legal entity |
| **inn**          | PAN                             |

<br>

If the legal entity type is `Legal entity. India`, the following fields of details will be displayed:

| title                           | description                     |
|---------------------------------|---------------------------------|
| **legalTitle**                  | Full name of the legal entity   |
| **legalAddress**                | Legal address of a legal entity |
| **mod\_\_requisites\_\_in.pan** | PAN                             |

<br>

About working with fields of legal entities can be read [here](../#kladana-json-api-general-info-additional-fields)


### Get a list of legal entities
Request to get a list of legal entities on this account.

| Title | Type | Description|
| ---------| -----| ----------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing a legal entity. |

**Parameters**

| Parameter | Description|
| ---------| ---------|
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get a list of legal entities

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/organization"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. Result: JSON object including fields:

```json
{
   "context": {
     "employee": {
       "href": "https://api.kladana.com/api/remap/1.2/context/employee",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/organization/",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
     "type": "organization",
     "mediaType": "application/json",
     "size": 1,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       },
       "id": "850c8195-f504-11e5-8a84-bae50000015e",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "owner": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-04-18 17:26:20",
       "name": "OOO OAO OOO OAO",
       "description": "legal entity making the main profit",
       "code": "1214124",
       "externalCode": "6IRv89VSgKY7yQAmAuV7n0",
       "archived": false,
       "created": "2007-02-07 17:16:41",
       "trackingContractNumber": "12345678",
       "trackingContractDate": "2007-02-07 00:00:00",
       "legalTitle": "OOO Great Union of Great Union Lovers",
       "legalAddress": "125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
       "legalAddressFull": {
         "postalCode": "125009",
         "country": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
             "type": "country",
             "mediaType": "application/json"
           }
         },
         "region": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
             "type": "region",
             "mediaType": "application/json"
           }
         },
         "city": "Moscowwa",
         "street": "Tverskaya street",
         "house": "1",
         "apartment": "123",
         "addInfo": "addinfo",
         "comment": "some words about address"
       },
       "actualAddress": "125009, Russia, Moscow, Moscow, Tverskaya st., 1, 111, addInfo",
       "actualAddressFull": {
         "postalCode": "125009",
         "country": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
             "type": "country",
             "mediaType": "application/json"
           }
         },
         "region": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
             "type": "region",
             "mediaType": "application/json"
           }
         },
         "city": "Moscow",
         "street": "Tverskaya street",
         "house": "1",
         "apartment": "111",
         "addInfo": "addinfo",
         "comment": "some words about address"
       },
       "mod__requisites__in":{
         "pan": "8274424278"
       },
       "email": "asdad@sfasf.erq",
       "phone": "fawofyho21f1",
       "fax": "feisafhn0e12f31",
       "accounts": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "account",
           "mediaType": "application/json",
           "size": 2,
           "limit": 1000,
           "offset": 0
         }
       },
       "isEgaisEnable": true,
       "fsrarId": "1963703",
       "payerVat": true,
       "utmUrl": "10.250.110.81",
       "bonusProgram": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/129626ee-ac91-11e9-ac12-000d00000009",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/metadata",
           "type": "bonusprogram",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#discount/edit?id=129626ee-ac91-11e9-ac12-000d00000009"
         }
       },
       "bonusPoints": 0
     }
   ]
}
```

### Create a legal entity
Request to create a new legal entity.
#### Description
The legal entity is created based on the passed JSON object,
which contains a representation of the new legal entity.

> An example of creating a new legal entity.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/organization"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "JSC SvetProm",
            "description": "legal entity making small profits",
            "code": "666",
            "externalCode": "666AAAA666",
            "archived": false,
            "trackingContractNumber": "12345678",
            "trackingContractDate": "2007-02-07 00:00:00",
            "legalTitle": "Great Light Prom LLC",
            "legalAddressFull": {
                "postalCode": "125009",
                "country": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
                        "type": "country",
                        "mediaType": "application/json"
                    }
                },
                "region": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
                        "type": "region",
                        "mediaType": "application/json"
                    }
                },
                "city": "Moscow",
                "street": "Tverskaya street",
                "house": "1",
                "apartment": "123",
                "addInfo": "addinfo",
                "comment": "some words about address"
            },
            "actualAddressFull": {
                "postalCode": "125009",
                "country": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
                        "type": "country",
                        "mediaType": "application/json"
                    }
                },
                "region": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
                        "type": "region",
                        "mediaType": "application/json"
                    }
                },
                "city": "Moscow",
                "street": "Tverskaya street",
                "house": "1",
                "apartment": "111",
                "addInfo": "addinfo",
                "comment": "some words about address"
            },
            "mod__requisites__in":{
              "pan": "87654321"
            },
            "email": "svetprom@mail.svet",
            "phone": "22222222",
            "fax": "bello123",
            "isEgaisEnable": true,
            "fsrarId": "1963703",
            "payerVat": true,
            "utmUrl": "10.250.110.81",
            "director": "Kipelova Alexandra",
            "directorPosition": "Head of department",
            "directorSign": {
                "filename": "directorSignTest.png",
                "content": "iVBORw0KGgoAAAANSUhEUgAAAAEAAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+P+/HgAFhAJ/wlseKgAAAABJRU5ErkJggg=="
            },
            "chiefAccountant": "Podkupnikov Ivan",
            "chiefAccountSign": {
                "filename": "chiefAccountSignTest.png",
                "content": "iVBORw0KGgoAAAANSUhEUgAAAAEAAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z/C/HgAGgwJ/lK3Q6wAAAABJRU5ErkJggg=="
            },
            "stamp": {
                "filename": "stampTest.png",
                "content": "iVBORw0KGgoAAAANSUhEUgAAAAEAAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg=="
            }
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created legal entity.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/organization/4b9d5bec-0575-11e6-9464-e4de00000008",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
     "type": "organization",
     "mediaType": "application/json"
   },
   "id": "4b9d5bec-0575-11e6-9464-e4de00000008",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-04-18 17:53:21",
   "name": "JSC SvetProm",
   "description": "legal entity making small profits",
   "code": "666",
   "externalCode": "666AAAA666",
   "archived": false,
   "trackingContractNumber": "12345678",
   "trackingContractDate": "2007-02-07 00:00:00",
   "legalTitle": "Great Light Prom LLC",
   "legalAddress": "125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
   "legalAddressFull": {
     "postalCode": "125009",
     "country": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json"
       }
     },
     "region": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       }
     },
     "city": "Moscow",
     "street": "Tverskaya street",
     "house": "1",
     "apartment": "123",
     "addInfo": "addinfo",
     "comment": "some words about address"
   },
   "actualAddress": "125009, Russia, Moscow, Moscow, Tverskaya st., 1, 111, addInfo",
   "actualAddressFull": {
     "postalCode": "125009",
     "country": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json"
       }
     },
     "region": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       }
     },
     "city": "Moscow",
     "street": "Tverskaya street",
     "house": "1",
     "apartment": "111",
     "addInfo": "addinfo",
     "comment": "some words about address"
   },
   "mod__requisites__in":{
     "pan": "87654321"
   },
   "email": "svetprom@mail.svet",
   "phone": "22222222",
   "fax": "bello123",
   "accounts": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/4b9d5bec-0575-11e6-9464-e4de00000008/accounts",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "account",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   },
   "isEgaisEnable": true,
   "fsrarId": "1963703",
   "payerVat": true,
   "utmUrl": "10.250.110.81",
   "director":"Kipelova Alexandra",
    "directorPosition":"Head of department",
    "directorSign": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/download/7da0feb5-e110-4021-a49f-35db4ae75f13",
          "mediaType": "application/octet-stream"
        },
        "title": "directorSignTest",
        "filename": "directorSignTest.png",
        "size": 70,
        "updated": "2020-09-23 07:37:26.417",
        "miniature": {
          "href": "https://api.kladana.com/api/remap/1.2/download/7da0feb5-e110-4021-a49f-35db4ae75f13?miniature=true",
          "mediaType": "image/png",
          "downloadHref": "https://miniature-prod.kladana.com/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
        }
    },
    "chiefAccountant":"Podkupnikov Ivan",
    "chiefAccountSign": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/download/cdd282d7-7e65-40b7-83a1-c0ef07365769",
          "mediaType": "application/octet-stream"
        },
        "title": "chiefAccountSignTest",
        "filename": "chiefAccountSignTest.png",
        "size": 70,
        "updated": "2020-09-23 07:37:26.434",
        "miniature": {
          "href": "https://api.kladana.com/api/remap/1.2/download/cdd282d7-7e65-40b7-83a1-c0ef07365769?miniature=true",
          "mediaType": "image/png",
          "downloadHref": "https://miniature-prod.kladana.com/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
        }
    },
    "stamp": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/download/9cccb42b-652e-4e9d-b192-4eabe1823383",
          "mediaType": "application/octet-stream"
        },
        "title": "stampTest",
        "filename": "stampTest.png",
        "size": 70,
        "updated": "2020-09-23 07:37:26.443",
        "miniature": {
          "href": "https://api.kladana.com/api/remap/1.2/download/9cccb42b-652e-4e9d-b192-4eabe1823383?miniature=true",
          "mediaType": "image/png",
          "downloadHref": "https://miniature-prod.kladana.com/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
        }
    }
}
```

> An example of creating a new legal entity with additional fields in the request body.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/organization"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "JSC SvetProm",
            "description": "New legal entity",
            "code": "666",
            "archived": false,
            "trackingContractNumber": "12345678",
            "trackingContractDate": "2007-02-07 00:00:00",
            "legalTitle": "Great Light Prom LLC",
            "mod__requisites__in":{
              "pan": "87654321"
            },
            "email": "svetprom@mail.svet",
            "phone": "22222222",
            "fax": "bello123",
            "attributes": [
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "value": "String value"
                }
            ]
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created legal entity.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/organization/bf182d24-12d7-11e6-9464-e4de00000012",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
     "type": "organization",
     "mediaType": "application/json"
   },
   "id": "bf182d24-12d7-11e6-9464-e4de00000012",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-05-05 18:40:51",
   "name": "JSC SvetProm",
   "description": "New legal entity",
   "code": "666",
   "externalCode": "sfwafn22-124124sa",
   "archived": false,
   "created": "2007-02-07 17:16:41",
   "trackingContractNumber": "12345678",
   "trackingContractDate": "2007-02-07 00:00:00",
   "legalTitle": "Great Light Prom LLC",
   "legalAddress": "125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
   "legalAddressFull": {
     "postalCode": "125009",
     "country": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json"
       }
     },
     "region": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       }
     },
     "city": "Moscow",
     "street": "Tverskaya street",
     "house": "1",
     "apartment": "123",
     "addInfo": "addinfo",
     "comment": "some words about address"
   },
   "actualAddress": "125009, Russia, Moscow, Moscow, Tverskaya st., 1, 111, addInfo",
   "actualAddressFull": {
     "postalCode": "125009",
     "country": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json"
       }
     },
     "region": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       }
     },
     "city": "Moscow",
     "street": "Tverskaya street",
     "house": "1",
     "apartment": "111",
     "addInfo": "addinfo",
     "comment": "some words about address"
   },
   "mod__requisites__in":{
     "pan": "87654321"
   },
   "email": "svetpromgazkamaz@mail.svet",
   "phone": "22222222",
   "fax": "belwo123",
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "7f4a6b38-12bb-11e6-9464-e4de00000076",
       "name": "AttributeName1",
       "type": "string",
       "value": "String value"
     }
   ],
   "accounts": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/bf182d24-12d7-11e6-9464-e4de00000012/accounts",
       "type": "account",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   }
}
```

### Legal entities bulk creation and update
[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) legal entities.
In the body of the request, you need to pass an array containing the JSON representation of the legal entities that you want to create or update.
Updated legal entities must contain the identifier in the form of metadata.

> An example of creating and updating several legal entities

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/organization"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
            {
                "name": "JSC SvetProm",
                "description": "legal entity making small profits",
                "code": "666",
                "externalCode": "666AAAA666",
                "companyType": "legal",
                "archived": false,
                "trackingContractNumber": "12345678",
                "trackingContractDate": "2007-02-07 00:00:00",
                "legalTitle": "Great Light Prom LLC",
                "legalAddress": "Moscow, Lenin street, 42/685",
                "actualAddress": "Perm Stalin street 75",
                "inn": "87654321",
                "email": "svetprom@mail.svet",
                "phone": "22222222",
                "fax": "bello123",
                "isEgaisEnable": true,
                "fsrarId": "1963703",
                "payerVat": true,
                "utmUrl": "10.250.110.81",
                "director": "Kipelova Alexandra",
                "chiefAccountant": "Podkupnikov Ivan"
            },
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/bf182d24-12d7-11e6-9464-e4de00000012",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                    "type": "organization",
                    "mediaType": "application/json"
                },
                "name": "JSC SvetProm",
                "description": "legal entity making small profits",
                "code": "666",
                "externalCode": "666AAAA666",
                "companyType": "legalIN",
                "archived": false,
                "trackingContractNumber": "12345678",
                "trackingContractDate": "2007-02-07 00:00:00",
                "legalTitle": "Great Light Prom LLC",
                "legalAddress": "Moscow, Lenin street, 42/685",
                "actualAddress": "Ufa, Mayakovskogo str. 65",
                "mod__requisites__in":{
                  "pan": "87654321"
                },
                "email": "svetprom@mail.svet",
                "phone": "22222222",
                "fax": "bello123",
                "payerVat": false,
                "director": "Vzdryzhzhenov Ivan Valerievich",
                "chiefAccountant": "Kulumbekova Vasilisa Iismailovna"
            }
        ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of created and updated legal entities.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/4b9d5bec-0575-11e6-9464-e4de00000008",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     },
     "id": "4b9d5bec-0575-11e6-9464-e4de00000008",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "owner": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": false,
     "group": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-04-18 17:53:21",
     "name": "JSC SvetProm",
     "description": "legal entity making small profits",
     "code": "666",
     "externalCode": "666AAAA666",
     "companyType": "legal",
     "archived": false,
     "trackingContractNumber": "12345678",
     "trackingContractDate": "2007-02-07 00:00:00",
     "legalTitle": "Great Light Prom LLC",
     "legalAddress": "Moscow, Lenin street, 42/685",
     "actualAddress": "Perm Stalin street 75",
     "inn": "87654321",
     "email": "svetprom@mail.svet",
     "phone": "22222222",
     "fax": "bello123",
     "accounts": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/4b9d5bec-0575-11e6-9464-e4de00000008/accounts",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
         "type": "account",
         "mediaType": "application/json",
         "size": 1,
         "limit": 1000,
         "offset": 0
       }
     },
     "isEgaisEnable": true,
     "fsrarId": "1963703",
     "payerVat": true,
     "utmUrl": "10.250.110.81"
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/bf182d24-12d7-11e6-9464-e4de00000012",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     },
     "id": "bf182d24-12d7-11e6-9464-e4de00000012",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "owner": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": false,
     "group": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-05-05 18:40:51",
     "name": "JSC SvetGAZKAMAZProm",
     "description": "New legal entity",
     "code": "666",
     "externalCode": "sfwafn22-124124sa",
     "companyType": "legalIN",
     "archived": false,
     "created": "2007-02-07 17:16:41",
     "trackingContractNumber": "12345678",
     "trackingContractDate": "2007-02-07 00:00:00",
     "legalTitle": "LLC Great Community KAMAZ PROM",
     "legalAddress": "Moscow, Lenin street, 42/685",
     "actualAddress": "Ufa, Mayakovskogo str. 65",
     "mod__requisites__in":{
       "pan": "87654321"
     },
     "email": "svetpromgazkamaz@mail.svet",
     "phone": "22222222",
     "fax": "belwo123",
     "accounts": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/bf182d24-12d7-11e6-9464-e4de00000012/accounts",
         "type": "account",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     },
     "payerVat": false,
     "director": "Vzdryzhzhenov Ivan Valerievich",
     "chiefAccountant": "Kulumbekova Vasilisa Iismailovna"
   }
]
```

### Delete legal entity

**Parameters**

| Parameter | Description|
| ---------| ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* legal entity ID. |

> Request to delete a legal entity with the specified ID.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/organization/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of the legal entity.

### Bulk removal of Organizations

In the body of the request, you need to pass an array containing the JSON metadata of the Organizations that you want to remove.


> Request for bulk deletion of Organizations.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/organization/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d' [
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/7944ef04-f831-11e5-7a69-971500188b1",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                    "type": "organization",
                    "mediaType": "application/json"
                }
            },
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/7944ef04-f831-11e5-7a69-971500188b2",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                    "type": "organization",
                    "mediaType": "application/json"
                }
            }
        ]'
```

> Successful request. The result is JSON information about deleting Organizations.

```json
[
   {
     "info":"Entity 'organization' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'organization' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Legal entities metadata
Request for obtaining metadata of legal entities. The result is a JSON object including:

| Title| Type| Description |
| ---------| -----| ----------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Link to metadata of legal entities |
| **attributes** | Array(Object) | Array of objects additional legal entity fields in the [Metadata](../#kladana-json-api-general-info-metadata) format |
| **createShared** | Boolean | Create new legal entities labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Metadata of legal entities

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/organization/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional fields of legal entities.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "id": "5290a290-0313-11e6-9464-e4de00000020",
       "name": "AttributeName1",
       "type": "boolean",
       "required": false
     }
   ],
   "createShared": true
}
```

### Separate additional field

**Parameters**

| Parameter | Description|
| ---------| ---------|
| **id** | `string` (required) *Example: 5290a290-0313-11e6-9464-e4de00000020* ID fields. |

> Request for information on a separate additional field.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/organization/metadata/attributes/5290a290-0313-11e6-9464-e4de00000020"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata/attributes/5290a290-0313-11e6-9464-e4de00000020",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "5290a290-0313-11e6-9464-e4de00000020",
   "name": "AttributeName1",
   "type": "boolean",
   "required": false
}
```

### Entity

### Get a legal entity
Request for obtaining a legal entity with the specified ID.

**Parameters**

| Parameter | Description|
| ---------| ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* legal entity ID. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Example 1

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/organization/4b9d5bec-0575-11e6-9464-e4de00000008"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the legal entity with the specified ID.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/organization/4b9d5bec-0575-11e6-9464-e4de00000008",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
     "type": "organization",
     "mediaType": "application/json"
   },
   "id": "4b9d5bec-0575-11e6-9464-e4de00000008",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-04-18 17:57:27",
   "name": "JSC SvetProm",
   "description": "legal entity making small profits",
   "code": "666",
   "externalCode": "666AAAA666",
   "companyType": "legal",
   "archived": false,
   "created": "2007-02-07 17:16:41",
   "trackingContractNumber": "12345678",
   "trackingContractDate": "2007-02-07 00:00:00",
   "legalTitle": "Great Light Prom LLC",
   "legalAddress": "125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
   "legalAddressFull": {
     "postalCode": "125009",
     "country": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json"
       }
     },
     "region": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       }
     },
     "city": "Moscow",
     "street": "Tverskaya street",
     "house": "1",
     "apartment": "123",
     "addInfo": "addinfo",
     "comment": "some words about address"
   },
   "actualAddress": "125009, Russia, Moscow, Moscow, Tverskaya st., 1, 111, addInfo",
   "actualAddressFull": {
     "postalCode": "125009",
     "country": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json"
       }
     },
     "region": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       }
     },
     "city": "Moscow",
     "street": "Tverskaya street",
     "house": "1",
     "apartment": "111",
     "addInfo": "addinfo",
     "comment": "some words about address"
   },
   "inn": "87654321",
   "email": "svetprom@mail.svet",
   "phone": "22222222",
   "fax": "bello123",
   "accounts": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/4b9d5bec-0575-11e6-9464-e4de00000008/accounts",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "account",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   },
   "isEgaisEnable": true,
   "fsrarId": "1963703",
   "payerVat": true,
   "utmUrl": "10.250.110.81",
   "director": "Administrator",
   "chiefAccountant": "Administrator",
   "bonusProgram": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/129626ee-ac91-11e9-ac12-000d00000009",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/metadata",
       "type": "bonusprogram",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#discount/edit?id=129626ee-ac91-11e9-ac12-000d00000009"
     }
   },
   "bonusPoints": 0
}
```

> Example 2

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/organization/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the legal entity with the specified ID.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/organization/7944ef04-f831-11e5-7a69-971500188b19",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
     "type": "organization",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=7944ef04-f831-11e5-7a69-971500188b19"
   },
   "id": "7944ef04-f831-11e5-7a69-971500188b19",
   "accountId": "02865f48-b0ae-11ea-0a80-203a00000002",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/02e06bea-b0ae-11ea-0a80-1d9c00000034",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#employee/edit?id=02e06bea-b0ae-11ea-0a80-1d9c00000034"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/02877fda-b0ae-11ea-0a80-203a00000003",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "version": 0,
   "updated": "2020-06-18 12:38:18",
   "name": "IP Ivanov",
   "code": "someCode",
   "externalCode": "extCode",
   "archived": false,
   "created": "2020-06-18 12:38:18",
   "companyType": "legalIN",
   "legalTitle": "Individual entrepreneur Ivanov Ivan Ivanovich",
   "legalAddress": "Moscow, Aviastroiteley street 93/12",
   "legalAddressFull": {
     "addInfo": "Moscow, Aviastroiteley street 93/12"
   },
   "actualAddress": "Moscow, Academician Mil street, 15/21",
   "actualAddressFull": {
     "addInfo": "Moscow, Academician Mil street 15/21"
   },
   "mod__requisites__in":{
     "pan": "87654321"
   },
   "accounts": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/7944ef04-f831-11e5-7a69-971500188b19/accounts",
       "type": "account",
       "mediaType": "application/json",
       "size": 0,
       "limit": 100,
       "offset": 0
     }
   },
   "isEgaisEnable": false,
   "payerVat": true,
   "trackingContractDate": null
}
```

### Change legal entity
Request to update the legal entity with the specified ID.

**Parameters**

| Parameter | Description|
| ---------| ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* legal entity ID. |

> An example of a request to update a legal entity with the specified ID.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/organization/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
           "name": "JSC SvetProm",
           "description": "legal entity making small profits",
           "code": "666",
           "externalCode": "666AAAA666",
           "companyType": "legal",
           "archived": false,
           "trackingContractNumber": "12345678",
           "trackingContractDate": "2007-02-07 00:00:00",
           "legalTitle": "Great Light Prom LLC",
           "legalAddress": "Moscow, Lenin street, 42/685",
           "actualAddress": "g PermSt. Stanislav d 75",
           "inn": "87654321",
           "email": "svetprom@mail.svet",
           "phone": "22222222",
           "fax": "bello123",
           "isEgaisEnable": true,
           "fsrarId": "1963703",
           "payerVat": true,
           "utmUrl": "10.250.110.81",
           "director": "Kipelova Alexandra",
           "chiefAccountant": "Podkupnikov Ivan"
        }'
```

> Response 200(application/json)
Successful request. The result is JSON of the updated legal entity.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/organization/4b9d5bec-0575-11e6-9464-e4de00000008",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
     "type": "organization",
     "mediaType": "application/json"
   },
   "id": "4b9d5bec-0575-11e6-9464-e4de00000008",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-04-18 17:53:21",
   "name": "JSC SvetProm",
   "description": "legal entity making small profits",
   "code": "666",
   "externalCode": "666AAAA666",
   "companyType": "legal",
   "archived": false,
   "trackingContractNumber": "12345678",
   "trackingContractDate": "2007-02-07 00:00:00",
   "legalTitle": "Great Light Prom LLC",
   "legalAddress": "Moscow, Lenin street, 42/685",
   "actualAddress": "Perm Stalin street 75",
   "inn": "87654321",
   "email": "svetprom@mail.svet",
   "phone": "22222222",
   "fax": "bello123",
   "accounts": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/4b9d5bec-0575-11e6-9464-e4de00000008/accounts",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "account",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   },
   "isEgaisEnable": true,
   "fsrarId": "1963703",
   "payerVat": true,
   "utmUrl": "10.250.110.81"
}
```

> An example of a request to update a legal entity with the specified ID.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/organization/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "JSC SvetProm",
            "description": "legal entity making small profits",
            "code": "666",
            "externalCode": "666AAAA666",
            "companyType": "legalIN",
            "archived": false,
            "trackingContractNumber": "12345678",
            "trackingContractDate": "2007-02-07 00:00:00",
            "legalTitle": "Great Light Prom LLC",
            "legalAddressFull": {
                "postalCode": "125009",
                "country": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
                        "type": "country",
                        "mediaType": "application/json"
                    }
                },
                "region": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
                        "type": "region",
                        "mediaType": "application/json"
                    }
                },
                "city": "Moscow",
                "street": "Tverskaya street",
                "house": "1",
                "apartment": "123",
                "addInfo": "addinfo",
                "comment": "some words about address"
            },
            "actualAddressFull": {
                "postalCode": "125009",
                "country": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
                        "type": "country",
                        "mediaType": "application/json"
                    }
                },
                "region": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
                        "type": "region",
                        "mediaType": "application/json"
                    }
                },
                "city": "Moscow",
                "street": "Tverskaya street",
                "house": "1",
                "apartment": "111",
                "addInfo": "addinfo",
                "comment": "some words about address"
            },
            "mod__requisites__in":{
              "pan": "87654321"
            },
            "email": "svetprom@mail.svet",
            "phone": "22222222",
            "fax": "bello123",
            "attributes": [
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "value": "Such String"
                }
            ],
            "payerVat": false,
            "director": "Vzdryzhzhenov Ivan Valerievich",
            "chiefAccountant": "Kulumbekova Vasilisa Iismailovna"
        }'
```

> Response 200(application/json)
Successful request. The result is JSON of the updated legal entity.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/organization/bf182d24-12d7-11e6-9464-e4de00000012",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
     "type": "organization",
     "mediaType": "application/json"
   },
   "id": "bf182d24-12d7-11e6-9464-e4de00000012",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-05-05 18:40:51",
   "name": "JSC SvetGAZKAMAZProm",
   "description": "New legal entity",
   "code": "666",
   "externalCode": "sfwafn22-124124sa",
   "companyType": "legalIN",
   "archived": false,
   "trackingContractNumber": "12345678",
   "trackingContractDate": "2007-02-07 00:00:00",
   "created": "2007-02-07 17:16:41",
   "legalTitle": "LLC Great Community KAMAZ PROM",
   "legalAddress": "125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
   "legalAddressFull": {
     "postalCode": "125009",
     "country": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json"
       }
     },
     "region": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       }
     },
     "city": "Moscow",
     "street": "Tverskaya street",
     "house": "1",
     "apartment": "123",
     "addInfo": "addinfo",
     "comment": "some words about address"
   },
   "actualAddress": "125009, Russia, Moscow, Moscow, Tverskaya st., 1, 111, addInfo",
   "actualAddressFull": {
     "postalCode": "125009",
     "country": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json"
       }
     },
     "region": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       }
     },
     "city": "Moscow",
     "street": "Tverskaya street",
     "house": "1",
     "apartment": "111",
     "addInfo": "addinfo",
     "comment": "some words about address"
   },
   "mod__requisites__in":{
     "pan": "87654321"
   },
   "email": "svetpromgazkamaz@mail.svet",
   "phone": "22222222",
   "fax": "belwo123",
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "7f4a6b38-12bb-11e6-9464-e4de00000076",
       "name": "AttributeName1",
       "type": "string",
       "value": "String value"
     }
   ],
   "accounts": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/bf182d24-12d7-11e6-9464-e4de00000012/accounts",
       "type": "account",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "payerVat": false,
   "director": "Vzdryzhzhenov Ivan Valerievich",
   "chiefAccountant": "Kulumbekova Vasilisa Iismailovna"
}
```

### Legal entity accounts

### Get a list of accounts of a legal entity
Returns a JSON array of legal entity account representations.

**Parameters**

| Parameter | Description|
| ---------| ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* legal entity ID. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get a list of accounts of a legal entity

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/organization/7944ef04-f831-11e5-7a69-971500188b19/accounts"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```
 
> Response 200(application/json)
Successful request.

```json
{
   "context": {
     "employee": {
       "href": "https://api.kladana.com/api/remap/1.2/context/employee",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/organization/4b9d5bec-0575-11e6-9464-e4de00000008/accounts",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
     "type": "account",
     "mediaType": "application/json",
     "size": 1,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/4b9d5bec-0575-11e6-9464-e4de00000008/accounts/4b9d69b7-0575-11e6-9464-e4de00000009",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
         "type": "account",
         "mediaType": "application/json"
       },
       "id": "4b9d69b7-0575-11e6-9464-e4de00000009",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "updated": "2016-04-18 17:53:21",
       "isDefault": true,
       "agent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/4b9d5bec-0575-11e6-9464-e4de00000008",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       }
     }
   ]
}
```

### Change legal entity accounts
#### Description
The accounts of the legal entity with the specified ID are updated.
All fields specified in the request JSON object are updated, except for
marked `Read only` in the description of [legal entity account attributes](../dictionaries/#entities-entity-legal-entity-attributes-of-entity-address-legal-entity-accounts).
Fields that were not specified in the request JSON are not changed.

**Parameters**

| Parameter | Description|
| ---------| ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* legal entity ID. |

> Change legal entity accounts

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/organization/7944ef04-f831-11e5-7a69-971500188b19/accounts"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/d955aa70-6703-11e7-9464-e4de00000051/accounts/d9560d0e-6703-11e7-9464-e4de00000052",
                    "type": "account",
                    "mediaType": "application/json"
                },
                "id": "d9560d0e-6703-11e7-9464-e4de00000052",
                "isDefault": false,
                "accountNumber": "1234567876543",
                "bankName": "JSC Sberbank",
                "bankLocation": "Moscow",
                "correspondentAccount": "123141242451",
                "bic": "21412hhhh4"
            },
            {
                "isDefault": false,
                "accountNumber": "1234567876543",
                "bankName": "JSC BANK",
                "bankLocation": "Moscow",
                "correspondentAccount": "123141242451",
                "bic": "21412555554"
            }
        ]'
```

> Response 200(application/json)
Successful request.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/d955aa70-6703-11e7-9464-e4de00000051/accounts/d9560d0e-6703-11e7-9464-e4de00000052",
       "type": "account",
       "mediaType": "application/json"
     },
     "id": "d9560d0e-6703-11e7-9464-e4de00000052",
     "accountId": "d8a2e973-6703-11e7-9464-e4de00000001",
     "updated": "2017-07-12 16:13:08",
     "isDefault": true,
     "accountNumber": "1234567876543",
     "bankName": "JSC Sberbank",
     "bankLocation": "Moscow",
     "correspondentAccount": "123141242451",
     "bic": "21412hhhh4"
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/d955aa70-6703-11e7-9464-e4de00000051/accounts/97fc6499-b96f-11e7-9464-e4de00000006",
       "type": "account",
       "mediaType": "application/json"
     },
     "id": "97fc6499-b96f-11e7-9464-e4de00000006",
     "accountId": "d8a2e973-6703-11e7-9464-e4de00000001",
     "updated": "2017-10-25 13:31:00",
     "isDefault": false,
     "accountNumber": "1234567876543",
     "bankName": "JSC BANK",
     "bankLocation": "Moscow",
     "correspondentAccount": "123141242451",
     "bic": "21412555554"
   }
]
```
