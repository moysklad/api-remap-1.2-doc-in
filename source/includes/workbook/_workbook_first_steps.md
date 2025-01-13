# Workbook
## Introduction to JSON API: What You Need to Know
### Limitations

JSON API is available to users on all tarif plans, but not all functionality is available on free plans.

Learn more about the [limitations](../#kladana-json-api-limitations).

### Optimizing the number of requests to the JSON API

A common problem with exhausting request limits is unconfigured integration. This section lists the main errors when working with the JSON API, and describes options for solving them.

#### The problem of duplicate requests

It often happens that many duplicate requests are received in a short period of time. This can be caused by the following reasons:

* Multiple instances of the same application, each of which is unaware of the neighboring one;
* Request retries are configured incorrectly:
* the request is repeated if no response to the previous request was received. For example, 5 seconds are allocated for a response, and then the request is resent. It is worth considering that the response may come after 300 seconds, depending on the complexity of the request;
* the request is repeated if an error was received that should not lead to a repeated request. For example, errors with the 4xx response code should not lead to a repeated request;
* No caching of nested objects when receiving a list of entities.

#### The problem of redundant requests

One of the main problems in integration can be the use of multiple requests in workflows, when the necessary data can be obtained with one request. For example:

* updating an object in parts, not as a whole;
* ignoring [expand](../#workbook-expand), [async](../#workbook-asynk) and [webhook](../#workbook-webhooks) where necessary:
* **expand** helps to reduce the number of requests if you need to get nested entities;
* **async** allows you to get a list of all objects without having to iterate through them using pagination;
* **webhook** allows you to accurately update the state of an entity and update data less frequently.

### Configuring connection reuse

With a large number of requests, opening a TCP connection for each one leads to a ban.

To avoid this, configure connection reuse (HTTP keep-alive/HTTP persistent connection).

When establishing a connection directly with Kladana, keep-alive is configured in the library for http requests. When using a proxy server, the configuration is performed on its side.

Increase the number and time of inactivity of TCP connections. However, it is not recommended to use TCP connections that are inactive for more than 30 seconds or make more than 100 requests through one connection: this can lead to Errors 5xx.

### Getting Started

To get started, you need the following:

- Kladana account;
- HTTP client, such as Postman, curl.

### First request

For JSON API requests, the login and password of the Kladana account (Basic Auth) or [token for Authentication in json api](../#mojsklad-json-api-obschie-swedeniq-autentifikaciq) are used.

To create the first product, you only need its name.

> Request to create fo a product with login and password

```shell
curl -X POST 
  -u login:password 
  -H "Accept-Encoding: gzip" 
  -H "Content-Type: application/json" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/entity/product" 
  -d '{"name":"Product name"}'
```

> Request to create a product with a token

```shell
curl -X POST 
  -H "Authorization: Bearer <Access-Token>"
  -H "Accept-Encoding: gzip" 
  -H "Content-Type: application/json" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/entity/product" 
  -d '{"name":"Product name"}'
```

`login:password` - login and password for the Kladana account

`Authorization: Bearer <Access-Token>` - token for Authentication in json api

`Content-Type: application/json` - JSON API works only with json

`Lognex-Pretty-Print-JSON: true` - header that includes output of formatted json

> Response

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
    "type": "product",
    "mediaType": "application/json",
    "uuidHref": "https://api.kladana.com/app/#good/edit?id=6b3fd459-b0ac-11ea-ac14-000a00000000"
  },
  "id": "6b44332f-b0ac-11ea-ac14-000a00000002",
  "accountId": "17e26927-b0ac-11ea-ac14-000d00000001",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/19113b38-b0ac-11ea-ac14-000c00000034",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://api.kladana.com/app/#employee/edit?id=19113b38-b0ac-11ea-ac14-000c00000034"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/17e5e244-b0ac-11ea-ac14-000d00000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2020-06-17 18:08:32.000",
  "name": "Product name",
  "code": "00001",
  "externalCode": "hNDALaQDh6E96GubbHybr0",
  "archived": false,
  "pathName": "",
  "images": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002/images",
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
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
      }
    }
  },
  "salePrices": [
    {
      "value": 0.0,
      "currency": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
          "type": "currency",
          "mediaType": "application/json",
          "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
        }
      },
      "priceType": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/1a1d768e-b0ac-11ea-ac14-000c00000078",
          "type": "pricetype",
          "mediaType": "application/json"
        },
        "id": "1a1d768e-b0ac-11ea-ac14-000c00000078",
        "name": "Sale price",
        "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
      }
    }
  ],
  "buyPrice": {
    "value": 0.0,
    "currency": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
      }
    }
  },
  "barcodes": [
    {
      "ean13": "2000000000015"
    }
  ],
  "paymentItemType": "GOOD",
  "discountProhibited": false,
  "weight": 0.0,
  "volume": 0.0,
  "variantsCount": 0,
  "isSerialTrackable": false,
  "trackingType": "NOT_TRACKED"
}
```

> Now you can see it in the list of products:

``` shell
curl -X GET 
  -u login:password 
  -H "Accept-Encoding: gzip" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/entity/product"
```

> Response:

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/product",
    "type": "product",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#good/edit?id=6b3fd459-b0ac-11ea-ac14-000a00000000"
      },
      "id": "6b44332f-b0ac-11ea-ac14-000a00000002",
      "accountId": "17e26927-b0ac-11ea-ac14-000d00000001",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/19113b38-b0ac-11ea-ac14-000c00000034",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://api.kladana.com/app/#employee/edit?id=19113b38-b0ac-11ea-ac14-000c00000034"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/17e5e244-b0ac-11ea-ac14-000d00000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2020-06-17 18:08:32.000",
      "name": "Product name",
      "code": "00001",
      "externalCode": "hNDALaQDh6E96GubbHybr0",
      "archived": false,
      "pathName": "",
      "images": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002/images",
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
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
          }
        }
      },
      "salePrices": [
        {
          "value": 0.0,
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json",
              "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/1a1d768e-b0ac-11ea-ac14-000c00000078",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "1a1d768e-b0ac-11ea-ac14-000c00000078",
            "name": "Sale price",
            "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
          }
        }
      ],
      "buyPrice": {
        "value": 0.0,
        "currency": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
          }
        }
      },
      "barcodes": [
        {
          "ean13": "2000000000015"
        }
      ],
      "paymentItemType": "GOOD",
      "discountProhibited": false,
      "weight": 0.0,
      "volume": 0.0,
      "variantsCount": 0,
      "isSerialTrackable": false,
      "trackingType": "NOT_TRACKED"
    }
  ]
}
```

