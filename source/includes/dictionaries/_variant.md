## Product variant
### Product variants

Using the JSON API, you can create and update information about Product variants, query lists of Product variants, and information on individual Product variants. The entity code for a Product variant in the JSON API is the **variant** keyword.

Learn more about [Product variants](https://kladana.zendesk.com/hc/en-us/articles/360009722997-Manage-product-variants), [Products](https://kladana.zendesk.com/hc/en-us/articles/4435291832465-Overview-of-Products-and-Services).

This entity can be contextually searched using the special `search` parameter. [Learn more](../#kladana-json-api-general-info-context-search). The search with the search parameter differs from others in that the search is not prefixed, without tokenization, and only goes through one field at a time. Searches for strings that include the value of the search string.

The search among the objects of Product variants to match the search string will be carried out in the following fields:

+ by product name with Product variant **name**

It is possible to filter the list of Product variants by product **id** - filtering parameter **productid**. The available filter operators are `=` `!=` .
You can read more about filtering in the section [Filtering a selection using the filter parameter](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter)

Examples:

+ `filter=productid=677c4032-8667-11e6-8a84-bae500003344`
+ `filter=productid!=677c4032-8667-11e6-8a84-bae500003344`
+ `filter=productid=677c4032-8667-11e6-8a84-bae500003344;productid=421c4032-4709-31e4-1d2r-awe5000025me`

#### Entity Attributes

| Title | Type                                               | Filtration | Description |
| ------|----------------------------------------------------| ------- | ------- |
| **accountId** | UUID                                               | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **archived** | Boolean                                            | `=` `!=` | Whether the product was added to the archive<br>`+Required when replying` |
| **barcodes** | Array(Object)                                      | `=` `!=` `~` `~=` `=~` | An array of Product variant barcodes. [Learn more](../dictionaries/#entities-product-variant-product-variants-nested-entity-attributes-barcodes) |
| **buyprice** | Object                                             | | Purchase price |
| **characteristics** | Array(Object)                                      | | Characteristics Product variants. [Learn more](../dictionaries/#entities-product-variant-product-variants-nested-entity-attributes-product-variant-metadata-characteristics-of-product-variant)<br>`+Required when answering` `+Required when creating` |
| **code** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Product variant Code |
| **description**        | String(4096)	                                             |      | Product variant Description |
| **discountProhibited** | Boolean                                            | | Sign of prohibition of discounts<br>`+Required when answering` |
| **externalCode** | String(255)                                        | `=` `!=` `~` `~=` `=~` | External Product variant Code<br>`+Orequired when replying` |
| **id** | UUID                                               | `=` `!=` | Product variant ID<br>`+Required for response` `+Read only` |
| **images** | MetaArray                                          | | [Images](../dictionaries/#entities-image) array metadata (Maximum number of images - 10)<br>`+Required when replying` `+Expand` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Product variant Metadata<br>`+Required when replying` |
| **minPrice** | Object                                             | | Minimum price. [Learn more](../dictionaries/#entities-bundle-bundles-nested-entity-attributes-minimum-price) |
| **name** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Product name with Product variant<br>`+Required when replying` |
| **packs** | Array(Object)                                      | | Product variant packages [Learn more](../dictionaries/#entities-product-variant-product-variants-loading-packaging-product-variants) |
| **product** | [Meta](../#kladana-json-api-general-info-metadata) | | Metadata of the [product](../dictionaries/#entities-product) to which the Product variant is attached<br>`+Required when replying` `+Expand` `+Required when creating` |
| **salePrice** | Array(Object)                                      | | Sale prices. [Learn more](../dictionaries/#entities-product-variant-product-variants-loading-sales-prices) |
| **things** | Array(String)                                      | | Serial Numbers<br>`+Read Only` |
| **updated** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | When the entity was last updated<br>`+Required for response` `+Read-only` |

#### Attributes available for sorting

| Title | Description |
| ------ | --------- |
| **code** | Product variant Code |
| **externalCode** | External Code Product variants |
| **archived** | Is the product added to the archive |

#### Nested entity attributes

##### Barcodes:
When creating a barcode, you need to describe an object with a field that is a lowercase barcode representation format with the string value of the barcode itself. The names of the fields of a separate object representing a barcode:

| Title    | Description   |
| --------- | ------- |
| **ean13**   | barcode in EAN13 format if you want to generate an EAN13 barcode                                       |
| **ean8**    | barcode in EAN8 format if you want to generate an EAN8 barcode                                         |
| **code128** | barcode in Code128 format, if you want to create a barcode in formsate Code128                         |
| **gtin**    | barcode in GTIN format, if you want to generate a barcode in GTIN format. Validated against GS1 format |
| **upc**     | barcode in UPC format, if you want to generate a barcode in UPC format                                 |

To update the list of barcodes, it is necessary to transfer their complete list, including both old and new values.
Missing barcode values will be removed during the update. When updating the list of barcodes, only new values are validated.
Previously stored barcodes are not validated. That is, if one of the old barcodes does not meet the validation requirements, then there will be no error when updating the list.
If an empty list of barcodes or a list of empty values is passed to the input, then the previously created barcodes will be deleted.

Features of creating a list of barcodes when creating a set:

+ If you pass a list of barcodes to the input, then the received barcode values are saved, and empty values are ignored.
+ If you pass a list of empty barcode values to the input, then no barcodes will be created for the products.
+ If you do not pass the barcodes attribute to the input or pass an empty list in it, then by default one random barcode of the EAN13 type will be created for the product.

Learn more about [bundle fields](../#kladana-json-api-general-info-additional-fields)

##### Product variant Metadata
The Product variant Metadata contains information about the characteristics of the Product variants as well as price types.
Characteristics Product variants are an internal collection of **characteristics**. Represented as an array of objects with fields:

| Title | Type | Description |
| ------ | --------- |-------- |
| **id** | UUID | ID of the corresponding feature<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Characteristic metadata<br>`+Required for response` |
| **name** | String(255) | Characteristic name<br>`+Required when answering` |
| **value** | String(255) | Feature value<br>`+Required for response` `+Required for creation` |

View all characteristics of Product variants created in the main interface,
as well as all types of prices, you can use the request to obtain the metadata of Product variants.
The response is an object, with the following structure:

| Title | Type | Description |
| ------ | --------- |------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata<br>`+Required when replying` |
| **characteristics** | Array(Object) | Collection of all created characteristics of Product variants<br>`+Required when answering` |

Structures of individual collection objects:

###### Characteristics of Product variant
| Title | Type | Description |
| ------ | --------- |-------- |
| **id** | UUID | ID of the corresponding feature<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Characteristic metadata<br>`+Required for response` |
| **name** | String(255) | Characteristic name<br>`+Required when answering` |
| **required** | Boolean | Flag indicating whether the feature is required<br>`+Required for response` |
| **type** | String(255) | Feature value type<br>`+Required for response` |

##### Image: structure and loading 
When requesting a Product variant with images, a json representation of this Product variant containing the **images** field will be displayed. This field is
an array of elements. **images** field elements have fields:

| Title | Type                                               | Description |
| ------ |----------------------------------------------------|-------- |
| **filename** | String(255)                                        | File name<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **miniature** | [Meta](../#kladana-json-api-general-info-metadata) | Image thumbnail metadata<br>`+Required when replying` |
| **size** | Int                                                | File size in bytes<br>`+Required when replying` |
| **tiny** | [Meta](../#kladana-json-api-general-info-metadata) | Thumbnail metadata<br>`+Required when replying` |
| **title** | String(255)                                        | Image Title<br>`+Required when replying` |
| **updated** | DateTime                                           | File upload time to server<br>`+Required when replying` |

#### Loading

To upload images, you need in the body of the request to [create](../dictionaries/#entities-product-variant-create-product-variant) or [update](../dictionaries/#entities-product-variant-change-product-variant) Product variants
specify the **images** field with a list of elements that have the following attributes:

| Title | Description |
| ------ | --------- |
| **filename** | filename with extension . For example - "banana.png" |
| **content** | Base64 encoded image. |

If in the update request **images** contains an empty array of elements, then all Images from the Product variant will be deleted,
because the server will assume that the user wants to update the list of Product variant Images.

The API documentation for working with Images can be found in the [Image](../dictionaries/#entities-image) chapter.

##### Sales prices
If the Product variant does not have separate sales prices, the corresponding sales prices of the product will be displayed in the response.

| Title | Type                                               | Description |
| ------ |----------------------------------------------------|----- |
| **value** | Float                                              | Price value<br>`+Required when answering` |
| **currency** | [Meta](../#kladana-json-api-general-info-metadata) | Reference to the currency in the format [Metadata](../#kladana-json-api-general-info-metadata)<br>`+Required when replying` `+Expand` |
| **priceType** | Object                                             | Price type<br>`+Required when replying` |

##### Minimum price

| Title | Type                                               | Description |
| ------ |----------------------------------------------------|------ |
| **value** | Float                                              | Price value<br>`+Required when answering` |
| **currency** | [Meta](../#kladana-json-api-general-info-metadata) | Reference to the currency in the format [Metadata](../#kladana-json-api-general-info-metadata)<br>`+Required when replying` `+Expand` |

##### Packaging Product variants

| Title | Type | Description |
| ------ | --------- |------- |
| **barcodes** | Array(Object) | An array of barcodes for the packaging of the Product variant. This array can contain only one barcode<br>`+Required when replying` |
| **id** | UUID | Package ID of Product variant<br>`+Required for response` `+Read-only`|
| **parentpack** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the parent package (product package) for which the barcode is overridden<br>`+Required for response` `+Expand` |

### Get a list of Product variants 
Request for a list of all Product variants on the account.
The result of a successful request is a JSON representation of the list of Product variants with the listed fields:

| Title | Type | Description |
| ------ | --------- |----- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Product variants. |


**Parameters**

| Parameter | Description |
| ------ | --------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get a list of Product variants

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/variant"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Product variants.

```json
{
   "context": {
     "employee": {
       "href": "https://api.kladana.com/api/remap/1.2/context/employee",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/variant/",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
     "type": "variant",
     "mediaType": "application/json",
     "size": 1,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/66cc36dc-f7d2-11e5-8a84-bae500000074/671402e4-f7d2-11e5-8a84-bae50000007c",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "id": "671402e4-f7d2-11e5-8a84-bae50000007c",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "updated": "2016-04-01 09:24:34",
       "name": "ProductManyProduct variants (1, 100, 10)",
       "code": "00005",
       "externalCode": "rAhHA0T1glL2xY3d1aHFT2",
       "archived": false,
       "discountProhibited": false,
       "characteristics": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/7a6078e4-3c64-11e6-8a84-bae500000003",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "7a6078e4-3c64-11e6-8a84-bae500000003",
           "name": "Color",
           "value": "red"
         },
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/7a6078e4-3c64-11e6-8a84-bae500000003",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "7a6078e4-3c64-11e6-8a84-bae500000003",
           "name": "Fresh",
           "value": "Fresh"
         },
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/7a6078e4-3c64-11e6-8a84-bae500000003",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "7a6078e4-3c64-11e6-8a84-bae500000003",
           "name": "Taste",
           "value": "Delicious"
         }
       ],
       "images": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/variant/671402e4-f7d2-11e5-8a84-bae50000007c/images",
           "type": "image",
           "mediaType": "application/json",
           "size": 0,
           "limit": 1000,
           "offset": 0
         }
       },
       "buyPrice": {
         "value": 0.0
       },
       "salePrices": [
         {
           "value": 0.0,
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
         },
         {
           "value": 0,
           "priceType": {
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
               "type": "pricetype",
               "mediaType": "application/json"
             },
             "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
             "name": "Price for friends",
             "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
           }
         },
         {
           "value": 0,
           "priceType": {
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f4444",
               "type": "pricetype",
               "mediaType": "application/json"
             },
             "id": "672559f1-cbf3-11e1-9eb9-889ffa6f4444",
             "name": "Price for competitors",
             "externalCode": "cbcf493b-55bc-11d9-848a-00112f434444"
           }
         }
       ],
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
       "product": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/66ccbc9f-f7d2-11e5-8a84-bae500000076",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json"
         }
       }
     }
   ]
}
```


### Create Product variant
Create a new Product variant. To create a new Product variant, the fields **product**, **characteristics** are required.
The **characteristics** field is specified as an array of objects with the following structure:

| Title | Type | Description |
| ------ | --------- |-------- |
| **id** | UUID | ID characteristics |
| **name** | String(255) | Characteristic name |
| **value** | String(255) | Feature value<br>`+Required for response` `+Required for creation` |

If the **id** field is not specified for any object of the characteristic, the corresponding object is searched for
characteristics by field **name**. If neither **id** nor **name** are specified, then an error will occur.

> An example of a request to create a new Product variant linked to an existing product.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/variant"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "(overripe, yellow)",
            "characteristics": [
                {
                    "id": "627610e3-2cb1-11e6-8a84-bae500000054",
                    "value": "overripe"
                },
                {
                    "id": "627617d8-2cb1-11e6-8a84-bae500000055",
                    "value": "black"
                }
            ],
            "minPrice": {
                "value": 500.0,
                "currency": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                        "type": "currency",
                        "mediaType": "application/json"
                    }
                }
            },
            "buyPrice": {
                "value": 20.0
            },
            "salePrices": [
                {
                    "value": 900.0,
                    "priceType": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
                            "type": "pricetype",
                            "mediaType": "application/json"
                        }
                    }
                },
                {
                    "value": 102,
                    "priceType": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
                            "type": "pricetype",
                            "mediaType": "application/json"
                        }
                    }
                },
                {
                    "value": 200,
                    "priceType": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f4444",
                            "type": "pricetype",
                            "mediaType": "application/json"
                        }
                    }
                }
            ],
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
            "product": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/product/86951fbe-2cb0-11e6-8a84-bae500000043",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                    "type": "product",
                    "mediaType": "application/json"
                }
            }
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Product variant.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/variant/14553caa-2cb2-11e6-8a84-bae500000026",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
     "type": "variant",
     "mediaType": "application/json"
   },
   "id": "14553caa-2cb2-11e6-8a84-bae500000026",
   "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
   "updated": "2016-06-07 16:16:43",
   "name": "Banana (overripe, black)",
   "code": "00011",
   "externalCode": "tQcC7LdEjTZMh85Em6FTW1",
   "archived": false,
   "discountProhibited": false,
   "characteristics": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/627610e3-2cb1-11e6-8a84-bae500000054",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "627610e3-2cb1-11e6-8a84-bae500000054",
       "name": "Ripe",
       "value": "overripe"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/627617d8-2cb1-11e6-8a84-bae500000055",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "627617d8-2cb1-11e6-8a84-bae500000055",
       "name": "Color",
       "value": "black"
     }
   ],
   "images": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/14553caa-2cb2-11e6-8a84-bae500000026/images",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "buyPrice": {
     "value": 20.0
   },
   "salePrices": [
     {
       "value": 900.0,
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
     },
     {
       "value": 102,
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
         "name": "Price for friends",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
       }
     },
     {
       "value": 200,
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f4444",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f4444",
         "name": "Price for competitors",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f434444"
       }
     }
   ],
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
   "product": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/86951fbe-2cb0-11e6-8a84-bae500000043",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json"
     }
   }
}
```

### Product variants bulk creating and update

[Product variants bulk creating and update](../#kladana-json-api-general-info-create-and-update-multiple-objects).

In the body of the request, you need to pass an array containing the JSON representation of the Product variants that you want to create or update.
Updated Product variants must contain the identifier in the form of metadata.

> An example of creating and updating several Product variants

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/variant"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
            {
                "name": "(overripe, yellow)",
                "characteristics": [
                    {
                        "id": "627610e3-2cb1-11e6-8a84-bae500000054",
                        "value": "overripe"
                    },
                    {
                        "id": "627617d8-2cb1-11e6-8a84-bae500000055",
                        "value": "black"
                    }
                ],
                "minPrice": {
                    "value": 500.0,
                    "currency": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                            "type": "currency",
                            "mediaType": "application/json"
                        }
                    }
                },
                "buyPrice": {
                    "value": 20.0
                },
                "salePrices": [
                    {
                        "value": 900.0,
                        "priceType": {
                            "meta": {
                                "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
                                "type": "pricetype",
                                "mediaType": "application/json"
                            }
                        }
                    },
                    {
                        "value": 102,
                        "priceType": {
                            "meta": {
                                "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
                                "type": "pricetype",
                                "mediaType": "application/json"
                            }
                        }
                    },
                    {
                        "value": 200,
                        "priceType": {
                            "meta": {
                                "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f4444",
                                "type": "pricetype",
                                "mediaType": "application/json"
                            }
                        }
                    }
                ],
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
                "product": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/product/86951fbe-2cb0-11e6-8a84-bae500000043",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                        "type": "product",
                        "mediaType": "application/json"
                    }
                }
            },
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/variant/b2347044-181d-11e6-9464-e4de00000015",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                    "type": "variant",
                    "mediaType": "application/json"
                },
                "characteristics": [
                    {
                        "id": "07e9aa56-137b-11e6-9464-e4de000000e7",
                        "value": "Medium"
                    },
                    {
                        "id": "07e9b661-137b-11e6-9464-e4de000000e8",
                        "value": "orange"
                    },
                    {
                        "id": "60907bc8-137b-11e6-9464-e4de00000155",
                        "value": "Fresh"
                    }
                ],
                "code": "orangeCode",
                "externalCode": "orange303",
                "buyPrice": {
                    "value": 700.0
                },
                "salePrices": [
                    {
                        "value": 1100.0,
                        "priceType": {
                            "meta": {
                                "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
                                "type": "pricetype",
                                "mediaType": "application/json"
                            }
                        }
                    },
                    {
                        "value": 702,
                        "priceType": {
                            "meta": {
                                "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
                                "type": "pricetype",
                                "mediaType": "application/json"
                            }
                        }
                    },
                    {
                        "value": 200,
                        "priceType": {
                            "meta": {
                                "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f4444",
                                "type": "pricetype",
                                "mediaType": "application/json"
                            }
                        }
                    }
                ],
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
                "minPrice": {
                    "value": 500.0,
                    "currency": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                            "type": "currency",
                            "mediaType": "application/json"
                        }
                    }
                }
            }
        ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Product variants.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/14553caa-2cb2-11e6-8a84-bae500000026",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
       "type": "variant",
       "mediaType": "application/json"
     },
     "id": "14553caa-2cb2-11e6-8a84-bae500000026",
     "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
     "updated": "2016-06-07 16:16:43",
     "name": "Banana (overripe, black)",
     "code": "00011",
     "externalCode": "tQcC7LdEjTZMh85Em6FTW1",
     "archived": false,
     "discountProhibited": false,
     "characteristics": [
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/627610e3-2cb1-11e6-8a84-bae500000054",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "627610e3-2cb1-11e6-8a84-bae500000054",
         "name": "Ripe",
         "value": "overripe"
       },
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/627617d8-2cb1-11e6-8a84-bae500000055",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "627617d8-2cb1-11e6-8a84-bae500000055",
         "name": "Color",
         "value": "black"
       }
     ],
     "images": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/14553caa-2cb2-11e6-8a84-bae500000026/images",
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
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       }
     },
     "buyPrice": {
       "value": 20.0
     },
     "salePrices": [
       {
         "value": 900.0,
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
       },
       {
         "value": 102,
         "priceType": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
             "type": "pricetype",
             "mediaType": "application/json"
           },
           "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
           "name": "Price for friends",
           "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
         }
       },
       {
         "value": 200,
         "priceType": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f4444",
             "type": "pricetype",
             "mediaType": "application/json"
           },
           "id": "672559f1-cbf3-11e1-9eb9-889ffa6f4444",
           "name": "Price for competitors",
           "externalCode": "cbcf493b-55bc-11d9-848a-00112f434444"
         }
       }
     ],
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
     "product": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/86951fbe-2cb0-11e6-8a84-bae500000043",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       }
     }
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/b2347044-181d-11e6-9464-e4de00000015",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
       "type": "variant",
       "mediaType": "application/json"
     },
     "id": "b2347044-181d-11e6-9464-e4de00000015",
     "accountId": "305f25aa-137a-11e6-9464-e4de00000001",
     "updated": "2016-05-12 11:56:15",
     "name": "Oranges (Medium, Orange, Fresh)",
     "code": "orangeCode",
     "externalCode": "orange303",
     "archived": false,
     "discountProhibited": false,
     "characteristics": [
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/627610e3-2cb1-11e6-8a84-bae500000054",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "07e9aa56-137b-11e6-9464-e4de000000e7",
         "name": "Size",
         "value": "Medium"
       },
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/627610e3-2cb1-11e6-8a84-bae500000054",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "07e9b661-137b-11e6-9464-e4de000000e8",
         "name": "Color",
         "value": "orange"
       },
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/627610e3-2cb1-11e6-8a84-bae500000054",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "60907bc8-137b-11e6-9464-e4de00000155",
         "name": "Fresh",
         "value": "Fresh"
       }
     ],
     "images": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/b2347044-181d-11e6-9464-e4de00000015/images",
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
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       }
     },
     "buyPrice": {
       "value": 700.0
     },
     "salePrices": [
       {
         "value": 1100.0,
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
       },
       {
         "value": 702,
         "priceType": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
             "type": "pricetype",
             "mediaType": "application/json"
           },
           "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
           "name": "Price for friends",
           "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
         }
       },
       {
         "value": 200,
         "priceType": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f4444",
             "type": "pricetype",
             "mediaType": "application/json"
           },
           "id": "672559f1-cbf3-11e1-9eb9-889ffa6f4444",
           "name": "Price for competitors",
           "externalCode": "cbcf493b-55bc-11d9-848a-00112f434444"
         }
       }
     ],
     "barcodes": [
       {
         "ean8": "20000000"
       },
       {
         "ean13": "2000000000000"
       },
       {"code128": "code128 barcode"
       },
       {
         "gtin": "00000000000130"
       }
     ],
     "product": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/07ed3a66-137b-11e6-9464-e4de000000eb",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       }
     }
   }
]
```

