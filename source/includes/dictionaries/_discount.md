## Discounts
#### Discounts

The entity code for Discounts in the JSON API is the **discount** keyword. Create, modify, and delete operations are not supported. Learn more about [Discounts](https://kladana.zendesk.com/hc/en-us/articles/360019876858).

#### Entity attributes
#### Common fields

| Title | Type | Description |
| -------- |------- | ---------- |
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Read Only` |
| **active** | Boolean | An indicator of whether the discount is active at the moment<br>`+Required when replying` |
| **agentTags** | Array(String) | Account tags to which the discount is applied, if not applied to all accounts |
| **allProducts** | Boolean | An indicator of whether the discount is valid for all products<br>`+Required when replying` |
| **assortment** | Array(Object) | An array of metadata for Goods and Services that have been selected to apply the discount, if it is not applied to all products |
| **id** | UUID | Discount ID<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata Discounts<br>`+Required when replying` |
| **name** | String(255) | Discount Name<br>`+Required when replying` |

#### Special price fields

| Title | Type          | Description |
| -------- |---------------| ---------- |
| **productfolders** | Array(Object) | Array of metadata of Groups of goods to which the discount is applied, if it is not applied to all goods |
| **discount** | Float           | Discount percentage if fixed percentage is selected |
| **specialprice** | Object        | Specialist. price (if a price type is selected). [Learn more](../dictionaries/#entities-discounts-special-price) |

#### Special Price

| Title | Type   | Description |
| -------- |--------| ---------- |
| **priceType** | Object | Price type<br>`+Required when answering` |
| **value** | Int    | Price value if a fixed value is selected |

#### Cumulative discount fields

| Title | Type | Description |
| -------- |------- | ---------- |
| **productfolders** | Array(Object) | Array of metadata of Groups of goods to which the discount is applied, if it is not applied to all goods |
| **levels** | Array(Object) | Percentage discounts for a certain amount of sales. [Learn more](../dictionaries/#entities-discounts-levels) |

#### Levels

| Title | Type | Description |
| -------- |------| ---------- |
| **amount** | Int  | Amount of savings in paise<br>`+Required when replying` |
| **discount** | Int  | Discount percentage corresponding to this amount |


### Get all discounts

Request to receive all account discounts.
Result: JSON object including fields:

| Title | Type | Description |
| -------- |------- | ---------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing discounts. |

**Parameters**

| Parameter | Description |
| -------- |------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get all discounts

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/discount"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a list of all discounts of all types for the account.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/discount",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/discount/metadata",
     "type": "discount",
     "mediaType": "application/json",
     "size": 4,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/personaldiscount/0623d6b4-9ceb-11e6-8af5-581e00000003",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/personaldiscount/metadata",
         "type": "personaldiscount",
         "mediaType": "application/json"
       },
       "id": "0623d6b4-9ceb-11e6-8af5-581e00000003",
       "accountId": "9560e3e3-9609-11e6-8af5-581e00000008",
       "name": "Personal discount",
       "active": true,
       "allProducts": true,
       "allAgents": true,
       "agentTags": [
         "group of agents"
       ],
       "assortment": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/variant/9881531b-9a09-11e6-8af5-581e00000078",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
             "type": "variant",
             "mediaType": "application/json"
           }
         }
       ]
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/specialpricediscount/96673f4d-9f4d-11e6-8af5-581e0000007b",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/specialpricediscount/metadata",
         "type": "specialpricediscount",
         "mediaType": "application/json"
       },
       "id": "96673f4d-9f4d-11e6-8af5-581e0000007b",
       "accountId": "9560e3e3-9609-11e6-8af5-581e00000008",
       "name": "Special percentage discount",
       "active": true,
       "allAgents": true,
       "agentTags": [
         "group of agents"
       ],
       "allProducts": false,
       "assortment": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/variant/9881531b-9a09-11e6-8af5-581e00000078",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
             "type": "variant",
             "mediaType": "application/json"
           }
         }
       ],
       "discount": 5
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/specialpricediscount/bd1235f2-9c60-11e6-8af5-581e00000009",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/specialpricediscount/metadata",
         "type": "specialpriceddiscount",
         "mediaType": "application/json"
       },
       "id": "bd1235f2-9c60-11e6-8af5-581e00000009",
       "accountId": "9560e3e3-9609-11e6-8af5-581e00000008",
       "name": "Discount number 2",
       "active": true,
       "allProducts": false,
       "allAgents": true,
       "agentTags": [
         "group of agents"
       ],
       "productFolders": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/productfolder/a7a589e5-9c60-11e6-8af5-581e00000006",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productfolder/metadata",
             "type": "productfolder",
             "mediaType": "application/json"
           }
         }
       ],
       "assortment": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/987148b8-9a09-11e6-8af5-581e0000006f",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json"
           }
         },
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/variant/9881531b-9a09-11e6-8af5-581e00000078",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
             "type": "variant",
             "mediaType": "application/json"
           }
         }
       ],
       "specialprice": {
         "value": 15.0,
         "priceType": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
             "type": "pricetype",
             "mediaType": "application/json"
           },
           "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
           "name": "Sale price",
           "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/accumulationdiscount/dce08f7f-9a09-11e6-8af5-581e0000007e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/accumulationdiscount/metadata",
         "type": "accumulationdiscount",
         "mediaType": "application/json"
       },"id": "dce08f7f-9a09-11e6-8af5-581e0000007e",
       "accountId": "9560e3e3-9609-11e6-8af5-581e00000008",
       "name": "Discounts on boots",
       "active": true,
       "allProducts": false,
       "allAgents": true,
       "agentTags": [
         "group of agents"
       ],
       "assortment": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/987148b8-9a09-11e6-8af5-581e0000006f",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json"
           }
         },
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/variant/987d77f1-9a09-11e6-8af5-581e00000074",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
             "type": "variant",
             "mediaType": "application/json"
           }
         },
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/variant/9881531b-9a09-11e6-8af5-581e00000078",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
             "type": "variant",
             "mediaType": "application/json"
           }
         }
       ],
       "levels": [
         {
           "amount": 100000,
           "discount": 10
         },
         {
           "amount": 200000,
           "discount": 15
         }
       ]
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/1223d051-ba76-11e8-3353-995e0000005a",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/metadata",
         "type": "bonusprogram",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#discount/edit?id=1223d051-ba76-11e8-3353-995e0000005a"
       },
       "id": "1223d051-ba76-11e8-3353-995e0000005a",
       "accountId": "dbb8cfc1-cbfa-11e1-6dfb-889ffa6f49fd",
       "name": "test",
       "active": true,
       "allAgents": true,
       "agentTags": [
         "group of agents"
       ],
       "earnRateRoublesToPoint": 1,
       "spendRatePointsToRouble": 1,
       "maxPaidRatePercents": 100
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/discount/8ae26646-b1aa-11ea-ac12-000b00000001",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/discount/metadata",
         "type": "discount",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#discount/edit?id=8ae26646-b1aa-11ea-ac12-000b00000001"
       },
       "id": "8ae26646-b1aa-11ea-ac12-000b00000001",
       "accountId": "5e8a41b1-a419-11ea-ac12-000c00000001",
       "name": "Copeck rounding",
       "active": true,
       "allAgents": true,
       "agentTags": []
}
   ]
}
```

### Create a cumulative discount

Request to create a new cumulative discount. Required fields: **name** (discount name), **active** (is the discount active), **allProducts** (is the discount valid for all products), **allAgents** (is the discount valid for all counterparties).

> An example of creating a new cumulative discount

```shell
curl -X POST
"https://api.kladana.com/api/remap/1.2/entity/accumulationdiscount"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
    -d '{
            "name": "discountName",
            "active": true,
            "allProducts": false,
            "allAgents": false,
            "agentTags": ["tag1", "tag2"],
            "levels": [
            {
            "amount": 100,
            "discount": 10
             }
          ],
            "assortment": [
          {
           "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/833eac42-b6f4-11ea-ac12-000e00000006",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json"
          }
          }
        ],
           "productFolders": [
          {
           "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/39c62b64-a722-11ea-ac12-000d00000015",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "productfolder",
           "mediaType": "application/json"
           }
          }
         ]
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created cumulative discount.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/accumulationdiscount/8ae26646-b1aa-11ea-ac12-000b00000001",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/accumulationdiscount/metadata",
     "type": "accumulationdiscount",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#discount/edit?id=8ae26646-b1aa-11ea-ac12-000b00000001"
   },
   "id": "8ae26646-b1aa-11ea-ac12-000b00000001",
   "accountId": "5e8a41b1-a419-11ea-ac12-000c00000001",
   "name": "discountName",
   "active": true,
   "allAgents": false,
   "agentTags": [
     "tag2",
     "tag1"
   ],
   "allProducts": false,
   "assortment": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/833eac42-b6f4-11ea-ac12-000e00000006","metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=833eac42-b6f4-11ea-ac12-000e00000003"
       }
     }
   ],
   "productFolders": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/productfolder/39c62b64-a722-11ea-ac12-000d00000015",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productfolder/metadata",
         "type": "productfolder",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=39c62b64-a722-11ea-ac12-000d00000015"
       }
     }
   ],
   "levels": [
     {
       "amount": 100,
       "discount": 10
     }
   ]
}
```

### Get a cumulative discount

Request for a cumulative discount.

| Parameter | Description |
| -------- |------- |
| ID| `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* discount ID. |

> An example of obtaining a cumulative discount.

```shell
curl -X GET
"https://api.kladana.com/api/remap/1.2/entity/accumulationdiscount/8ae26646-b1aa-11ea-ac12-000b00000001"
-H "Authorization: Basic <Credentials>"
-H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the cumulative discount.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/accumulationdiscount/8ae26646-b1aa-11ea-ac12-000b00000001",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/accumulationdiscount/metadata",
     "type": "accumulationdiscount",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#discount/edit?id=8ae26646-b1aa-11ea-ac12-000b00000001"
   },
   "id": "8ae26646-b1aa-11ea-ac12-000b00000001",
   "accountId": "5e8a41b1-a419-11ea-ac12-000c00000001",
   "name": "updatedName",
   "active": false,
   "allProducts": false,
   "allAgents": false,
   "agentTags": [
     "tag2"
   ],
   "assortment": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/833eac42-b6f4-11ea-ac12-000e00000006",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=833eac42-b6f4-11ea-ac12-000e00000003"
       }
     }
   ],
   "productFolders": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/productfolder/39c62b64-a722-11ea-ac12-000d00000015",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productfolder/metadata",
         "type": "productfolder",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=39c62b64-a722-11ea-ac12-000d00000015"
       }
     }
   ],
   "levels": [
     {
       "amount": 100,
       "discount": 10
     }
   ]
}
```


### Change cumulative discount

Request to change the cumulative discount. In the body of the request, you must pass the fields that will be updated. When updating array fields, you must pass the new array completely. When an empty array or null is passed, the value of the field is removed.

| Parameter | Description |
| ------- | ------------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Discount ID. |

> An example of updating a cumulative discount

```shell
curl -X PUT
"https://api.kladana.com/api/remap/1.2/entity/accumulationdiscount/8ae26646-b1aa-11ea-ac12-000b00000001"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
    -d '{
            "name": "updatedName",
            "active": false,
            "allProducts": false,
            "allAgents": false,
            "agentTags": [
                "tag2"
            ],
            "levels": [
                {
                    "amount": 100,
                    "discount": 10
                }
            ],
            "assortment": [
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/product/833eac42-b6f4-11ea-ac12-000e00000006",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                        "type": "product",
                        "mediaType": "application/json"
                    }
                }
            ],
            "productFolders": [
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/product/39c62b64-a722-11ea-ac12-000d00000015",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                        "type": "productfolder",
                        "mediaType": "application/json"
                    }
                }
            ]
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created cumulative discount.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/accumulationdiscount/8ae26646-b1aa-11ea-ac12-000b00000001",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/accumulationdiscount/metadata",
     "type": "accumulationdiscount",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#discount/edit?id=8ae26646-b1aa-11ea-ac12-000b00000001"
   },
   "id": "8ae26646-b1aa-11ea-ac12-000b00000001",
   "accountId": "5e8a41b1-a419-11ea-ac12-000c00000001",
   "name": "updatedName",
   "active": false,
   "allProducts": false,
   "allagents": false,
   "agentTags": [
     "tag2"
   ],
   "assortment": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/833eac42-b6f4-11ea-ac12-000e00000006",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=833eac42-b6f4-11ea-ac12-000e00000003"
       }
     }
   ],
   "productFolders": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/productfolder/39c62b64-a722-11ea-ac12-000d00000015",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productfolder/metadata",
         "type": "productfolder",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=39c62b64-a722-11ea-ac12-000d00000015"
       }
     }
   ],
   "levels": [
     {
       "amount": 100,
       "discount": 10
     }
   ]
}
```

### Delete cumulative discount

Request to remove a cumulative discount.

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Discount ID. |

> Request to remove a cumulative discount.

```shell
curl -X DELETE
"https://api.kladana.com/api/remap/1.2/entity/accumulationdiscount/8ae26646-b1aa-11ea-ac12-000b00000001"
-H "Authorization: Basic <Credentials>"
-H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful removal of the cumulative discount.