### Metadata

At the beginning of each response there is a meta field representing metadata. In the JSON API, metadata comes in several forms.

> For a product, object metadata contains information about a specific object (object reference, type):

```json
{
    "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#good/edit?id=6b3fd459-b0ac-11ea-ac14-000a00000000"
    }
}
```

> When requesting a list of products - *collection metadata* - information about the list of objects (list size, number of objects retrieved, offset):

```json
{
    "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product",
        "type": "product",
        "mediaType": "application/json",
        "size": 1,
        "limit": 25,
        "offset": 0
    }
}
```

Another type of metadata is *entity metadata* - information that does not relate to a specific object, but to all objects of a certain type, such as lists of additional attributes, statuses.

> Request for product metadata:

``` shell
curl -X GET 
  -u login:password 
  -H "Accept-Encoding: gzip" 
  -H "Lognex-Pretty-Print-JSON: true"
  "https://api.kladana.com/api/remap/1.2/entity/product/metadata"
```

> Response:

```json
 {
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
     "mediaType": "application/json"
   },
   "attributes": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes",
       "type": "attributemetadata",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "createShared": true
 }
```

### Error handling

> When creating a product, it is necessary to specify the name, otherwise an error will be returned.

``` shell
curl -X POST 
  -u login:password 
  -H "Accept-Encoding: gzip" 
  -H "Content-Type: application/json" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/entity/product" 
  -d '{}'
```

> Response:

```json
    {
        "errors": [
            {
                "error": "Error saving object: field 'name' cannot be empty or missing",
                "code": 3000,
                "parameter": "name",
                "moreInfo": "https://api.kladana.com/api/remap/1.2/doc#errors",
                "line": 1,
                "column": 2
            }
        ]
    }
```

Errors are returned as an `errors` array containing `error` objects, each of which describes a single error.

Learm nore about the structure and types of errors [in the documentation](../#kladana-erros).

### HTTP methods: GET, POST, PUT, DELETE

In the JSON API, different HTTP methods correspond to different actions:

- GET - getting information;
- POST - creating new objects, also used for mass creation, updating and deleting objects;
- PUT - changing existing objects;
- DELETE - deleting objects.

> GET - requesting a list of products

``` shell
curl -X GET 
  -u login:password 
  -H "Accept-Encoding: gzip" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/entity/product"
```

> Response:

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/product",
    "type": "product",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#good/edit?id=6b3fd459-b0ac-11ea-ac14-000a00000000"
      },
      "id": "6b44332f-b0ac-11ea-ac14-000a00000002",
      "accountId": "17e26927-b0ac-11ea-ac14-000d00000001",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/19113b38-b0ac-11ea-ac14-000c00000034",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://api.kladana.com/app/#employee/edit?id=19113b38-b0ac-11ea-ac14-000c00000034"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/17e5e244-b0ac-11ea-ac14-000d00000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2020-06-17 18:08:32.000",
      "name": "Product name",
      "code": "00001",
      "externalCode": "hNDALaQDh6E96GubbHybr0",
      "archived": false,
      "pathName": "",
      "images": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002/images",
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
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
          }
        }
      },
      "salePrices": [
        {
          "value": 0.0,
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json",
              "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/1a1d768e-b0ac-11ea-ac14-000c00000078",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "1a1d768e-b0ac-11ea-ac14-000c00000078",
            "name": "Sale price",
            "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
          }
        }
      ],
      "buyPrice": {
        "value": 0.0,
        "currency": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
          }
        }
      },
      "barcodes": [
        {
          "ean13": "2000000000015"
        }
      ],
      "paymentItemType": "GOOD",
      "discountProhibited": false,
      "weight": 0.0,
      "volume": 0.0,
      "variantsCount": 0,
      "isSerialTrackable": false,
      "trackingType": "NOT_TRACKED"
    }
  ]
}
```

> POST - product creation

``` shell
curl -X POST 
  -u login:password
  -H "Accept-Encoding: gzip" 
  -H "Content-Type: application/json" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/entity/product" 
  -d '{"name":"Product name"}'
```

> Response:

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
    "type": "product",
    "mediaType": "application/json",
    "uuidHref": "https://api.kladana.com/app/#good/edit?id=6b3fd459-b0ac-11ea-ac14-000a00000000"
  },
  "id": "6b44332f-b0ac-11ea-ac14-000a00000002",
  "accountId": "17e26927-b0ac-11ea-ac14-000d00000001",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/19113b38-b0ac-11ea-ac14-000c00000034",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://api.kladana.com/app/#employee/edit?id=19113b38-b0ac-11ea-ac14-000c00000034"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/17e5e244-b0ac-11ea-ac14-000d00000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2020-06-17 18:08:32.000",
  "name": "Product name",
  "code": "00001",
  "externalCode": "hNDALaQDh6E96GubbHybr0",
  "archived": false,
  "pathName": "",
  "images": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002/images",
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
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
      }
    }
  },
  "salePrices": [
    {
      "value": 0.0,
      "currency": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
          "type": "currency",
          "mediaType": "application/json",
          "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
        }
      },
      "priceType": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/1a1d768e-b0ac-11ea-ac14-000c00000078",
          "type": "pricetype",
          "mediaType": "application/json"
        },
        "id": "1a1d768e-b0ac-11ea-ac14-000c00000078",
        "name": "Sale price",
        "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
      }
    }
  ],
  "buyPrice": {
    "value": 0.0,
    "currency": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
      }
    }
  },
  "barcodes": [
    {
      "ean13": "2000000000015"
    }
  ],
  "paymentItemType": "GOOD",
  "discountProhibited": false,
  "weight": 0.0,
  "volume": 0.0,
  "variantsCount": 0,
  "isSerialTrackable": false,
  "trackingType": "NOT_TRACKED"
}
```

The product metadata contains a link to this product ("href":"https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002"). It can be used to request this specific product.

> GET - request for a specific product

``` shell
curl -X GET 
  -u login:password
  -H "Accept-Encoding: gzip" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002"
```

