## Sales Channel
### Sales Channels
You can use the JSON API to create and update Sales Channel information, query lists of Sales Channels, and query individual Sales Channels. The entity code for the Sales Channel in the JSON API is the **saleschannel** keyword.

This entity can be contextually searched using the special `search` parameter. [Learn more](../#kladana-json-api-general-info-context-search). The search with the search parameter differs from others in that the search is not prefixed, without tokenization, and only goes through one field at a time. Searches for strings that include the value of the search string.

The search among the objects of the sales channel for matching the search string will be carried out using the following fields:

+ by Sales Channel name **name**
+ according to Sales Channel description **description**

#### Entity attributes
| Title | Type                                               | Filtration | Description |
| -------|----------------------------------------------------| -------| ---------|
| **accountId** | UUID                                               | `=` `!=` | Account ID<br>`+Required when answering` `+Read Only` |
| **archived** | Boolean                                            | `=` `!=` | Has the Sales Channel been archived<br>`+Required when answering` |
| **code** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Sales Channel Code |
| **description** | String(4096)                                       | `=` `!=` `~` `~=` `=~` | Sales Channel Description |
| **externalCode** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Sales Channel External Code<br>`+Required when answering` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee department metadata<br>`+Required when answering` `+Expand` |
| **id** | UUID                                               | `=` `!=` | Sales Channel ID<br>`+Required when answering` `+Read Only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Sales Channel Metadata<br>`+Required when responding` |
| **name** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Sales Channel Name<br>`+Required when answering` `+Required when creating` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee) metadata<br>`+Expand` |
| **shared** | Boolean                                            | `=` `!=` | Sharing<br>`+Required when answering` |
| **type** | Enum                                               | `=` `!=` | Sales Channel Type [Learn more](../dictionaries/#entities-sales-channel-sales-channels-sales-channel-type)<br>`+Required when answering` `+Required when creating` |
| **updated** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | When the entity was last updated<br>`+Required for response` `+Read-only` |

#### Sales Channel Type
An enumeration of values representing the Sales Channel type:

| Title | Description |
| ------ | ------ |
| **Messenger** | Messenger|
| **SOCIAL_NETWORK** | Social network |
| **MARKETPLACE** | Marketplace |
| **ECOMERCE** | Online store |
| **CLASSIFIED_ADS** | Board of announcements |
| **DIRECT_SALES** | Direct sales |
| **OTHER** | Other |

#### Attributes available for filtering

| Value| Description |
| ------ | ------ |
| **accountId** | Account ID |
| **archived** | Is the Sales Channel archived |
| **description** | Sales Channel Description |
| **externalCode** | Sales Channel External Code |
| **group** | Employee department |
| **id** | Sales Channel ID |
| **name** | Sales Channel Name |
| **owner** | Link to Owner (Employee) |
| **shared** | Sharing |
| **type** | Sales Channel Type |
| **updated** | The moment when the entity was last updated |


### Get Sales Channels
Request to get a list of all Sales Channels on this account.
Result: JSON object including fields:

| Title | Type | Description |
| ------ | ------ |------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Sales Channels. |

**Parameters**

| Parameter | Description |
| ------ | ------ |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Sales Channels

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/saleschannel"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of Sales Channels.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/metadata",
     "type": "saleschannel",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/51f263f9-0307-11e6-9464-e4de0000007c",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/metadata",
         "type": "saleschannel",
         "mediaType": "application/json"
       },
       "id": "51f263f9-0307-11e6-9464-e4de0000007c",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008","owner": {
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
       "updated": "2021-04-15 15:41:05",
       "name": "Shop on Tverskaya",
       "description": "Direct sales, no pre-order",
       "type": "DIRECT_SALES",
       "externalCode": "HZV7dGc8iAnf0aNjrvQvN0",
       "archived": false
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/8477d916-0aef-11e6-9464-e4de00000103",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/metadata",
         "type": "saleschannel",
         "mediaType": "application/json"
       },
       "id": "8477d916-0aef-11e6-9464-e4de00000103",
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
       "updated": "2021-04-25 17:10:51",
       "name": "Orders from IM",
       "type": "ECOMMERCE",
       "externalCode": "lv7MmPK4jvaqq-nA3g3NL2",
       "archived": false
     }
   ]
}
```

### Create Sales Channel
Request to create a new sales channel. Required fields in the request body
to create a Sales Channel are **name** and **type**.

> An example of a request to create a new Sales Channel.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/saleschannel"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "Phone call",
             "description": "Call customer",
             "type": "OTHER"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Sales Channel.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/53d1ff92-202b-11ec-0a82-050800000007",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/metadata",
     "type": "saleschannel",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#saleschannel/edit?id=53d1ff92-202b-11ec-0a82-050800000007"
   },
   "id": "53d1ff92-202b-11ec-0a82-050800000007",
   "accountId": "4fcbb42c-1d41-11ec-0a82-06530000009e",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/4fe1932a-1d41-11ec-0a81-04b600001980",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#employee/edit?id=4fe1932a-1d41-11ec-0a81-04b600001980"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/4fcbe1f2-1d41-11ec-0a82-06530000009f",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2021-09-28 10:11:40.322",
   "name": "Phone call",
   "description":"Call customer",
   "type":"OTHER",
   "externalCode": "mZ9phAmxjBs5OgEvelcw20",
   "archived": false
}
```


### Bulk creation and update of Sales Channels
[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) Sales Channels.
In the body of the request, you need to pass an array containing the JSON representation of the Sales Channels that you want to create or update.
Updated Sales Channels must contain the identifier in the form of metadata. For Sales Channels created when connecting an online store, you cannot update the type. If you change the name of such sales channels, the name of the associated online store will change.

> Example of creating and updating multiple Sales Channels

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/saleschannel"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type:application/json"
       -d'[
             {
               "name":"Promotion",
               "description":"Creating a sales channel",
               "type":"OTHER"
             },
             {
               "meta": {
                 "href":"https://api.kladana.com/api/remap/1.2/entity/saleschannel/da7a89fd-202b-11ec-0a82-05080000000a",
                 "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/saleschannel/metadata",
                 "type":"saleschannel",
                 "mediaType":"application/json"
               },
               "description":"Update sales channel description"
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Sales Channels.

```json
[
   {
     "meta": {
       "href":"https://api.kladana.com/api/remap/1.2/entity/saleschannel/286e7bd0-2032-11ec-9621-0242ac130002",
       "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/saleschannel/metadata",
       "type":"saleschannel",
       "mediaType":"application/json",
       "uuidHref":"https://app.kladana.com/app/#saleschannel/edit?id=286e7bd0-2032-11ec-9621-0242ac130002"
     },
     "id":"286e7bd0-2032-11ec-9621-0242ac130002",
     "accountId":"4fcbb42c-1d41-11ec-0a82-06530000009e",
     "owner": {
       "meta": {
         "href":"https://api.kladana.com/api/remap/1.2/entity/employee/6c771d3c-2032-11ec-9621-0242ac130002",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
         "type":"employee",
         "mediaType":"application/json",
         "uuidHref":"https://app.kladana.com/app/#employee/edit?id=6c771d3c-2032-11ec-9621-0242ac130002"
       }
     },
     "shared": true,
     "group": {
       "meta": {
         "href":"https://api.kladana.com/api/remap/1.2/entity/group/537bb8ec-2032-11ec-9621-0242ac130002",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/group/metadata",
         "type":"group",
         "mediaType":"application/json"
       }
     },
     "updated":"2021-09-28 10:49:04.228",
     "name":"Promotion",
     "description":"Creating a sales channel",
     "type":"OTHER",
     "externalCode":"814fhsaf124",
     "archived": false
   },
   {
     "meta": {
       "href":"https://api.kladana.com/api/remap/1.2/entity/saleschannel/5ca09f14-2032-11ec-9621-0242ac130002",
       "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/saleschannel/metadata",
       "type":"saleschannel",
       "mediaType":"application/json",
       "uuidHref":"https://app.kladana.com/app/#saleschannel/edit?id=5ca09f14-2032-11ec-9621-0242ac130002"
     },
     "id":"5ca09f14-2032-11ec-9621-0242ac130002",
     "accountId":"4fcbb42c-1d41-11ec-0a82-06530000009e",
     "owner": {
       "meta": {
         "href":"https://api.kladana.com/api/remap/1.2/entity/employee/6c771d3c-2032-11ec-9621-0242ac130002",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
         "type":"employee",
         "mediaType":"application/json",
         "uuidHref":"https://app.kladana.com/app/#employee/edit?id=6c771d3c-2032-11ec-9621-0242ac130002"
       }
     },
     "shared": true,
     "group": {
       "meta": {
         "href":"https://api.kladana.com/api/remap/1.2/entity/group/537bb8ec-2032-11ec-9621-0242ac130002",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/group/metadata",
         "type":"group",
         "mediaType":"application/json"
       }
     },
     "updated":"2021-09-28 10:49:04.313",
     "name":"Call",
     "description":"Update sales channel description",
     "type":"DIRECT_SALES",
     "externalCode":"df2DGFSG44",
     "archived": false
   }
]
```

### Delete Sales Channel

**Parameters**

| Parameter | Description |
| ------ | ------ |
| **id** | `string` (required) *Example: d94605a8-2033-11ec-9621-0242ac130002* Sales channel id. |

> Request to delete the Sales Channel with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/saleschannel/d94605a8-2033-11ec-9621-0242ac130002"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of Sales Channel.

### Bulk deletion of Sales Channels

In the body of the request, you need to pass an array containing the JSON metadata of the Sales Channels that you want to remove.


> Bulk delete request for Sales Channels.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/saleschannel/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/fe8188dc-2034-11ec-9621-0242ac130002",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/metadata",
                  "type": "saleschannel",
                  "mediaType": "application/json"
              }
          },
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/0657ff6e-2035-11ec-9621-0242ac130002",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/metadata",
                  "type": "saleschannel",
                  "mediaType": "application/json"
              }
          }
      ]'
```

