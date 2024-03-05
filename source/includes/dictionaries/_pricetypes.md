## Price type
### Price types

Using the JSON API, you can create and update information about Price Types, request lists of Price Types and information on individual Price Types by id.
The entity code for the Price Type in the JSON API is the **pricetype** keyword.

#### Entity attributes

| Title| Type| description |
| ---------| -----| ----------|
| **externalCode** | String(255) | Price Type External Code<br>`+Required when replying` |
| **id** | UUID | Price type ID<br>`+Required for response` `+Read only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Price Type Metadata<br>`+Required when Response` `+Read Only` |
| **name** | String(255) | Price Type Name<br>`+Required when replying` `+Required when creating` |

### Get a list of all price types
 
> Get a list of all price types

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/context/companysettings/pricetype"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is an array of all price types

```json
[
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/context/companysettings/pricetype/a8967d6b-b026-11e7-9464-d04800000000",
       "type": "pricetype",
       "mediaType": "application/json"
     },
     "id": "a8967d6b-b026-11e7-9464-d04800000000",
     "name": "Sale price",
     "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
   },
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/context/companysettings/pricetype/5fc65f53-a470-11e7-9464-d04800000035",
       "type": "pricetype",
       "mediaType": "application/json"
     },
     "id": "5fc65f53-a470-11e7-9464-d04800000035",
     "name": "Price for friends",
     "externalCode": "3ea345e3-b56c-457a-bc77-3658546eb2bf"
   }
]
```
        
### Editing the list of price types

Price types can only be edited as a complete list.

+ To create a new price type, you must pass an existing list of price types and a new object,
containing the name of the new price type.
+ To update an existing price type, you must pass the meta of this price type, as well as the new name.
+ To remove the price type, you need to exclude the object from the transferred list.
+ When you save a list of price types, the order in which they appear is also saved.
+ The price type specified as the first item in the list becomes the default price type.

Restrictions:

+ You cannot create more than 100 price types.
+ You cannot delete all types of prices.
+ When creating a new price type, the name must be unique.
+ When creating a new type, the name must not be empty or missing.
+ External code cannot be deleted. Passing an empty string when editing a price type will generate a random external code.

> An example of creating a new price type.

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/context/companysettings/pricetype"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
     -d'[
           {
             "meta": {
               "href": "https://api.kladana.in/api/remap/1.2/context/companysettings/pricetype/a8967d6b-b026-11e7-9464-d04800000000",
               "type": "pricetype",
               "mediaType": "application/json"
             },
             "id": "a8967d6b-b026-11e7-9464-d04800000000",
             "name": "Sale price",
             "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
           },
           {
             "name": "Price for friends",
             "externalCode": "3ea345e3-b56c-457a-bc77-3658546eb2bf"
           }
         ]'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated list of price types.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/context/companysettings/pricetype/a8967d6b-b026-11e7-9464-d04800000000",
       "type": "pricetype",
       "mediaType": "application/json"
     },
     "id": "a8967d6b-b026-11e7-9464-d04800000000",
     "name": "Sale price",
     "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
   },
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/context/companysettings/pricetype/5fc65f53-a470-11e7-9464-d04800000035",
       "type": "pricetype",
       "mediaType": "application/json"
     },
     "id": "5fc65f53-a470-11e7-9464-d04800000035",
     "name": "Price for friends",
     "externalCode": "3ea345e3-b56c-457a-bc77-3658546eb2bf"
   }
]
```

> An example of updating an existing list.

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/context/companysettings/pricetype"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
     -d'[
           {
             "meta": {
               "href": "https://api.kladana.in/api/remap/1.2/context/companysettings/pricetype/a8967d6b-b026-11e7-9464-d04800000000",
               "type": "pricetype",
               "mediaType": "application/json"
             },
             "id": "a8967d6b-b026-11e7-9464-d04800000000",
             "name": "Sale price",
             "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
           },
           {
             "meta": {
               "href": "https://api.kladana.in/api/remap/1.2/context/companysettings/pricetype/5fc65f53-a470-11e7-9464-d04800000035",
               "type": "pricetype",
               "mediaType": "application/json"
             },
             "id": "5fc65f53-a470-11e7-9464-d04800000035",
             "name": "Price for friends",
             "externalCode": "3ea345e3-b56c-457a-bc77-3658546eb2bf"
           }
         ]'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated list of price types.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/context/companysettings/pricetype/a8967d6b-b026-11e7-9464-d04800000000",
       "type": "pricetype",
       "mediaType": "application/json"
     },
     "id": "a8967d6b-b026-11e7-9464-d04800000000",
     "name": "Sale price",
     "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
   },
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/context/companysettings/pricetype/5fc65f53-a470-11e7-9464-d04800000035",
       "type": "pricetype",
       "mediaType": "application/json"
     },
     "id": "5fc65f53-a470-11e7-9464-d04800000035",
     "name": "Price for friends",
     "externalCode": "3ea345e3-b56c-457a-bc77-3658546eb2bf"
   }
]
```

### Get price type by ID

**Parameters**

| Parameter | Description|
| ---------| ---------|
| **id** | `string` (required) *Example: a8967d6b-b026-11e7-9464-d04800000000* price type ID |

> Get price type by ID

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/context/companysettings/pricetype/a8967d6b-b026-11e7-9464-d04800000000"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is an updated price type.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/context/companysettings/pricetype/a8967d6b-b026-11e7-9464-d04800000000",
     "type": "pricetype",
     "mediaType": "application/json"
   },
   "id": "a8967d6b-b026-11e7-9464-d04800000000",
   "name": "Sale price",
   "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
}
```

### Get the default price type
 
> Get default price type

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/context/companysettings/pricetype/default"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is the default price type.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/context/companysettings/pricetype/a8967d6b-b026-11e7-9464-d04800000000",
     "type": "pricetype",
     "mediaType": "application/json"
   },
   "id": "a8967d6b-b026-11e7-9464-d04800000000",
   "name": "Sale price",
   "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
}
```