> Response:

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
    "type": "product",
    "mediaType": "application/json",
    "uuidHref": "https://api.kladana.com/app/#good/edit?id=6b3fd459-b0ac-11ea-ac14-000a00000000"
  },
  "id": "6b44332f-b0ac-11ea-ac14-000a00000002",
  "accountId": "17e26927-b0ac-11ea-ac14-000d00000001",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/19113b38-b0ac-11ea-ac14-000c00000034",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://api.kladana.com/app/#employee/edit?id=19113b38-b0ac-11ea-ac14-000c00000034"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/17e5e244-b0ac-11ea-ac14-000d00000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2020-06-17 18:08:32.000",
  "name": "Product name",
  "code": "00001",
  "externalCode": "hNDALaQDh6E96GubbHybr0",
  "archived": false,
  "pathName": "",
  "images": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002/images",
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
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
      }
    }
  },
  "salePrices": [
    {
      "value": 0.0,
      "currency": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
          "type": "currency",
          "mediaType": "application/json",
          "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
        }
      },
      "priceType": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/1a1d768e-b0ac-11ea-ac14-000c00000078",
          "type": "pricetype",
          "mediaType": "application/json"
        },
        "id": "1a1d768e-b0ac-11ea-ac14-000c00000078",
        "name": "Sale price",
        "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
      }
    }
  ],
  "buyPrice": {
    "value": 0.0,
    "currency": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
      }
    }
  },
  "barcodes": [
    {
      "ean13": "2000000000015"
    }
  ],
  "paymentItemType": "GOOD",
  "discountProhibited": false,
  "weight": 0.0,
  "volume": 0.0,
  "variantsCount": 0,
  "isSerialTrackable": false,
  "trackingType": "NOT_TRACKED"
}
```

You can also use the link to change this product:

> PUT - product change

``` shell
curl -X PUT 
  -u login:password
  -H "Accept-Encoding: gzip" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002"
  -d '{"name":"New product name"}'
```

> Response:

``` json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
    "type": "product",
    "mediaType": "application/json",
    "uuidHref": "https://api.kladana.com/app/#good/edit?id=6b3fd459-b0ac-11ea-ac14-000a00000000"
  },
  "id": "6b44332f-b0ac-11ea-ac14-000a00000002",
  "accountId": "17e26927-b0ac-11ea-ac14-000d00000001",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/19113b38-b0ac-11ea-ac14-000c00000034",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://api.kladana.com/app/#employee/edit?id=19113b38-b0ac-11ea-ac14-000c00000034"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/17e5e244-b0ac-11ea-ac14-000d00000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2020-06-17 18:08:32.000",
  "name": "New product name",
  "code": "00001",
  "externalCode": "hNDALaQDh6E96GubbHybr0",
  "archived": false,
  "pathName": "",
  "images": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002/images",
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
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
      }
    }
  },
  "salePrices": [
    {
      "value": 0.0,
      "currency": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
          "type": "currency",
          "mediaType": "application/json",
          "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
        }
      },
      "priceType": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/1a1d768e-b0ac-11ea-ac14-000c00000078",
          "type": "pricetype",
          "mediaType": "application/json"
        },
        "id": "1a1d768e-b0ac-11ea-ac14-000c00000078",
        "name": "Sale price",
        "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
      }
    }
  ],
  "buyPrice": {
    "value": 0.0,
    "currency": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
      }
    }
  },
  "barcodes": [
    {
      "ean13": "2000000000015"
    }
  ],
  "paymentItemType": "GOOD",
  "discountProhibited": false,
  "weight": 0.0,
  "volume": 0.0,
  "variantsCount": 0,
  "isSerialTrackable": false,
  "trackingType": "NOT_TRACKED"
}
```


You can also use the link to delete the product:

> DELETE - product deletion

``` shell
curl -X DELETE 
  -u login:password
  -H "Accept-Encoding: gzip" 
  "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002"
```

> If the deletion is successful, an empty response with the code 200 is returned, otherwise an error with the code 404.

If you need to delete more than one product, use bulk deletion. To do this, you need to send a `post` request, in the body of which you specify the `meta` of the entities to be deleted. The result of a successful deletion will be a message about the successful deletion of entities.

> Example of product bulk deletion

```shell
curl -X POST
  "https://api.kladana.com/api/remap/1.2/entity/product/delete"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
  -H "Content-Type: application/json"
  -d '[
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b1",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                "type": "product",
                "mediaType": "application/json"
            }
        },
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b2",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                "type": "product",
                "mediaType": "application/json"
            }
        }
      ]'
``` 

> Successful request. Result - JSON information about deletion of products.

```json
[
  {
    "info":"Entity 'product' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
  },
  {
    "info":"Entity 'product' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
  }
]
```

### Empty fields

Products have an optional field `country`. When creating a product, we did not fill it in, so it is missing from the results for this product.

Let's fill in the `country` field for the product. Fields that are objects must be transferred as metadata.

> When updating objects, it is not necessary to transfer all fields. When specifying some of the fields, only the transferred fields will be changed.

``` shell
curl -X PUT 
  -u login:password
  -H "Accept-Encoding: gzip" 
  -H "Content-Type: application/json" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002" 
  -d {"country": null}
```

> Response:

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
    "type": "product",
    "mediaType": "application/json",
    "uuidHref": "https://api.kladana.com/app/#good/edit?id=6b3fd459-b0ac-11ea-ac14-000a00000000"
  },
  "id": "6b44332f-b0ac-11ea-ac14-000a00000002",
  "accountId": "17e26927-b0ac-11ea-ac14-000d00000001",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/19113b38-b0ac-11ea-ac14-000c00000034",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://api.kladana.com/app/#employee/edit?id=19113b38-b0ac-11ea-ac14-000c00000034"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/17e5e244-b0ac-11ea-ac14-000d00000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2020-06-17 18:08:32.000",
  "name": "New product name",
  "code": "00001",
  "externalCode": "hNDALaQDh6E96GubbHybr0",
  "archived": false,
  "pathName": "",
  "images": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002/images",
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
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
      }
    }
  },
  "salePrices": [
    {
      "value": 0.0,
      "currency": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
          "type": "currency",
          "mediaType": "application/json",
          "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
        }
      },
      "priceType": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/1a1d768e-b0ac-11ea-ac14-000c00000078",
          "type": "pricetype",
          "mediaType": "application/json"
        },
        "id": "1a1d768e-b0ac-11ea-ac14-000c00000078",
        "name": "Sale price",
        "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
      }
    }
  ],
  "buyPrice": {
    "value": 0.0,
    "currency": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
      }
    }
  },
  "barcodes": [
    {
      "ean13": "2000000000015"
    }
  ],
  "paymentItemType": "GOOD",
  "discountProhibited": false,
  "weight": 0.0,
  "volume": 0.0,
  "variantsCount": 0,
  "isSerialTrackable": false,
  "trackingType": "NOT_TRACKED"
}
```