### Remove Product variant

**Parameters**

| Parameter | Description |
| ------ | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product variant id. |

> Request to remove the Product variant with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/variant/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful removal of the Product varian

### Product variants bulk removal

In the body of the request, you need to pass an array containing the JSON metadata of the Product variants that you want to remove.


> Request for bulk removal of Product variants.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/variant/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7944ef04-f831-11e5-7a69-971500188b1",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
             "type": "variant",
             "mediaType": "application/json"
           }
         },
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7944ef04-f831-11e5-7a69-971500188b2",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
             "type": "variant",
             "mediaType": "application/json"
           }
         }
       ]'
```

> Successful request. The result is JSON information about the removal of Product variants.

```json
[
   {
     "info":"Entity 'variant' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'variant' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Product variant Metadata
#### Product variant Metadata

Request to get metadata of Product variants. The result is a JSON object including:

| Title | Type | Description |
| ------ | --------- |------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata<br>`+Required when replying` |
| **characteristics** | Array(Object) | Collection of all created characteristics of Product variants<br>`+Required when answering` |

> Get Product variant metadata

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/variant/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Product variant's metadata.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
     "mediaType": "application/json"
   },
   "characteristics": [
     {
       "id": "fd68704f-f67d-11e5-8a84-bae50000006b",
       "name": "feature",
       "type": "string",
       "required": false
     },
     {
       "id": "66bcdde0-f7d2-11e5-8a84-bae500000072",
       "name": "Weight",
       "type": "string",
       "required": false
     },
     {
       "id": "66be57d2-f7d2-11e5-8a84-bae500000073",
       "name": "Size",
       "type": "string",
       "required": false
     },
     {
       "id": "daec003b-fa34-11e5-9464-e4de0000006c",
       "name": "fashion",
       "type": "string",
       "required": false
     }
   ]
}
```



### Product variant
Working with Product variant with specified id.

**Parameters**

| Parameter | Description |
| ------ | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product variant id. |

### Get Modified
 
> Request to get the Product variant view with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/variant/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
   Successful request. The result is a JSON representation of the Product variant.
  
```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
     "type": "variant",
     "mediaType": "application/json"
   },
   "id": "7a81082f-3c64-11e6-8a84-bae50000000e",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-06-27 15:41:33",
   "name": "fatsfatsfvf (obkhets)",
   "code": "00003",
   "externalCode": "YQ3kNHfDgtHOVhf20Md7Q0",
   "archived": false,
   "discountProhibited": false,
   "characteristics": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/7a6078e4-3c64-11e6-8a84-bae500000003",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "7a6078e4-3c64-11e6-8a84-bae500000003",
       "name": "Color",
       "value": "obhets"
     }
   ],
   "images": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e/images",
       "type": "image",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "salePrices": [
     {
       "value": 0.0,
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
     },
     {
       "value": 0,
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
         "name": "Price for friends",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
       }
     },
     {
       "value": 0,
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f4444",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f4444",
         "name": "Price for competitors",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f434444"
       }
     }
   ],
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
   "product": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/7a6f697f-3c64-11e6-8a84-bae500000006",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json"
     }
   }
}
```

### Change Product variant
Request to update the Product variant with the specified id.
Price types in sales prices are updated as elements of nested collections:

+ If one of the price types has no value in the current object,
and in the passed collection it is - the value is written to the price type.
+ If this attribute already has a value, it is overwritten with the one passed.
+ If this attribute has a value in the object, but it is missing
in the collection passed in the body of the request (not passed at all), then the value of the object attribute is not changed.

When updating the characteristics of a Product variant, the **characteristics** field is specified as
an array of objects with the following structure:

| Title | Type | Description |
| ------ | --------- |------- |
| **id** | UUID | ID characteristics |
| **name** | String(255) | Characteristic name |
| **value** | String(255) | Feature value<br>`+Required for response` `+Required for creation` |

If the **id** field is not specified for any object of the characteristic, the corresponding object is searched for
characteristics by field **name**. If not a decreeis neither **id** nor **name**, an error will occur.
When updating, the **characteristics** field in the request body is treated as "all Product variant characteristics",
those. completely replaces the previous array of characteristics. If any of the characteristics that mattered in the updated
object is not specified in the update request, its value will be nullified after the request.

**Parameters**

| Parameter | Description |
| ------ | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product variant id. |

> An example of a request to update the Product variant.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/variant/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "characteristics": [
                {
                    "id": "07e9aa56-137b-11e6-9464-e4de000000e7",
                    "value": "Medium"
                },
                {
                    "id": "07e9b661-137b-11e6-9464-e4de000000e8",
                    "value": "orange"
                },
                {
                    "id": "60907bc8-137b-11e6-9464-e4de00000155",
                    "value": "Fresh"
                }
            ],
            "discountProhibited": false,
            "code": "orangeCode",
            "externalCode": "orange303",
            "buyPrice": {
                "value": 700.0
            },
            "salePrices": [
                {
                    "value": 1100.0,
                    "priceType": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
                            "type": "pricetype",
                            "mediaType": "application/json"
                        }
                    }
                },
                {
                    "value": 702,
                    "priceType": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
                            "type": "pricetype",
                            "mediaType": "application/json"
                        }
                    }
                },
                {
                    "value": 200,
                    "priceType": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f4444",
                            "type": "pricetype",
                            "mediaType": "application/json"
                        }
                    }
                }
            ],
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
            "images": [
                {
                    "filename": "birdimageNew.png",
                    "content": "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAAA3NCSVQICAjb4U"
                }
            ],
            "minPrice": {
                "value": 500.0,
                "currency": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                        "type": "currency",
                        "mediaType": "application/json"
                    }
                }
            }
        }
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Product variant.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/variant/b2347044-181d-11e6-9464-e4de00000015",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
     "type": "variant",
     "mediaType": "application/json"
   },
   "id": "b2347044-181d-11e6-9464-e4de00000015",
   "accountId": "305f25aa-137a-11e6-9464-e4de00000001",
   "updated": "2016-05-12 11:56:15",
   "name": "Oranges (Medium, Orange, Fresh)",
   "code": "orangeCode",
   "externalCode": "orange303",
   "archived": false,
   "discountProhibited": false,
   "characteristics": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/627610e3-2cb1-11e6-8a84-bae500000054",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "07e9aa56-137b-11e6-9464-e4de000000e7",
       "name": "Size",
       "value": "Medium"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/627610e3-2cb1-11e6-8a84-bae500000054",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "07e9b661-137b-11e6-9464-e4de000000e8",
       "name": "Color",
       "value": "orange"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/627610e3-2cb1-11e6-8a84-bae500000054",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "60907bc8-137b-11e6-9464-e4de00000155",
       "name": "Fresh",
       "value": "Fresh"
     }
   ],
   "images": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/variant/b2347044-181d-11e6-9464-e4de00000015/images",
       "type": "image",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   },
   "minPrice": {
     "value": 500.0,
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "buyPrice": {
     "value": 700.0
   },
   "salePrices": [
     {
       "value": 1100.0,
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
     },
     {
       "value": 702,
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
         "name": "Price for friends",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
       }
     },
     {
       "value": 200,
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f4444",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f4444",
         "name": "Price for competitors",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f434444"
       }
     }
   ],
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
   "product": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/07ed3a66-137b-11e6-9464-e4de000000eb",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json"
     }
   }
}
```
