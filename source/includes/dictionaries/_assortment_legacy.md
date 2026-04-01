## Assortment (Deprecated)

The `assortment` entity is the list of all products, services, bundles, product variants, and batches with the fields `stock`, `reserve`, `inTransit`, `quantity`, showing the stock, reserve, awaiting, and available quantity for each entity (these fields are not returned for bundles and services). The data in these fields can be calculated depending on the date and warehouse using the `stockMoment` and `stockStore` filter parameters.

**Note**: This endpoint will be gradually deprecated in 2027. We recommend migrating to the [new assortment endpoint](../dictionaries/#entities-assortment), which performs faster and is actively developed.

#### Attributes available for filtering

The query results can be filtered using the `filter` parameter.

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
| **productFolder** | parameter for filtering by several product groups. You can use the `=` and `!=` operators. The value of the parameter is a link to a product group that should be included in or excluded from the sample. You can pass multiple values. The selection will include products that are (or are not) directly in the specified groups. |
| **quantityMode** | option to filter by available quantity. The default value is all. [Available values](../dictionaries/#entities-assortment-deprecated-attributes-available-for-filtering-available-values-for-quantitymode) |
| **search** | prefix search in string fields displayed in assortment. For this parameter, you need to use the `=` operator. Barcode search is performed by full match. Only one value can be passed. [Learn more](../dictionaries/#entities-assortment-deprecated-attributes-available-for-filtering-available-values-for-search) |
| **shared** | parameter for filtering based on shared access. Possible values: true, false. |
| **stockMode** | parameter for filtering by the stock value. The default value is all. [Available values](../dictionaries/#entities-assortment-deprecated-attributes-available-for-filtering-available-values-for-stockmode) |
| **stockMoment** | point in time at which to display stock levels. Passed as a string in [date-time format](../#kladana-json-api-general-info-date-and-time-format) |
| **stockStore** | parameter for filtering by multiple warehouses. You can use the `=` and `!=` operators. The value of the parameter is a reference to the warehouse that should be taken into account in the selection or excluded from it. You can pass multiple values. |
| **supplier** | option to filter by multiple vendors. You can use the `=` and `!=` operators. The value of the parameter is a link to the counterparty or organization. The selection will include or exclude products from the specified suppliers. You can pass an empty value, then the selection will include products with an empty or filled supplier. |
| **type** | parameter for filtering by entity type (product, service, bundle, variant, consignment). It is used with the `=` operator. You can pass multiple values. To filter by consignment type, you need to use grouping (groupBy=consignment). |
| **updated** | parameter for filtering by the time of the last update of entities. You can use the `=`, `<`, `<=`, `>`, `>=` operators. The action of strict operators is synonymous with non-strict ones. Passed as a string in [date-time format](../#kladana-json-api-general-info-date-and-time-format). |
| **updatedBy** | parameter to filter by the author of the last update. You can use the `=` and `!=` operators. The parameter value is `uid` (`admin@admin`). You can pass multiple values. |
| **weighed** | parameter for filtering by weight item. Possible values: true, false. |
| **withSubFolders** | parameter for considering nested subgroups. It works only if a non-empty filter by `productFolder` is applied. By default `true`, products from child subgroups of the filtered group are displayed. If `false` is passed, only products from the filtered group are displayed, without considering subgroups. |
| **additional field(url)** | the filtering parameter is the url of the additional field. The filtering operator depends on the type of additional field. [Learn more](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields-available-operators-for-filtering-additional-fields). |

Filtering by additional fields is also available. [Learn more](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) about filtering by additional fields.

##### Available values for stockMode
The default value is all.

| Value | Description |
| --------|---------|
| **all** | Any stock value |
| **positiveOnly** | Positive stock |
| **negativeOnly** | Negative stock |
| **empty** | Zero stock |
| **nonEmpty** | Non-zero stock |
| **underMinimum** | Stock below minimum balance |

##### Available values for quantityMode
The default value is all.

| Value | Description |
| --------| ------------|
| **all** | Any available quantity |
| **positiveOnly** | Positive available quantity |
| **negativeOnly** | Negative available quantity |
| **empty** | Zero available quantity |
| **nonEmpty** | Non-zero available quantity |
| **underMinimum** | Available quantity below minimum balance |

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
- `filter=name~product`
- `filter=code~0002`
- `filter=externalCode~xdls`
- `filter=article~3456`
- `filter=description~product`
- `filter=shared=false`
- `filter=updated>=2019-07-10 12:00:00;updated<=2019-07-12 12:00:00`
- `filter=updatedBy=admin@company`
- `filter=owner=https://api.kladana.com/api/remap/1.2/entity/employee/a88d0702-85c7-11e9-ac12-000d00000321`
- `filter=group=https://api.kladana.com/api/remap/1.2/entity/group/a99d0702-85c7-11e9-ac12-000d00000551`
- `filter=alcoholic.type=123`
- `filter=productFolder=https://api.kladana.com/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1`
- `filter=productFolder=https://api.kladana.com/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;withSubFolders=false`
- `filter=stockMode=all`
- `filter=quantityMode=all`
- `filter=stockMode=all;quantityMode=all`
- `filter=stockMoment=2019-07-10 12:00:00`
- `filter=weighed=true`
- `filter=archived=true`
- `filter=archived=false;archived=true`
- `filter=supplier=https://api.kladana.com/api/remap/1.2/entity/counterparty/656c4032-8667-11e6-8a84-bae5000033aa`
- `filter=search=product`
- `filter=https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/b83c12e7-42bf-11ec-0a80-08bb00000161=color`
- `filter=https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/83386e05-51c0-11ec-0a83-0640000001bb>=2021-11-30 12:39:00`


**Parameters**

| Parameter | Description |
| -------------------- | --------------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **groupBy** | `string` (optional) Grouping parameter. Takes one of the following values: `product` — only products will be displayed, `variant` — products and product variants will be displayed (similar to the absence of a parameter), `consignment` — all entities will be displayed |


#### Directory settings

Goods directory entities are goods, services, bundles and groups of goods.
The directory settings allow the user to change the code uniqueness checking, setting a unique code when creating entities, setting a unique EAN13 barcode, using barcode prefixes for bulk goods, and configuring the sharing of these entities.

#### Entity attributes

| Title | Type | Description |
| ------------ | ------------- |-------------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Dictionary settings metadata<br>`+Required when answering` |
| **uniqueCodeRules** | Object | Code uniqueness settings for dictionary entities. [Learn more](../dictionaries/#entities-assortment-deprecated-nested-entity-attributes-code-uniqueness-settings-for-lookup-entities)<br>`+Required when answering` |
| **barcodeRules** | Object | Settings for barcode rules for dictionary entities. [Learn more](../dictionaries/#entities-assortment-deprecated-nested-entity-attributes-settings-for-barcode-rules-for-lookup-entities)<br>`+Required when answering` |
| **createdShared** | Boolean | Create new documents tagged "General"<br>`+Required when answering` |

#### Nested entity attributes
##### Code uniqueness settings for lookup entities

| Title | Type | Description |
| ------------ | ------ | ------------- |
| **checkUniqueCode** | Boolean | Checking the uniqueness of the entity code of the product directory<br>`+Required when answering` |
| **fillUniqueCode** | Boolean | Set a unique code when creating the creation of goods directory entities<br>`+Required when answering` |

##### Settings for barcode rules for lookup entities

| Title | Type | Description |
| ----------- | ------ | -------- |
| **fillEAN13Barcode** | Boolean | Automatically generate an EAN13 barcode for new products, bundles, product variants and services<br>`+Required when answering` |
| **weightBarcode** | Boolean | Use barcode prefixes for bulk products<br>`+Required when answering` |
| **weightBarcodePrefix** | Int | Barcode prefix for bulk goods. Possible values: X or XX format number<br>`+Required when answering` |

### Get Assortment

> Request to receive all products, services, bundles, product variants and batches in the form of a list.

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/assortment" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json). Successful request. The result is a JSON representation of a list of all products, services, product variants and batches.

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
      "name": "product",
      "code": "00001",
      "externalCode": "LsAGeHdbgyQ3oSlTzZUvH0",
      "archived": false,
      "pathName": "",
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
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/service/437f2d67-36e7-11e7-8a7f-40d0000000df",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "service",
        "mediaType": "application/json"
      },
      "id": "437f2d67-36e7-11e7-8a7f-40d0000000df",
      "accountId": "103bff1b-36e7-11e7-8a7f-40d000000004",
      "name": "service",
      "code": "00002",
      "externalCode": "DDBfxV4djLuOlbr80-I1A0",
      "archived": false,
      "pathName": "",
      "barcodes": [
        {
          "ean13": "34875834765872435"
        }
      ]
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
      "name": "product2",
      "code": "00004",
      "externalCode": "bxviUUtwg4C6y4RdOc2GS3",
      "archived": false,
      "pathName": "",
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
      "name": "product2 (blue)",
      "code": "00002",
      "externalCode": "BrmW28jLhRMI-jOPUdfWW0",
      "archived": false,
      "characteristics": [
        {
          "id": "682beecc-36e7-11e7-8a7f-40d0000000f5",
          "name": "color",
          "value": "blue"
        }
      ],
      "barcodes": [
        {
          "ean13": "2000000000060"
        }
      ],
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
      "name": "product2 (red)",
      "code": "00003",
      "externalCode": "i0u4rktiiVX6BWL60IVkJ1",
      "archived": false,
      "characteristics": [
        {
          "id": "682beecc-36e7-11e7-8a7f-40d0000000f5",
          "name": "color",
          "value": "red"
        }
      ],
      "barcodes": [
        {
          "ean13": "2000000000077"
        }
      ],
      "stock": 0,
      "reserve": 0,
      "inTransit": 0,
      "quantity": 0
    }
  ]
}
```