To remove a value from an object type field, you need to pass null in the entity update request. This is possible if the field is not required, or if the field in the main interface can contain an empty value. For example, let's remove the country from a product.

> Incorrect update request

``` shell
curl -X PUT 
  -u login:password
  -H "Accept-Encoding: gzip" 
  -H "Content-Type: application/json" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002" 
  -d '{"name": null}'
```

> Response:

```json
{
  "errors": [
    {
      "error": "Format error: field 'name' value is not of type string",
      "code": 2016,
      "moreInfo": "https://api.kladana.com/api/remap/1.2/doc#errors",
      "line": 1,
      "column": 2
    }
  ]
}
```    

### Date and time format

In the JSON API, date-time fields (time point) are a string in the following format:

- Without milliseconds: YYYY-MM-DD HH:mm:ss
- With milliseconds: YYYY-MM-DD HH:mm:ss.mmm

In the filtering parameters, you must specify date-time fields in this format.

> Example of a request with the updated field in products

``` shell
curl -X GET 
  -u login:password
  -H "Accept-Encoding: gzip" 
  -H "Lognex-Pretty-Print-JSON: true" 
  -H "X-Lognex-Format-Millisecond: true" 
  "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002"
```

> Response:

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
    "type": "product",
    "mediaType": "application/json",
    "uuidHref": "https://api.kladana.com/app/#good/edit?id=6b3fd459-b0ac-11ea-ac14-000a00000000"
  },
  "id": "6b44332f-b0ac-11ea-ac14-000a00000002",
  "accountId": "17e26927-b0ac-11ea-ac14-000d00000001",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/19113b38-b0ac-11ea-ac14-000c00000034",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://api.kladana.com/app/#employee/edit?id=19113b38-b0ac-11ea-ac14-000c00000034"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/17e5e244-b0ac-11ea-ac14-000d00000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2020-06-17 18:08:32.000",
  "name": "New product name",
  "code": "00001",
  "externalCode": "hNDALaQDh6E96GubbHybr0",
  "archived": false,
  "pathName": "",
  "images": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002/images",
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
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
      }
    }
  },
  "salePrices": [
    {
      "value": 0.0,
      "currency": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
          "type": "currency",
          "mediaType": "application/json",
          "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
        }
      },
      "priceType": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/1a1d768e-b0ac-11ea-ac14-000c00000078",
          "type": "pricetype",
          "mediaType": "application/json"
        },
        "id": "1a1d768e-b0ac-11ea-ac14-000c00000078",
        "name": "Sale price",
        "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
      }
    }
  ],
  "buyPrice": {
    "value": 0.0,
    "currency": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
      }
    }
  },
  "barcodes": [
    {
      "ean13": "2000000000015"
    }
  ],
  "paymentItemType": "GOOD",
  "discountProhibited": false,
  "weight": 0.0,
  "volume": 0.0,
  "variantsCount": 0,
  "isSerialTrackable": false,
  "trackingType": "NOT_TRACKED"
}
```

### Division into entity, report and context

Most JSON API methods are divided into three large sections - entity, report and context.

- entity - working with entities. Getting, creating, updating, deleting.
- report - reports. Getting various summary data that are calculated based on existing documents.
- context - settings. Changing various user, company settings, etc.

All the methods discussed above relate to entity - working with entities of the product type. Filtering and sorting capabilities are determined by the structure of the fields of a specific type. Each entity has a unique id, and there are methods for working with individual objects.

The structure of reports, as well as filtering capabilities, are specific to each individual report.

Reports represent a certain slice of information based on a set of documents. For example, consider a report on the balance of goods in the warehouse. We created one product and did not create any documents, so the quantity of this product is zero. By default, non-zero balances are hidden in this report. In order for them to be displayed in the request, the stockMode parameter with the value all is used.

> Requesting reports

``` shell
curl -X GET 
  -u login:password
  -H "Accept-Encoding: gzip" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/report/stock/all?stockMode=all"
```

> Response:

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
    "href": "https://api.kladana.com/api/remap/1.2/report/stock/all?stockMode=all",
    "type": "stock",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/0884d27a-b0e3-11ea-ac12-000b00000002?expand=supplier",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#good/edit?id=088303a8-b0e3-11ea-ac12-000b00000000"
      },
      "stock": 1.0,
      "inTransit": 0.0,
      "reserve": 0.0,
      "quantity": 1.0,
      "name": "product",
      "code": "00001",
      "price": 10000.0,
      "salePrice": 0.0,
      "uom": {},
      "externalCode": "XwJmEyYOhI-Gx9HOtBxih2",
      "stockDays": 0.0
    }
  ]
}
```

## Filtering, paging, searching and sorting

### Filtering

To filter the selection by several fields, use the url parameter filter. The value of this parameter is a 'urlencoded' string with search
conditions listed through ';'. Each search condition is a combination of a field name, an operator and a constant.

Filtering is not available for array fields (for example, the **barcodes** field). Filtering products by name and
update time "filter=name=New name;filter=updated&gt;2018-01-01 00:00:00".

> Request:

``` shell
curl -X GET 
  -u login:password
  -H "Accept-Encoding: gzip" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/entity/product?filter=name=Product name;updated>2018-01-01 00:00:00"
```

