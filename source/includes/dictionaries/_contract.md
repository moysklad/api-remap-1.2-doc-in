## Contract
### Contracts

Using the JSON API, you can create and update information about Contracts, request lists of Contracts and information on individual Contracts. The entity code for the Contract in the JSON API is the **contract** keyword. 

Learn more about [Contracts](https://kladana.zendesk.com/hc/en-us/articles/6507262448797-Contracts).

The entity can be contextually searched using the special `search` parameter. More details can be found at [link](../#kladana-json-api-general-info-context-search). The search with the search parameter differs from others in that the search is not prefixed, without tokenization, and only goes through one field at a time. Searches for strings that include the value of the search string.

The search among contract objects for matching the search string will be carried out using the following fields:

+ by Contract number **name**
+ according to the commentary to the Contract **description**

#### Entity attributes


| Title | Type | Filtration | Description |
| ------- | ---------- | ---- | ------- |
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **agent** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Counterparty Metadata<br>`+Required when replying` `+Expand` `+Required when creating` |
| **agentAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Counterparty account metadata<br>`+Required when replying` `+Expand` |
| **archived** | Boolean | `=` `!=` | Has the Contract been added to the archive<br>`+Required when replying` |
| **attributes** | Array(Object) |[Additional Operators fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Collection of additional fields |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Contract Code |
| **contractType** | Enum | | Contract type. Possible values: `Commission contract`, `Purchase and sale contract`<br>`+Required when replying` |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Description of the Contract |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | External Code of the Contract<br>`+Required when replying` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee department metadata<br>`+Required when replying` `+Expand` |
| **id** | UUID | `=` `!=` | Contract ID<br>`+Required when replying` `+Read Only`|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Contract Metadata<br>`+Required when replying` |
| **moment** | DateTime | `=` `!=` `<` `>` `<=` `>=` | Contract Date<br>`+Required when replying` |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Contract number<br>`+Required when replying` |
| **organizationAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Account metadata of your legal entity<br>`+Expand` |
| **ownAgent** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Metadata of your legal entity<br>`+Required when replying` `+Expand` `+Required when creating` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee) metadata<br>`+Expand` |
| **rate** | [Meta](../#kladana-json-api-general-info-metadata) | | Currency metadata<br>`+Required when replying` `+Expand` |
| **rewardPercent** | Int | | Reward in percent (from 0 to 100) |
| **rewardType** | Enum | | Reward Type. Possible values: `Percentage of the sale amount`, `Do not calculate` |
| **shared** | Boolean | `=` `!=` | Sharing<br>`+Required when replying` |
| **state** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Contract status metadata<br>`+Expand` |
| **sum** | Int | | Amount of the Contract<br>`+Required when answering` |
| **printed** | Boolean | | Is the document printed<br>`+Required when responding` `+Read Only` |
| **published** | Boolean | | Is the document published<br>`+Required when replying` `+Read Only` |
| **updated** | DateTime | `=` `!=` `<` `>` `<=` `>=`| When the entity was last updated<br>`+Required for response` `+Read-only` |


Table of fields, their values and their values in JSON representation:

| Field name | Possible Values | Corresponding value in JSON | Default value |
| ------- | ---------- | ---- | ------- |
| **contractType** | Commission contract | commission | Purchase and sale Contract |
| Purchase and sale Contract | Sales |
| **rewardType** | Percentage of the sale amount | PercentOfSales | Do not count |
| Do not count | None |

About working with fields of the Contracts can be read [here](../#kladana-json-api-general-info-additional-fields).

### Get a list of Contracts

Request for a list of all contracts on this account.
Result: JSON object including fields:

| Title | Type | Description |
| ------- | ---------- | ---- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing contracts. |

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get a list of contracts

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/contract"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Contracts.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/contract",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
     "type": "contract",
     "mediaType": "application/json",
     "size": 3,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/contract/498b8673-0308-11e6-9464-e4de00000089",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
         "type": "contract",
         "mediaType": "application/json"
       },
       "id": "498b8673-0308-11e6-9464-e4de00000089",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "owner": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": true,
       "group": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-04-15 15:48:00",
       "name": "14212412",
       "externalCode": "WEhvl5LFgyYqa5l6yKRzu3",
       "archived": false,
       "moment": "2016-04-15 15:47:00",
       "sum": 0,
       "contractType": "Sales",
       "ownAgent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "agent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/78f75b89-fd86-11e5-9464-e4de0000000b",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "state": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
           "type": "state",
           "mediaType": "application/json"
         }
       },
       "organizationAccount": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/342dc6f5-0bbb-11e6-d219-b9d90000004e/accounts/342e096d-0bbb-11e6-d219-b9d90000004f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "agentAccount": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/342dc6f5-0bbb-11e6-d219-b9d90000004e/accounts/342e096d-0bbb-11e6-d219-b9d90000004f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "rate": {
         "currency": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "printed": false,
       "published": false
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/contract/8c2cab84-0ac0-11e6-9464-e4de00000100",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
         "type": "contract",
         "mediaType": "application/json"
       },
       "id": "8c2cab84-0ac0-11e6-9464-e4de00000100",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "owner": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": true,
       "group": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-04-25 11:34:38",
       "name": "Hi Contract Name",
       "description": "Comment",
       "code": "KOOOOD",
       "externalCode": "GIpDXPPIh4ytzI9svfcyS3",
       "archived": false,
       "moment": "2016-04-25 11:33:00",
       "sum": 9999999000,
       "contractType": "Commission",
       "rewardType": "PercentOfSales",
       "rewardPercent": 0,
       "ownAgent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "agent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "rate": {
         "currency": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/contract/8ce3c179-015e-11e6-9464-e4de0000007a",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
         "type": "contract",
         "mediaType": "application/json"
       },
       "id": "8ce3c179-015e-11e6-9464-e4de0000007a",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "owner": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": true,
       "group": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },"updated": "2016-04-13 13:00:28",
       "name": "12",
       "description": "asdwqeqr",
       "code": "cjhjr",
       "externalCode": "jTNl4F6WhxgFTcczKRT6i2",
       "archived": false,
       "moment": "2016-04-13 13:00:00",
       "sum": 0,
       "contractType": "Sales",
       "ownAgent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "agent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "state": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
           "type": "state",
           "mediaType": "application/json"
         }
       },
       "organizationAccount": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/organization/342dc6f5-0bbb-11e6-d219-b9d90000004e/accounts/342e096d-0bbb-11e6-d219-b9d90000004f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "agentAccount": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/342dc6f5-0bbb-11e6-d219-b9d90000004e/accounts/342e096d-0bbb-11e6-d219-b9d90000004f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "rate": {
         "currency": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "printed": false,
       "published": false
     }
   ]
}
```

### Create a new Contract
Request to create a new Contract.
Mandatory fields for creating a Contract:

| Title | Type | Description |
| ------- | ---------- | ---- |
| **name** | String(255) | Contract number<br>`+Required when replying` `+Required when creating` |
| **ownAgent** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of your legal entity<br>`+Required when replying` `+Expand` `+Required when creating` |
| **agent** | [Meta](../#kladana-json-api-general-info-metadata) | Counterparty Metadata<br>`+Required when replying` `+Expand` `+Required when creating` |


> An example of creating a new Contract, with a request, the Body of which contains only required fields.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/contract"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "ownAgent": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "agent": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                 "type": "counterparty",
                 "mediaType": "application/json"
               }
             }
           }
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Contract.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/contract/8df02031-0ac4-11e6-9464-e4de00000008",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
     "type": "contract",
     "mediaType": "application/json"
   },
   "id": "8df02031-0ac4-11e6-9464-e4de00000008",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-04-25 12:03:19",
   "name": "666",
   "externalCode": "y8j8uYVuhd04K8ZGOuu2a1",
   "archived": false,
   "moment": "2016-04-25 12:03:19",
   "sum": 0,
   "contractType": "Sales",
   "ownAgent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/342dc6f5-0bbb-11e6-d219-b9d90000004e/accounts/342e096d-0bbb-11e6-d219-b9d90000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/342dc6f5-0bbb-11e6-d219-b9d90000004e/accounts/342e096d-0bbb-11e6-d219-b9d90000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "printed": false,
   "published": false
}
```

