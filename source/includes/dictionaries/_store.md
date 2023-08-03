## Warehouse

### Warehouses
This entity can be contextually searched using the special `search` parameter. [Learn more](../#mojsklad-json-api-obschie-swedeniq-kontextnyj-poisk).

The search among warehouse objects for matching the search string will be carried out using the following fields:

+ By Warehouse name **name**
+ By Warehouse code **code**

#### Entity attributes

| Title | Type | Filtration | Description |
|----- | ------ | ----- | ------- |
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **address** | String(255) | `=` `!=` `~` `~=` `=~` | Warehouse address |
| **addressFull** | object | | Address with details on individual fields. [More here](../dictionaries/#suschnosti-sklad-sklady-attributy-suschnosti-adres) |
| **archived** | Boolean | `=` `!=` | Has the Warehouse been archived<br>`+Required when replying` |
| **attributes** | Array(Object) | [Statements of additional fields](../#mojsklad-json-api-obschie-swedeniq-fil-traciq-wyborki-s-pomosch-u-parametra-filter-fil-traciq-po-dopolnitel-nym-polqm) | Array of metadata of additional warehouse fields |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Warehouse Code |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Comment to Warehouse |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | External code of the Warehouse<br>`+Required when replying` |
| **group** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID | `=` `!=` | Warehouse ID<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | | Warehouse Metadata<br>`+Required when replying` |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Warehouse Name<br>`+Required when replying` `+Required when creating` |
| **owner** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | `=` `!=` | Owner (Companyudnik)<br>`+Expand` |
| **parent** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | `=` `!=` | Parent warehouse metadata (Groups)<br>`+Expand` |
| **pathName** | string | `=` `!=` `~` `~=` `=~` | Warehouse Group<br>`+Required when replying` |
| **shared** | Boolean | `=` `!=` | Sharing<br>`+Required when replying` |
| **updated** | datetime | `=` `!=` `<` `>` `<=` `>=` | Time when the Warehouse was last updated<br>`+Required when replying` `+Read only` |
| **zones** | MetaArray | | warehouse zones. [Learn more](../dictionaries/#suschnosti-sklad-zony-sklada)<br>`+Read-only` `+Expand` |
| **slots** | MetaArray | | Warehouse cells. [Learn more](../dictionaries/#suschnosti-sklad-yachejki-sklada)<br>`+Read-only` `+Expand` |

#### Attributes of entity Address

| Title | Type | Description |
| ---------| ----|----- |
| **addInfo** | String(255) | Other |
| **apartment** | String(30) | Apartment |
| **city** | String(255) | City |
| **comment** | String(255) | Comment |
| **country** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Country metadata |
| **house** | String(30) | House |
| **postalCode** | String(6) | Postcode |
| **region** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Region metadata |
| **street** | String(255) | Street |

The address string is a concatenation of the structured address fields in the following order: postalCode -> country -> region -> city -> street -> house -> apartment -> addInfo, using a comma as a separator.
When transferring entities with an address to MySklad, use either a string address or a structured one.
When passing both addresses, the string will be ignored.
When passing only a string, it will be reflected both in the string field and in the addInfo of the structured address.
[`null` value](../#mojsklad-json-api-obschie-swedeniq-podderzhka-null) is not supported for address. Passing `null` to this attribute will not remove it.
To delete an address, pass the empty string `""` to the `address` string field.

Learn more about [additional fields of warehouses](../#mojsklad-json-api-obschie-swedeniq-rabota-s-dopolnitel-nymi-polqmi)


### Get Warehouses
Get a list of all Warehouses.
Result: JSON object including fields:

| Title | Type | Description |
| ----------- | ---------|---------|
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Issuance metadata. |
| **context** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Warehouses. |

**Parameters**

| Parameter | Description |
| ------ | ----------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Warehouses

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/store"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Warehouses.

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
     "href": "https://app.kladana.in/api/remap/1.2/entity/store/",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
     "type": "store",
     "mediaType": "application/json",
     "size": 5,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/caf46ce5-0569-11e6-9464-e4de00000000",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       },
       "id": "caf46ce5-0569-11e6-9464-e4de00000000",
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
       "updated": "2016-04-18 16:31:01",
       "name": "002",
       "externalCode": "y7ztWINfjXinPToFMqQid2",
       "archived": false,
       "address": "125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
       "addressFull": {
         "postalCode": "125009",
         "country": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
             "type": "country",
             "mediaType": "application/json"
           }
         },
         "region": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
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
       "pathName": "",
       "zones": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/store/caf46ce5-0569-11e6-9464-e4de00000000/zones",
           "type": "storezone",
           "mediaType": "application/json",
           "size": 0,
           "limit": 1000,
           "offset": 0
         }
       },
       "slots": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/store/caf46ce5-0569-11e6-9464-e4de00000000/slots",
           "type": "slot",
           "mediaType": "application/json",
           "size": 0,
           "limit": 1000,
           "offset": 0
         }
       }
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       },
       "id": "850ee995-f504-11e5-8a84-bae500000160",
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
       "updated": "2016-03-28 19:45:46",
       "name": "Main warehouse",
       "externalCode": "OJ8pY2FgjQ3ncLVvvpqyw1",
       "archived": false,
       "pathName": "",
       "address": "125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
       "addressFull": {
         "postalCode": "125009",
         "country": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
             "type": "country",
             "mediaType": "application/json"
           }
         },
         "region": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
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
       "zones": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160/zones",
           "type": "storezone",
           "mediaType": "application/json",
           "size": 0,
           "limit": 1000,
           "offset": 0
         }
       },
       "slots": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160/slots",
           "type": "slot",
           "mediaType": "application/json",
           "size": 0,
           "limit": 1000,
           "offset": 0
         }
       },
       "attributes": [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "3a85cfe3-12c5-11e6-9464-e4de00000087",
           "name": "Square",
           "type": "long",
           "value": 4400
         }
       ]
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/6ebb9094-056a-11e6-9464-e4de000000b4",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       },
       "id": "6ebb9094-056a-11e6-9464-e4de000000b4",
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
       "updated": "2016-04-18 16:35:36",
       "name": "Subfolder",
       "code": "ZAATY643",
       "externalCode": "d8Ew2hCDiTuJFb0Ya45tH0",
       "archived": false,
       "address": "125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
       "addressFull": {
         "postalCode": "125009",
         "country": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
             "type": "country",
             "mediaType": "application/json"
           }
         },
         "region": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
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
       "pathName": "002",
       "zones": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/store/6ebb9094-056a-11e6-9464-e4de000000b4/zones",
           "type": "storezone",
           "mediaType": "application/json",
           "size": 0,
           "limit": 1000,
           "offset": 0
         }
       },
       "slots": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/store/6ebb9094-056a-11e6-9464-e4de000000b4/slots",
           "type": "slot",
           "mediaType": "application/json",
           "size": 0,
           "limit": 1000,
           "offset": 0
         }
       }
     },{
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/95dcda62-056b-11e6-9464-e4de000000b7",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       },
       "id": "95dcda62-056b-11e6-9464-e4de000000b7",
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
       "updated": "2016-04-18 16:43:51",
       "name": "Warehouse1",
       "description": "Main warehouse",
       "code": "113AB79",
       "externalCode": "fQPIOtxjg-FaeZNKcLx6B3",
       "archived": false,
       "address": "125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
       "addressFull": {
         "postalCode": "125009",
         "country": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
             "type": "country",
             "mediaType": "application/json"
           }
         },
         "region": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
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
       "pathName": "Main warehouse",
       "zones": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/store/95dcda62-056b-11e6-9464-e4de000000b7/zones",
           "type": "storezone",
           "mediaType": "application/json",
           "size": 0,
           "limit": 1000,
           "offset": 0
         }
       },
       "slots": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/store/95dcda62-056b-11e6-9464-e4de000000b7/slots",
           "type": "slot",
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