> Response:

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
    "type": "product",
    "mediaType": "application/json",
    "uuidHref": "https://api.kladana.com/app/#good/edit?id=6b3fd459-b0ac-11ea-ac14-000a00000000"
  },
  "id": "6b44332f-b0ac-11ea-ac14-000a00000002",
  "accountId": "17e26927-b0ac-11ea-ac14-000d00000001",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/19113b38-b0ac-11ea-ac14-000c00000034",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://api.kladana.com/app/#employee/edit?id=19113b38-b0ac-11ea-ac14-000c00000034"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/17e5e244-b0ac-11ea-ac14-000d00000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2020-06-17 18:08:32.000",
  "name": "Product name",
  "code": "00001",
  "externalCode": "hNDALaQDh6E96GubbHybr0",
  "archived": false,
  "pathName": "",
  "images": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/6b44332f-b0ac-11ea-ac14-000a00000002/images",
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
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
      }
    }
  },
  "salePrices": [
    {
      "value": 0.0,
      "currency": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
          "type": "currency",
          "mediaType": "application/json",
          "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
        }
      },
      "priceType": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/1a1d768e-b0ac-11ea-ac14-000c00000078",
          "type": "pricetype",
          "mediaType": "application/json"
        },
        "id": "1a1d768e-b0ac-11ea-ac14-000c00000078",
        "name": "Sale price",
        "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
      }
    }
  ],
  "buyPrice": {
    "value": 0.0,
    "currency": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/199e466a-b0ac-11ea-ac14-000c00000077",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=199e466a-b0ac-11ea-ac14-000c00000077"
      }
    }
  },
  "barcodes": [
    {
      "ean13": "2000000000015"
    }
  ],
  "paymentItemType": "GOOD",
  "discountProhibited": false,
  "weight": 0.0,
  "volume": 0.0,
  "variantsCount": 0,
  "isSerialTrackable": false,
  "trackingType": "NOT_TRACKED"
}
```

### Paging

Most lists and reports support paging. Two parameters are responsible for it:

- **offset** — offset from the first element (counted from zero);
- **limit** — number of elements on the page (default 1000, maximum 1000).

If not all elements are returned when requesting a list, the collection metadata contains special fields: **previousHref** and **nextHref**, representing requests for the previous and next pages of data.

Let's look at an example of a country request.

> Request:

``` shell
curl -X GET 
  -u login:password
  -H "Accept-Encoding: gzip" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/entity/country"
```

> Response:

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/country",
    "type": "country",
    "mediaType": "application/json",
    "size": 252,
    "limit": 1000,
    "offset": 0
  },
  "rows": [...]
}
```

> Request with limit and offset:

``` shell
curl -X GET 
  -u login:password
  -H "Accept-Encoding: gzip" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/entity/country/?limit=25&offset=25"
```

> Response:

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/country?limit=25&offset=25",
    "type": "country",
    "mediaType": "application/json",
    "size": 252,
    "limit": 25,
    "offset": 25,
    "nextHref": "https://api.kladana.com/api/remap/1.2/entity/country?offset=50&limit=25",
    "previousHref": "https://api.kladana.com/api/remap/1.2/entity/country?offset=0&limit=25"
  },
  "rows": [...]
}
```

### Search

The JSON API allows you to perform contextual searches among a list of entities of a certain type by their string fields.

The check is unique for each entity. The search works by word prefixes. For this, the url search parameter search is used.

The search result will be a list of entities of this type sorted by relevance, filtered by the passed search string. Unlike filtering the selection using the filter parameter, in which the values ​​
are checked for an exact match, in contextual search the match check is not strict.

Contextual search of countries `"search=mari"`

> Request:

``` shell
curl -X GET 
  -u login:password
  -H "Accept-Encoding: gzip" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/entity/country?search=Рос"
```

> Response:

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/country?search=%D0%A0%D0%BE%D1%81",
    "type": "country",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
        "type": "country",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#country/edit?id=9df7c2c3-7782-4c5c-a8ed-1102af611608"
      },
      "id": "9df7c2c3-7782-4c5c-a8ed-1102af611608",
      "updated": "2012-11-02 12:04:14.054",
      "name": "India",
      "description": "The Republic of India",
      "code": "643",
      "externalCode": "643"
    }
  ]
}
```

### Sorting

The url parameter order is used to sort the list of objects. The value of this parameter is a 'urlencoded' string with sorting conditions listed through ';'. Each sorting condition is a combination of a field name, a comma (optional if sorting direction is specified), and a sorting direction (optional: can take the values ​​asc and desc. The default value is asc).

Sorting is supported for the following field types: numeric, string, date-time, logical, and uuid.

> Request:

``` shell
curl -X GET 
  -u login:password
  -H "Accept-Encoding: gzip" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/entity/country/?order=name,desc;updated"
```

> Response:

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/country?order=name,desc;updated",
    "type": "country",
    "mediaType": "application/json",
    "size": 252,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/country/00999522-23d6-40e6-870e-ec7f7bd8d354",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
        "type": "country",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#country/edit?id=00999522-23d6-40e6-870e-ec7f7bd8d354"
      },
      "id": "00999522-23d6-40e6-870e-ec7f7bd8d354",
      "updated": "2012-11-02 12:04:15.831",
      "name": "Japan",
      "code": "392",
      "externalCode": "392"
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/country/886b465f-5bb0-4c6a-9b63-9abaf5157a26",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
        "type": "country",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#country/edit?id=886b465f-5bb0-4c6a-9b63-9abaf5157a26"
      },
      "id": "886b465f-5bb0-4c6a-9b63-9abaf5157a26",
      "updated": "2012-11-02 12:04:15.826",
      "name": "Jamaica",
      "code": "388",
      "externalCode": "388"
    },
    ...
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/country/9756f8c8-84d3-46d1-9439-b4e950cff419",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
        "type": "country",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#country/edit?id=9756f8c8-84d3-46d1-9439-b4e950cff419"
      },
      "id": "9756f8c8-84d3-46d1-9439-b4e950cff419",
      "updated": "2012-11-02 12:04:12.241",
      "name": "Guatemala",
      "description": "The Republic of Guatemala",
      "code": "320",
      "externalCode": "320"
    }
  ]
}    

```

## Expand

In the JSON API, fields that are objects in entities are output as metadata. In order to get the related objects themselves instead of links, it is not necessary to make separate requests for each of them. Instead, along with the request to get the entity, you need to
pass the **expand** parameter. As the value of this parameter, you need to list all the necessary fields, in place of which you would like to see objects, separated by commas.

### Rules for expand

The following rules apply to **expand**:

* **expand** is allowed only for a selection size of no more than 100, example: `https://api.kladana.com/api/remap/1.2/entity/customerorder?expand=positions&limit=100`. If a higher limit is specified and **expand** is specified, the **expand** parameter will be ignored.

* Maximum nesting level of **expand** - 3.

* **expand** can be used for the results of create and update operations.