> An example of creating a new Contract with a richer request body.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/contract"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "00000011111",
             "description": "Contract with partner organization Solnyshko LLC",
             "code": "contractWithPartner",
             "externalCode": "extC12fd12a",
             "moment": "2016-07-06 12:53:22",
             "sum": 200000,
             "contractType": "Sales",
             "ownAgent": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/organization/db141159-2c97-11e6-8a84-bae50000004e",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "agent": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/2e6aa620-2c98-11e6-8a84-bae500000004",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                 "type": "counterparty",
                 "mediaType": "application/json"
               }
             },
             "state": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
                 "type": "state",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Contract.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/contract/3bba8d2a-2cb6-11e6-8a84-bae50000002c",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
     "type": "contract",
     "mediaType": "application/json"
   },
   "id": "3bba8d2a-2cb6-11e6-8a84-bae50000002c",
   "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-06-07 16:46:27",
   "name": "00000011111",
   "description": "Contract with partner organization Solnyshko LLC",
   "code": "contractWithPartner",
   "externalCode": "extC12fd12a",
   "archived": false,
   "moment": "2016-07-06 12:53:22",
   "sum": 200000,
   "contractType": "Sales",
   "ownAgent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/db141159-2c97-11e6-8a84-bae50000004e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/2e6aa620-2c98-11e6-8a84-bae500000004",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/2e6aa620-2c98-11e6-8a84-bae500000004/accounts/2e6ab6ca-2c98-11e6-8a84-bae500000005",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "printed": false,
   "published": false
}
```

> An example of creating a new Contract, with a request, the Body of which contains additional fields.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/contract"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
            {
                "name": "666",
                "ownAgent": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                        "type": "organization",
                        "mediaType": "application/json"
                    }
                },
                "agent": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                        "type": "counterparty",
                        "mediaType": "application/json"
                    }
                },
                "rate": {
                    "currency": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                            "type": "currency",
                            "mediaType": "application/json"
                        }
                    }
                }
            },
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/contract/73fa8fb0-0ac5-11e6-9464-e4de0000000b",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
                    "type": "contract",
                    "mediaType": "application/json"
                },
                "name": "666_02",
                "ownAgent": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                        "type": "organization",
                        "mediaType": "application/json"
                    }
                },
                "contractType": "Sales",
                "code": "code333",
                "externalCode": "exCode333",
                "moment": "2017-02-25 12:03:19",
                "description": "Contract with the counterparty Supplier LLC",
                "rate": {
                    "currency": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                            "type": "currency",
                            "mediaType": "application/json"
                        }
                    }
                }
            }
        ]'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created contract.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/contract/8df02031-0ac4-11e6-9464-e4de00000008",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
       "type": "contract",
       "mediaType": "application/json"
     },
     "id": "8df02031-0ac4-11e6-9464-e4de00000008",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "owner": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": true,
     "group": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-04-25 12:03:19",
     "name": "666",
     "externalCode": "y8j8uYVuhd04K8ZGOuu2a1",
     "archived": false,
     "moment": "2016-04-25 12:03:19",
     "sum": 0,
     "contractType": "Sales",
     "ownAgent": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     "agent": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
         "type": "counterparty",
         "mediaType": "application/json"
       }
     },
     "organizationAccount": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/342dc6f5-0bbb-11e6-d219-b9d90000004e/accounts/342e096d-0bbb-11e6-d219-b9d90000004f",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "agentAccount": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/342dc6f5-0bbb-11e6-d219-b9d90000004e/accounts/342e096d-0bbb-11e6-d219-b9d90000004f",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "rate": {
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       }
     },
     "printed": false,
     "published": false
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/contract/73fa8fb0-0ac5-11e6-9464-e4de0000000b",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
       "type": "contract",
       "mediaType": "application/json"
     },
     "id": "73fa8fb0-0ac5-11e6-9464-e4de0000000b",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "owner": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": true,
     "group": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-04-25 12:22:17",
     "name": "666_02",
     "description": "Contract with the counterparty Supplier LLC",
     "code": "code333",
     "externalCode": "exCode333",
     "archived": false,
     "moment": "2017-02-25 12:03:19",
     "sum": 0,
     "contractType": "Sales",
     "ownAgent": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     "agent": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
         "type": "counterparty",
         "mediaType": "application/json"
       }
     },
     "organizationAccount": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/organization/342dc6f5-0bbb-11e6-d219-b9d90000004e/accounts/342e096d-0bbb-11e6-d219-b9d90000004f",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "agentAccount": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/342dc6f5-0bbb-11e6-d219-b9d90000004e/accounts/342e096d-0bbb-11e6-d219-b9d90000004f",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "rate": {
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       }
     },
     "printed": false,
     "published": false
   }
]
```

