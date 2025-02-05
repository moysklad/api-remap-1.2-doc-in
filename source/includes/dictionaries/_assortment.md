# Entities

## Assortment

### Assortment

The 'assortment' entity is the list of all products, services, bundles, batches, and product variants with the fields: `stock`, `reserve`, `inTransit`, `quantity`. The fields show the number of items reserved, awaiting, available, in stock, and in transit. The fields are not available for bundles and services. The data in the fields can be calculated depending on the date and stock using the `stockMoment` and `stockStore` filtering options.

#### Attributes available for filtering

The query results can be filtered using the 'filter' parameter.

| Title | Description |
| --------- | ------- |
| **alcoholic.type** | parameter for filtering by the code of the type of alcoholic product. You can use the `=` and `!=` operators. The value of the parameter is an integer. You can pass an empty value, then the selection will include products with a filled or empty value of the product type code. |
| **archived** | parameter for filtering on the basis of archived goods. Possible values: true, false. To display both regular and archived products, you need to pass two values at once, true and false. By default, only regular products are included in the search results. |
| **article** | parameter for filtering by article numbers of products and bundles. You can use the `=`, `!=`, `~`, `~=`, `=~` operators. You can pass multiple values. You can specify an empty value. |
| **barcode** | parameter for filtering by entity barcodes. A valid operator is `=`. You can pass multiple values. You can specify an empty value. |
| **code** | parameter for filtering by entity codes. You can use the `=`, `!=`, `~`, `~=`, `=~` operators. You can pass multiple values. You can specify an empty value. |
| **description** | parameter for filtering by entity descriptions. You can use the `=`, `!=`, `~`, `~=`, `=~` operators. You can pass multiple values. You can specify an empty value. |
| **externalCode** | parameter for filtering by external entity codes. You can use the `=`, `!=`, `~`, `~=`, `=~` operators. You can pass multiple values. You can specify an empty value. |
| **group** | parameter to filter by owner-department. You can use the `=` and `!=` operators. The value of the parameter is a link to the department. You can pass multiple values. |
| **id** | parameter for filtering by entity IDs. You can use the `=` and `!=` operators. You can pass multiple values. |
| **isSerialTrackable** | parameter to filter by using serial numbers |
| **name** | parameter for filtering by entity names. You can use the `=`, `!=`, `~`, `~=`, `=~` operators. You can pass multiple values. |
| **owner** | parameter to filter by owner-employee. You can use the `=` and `!=` operators. The value of the parameter is a link to the employee. You can pass multiple values. You can specify an empty value. |
| **pathname** | parameter for filtering by the name of product groups. You can use the `=`, `!=`, `~`, `~=`, `=~` operators. You can pass multiple values. You can specify an empty value. |
| **productFolder** | parameter for filtering by several product groups. You can use the `=` and `!=` operators. The value of the parameter is a link to a product group that shouldbe included in or excluded from the sample. You can pass multiple values. The selection will include products that are (or are not) directly in the specified groups. |
| **quantityMode** | option to filter by value is available. The default value is all. [Available values](../dictionaries/#entities-assortment-assortment-attributes-available-for-filtering-available-values-for-quantitymode) |
| **search** | prefix search in string fields displayed in assortment. For this parameter, you need to use the `=` operator. Barcode search is performed by full match. Only one value can be passed.[Learn more](../dictionaries/#entities-assortment-assortment-attributes-available-for-filtering-available-values-for-search) |
| **shared** | parameter for filtering based on shared access. Possible values: true, false. |
| **stockMode** | parameter for filtering by the remainder value. The default value is all. [Available values](../dictionaries/#entities-assortment-assortment-attributes-available-for-filtering-available-values-for-stockmode) |
| **stockMoment** | point in time when you want to withdraw the stock. Passed as a string in [date-time format](../#kladana-json-api-general-info-date-and-time-format) |
| **stockStore** | parameter for filtering by multiple warehouses. You can use the `=` and `!=` operators. The value of the parameter is a reference to the warehouse that should be taken into account in the selection or excluded from it. You can pass multiple values. |
| **supplier** | option to filter by multiple vendors. You can use the `=` and `!=` operators. The value of the parameter is a link to the counterparty or organization. The selection will include or exclude products from the specified suppliers. You can pass an empty value, then the selection will include products with an empty or filled supplier. |
| **type** | parameter for filtering by entity type (product, service, bundle, product variant). It is used with the `=` operator. You can pass multiple values. To filter by consignment type, you need to use grouping (groupBy=consignment). |
| **updated** | parameter for filtering by the time of the last update of entities. You can use the `=`, `<`, `<=`, `>`, `>=` operators. The action of strict operators is synonymous with non-strict ones. Passed as a string in [date-time format](../#kladana-json-api-general-info-date-and-time-format). |
| **updatedBy** | parameter to filter by the author of the last update. You can use the `=` and `!=` operators. The parameter value is `uid` (`admin@admin`). You can pass multiple values. |
| **weighed** | parameter for filtering by weight item. Possible values: true, false. |
| **withSubFolders** | parameter for considering nested subgroups. It works only if a non-empty filter by `productFolder` is applied. By default, it is set to `true`, and products from the child subgroups of the filtered groups are displayed. If `false` is passed, only products from the filtered groups are displayed, without considering subgroups.|
| **additional field(url)** | the filtering parameter is the url of the additional field. The filtering operator depends on the type of additional field. [Learn more](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields-available-operators-for-filtering-additional-fields). |

Filtering by additional fields is also available. [Learn more](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) details about filtering by additional fields.

##### Available values for stockMode
The default value is all.

| Meaning | Description |
| --------|---------|
| **all** | Any value of the remainder |
| **positiveOnly** | Positive stock |
| **negativeOnly** | Negative stock |
| **empty** | Zero stock |
| **nonEmpty** | Non-zero remainder |
| **underMinimum** | The stock is below the minimum |

##### Available values for quantityMode
The default value is all.

| Meaning | Description |
| --------| ------------|
| **all** | Any value of the remainder |
| **positiveOnly** | Positive balance |
| **negativeOnly** | Negative balance |
| **empty** | Zero balance |
| **nonEmpty** | Non-zero remainder |
| **underMinimum** | Balance below minimum balance |
  
##### Available values for search
For this parameter, you need to use the `=` operator. Barcode search is performed by full match. Only one value can be passed.

    + by the name of the Assortment item **name**
    + by product variant name **name**
    + by code **code**
    + by product variant code **code**
    + by article **article**
    + by barcode **barcode**
    + by product variant barcode **barcode**
    + by barcode of product packages **barcode**
    + by the barcode of product variant packages **barcode**
 

When using filters **alcoholic.type**, **weighed** and filters **stockMode**, **quantityMode** with values other than all, services and bundles are not included in the search results.

##### Filtering additional fields

The functionality is described in more detail in the section [Filtering by additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields). 

Filtering examples:

- `filter=stockStore=https://api.kladana.com/api/remap/1.2/entity/store/656c4032-8667-11e6-8a84-bae500003321`
- `filter=id=677c4032-8667-11e6-8a84-bae500003344`
- `filter=name~див`
- `filter=code~0002`
- `filter=externalCode~xdls`
- `filter=article~3456`
- `filter=description~див`
- `filter=shared=false`
- `filter=updated>=2019-07-10 12:00:00;updated<=2019-07-12 12:00:00`
- `filter=updatedBy=admin@company`
- `filter=owner=https://api.kladana.com/api/remap/1.2/entity/employee/a88d0702-85c7-11e9-ac12-000d00000321`
- `filter=group=https://api.kladana.com/api/remap/1.2/entity/group/a99d0702-85c7-11e9-ac12-000d00000551`
- `filter=alcoholic.type=123`
- `filter=productFolder=https://api.kladana.com/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1`
- `filter=stockMode=all`
- `filter=quantityMode=all`
- `filter=stockMode=all;quantityMode=all`
- `filter=stockMoment=2019-07-10 12:00:00`
- `filter=weighed=true`
- `filter=archived=true`
- `filter=archived=false;archived=true`
- `filter=supplier=https://api.kladana.com/api/remap/1.2/entity/counterparty/656c4032-8667-11e6-8a84-bae5000033aa`
- `filter=search=див`
- `filter=https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/b83c12e7-42bf-11ec-0a80-08bb00000161=color`
- `filter=https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/83386e05-51c0-11ec-0a83-0640000001bb>=2021-11-30 12:39:00`


**Parameters**

| Parameter | Description |
| -------------------- | --------------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **groupBy** | `string` (optional) Grouping parameter. Takes one of the following values: `product` - only products will be displayed, `variant` - products and product variants will be displayed (similar to the absence of a parameter)|


#### Directory settings

Goods directory entities are goods, services, bundles and groups of goods.
The directory settings allow the user to change the code uniqueness checking, setting a unique code when creating entities, setting a unique EAN13 barcode, using barcode prefixes for bulk goods, and configuring the sharing of these entities.

#### Entity attributes

| Title | Type | Description |
| ------------ | ------------- |-------------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Dictionary settings metadata<br>`+Required when replying` |
| **uniqueCodeRules** | Object | Code uniqueness settings for dictionary entities. [Learn more](../dictionaries/#entities-assortment-assortment-nested-entity-attributes-code-uniqueness-settings-for-lookup-entities)<br>`+Required when replying` |
| **barcodeRules** | Object | Settings for barcode rules for dictionary entities. [Learn more](../dictionaries/#entities-assortment-assortment-nested-entity-attributes-settings-for-barcode-rules-for-lookup-entities)<br>`+Required when replying` |
| **createdShared** | Boolean | Create new documents tagged "General"<br>`+Required when replying` |

#### Nested entity attributes
##### Code uniqueness settings for lookup entities

| Title | Type | Description |
| ------------ | ------ | ------------- |
| **checkUniqueCode** | Boolean | Checking the uniqueness of the entity code of the product directory<br>`+Required when replying` |
| **fillUniqueCode** | Boolean | Set a unique code when creating the creation of goods directory entities<br>`+Required when replying` |

##### Settings for barcode rules for lookup entities

| Title | Type | Description |
| ----------- | ------ | -------- |
| **fillEAN13Barcode** | Boolean | Automatically generate an EAN13 barcode for new products, bundles, product variants and services<br>`+Required when replying` |
| **weightBarcode** | Boolean | Use barcode prefixes for bulk products<br>`+Required when replying` |
| **weightBarcodePrefix** | Int | Barcode prefix for bulk goods. Possible values: X or XX format number<br>`+Required when replying` |

### Get Assortment

> Request to receive all products, services, bundles, product variants and batches in the form of a list.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/assortment"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json). Successful request. The result is a JSON representation of a list of all products, services, product variants and batches.
  
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
    "href": "https://api.kladana.com/api/remap/1.2/entity/assortment",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/assortment/metadata",
    "type": "assortment",
    "mediaType": "application/json",
    "size": 7,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/35427052-36e7-11e7-8a7f-40d0000000d1",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
      },
      "id": "35427052-36e7-11e7-8a7f-40d0000000d7",
      "accountId": "103bff1b-36e7-11e7-8a7f-40d000000004",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/105a788e-36e7-11e7-8a7f-40d000000069",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/103cca6f-36e7-11e7-8a7f-40d000000005",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2017-05-12 10:47:11",
      "name": "product",
      "code": "00001",
      "externalCode": "LsAGeHdbgyQ3oSlTzZUvH0",
      "archived": false,
      "pathName": "",
      "useParentVat": false,
      "vat": 18,
      "vatEnabled": true,
      "effectiveVat": 18,
      "effectiveVatEnabled": true,
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
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/35427052-36e7-11e7-8a7f-40d0000000d1/images",
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
      "salePrices": [
        {
          "value": 1500.0,
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
            "name": "Selling price",
            "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
          }
        }
      ],
      "supplier": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/1076cf8b-36e7-11e7-8a7f-40d000000093",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
          "type": "counterparty",
          "mediaType": "application/json"
        }
      },
      "buyPrice": {
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
      "article": "100000000",
      "weight": 0,
      "volume": 0,
      "barcodes": [
        {
          "ean13": "2000000000015"
        }
      ],
      "variantsCount": 0,
      "isSerialTrackable": false,
      "stock": 0,
      "reserve": 0,
      "inTransit": 0,
      "quantity": 0
    },
    {
      "stock": 0,
      "reserve": 0,
      "inTransit": 0,
      "quantity": 0
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/service/437f2d67-36e7-11e7-8a7f-40d0000000df",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "service",
        "mediaType": "application/json"
      },
      "id": "437f2d67-36e7-11e7-8a7f-40d0000000df",
      "accountId": "103bff1b-36e7-11e7-8a7f-40d000000004",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/105a788e-36e7-11e7-8a7f-40d000000069",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/103cca6f-36e7-11e7-8a7f-40d000000005",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2017-05-12 10:47:35",
      "name": "service",
      "code": "00002",
      "externalCode": "DDBfxV4djLuOlbr80-I1A0",
      "archived": false,
      "pathName": "",
      "useParentVat": false,
      "vat": 18,
      "vatEnabled": true,
      "effectiveVat": 18,
      "effectiveVatEnabled": true,
      "uom": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
          "type": "uom",
          "mediaType": "application/json"
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
      "salePrices": [
        {
          "value": 1500.0,
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
            "name": "Selling price",
            "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
          }
        }
      ],
      "buyPrice": {
        "value": 700.0,
        "currency": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json"
          }
        }
      },
      "barcodes": [
        {
          "ean13": "34875834765872435"
        }
      ]
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/bundle/4f75d130-36e7-11e7-8a7f-40d0000000ef",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "bundle",
        "mediaType": "application/json"
      },
      "id": "4f75d130-36e7-11e7-8a7f-40d0000000ef",
      "accountId": "103bff1b-36e7-11e7-8a7f-40d000000004",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/105a788e-36e7-11e7-8a7f-40d000000069",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/103cca6f-36e7-11e7-8a7f-40d000000005",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2017-05-12 10:47:55",
      "name": "bundle",
      "code": "00003",
      "externalCode": "ndWrlXCZjm9uSyLk57KOD0",
      "archived": false,
      "pathName": "",
      "useParentVat": false,
      "vat": 18,
      "vatEnabled": true,
      "effectiveVat": 18,
      "effectiveVatEnabled": true,
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
          "href": "https://api.kladana.com/api/remap/1.2/entity/bundle/4f75d130-36e7-11e7-8a7f-40d0000000ef/images",
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
      "salePrices": [
        {
          "value": 0.0,
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
            "name": "Selling price",
            "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
          }
        }
      ],
      "article": "50000000",
      "weight": 0,
      "volume": 0,
      "barcodes": [
        {
          "ean13": "2000000000046"
        }
      ],
      "components": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/bundle/4f75d130-36e7-11e7-8a7f-40d0000000ef/components",
          "type": "bundlecomponent",
          "mediaType": "application/json",
          "size": 1,
          "limit": 1000,
          "offset": 0
        }
      }
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/6830a346-36e7-11e7-8a7f-40d0000000f8",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
      },
      "id": "6830a346-36e7-11e7-8a7f-40d0000000f8",
      "accountId": "103bff1b-36e7-11e7-8a7f-40d000000004",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/105a788e-36e7-11e7-8a7f-40d000000069",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/103cca6f-36e7-11e7-8a7f-40d000000005",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2017-05-12 10:48:37",
      "name": "product2",
      "code": "00004",
      "externalCode": "bxviUUtwg4C6y4RdOc2GS3",
      "archived": false,
      "pathName": "",
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
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/6830a346-36e7-11e7-8a7f-40d0000000f8/images",
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
      "salePrices": [
        {
          "value": 1800.0,
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
            "name": "Selling price",
            "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
          }
        }
      ],
      "buyPrice": {
        "value": 700.0,
        "currency": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json"
          }
        }
      },
      "article": "2000000000000",
      "weight": 0,
      "volume": 0,
      "barcodes": [
        {
          "ean13": "2000000000053"
        }
      ],
      "variantsCount": 2,
      "isSerialTrackable": false,
      "stock": 0,
      "reserve": 0,
      "inTransit": 0,
      "quantity": 0
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/variant/68379863-36e7-11e7-8a7f-40d0000000fd",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
        "type": "variant",
        "mediaType": "application/json"
      },
      "id": "68379863-36e7-11e7-8a7f-40d0000000fd",
      "accountId": "103bff1b-36e7-11e7-8a7f-40d000000004",
      "updated": "2017-05-12 10:48:37",
      "name": "product2 (blue)",
      "code": "00002",
      "externalCode": "BrmW28jLhRMI-jOPUdfWW0",
      "archived": false,
      "characteristics": [
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/682beecc-36e7-11e7-8a7f-40d0000000f5",
            "type": "attributemetadata",
            "mediaType": "application/json"
          },
          "id": "682beecc-36e7-11e7-8a7f-40d0000000f5",
          "name": "color",
          "value": "blue"
        }
      ],
      "salePrices": [
        {
          "value": 1800.0,
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
            "name": "Selling price",
            "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
          }
        }
      ],
      "barcodes": [
        {
          "ean13": "2000000000060"
        }
      ],
      "product": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/6830a346-36e7-11e7-8a7f-40d0000000f8",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json"
        }
      },
      "stock": 0,
      "reserve": 0,
      "inTransit": 0,
      "quantity": 0
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/variant/6839f0fa-36e7-11e7-8a7f-40d000000101",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
        "type": "variant",
        "mediaType": "application/json"
      },
      "id": "6839f0fa-36e7-11e7-8a7f-40d000000101",
      "accountId": "103bff1b-36e7-11e7-8a7f-40d000000004",
      "updated": "2017-05-12 10:48:37",
      "name": "product2 (red)",
      "code": "00003",
      "externalCode": "i0u4rktiiVX6BWL60IVkJ1",
      "archived": false,
      "characteristics": [
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/682beecc-36e7-11e7-8a7f-40d0000000f5",
            "type": "attributemetadata",
            "mediaType": "application/json"
          },
          "id": "682beecc-36e7-11e7-8a7f-40d0000000f5",
          "name": "color",
          "value": "red"
        }
      ],
      "salePrices": [
        {
          "value": 1800.0,
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
            "name": "Selling price",
            "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
          }
        }
      ],
      "barcodes": [
        {
          "ean13": "2000000000077"
        }
      ],
      "product": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/6830a346-36e7-11e7-8a7f-40d0000000f8",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json"
        }
      },
      "stock": 0,
      "reserve": 0,
      "inTransit": 0,
      "quantity": 0
    }
  ]
}
```

### Receiving Assortment with Batches

> Request to receive the list of all products, services, bundles, product variants and batches.

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/assortment?groupBy=consignment"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json). Successful request. Result is JSON representation of the list of all products, services, bundles, product variants and batches.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/assortment?groupBy=consignment",
    "type": "assortment",
    "mediaType": "application/json",
    "size": 6,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/ba3c6d6d-3d33-11ef-ac15-0010000000ef",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#good/edit?id=ba3a833f-3d33-11ef-ac15-0010000000ed"
      },
      "id": "ba3c6d6d-3d33-11ef-ac15-0010000000ef",
      "accountId": "1e831ee5-3d33-11ef-ac15-000f00000001",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/2004c794-3d33-11ef-ac15-00100000004e",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=2004c794-3d33-11ef-ac15-00100000004e"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/1e85f779-3d33-11ef-ac15-000f00000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2024-07-08 17:11:27.942",
      "name": "product",
      "description": "product",
      "code": "00001",
      "externalCode": "yO85GgFpgK5DFsmjJKdQ82",
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
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/ba3c6d6d-3d33-11ef-ac15-0010000000ef/images",
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
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/2084dec0-3d33-11ef-ac15-00100000009d",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.com/app/#currency/edit?id=2084dec0-3d33-11ef-ac15-00100000009d"
          }
        }
      },
      "salePrices": [
        {
          "value": 0.0,
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/2084dec0-3d33-11ef-ac15-00100000009d",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json",
              "uuidHref": "https://app.kladana.com/app/#currency/edit?id=2084dec0-3d33-11ef-ac15-00100000009d"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/20cc4a52-3d33-11ef-ac15-00100000009e",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "20cc4a52-3d33-11ef-ac15-00100000009e",
            "name": "sale price",
            "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
          }
        }
      ],
      "buyPrice": {
        "value": 0.0,
        "currency": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/2084dec0-3d33-11ef-ac15-00100000009d",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.com/app/#currency/edit?id=2084dec0-3d33-11ef-ac15-00100000009d"
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
      "variantsCount": 2,
      "isSerialTrackable": false,
      "trackingType": "NOT_TRACKED",
      "files": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/ba3c6d6d-3d33-11ef-ac15-0010000000ef/files",
          "type": "files",
          "mediaType": "application/json",
          "size": 0,
          "limit": 1000,
          "offset": 0
        }
      },
      "stock": 0.0,
      "reserve": 0.0,
      "inTransit": 0.0,
      "quantity": 0.0
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/consignment/95b97e84-3d34-11ef-ac15-000d00000000",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/consignment/metadata",
        "type": "consignment",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#consignment/edit?id=95b97e84-3d34-11ef-ac15-000d00000000"
      },
      "id": "95b97e84-3d34-11ef-ac15-000d00000000",
      "accountId": "1e831ee5-3d33-11ef-ac15-000f00000001",
      "updated": "2024-07-08 17:15:52.881",
      "name": "product / consignment",
      "code": "1012",
      "externalCode": "g9BOLNRZglk9NMOHxcrVV0",
      "label": "consignment",
      "barcodes": [
        {
          "ean13": "2000000000077"
        }
      ],
      "images": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/ba3c6d6d-3d33-11ef-ac15-0010000000ef/images",
          "type": "image",
          "mediaType": "application/json",
          "size": 0,
          "limit": 1000,
          "offset": 0
        }
      },
      "assortment": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/ba3c6d6d-3d33-11ef-ac15-0010000000ef",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#good/edit?id=ba3a833f-3d33-11ef-ac15-0010000000ed"
        }
      },
      "stock": 0.0,
      "reserve": 0.0,
      "inTransit": 0.0,
      "quantity": 0.0
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/variant/f7954456-3d33-11ef-ac15-00100000011e",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
        "type": "variant",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#feature/edit?id=f7953353-3d33-11ef-ac15-00100000011c"
      },
      "id": "f7954456-3d33-11ef-ac15-00100000011e",
      "accountId": "1e831ee5-3d33-11ef-ac15-000f00000001",
      "updated": "2024-07-08 17:11:27.799",
      "name": "product (var A)",
      "code": "00002",
      "externalCode": "wc0O05KgiXC-4gxxp02DN0",
      "archived": false,
      "characteristics": [
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/f78c41a6-3d33-11ef-ac15-00100000011b",
            "type": "attributemetadata",
            "mediaType": "application/json"
          },
          "id": "f78c41a6-3d33-11ef-ac15-00100000011b",
          "name": "product variant",
          "value": "var A"
        }
      ],
      "images": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/variant/f7954456-3d33-11ef-ac15-00100000011e/images",
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
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/2084dec0-3d33-11ef-ac15-00100000009d",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json",
              "uuidHref": "https://app.kladana.com/app/#currency/edit?id=2084dec0-3d33-11ef-ac15-00100000009d"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/20cc4a52-3d33-11ef-ac15-00100000009e",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "20cc4a52-3d33-11ef-ac15-00100000009e",
            "name": "sale price",
            "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
          }
        }
      ],
      "barcodes": [
        {
          "ean13": "2000000000046"
        }
      ],
      "discountProhibited": false,
      "product": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/ba3c6d6d-3d33-11ef-ac15-0010000000ef",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#good/edit?id=ba3a833f-3d33-11ef-ac15-0010000000ed"
        }
      },
      "stock": 0.0,
      "reserve": 0.0,
      "inTransit": 0.0,
      "quantity": 0.0
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/variant/f79dd660-3d33-11ef-ac15-001000000123",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
        "type": "variant",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#feature/edit?id=f79db7c3-3d33-11ef-ac15-001000000121"
      },
      "id": "f79dd660-3d33-11ef-ac15-001000000123",
      "accountId": "1e831ee5-3d33-11ef-ac15-000f00000001",
      "updated": "2024-07-08 17:11:27.870",
      "name": "product (var B)",
      "code": "00003",
      "externalCode": "3PFqcaJagqpvSiIgKLaCq1",
      "archived": false,
      "characteristics": [
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/f78c41a6-3d33-11ef-ac15-00100000011b",
            "type": "attributemetadata",
            "mediaType": "application/json"
          },
          "id": "f78c41a6-3d33-11ef-ac15-00100000011b",
          "name": "product variant",
          "value": "var B"
        }
      ],
      "images": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/variant/f79dd660-3d33-11ef-ac15-001000000123/images",
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
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/2084dec0-3d33-11ef-ac15-00100000009d",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json",
              "uuidHref": "https://app.kladana.com/app/#currency/edit?id=2084dec0-3d33-11ef-ac15-00100000009d"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/20cc4a52-3d33-11ef-ac15-00100000009e",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "20cc4a52-3d33-11ef-ac15-00100000009e",
            "name": "sale price",
            "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
          }
        }
      ],
      "barcodes": [
        {
          "ean13": "2000000000053"
        }
      ],
      "discountProhibited": false,
      "product": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/ba3c6d6d-3d33-11ef-ac15-0010000000ef",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#good/edit?id=ba3a833f-3d33-11ef-ac15-0010000000ed"
        }
      },
      "stock": 0.0,
      "reserve": 0.0,
      "inTransit": 0.0,
      "quantity": 0.0
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/service/c57dcc60-3d33-11ef-ac15-0010000000fc",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "service",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#good/edit?id=c57db591-3d33-11ef-ac15-0010000000fa"
      },
      "id": "c57dcc60-3d33-11ef-ac15-0010000000fc",
      "accountId": "1e831ee5-3d33-11ef-ac15-000f00000001",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/2004c794-3d33-11ef-ac15-00100000004e",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=2004c794-3d33-11ef-ac15-00100000004e"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/1e85f779-3d33-11ef-ac15-000f00000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2024-07-08 17:10:03.751",
      "name": "service",
      "description": "service",
      "code": "00002",
      "externalCode": "60tB0R4Ui9PfsXhauKUP40",
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
      "minPrice": {
        "value": 0.0,
        "currency": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/2084dec0-3d33-11ef-ac15-00100000009d",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.com/app/#currency/edit?id=2084dec0-3d33-11ef-ac15-00100000009d"
          }
        }
      },
      "salePrices": [
        {
          "value": 0.0,
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/2084dec0-3d33-11ef-ac15-00100000009d",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json",
              "uuidHref": "https://app.kladana.com/app/#currency/edit?id=2084dec0-3d33-11ef-ac15-00100000009d"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/20cc4a52-3d33-11ef-ac15-00100000009e",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "20cc4a52-3d33-11ef-ac15-00100000009e",
            "name": "sale price",
            "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
          }
        }
      ],
      "buyPrice": {
        "value": 0.0,
        "currency": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/2084dec0-3d33-11ef-ac15-00100000009d",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.com/app/#currency/edit?id=2084dec0-3d33-11ef-ac15-00100000009d"
          }
        }
      },
      "barcodes": [
        {
          "ean13": "2000000000022"
        }
      ],
      "paymentItemType": "SERVICE",
      "discountProhibited": false,
      "files": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/service/c57dcc60-3d33-11ef-ac15-0010000000fc/files",
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
        "href": "https://api.kladana.com/api/remap/1.2/entity/bundle/da607138-3d33-11ef-ac15-00100000010d",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "bundle",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#good/edit?id=da60604b-3d33-11ef-ac15-00100000010b"
      },
      "id": "da607138-3d33-11ef-ac15-00100000010d",
      "accountId": "1e831ee5-3d33-11ef-ac15-000f00000001",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/2004c794-3d33-11ef-ac15-00100000004e",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=2004c794-3d33-11ef-ac15-00100000004e"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/1e85f779-3d33-11ef-ac15-000f00000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2024-07-08 17:10:38.791",
      "name": "bundle",
      "code": "00003",
      "externalCode": "pOjHkQ6mgLmQ9aI0dayiY0",
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
          "href": "https://api.kladana.com/api/remap/1.2/entity/bundle/da607138-3d33-11ef-ac15-00100000010d/images",
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
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/2084dec0-3d33-11ef-ac15-00100000009d",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.com/app/#currency/edit?id=2084dec0-3d33-11ef-ac15-00100000009d"
          }
        }
      },
      "salePrices": [
        {
          "value": 0.0,
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/2084dec0-3d33-11ef-ac15-00100000009d",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json",
              "uuidHref": "https://app.kladana.com/app/#currency/edit?id=2084dec0-3d33-11ef-ac15-00100000009d"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/20cc4a52-3d33-11ef-ac15-00100000009e",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "20cc4a52-3d33-11ef-ac15-00100000009e",
            "name": "sale price",
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
      "weight": 0.0,
      "volume": 0.0,
      "trackingType": "NOT_TRACKED",
      "components": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/bundle/da607138-3d33-11ef-ac15-00100000010d/components",
          "type": "bundlecomponent",
          "mediaType": "application/json",
          "size": 2,
          "limit": 1000,
          "offset": 0
        }
      },
      "files": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/bundle/da607138-3d33-11ef-ac15-00100000010d/files",
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


### Bulk deletion of items in the Assortment

In the body of the request, you need to pass an array containing JSON of the metadata of the items in the Assortment that you want to remove.


> Request for bulk deletion of items in the Assortment.

```shell
curl -X POST
  "https://api.kladana.com/api/remap/1.2/entity/assortment/delete"
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
                "href": "https://api.kladana.com/api/remap/1.2/entity/service/7944ef04-f831-11e5-7a69-971500188b2",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                "type": "service",
                "mediaType": "application/json"
            }
        }
      ]'
