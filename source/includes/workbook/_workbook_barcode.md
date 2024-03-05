## Working with Barcodes

The JSON API now has the ability to work with various barcodes in products, bundles, services, product variants, and
product packaging. The following barcode types are supported:

- ean13
- ean8
- code128
- gtn

Barcodes provide a convenient way to identify and work with nomenclature.
Suppose you need to sell a product and for the convenience of finding it in the system, a barcode scanner was purchased. After the purchase
  the scanner is faced with the task of adding barcodes to the nomenclature. Let's see how this can be done on the example of a product.
 
> Create an item with a barcode

  ```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/product"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "good",
             "barcodes": [
               {
                 "ean8": "20000000"
               },
               {
                 "ean13": "2000000000000"
               },
               {
                 "code128": "code128 barcode"
               },
               {
                 "gtin": "00000000000130"
               }
             ]
           }'
   ```
> Response 200(application/json)
  Successful request. The result is a JSON representation of the created Product with barcodes.
   
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
    "name": "good",
    "code": "00006",
    "externalCode": "0bmPIvHxgEDlNIZrZ6GLt2",
    "archived": false,
    "pathName": "",
    "images": {
      "meta": {
        "href": "https://api.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/images",
        "type": "image",
        "mediaType": "application/json",
        "size": 2,
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
        "ean8": "20000000"
      },
      {
        "ean13": "2000000000000"
      },
      {
        "code128": "code128 barcode"
      },
      {
        "gtin": "00000000000130"
      }
    ],
    "variantsCount": 0,
    "isSerialTrackable": false,
    "trackingType": "NOT_TRACKED"
  }
  ```

> Update barcodes for products

  ```shell
   curl -X PUT
     "https://api.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "barcodes": [
               {
                 "ean8": "20000001"
               },
               {
                 "ean13": "2000000000001"
               },
               {
                 "code128": "code128 barcode 1"
               },
               {
                 "gtin": "00000000000131"
               }
             ]
           }'
   ```

> Response 200(application/json)
  Successful request. The result is a JSON representation of the updated Product with barcodes.
   
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
    "name": "good",
    "code": "00006",
    "externalCode": "0bmPIvHxgEDlNIZrZ6GLt2",
    "archived": false,
    "pathName": "",
    "images": {
      "meta": {
        "href": "https://api.kladana.in/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/images",
        "type": "image",
        "mediaType": "application/json",
        "size": 2,
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
        "ean8": "20000001"
      },
      {
        "ean13": "2000000000001"
      },
      {
        "code128": "code128 barcode 1"
      },
      {
        "gtin": "00000000000131"
      }
    ],
    "variantsCount": 0,
    "isSerialTrackable": false,
    "trackingType": "NOT_TRACKED"
  }
  ```
  In case barcodes no longer need to be used for the item, it is enough to update the item by specifying an empty list
   barcodes.
