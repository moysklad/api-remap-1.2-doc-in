## Warehouse

### Warehouses
This entity can be contextually searched using the special `search` parameter. [Learn more](../#kladana-json-api-general-info-context-search).

The search among warehouse objects for matching the search string will be carried out using the following fields:

+ By Warehouse name **name**
+ By Warehouse code **code**

#### Entity attributes

| Title | Type                                               | Filtration | Description |
|----- |----------------------------------------------------| ----- | ------- |
| **accountId** | UUID                                               | `=` `!=` | Account ID<br>`+Required when answering` `+Read Only` |
| **address** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Warehouse address |
| **addressFull** | Object                                             | | Address with details on individual fields. [Learn more](../dictionaries/#entities-warehouse-warehouses-attributes-of-entity-address) |
| **archived** | Boolean                                            | `=` `!=` | Has the Warehouse been archived<br>`+Required when answering` |
| **attributes** | Array(Object)                                      | [Statements of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Array of metadata of additional warehouse fields |
| **code** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Warehouse Code |
| **description** | String(4096)                                       | `=` `!=` `~` `~=` `=~` | Comment to Warehouse |
| **externalCode** | String(255)                                        | `=` `!=` `~` `~=` `=~` | External code of the Warehouse<br>`+Required when answering` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when answering` `+Expand` |
| **id** | UUID                                               | `=` `!=` | Warehouse ID<br>`+Required when answering` `+Read Only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Warehouse Metadata<br>`+Required when answering` |
| **name** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Warehouse Name<br>`+Required when answering` `+Required when creating` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Companyudnik)<br>`+Expand` |
| **parent** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Parent warehouse metadata (Groups)<br>`+Expand` |
| **pathName** | String                                             | `=` `!=` `~` `~=` `=~` | Warehouse Group<br>`+Required when answering` |
| **shared** | Boolean                                            | `=` `!=` | Sharing<br>`+Required when answering` |
| **updated** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Time when the Warehouse was last updated<br>`+Required when answering` `+Read only` |
| **zones** | MetaArray                                          | |  Warehouse locations. [Learn more](../dictionaries/#entities-warehouse-warehouse-locations)<br>`+Read-only` `+Expand` |
| **slots** | MetaArray                                          | | Warehouse bins. [Learn more](../dictionaries/#entities-warehouse-warehouse-bins)<br>`+Read-only` `+Expand` |

#### Attributes of entity Address

| Title | Type | Description |
| ---------| ----|----- |
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
To delete an address, pass the empty string `""` to the `address` string field.

Learn more about [additional fields of warehouses](../#kladana-json-api-general-info-additional-fields)


### Get Warehouses
Get a list of all Warehouses.
Result: JSON object including fields:

| Title | Type | Description |
| ----------- | ---------|---------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Warehouses. |

**Parameters**

| Parameter | Description |
| ------ | ----------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Warehouses

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/store"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Warehouses.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/store/",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
     "type": "store",
     "mediaType": "application/json",
     "size": 5,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/caf46ce5-0569-11e6-9464-e4de00000000",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       },
       "id": "caf46ce5-0569-11e6-9464-e4de00000000",
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
       "updated": "2016-04-18 16:31:01",
       "name": "002",
       "externalCode": "y7ztWINfjXinPToFMqQid2",
       "archived": false,
       "address": "125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
       "addressFull": {
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
       "pathName": "",
       "zones": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/caf46ce5-0569-11e6-9464-e4de00000000/zones",
           "type": "storezone",
           "mediaType": "application/json",
           "size": 0,
           "limit": 1000,
           "offset": 0
         }
       },
       "slots": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/caf46ce5-0569-11e6-9464-e4de00000000/slots",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       },
       "id": "850ee995-f504-11e5-8a84-bae500000160",
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
       "zones": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160/zones",
           "type": "storezone",
           "mediaType": "application/json",
           "size": 0,
           "limit": 1000,
           "offset": 0
         }
       },
       "slots": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160/slots",
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
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/6ebb9094-056a-11e6-9464-e4de000000b4",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       },
       "id": "6ebb9094-056a-11e6-9464-e4de000000b4",
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
       "pathName": "002",
       "zones": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/6ebb9094-056a-11e6-9464-e4de000000b4/zones",
           "type": "storezone",
           "mediaType": "application/json",
           "size": 0,
           "limit": 1000,
           "offset": 0
         }
       },
       "slots": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/6ebb9094-056a-11e6-9464-e4de000000b4/slots",
           "type": "slot",
           "mediaType": "application/json",
           "size": 0,
           "limit": 1000,
           "offset": 0
         }
       }
     },{
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/95dcda62-056b-11e6-9464-e4de000000b7",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       },
       "id": "95dcda62-056b-11e6-9464-e4de000000b7",
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
       "pathName": "Main warehouse",
       "zones": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/95dcda62-056b-11e6-9464-e4de000000b7/zones",
           "type": "storezone",
           "mediaType": "application/json",
           "size": 0,
           "limit": 1000,
           "offset": 0
         }
       },
       "slots": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/95dcda62-056b-11e6-9464-e4de000000b7/slots",
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