### Create Warehouse

Create a new Warehouse.

#### Description
The warehouse is created based on the passed JSON object,
which contains a representation of the new Warehouse.
The field required for creation - `name` must not be empty.

> An example of a request to create a new Warehouse.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/store"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
            "addressFull": {
                "addInfo": "addinfo2",
                "apartment": "412",
                "city": "Moscow2",
                "comment": "some words about address2",
                "country": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/country/40e6f69a-991c-4fbc-8be9-d0d906cad180",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
                        "type": "country",
                        "mediaType": "application/json"
                    }
                },
                "house": "32",
                "postalCode": "11192342",
                "region": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/region/4bd3542a-f401-11e8-8eb2-f2801f1b9fd1",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
                        "type": "region",
                        "mediaType": "application/json"
                    }
                },
                "street": "Lenin goru2"
            },
            "pathName": "Main warehouse",
            "name": "Warehouse2",
            "code": "code3",
            "externalCode": "sfksjafwuiw1sf32141"
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Warehouse.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
     "type": "store",
     "mediaType": "application/json"
   },
   "id": "0c8de58c-056c-11e6-9464-e4de00000003",
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
   "updated": "2016-04-18 16:47:10",
   "name": "Warehouse2",
   "code": "code3",
   "externalCode": "sfksjafwuiw1sf32141",
   "archived": false,
   "pathName": "",
   "address": "11192342, Russia2, Chuvashia2, Moscow2, Leninskie goru2, 32, 412, addinfo2",
   "addressFull": {
     "addInfo": "addinfo2",
     "apartment": "412",
     "city": "Moscow2",
     "comment": "some words about address2",
     "country": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/country/40e6f69a-991c-4fbc-8be9-d0d906cad180",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json"
       }
     },
     "house": "32",
     "postalCode": "11192342",
     "region": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/4bd3542a-f401-11e8-8eb2-f2801f1b9fd1",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       }
     },
     "street": "Lenin goru2"
   },
   "zones": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003/zones",
       "type": "storezone",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "slots": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003/slots",
       "type": "slot",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   }
}
```

> An example of a request to create a new Warehouse with additional fields in the request body.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/store"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
            "addressFull": {
                "addInfo": "addinfo2",
                "apartment": "412",
                "city": "Moscow2",
                "comment": "some words about address2",
                "country": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/country/40e6f69a-991c-4fbc-8be9-d0d906cad180",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
                        "type": "country",
                        "mediaType": "application/json"
                    }
                },
                "house": "32",
                "postalCode": "11192342",
                "region": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/region/4bd3542a-f401-11e8-8eb2-f2801f1b9fd1",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
                        "type": "region",
                        "mediaType": "application/json"
                    }
                },
                "street": "Lenin goru2"
            },
            "pathName": "Main warehouse",
            "name": "Warehouse3",
            "code": "code4",
            "externalCode": "223ddxzv223",
            "attributes": [
                {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/store/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "value": 4000
                }
            ]
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Warehouse.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
     "type": "store",
     "mediaType": "application/json"
   },
   "id": "7a6a11b6-12c5-11e6-9464-e4de00000006",
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
   "updated": "2016-05-05 16:30:05",
   "name": "Warehouse3",
   "code": "code4",
   "externalCode": "223ddxzv223",
   "archived": false,
   "pathName": "",
   "address": "11192342, Russia2, Chuvashia2, Moscow2, Leninskie goru2, 32, 412, addinfo2",
   "addressFull": {
     "addInfo": "addinfo2",
     "apartment": "412",
     "city": "Moscow2",
     "comment": "some words about address2",
     "country": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/country/40e6f69a-991c-4fbc-8be9-d0d906cad180",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json"
       }
     },
     "house": "32",
     "postalCode": "11192342",
     "region": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/4bd3542a-f401-11e8-8eb2-f2801f1b9fd1",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       }
     },
     "street": "Lenin goru2"
   },
   "zones": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones",
       "type": "storezone",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "slots": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots",
       "type": "slot",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "3a85cfe3-12c5-11e6-9464-e4de00000087",
       "name": "Square",
       "type": "long",
       "value": 4000
     }
   ]
}
```