For example, a product has an owner field (link to an Employee), and an employee has a group field (the employee's department). Let's request a product so that it has an expanded owner, and the owner has an expanded group.

> Example of a get request with **expand**

``` shell
curl -X GET 
  -u login:password
  -H "Accept-Encoding: gzip" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/entity/product/0884d27a-b0e3-11ea-ac12-000b00000002?expand=owner.group"
```

> Response 200 (application/json)
Successful request. Result is a JSON representation of the Product with a simple "owner" object and a simple "group" object for each "owner" object.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/product/0884d27a-b0e3-11ea-ac12-000b00000002?expand=owner,owner.group",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
    "type": "product",
    "mediaType": "application/json",
    "uuidHref": "https://api.kladana.com/app/#good/edit?id=088303a8-b0e3-11ea-ac12-000b00000000"
  },
  "id": "0884d27a-b0e3-11ea-ac12-000b00000002",
  "accountId": "d865ef6f-b0e2-11ea-ac12-000c00000001",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d8ed648c-b0e2-11ea-ac12-000d00000034?expand=group",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://api.kladana.com/app/#employee/edit?id=d8ed648c-b0e2-11ea-ac12-000d00000034"
    },
    "id": "d8ed648c-b0e2-11ea-ac12-000d00000034",
    "accountId": "d865ef6f-b0e2-11ea-ac12-000c00000001",
    "owner": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d8ed648c-b0e2-11ea-ac12-000d00000034",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#employee/edit?id=d8ed648c-b0e2-11ea-ac12-000d00000034"
      }
    },
    "shared": true,
    "group": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/group/d867701a-b0e2-11ea-ac12-000c00000002",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
        "type": "group",
        "mediaType": "application/json"
      },
      "name": "Main"
    },
    "updated": "2020-06-18 00:38:13.655",
    "name": "123",
    "externalCode": "bCdnwOjliLRTxAp8277Xm1",
    "archived": false,
    "created": "2020-06-18 00:38:13.655",
    "uid": "admin@123",
    "email": "123@123.ru",
    "lastName": "123",
    "fullName": "123",
    "shortFio": "123",
    "cashiers": [
      {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/retailstore/d9ba0e32-b0e2-11ea-ac12-000d00000086/cashiers/d9ba22fe-b0e2-11ea-ac12-000d00000087",
          "type": "cashier",
          "mediaType": "application/json"
        }
      }
    ]
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/d867701a-b0e2-11ea-ac12-000c00000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2020-06-18 00:39:33.163",
  "name": "Product name",
  "code": "00001",
  "externalCode": "XwJmEyYOhI-Gx9HOtBxih2",
  "archived": false,
  "pathName": "",
  "images": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/0884d27a-b0e3-11ea-ac12-000b00000002/images",
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
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/d92fb826-b0e2-11ea-ac12-000d00000077",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=d92fb826-b0e2-11ea-ac12-000d00000077"
      }
    }
  },
  "salePrices": [
    {
      "value": 0.0,
      "currency": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/currency/d92fb826-b0e2-11ea-ac12-000d00000077",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
          "type": "currency",
          "mediaType": "application/json",
          "uuidHref": "https://api.kladana.com/app/#currency/edit?id=d92fb826-b0e2-11ea-ac12-000d00000077"
        }
      },
      "priceType": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/d97f0826-b0e2-11ea-ac12-000d00000078",
          "type": "pricetype",
          "mediaType": "application/json"
        },
        "id": "d97f0826-b0e2-11ea-ac12-000d00000078",
        "name": "Sale price",
        "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
      }
    }
  ],
  "buyPrice": {
    "value": 0.0,
    "currency": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/d92fb826-b0e2-11ea-ac12-000d00000077",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=d92fb826-b0e2-11ea-ac12-000d00000077"
      }
    }
  },
  "barcodes": [
    {
      "ean13": "2000000000015"
    }
  ],
  "paymentItemType": "GOOD",
  "discountProhibited": false,
  "weight": 0.0,
  "volume": 0.0,
  "variantsCount": 0,
  "isSerialTrackable": false,
  "trackingType": "NOT_TRACKED"
}
```

>  Example of update query with **expand**

``` shell
curl -X PUT 
  -u login:password
  -H "Accept-Encoding: gzip" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/entity/product/0884d27a-b0e3-11ea-ac12-000b00000002?expand=owner.group" 
  -d '{"name":"New product name"}'
```

> Response 200 (application/json)
Successful request. Result - JSON representation of the updated Product with the 'owner' and 'group' objects expanded.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/product/0884d27a-b0e3-11ea-ac12-000b00000002?expand=owner,owner.group",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
    "type": "product",
    "mediaType": "application/json",
    "uuidHref": "https://api.kladana.com/app/#good/edit?id=088303a8-b0e3-11ea-ac12-000b00000000"
  },
  "id": "0884d27a-b0e3-11ea-ac12-000b00000002",
  "accountId": "d865ef6f-b0e2-11ea-ac12-000c00000001",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d8ed648c-b0e2-11ea-ac12-000d00000034?expand=group",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://api.kladana.com/app/#employee/edit?id=d8ed648c-b0e2-11ea-ac12-000d00000034"
    },
    "id": "d8ed648c-b0e2-11ea-ac12-000d00000034",
    "accountId": "d865ef6f-b0e2-11ea-ac12-000c00000001",
    "owner": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/d8ed648c-b0e2-11ea-ac12-000d00000034",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#employee/edit?id=d8ed648c-b0e2-11ea-ac12-000d00000034"
      }
    },
    "shared": true,
    "group": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/group/d867701a-b0e2-11ea-ac12-000c00000002",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
        "type": "group",
        "mediaType": "application/json"
      },
      "name": "Main"
    },
    "updated": "2020-06-18 00:38:13.655",
    "name": "123",
    "externalCode": "bCdnwOjliLRTxAp8277Xm1",
    "archived": false,
    "created": "2020-06-18 00:38:13.655",
    "uid": "admin@123",
    "email": "123@123.ru",
    "lastName": "123",
    "fullName": "123",
    "shortFio": "123",
    "cashiers": [
      {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/retailstore/d9ba0e32-b0e2-11ea-ac12-000d00000086/cashiers/d9ba22fe-b0e2-11ea-ac12-000d00000087",
          "type": "cashier",
          "mediaType": "application/json"
        }
      }
    ]
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/d867701a-b0e2-11ea-ac12-000c00000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2020-06-18 00:39:33.163",
  "name": "New product name",
  "code": "00001",
  "externalCode": "XwJmEyYOhI-Gx9HOtBxih2",
  "archived": false,
  "pathName": "",
  "images": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/0884d27a-b0e3-11ea-ac12-000b00000002/images",
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
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/d92fb826-b0e2-11ea-ac12-000d00000077",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=d92fb826-b0e2-11ea-ac12-000d00000077"
      }
    }
  },
  "salePrices": [
    {
      "value": 0.0,
      "currency": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/currency/d92fb826-b0e2-11ea-ac12-000d00000077",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
          "type": "currency",
          "mediaType": "application/json",
          "uuidHref": "https://api.kladana.com/app/#currency/edit?id=d92fb826-b0e2-11ea-ac12-000d00000077"
        }
      },
      "priceType": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/d97f0826-b0e2-11ea-ac12-000d00000078",
          "type": "pricetype",
          "mediaType": "application/json"
        },
        "id": "d97f0826-b0e2-11ea-ac12-000d00000078",
        "name": "Sale price",
        "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
      }
    }
  ],
  "buyPrice": {
    "value": 0.0,
    "currency": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/d92fb826-b0e2-11ea-ac12-000d00000077",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.comapi.kladana.com/app/#currency/edit?id=d92fb826-b0e2-11ea-ac12-000d00000077"
      }
    }
  },
  "barcodes": [
    {
      "ean13": "2000000000015"
    }
  ],
  "paymentItemType": "GOOD",
  "discountProhibited": false,
  "weight": 0.0,
  "volume": 0.0,
  "variantsCount": 0,
  "isSerialTrackable": false,
  "trackingType": "NOT_TRACKED"
}
```