> Successful request. The result is JSON information about deleting Sales Channels.

```json
[
   {
     "info":"Entity 'saleschannel' with UUID: fe8188dc-2034-11ec-9621-0242ac130002 successfully deleted"
   },
   {
     "info":"Entity 'saleschannel' with UUID: 0657ff6e-2035-11ec-9621-0242ac130002 successfully deleted"
   }
]
```

### Sales Channel

**Parameters**

| Parameter | Description |
| ------ | ------ |
| **id** | `string` (required) *Example: d94605a8-2033-11ec-9621-0242ac130002* Sales Channel id. |

### Get Sales Channel
> Request to get a separate Sales Channel with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/saleschannel/d94605a8-2033-11ec-9621-0242ac130002"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Sales Channel.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/08624a82-2038-11ec-9621-0242ac130002",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/metadata",
     "type": "saleschannel",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#saleschannel/edit?id=08624a82-2038-11ec-9621-0242ac130002"
   },
   "id": "08624a82-2038-11ec-9621-0242ac130002",
   "accountId": "4fcbb42c-1d41-11ec-0a82-06530000009e",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/4fe1932a-1d41-11ec-0a81-04b600001980",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#employee/edit?id=4fe1932a-1d41-11ec-0a81-04b600001980"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/4fcbe1f2-1d41-11ec-0a82-06530000009f",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2021-09-28 10:49:04.228",
   "name": "Shop Sale",
   "type": "DIRECT_SALES",
   "externalCode": "814fhsafiwb124",
   "archived": false
}
```

### Change Sales Channel
Request to change the Sales Channel object. For Sales Channels that were created when connecting an online store, you cannot change the type. If you change the name of such a Sales Channel, the name of the associated online store will be changed.

**Parameters**

| Parameter | Description |
| ------ | ------ |
| **id** | `string` (required) *Example: b2dc42f0-203e-11ec-9621-0242ac130002* Sales Channel id. |

> Sample request to update an existing Sales Channel.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/saleschannel/b2dc42f0-203e-11ec-9621-0242ac130002"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "CommerceML Exchange"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Sales Channel.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/08624a82-2038-11ec-9621-0242ac130002",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/metadata",
     "type": "saleschannel",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#saleschannel/edit?id=08624a82-2038-11ec-9621-0242ac130002"
   },
   "id": "08624a82-2038-11ec-9621-0242ac130002",
   "accountId": "4fcbb42c-1d41-11ec-0a82-06530000009e",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/4fe1932a-1d41-11ec-0a81-04b600001980",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#employee/edit?id=4fe1932a-1d41-11ec-0a81-04b600001980"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/4fcbe1f2-1d41-11ec-0a82-06530000009f",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2021-09-28 10:49:04.228",
   "name": "Comme ExchangerceML",
   "type": "ECOMMERCE",
   "externalCode": "814fhsafiwb124",
   "archived": false
}
```
