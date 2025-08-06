## Batch
### Batch

The entity code for batches in the JSON API is the **consignment** keyword.

This entity can be contextually searched using the special `search` parameter. [Learn more](../#kladana-json-api-general-info-context-search). The search with the search parameter differs from others in that the search is not prefixed, without tokenization, and only goes through one field at a time. Searches for strings that include the value of the search string.

The search among the objects of the batches for matching the search string will be carried out using the following fields:

+ by batch name **name**
+ according to the batch description **description**

#### Entity attributes

| Title | Type | Filtration | Description |
| ------| ------ | ------ | ------- |
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **archived**     | Boolean | `=` `!=` | Whether the batch is archived<br>`+Required when replying`  |
| **attributes** | [Meta](../#kladana-json-api-general-info-metadata) | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Collection of additional fields of the batch<br>`+Required when replying` `+Required when creating` |
| **assortment**   | [Meta](../#kladana-json-api-general-info-metadata) |  | Metadata of the product/service/bundle represented by the component<br>`+Required when replying` `+Expand` `+Required when creating` |
| **barcodes** | Array(Object) | `=` `!=` `~` `~=` `=~` | Batch barcodes. To filter by this field, use its singular form - **barcode**. |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Batch Code |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Batches Description |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | External Batches Code<br>`+Required when replying` |
| **id** | UUID | `=` `!=` | Batch ID<br>`+Required when replying` `+Read only` |
| **images** | [Meta](../#kladana-json-api-general-info-metadata) | | Image of the product to which this batch belongs |
| **label** | String(255) | | Batch Label<br>`+Required when replying` `+Required when creating` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Batches Metadata<br>`+Required when replying`|
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Batch Name. "Collected" and displayed as "Product Name / Batch Label"<br>`+Required when replying` `+Read Only` |
| **updated** | DateTime | `=` `!=` `<` `>` `<=` `>=` | When the entity was last updated<br>`+Required when replying` `+Read-only` |

#### Nested entity attributes
##### Batch Metadata

You can view all the characteristics of the batches created in the main interface using the request for obtaining the metadata of the batches.

The response is an object, with the following structure:

| Title | Type | Description |
| ------ | ------- |--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Batches Metadata<br>`+Required when answering` |
| **attributes** | Array(Object) | Collection of additional fields |

### Get a list of Batches

Request to get a list of all custom batches on this account.
<u>Batches will not be displayed by default.</u>
The result of a successful request is a JSON representation of a list of batches with the following fields:

| Title | Type | Description |
| ------ | ------- |--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the batches. |

**Parameters**

| Parameter | Description |
| ------ | ------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get List of Batches

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/consignment"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of a list of custom batches.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/consignment",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/consignment/metadata",
     "type": "consignment",
     "mediaType": "application/json",
     "size": 1,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/consignment/c66f4b17-36e7-11e7-8a7f-40d000000113",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/consignment/metadata",
         "type": "consignment",
         "mediaType": "application/json"
       },
       "id": "c66f4b17-36e7-11e7-8a7f-40d000000113",
       "accountId": "103bff1b-36e7-11e7-8a7f-40d000000004",
       "updated": "2017-05-12 10:51:15",
       "name": "product/consignment",
       "code": "1012",
       "archived": false,
       "externalCode": "g9BOLNRZglk9NMOHxcrVV0",
       "label": "consignment",
       "barcodes": [
         {
           "ean8": "20000000"
         },
         {
           "ean13": "2000000000000"
         },
         {
           "code128": "code128 barcode"
         }
       ],
       "images": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/35427052-36e7-11e7-8a7f-40d0000000d1/images",
           "type": "image",
           "mediaType": "application/json",
           "size": 1,
           "limit": 1000,
           "offset": 0
         }
       },
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/35427052-36e7-11e7-8a7f-40d0000000d1",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json"
         }
       }
     }
   ]
}
```

### Create Batches

Request to create a new batch. To successfully create a batch, the fields must be passed **label** and **assortment**.

> An example of creating a new batch.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/consignment"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'{
            "label": "Label",
            "barcodes": [
                {
                    "ean8": "20000000"
                },
                {
                    "ean13": "2000000000000"
                },
                {
                    "code128": "code128 barcode"
                }
            ],
            "assortment": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a83c422-3c64-11e6-8a84-bae500000012",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                    "type": "variant",
                    "mediaType": "application/json"
                }
            }
        }'
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the created batches.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/consignment/17a32a0a-5310-11e6-8a84-bae500000000",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/consignment/metadata",
     "type": "consignment",
     "mediaType": "application/json"
   },
   "id": "17a32a0a-5310-11e6-8a84-bae500000000",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "updated": "2016-07-26 12:05:25",
   "name": "fatsfatsfvf (dfvtsf) / Label",
   "externalCode": "NptSJ1REgVkhqCV0RlyfV0",
   "archived": false,
   "label": "Label",
   "barcodes": [
     {
       "ean8": "20000000"
     },
     {
       "ean13": "2000000000000"
     },
     {
       "code128": "code128 barcode"
     }
   ],
   "assortment": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a83c422-3c64-11e6-8a84-bae500000012",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
       "type": "variant",
       "mediaType": "application/json"
     }
   }
}
```