> Example of a request to get a set of products with **expand**

``` shell
curl -X GET 
  -u login:password
  -H "Accept-Encoding: gzip" 
  -H "Lognex-Pretty-Print-JSON: true" 
  "https://api.kladana.com/api/remap/1.2/entity/product?limit=100&expand=owner.group"
```

> Response 200 (application/json)
Successful request. Result - JSON representation of Products with 'owner' and 'group' objects expanded.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/product?limit=100&expand=owner,owner.group",
    "type": "product",
    "mediaType": "application/json",
    "size": 156,
    "limit": 100,
    "offset": 0,
    "nextHref": "https://api.kladana.com/api/remap/1.2/entity/product?expand=owner%2Cowner.group&limit=100&offset=100"
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/2d593ccc-c42e-11ee-ac1b-000e0000010c?expand=owner,owner.group",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#good/edit?id=2d5756c9-c42e-11ee-ac1b-000e0000010a"
      },
      "id": "2d593ccc-c42e-11ee-ac1b-000e0000010c",
      "accountId": "081311c2-c42e-11ee-ac1b-000d00000001",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/09a8ad82-c42e-11ee-ac1b-000e0000004e?expand=group",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://api.kladana.com/app/#employee/edit?id=09a8ad82-c42e-11ee-ac1b-000e0000004e"
        },
        "id": "09a8ad82-c42e-11ee-ac1b-000e0000004e",
        "accountId": "081311c2-c42e-11ee-ac1b-000d00000001",
        "owner": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/employee/09a8ad82-c42e-11ee-ac1b-000e0000004e",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
            "type": "employee",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#employee/edit?id=09a8ad82-c42e-11ee-ac1b-000e0000004e"
          }
        },
        "shared": true,
        "group": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/group/0815b439-c42e-11ee-ac1b-000d00000002",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
            "type": "group",
            "mediaType": "application/json"
          },
          "id": "0815b439-c42e-11ee-ac1b-000d00000002",
          "accountId": "081311c2-c42e-11ee-ac1b-000d00000001",
          "name": "Main",
          "index": 0
        },
        "updated": "2024-02-05 16:54:10.449",
        "name": "Administrator",
        "externalCode": "SUOW9s68hP6PLywyoQ0NZ1",
        "archived": false,
        "created": "2024-02-05 16:54:10.449",
        "uid": "admin@test",
        "email": "test@test.ru",
        "lastName": "Administrator",
        "fullName": "Administrator",
        "shortFio": "Administrator",
        "cashiers": [
          {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/retailstore/0a95b483-c42e-11ee-ac1b-000e000000af/cashiers/0a95d547-c42e-11ee-ac1b-000e000000b0",
              "type": "cashier",
              "mediaType": "application/json"
            }
          }
        ]
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/0815b439-c42e-11ee-ac1b-000d00000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2024-02-05 16:55:10.253",
      "name": "product",
      "code": "00001",
      "externalCode": "gSE0bU52hre8DeweVoba50",
      "archived": false,
      "pathName": "",
      "useParentVat": true,
      "uom": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
          "type": "uom",
          "mediaType": "application/json"
        }
      },
      "images": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/2d593ccc-c42e-11ee-ac1b-000e0000010c/images",
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
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/0a1b4b87-c42e-11ee-ac1b-000e0000009d",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#currency/edit?id=0a1b4b87-c42e-11ee-ac1b-000e0000009d"
          }
        }
      },
      "salePrices": [
        {
          "value": 0.0,
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/0a1b4b87-c42e-11ee-ac1b-000e0000009d",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json",
              "uuidHref": "https://api.kladana.com/app/#currency/edit?id=0a1b4b87-c42e-11ee-ac1b-000e0000009d"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/0a618fd0-c42e-11ee-ac1b-000e0000009e",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "0a618fd0-c42e-11ee-ac1b-000e0000009e",
            "name": "Sale price",
            "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
          }
        }
      ],
      "buyPrice": {
        "value": 0.0,
        "currency": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/0a1b4b87-c42e-11ee-ac1b-000e0000009d",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#currency/edit?id=0a1b4b87-c42e-11ee-ac1b-000e0000009d"
          }
        }
      },
      "barcodes": [
        {
          "ean13": "2000000000015"
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
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/2d593ccc-c42e-11ee-ac1b-000e0000010c/files",
          "type": "files",
          "mediaType": "application/json",
          "size": 0,
          "limit": 1000,
          "offset": 0
        }
      }
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/372e30d3-c42e-11ee-ac1b-000e00000113?expand=owner,owner.group",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#good/edit?id=372e1b39-c42e-11ee-ac1b-000e00000111"
      },
      "id": "372e30d3-c42e-11ee-ac1b-000e00000113",
      "accountId": "081311c2-c42e-11ee-ac1b-000d00000001",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/09a8ad82-c42e-11ee-ac1b-000e0000004e?expand=group",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://api.kladana.com/app/#employee/edit?id=09a8ad82-c42e-11ee-ac1b-000e0000004e"
        },
        "id": "09a8ad82-c42e-11ee-ac1b-000e0000004e",
        "accountId": "081311c2-c42e-11ee-ac1b-000d00000001",
        "owner": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/employee/09a8ad82-c42e-11ee-ac1b-000e0000004e",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
            "type": "employee",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#employee/edit?id=09a8ad82-c42e-11ee-ac1b-000e0000004e"
          }
        },
        "shared": true,
        "group": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/group/0815b439-c42e-11ee-ac1b-000d00000002",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
            "type": "group",
            "mediaType": "application/json"
          },
          "id": "0815b439-c42e-11ee-ac1b-000d00000002",
          "accountId": "081311c2-c42e-11ee-ac1b-000d00000001",
          "name": "Main",
          "index": 0
        },
        "updated": "2024-02-05 16:54:10.449",
        "name": "Administrator",
        "externalCode": "SUOW9s68hP6PLywyoQ0NZ1",
        "archived": false,
        "created": "2024-02-05 16:54:10.449",
        "uid": "admin@test",
        "email": "test@test.ru",
        "lastName": "Administrator",
        "fullName": "Administrator",
        "shortFio": "Administrator",
        "cashiers": [
          {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/retailstore/0a95b483-c42e-11ee-ac1b-000e000000af/cashiers/0a95d547-c42e-11ee-ac1b-000e000000b0",
              "type": "cashier",
              "mediaType": "application/json"
            }
          }
        ]
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/0815b439-c42e-11ee-ac1b-000d00000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2024-02-20 08:54:29.936",
      "name": "material",
      "code": "00002",
      "externalCode": "9gDTKYyXikO3IhAArG4sL0",
      "archived": false,
      "pathName": "",
      "useParentVat": true,
      "uom": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
          "type": "uom",
          "mediaType": "application/json"
        }
      },
      "images": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/372e30d3-c42e-11ee-ac1b-000e00000113/images",
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
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/0a1b4b87-c42e-11ee-ac1b-000e0000009d",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#currency/edit?id=0a1b4b87-c42e-11ee-ac1b-000e0000009d"
          }
        }
      },
      "salePrices": [
        {
          "value": 0.0,
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/0a1b4b87-c42e-11ee-ac1b-000e0000009d",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json",
              "uuidHref": "https://api.kladana.com/app/#currency/edit?id=0a1b4b87-c42e-11ee-ac1b-000e0000009d"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/0a618fd0-c42e-11ee-ac1b-000e0000009e",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "0a618fd0-c42e-11ee-ac1b-000e0000009e",
            "name": "Sale price",
            "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
          }
        }
      ],
      "buyPrice": {
        "value": 0.0,
        "currency": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/0a1b4b87-c42e-11ee-ac1b-000e0000009d",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#currency/edit?id=0a1b4b87-c42e-11ee-ac1b-000e0000009d"
          }
        }
      },
      "barcodes": [
        {
          "ean13": "2000000000022"
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
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/372e30d3-c42e-11ee-ac1b-000e00000113/files",
          "type": "files",
          "mediaType": "application/json",
          "size": 2,
          "limit": 1000,
          "offset": 0
        }
      }
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/6c4f3e66-e14d-11ee-ac1b-000f00000235?expand=owner,owner.group",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#good/edit?id=6c4f2dcc-e14d-11ee-ac1b-000f00000233"
      },
      "id": "6c4f3e66-e14d-11ee-ac1b-000f00000235",
      "accountId": "081311c2-c42e-11ee-ac1b-000d00000001",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/09a8ad82-c42e-11ee-ac1b-000e0000004e?expand=group",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://api.kladana.com/app/#employee/edit?id=09a8ad82-c42e-11ee-ac1b-000e0000004e"
        },
        "id": "09a8ad82-c42e-11ee-ac1b-000e0000004e",
        "accountId": "081311c2-c42e-11ee-ac1b-000d00000001",
        "owner": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/employee/09a8ad82-c42e-11ee-ac1b-000e0000004e",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
            "type": "employee",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#employee/edit?id=09a8ad82-c42e-11ee-ac1b-000e0000004e"
          }
        },
        "shared": true,
        "group": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/group/0815b439-c42e-11ee-ac1b-000d00000002",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
            "type": "group",
            "mediaType": "application/json"
          },
          "id": "0815b439-c42e-11ee-ac1b-000d00000002",
          "accountId": "081311c2-c42e-11ee-ac1b-000d00000001",
          "name": "Main",
          "index": 0
        },
        "updated": "2024-02-05 16:54:10.449",
        "name": "Administrator",
        "externalCode": "SUOW9s68hP6PLywyoQ0NZ1",
        "archived": false,
        "created": "2024-02-05 16:54:10.449",
        "uid": "admin@test",
        "email": "test@test.ru",
        "lastName": "Administrator",
        "fullName": "Administrator",
        "shortFio": "Administrator",
        "cashiers": [
          {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/retailstore/0a95b483-c42e-11ee-ac1b-000e000000af/cashiers/0a95d547-c42e-11ee-ac1b-000e000000b0",
              "type": "cashier",
              "mediaType": "application/json"
            }
          }
        ]
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/0815b439-c42e-11ee-ac1b-000d00000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2024-03-13 18:21:54.071",
      "name": "123 (2) (3) (3) (3)",
      "code": "00105",
      "externalCode": "YOOuUeNqjRQ0yVCsK9Yys0",
      "archived": false,
      "pathName": "",
      "useParentVat": true,
      "uom": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
          "type": "uom",
          "mediaType": "application/json"
        }
      },
      "images": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/6c4f3e66-e14d-11ee-ac1b-000f00000235/images",
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
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/0a1b4b87-c42e-11ee-ac1b-000e0000009d",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#currency/edit?id=0a1b4b87-c42e-11ee-ac1b-000e0000009d"
          }
        }
      },
      "salePrices": [
        {
          "value": 0.0,
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/0a1b4b87-c42e-11ee-ac1b-000e0000009d",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json",
              "uuidHref": "https://api.kladana.com/app/#currency/edit?id=0a1b4b87-c42e-11ee-ac1b-000e0000009d"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/0a618fd0-c42e-11ee-ac1b-000e0000009e",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "0a618fd0-c42e-11ee-ac1b-000e0000009e",
            "name": "Sale price",
            "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
          }
        }
      ],
      "buyPrice": {
        "value": 0.0,
        "currency": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/0a1b4b87-c42e-11ee-ac1b-000e0000009d",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#currency/edit?id=0a1b4b87-c42e-11ee-ac1b-000e0000009d"
          }
        }
      },
      "barcodes": [
        {
          "ean13": "2000000001135"
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
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/6c4f3e66-e14d-11ee-ac1b-000f00000235/files",
          "type": "files",
          "mediaType": "application/json",
          "size": 0,
          "limit": 1000,
          "offset": 0
        }
      }
    }
  ]
}
```

[More examples](../#mojsklad-json-api-obschie-swedeniq-zamena-ssylok-ob-ektami-s-pomosch-u-expand) and information about replacing links with objects using **expand**.