## Characteristics of variants

Using the json api, you can add new variant characteristics.

### Variant characteristics
#### Entity attributes

| Title | Type | Description |
| ---------|--------|--------|
| **id** | UUID | ID of the corresponding Feature<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Feature metadata<br>`+Required for response` `+Read-only` |
| **name** | String(255) | Name Characteristics<br>`+Required when answering` `+Required when creating` |
| **required** | Boolean | Mandatory specification of Characteristics in the variant, always set to false<br>`+Required when answering` `+Read-only` |
| **type** | String(255) | Value type Characteristics, always has the value string<br>`+Required for response` `+Read-only` |

You can view lists of existing characteristics in the context of metadata
variants, for example by making a GET request to the URL https://api.kladana.com/api/remap/1.2/entity/variant/metadata or https://api.kladana.com/api/remap/1.2/entity/variant/ metadata/characteristics
The list of variant characteristics will be displayed in the characteristics collection.

### Get metadata

> Get metadata and including Characteristics

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/variant/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/variant",
     "mediaType": "application/json"
   },
   "characteristics": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/4f70c518-60a1-11e7-6adb-ede500000003",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "4f70c518-60a1-11e7-6adb-ede500000003",
       "name": "Size",
       "type": "string",
       "required": false
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/3b6eb61a-60c5-11e7-6adb-ede500000001",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "3b6eb61a-60c5-11e7-6adb-ede500000001",
       "name": "Color",
       "type": "string",
       "required": false
     }
   ]
}
```

### Create feature
Create a new feature.

#### Description
The characteristic is created based on the passed JSON object,
which contains the representation of the new Feature.
The result is a JSON representation of the generated Feature. To create a new Feature,
it is necessary and sufficient to specify a non-empty `name` field in the passed object.
The user on whose behalf the request is made must have the rights to edit products.

> Creation of one characteristic.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "Size"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Feature.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/6262b270-60c3-11e7-6adb-ede50000000d",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "6262b270-60c3-11e7-6adb-ede50000000d",
   "name": "Size",
   "type": "string",
   "required": false
}
```

### Bulk Creation of Characteristics

[Bulk Creation](../#kladana-json-api-general-info-create-and-update-multiple-objects) In the body of the request, you need to pass an array containing the JSON representation of the Features you want to create.

> Example of creating multiple Characteristics

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "Size"
             },
             {
               "name": "Color"
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the generated Features.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/b55d2ddf-60c3-11e7-6adb-ede500000010",
       "type": "attributemetadata",
       "mediaType": "application/json"
     },
     "id": "b55d2ddf-60c3-11e7-6adb-ede500000010",
     "name": "Size",
     "type": "string",
     "required": false
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/b56215dc-60c3-11e7-6adb-ede500000013",
       "type": "attributemetadata",
       "mediaType": "application/json"
     },
     "id": "b56215dc-60c3-11e7-6adb-ede500000013",
     "name": "Color",
     "type": "string",
     "required": false
   }
]
```

### Feature

### Get Feature

**Parameters**

| Parameter | Description |
| ------- | ------------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id Features. |

> Request for a separate Feature with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/b55d2ddf-60c3-11e7-6adb-ede500000010"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Feature.

```json
{
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/b55d2ddf-60c3-11e7-6adb-ede500000010",
       "type": "attributemetadata",
       "mediaType": "application/json"
     },
     "id": "b55d2ddf-60c3-11e7-6adb-ede500000010",
     "name": "Size",
     "type": "string",
     "required": false
}
```
