## Image
### Images
Using the JSON API, you can create and update information on Images for Products, Bundles and Product Variants, request lists of Images,
as well as information on individual Images.

Products, Bundles and Product Variants may contain multiple identical Images. Images are considered the same if when adding Images
they had the same `filename` and `content`. Identical Images have the same `id` parameter value.
A Product, Bundle or Product Variant can have no more than 10 Images.

#### Entity attributes

| Title | Type                                               | Description |
| ---------|----------------------------------------------------| ----------|
| **filename** | String(255)                                        | File name<br>`+Required when answering` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when answering` |
| **miniature** | [Meta](../#kladana-json-api-general-info-metadata) | Image thumbnail metadata<br>`+Required when answering` |
| **size** | Int                                                | File size in bytes<br>`+Required when answering` |
| **tiny** | [Meta](../#kladana-json-api-general-info-metadata) | Thumbnail metadata<br>`+Required when answering` |
| **title** | String(255)                                        | Image Title<br>`+Required when answering` |
| **updated** | DateTime                                           | File upload time to server<br>`+Required when answering` |

### Get a list of Product, Product Variant and Bundle Images
Request to receive all images of a product, product variant or bundle for this account.
Result: JSON object including fields:

| Title | Type | Description |
| ---------| -----| ----------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing [Images](../dictionaries/#entities-image). |


**Parameters**

| Parameter | Description |
| ---------| ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product ID with Images. |

> Get a list of Images for a Product

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```
> Response 200(application/json)
Successful request. The result is an array of all Product Images.

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
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images",
         "type": "image",
         "mediaType": "application/json",
         "size": 2,
         "limit": 1000,
         "offset": 0
     },
     "rows": [
         {
             "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/f2728180-6afd-4d37-8a13-f3b48069bbb6",
                 "type": "image",
                 "mediaType": "application/json",
                 "downloadHref": "https://api.kladana.com/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6"
             },
             "title": "bird image",
             "filename": "birdimage.png",
             "size": 14052,
             "updated": "2019-01-24 16:55:24.567",
             "miniature": {
                 "href": "https://api.kladana.com/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6?miniature=true",
                 "type": "image",
                 "mediaType": "image/png",
                 "downloadHref": "https://miniature-prod.kladana.com/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
             },
             "tiny": {
                 "href": "https://api.kladana.com/static/tinyimage/f2aab4d2-1fd3-11e9-ac12-000800000001/tinyimage/ebb10350-0272-45db-9d33-ca5a01fd5543/t.png",
                 "type": "image",
                 "mediaType": "image/png"
             }
         },
         {
             "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/933e41ac-1946-4bf0-9b21-51f2051f3e9f",
                 "type": "image",
                 "mediaType": "application/json",
                 "downloadHref": "https://api.kladana.com/api/remap/1.2/download/933e41ac-1946-4bf0-9b21-51f2051f3e9f"
             },
             "title": "birdimage1",
             "filename": "birdimage1.png",
             "size": 14052,
             "updated": "2019-01-24 16:55:25.047",
             "miniature": {
                 "href": "https://api.kladana.com/api/remap/1.2/download/933e41ac-1946-4bf0-9b21-51f2051f3e9f?miniature=true",
                 "type": "image",
                 "mediaType": "image/png",
                 "downloadHref": "https://miniature-prod.kladana.com/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
             },
             "tiny": {
                 "href": "https://api.kladana.com/static/tinyimage/f2aab4d2-1fd3-11e9-ac12-000800000001/tinyimage/c960c879-8128-4511-addf-b933f37dc0d4/t.png",
                 "type": "image",
                 "mediaType": "image/png"
             }
         }
     ]
}
```

### Get a link to the Image of Product, Product Variant, Bundle

You can get a link to download the image by contacting the address specified in the `downloadHref` field at the image meta.

> Get a link to the Product Image

```shell
curl -X GET
  "https://app.kladana.com/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```
> Response 302 (application/json)
Successful request. Result is empty JSON.

```json
```

The link to download the image is in the `location` header. You can get the image from the link without authorization.
The link is active for 5 minutes.


### Add Image to Product, Product Variant, Bundle
Add a new image to a product, product variant, or bundle.

#### Description
The Image is loaded and added to the Images based on the passed JSON object,
which contains a representation of the new Image.
The result is a JSON representation of the updated list of Images. To create and add a new Image to a Product, Product Variant, Bundle it is necessary and sufficient to indicate in the url request the `id` of the entity to which the Image is added, and specify non-empty fields `filename` and `content` in the passed object.

In the `content` field, you need to specify an image encoded in Base64, in the `filename` field - the file name with the extension.


**Parameters**

| Parameter | Description |
| ---------| ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product ID with Images. |

> Example of adding an Image to a Product
  