### Create a personal discount
Request to create a new personal discount. Required fields: **name** (discount name), **active** (is the discount active), **allProducts** (is the discount valid for all products), **allAgents** (is the discount valid for all Counterparties)

> Example of creating a new personal discount

```shell
curl -X POST
"https://api.kladana.com/api/remap/1.2/entity/personaldiscount"
-H "Authorization: Basic <Credentials>"
-H "Accept-Encoding: gzip"
-H "Content-Type: application/json"
-d '{
        "name": "discountName",
        "active": true,
        "allProducts": false,
        "allAgents": false,
        "agentTags": [
            "tag1",
            "tag2"
        ],
        "assortment": [
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/product/833eac42-b6f4-11ea-ac12-000e00000006",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                    "type": "product",
                    "mediaType": "application/json"
                }
            }
        ],
        "productFolders": [
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/product/39c62b64-a722-11ea-ac12-000d00000015",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                    "type": "productfolder",
                    "mediaType": "application/json"
                }
            }
        ]
    }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created personal discount.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/personaldiscount/8ae26646-b1aa-11ea-ac12-000b00000001",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/personaldiscount/metadata",
     "type": "personaldiscount",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#discount/edit?id=8ae26646-b1aa-11ea-ac12-000b00000001"
   },
   "id": "8ae26646-b1aa-11ea-ac12-000b00000001",
   "accountId": "5e8a41b1-a419-11ea-ac12-000c00000001",
   "name": "discountName",
   "active": true,
   "allAgents": false,
   "agentTags": [
     "tag2",
     "tag1"
   ],
   "allProducts": false,
   "assortment": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/833eac42-b6f4-11ea-ac12-000e00000006",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=833eac42-b6f4-11ea-ac12-000e00000003"
       }
     }
   ],
   "productFolders": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/productfolder/39c62b64-a722-11ea-ac12-000d00000015",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productfolder/metadata",
         "type": "productfolder",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=39c62b64-a722-11ea-ac12-000d00000015"
       }
     }
   ]
}
```