### Contracts bulk creating and update

[Сontracts bulk creating and update](../#kladana-json-api-general-info-create-and-update-multiple-objects).
In the body of the request, you need to pass an array containing the JSON representation of the Contracts that you want to create or update.
Updated Contracts must contain the identifier in the form of metadata.

> An example of creating and updating several Contracts

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/contract"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "666",
               "ownAgent": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                   "type": "organization",
                   "mediaType": "application/json"
                 }
               },
               "agent": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                   "type": "counterparty",
                   "mediaType": "application/json"
                 }
               },
               "rate": {
                 "currency": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                     "type": "currency",
                     "mediaType": "application/json"
                   }
                 }
               }
             },
             {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/contract/73fa8fb0-0ac5-11e6-9464-e4de0000000b",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
                 "type": "contract",
                 "mediaType": "application/json"
               },
               "name": "666_02",
               "ownAgent": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                   "type": "organization",
                   "mediaType": "application/json"
                 }
               },
               "contractType": "Sales",
               "code": "code333",
               "externalCode": "exCode333",
               "moment": "2017-02-25 12:03:19",
               "description": "Contract with the counterparty Supplier LLC",
               "rate": {
                 "currency": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                     "type": "currency",
                     "mediaType": "application/json"
                   }
                 }
               }
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of created and updated Contracts.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/contract/8df02031-0ac4-11e6-9464-e4de00000008",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
       "type": "contract",
       "mediaType": "application/json"
     },
     "id": "8df02031-0ac4-11e6-9464-e4de00000008",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "owner": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
     },
     "printed": false,
     "published": false
   }
]
```

### Delete Contract

**Parameters**

| Parameter | Description |
| ------- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Contract ID. |

> Request to delete the Contract with the specified ID.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/contract/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful removal of the Contract.

### Contracts bulk deletion

In the body of the request, you need to pass an array containing the JSON metadata of the Contracts that you want to delete.

> Request for Contracts bulk deletion.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/contract/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/contract/7944ef04-f831-11e5-7a69-971500188b1",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
                  "type": "contract",
                  "mediaType": "application/json"
              }
          },
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/contract/7944ef04-f831-11e5-7a69-971500188b2",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
                  "type": "contract",
                  "mediaType": "application/json"
              }
          }
      ]'
```