```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
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
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/f2728180-6afd-4d37-8a13-f3b48069bbb6",
           "type": "image",
           "mediaType": "application/json",
           "downloadHref": "https://api.kladana.com/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6"
       },
       "title": "bird image",
       "filename": "birdimage.png",
       "size": 14052,
       "updated": "2019-01-24 16:55:24.567",
       "miniature": {
           "href": "https://api.kladana.com/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6?miniature=true",
           "type": "image",
           "mediaType": "image/png",
           "downloadHref": "https://miniature-prod.kladana.com/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
       },
       "tiny": {
           "href": "https://api.kladana.com/static/tinyimage/f2aab4d2-1fd3-11e9-ac12-000800000001/tinyimage/ebb10350-0272-45db-9d33-ca5a01fd5543/t.png",
           "type": "image",
           "mediaType": "image/png"
       }
   },
   {
       "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/933e41ac-1946-4bf0-9b21-51f2051f3e9f",
           "type": "image",
           "mediaType": "application/json",
           "downloadHref": "https://api.kladana.com/api/remap/1.2/download/933e41ac-1946-4bf0-9b21-51f2051f3e9f"
       },
       "title": "birdimageNew",
       "filename": "birdimageNew.png",
       "size": 16,
       "updated": "2019-01-24 16:55:25.047",
       "miniature": {
           "href": "https://api.kladana.com/api/remap/1.2/download/933e41ac-1946-4bf0-9b21-51f2051f3e9f?miniature=true",
           "type": "image",
           "mediaType": "image/png",
           "downloadHref": "https://miniature-prod.kladana.com/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
       },
       "tiny": {
           "href": "https://api.kladana.com/static/tinyimage/f2aab4d2-1fd3-11e9-ac12-000800000001/tinyimage/c960c879-8128-4511-addf-b933f37dc0d4/t.png",
           "type": "image",
           "mediaType": "image/png"
       }
   }
]
```

### Changing the list of Images for a Product, Product Variant, Bundle

In the body of the request, you need to pass an array containing the JSON representation of the Images that you want to set for the Product, Product Variant, or Bundle.
If it is necessary to leave some Images for the Product, Product Variant, or Bundle, then the request body must contain their identifiers in the form of metadata.


**Parameters**

| Parameter | Description |
| ---------| ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product ID with Images. |

> An example of changing the list of Images for a Product

```shell
curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
     -d'[
           {
             "meta": {
               "href":"https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/f2728180-6afd-4d37-8a13-f3b48069bbb6",
               "type":"image",
               "mediaType":"application/json",
               "downloadHref":"https://api.kladana.com/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6"
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
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/f2728180-6afd-4d37-8a13-f3b48069bbb6",
           "type": "image",
           "mediaType": "application/json",
           "downloadHref": "https://api.kladana.com/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6"
       },
       "title": "bird image",
       "filename": "birdimage.png",
       "size": 14052,
       "updated": "2019-01-24 16:55:24.567",
       "miniature": {
           "href": "https://api.kladana.com/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6?miniature=true",
           "type": "image",
           "mediaType": "image/png",
           "downloadHref": "https://miniature-prod.kladana.com/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
       },
       "tiny": {
           "href": "https://api.kladana.com/static/tinyimage/f2aab4d2-1fd3-11e9-ac12-000800000001/tinyimage/ebb10350-0272-45db-9d33-ca5a01fd5543/t.png",
           "type": "image",
           "mediaType": "image/png"
       }
   },
   {
       "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/933e41ac-1946-4bf0-9b21-51f2051f3e9f",
           "type": "image",
           "mediaType": "application/json",
           "downloadHref": "https://api.kladana.com/api/remap/1.2/download/933e41ac-1946-4bf0-9b21-51f2051f3e9f"
       },
       "title": "birdimageNew",
       "filename": "birdimageNew.png",
       "size": 16,
       "updated": "2019-01-24 16:55:25.047",
       "miniature": {
           "href": "https://api.kladana.com/api/remap/1.2/download/933e41ac-1946-4bf0-9b21-51f2051f3e9f?miniature=true",
           "type": "image",
           "mediaType": "image/png",
           "downloadHref": "https://miniature-prod.kladana.com/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
       },
       "tiny": {
           "href": "https://api.kladana.com/static/tinyimage/f2aab4d2-1fd3-11e9-ac12-000800000001/tinyimage/c960c879-8128-4511-addf-b933f37dc0d4/t.png",
           "type": "image",
           "mediaType": "image/png"
       }
   }
]
```

### Delete Image

When deleting an image, the first image found with the given identifier is deleted from the Product, Product Variant or Bundle.


**Parameters**

| Parameter | Description |
| ---------| ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product ID with Images. |
| **idImage** | `string` (required) *Example: 19f1edc0-fc42-4001-94cb-c9ec9c62ec10* Image ID. |

> Request to remove the Image from the Product.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/19f1edc0-fc42-4001-94cb-c9ec9c62ec10"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```
> Response 200(application/json)
Successful deletion of the Image.

### Delete group of Images

When deleting several images for a Product, Product Variant, or Bundle, the first images found by `id` specified in the request body are deleted.


**Parameters**

| Parameter | Description |
| ---------| ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product ID with Images. |

> Multiple Image Deletion Request

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
         -d'[
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/1aadd77f-90f9-4be6-bede-373f350b0e03",
                        "type": "image",
                        "mediaType": "application/json",
                        "downloadHref": "https://api.kladana.com/api/remap/1.2/download/1aadd77f-90f9-4be6-bede-373f350b0e03"
                    }
                },
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/images/f6aaab17-65a0-4425-841b-277aeef5b089",
                        "type": "image",
                        "mediaType": "application/json",
                        "downloadHref": "https://api.kladana.com/api/remap/1.2/download/f6aaab17-65a0-4425-841b-277aeef5b089"
                    }
                }
            ]'
```
> Response 200(application/json)
Successful deletion of Images.