### Get a personal discount
Request for a personal discount.

| Parameter | Description |
| ------- | ------------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* discount id. |

> An example of getting a personal discount

```shell
curl -X GET
"https://api.kladana.com/api/remap/1.2/entity/personaldiscount/8ae26646-b1aa-11ea-ac12-000b00000001"
-H "Authorization: Basic <Credentials>"
-H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the personal discount.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/personaldiscount/8ae26646-b1aa-11ea-ac12-000b00000001",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/personaldiscount/metadata",
     "type": "personaldiscount",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#discount/edit?id=8ae26646-b1aa-11ea-ac12-000b00000001"
   },
   "id": "8ae26646-b1aa-11ea-ac12-000b00000001",
   "accountId": "5e8a41b1-a419-11ea-ac12-000c00000001",
   "name": "updated discount",
   "active": false,
   "allAgents": false,
   "agentTags": [
     "tag2",
     "tag1"
   ],
   "allProducts": false,
   "assortment": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/833eac42-b6f4-11ea-ac12-000e00000006",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=833eac42-b6f4-11ea-ac12-000e00000003"
       }
     }
   ],
   "productFolders": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/productfolder/39c62b64-a722-11ea-ac12-000d00000015",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productfolder/metadata",
         "type": "productfolder",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=39c62b64-a722-11ea-ac12-000d00000015"
       }
     }
   ]
}
```