### Warehouses bulk creation and update

[Warehouses bulk creation and update](../#mojsklad-json-api-obschie-swedeniq-sozdanie-i-upnowlenie-neskol-kih-ob-ektow).
In the body of the request, you need to pass an array containing JSON representations of the Warehouses that you want to create or update.
Updated Warehouses must contain the identifier in the form of metadata.

> An example of creating and updating several Warehouses

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/store"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
            {
                "address": "Moscow, Vavilov street 19/116",
                "pathName": "Main warehouse",
                "name": "Warehouse2",
                "code": "code3",
                "externalCode": "sfksjafwuiw1sf32141"
            },
            {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003",
                    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
                    "type": "store",
                    "mediaType": "application/json"
                },
                "address": "Moscow, BaBilova street 20/116",
                "pathName": "Not Main Warehouse",
                "name": "Warehouse3",
                "code": "code31",
                "externalCode": "EXTCODE",
                "parent": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
                        "type": "store",
                        "mediaType": "application/json"
                    }
                }
            }
        ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Warehouses.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     },
     "id": "0c8de58c-056c-11e6-9464-e4de00000003",
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
     "updated": "2016-04-18 16:47:10",
     "name": "Warehouse2",
     "code": "code3",
     "externalCode": "sfksjafwuiw1sf32141",
     "archived": false,
     "pathName": "",
     "address": "Moscow, Vavilov street 19/116",
     "zones": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003/zones",
         "type": "storezone",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     },
     "slots": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003/slots",
         "type": "slot",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     }
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     },
     "id": "0c8de58c-056c-11e6-9464-e4de00000003",
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
     "updated": "2016-04-18 16:56:31",
     "name": "Warehouse3",
     "code": "code31",
     "externalCode": "EXTCODE",
     "archived": false,
     "pathName": "",
     "address": "Moscow, BaBilova street 20/116",
     "zones": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003/zones",
         "type": "storezone",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     },
     "slots": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003/slots",
         "type": "slot",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     }
   }
]

```

### Delete Warehouse

**Parameters**

| Parameter | Description|
| ------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Warehouse ID. |

> Request to delete the Warehouse with the specified ID.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of the Warehouse.

### Bulk deletion of Warehouses

In the body of the request, you need to pass an array containing the JSON metadata of the Warehouses that you want to delete.


> Request for bulk deletion of Warehouses.

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/store/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d'[
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b1",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b2",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
         }
       ]'
```

> Successful request. The result is JSON information about deleting Warehouses.

```json
[
   {
     "info":"Entity 'store' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 deleted successfully"
   },
   {
     "info":"Entity 'store' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 was deleted successfully"
   }
]
```