```        

> Successful request. The result is JSON information about deleting items in the Assortment.

```json
[
   {
     "info":"Entity 'service' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   },
   {
     "info":"Entity 'product' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   }
]
```

### Get Product directory settings

> Request to get product directory settings

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/assortment/settings"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the company settings.

```json
{
  "meta" : {
    "href" : "https://api.kladana.com/api/remap/1.2/entity/assortment/settings",
    "type" : "assortmentsettings",
    "mediaType" : "application/json"
  },
  "barcodeRules" : {
    "fillEAN13Barcode" : true,
    "weightBarcode" : true,
    "weightBarcodePrefix" : 77
  },
  "uniqueCodeRules" : {
    "checkUniqueCode" : true,
    "fillUniqueCode" : true
  },
  "createdShared" : true
}
```

### Change product directory settings

In the body of the request, you need to pass an object containing a new JSON of the directory settings.
You can partially change the settings, for this you need to add only those fields that need to be updated to the request body, the rest of the fields will remain the same. Each field is optional.
The response will return the full entity, even if the update was partial.

> Request to change the metadata of the product directory.

```shell
curl -X PUT
  "https://api.kladana.com/api/remap/1.2/entity/assortment/settings"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
  -H "Content-Type: application/json"
  -d '{
        "uniqueCodeRules": {
          "checkUniqueCodeBoolean": true,
          "fillUniqueCode": true
        },
        "barcodeRules": {
          "fillEAN13Barcode": true,
          "weightBarcodePrefix": 55
        },
        "createdShared": false
      }'
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the product directory settings.

```json
{
  "meta" : {
    "href" : "https://api.kladana.com/api/remap/1.2/entity/assortment/settings",
    "type" : "assortmentsettings",
    "mediaType" : "application/json"
  },
  "uniqueCodeRules": {
    "checkUniqueCodeBoolean": true,
    "fillUniqueCode": true
  },
  "barcodeRules": {
    "fillEAN13Barcode": true,
    "weightBarcodePrefix": 55
  },
  "createdShared": false
}
```
