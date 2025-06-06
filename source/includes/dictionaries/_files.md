## Files

### Working with Files within individual Operations, Items, Tasks or Counterparties
When creating and updating an Operation, Item, Task, or Account, you can specify the files field with a list of elements that have the following attributes:

| Title | Type | Description |
| ---------| -----| ----------|
| **filename** | String(255) | Filename with extension. For example - "doc.pdf" |
| **content** | string | Base64 encoded file. |

In this case, the array of Files is taken as the set of all the Files of the object and completely replaces (in the case of an update request) all
pre-existing files in the object. In the event of an update request, all Files that previously existed in the object will be deleted,
and the new Files will be added to the Files list.
If files contains an empty array of elements in the update request, then all Files from the Operation, Item, Task or Account will be deleted, because
the server will assume that the user wants to update the list of Operation Files, Items, Tasks, or Accounts.

The limit of files saved with an object is 10. If you need to upload more files for one object, you need to use the method described in the section [Working with Files of Operations, Products, Services, Tasks and Counterparties using special resources](../dictionaries/#entities-files-working-with-files-of-operations-products-services-tasks-and-counterparties-using-special-resources).


### Working with Files of Operations, Products, Services, Tasks and Counterparties using special resources

Using the JSON API, you can create and update information on files for all types of operations, products, product variants, services, bundles, and counterparties, request lists of files, as well as information on individual files.

Operations, products, product variants, services, bundles, and counterparties may contain many identical files. Files are considered the same if when adding files
they had the same `filename` and `content`. Identical files have the same `id` parameter value.
An object can have no more than 100 files.

#### Entity attributes

| Title | Type                                               | Description |
| ---------|----------------------------------------------------| ----------|
| **created** | DateTime                                           | File upload time to the server<br>`+Required when answering` |
| **createdBy** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the employee who uploaded the File<br>`+Required when answering` `+Expand` |
| **filename** | String(255)                                        | Filename<br>`+Required when answering` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when answering` |
| **miniature** | [Meta](../#kladana-json-api-general-info-metadata) | Image thumbnail metadata (field is passed only for Image files) |
| **size** | Int                                                | File size in bytes<br>`+Required when answering` |
| **tiny** | [Meta](../#kladana-json-api-general-info-metadata) | Thumbnail metadata (field is passed only for Image files) |
| **title** | String(255)                                        | File Name<br>`+Required when answering` |

### Get a list of Operation Files, Products, Servicies, Taska and Accountd

Request to retrieve all operations, products, product variants, services, items, tasks, or files associated with the account.

Result: JSON object including fields:

| Title | Type | Description |
| ---------| -----| ----------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing [Files](../dictionaries/#entities-files). |

**Parameters**

| Parameter | Description |
| ---------| ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product ID with Files. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **type** | `string` (required) *Example: product* the type of the entity for which Files are requested. |

> Get a list of Files for a Product

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/files"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of files.

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
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/files",
         "type": "files",
         "mediaType": "application/json",
         "size": 2,
         "limit": 1000,
         "offset": 0
     },
     "rows": [
         {
             "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/files/f2728180-6afd-4d37-8a13-f3b48069bbb6",
                 "type": "files",
                 "mediaType": "application/json",
                 "downloadHref": "https://api.kladana.com/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6"
             },
             "title": "bird image",
             "filename": "birdimage.png",
             "size": 14052,
             "created": "2019-01-24 16:55:24.567",
             "createdBy": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/employee/69f5683e-a49b-11ea-ac15-000e000000cf",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                   "type": "employee",
                   "mediaType": "application/json",
                   "uuidHref": "https://app.kladana.com/app/#employee/edit?id=69f5683e-a49b-11ea-ac15-000e000000cf"
                 }
             },
             "miniature": {
                 "href": "https://api.kladana.com/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6?miniature=true",
                 "type": "files",
                 "mediaType": "image/png",
                 "downloadHref": "https://miniature-prod.kladana.com/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
             },
             "tiny": {
                 "href": "https://api.kladana.com/static/tinyimage/f2aab4d2-1fd3-11e9-ac12-000800000001/tinyimage/ebb10350-0272-45db-9d33-ca5a01fd5543/t.png",
                 "type": "files",
                 "mediaType": "image/png"
             }
         },
         {
             "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/files/933e41ac-1946-4bf0-9b21-51f2051f3e9d",
                 "type": "files",
                 "mediaType": "application/json",
                 "downloadHref": "https://api.kladana.com/api/remap/1.2/download/933e41ac-1946-4bf0-9b21-51f2051f3e9d"
             },
             "title": "doc",
             "filename": "doc.pdf",
             "size": 25000,
             "created": "2019-01-25 17:30:25.021",
             "createdBy": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/employee/69f5683e-a49b-11ea-ac15-000e000000cf",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                   "type": "employee",
                   "mediaType": "application/json",
                   "uuidHref": "https://app.kladana.com/app/#employee/edit?id=69f5683e-a49b-11ea-ac15-000e000000cf"
                 }
             }
         }
     ]
}
```

### Add Files to an Operation, Item or Counterparty
Add new Files to an Operation, Item or Counterparty.

#### Description
Files are uploaded and added to Files based on the passed JSON object,
which contains an array with representations of the new Files.
The result is a JSON representation of the updated list of Files. To create and add new Files to an Operation, Item or Counterparty,
it is necessary and sufficient to indicate in the url request the `id` of the entity to which the Files are added, and specify an array of File objects with fields
`filename` and `content`.

In the `content` field you need to specify the file encoded in Base64, in the `filename` field - the name of the File with the extension.

A maximum of 10 Files can be added in one request.

**Parameters**

| Parameter | Description |
| ---------| ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product ID with Files. |

> Example of adding Files to a Product
  
```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/files"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
     -d '[
            {
                "filename": "birdimageNew.png",
                "content": "Base64"
            },
            {
                "filename": "doc.pdf",
                "content": "Base64"
            }
        ]'
```

> Response 200(application/json)
Successful request. The result is an array of all Product Files.

```json
[
   {
       "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/files/f2728180-6afd-4d37-8a13-f3b48069bbb6",
           "type": "files",
           "mediaType": "application/json",
           "downloadHref": "https://api.kladana.com/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6"
       },
       "title": "bird image",
       "filename": "birdimage.png",
       "size": 14052,
       "created": "2019-01-24 16:55:24.567",
       "createdBy": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/employee/69f5683e-a49b-11ea-ac15-000e000000cf",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
             "type": "employee",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#employee/edit?id=69f5683e-a49b-11ea-ac15-000e000000cf"
           }
       },
       "miniature": {
           "href": "https://api.kladana.com/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6?miniature=true",
           "type": "files",
           "mediaType": "image/png",
           "downloadHref": "https://miniature-prod.kladana.com/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
       },
       "tiny": {
           "href": "https://api.kladana.com/static/tinyimage/f2aab4d2-1fd3-11e9-ac12-000800000001/tinyimage/ebb10350-0272-45db-9d33-ca5a01fd5543/t.png",
           "type": "files",
           "mediaType": "image/png"
       }
   },
   {
       "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/files/933e41ac-1946-4bf0-9b21-51f2051f3e9f",
           "type": "files",
           "mediaType": "application/json",
           "downloadHref": "https://api.kladana.com/api/remap/1.2/download/933e41ac-1946-4bf0-9b21-51f2051f3e9f"
       },
       "title": "doc",
       "filename": "doc.pdf",
       "size": 25000,
       "created": "2019-01-25 17:30:25.021",
       "createdBy": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/employee/69f5683e-a49b-11ea-ac15-000e000000cf",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
             "type": "employee",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#employee/edit?id=69f5683e-a49b-11ea-ac15-000e000000cf"
           }
       }
   }
]
```

### Delete a file

When a File is deleted, the first File found with the given ID is deleted from the Operation, Item, Task or Account.

**Parameters**

| Parameter | Description |
| -------- |----------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* File item ID. |
| **idFile** | `string` (required) *Example: 19f1edc0-fc42-4001-94cb-c9ec9c62ec10* File ID. |

> Request to delete a File from a Product.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/files/19f1edc0-fc42-4001-94cb-c9ec9c62ec10"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```
> Response 200(application/json)
Successful deletion of the File.