### Warehouse metadata
#### Warehouse Metadata
Request to get Warehouse metadata. The result is a JSON object including:

| Title | Type | Description |
| --------|-------| ---------|
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Link to Warehouse metadata |
| **attributes** | Array(Object) | Array of objects of additional Warehouse fields in the [Metadata](../#mojsklad-json-api-obschie-swedeniq-metadannye) format |
| **createShared** | Boolean | create new Warehouses labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#mojsklad-json-api-obschie-swedeniq-rabota-s-dopolnitel-nymi-polqmi).

> Warehouse Metadata

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/store/metadata"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional Warehouse fields.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
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
   "createShared": false
}
```

### Separate additional field


 
  **Parameters**
 
| Parameter | Description |
| ------- |--------- |
| **id** | `string` (required) *Example: 5290a290-0313-11e6-9464-e4de00000020* Fields ID. |
 
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/store/metadata/attributes/5290a290-0313-11e6-9464-e4de00000020"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/store/metadata/attributes/5290a290-0313-11e6-9464-e4de00000020",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "5290a290-0313-11e6-9464-e4de00000020",
   "name": "attribute_name",
   "type": "boolean",
   "required": false
}

```

### Stock

### Get Warehouse

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Warehouse ID. |

> Request to receive a separate Warehouse with the specified ID.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Warehouse with the specified ID.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/store/95dcda62-056b-11e6-9464-e4de000000b7",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
     "type": "store",
     "mediaType": "application/json"
   },
   "id": "95dcda62-056b-11e6-9464-e4de000000b7",
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
   "updated": "2016-04-18 16:43:51",
   "name": "Warehouse1",
   "description": "Main warehouse",
   "code": "113AB79",
   "externalCode": "fQPIOtxjg-FaeZNKcLx6B3",
   "archived": false,
   "parent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "pathName": "Main warehouse",
   "address": "125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
   "addressFull": {
     "postalCode": "125009",
     "country": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json"
       }
     },
     "region": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
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
   "zones": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/95dcda62-056b-11e6-9464-e4de000000b7/zones",
       "type": "storezone",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "slots": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/95dcda62-056b-11e6-9464-e4de000000b7/slots",
       "type": "slot",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "3a85cfe3-12c5-11e6-9464-e4de00000087",
       "name": "Square",
       "type": "long",
       "value": 4400
     }
   ]
}
```

### Change Warehouse
#### Description
The view of the Warehouse with the specified ID is updated.
In the body of the request, you can specify only those fields that should not be changed at the Warehouse,
except for fields marked `Read Only` in the description of [Warehouse attributes](../dictionaries/#suschnosti-sklad).

**Parameters**

| Parameter | Description |
| ------- |--------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Warehouse ID. |


> An example of a request to update an existing Warehouse.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
            "addressFull": {
                "addInfo": "addinfo2",
                "apartment": "412",
                "city": "Moscow2",
                "comment": "some words about address2",
                "country": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/country/40e6f69a-991c-4fbc-8be9-d0d906cad180",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
                        "type": "country",
                        "mediaType": "application/json"
                    }
                },
                "house": "32",
                "postalCode": "11192342",
                "region": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/region/4bd3542a-f401-11e8-8eb2-f2801f1b9fd1",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
                        "type": "region",
                        "mediaType": "application/json"
                    }
                },
                "street": "Lenin goru2"
            },
            "pathName": "Not Main Warehouse",
            "name": "Warehouse3",
            "code": "code31",
            "externalCode": "EXTCODE",
            "parent": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
                    "type": "store",
                    "mediaType": "application/json"
                }
            }
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Warehouse.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
     "type": "store",
     "mediaType": "application/json"
   },
   "id": "0c8de58c-056c-11e6-9464-e4de00000003",
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
   "updated": "2016-04-18 16:56:31",
   "name": "Warehouse3",
   "code": "code31",
   "externalCode": "EXTCODE",
   "archived": false,
   "pathName": "",
   "address": "11192342, Russia2, Chuvashia2, Moscow2, Leninskie goru2, 32, 412, addinfo2",
   "addressFull": {
       "addInfo": "addinfo2",
       "apartment": "412",
       "city": "Moscow2",
       "comment": "some words about address2",
       "country": {
           "meta": {
               "href": "https://app.kladana.in/api/remap/1.2/entity/country/40e6f69a-991c-4fbc-8be9-d0d906cad180",
               "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
               "type": "country",
               "mediaType": "application/json"
           }
       },
       "house": "32",
       "postalCode": "11192342",
       "region": {
           "meta": {
               "href": "https://app.kladana.in/api/remap/1.2/entity/region/4bd3542a-f401-11e8-8eb2-f2801f1b9fd1",
               "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
               "type": "region",
               "mediaType": "application/json"
           }
       },
     "street": "Lenin goru2",
     "zones": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003/zones",
         "type": "storezone",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     },
     "slots": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003/slots",
         "type": "slot",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     }
   }
}
```