The warehouse is created based on the provided JSON object, which represents the new warehouse. The `name` field is required when creating a warehouse and must not be empty.

> An example of a request to create a new Warehouse.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/store"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "addressFull": {
                "addInfo": "addinfo2",
                "apartment": "412",
                "city": "Moscow2",
                "comment": "some words about address2",
                "country": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/country/40e6f69a-991c-4fbc-8be9-d0d906cad180",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
                        "type": "country",
                        "mediaType": "application/json"
                    }
                },
                "house": "32",
                "postalCode": "11192342",
                "region": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/region/4bd3542a-f401-11e8-8eb2-f2801f1b9fd1",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
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
     "href": "https://api.kladana.com/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
     "type": "store",
     "mediaType": "application/json"
   },
   "id": "0c8de58c-056c-11e6-9464-e4de00000003",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/country/40e6f69a-991c-4fbc-8be9-d0d906cad180",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json"
       }
     },
     "house": "32",
     "postalCode": "11192342",
     "region": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/region/4bd3542a-f401-11e8-8eb2-f2801f1b9fd1",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       }
     },
     "street": "Lenin goru2"
   },
   "zones": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003/zones",
       "type": "storezone",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "slots": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003/slots",
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
     "https://api.kladana.com/api/remap/1.2/entity/store"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "addressFull": {
                "addInfo": "addinfo2",
                "apartment": "412",
                "city": "Moscow2",
                "comment": "some words about address2",
                "country": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/country/40e6f69a-991c-4fbc-8be9-d0d906cad180",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
                        "type": "country",
                        "mediaType": "application/json"
                    }
                },
                "house": "32",
                "postalCode": "11192342",
                "region": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/region/4bd3542a-f401-11e8-8eb2-f2801f1b9fd1",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
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
                        "href": "https://api.kladana.com/api/remap/1.2/entity/store/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
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
     "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
     "type": "store",
     "mediaType": "application/json"
   },
   "id": "7a6a11b6-12c5-11e6-9464-e4de00000006",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/country/40e6f69a-991c-4fbc-8be9-d0d906cad180",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json"
       }
     },
     "house": "32",
     "postalCode": "11192342",
     "region": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/region/4bd3542a-f401-11e8-8eb2-f2801f1b9fd1",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       }
     },
     "street": "Lenin goru2"
   },
   "zones": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones",
       "type": "storezone",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "slots": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
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

[Warehouses bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects).
In the body of the request, you need to pass an array containing JSON representations of the Warehouses that you want to create or update.
Updated Warehouses must contain the identifier in the form of metadata.

> An example of creating and updating several Warehouses

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/store"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
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
                    "href": "https://api.kladana.com/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
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
                        "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     },
     "id": "0c8de58c-056c-11e6-9464-e4de00000003",
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
     "updated": "2016-04-18 16:47:10",
     "name": "Warehouse2",
     "code": "code3",
     "externalCode": "sfksjafwuiw1sf32141",
     "archived": false,
     "pathName": "",
     "address": "Moscow, Vavilov street 19/116",
     "zones": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003/zones",
         "type": "storezone",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     },
     "slots": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003/slots",
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     },
     "id": "0c8de58c-056c-11e6-9464-e4de00000003",
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
     "updated": "2016-04-18 16:56:31",
     "name": "Warehouse3",
     "code": "code31",
     "externalCode": "EXTCODE",
     "archived": false,
     "pathName": "",
     "address": "Moscow, BaBilova street 20/116",
     "zones": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003/zones",
         "type": "storezone",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     },
     "slots": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003/slots",
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
   "https://api.kladana.com/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of the Warehouse.