### Delete Batches

**Parameters**

| Parameter | Description |
| ------ | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Batch ID. |

> Request to delete Batches with specified ID.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/consignment/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful deletion of the Batches.

### Batches bulk delete

In the body of the request, you need to pass an array containing the JSON metadata of the batches you want to delete.


> Request for bulk deletion of batches.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/consignment/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/consignment/7944ef04-f831-11e5-7a69-971500188b1",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/consignment/metadata",
                "type": "consignment",
                "mediaType": "application/json"
            }
        },
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/consignment/7944ef04-f831-11e5-7a69-971500188b2",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/consignment/metadata",
                "type": "consignment",
                "mediaType": "application/json"
            }
        }
      ]'
```

> Successful request. The result is JSON information about the deletion of the batches.

```json
[
   {
     "info":"Entity 'consignment' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'consignment' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Batches bulk creating and update

[Batches bulk creating and update](../#kladana-json-api-general-info-create-and-update-multiple-objects).
In the body of the request, you need to pass an array containing the JSON representation of the batches you want to create or update.

Updated batches must contain the identifier in the form of metadata.

> Example of creating and updating multiple batches

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/consignment"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "label": "Label","barcodes": [
                 {
                   "ean8": "20000000"
                 },
                 {
                   "ean13": "2000000000000"
                 },
                 {
                   "code128": "code128 barcode"
                 }
               ],
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a83c422-3c64-11e6-8a84-bae500000012",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                   "type": "variant",
                   "mediaType": "application/json"
                 }
               }
             },
             {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/consignment/17a32a0a-5310-11e6-8a84-bae500000000",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/consignment/metadata",
                 "type": "consignment",
                 "mediaType": "application/json"
               },
               "code": "ke21k421c1o42n4signment12",
               "externalCode": "fbajkwbfu1249SACSKW241LKSFA2sa1",
               "description": "It is better to track product batches with this name",
               "label": "Strange Goods",
               "barcodes": [
                 {
                   "ean8": "20000000"
                 },
                 {
                   "ean13": "2000000000000"
                 },
                 {
                   "code128": "code128 barcode"
                 }
               ],
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                   "type": "variant",
                   "mediaType": "application/json"
                 }
               }
             }
           ]'
```

> Response 200 (application/json)
Successful request. The result is a JSON array of representations of the created and updated batches.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/consignment/17a32a0a-5310-11e6-8a84-bae500000000",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/consignment/metadata",
       "type": "consignment",
       "mediaType": "application/json"
     },
     "id": "17a32a0a-5310-11e6-8a84-bae500000000",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "updated": "2016-07-26 12:05:25",
     "name": "fatsfatsfvf (dfvtsf) / Label",
     "externalCode": "NptSJ1REgVkhqCV0RlyfV0",
     "archived": false,
     "label": "Label",
     "barcodes": [
       {
         "ean8": "20000000"
       },
       {
         "ean13": "2000000000000"
       },
       {
         "code128": "code128 barcode"
       }
     ],
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a83c422-3c64-11e6-8a84-bae500000012",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       }
     }
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/consignment/17a32a0a-5310-11e6-8a84-bae500000000",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/consignment/metadata",
       "type": "consignment",
       "mediaType": "application/json"
     },
     "id": "17a32a0a-5310-11e6-8a84-bae500000000",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "updated": "2016-07-26 12:05:25",
     "name": "fatsfatsfvf (obkhets) / Strange goods",
     "description": "It's better to track product batches with this name",
     "code": "ke21k421c1o42n4signment12",
     "archived": false,
     "externalCode": "fbajkwbfu1249SACSKW241LKSFA2sa1",
     "label": "Strange Goods",
     "barcodes": [
       {
         "ean8": "20000000"
       },
       {
         "ean13": "2000000000000"
       },
       {
         "code128": "code128 barcode"
       }
     ],
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       }
     }
   }
]
```