> An example of a request to update an existing Warehouse with additional fields in the request body.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
            "addressFull": {
                "addInfo": "addinfo2",
                "apartment": "412",
                "city": "Moscow2",
                "comment": "some words about address2",
                "country": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/country/40e6f69a-991c-4fbc-8be9-d0d906cad180",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
                        "type": "country",
                        "mediaType": "application/json"
                    }
                },
                "house": "32",
                "postalCode": "11192342",
                "region": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/region/4bd3542a-f401-11e8-8eb2-f2801f1b9fd1",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
                        "type": "region",
                        "mediaType": "application/json"
                    }
                },
                "street": "Lenin goru2"
            },
            "pathName": "Main warehouse",
            "name": "Warehouse 3",
            "code": "code4",
            "externalCode": "223ddxzv223",
            "attributes": [
                {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/store/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "value": 4400
                }
            ]
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Warehouse.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
     "type": "store",
     "mediaType": "application/json"
   },
   "id": "7a6a11b6-12c5-11e6-9464-e4de00000006",
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
   "updated": "2016-05-05 16:32:02",
   "name": "Warehouse 3",
   "code": "code4",
   "externalCode": "223ddxzv223",
   "archived": false,
   "pathName": "",
   "address": "11192342, Russia2, Chuvashia2, Moscow2, Leninskie goru2, 32, 412, addinfo2",
   "addressFull": {
     "addInfo": "addinfo2",
     "apartment": "412",
     "city": "Moscow2",
     "comment": "some words about address2",
     "country": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/country/40e6f69a-991c-4fbc-8be9-d0d906cad180",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json"
       }
     },
     "house": "32",
     "postalCode": "11192342",
     "region": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/region/4bd3542a-f401-11e8-8eb2-f2801f1b9fd1",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       }
     },
     "street": "Lenin goru2"
   },
   "zones": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones",
       "type": "storezone",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "slots": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots",
       "type": "slot",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "3a85cfe3-12c5-11e6-9464-e4de00000087",
       "name": "Square",
       "type": "long",
       "value": 4400
     }
   ]
}
```

### Warehouse areas
Warehouse zones are accessed if you have the right to see the corresponding warehouse.

#### Entity attributes

| Title | Type | Filtration | Description |
|----- |-------- | -------- | ----------- |
| **accountId** | UUID | | Account ID<br>`+Required when replying` `+Read Only` |
| **externalCode** | String(255) || External Zone Code<br>`+Required when replying` |
| **id** | UUID | | Zone ID<br>`+Required for response` `+Read Only` |
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | | Zone Metadata<br>`+Required when replying` |
| **name** | String(255) | | Zone Name<br>`+Required for response` `+Required for creation` |
| **updated** | datetime | | Time when the Zone was last updated<br>`+Required when replying` `+Read Only` |

### Get warehouse zones
Get a list of all Zones.
Result: JSON object including fields:

| Title | Type | Description |
| ----------- | --------------- |-------|
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Issuance metadata. |
| **context** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the Zones. |

**Parameters**

| Parameter | Description |
|---------- | ------------ |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Zones

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of Warehouse Zones.

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
     "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones",
     "type": "storezone",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/7a6a11b6-12c5-11e6-9464-e4de00000007",
         "type": "storezone",
         "mediaType": "application/json"
       },
       "id": "7a6a11b6-12c5-11e6-9464-e4de00000007",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "updated": "2016-05-05 16:32:02",
       "name": "zone1",
       "externalCode": "223ddxzv223"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/7a6a11b6-12c5-11e6-9464-e4de00000008",
         "type": "storezone",
         "mediaType": "application/json"
       },
       "id": "7a6a11b6-12c5-11e6-9464-e4de00000008",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "updated": "2016-05-05 16:32:02",
       "name": "zone2",
       "externalCode": "223ddxzv224"
     }
   ]
}
```

### Create a warehouse zone
#### Description

The warehouse zone is created based on the passed JSON object,
which contains a representation of the new Warehouse Area.
The result is a JSON representation of the created Warehouse Zone. To create a new Warehouse Zone,
it is necessary and sufficient to specify a non-empty `name` field in the passed object. Within the same warehouse, the names of the Zones must be unique.

> Request to create a Warehouse Zone

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d '{
         "name": "zone 1"
       }'
