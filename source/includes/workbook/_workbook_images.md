## Working with Images in Products, Product variants and Bundles

Sometimes you need to add or change multiple images for a product. This can be done in the following ways: 

- update the list of images as part of a product update;
- use endpoints to work with images.
 
To add an image, you need to set the `filename` and `context` fields corresponding to the name and content of the file, encoded in Base64, respectively. If you need to add or duplicate an existing image, you can specify it in `meta`.
 
For example, you need to create a Product with multiple images. It can be done in the following way:
 
  > Request to create a product with two images
 
   ```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/product"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "simplegood",
             "images": [
               {
                 "filename": "birdimage.png",
                 "content": "iVBORw0KGgoAAAANSUhEUgAAAAEAAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg=="
               },
               {
                 "filename": "birdimage2.png",
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
      "href": "https://app.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004",
      "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json"
    },
    "id": "bd1c0a3e-95ee-11e6-8a84-bae500000004",
    "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
    "owner": {
      "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/employee/b905bfb0-9128-11e6-8a84-bae50000002a",
        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json"
      }
    },
    "shared": true,
    "group": {
      "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/group/b8ba0d3f-9128-11e6-8a84-bae500000002",
        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
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
        "href": "https://app.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/images",
        "type": "image",
        "mediaType": "application/json",
        "size": 2,
        "limit": 1000,
        "offset": 0
      }
    },
    "minprice": {
      "value": 500.0,
      "currency": {
        "meta": {
          "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
          "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
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
            "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
            "type": "pricetype",
            "mediaType": "application/json"
          },
          "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
          "name": "Sale price",
          "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
        }
      }
    ],
    "buyprice": {
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
    "trackingType": "NOT_TRACKED"
  }
  ```

It's worth noting that the response doesn't list all the images, just the `meta` for the collection. To obtain
the list of images within the product must be added to the end of the request `&expand=images&limit=100` when
creating, receiving or updating a product.

> Request to receive the Goods with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004&expand=images&limit=100"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
  Successful request. The result is a JSON representation of the requested Product with images.
   
```json
  {
    "meta": {
      "href": "https://app.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004",
      "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json"
    },
    "id": "bd1c0a3e-95ee-11e6-8a84-bae500000004",
    "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
    "owner": {
      "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/employee/b905bfb0-9128-11e6-8a84-bae50000002a",
        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json"
      }
    },
    "shared": true,
    "group": {
      "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/group/b8ba0d3f-9128-11e6-8a84-bae500000002",
        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
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
        "href": "https://app.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/images",
        "type": "image",
        "mediaType": "application/json",
        "size": 2,
        "limit": 1000,
        "offset": 0
      },
      "rows": [
        {
          "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/images/f2728180-6afd-4d37-8a13-f3b48069bbb6",
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
            "href": "https://app.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/images/933e41ac-1946-4bf0-9b21-51f2051f3e9f",
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
    },
    "minprice": {
      "value": 500.0,
      "currency": {
        "meta": {
          "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
          "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
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
            "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
            "type": "pricetype",
            "mediaType": "application/json"
          },
          "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
          "name": "Sale price",
          "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
        }
      }
    ],
    "buyprice": {
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
    "trackingType": "NOT_TRACKED"
  }
  ```

Now consider another option for working with images. Suppose there is a product and you need to update its images.
To do this, you can use the endpoint for working with product images.

> Request to update product images

   ```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/images"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "filename": "birdimage.png",
               "content": "iVBORw0KGgoAAAANSUhEUgAAAAEAAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg=="
             },
             {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/images/933e41ac-1946-4bf0-9b21-51f2051f3e9f",
                 "type": "image",
                 "mediaType": "application/json",
                 "downloadHref": "https://app.kladana.in/api/remap/1.2/download/933e41ac-1946-4bf0-9b21-51f2051f3e9f"
               }
             }
           ]'
   ```

> Response is updated list of product images

```json
[
  {
    "meta": {
      "href": "https://app.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/images/f2728180-6afd-4d37-8a13-f3b48069bbb6",
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
      "href": "https://app.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/images/933e41ac-1946-4bf0-9b21-51f2051f3e9f",
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
```

Learn more about [working with images](../dictionaries/#entities-izobrazhenie).
