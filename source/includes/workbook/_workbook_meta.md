## Metadata

One of the key concepts when working with the JSON API is the concept of metadata.
There are several types of metadata in the JSON API:

* object metadata,
* collection metadata,
* entity metadata.

The metadata of an object (a specific object in MyWarehouse, for example, the product "Soccer ball") is a brief representation of this very object in
the `meta` field.

The collection metadata represents an element that describes the size of the collection, the size of the sample returned by the query, pagination.

Entity metadata describes fields related to the entire class (for example, to all products): statuses, price types, additional fields, etc.
 
Let's consider the listed types of metadata in more detail.

### Object metadata

The objects returned by the JSON API contain a `meta` field, which is essentially a reference to the object. However, `meta` is not a simple field, but a compound one.
json element containing a brief description of the object.
The `meta` field consists of the following attributes:

* `href` - link to the object;
* `metadataHref` - link to entity metadata;
* `downloadHref` - download link
* `type` - object type;
* `mediaType` - data type that comes in response from the service, or is sent in the request body;
* `uuidHref` - link to the object in the web version of MyWarehouse. Not present in all entities.

Consider the request of the counterparty `Supplier LLC`

> Request

```shell
curl -X GET
   https://app.kladana.in/api/remap/1.2/entity/counterparty/ab4dd5fc-d100-11e8-ac12-00080000006d
   -H 'Authorization: Bearer <Access-Token>'
   -H 'Cache-Control: no-cache'
```

> Reply

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/d92bcdc1-b0e2-11ea-ac12-000d00000073",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
     "type": "counter party",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#company/edit?id=d92bcdc1-b0e2-11ea-ac12-000d00000073"
   },
   "id": "d92bcdc1-b0e2-11ea-ac12-000d00000073",
   "accountId": "d865ef6f-b0e2-11ea-ac12-000c00000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/d8ed648c-b0e2-11ea-ac12-000d00000034",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=d8ed648c-b0e2-11ea-ac12-000d00000034"
     }
   },
   shared: false
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/d867701a-b0e2-11ea-ac12-000c00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2020-06-18 00:38:14.083",
   "name": "LLC \"Supplier\"",
   "externalCode": "nv4UeR5dhAStZ4X-5-ojn2",
   archived: false
   "created": "2020-06-18 00:38:14.083",
   "companyType": "legal",
   "legalTitle": "Limited Liability Company \"Supplier\"",
   "legalAddress": "Moscow, Stroiteley st., 12",
   "legalAddressFull": {
     "addInfo": "Moscow, Stroiteley st., 12"
   },
   "inn": "7736570901",
   "kpp": "773601001",
   "accounts": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/d92bcdc1-b0e2-11ea-ac12-000d00000073/accounts",
       "type": "account",
       "mediaType": "application/json",
       size: 0
       limit: 1000
       offset: 0
     }
   },
   "tags": [],
   "contactpersons": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/d92bcdc1-b0e2-11ea-ac12-000d00000073/contactpersons",
       "type": "contactperson",
       "mediaType": "application/json",
       size: 0
       limit: 1000
       offset: 0
     }
   },
   notes: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/d92bcdc1-b0e2-11ea-ac12-000d00000073/notes",
       "type": "note",
       "mediaType": "application/json",
       size: 0
       limit: 1000
       offset: 0
     }
   },
   salesAmount: 0.0
}
```

The response contains several `meta` fields.
First, the object itself is described, indicating the type of object, links in the JSON API and links to the web version.

> Developer metadata

```json
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/d92bcdc1-b0e2-11ea-ac12-000d00000073",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
     "type": "counter party",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#company/edit?id=d92bcdc1-b0e2-11ea-ac12-000d00000073"
   }
```

Links to the employee who created the account and the employee's department are specified in the `owner` and `group` fields, and also contain the `meta` fields.

> Metadata of an employee and his department

```json
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/d8ed648c-b0e2-11ea-ac12-000d00000034",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=d8ed648c-b0e2-11ea-ac12-000d00000034"
     }
   },
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/d867701a-b0e2-11ea-ac12-000c00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   }
```

Obviously, the `href` and `uuidHref` fields contain the url to access the objects and can be used to make a request.
For example, using the value of the `href` field, we will request employee data.

> Request

```shell
curl -X GET
   https://app.kladana.in/api/remap/1.2/entity/employee/ab306d83-d100-11e8-ac12-000800000042
   -H 'Authorization: Bearer <Access-Token>'
   -H 'Cache-Control: no-cache'