### Change personal discount
Request to change a personal discount. In the body of the request, you must pass the fields that will be updated. When updating array fields, you must pass the new array completely. When an empty array or null is passed, the value of the field is removed.

| Parameter | Description |
| ------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* discount id. |

> Example of updating a personal discount

```shell
curl -X PUT
"https://api.kladana.com/api/remap/1.2/entity/personaldiscount/8ae26646-b1aa-11ea-ac12-000b00000001"
-H "Authorization: Basic <Credentials>"
-H "Accept-Encoding: gzip"
-H "Content-Type: application/json"
-d '{
        "name": "updatedName",
        "active": false,
        "allProducts": false,
        "allAgents": false,
        "agentTags": [
            "tag2"
        ],
        "assortment": [
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/product/833eac42-b6f4-11ea-ac12-000e00000006",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                    "type": "product",
                    "mediaType": "application/json"
                }
            }
        ],
        "productFolders": [
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/product/39c62b64-a722-11ea-ac12-000d00000015",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                    "type": "productfolder",
                    "mediaType": "application/json"
                }
            }
        ]
    }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created personal discount.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/personaldiscount/8ae26646-b1aa-11ea-ac12-000b00000001",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/personaldiscount/metadata",
     "type": "personaldiscount",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#discount/edit?id=8ae26646-b1aa-11ea-ac12-000b00000001"
   },
   "id": "8ae26646-b1aa-11ea-ac12-000b00000001",
   "accountId": "5e8a41b1-a419-11ea-ac12-000c00000001",
   "name": "updatedName",
   "active": false,
   "allProducts": false,
   "allAgents": false,
   "agentTags": [
     "tag2"
   ],
   "assortment": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/833eac42-b6f4-11ea-ac12-000e00000006",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=833eac42-b6f4-11ea-ac12-000e00000003"
       }
     }
   ],
   "productFolders": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/productfolder/39c62b64-a722-11ea-ac12-000d00000015",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productfolder/metadata",
         "type": "productfolder",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=39c62b64-a722-11ea-ac12-000d00000015"
       }
     }
   ]
}
```