```

> Response 200(application/json)
Successful request. Result - JSON representation of the created Warehouse Zone.

```json
[
     {
         "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/9177a566-75f8-11ed-ac1a-000d00000000",
             "type": "storezone",
             "mediaType": "application/json"
         },
         "id": "9177a566-75f8-11ed-ac1a-000d00000000",
         "accountId": "5f69193a-75f8-11ed-ac1a-000f00000001",
         "updated": "2022-12-07 09:29:56.547",
         "name": "zone 1",
         "externalCode": "wYIaWipYjrZkJZZlw1Amy1"
     }
]
```

### Bulk creation and update of warehouse zones

[Bulk creation and update](../#mojsklad-json-api-obschie-swedeniq-sozdanie-i-obnowlenie-neskol-kih-ob-ektow) Warehouse zones.
In the body of the request, you need to pass an array containing JSON representations of the Warehouse Zones that you want to create or update.
Updated Warehouse Zones must contain the identifier in the form of metadata.

> Request to create and update multiple Warehouse Zones

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones
"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "Zone 2"
             },
             {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/9177a566-75f8-11ed-ac1a-000d00000000",
                 "type": "storezone",
                 "mediaType": "application/json"
               },
               "name": "Zone new"
             }
           ]'
   ```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Warehouse Zones.

```json
[
     {
         "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/9177a566-75f8-11ed-ac1a-000d00000000",
             "type": "storezone",
             "mediaType": "application/json"
         },
         "id": "9177a566-75f8-11ed-ac1a-000d00000000",
         "accountId": "5f69193a-75f8-11ed-ac1a-000f00000001",
         "updated": "2022-12-07 09:29:56.547",
         "name": "Zone new",
         "externalCode": "wYIaWipYjrZkJZZlw1Amy1"
     },
     {
         "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/7d479c5f-75f9-11ed-ac1a-000d00000003",
             "type": "storezone",
             "mediaType": "application/json"
         },
         "id": "7d479c5f-75f9-11ed-ac1a-000d00000003",
         "accountId": "5f69193a-75f8-11ed-ac1a-000f00000001",
         "updated": "2022-12-07 09:36:32.702",
         "name": "Zone 2",
         "externalCode": "geYPAnDwhwrTMeo09TjW21"
     }
]
```

### Delete warehouse zone

When deleting the zone to which the cells are attached, the cells are unlinked from this zone.

**Parameters**

| Parameter | Description |
| ------- |----------|
| **store_id** | `string` (required) *Example: 7a6a11b6-12c5-11e6-9464-e4de00000006* Warehouse ID. |
| **zone_id** | `string` (required) *Example: 7d479c5f-75f9-11ed-ac1a-000d00000003* Warehouse zone ID. |

> Request to delete Warehouse Zone with specified ID.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/7d479c5f-75f9-11ed-ac1a-000d00000003"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of the Warehouse Zone.

### Bulk deletion of warehouse zones

In the body of the request, you need to pass an array containing the JSON metadata of the Warehouse Zones that you want to delete.


> Request for bulk deletion of Warehouse Zones.

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity//store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d'[
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/9177a566-75f8-11ed-ac1a-000d00000000",
             "type": "storezone",
             "mediaType": "application/json"
           }
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/7d479c5f-75f9-11ed-ac1a-000d00000003",
             "type": "storezone",
             "mediaType": "application/json"
           }
         }
       ]'
```

> Successful request. The result is JSON information about deleting Warehouse Zones.

```json
[
   {
     "info":"Entity 'storezone' with UUID: 9177a566-75f8-11ed-ac1a-000d00000000 successfully deleted"
   },
   {
     "info":"Entity 'storezone' with UUID: 7d479c5f-75f9-11ed-ac1a-000d00000003 successfully deleted"
   }
]
```

### Get warehouse area

**Parameters**

| Parameter | Description |
| ------- |----------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b18* Zone ID. |

> Request for a separate Warehouse Zone with the specified ID.

```shell
curl -XGET
   "https://app.kladana.in/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b19/zones/7944ef04-f831-11e5-7a69-971500188b18"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Warehouse Zone with the specified ID.

```json
{
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b19/zones/7944ef04-f831-11e5-7a69-971500188b18",
         "type": "storezone",
         "mediaType": "application/json"
       },
       "id": "7944ef04-f831-11e5-7a69-971500188b18",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "updated": "2016-05-05 16:32:02",
       "name": "zone1",
       "externalCode": "223ddxzv223"
}
```

### Change storage area

In the body of the request, you need to pass a JSON representation of the Warehouse Zone that you want to update.

**Parameters**

| Parameter | Description |
| ------- | ------------- |
| **store_id** | `string` (required) *Example: 7a6a11b6-12c5-11e6-9464-e4de00000006* Warehouse ID. |
| **zone_id** | `string` (required) *Example: 7d479c5f-75f9-11ed-ac1a-000d00000003* Warehouse zone ID. |

> Request to update Warehouse area