```

> Reply

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/employee/d8ed648c-b0e2-11ea-ac12-000d00000034",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
     "type": "employee",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#employee/edit?id=d8ed648c-b0e2-11ea-ac12-000d00000034"
   },
   "id": "d8ed648c-b0e2-11ea-ac12-000d00000034",
   "accountId": "d865ef6f-b0e2-11ea-ac12-000c00000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/d8ed648c-b0e2-11ea-ac12-000d00000034",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=d8ed648c-b0e2-11ea-ac12-000d00000034"
     }
   },
   shared: true
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/d867701a-b0e2-11ea-ac12-000c00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2020-06-18 00:38:13.655",
   "name": "123",
   "externalCode": "bCdnwOjliLRTxAp8277Xm1",
   archived: false
   "created": "2020-06-18 00:38:13.655",
   "uid": "admin@123",
   "email": "123@123.ru",
   "lastName": "123",
   "fullName": "123",
   "shortFio": "123",
   "cashiers": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/retailstore/d9ba0e32-b0e2-11ea-ac12-000d00000086/cashiers/d9ba22fe-b0e2-11ea-ac12-000d00000087",
         "type": "cashier",
         "mediaType": "application/json"
       }
     }
   ]
}
```
Similarly, for the value from the `uuidHref` field, you can open the object in the web version.

#### Using meta when creating and changing an object

`meta` is used as a reference to another object, let's look at examples.

> Get product metadata

```json
"meta":{
    "href":"https://app.kladana.in/api/remap/1.2/entity/product/3b336cc5-d10a-11e8-ac12-000b00000021",
    "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/product/metadata",
    "type":"product",
    "mediaType":"application/json",
    "uuidHref":"https://app.kladana.in/app/#good/edit?id=3b335997-d10a-11e8-ac12-000b0000001f"
}
```
Execute a request to create a bundle, specifying the product in the components.

> Request

```shell
curl -X POST
   'https://app.kladana.in/api/remap/1.2/entity/bundle?expand=components'
   -H 'Authorization: Bearer <Access-Token>'
   -H 'Cache-Control: no-cache'
   -H 'Content-Type: application/json'
   -d '{
    "name":"Pencil set",
    "components":[
       {
          "assortment":{
             "meta":{
                "href":"https://app.kladana.in/api/remap/1.2/entity/product/0884d27a-b0e3-11ea-ac12-000b00000002",
                "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                "type":"product",
                "mediaType":"application/json",
                "uuidHref":"https://app.kladana.in/app/#good/edit?id=088303a8-b0e3-11ea-ac12-000b00000000"
             }
          },
          "quantity":10
       }
    ]
}'
```

In response, we will receive a new set that contains the specified product

> Result

```json

   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/e5da18eb-b152-11ea-ac12-000c00000002",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
     "type": "bundle",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#good/edit?id=e5d864ae-b152-11ea-ac12-000c00000000"
   },
   "id": "e5da18eb-b152-11ea-ac12-000c00000002",
   "accountId": "d865ef6f-b0e2-11ea-ac12-000c00000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/d8ed648c-b0e2-11ea-ac12-000d00000034",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=d8ed648c-b0e2-11ea-ac12-000d00000034"
     }
   },
   shared: true
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/d867701a-b0e2-11ea-ac12-000c00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2020-06-18 14:00:18.664",
   "name": "Pencil set",
   "code": "00002",
   "externalCode": "V1kq3O3YhBcImmYCE7jxf3",
   archived: false
   "pathName": "",
   "images": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/e5da18eb-b152-11ea-ac12-000c00000002/images",
       "type": "image",
       "mediaType": "application/json",
       size: 0
       limit: 1000
       offset: 0
     }
   },
   "minprice": {
     value: 0.0
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/d92fb826-b0e2-11ea-ac12-000d00000077",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#currency/edit?id=d92fb826-b0e2-11ea-ac12-000d00000077"
       }
     }
   },
   "salePrices": [
     {
       value: 0.0
       currency: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/d92fb826-b0e2-11ea-ac12-000d00000077",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#currency/edit?id=d92fb826-b0e2-11ea-ac12-000d00000077"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/d97f0826-b0e2-11ea-ac12-000d00000078",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "d97f0826-b0e2-11ea-ac12-000d00000078",
         "name": "Sale price",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
       }
     }
   ],
   "barcodes": [
     {
       "ean13": "2000000000039"
     }
   ],
   "paymentItemType": "GOOD",
   "discountProhibited": false,
   weight: 0.0
   volume: 0.0
   "trackingType": "NOT_TRACKED",
   components: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/e5da18eb-b152-11ea-ac12-000c00000002/components",
       "type": "bundlecomponent",
       "mediaType": "application/json",
       size: 1
       limit: 1000
       offset: 0
     }
   }
}
```

Let's change the product by specifying a unit of measure for it. Provided that the product does not yet have a unit of measurement.

> Request