### Remove personal discount

Request to remove a personal discount

| Parameter | Description |
| ------- | ----------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Discount ID. |

> Request to remove a personal discount.

```shell
curl -X DELETE
"https://api.kladana.com/api/remap/1.2/entity/personaldiscount/8ae26646-b1aa-11ea-ac12-000b00000001"
-H "Authorization: Basic <Credentials>"
-H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful removal of a personal discount

### Create a special price
Request to create a new special price. Required fields: **name** (name of the discount), **active** (is the discount active), **allProducts** (is the discount valid for all products), **allAgents** (whether there is a discount for all counterparties), **usePriceType** (whether to use a special price).

> Example of creating a new special price

```shell
curl -X POST
"https://api.kladana.com/api/remap/1.2/entity/specialpriceddiscount"
-H "Authorization: Basic <Credentials>"
-H "Accept-Encoding: gzip"
-H "Content-Type: application/json"
-d ' {
          "name": "Special price",
          "active": false,
          "allProducts": false,
          "allAgents": false,
          "usePriceType": true,
          "specialprice": {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/5f441404-a419-11ea-ac12-000a00000078",
                  "type": "pricetype",
                  "mediaType": "application/json"
              }
          },
          "assortment": [
              {
                  "meta": {
                      "href": "https://api.kladana.com/api/remap/1.2/entity/product/833eac42-b6f4-11ea-ac12-000e00000006",
                      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                      "type": "product",
                      "mediaType": "application/json"
                  }
              }
          ],
          "productFolders": [
              {
                  "meta": {
                      "href": "https://api.kladana.com/api/remap/1.2/entity/product/39c62b64-a722-11ea-ac12-000d00000015",
                      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                      "type": "productfolder",
                      "mediaType": "application/json"
                  }
              }
          ]
      }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created special price.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/specialpricediscount/8ae26646-b1aa-11ea-ac12-000b00000001",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/specialpricediscount/metadata",
     "type": "specialpriceddiscount",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#discount/edit?id=8ae26646-b1aa-11ea-ac12-000b00000001"
   },
   "id": "8ae26646-b1aa-11ea-ac12-000b00000001",
   "accountId": "5e8a41b1-a419-11ea-ac12-000c00000001",
   "name": "Special price",
   "active": false,
   "allAgents": false,
   "agentTags": [
     "tag2",
     "tag1"
   ],
   "allProducts": false,
   "usePriceType": true,
   "assortment": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/833eac42-b6f4-11ea-ac12-000e00000006",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=833eac42-b6f4-11ea-ac12-000e00000003"
       }
     }
   ],
   "productFolders": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/productfolder/39c62b64-a722-11ea-ac12-000d00000015",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productfolder/metadata",
         "type": "productfolder",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=39c62b64-a722-11ea-ac12-000d00000015"
       }
     }
   ],
   "specialprice": {
     "value": 0.0,
     "priceType": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/39c62b64-a722-11ea-ac12-000d00000015",
         "type": "pricetype",
         "mediaType": "application/json"
       },
       "id": "39c62b64-a722-11ea-ac12-000d00000015",
       "name": "Sale price",
       "externalCode": "39c62b64-a722-11ea-ac12-000d00000016"
     }
   }
}
```

### Get special price
Request for a special price.

| Parameter | Description|
| ------- | ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* discount id. |

> Example of getting a special price

```shell
curl -X GET
"https://api.kladana.com/api/remap/1.2/entity/specialpricediscount/8ae26646-b1aa-11ea-ac12-000b00000001"
-H "Authorization: Basic <Credentials>"
-H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the special price.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/specialpricediscount/8ae26646-b1aa-11ea-ac12-000b00000001",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/specialpricediscount/metadata",
     "type": "specialpriceddiscount",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#discount/edit?id=8ae26646-b1aa-11ea-ac12-000b00000001"
   },
   "id": "8ae26646-b1aa-11ea-ac12-000b00000001",
   "accountId": "5e8a41b1-a419-11ea-ac12-000c00000001",
   "name": "Special price",
   "active": false,
   "allAgents": false,
   "agentTags": [
     "tag2",
     "tag1"
   ],
   "allProducts": false,
   "usePriceType": true,
   "assortment": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/833eac42-b6f4-11ea-ac12-000e00000006",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=833eac42-b6f4-11ea-ac12-000e00000003"
       }
     }
   ],
   "productFolders": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/productfolder/39c62b64-a722-11ea-ac12-000d00000015",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productfolder/metadata",
         "type": "productfolder",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=39c62b64-a722-11ea-ac12-000d00000015"
       }
     }
   ],
   "specialprice": {
     "value": 0.0,
     "priceType": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/39c62b64-a722-11ea-ac12-000d00000015",
         "type": "pricetype",
         "mediaType": "application/json"
       },
       "id": "39c62b64-a722-11ea-ac12-000d00000015",
       "name": "Sale price",
       "externalCode": "39c62b64-a722-11ea-ac12-000d00000016"
     }
   }
}
```

### Change special price
Request to change the special price. In the body of the request, you must pass the fields that will be updated. When updating array fields, you must pass the new array completely. When an empty array or null is passed, the value of the field is removed.

| Parameter | Description |
| -------- |------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* discount id. |

> Special price update example

```shell
curl -X PUT
"https://api.kladana.com/api/remap/1.2/entity/specialpricediscount/8ae26646-b1aa-11ea-ac12-000b00000001"
-H "Authorization: Basic <Credentials>"
-H "Accept-Encoding: gzip"
-H "Content-Type: application/json"
-d '{
    "name": "updatedName",
    "usePriceType": false,
    "discount": 50
}'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the modified special price.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/specialpricediscount/8ae26646-b1aa-11ea-ac12-000b00000001",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/specialpricediscount/metadata",
     "type": "specialpriceddiscount",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#discount/edit?id=8ae26646-b1aa-11ea-ac12-000b00000001"
   },
   "id": "8ae26646-b1aa-11ea-ac12-000b00000001",
   "accountId": "5e8a41b1-a419-11ea-ac12-000c00000001",
   "name": "updatedName",
   "active": false,
   "allAgents": false,
   "agentTags": [
     "tag2",
     "tag1"
   ],
   "allProducts": false,
   "usePriceType": false,
   "discount": 50,
   "assortment": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/833eac42-b6f4-11ea-ac12-000e00000006",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=833eac42-b6f4-11ea-ac12-000e00000003"
       }
     }
   ],
   "productFolders": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/productfolder/39c62b64-a722-11ea-ac12-000d00000015",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productfolder/metadata",
         "type": "productfolder",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=39c62b64-a722-11ea-ac12-000d00000015"
       }
     }
   ],
   "specialprice": {
     "value": 0.0,
     "priceType": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/39c62b64-a722-11ea-ac12-000d00000015",
         "type": "pricetype",
         "mediaType": "application/json"
       },
       "id": "39c62b64-a722-11ea-ac12-000d00000015",
       "name": "Sale price",
       "externalCode": "39c62b64-a722-11ea-ac12-000d00000016"
     }
   }
}
```

### Remove special price

Request to remove a special price.

| Parameter | Description |
| -------- |------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Discount ID. |

> Request to remove a special price.

```shell
curl -X DELETE
"https://api.kladana.com/api/remap/1.2/entity/specialpricediscount/8ae26646-b1aa-11ea-ac12-000b00000001"
-H "Authorization: Basic <Credentials>"
-H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful removal of special price

### Change the paise rounding
Request to change the rounding of paise. In the body of the request, you must pass the fields that will be updated (**name** or **active**). The response will also include the **agentTags** and **allAgents** fields, but they cannot be changed.

| Parameter | Description |
| -------- |------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Discount ID for rounding of paise. |

> Example of paise rounding updating

```shell
curl -X PUT
"https://api.kladana.com/api/remap/1.2/entity/discount/8ae26646-b1aa-11ea-ac12-000b00000001"
-H "Authorization: Basic <Credentials>"
-H "Accept-Encoding: gzip"
-H "Content-Type: application/json"
-d '{
    "name": "updatedName",
    "active": true
}'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the changed rounding of cents.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/discount/8ae26646-b1aa-11ea-ac12-000b00000001",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/discount/metadata",
     "type": "discount",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#discount/edit?id=8ae26646-b1aa-11ea-ac12-000b00000001"
   },
   "id": "8ae26646-b1aa-11ea-ac12-000b00000001",
   "accountId": "5e8a41b1-a419-11ea-ac12-000c00000001",
   "name": "updatedName",
   "active": true,
   "allAgents": true,
   "agentTags": []
}
```