```shell
curl -X PUT
   "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/7d479c5f-75f9-11ed-ac1a-000d00000003"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d '{
         "name": "zone 3"
       }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Warehouse Area.

```json
[
     {
         "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/7d479c5f-75f9-11ed-ac1a-000d00000003",
             "type": "storezone",
             "mediaType": "application/json"
         },
         "id": "7d479c5f-75f9-11ed-ac1a-000d00000003",
         "accountId": "5f69193a-75f8-11ed-ac1a-000f00000001",
         "updated": "2022-12-07 09:29:56.547",
         "name": "zone 3",
         "externalCode": "wYIaWipYjrZkJZZlw1Amy1"
     }
]
```

### Storage bins
Access to the cells of the warehouse is carried out if you have the right to see the corresponding warehouse.

#### Entity attributes

| Title | Type | Filtration | Description |
| --------- | -------- | ----- | -------- |
| **accountId** | UUID | | Account ID<br>`+Required when replying` `+Read Only` |
| **externalCode** | String(255) | | Cell External Code<br>`+Required when replying` |
| **id** | UUID | | Cell ID<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | | Cell Metadata<br>`+Required when replying` |
| **name** | String(255) | | Cell Name<br>`+Required when replying` `+Required when creating` |
| **updated** | datetime | | When Cell was last updated<br>`+Required when replying` `+Read Only` |
| **zone** | meta | | Cell zone. [More here](../dictionaries/#suschnosti-sklad-zony-sklada)<br>`+Read-only` `+Expand` |

### Get storage bins
Get a list of all Warehouse Bins.
Result: JSON object including fields:

| Title | Type | Description |
| ----------- | ------|-----------|
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadata) | Issuance metadata. |
| **context** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Warehouse Bins. |

**Parameters**

| Parameter | Description |
| ---------| --------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Storage Bins

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of Warehouse Bins.

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
     "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots",
     "type": "slot",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/7a6a11b6-12c5-11e6-9464-e4de00000007",
         "type": "slot",
         "mediaType": "application/json"
       },
       "id": "7a6a11b6-12c5-11e6-9464-e4de00000007",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "updated": "2016-05-05 16:32:02",
       "name": "slot1",
       "externalCode": "223ddxzv223"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/7a6a11b6-12c5-11e6-9464-e4de00000008",
         "type": "slot",
         "mediaType": "application/json"
       },
       "id": "7a6a11b6-12c5-11e6-9464-e4de00000008",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "updated": "2016-05-05 16:32:02",
       "name": "slot2",
       "externalCode": "223ddxzv224",
       "zone": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/7944ef04-f831-11e5-7a69-971500188b18",
           "type": "storezone",
           "mediaType": "application/json"
         }
       }
     }
   ]
}
```

### Create storage location
#### Description

The warehouse bin is created based on the passed JSON object,
which contains a representation of the new Storage Bin.
The result is a JSON representation of the created Storage Bin. To create a new Storage Bin,
it is necessary and sufficient to specify a non-empty `name` field in the passed object. Within the same warehouse, the names of the Cells must be unique.

> Request to create a Storage Bin

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d '{
         "name": "slot 1"
       }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Warehouse Bin.

```json
[
     {
         "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/9177a566-75f8-11ed-ac1a-000d00000000",
             "type": "slot",
             "mediaType": "application/json"
         },
         "id": "9177a566-75f8-11ed-ac1a-000d00000000",
         "accountId": "5f69193a-75f8-11ed-ac1a-000f00000001",
         "updated": "2022-12-07 09:29:56.547",
         "name": "slot 1",
         "externalCode": "wYIaWipYjrZkJZZlw1Amy1"
     }
]
```

> Request to create a storage bin with a zone

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d '{
         "name": "slot 1",
         "zone": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/8277a566-75f8-11ed-ac1a-000d00000000",
             "type": "storezone",
             "mediaType": "application/json"
           }
         }
       }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Warehouse Bin.

```json
[
     {
         "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/9177a566-75f8-11ed-ac1a-000d00000000",
             "type": "slot",
             "mediaType": "application/json"
         },
         "id": "9177a566-75f8-11ed-ac1a-000d00000000",
         "accountId": "5f69193a-75f8-11ed-ac1a-000f00000001",
         "updated": "2022-12-07 09:29:56.547",
         "name": "slot 1",
         "externalCode": "wYIaWipYjrZkJZZlw1Amy1",
         "zone": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/8277a566-75f8-11ed-ac1a-000d00000000",
             "type": "storezone",
             "mediaType": "application/json"
           }
         }
     }
]
```

### Bulk creation and update of storage bins

