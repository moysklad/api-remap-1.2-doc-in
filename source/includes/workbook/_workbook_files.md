## Working with Files in Documents, Nomenclature and Accounts

For an extended description and addition of entities with information, in Kladana it is possible to work with
[Files](../dictionaries/#entities-files) to
[Documents](../documents/#transactions),
Nomenclature ([Products](../dictionaries/#entities-product),
[Kits](../dictionaries/#entities-bundle),
[Services](../dictionaries/#entities-service),
[Modifications](../dictionaries/#entities-product-variant)),
[Tasks](../dictionaries/#entities-task) and
[Contractors](../dictionaries/#entities-counterparty).
Files can be attached to entities and requested at any convenient time.
Information on files is displayed along with json representation of the entity to which the given file belongs. For getting
file, you must use the link from the json description of the file representation. You can learn more about Files and working with them
read in the section [Files](../dictionaries/#entities-files).


Sometimes, in order to describe a product, it is required, in addition to specifying the fields, to attach some file, for example, a certificate for this
product or instructions for use. It is most convenient to keep such files next to the description of the product to which they are relate. To do this, you can use [Working with Files](../dictionaries/#entities-files).

For example, you need to create a product and attach the instruction. It can be done on the [Kladana website](https://www.kladana.in/), or with the JSON API. 

In [Kladana](https://api.kladana.in/), you can add, delete or edit the list of product files in Product cards.
 
To add a file via the JSON API, you need to set the `filename` and `context` fields corresponding to the name and content of the file, encoded in Base64, respectively. If you need to add or duplicate an existing file, you can specify it in `meta`.

> Request to create a product with two attached files

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/product"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "simplegood",
             "files": [
               {
                 "filename": "description.png",
                 "content": "iVBORw0KGgoAAAANSUhEUgAAAAEAAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg=="
               },
               {
                 "filename": "additional_description.txt",
                 "content": "iVBORw0KGgoAAAANSUhEUgAAAAEAAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg=="
               }
             ]
           }'
```

> Response 200(application/json)
  Successful request. The result is a JSON representation of the created Product with images.
   
```json
{
  "meta": {
    "href": "https://api.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004",
    "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
    "type": "product",
    "mediaType": "application/json"
  },
  "id": "bd1c0a3e-95ee-11e6-8a84-bae500000004",
  "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
  "owner": {
    "meta": {
      "href": "https://api.kladana.in/api/remap/1.2/entity/employee/b905bfb0-9128-11e6-8a84-bae50000002a",
      "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.in/api/remap/1.2/entity/group/b8ba0d3f-9128-11e6-8a84-bae500000002",
      "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2016-10-19 14:25:28",
  "name": "simplegood",
  "code": "00006",
  "externalCode": "0bmPIvHxgEDlNIZrZ6GLt2",
  "archived": false,
  "pathName": "",
  "images": {
    "meta": {
      "href": "https://api.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/images",
      "type": "image",
      "mediaType": "application/json",
      "size": 0,
      "limit": 1000,
      "offset": 0
    }
  },
  "minPrice": {
    "value": 500.0,
    "currency": {
      "meta": {
        "href": "https://api.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
        "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json"
      }
    }
  },
  "salePrices": [
    {
      "value": 0.0,
      "priceType": {
        "meta": {
          "href": "https://api.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
          "type": "pricetype",
          "mediaType": "application/json"
        },
        "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
        "name": "Sale price",
        "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
      }
    }
  ],
  "buyPrice": {
    "value": 0.0
  },
  "weight": 0,
  "volume": 0,
  "barcodes": [
    {
      "ean13": "2000000000107"
    }
  ],
  "variantsCount": 0,
  "isSerialTrackable": false,
  "trackingType": "NOT_TRACKED",
  "files": {
    "meta": {
      "href": "https://api.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/files",
      "type": "files",
      "mediaType": "application/json",
      "size": 2,
      "limit": 1000,
      "offset": 0
    }
  }
}
  ```

It's worth noting that the response doesn't list all the files, just the `meta` for the collection. To obtain
the list of files within the product must be added to the end of the request `&expand=files&limit=100` when
creating, receiving or updating a product.

> Request to receive the Goods with the specified id.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004&expand=files&limit=100"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
  Successful request. The result is a JSON representation of the requested Product with images.
   
```json
{
     "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#good/edit?id=69bcd8fd-d16f-11ea-ac12-000d000000ce"
     },
     "id": "bd1c0a3e-95ee-11e6-8a84-bae500000004",
     "accountId": "15777764-d16e-11ea-ac12-000c00000000",
     "owner": {
         "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/employee/15dc9854-d16e-11ea-ac12-000d00000034",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
             "type": "employee",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.in/app/#employee/edit?id=15dc9854-d16e-11ea-ac12-000d00000034"
         }
     },
     "shared": true,
     "group": {
         "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/group/157890bb-d16e-11ea-ac12-000c00000001",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
             "type": "group",
             "mediaType": "application/json"
         }
     },
     "updated": "2020-07-29 10:45:03.364",
     "name": "Test item",
     "code": "00002",
     "externalCode": "QZ6OAxoMhaYyyE-yJp5pF0",
     "archived": false,
     "pathName": "",
     "uom": {
         "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/uom/metadata",
             "type": "uom",
             "mediaType": "application/json"
         }
     },
     "images": {
         "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/product/69bcf5e7-d16f-11ea-ac12-000d000000d1/images",
             "type": "image",
             "mediaType": "application/json",
             "size": 0,
             "limit": 1000,
             "offset": 0
         }
     },
     "minPrice": {
         "value": 0.0,
         "currency": {
             "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/currency/160cd290-d16e-11ea-ac12-000d00000077",
                 "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/currency/metadata",
                 "type": "currency",
                 "mediaType": "application/json",
                 "uuidHref": "https://app.kladana.in/app/#currency/edit?id=160cd290-d16e-11ea-ac12-000d00000077"
             }
         }
     },
     "salePrices": [
         {
             "value": 0.0,
             "currency": {
                 "meta": {
                     "href": "https://api.kladana.in/api/remap/1.2/entity/currency/160cd290-d16e-11ea-ac12-000d00000077",
                     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/currency/metadata",
                     "type": "currency",
                     "mediaType": "application/json",
                     "uuidHref": "https://app.kladana.in/app/#currency/edit?id=160cd290-d16e-11ea-ac12-000d00000077"
                 }
             },
             "priceType": {
                 "meta": {
                     "href": "https://api.kladana.in/api/remap/1.2/context/companysettings/pricetype/1648fb5e-d16e-11ea-ac12-000d00000078",
                     "type": "pricetype","mediaType": "application/json"
                 },
                 "id": "1648fb5e-d16e-11ea-ac12-000d00000078",
                 "name": "Sale price",
                 "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
             }
         }
     ],
     "buyPrice": {
         "value": 0.0,
         "currency": {
             "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/currency/160cd290-d16e-11ea-ac12-000d00000077",
                 "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/currency/metadata",
                 "type": "currency",
                 "mediaType": "application/json",
                 "uuidHref": "https://app.kladana.in/app/#currency/edit?id=160cd290-d16e-11ea-ac12-000d00000077"
             }
         }
     },
     "barcodes": [
         {
             "ean13": "2000000000015"
         }
     ],
     "attributes": [
         {
             "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/product/metadata/attributes/48b71254-d16f-11ea-ac12-000d000000c4",
                 "type": "attributemetadata",
                 "mediaType": "application/json"
             },
             "id": "48b71254-d16f-11ea-ac12-000d000000c4",
             "name": "Test product directory",
             "type": "product",
             "value": {
                 "meta": {
                     "href": "https://api.kladana.in/api/remap/1.2/entity/product/5fc90499-d16f-11ea-ac12-000d000000c9",
                     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json",
                     "uuidHref": "https://app.kladana.in/app/#good/edit?id=5fc8840e-d16f-11ea-ac12-000d000000c7"
                 },
                 "name": "Product in the directory"
             }
         }
     ],
     "paymentItemType": "GOOD",
     "discountProhibited": false,
     "weight": 0.0,
     "volume": 0.0,
     "variantsCount": 0,
     "isSerialTrackable": false,
     "trackingType": "NOT_TRACKED",
     "files": {
         "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/files",
             "type": "files",
             "mediaType": "application/json",
             "size": 2,
             "limit": 1000,
             "offset": 0
         },
         "rows": [
             {
                 "meta": {
                     "href": "https://api.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/files/f2728180-6afd-4d37-8a13-f3b48069bbb6",
                     "type": "files",
                     "mediaType": "application/json",
                     "downloadHref": "https://api.kladana.in/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6"
                 },
                 "title": "description",
                 "filename": "description.png",
                 "size": 14052,
                 "updated": "2019-01-24 16:55:24.567",
                 "miniature": {
                     "href": "https://api.kladana.in/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6?miniature=true",
                     "type": "files",
                     "mediaType": "image/png",
                     "downloadHref": "https://miniature-prod.kladana.in/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
                 },
                 "tiny": {
                     "href": "https://app.kladana.in/static/tinyimage/f2aab4d2-1fd3-11e9-ac12-000800000001/tinyimage/ebb10350-0272-45db-9d33-ca5a01fd5543/t.png",
                     "type": "files",
                     "mediaType": "image/png"
                 }
             },
             {
                 "meta": {
                     "href": "https://api.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/files/933e41ac-1946-4bf0-9b21-51f2051f3e9f",
                     "type": "files",
                     "mediaType": "application/json",
                     "downloadHref": "https://api.kladana.in/api/remap/1.2/download/933e41ac-1946-4bf0-9b21-51f2051f3e9f"
                 },
                 "title": "additional_description",
                 "filename": "additional_description.txt",
                 "size": 14052,
                 "updated": "2019-01-24 16:55:25.047",
                 "createdBy": {
                     "meta": {
                         "href": "https://api.kladana.in/api/remap/1.2/entity/employee/69f5683e-a49b-11ea-ac15-000e000000cf",
                         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
                         "type": "employee",
                         "mediaType": "application/json",
                         "uuidHref": "https://app.kladana.in/app/#employee/edit?id=69f5683e-a49b-11ea-ac15-000e000000cf"
                     }
                 }
             }
         ]
     }
}
  ```

Consider another option for workingwith files in Products.
For instance, you need to update the list of product files. In Kladana, it can be performed in two ways: as described earlier, or using the JSON API.

> Request to update the list of files for the Product

   ```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/files"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "filename": "new_instruction.txt",
               "content": "iVBORw0KGgoAAAANSUhEUgAAAAEAAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg=="
             },
             "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/files/f2728180-6afd-4d37-8a13-f3b48069bbb6",
                 "type": "files",
                 "mediaType": "application/json",
                 "downloadHref": "https://api.kladana.in/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6"
             }
           ]'
   ```

> Response is an updated list of Product files

```json

[
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/files/f2728180-6afd-4d37-8a13-f3b48069bbb6",
       "type": "files",
       "mediaType": "application/json",
       "downloadHref": "https://api.kladana.in/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6"
     },
     "title": "new_instruction",
     "filename": "new_instruction.txt",
     "size": 14052,
     "updated": "2019-01-24 16:55:24.567",
     "createdBy": {
         "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/employee/69f5683e-a49b-11ea-ac15-000e000000cf",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
             "type": "employee",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.in/app/#employee/edit?id=69f5683e-a49b-11ea-ac15-000e000000cf"
         }
     }
   },
   {
     "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/files/f2728180-6afd-4d37-8a13-f3b48069bbb6",
         "type": "files",
         "mediaType": "application/json",
         "downloadHref": "https://api.kladana.in/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6"
     },
     "title": "description",
     "filename": "description.png",
     "size": 14052,
     "updated": "2019-01-24 16:55:24.567",
     "miniature": {
         "href": "https://api.kladana.in/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6?miniature=true",
         "type": "files",
         "mediaType": "image/png",
         "downloadHref": "https://miniature-prod.kladana.in/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
     },
     "tiny": {
         "href": "https://app.kladana.in/static/tinyimage/f2aab4d2-1fd3-11e9-ac12-000800000001/tinyimage/ebb10350-0272-45db-9d33-ca5a01fd5543/t.png",
         "type": "files",
         "mediaType": "image/png"
     }
   }
]
```

As you can see from the example, the complete list of files for the Product was changed with one request. To add and change at the same time
file list via JSON API there is a limit of 10 elements. For a more detailed description, see the section
[Files](../dictionaries/#entities-files).

In order to view the file attached to the entity, you need to download it. This can be done using the link
specified in `downloadHref` in `meta` of the file.

> Sample Request for Product File

   ```shell
   curl -X GET
     "https://api.kladana.in/api/remap/1.2/download/f2728180-6afd-4d37-8a13-f3b48069bbb6"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
   ```
The response will come with a 302 (Found) status, where the download link will be indicated in the response header in `Location`. Important
keep in mind that following this link no longer requires the `Authorization` header.