```shell
curl -X PUT
   https://app.kladana.in/api/remap/1.2/entity/product/3b336cc5-d10a-11e8-ac12-000b00000021
   -H 'Authorization: Bearer <Access-Token>'
   -H 'Cache-Control: no-cache'
   -H 'Content-Type: application/json'
   -d '{
    "uom":{
       "meta":{
          "href":"https://app.kladana.in/api/remap/1.2/entity/uom/061721df-9197-49a5-b637-7f5b4d3be969",
          "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
          "type":"uom",
          "mediaType":"application/json"
       }
    }
}'
```

In the response, you can see that the unit of measure, the `uom` field, has changed to the passed object.

> Reply

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/product/0884d27a-b0e3-11ea-ac12-000b00000002",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
     "type": "product",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#good/edit?id=088303a8-b0e3-11ea-ac12-000b00000000"
   },
   "id": "0884d27a-b0e3-11ea-ac12-000b00000002",
   "accountId": "d865ef6f-b0e2-11ea-ac12-000c00000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/d8ed648c-b0e2-11ea-ac12-000d00000034",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=d8ed648c-b0e2-11ea-ac12-000d00000034"
     }
   },
   shared: true
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/d867701a-b0e2-11ea-ac12-000c00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2020-06-18 00:39:33.163",
   "name": "wonder product",
   "code": "00001",
   "externalCode": "XwJmEyYOhI-Gx9HOtBxih2",
   archived: false
   "pathName": "",
   "images": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/product/0884d27a-b0e3-11ea-ac12-000b00000002/images",
       "type": "image",
       "mediaType": "application/json",
       size: 0
       limit: 1000
       offset: 0
     }
   },
   "minprice": {
     value: 0.0
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/d92fb826-b0e2-11ea-ac12-000d00000077",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#currency/edit?id=d92fb826-b0e2-11ea-ac12-000d00000077"
       }
     }
   },
   "salePrices": [
     {
       value: 0.0
       currency: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/d92fb826-b0e2-11ea-ac12-000d00000077",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#currency/edit?id=d92fb826-b0e2-11ea-ac12-000d00000077"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/d97f0826-b0e2-11ea-ac12-000d00000078",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "d97f0826-b0e2-11ea-ac12-000d00000078",
         "name": "Sale price",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
       }
     }
   ],
   "buyprice": {
     value: 0.0
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/d92fb826-b0e2-11ea-ac12-000d00000077",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#currency/edit?id=d92fb826-b0e2-11ea-ac12-000d00000077"
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

### Collection metadata

To work with pagination, collections in the JSON API form a slightly different `meta` field.
The `meta` field of collections contains partially the same attributes (`href`, `type`, `mediaType`) as `meta` objects, and a number of its own attributes:

- `size` - the number of elements in the collection,
- `limit` - the maximum number of elements in the collection returned in one request,
- `offset` - collection selection offset from the first element.

For example, when requesting webhooks:

> Request

```shell
curl -X GET
   https://app.kladana.in/api/remap/1.2/entity/webhook
   -H 'Authorization: Bearer <Access-Token>'
   -H 'Cache-Control: no-cache'
```

> Response

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
         "href": "https://app.kladana.in/api/remap/1.2/entity/webhook",
         "type": "webhook",
         "mediaType": "application/json",
         "size": 1,
         "limit": 25,
         "offset": 0
     },
     "rows": [
         {
             "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/webhook/01205b84-072c-11e8-6b01-4b1d0010fff6",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
                 "type": "webhook",
                 "mediaType": "application/json"
             },
             "id": "01205b84-072c-11e8-6b01-4b1d0010fff6",
             "accountId": "45eb22e0-0e7b-11e2-1c31-3c4a92f3a0a7",
             "entityType": "product",
             "url": "https://webhook.site/40adcf20-83de-4bb0-9072-6a98fe96bc44",
             "method": "POST",
             "enabled": false,
             "action": "CREATE"
         }
     ]
}
```

In the Response you can see that the collection contains one element, and `size` also has the value of 1.

If the value of the `size` attribute is greater than `limit`, then additional pagination attributes are displayed:

- `nextHref` - link to the next page of the collection;
- `previousHref` - link to the previous page of the collection.

Add new webhooks and request them, but with a limit of 1

> Request

```shell
curl -X GET
   'https://app.kladana.in/api/remap/1.2/entity/webhook?limit=1'
   -H 'Authorization: Bearer <Access-Token>'
   -H 'Cache-Control: no-cache'
   ```
  
> Reply
  
```json
{
     "context": {
         "employee": {
             "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/context/employee",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
                 "type": "employee",
                 "mediaType": "application/json"}
         }
     },
     "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/webhook?limit=1",
         "type": "webhook",
         "mediaType": "application/json",
         "size": 3,
         "limit": 1,
         "offset": 0,
         "nextHref": "https://app.kladana.in/api/remap/1.2/entity/webhook?limit=1&offset=1"
     },
     "rows": [
         {
             "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/webhook/01205b84-072c-11e8-6b01-4b1d0010fff6",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
                 "type": "webhook",
                 "mediaType": "application/json"
             },
             "id": "01205b84-072c-11e8-6b01-4b1d0010fff6",
             "accountId": "45eb22e0-0e7b-11e2-1c31-3c4a92f3a0a7",
             "entityType": "product",
             "url": "https://webhook.site/40adcf20-83de-4bb0-9072-6a98fe96bc44",
             "method": "POST",
             "enabled": false,
             "action": "CREATE"
         }
     ]
}
```

By applying the limit, a `nextHref` pagination link to the next page of the collection was generated. Let's go over it.

> Request

```shell
curl -X GET
   'https://app.kladana.in/api/remap/1.2/entity/webhook?limit=1&offset=1'
   -H 'Authorization: Bearer <Access-Token>'
   -H 'Cache-Control: no-cache'