[Bulk creation and update](../#mojsklad-json-api-obschie-swedeniq-sozdanie-i-obnowlenie-neskol-kih-ob-ektow) Storage bins.
In the body of the request, you need to pass an array containing a JSON representation of the Storage Bins that you want to create or update.
Updated Storage Bins must contain the identifier in the form of metadata.

> Request to create and update multiple Storage Bins

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots
"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "Slot 2"
             },
             {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/9177a566-75f8-11ed-ac1a-000d00000000",
                 "type": "slot",
                 "mediaType": "application/json"
               },
               "name": "Slot new"
             }
           ]'
   ```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Storage Bins.

```json
[
     {
         "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/9177a566-75f8-11ed-ac1a-000d00000000",
             "type": "slot",
             "mediaType": "application/json"
         },
         "id": "9177a566-75f8-11ed-ac1a-000d00000000",
         "accountId": "5f69193a-75f8-11ed-ac1a-000f00000001",
         "updated": "2022-12-07 09:29:56.547",
         "name": "Slot new",
         "externalCode": "wYIaWipYjrZkJZZlw1Amy1"
     },
     {
         "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/7d479c5f-75f9-11ed-ac1a-000d00000003",
             "type": "slot",
             "mediaType": "application/json"
         },
         "id": "7d479c5f-75f9-11ed-ac1a-000d00000003",
         "accountId": "5f69193a-75f8-11ed-ac1a-000f00000001",
         "updated": "2022-12-07 09:36:32.702",
         "name": "Slot 2",
         "externalCode": "geYPAnDwhwrTMeo09TjW21"
     }
]
```

### Delete storage location

**Parameters**

| Parameter | Description|
| ------- | ------------- |
| **store_id** | `string` (required) *Example: 7a6a11b6-12c5-11e6-9464-e4de00000006* Warehouse ID. |
| **slot_id** | `string` (required) *Example: 7d479c5f-75f9-11ed-ac1a-000d00000003* Warehouse bin ID. |

> Request to delete the Warehouse bin with the specified id.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/7d479c5f-75f9-11ed-ac1a-000d00000003"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of the Storage Bin.

### Bulk deletion of storage bins

In the body of the request, you need to pass an array containing the JSON metadata of the Storage Bins that you want to delete.

> Request for bulk deletion of storage bins.

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d'[
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/9177a566-75f8-11ed-ac1a-000d00000000",
             "type": "slot",
             "mediaType": "application/json"
           }
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/7d479c5f-75f9-11ed-ac1a-000d00000003",
             "type": "slot",
             "mediaType": "application/json"
           }
         }
       ]'
```

> Successful request. The result is JSON information about the deletion of storage bins.

```json
[
   {
     "info":"Entity 'slot' with UUID: 9177a566-75f8-11ed-ac1a-000d00000000 deleted successfully"
   },
   {
     "info":"Entity 'slot' with UUID: 7d479c5f-75f9-11ed-ac1a-000d00000003 deleted successfully"
   }
]
```

### Get storage location
**Parameters**

| Parameter | Description |
| ------- |---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b18* Warehouse Bin ID. |

> Request for a separate Warehouse Bin with the specified ID.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b19/slots/7944ef04-f831-11e5-7a69-971500188b18"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Storage Bin with the specified ID.

```json
{
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b19/slots/7944ef04-f831-11e5-7a69-971500188b18",
         "type": "slot",
         "mediaType": "application/json"
       },
       "id": "7944ef04-f831-11e5-7a69-971500188b18",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "updated": "2016-05-05 16:32:02",
       "name": "slot1",
       "externalCode": "223ddxzv223"
}
```

### Change storage location

In the body of the request, you need to pass a JSON representation of the Storage Bin that you want to update.

**Parameters**

| Parameter | Description|
| ------- | ------------ |
| **store_id** | `string` (required) *Example: 7a6a11b6-12c5-11e6-9464-e4de00000006* Warehouse ID. |
| **slot_id** | `string` (required) *Example: 7d479c5f-75f9-11ed-ac1a-000d00000003* Warehouse bin ID. |

> Request to update Warehouse bin

```shell
curl -X PUT
   "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/7d479c5f-75f9-11ed-ac1a-000d00000003"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d '{
         "name": "slot 3"
       }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Warehouse Bin.

```json
[
     {
         "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/7d479c5f-75f9-11ed-ac1a-000d00000003",
             "type": "slot",
             "mediaType": "application/json"
         },
         "id": "7d479c5f-75f9-11ed-ac1a-000d00000003",
         "accountId": "5f69193a-75f8-11ed-ac1a-000f00000001",
         "updated": "2022-12-07 09:29:56.547",
         "name": "slot 3",
         "externalCode": "wYIaWipYjrZkJZZlw1Amy1"
     }
]
```

> Request to update a Warehouse bin with a zone

```shell
curl -X PUT
   "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/7d479c5f-75f9-11ed-ac1a-000d00000003"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d '{
         "name": "slot 3",
         "zone": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/8277a566-75f8-11ed-ac1a-000d00000000",
             "type": "storezone",
             "mediaType": "application/json"
           }
         }
       }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Warehouse Bin.

```json
[
     {
       "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/7d479c5f-75f9-11ed-ac1a-000d00000003",
           "type": "slot",
           "mediaType": "application/json"
       },
       "id": "7d479c5f-75f9-11ed-ac1a-000d00000003",
       "accountId": "5f69193a-75f8-11ed-ac1a-000f00000001",
       "updated": "2022-12-07 09:29:56.547",
       "name": "slot 3",
       "externalCode": "wYIaWipYjrZkJZZlw1Amy1",
       "zone": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/8277a566-75f8-11ed-ac1a-000d00000000",
           "type": "storezone",
           "mediaType": "application/json"
         }
       }
     }
]
```
