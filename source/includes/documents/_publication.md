## Publication of transactions

The JSON API allows you to publish to the public a printed form of a transaction based on a [printable template](../dictionaries/#entities-print-templates).
The entity code for publishing as part of the JSON API is the **publication** keyword.

User can publish a transaction if the user has permissions to read and print the entity of that type.

The transactions of the following types can be published: Sales Order, Sales Invoice, Sales Return, Shipment, Purchase Order, Purchase Invoice, Purchase Return, Receiving, Incoming Payment, Outgoing Payment, Internal Order, Transfer, Stock Adjustment, Write-off, Outgoing Payment, Incoming Payment, Incoming Cash Payment, Outgoing Cash Payment, Contract, Production Order, Inventory Count.


### Publications
#### Entity attributes

| Title | Type | Description |
| ------------ | ------- | -------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Post Metadata<br>`+Required when replying` |
| **template** | [Meta](../#kladana-json-api-general-info-metadata) | Print Template Metadata<br>`+Required when replying` `+Expand` |
| **href** | URL | Link to Publication page<br>`+Required when replying` |

### Get publications

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: a86708d2-f8d3-4e67-8f04-6101158da808* ID of the entity to get Publications from. |
| **type** | `string` (required) *Example: demand* the type of the entity to get the Publications from. |

> Request for a list of Publications for the specified transaction.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/demand/a86708d2-f8d3-4e67-8f04-6101158da808/publication"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Publications.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/demand/0b71daec-055e-11e6-9464-e4de0000007e/publication",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/demand/metadata",
     "type": "demand",
     "mediaType": "application/json",
     "size": 1,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/demand/0b71daec-055e-11e6-9464-e4de0000007e/publication/aec51463-bbd2-11e6-8a84-bae500000003",
         "type": "operationpublication",
         "mediaType": "application/json"
       },
       "template": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/demand/metadata/customtemplate/38d1c843-1601-11e7-8af5-581e00000009",
           "type": "customtemplate",
           "mediaType": "application/json"
         }
       },
       "href": "https://mskld.ru/73NIpnAbPr"
     }
   ]
}
```

### Publication

### Create post

Request to publish a transaction. The transaction publication is based on the passed JSON object, which must contain a link to the template for printing the transaction **template** in the [Metadata](../#kladana-json-api-general-info-metadata) format. If the publication was previously created, then the response will be with the status `200`.

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: a86708d2-f8d3-4e67-8f04-6101158da808* ID of the entity to get Publications from. |
| **type** | `string` (required) *Example: demand* the type of the entity to get the Publications from. |

> Example (application/json)

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/demand/a86708d2-f8d3-4e67-8f04-6101158da808/publication"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "template": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/demand/metadata/customtemplate/38d1c843-1601-11e7-8af5-581e00000009",
                 "type": "customtemplate",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the previously created Publication.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/demand/0b71daec-055e-11e6-9464-e4de0000007e/publication/aec51463-bbd2-11e6-8a84-bae500000003",
     "type": "operationpublication",
     "mediaType": "application/json"
   },
   "template": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/demand/metadata/customtemplate/38d1c843-1601-11e7-8af5-581e00000009",
       "type": "customtemplate",
       "mediaType": "application/json"
     }
   },
   "href": "https://mskld.ru/reu92ZrjCM"
}
```

> Response 201(application/json)
Successful request. The result is a JSON representation of the created Post.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/demand/0b71daec-055e-11e6-9464-e4de0000007e/publication/aec51463-bbd2-11e6-8a84-bae500000003",
     "type": "operationpublication",
     "mediaType": "application/json"
   },
   "template": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/demand/metadata/customtemplate/38d1c843-1601-11e7-8af5-581e00000009",
       "type": "customtemplate",
       "mediaType": "application/json"
     }
   },
   "href": "https://mskld.ru/f00HzRGx8Q"
}
```

### Delete post

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: a86708d2-f8d3-4e67-8f04-6101158da808* entity id. |
| **publicationId** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Publication id. |
| **type** | `string` (required) *Example: demand* entity type. |

> Request to delete the Publication with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/demand/a86708d2-f8d3-4e67-8f04-6101158da808/publication/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 204(application/json)
Successful deletion of the Post.

### Get publication

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: a86708d2-f8d3-4e67-8f04-6101158da808* entity id. |
| **publicationId** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Publication id. |
| **type** | `string` (required) *Example: demand* entity type. |

> Request to receive the Publication with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/demand/a86708d2-f8d3-4e67-8f04-6101158da808/publication/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Publication.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/demand/0b71daec-055e-11e6-9464-e4de0000007e/publication/aec51463-bbd2-11e6-8a84-bae500000003",
     "type": "operationpublication",
     "mediaType": "application/json"
   },
   "template": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/demand/metadata/customtemplate/38d1c843-1601-11e7-8af5-581e00000009",
       "type": "customtemplate",
       "mediaType": "application/json"
     }
   },
   "href": "https://mskld.ru/fuXrdd7Uii"
}
```