> Successful request. Result - JSON information about deletion of Contracts.

```json
[
   {
     "info":"Entity 'contract' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'contract' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Contract Metadata
#### Contract Metadata
Request for obtaining the metadata of the Contracts. The result is a JSON object including:

| Title | Type | Description |
| ------- | ---------- | ---- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Sales Order Metadata<br>`+Required when replying` |
| **attributes** | Array(Object) | Collection of additional fields |
| **states** | Array(Object) | Array of contract statuses |
| **createShared** | Boolean | Create new contracts with the label "General"<br>`+Required when replying` |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Obtaining methodical contracts
 
```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/contract/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional fields of the Contracts.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
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
   "states": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56c504-2e58-11e6-8a84-bae500000069",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "New",
       "color": 15106326,
       "stateType": "Regular",
       "entityType": "contract"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata/states/fb56cae3-2e58-11e6-8a84-bae50000006a",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56cae3-2e58-11e6-8a84-bae50000006a",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Confirmed",
       "color": 40931,
       "stateType": "Regular",
       "entityType": "contract"
     }
   ],
   "createShared": false
}
```

### Separate additional field

**Parameters**

| Parameter | Description |
|------ | --------- |
| **id** | `string` (required) *Example: 5290a290-0313-11e6-9464-e4de00000020* Fields ID. |

#### Separate additional field
 
> Request for information on a specific additional field.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/contract/metadata/attributes/5290a290-0313-11e6-9464-e4de00000020"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata/attributes/5290a290-0313-11e6-9464-e4de00000020",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "5290a290-0313-11e6-9464-e4de00000020",
   "name": "AttributeName1",
   "type": "boolean",
   "required": false
}
```

### Contract