```

> Reply

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
         "href": "https://app.kladana.in/api/remap/1.2/entity/webhook?limit=1&offset=1",
         "type": "webhook",
         "mediaType": "application/json",
         "size": 3,
         "limit": 1,
         "offset": 1,
         "nextHref": "https://app.kladana.in/api/remap/1.2/entity/webhook?offset=2&limit=1",
         "previousHref": "https://app.kladana.in/api/remap/1.2/entity/webhook?offset=0&limit=1"
     },
     "rows": [
         {
             "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/webhook/07598ccd-072c-11e8-7a6c-d2a90010c896",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
                 "type": "webhook",
                 "mediaType": "application/json"
             },
             "id": "07598ccd-072c-11e8-7a6c-d2a90010c896",
             "accountId": "45eb22e0-0e7b-11e2-1c31-3c4a92f3a0a7",
             "entityType": "variant",
             "url": "https://webhook-convert.ru/ms2s/T053UB0V8/B7WHWQTFF/yiTBjO5xoeuv6pXJOH1TLeBe",
             "method": "POST",
             "enabled": false
             "action": "UPDATE"
         }
     ]
}
```
As you can see, pagination links have been formed that are available for going to the next and previous pages of the collection.

### Entity metadata

In addition to using a metadata field as an external reference and a collection representation, metadata can directly describe the entities themselves.

As a rule, this is a description of nested entities, collections, and additional fields.

To get the metadata of an entity, you need to use a link from the `metadataHref` field.
Request the metadata of the counterparty entity from the example above.

> Request

```shell
curl -X GET
   https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata
   -H 'Authorization: Bearer <Access-Token>'
   -H 'Cache-Control: no-cache'
```

> Reply

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
     "mediaType": "application/json"
   },
   "attributes": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata/attributes",
       "type": "attributemetadata",
       "mediaType": "application/json",
       size: 0
       limit: 1000
       offset: 0
     }
   },
   "states": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata/states/d9ddf453-b0e2-11ea-ac12-000d0000008c",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "d9ddf453-b0e2-11ea-ac12-000d0000008c",
       "accountId": "d865ef6f-b0e2-11ea-ac12-000c00000001",
       "name": "New",
       "color": 15106326,
       "stateType": "Regular",
       "entityType": "counterparty"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata/states/d9de00ec-b0e2-11ea-ac12-000d0000008d",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "d9de00ec-b0e2-11ea-ac12-000d0000008d",
       "accountId": "d865ef6f-b0e2-11ea-ac12-000c00000001",
       "name": "Offer sent",
       "color": 10774205,
       "stateType": "Regular",
       "entityType": "counterparty"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata/states/d9de03fc-b0e2-11ea-ac12-000d0000008e",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "d9de03fc-b0e2-11ea-ac12-000d0000008e",
       "accountId": "d865ef6f-b0e2-11ea-ac12-000c00000001",
       "name": "Negotiations",
       "color": 40931,
       "stateType": "Regular",
       "entityType": "counterparty"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata/states/d9de06e1-b0e2-11ea-ac12-000d0000008f",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "d9de06e1-b0e2-11ea-ac12-000d0000008f",
       "accountId": "d865ef6f-b0e2-11ea-ac12-000c00000001",
       "name": "Deal Closed",
       "color": 8825440,
       "stateType": "Successful",
       "entityType": "counterparty"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata/states/d9de09b0-b0e2-11ea-ac12-000d00000090",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "d9de09b0-b0e2-11ea-ac12-000d00000090",
       "accountId": "d865ef6f-b0e2-11ea-ac12-000c00000001",
       "name": "Deal not closed",
       "color": 15280409,
       "stateType": "Unsuccessful",
       "entityType": "counterparty"
     }
   ],
   "createShared": false
}
```
In this example, the request returned the values of additional fields, statuses, and groups of counterparties.

Learn more about the entity metadata resource in [documentation](../#kladana-json-api-general-info-metadata).
