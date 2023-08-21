## Image
### Images
Using the JSON API, you can create and update information on Images for Products, Bundles and Modifications, request lists of Images,
as well as information on individual Images.

Products, Bundles and Modifications may contain multiple identical Images. Images are considered the same if when adding Images
they had the same `filename` and `content`. Identical Images have the same `id` parameter value.
A Product, Bundle or Modification can have no more than 10 Images.

#### Entity attributes

| Title | Type                                               | Description |
| ---------|----------------------------------------------------| ----------|
| **filename** | String(255)                                        | File name<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **miniature** | [Meta](../#kladana-json-api-general-info-metadata) | Image thumbnail metadata<br>`+Required when replying` |
| **size** | Int                                                | File size in bytes<br>`+Required when replying` |
| **tiny** | [Meta](../#kladana-json-api-general-info-metadata) | Thumbnail metadata<br>`+Required when replying` |
| **title** | String(255)                                        | Image Title<br>`+Required when replying` |
| **updated** | DateTime                                           | File upload time to server<br>`+Required when replying` |

### Get a list of Product Images, Bundle and Modifications
Request to receive all Images of a Product, Bundle or Modification for this account.
Result: JSON object including fields:

| Title | Type | Description |
| ---------| -----| ----------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing [Images](../dictionaries/#entities-izobrazhenie). |


**Parameters**

| Parameter | Description |
| ---------| ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product id with Images. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get a list of Images for a Product

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images"
   -H "Authorization: Basic <Credentials>"
```
> Response 200(application/json)
Successful request. The result is an array of all Product Images.

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
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images",
         "type": "image",
         "mediaType": "application/json",
         "size": 2,
         "limit": 1000,
         "offset": 0
     },
     "rows": [
         {
             "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/f2728180-6afd-4d37-8a13-f3b48069bbb6",
                 "type": "image",
                 "mediaType": "application/json",
                 "downloadHref": "https://app.kladana.in/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6"
             },
             "title": "bird image",
             "filename": "birdimage.png",
             "size": 14052,
             "updated": "2019-01-24 16:55:24.567",
             "miniature": {
                 "href": "https://app.kladana.in/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6?miniature=true",
                 "type": "image",
                 "mediaType": "image/png",
                 "downloadHref": "https://miniature-prod.kladana.in/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
             },
             "tiny": {"href": "https://app.kladana.in/static/tinyimage/f2aab4d2-1fd3-11e9-ac12-000800000001/tinyimage/ebb10350-0272-45db-9d33-ca5a01fd5543/t.png",
                 "type": "image",
                 "mediaType": "image/png"
             }
         },
         {
             "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/933e41ac-1946-4bf0-9b21-51f2051f3e9f",
                 "type": "image",
                 "mediaType": "application/json",
                 "downloadHref": "https://app.kladana.in/api/remap/1.2/download/933e41ac-1946-4bf0-9b21-51f2051f3e9f"
             },
             "title": "birdimage1",
             "filename": "birdimage1.png",
             "size": 14052,
             "updated": "2019-01-24 16:55:25.047",
             "miniature": {
                 "href": "https://app.kladana.in/api/remap/1.2/download/933e41ac-1946-4bf0-9b21-51f2051f3e9f?miniature=true",
                 "type": "image",
                 "mediaType": "image/png",
                 "downloadHref": "https://miniature-prod.kladana.in/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
             },
             "tiny": {
                 "href": "https://app.kladana.in/static/tinyimage/f2aab4d2-1fd3-11e9-ac12-000800000001/tinyimage/c960c879-8128-4511-addf-b933f37dc0d4/t.png",
                 "type": "image",
                 "mediaType": "image/png"
             }
         }
     ]
}
```

### Add Image to Product, Bundle or Modification
Add a new Image to a Product, Bundle or Modification.

#### Description
The Image is loaded and added to the Images based on the passed JSON object,
which contains a representation of the new Image.
The result is a JSON representation of the updated list of Images. To create and add a new Image to a Product, Bundle or Modification,
it is necessary and sufficient to indicate in the url request the `id` of the entity to which the Image is added, and specify non-empty fields
`filename` and `content` in the passed object.

In the `content` field, you need to specify an image encoded in Base64, in the `filename` field - the file name with the extension.


**Parameters**

| Parameter | Description |
| ---------| ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product id with Images. |

> Example of adding an Image to a Product
  
```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
     -d '{
             "filename": "birdimageNew.png",
             "content": "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAAA3NCSVQICAjb4U/gAAAAAEHRFWHRTb2Z0d2FyZQBTaHV0dGVyY4LQCQAAAAxJREFUCNdj+PePAQAE+gH90KA5ZAAAAABJRU5ErkJggg=="
          }'
```

> Response 200(application/json)
Successful request. The result is an array of all Product Images.

```json
[
   {
       "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/f2728180-6afd-4d37-8a13-f3b48069bbb6",
           "type": "image",
           "mediaType": "application/json",
           "downloadHref": "https://app.kladana.in/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6"
       },
       "title": "bird image",
       "filename": "birdimage.png",
       "size": 14052,
       "updated": "2019-01-24 16:55:24.567",
       "miniature": {
           "href": "https://app.kladana.in/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6?miniature=true",
           "type": "image",
           "mediaType": "image/png",
           "downloadHref": "https://miniature-prod.kladana.in/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
       },
       "tiny": {
           "href": "https://app.kladana.in/static/tinyimage/f2aab4d2-1fd3-11e9-ac12-000800000001/tinyimage/ebb10350-0272-45db-9d33-ca5a01fd5543/t.png",
           "type": "image",
           "mediaType": "image/png"
       }
   },
   {
       "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/933e41ac-1946-4bf0-9b21-51f2051f3e9f",
           "type": "image",
           "mediaType": "application/json",
           "downloadHref": "https://app.kladana.in/api/remap/1.2/download/933e41ac-1946-4bf0-9b21-51f2051f3e9f"
       },
       "title": "birdimageNew",
       "filename": "birdimageNew.png",
       "size": 16,
       "updated": "2019-01-24 16:55:25.047",
       "miniature": {
           "href": "https://app.kladana.in/api/remap/1.2/download/933e41ac-1946-4bf0-9b21-51f2051f3e9f?miniature=true",
           "type": "image",
           "mediaType": "image/png",
           "downloadHref": "https://miniature-prod.kladana.in/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
       },
       "tiny": {
           "href": "https://app.kladana.in/static/tinyimage/f2aab4d2-1fd3-11e9-ac12-000800000001/tinyimage/c960c879-8128-4511-addf-b933f37dc0d4/t.png",
           "type": "image",
           "mediaType": "image/png"
       }
   }
]
```

### Changing the list of Images for a Product, Bundle or Modification

In the body of the request, you need to pass an array containing the JSON representation of the Images that you want to set for the Product, Bundle or Modification.
If it is necessary to leave some Images for the Product, Bundle or Modification, then the request body must contain their identifiers in the form of metadata.


**Parameters**

| Parameter | Description |
| ---------| ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product id with Images. |

> An example of changing the list of Images for a Product

```shell
curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
     -d'[
           {
             "meta": {
               "href":"https://app.kladana.in/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/f2728180-6afd-4d37-8a13-f3b48069bbb6",
               "type":"image",
               "mediaType":"application/json",
               "downloadHref":"https://app.kladana.in/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6"
             }
           },
           {
             "filename":"birdimageNew.png",
             "content": "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAAA3NCSVQICAjb4U/gAAAAEHRFWHRTb2Z0d2FyZQBTaHV0dGVyY4LQCQAAAAxJREFUCNdj+PePAQAE+gH90KA5ZAAAAABJRU5ErkJggg=="
           }
        ]'
```

> Response 200(application/json)
Successful request. The result is a modified array of all Product Images.

```json
[
   {
       "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/f2728180-6afd-4d37-8a13-f3b48069bbb6",
           "type": "image",
           "mediaType": "application/json",
           "downloadHref": "https://app.kladana.in/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6"
       },
       "title": "bird image",
       "filename": "birdimage.png",
       "size": 14052,
       "updated": "2019-01-24 16:55:24.567",
       "miniature": {
           "href": "https://app.kladana.in/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6?miniature=true",
           "type": "image",
           "mediaType": "image/png",
           "downloadHref": "https://miniature-prod.kladana.in/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
       },
       "tiny": {
           "href": "https://app.kladana.in/static/tinyimage/f2aab4d2-1fd3-11e9-ac12-000800000001/tinyimage/ebb10350-0272-45db-9d33-ca5a01fd5543/t.png",
           "type": "image",
           "mediaType": "image/png"
       }
   },
   {
       "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/933e41ac-1946-4bf0-9b21-51f2051f3e9f",
           "type": "image",
           "mediaType": "application/json",
           "downloadHref": "https://app.kladana.in/api/remap/1.2/download/933e41ac-1946-4bf0-9b21-51f2051f3e9f"
       },
       "title": "birdimageNew",
       "filename": "birdimageNew.png",
       "size": 16,
       "updated": "2019-01-24 16:55:25.047",
       "miniature": {
           "href": "https://app.kladana.in/api/remap/1.2/download/933e41ac-1946-4bf0-9b21-51f2051f3e9f?miniature=true",
           "type": "image",
           "mediaType": "image/png",
           "downloadHref": "https://miniature-prod.kladana.in/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
       },
       "tiny": {
           "href": "https://app.kladana.in/static/tinyimage/f2aab4d2-1fd3-11e9-ac12-000800000001/tinyimage/c960c879-8128-4511-addf-b933f37dc0d4/t.png",
           "type": "image",
           "mediaType": "image/png"
       }
   }
]
```

### Delete Image

When deleting an image, the first image found with the given identifier is deleted from the Product, Bundle or Modification.


**Parameters**

| Parameter | Description |
| ---------| ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product id with Images. |
| **idImage** | `string` (required) *Example: 19f1edc0-fc42-4001-94cb-c9ec9c62ec10* id of images. |

> Request to remove the Image from the Product.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/19f1edc0-fc42-4001-94cb-c9ec9c62ec10"
   -H "Authorization: Basic <Credentials>"
```
> Response 200(application/json)
Successful deletion of the Image.

### Delete group of Images

When deleting several images for a Product, Kit or Modification, the first images found by `id` specified in the request body are deleted.


**Parameters**

| Parameter | Description |
| ---------| ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product id with Images. |

> Multiple Image Deletion Request

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
         -d'[
                {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/1aadd77f-90f9-4be6-bede-373f350b0e03",
                        "type": "image",
                        "mediaType": "application/json",
                        "downloadHref": "https://app.kladana.in/api/remap/1.2/download/1aadd77f-90f9-4be6-bede-373f350b0e03"
                    }
                },
                {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/f6aaab17-65a0-4425-841b-277aeef5b089",
                        "type": "image",
                        "mediaType": "application/json",
                        "downloadHref": "https://app.kladana.in/api/remap/1.2/download/f6aaab17-65a0-4425-841b-277aeef5b089"
                    }
                }
            ]'
```
> Response 200(application/json)
Successful deletion of Images.