**Parameters**

| Parameter | Description |
| ------ | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Contract ID. |

### Get contract
 
> Request for a separate Contract with the specified ID.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/contract/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Contract.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/contract/8ce3c179-015e-11e6-9464-e4de0000007a",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
     "type": "contract",
     "mediaType": "application/json"
   },
   "id": "8ce3c179-015e-11e6-9464-e4de0000007a",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-04-13 13:00:28",
   "name": "12",
   "description": "asdwqeqr",
   "code": "cjhjr",
   "externalCode": "jTNl4F6WhxgFTcczKRT6i2",
   "archived": false,
   "moment": "2016-04-13 13:00:00",
   "sum": 0,
   "contractType": "Sales",
   "ownAgent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/342dc6f5-0bbb-11e6-d219-b9d90000004e/accounts/342e096d-0bbb-11e6-d219-b9d90000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/342dc6f5-0bbb-11e6-d219-b9d90000004e/accounts/342e096d-0bbb-11e6-d219-b9d90000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "printed": false,
   "published": false,
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "25b6f76c-12d5-11e6-9464-e4de00000068",
       "name": "AttributeName1",
       "type": "boolean",
       "value": false
     }
   ]
}
```

### Change contract

Request to update a separate Contract with the specified ID.
When updating the **organization** and **agent** fields, you must also update the **organizationAccount** and
**agentAccount** respectively, otherwise an error will occur.

**Parameters**

| Parameter | Description |
| ------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Contract ID. |

> An example of a request to update a separate Contract.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/contract/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "666_02",
             "ownAgent": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "contractType": "Sales",
             "code": "code333",
             "externalCode": "exCode333",
             "moment": "2017-02-25 12:03:19",
             "description": "Contract with the counterparty Supplier LLC",
             "rate": {
               "currency": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                   "type": "currency",
                   "mediaType": "application/json"
                 }
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Contract.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/contract/73fa8fb0-0ac5-11e6-9464-e4de0000000b",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
     "type": "contract",
     "mediaType": "application/json"
   },
   "id": "73fa8fb0-0ac5-11e6-9464-e4de0000000b",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-04-25 12:22:17",
   "name": "666_02",
   "description": "Contract with the counterparty Supplier LLC",
   "code": "code333",
   "externalCode": "exCode333",
   "archived": false,
   "moment": "2017-02-25 12:03:19",
   "sum": 0,
   "contractType": "Sales",
   "ownAgent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/342dc6f5-0bbb-11e6-d219-b9d90000004e/accounts/342e096d-0bbb-11e6-d219-b9d90000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/342dc6f5-0bbb-11e6-d219-b9d90000004e/accounts/342e096d-0bbb-11e6-d219-b9d90000004f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/faf45b9a-2e58-11e6-8a84-bae500000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "printed": false,
   "published": false
}
```

> An example of a request to update a separate Contract with a request body containing additional fields.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/contract/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
              "name": "123_456",
              "ownAgent": {
                  "meta": {
                      "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                      "type": "organization",
                      "mediaType": "application/json"
                  }
              },
              "contractType": "Sales",
              "code": "not code 333",
              "externalCode": "exC22ode333",
              "moment": "2019-03-15 21:03:19",
              "description": "New contract",
              "attributes": [
                  {
                      "meta": {
                          "href": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
                          "type": "attributemetadata",
                          "mediaType": "application/json"
                      },
                      "value": false
                  }
              ]
          }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Contract.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/contract/7c0c5b6d-12d5-11e6-9464-e4de0000000c",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata",
     "type": "contract",
     "mediaType": "application/json"
   },
   "id": "7c0c5b6d-12d5-11e6-9464-e4de0000000c",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-05-05 18:27:44",
   "name": "123_456",
   "description": "New Treaty",
   "code": "not code 333",
   "externalCode": "exC22ode333",
   "archived": false,
   "moment": "2019-03-15 21:03:19",
   "sum": 0,
   "contractType": "Sales",
   "ownAgent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/contract/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "25b6f76c-12d5-11e6-9464-e4de00000068",
       "name": "AttributeName1",
       "type": "boolean",
       "value": false
     }
   ],
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078/accounts/9794f7a0-f689-11e5-8a84-bae500000079",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "printed": false,
   "published": false
}
```