### Batch Metadata
#### Batch Metadata

Request for batch metadata. The result is a JSON object including:

| Title | Type | Description |
| ------ | ------- |---------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata<br>`+Required when answering` |
| **attributes** | Array(Object) | Collection of additional  fields|

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Get batch metadata

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/consignment/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the batches metadata.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/consignment",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/consignment/metadata/attributes/83dc3e6c-3bbf-11e7-8a7f-40d000000001",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "83dc3e6c-3bbf-11e7-8a7f-40d000000001",
       "name": "string",
       "type": "string",
       "required": false
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/consignment/metadata/attributes/958b275e-3bbf-11e7-8a7f-40d000000004",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "958b275e-3bbf-11e7-8a7f-40d000000004",
       "name": "number",
       "type": "long",
       "required": false
     }
   ]
}
```


### Separate additional field

**Parameters**

| Parameter | Description |
| ------ | ------- |
| **id** | `string` (required) *Example: 958b275e-3bbf-11e7-8a7f-40d000000004* fields id. |

#### Separate additional field
 
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/consignment/metadata/attributes/958b275e-3bbf-11e7-8a7f-40d000000004"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/consignment/metadata/attributes/958b275e-3bbf-11e7-8a7f-40d000000004",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "958b275e-3bbf-11e7-8a7f-40d000000004",
   "name": "number",
   "type": "long",
   "required": false
}
```


### Batches


**Parameters**

| Parameter | Description |
| ------ | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Batch ID |

### Get Batches
 
> Request to get a batch with the specified ID.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/consignment/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the custom batches.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/consignment/c66f4b17-36e7-11e7-8a7f-40d000000113",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/consignment/metadata",
     "type": "consignment",
     "mediaType": "application/json"
   },
   "id": "c66f4b17-36e7-11e7-8a7f-40d000000113",
   "accountId": "103bff1b-36e7-11e7-8a7f-40d000000004",
   "updated": "2017-05-12 10:51:15",
   "name": "product/consignment",
   "code": "1012",
   "archived": false,
   "externalCode": "g9BOLNRZglk9NMOHxcrVV0",
   "label": "consignment",
   "barcodes": [
     {
       "ean8": "20000000"
     },
     {
       "ean13": "2000000000000"
     },
     {
       "code128": "code128 barcode"
     }
   ],
   "images": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/35427052-36e7-11e7-8a7f-40d0000000d1/images",
       "type": "image",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   },
   "assortment": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/35427052-36e7-11e7-8a7f-40d0000000d1",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json"
     }
   }
}
```

### Change Batches
 
  **Parameters**
 
| Parameter | Description |
| ------ | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Batch ID. |

Batches update request. You can only update fields that are not marked `Read Only`

> An example of a batch update request.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/consignment/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorityzation:Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "code": "ke21k421c1o42n4signment12",
             "externalCode": "fbajkwbfu1249SACSKW241LKSFA2sa1",
             "description": "It is better to track product batch with this name",
             "label": "Strange Goods",
             "barcodes": [
               {
                 "ean8": "20000000"
               },
               {
                 "ean13": "2000000000000"
               },
               {
                 "code128": "code128 barcode"
               }
             ],
             "assortment": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                 "type": "variant",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the updated batches.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/consignment/17a32a0a-5310-11e6-8a84-bae500000000",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/consignment/metadata",
     "type": "consignment",
     "mediaType": "application/json"
   },
   "id": "17a32a0a-5310-11e6-8a84-bae500000000",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "updated": "2016-07-26 12:05:25",
   "name": "fatsfatsfvf (obkhets) / Strange goods",
   "description": "It's better to track product batches with this name",
   "code": "ke21k421c1o42n4signment12",
   "archived": false,
   "externalCode": "fbajkwbfu1249SACSKW241LKSFA2sa1",
   "label": "Strange Goods",
   "barcodes": [
     {
       "ean8": "20000000"
     },
     {
       "ean13": "2000000000000"
     },
     {
       "code128": "code128 barcode"
     }
   ],
   "assortment": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
       "type": "variant",
       "mediaType": "application/json"
     }
   }
}
```