### Bulk deletion of Warehouses

In the body of the request, you need to pass an array containing the JSON metadata of the Warehouses that you want to delete.


> Request for bulk deletion of Warehouses.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/store/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b1",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                  "type": "store",
                  "mediaType": "application/json"
              }
          },
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b2",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                  "type": "store",
                  "mediaType": "application/json"
              }
          }
      ]'
```

> Successful request. The result is JSON information about deleting Warehouses.

```json
[
   {
     "info":"Entity 'store' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'store' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Warehouse metadata
#### Warehouse Metadata
Request to get Warehouse metadata. The result is a JSON object including:

| Title | Type | Description |
| --------|-------| ---------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Link to Warehouse metadata |
| **attributes** | Array(Object) | Array of objects of additional Warehouse fields in the [Metadata](../#kladana-json-api-general-info-metadata) format |
| **createShared** | Boolean | create new Warehouses labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Warehouse Metadata

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/store/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional Warehouse fields.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
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
   "https://api.kladana.com/api/remap/1.2/entity/store/metadata/attributes/5290a290-0313-11e6-9464-e4de00000020"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/store/metadata/attributes/5290a290-0313-11e6-9464-e4de00000020",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "5290a290-0313-11e6-9464-e4de00000020",
   "name": "attribute_name",
   "type": "boolean",
   "required": false
}

```

### Warehouse

### Get Warehouse

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Warehouse ID. |

> Request to receive a separate Warehouse with the specified ID.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Warehouse with the specified ID.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/store/95dcda62-056b-11e6-9464-e4de000000b7",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
     "type": "store",
     "mediaType": "application/json"
   },
   "id": "95dcda62-056b-11e6-9464-e4de000000b7",
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
   "updated": "2016-04-18 16:43:51",
   "name": "Warehouse1",
   "description": "Main warehouse",
   "code": "113AB79",
   "externalCode": "fQPIOtxjg-FaeZNKcLx6B3",
   "archived": false,
   "parent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
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
   "zones": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/95dcda62-056b-11e6-9464-e4de000000b7/zones",
       "type": "storezone",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "slots": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/95dcda62-056b-11e6-9464-e4de000000b7/slots",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
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
except for fields marked `Read Only` in the description of [Warehouse attributes](../dictionaries/#entities-warehouse).

**Parameters**

| Parameter | Description |
| ------- |--------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Warehouse ID. |


> An example of a request to update an existing Warehouse.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "addressFull": {
                "addInfo": "addinfo2",
                "apartment": "412",
                "city": "Moscow2",
                "comment": "some words about address2",
                "country": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/country/40e6f69a-991c-4fbc-8be9-d0d906cad180",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
                        "type": "country",
                        "mediaType": "application/json"
                    }
                },
                "house": "32",
                "postalCode": "11192342",
                "region": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/region/4bd3542a-f401-11e8-8eb2-f2801f1b9fd1",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
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
                    "href": "https://api.kladana.com/api/remap/1.2/entity/store/faf3ff5b-2e58-11e6-8a84-bae500000050",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
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
     "href": "https://api.kladana.com/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
     "type": "store",
     "mediaType": "application/json"
   },
   "id": "0c8de58c-056c-11e6-9464-e4de00000003",
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
               "href": "https://api.kladana.com/api/remap/1.2/entity/country/40e6f69a-991c-4fbc-8be9-d0d906cad180",
               "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
               "type": "country",
               "mediaType": "application/json"
           }
       },
       "house": "32",
       "postalCode": "11192342",
       "region": {
           "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/entity/region/4bd3542a-f401-11e8-8eb2-f2801f1b9fd1",
               "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
               "type": "region",
               "mediaType": "application/json"
           }
       },
     "street": "Lenin goru2",
     "zones": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003/zones",
         "type": "storezone",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     },
     "slots": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/0c8de58c-056c-11e6-9464-e4de00000003/slots",
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
     "https://api.kladana.com/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "addressFull": {
                "addInfo": "addinfo2",
                "apartment": "412",
                "city": "Moscow2",
                "comment": "some words about address2",
                "country": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/country/40e6f69a-991c-4fbc-8be9-d0d906cad180",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
                        "type": "country",
                        "mediaType": "application/json"
                    }
                },
                "house": "32",
                "postalCode": "11192342",
                "region": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/region/4bd3542a-f401-11e8-8eb2-f2801f1b9fd1",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
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
                        "href": "https://api.kladana.com/api/remap/1.2/entity/store/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
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
     "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
     "type": "store",
     "mediaType": "application/json"
   },
   "id": "7a6a11b6-12c5-11e6-9464-e4de00000006",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/country/40e6f69a-991c-4fbc-8be9-d0d906cad180",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json"
       }
     },
     "house": "32",
     "postalCode": "11192342",
     "region": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/region/4bd3542a-f401-11e8-8eb2-f2801f1b9fd1",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type": "region",
         "mediaType": "application/json"
       }
     },
     "street": "Lenin goru2"
   },
   "zones": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones",
       "type": "storezone",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "slots": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
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

### Warehouse Locations
Warehouse locations are accessed if you have the right to see the corresponding warehouse.

#### Entity attributes

| Title | Type                                               | Filtration | Description |
|----- |----------------------------------------------------| -------- | ----------- |
| **accountId** | UUID                                               | | Account ID<br>`+Required when replying` `+Read Only` |
| **externalCode** | String(255)                                        || External Warehouse Location Code<br>`+Required when replying` |
| **id** | UUID                                               | | Warehouse Location ID<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Warehouse Location Metadata<br>`+Required when replying` |
| **name** | String(255)                                        | | Warehouse Location Name<br>`+Required when replying` `+Required when creating` |
| **updated** | DateTime                                           | | Time when the Warehouse Location was last updated<br>`+Required when replying` `+Read Only` |

### Get Warehouse Locations
Get a list of all Warehouse Location.
Result: JSON object including fields:

| Title | Type | Description |
| ----------- | --------------- |-------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the Warehouse Location. |

**Parameters**

| Parameter | Description |
|---------- | ------------ |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Warehouse Locations

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of Warehouse Locations.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones",
     "type": "storezone",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/7a6a11b6-12c5-11e6-9464-e4de00000007",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/7a6a11b6-12c5-11e6-9464-e4de00000008",
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

### Create Warehouse Location
#### Description

The Warehouse Location is created based on the passed JSON object,
which contains a representation of the new Warehouse Location.
The result is a JSON representation of the created Warehouse Location. To create a new Warehouse Location,
it is necessary and sufficient to specify a non-empty `name` field in the passed object. Within the same warehouse, the names of the location must be unique.

> Request to create Warehouse Location

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d '{
         "name": "zone 1"
       }'
```

> Response 200(application/json)
Successful request. Result - JSON representation of the created Warehouse Location.

```json
[
     {
         "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/9177a566-75f8-11ed-ac1a-000d00000000",
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

### Bulk creation and update of Warehouse Locations

[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) Warehouse Locations.
In the body of the request, you need to pass an array containing JSON representations of the Warehouse Locations that you want to create or update.
Updated Warehouse Locations must contain the identifier in the form of metadata.

> Request to create and update multiple Warehouse Locations

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones
"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "Zone 2"
             },
             {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/9177a566-75f8-11ed-ac1a-000d00000000",
                 "type": "storezone",
                 "mediaType": "application/json"
               },
               "name": "Zone new"
             }
           ]'
   ```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Warehouse Locations.

```json
[
     {
         "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/9177a566-75f8-11ed-ac1a-000d00000000",
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
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/7d479c5f-75f9-11ed-ac1a-000d00000003",
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

### Delete Warehouse Location

When deleting the Warehouse Location to which the bins are attached, the bins are unlinked from this location.

**Parameters**

| Parameter | Description |
| ------- |----------|
| **store_id** | `string` (required) *Example: 7a6a11b6-12c5-11e6-9464-e4de00000006* Warehouse ID. |
| **zone_id** | `string` (required) *Example: 7d479c5f-75f9-11ed-ac1a-000d00000003* Warehouse Location ID. |

> Request to delete Warehouse Location with specified ID.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/7d479c5f-75f9-11ed-ac1a-000d00000003"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of the Warehouse Location.

### Bulk deletion of Warehouse Locations

In the body of the request, you need to pass an array containing the JSON metadata of the Warehouse Locations that you want to delete.


> Request for bulk deletion of Warehouse Locations.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/9177a566-75f8-11ed-ac1a-000d00000000",
             "type": "storezone",
             "mediaType": "application/json"
           }
         },
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/7d479c5f-75f9-11ed-ac1a-000d00000003",
             "type": "storezone",
             "mediaType": "application/json"
           }
         }
       ]'
```

> Successful request. The result is JSON information about deleting Warehouse Locations.

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

### Get Warehouse Location

**Parameters**

| Parameter | Description |
| ------- |----------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b18* Warehouse Location ID. |

> Request for a separate Warehouse Location with the specified ID.

```shell
curl -XGET
   "https://api.kladana.com/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b19/zones/7944ef04-f831-11e5-7a69-971500188b18"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Warehouse Location with the specified ID.

```json
{
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b19/zones/7944ef04-f831-11e5-7a69-971500188b18",
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

### Change Warehouse Location

In the body of the request, you need to pass a JSON representation of the Warehouse Location that you want to update.

**Parameters**

| Parameter | Description |
| ------- | ------------- |
| **store_id** | `string` (required) *Example: 7a6a11b6-12c5-11e6-9464-e4de00000006* Warehouse ID. |
| **zone_id** | `string` (required) *Example: 7d479c5f-75f9-11ed-ac1a-000d00000003* Warehouse Location ID. |

> Request to update Warehouse Location

```shell
curl -X PUT
   "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/7d479c5f-75f9-11ed-ac1a-000d00000003"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d '{
         "name": "zone 3"
       }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Warehouse Location.

```json
[
     {
         "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/7d479c5f-75f9-11ed-ac1a-000d00000003",
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

### Warehouse Bins
Access to the bins of the warehouse is carried out if you have the right to see the corresponding warehouse.

#### Entity attributes

| Title | Type   | Filtration | Description |
| --------- | ------------ | ----- | -------- |
| **accountId** | UUID                                               | | Account ID<br>`+Required when answering` `+Read Only` |
| **externalCode** | String(255)                                        | | Bin External Code<br>`+Required when answering` |
| **id** | UUID                                               | | Bin ID<br>`+Required when answering` `+Read Only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Bin Metadata<br>`+Required when answering` |
| **name** | String(255)                                        | | Bin Name<br>`+Required when answering` `+Required when creating` |
| **updated** | DateTime                                           | | Bin Last Update<br>`+Required when answering` `+Read Only` |
| **barcode**   | String(255)  |  | Bin barcode  |
| **zone** | Meta                                               | | Bin location. [Learn more](../dictionaries/#entities-warehouse-warehouse-locations)<br>`+Read-only` `+Expand` |

### Get Warehouse Bins
Get a list of all Warehouse Bins.
Result: JSON object including fields:

| Title | Type | Description |
| ----------- | ------|-----------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Warehouse Bins. |

**Parameters**

| Parameter | Description |
| ---------| --------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Warehouse Bins

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of Warehouse Bins.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots",
     "type": "slot",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/7a6a11b6-12c5-11e6-9464-e4de00000007",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/7a6a11b6-12c5-11e6-9464-e4de00000008",
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
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/7944ef04-f831-11e5-7a69-971500188b18",
           "type": "storezone",
           "mediaType": "application/json"
         }
       }
     }
   ]
}
```

### Create Warehouse Bin
#### Description

The warehouse bin is created based on the passed JSON object, which contains a representation of the new Warehouse Bin. The result is a JSON representation of the created Warehouse Bin. To create a new Warehouse Bin,
it is necessary and sufficient to specify a non-empty `name` field in the passed object. Within the same warehouse, the names of the bins must be unique.

> Request to create a Warehouse Bin

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
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
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/9177a566-75f8-11ed-ac1a-000d00000000",
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

> Request to create a Warehouse bin with a location

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d '{
         "name": "slot 1",
         "zone": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/8277a566-75f8-11ed-ac1a-000d00000000",
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
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/9177a566-75f8-11ed-ac1a-000d00000000",
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
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/8277a566-75f8-11ed-ac1a-000d00000000",
             "type": "storezone",
             "mediaType": "application/json"
           }
         }
     }
]
```

### Bulk creation and update of Warehouse Bins

[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) Warehouse bins.
In the body of the request, you need to pass an array containing a JSON representation of the Warehouse Bins that you want to create or update.
Updated Warehouse Bins must contain the identifier in the form of metadata.

> Request to create and update multiple Warehouse Bins

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots
"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "Slot 2"
             },
             {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/9177a566-75f8-11ed-ac1a-000d00000000",
                 "type": "slot",
                 "mediaType": "application/json"
               },
               "name": "Slot new"
             }
           ]'
   ```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Warehouse Bins.

```json
[
     {
         "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/9177a566-75f8-11ed-ac1a-000d00000000",
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
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/7d479c5f-75f9-11ed-ac1a-000d00000003",
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

### Delete Warehouse Bin

**Parameters**

| Parameter | Description|
| ------- | ------------- |
| **store_id** | `string` (required) *Example: 7a6a11b6-12c5-11e6-9464-e4de00000006* Warehouse ID. |
| **slot_id** | `string` (required) *Example: 7d479c5f-75f9-11ed-ac1a-000d00000003* Warehouse bin ID. |

> Request to delete the Warehouse bin with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/7d479c5f-75f9-11ed-ac1a-000d00000003"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of the Warehouse Bin.

### Bulk deletion of Warehouse Bins

In the body of the request, you need to pass an array containing the JSON metadata of the Warehouse Bins that you want to delete.

> Request for bulk deletion of Warehouse Bins.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/9177a566-75f8-11ed-ac1a-000d00000000",
             "type": "slot",
             "mediaType": "application/json"
           }
         },
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/7d479c5f-75f9-11ed-ac1a-000d00000003",
             "type": "slot",
             "mediaType": "application/json"
           }
         }
       ]'
```

> Successful request. The result is JSON information about the deletion of Warehouse bins.

```json
[
   {
     "info":"Entity 'slot' with UUID: 9177a566-75f8-11ed-ac1a-000d00000000 successfully deleted"
   },
   {
     "info":"Entity 'slot' with UUID: 7d479c5f-75f9-11ed-ac1a-000d00000003 successfully deleted"
   }
]
```

### Get Warehouse Bin
**Parameters**

| Parameter | Description |
| ------- |---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b18* Warehouse Bin ID. |

> Request for a separate Warehouse Bin with the specified ID.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b19/slots/7944ef04-f831-11e5-7a69-971500188b18"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Warehouse Bin with the specified ID.

```json
{
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/store/7944ef04-f831-11e5-7a69-971500188b19/slots/7944ef04-f831-11e5-7a69-971500188b18",
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

### Change Warehouse Bin

In the body of the request, you need to pass a JSON representation of the Warehouse Bin that you want to update.

**Parameters**

| Parameter | Description|
| ------- | ------------ |
| **store_id** | `string` (required) *Example: 7a6a11b6-12c5-11e6-9464-e4de00000006* Warehouse ID. |
| **slot_id** | `string` (required) *Example: 7d479c5f-75f9-11ed-ac1a-000d00000003* Warehouse bin ID. |

> Request to update Warehouse bin

```shell
curl -X PUT
   "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/7d479c5f-75f9-11ed-ac1a-000d00000003"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
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
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/7d479c5f-75f9-11ed-ac1a-000d00000003",
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

> Request to update a Warehouse bin with a location

```shell
curl -X PUT
   "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/7d479c5f-75f9-11ed-ac1a-000d00000003"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d '{
         "name": "slot 3",
         "zone": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/8277a566-75f8-11ed-ac1a-000d00000000",
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
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/slots/7d479c5f-75f9-11ed-ac1a-000d00000003",
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
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/7a6a11b6-12c5-11e6-9464-e4de00000006/zones/8277a566-75f8-11ed-ac1a-000d00000000",
           "type": "storezone",
           "mediaType": "application/json"
         }
       }
     }
]
```
