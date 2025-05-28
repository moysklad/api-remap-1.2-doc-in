# Reports

## Stock report

The Stock report is available in extended and short form. You can get the report using JSON API. You can also subscribe to the webhooks to track the stock. Use JSON API if the stock changes frequently and you want to query them every few minutes. If the stock changes less than once in a few minutes and you want to be notified about the changes, use the webhooks.

The availability of the Stock report content is based on the user access rights. If the user does not have the appropriate access rights, the report does not display the following data:

- specific products and warehouses data;
- costs, purchase prices, profits.

Learn more about [Stock report](https://kladana.zendesk.com/hc/en-us/articles/360012272317-Stock-report).

### Extended Stock report
An extended Stock report is a detailed report that collects data on all products with all the necessary information about the product (prices, image, etc.). Use the report to get detailed information about products or synchronize with Kladana periodically, for instance, once a day. However, this is a rather long and heavy request, it is not recommended to use it often.

#### Report object attributes

| Title | Type | Description |
| ------ | ------- | ----------- |
| **article** | String(255) | Article |
| **code** | String(255) | Code<br>`+Required when replying` |
| **externalCode** | String(255) | External code of the entity for which the stock is displayed<br>`+Required when replying` |
| **folder** | Object | Group of Products/Product variants/Series. [Learn more](../reports/#reports-stock-report-extended-stock-report-group) |
| **images** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Product/Product variant/Series Image|
| **inTransit** | Float | Waiting<br>`+Required for response` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Product/Product variant/Series for which the rest is issued<br>`+Required when replying` |
| **name** | String(255) | Name<br>`+Required when replying` |
| **price** | Float | Cost price in paise<br>`+Required when replying`|
| **quantity** | Float | Available<br>`+Required when replying` |
| **reserve** | Float | Reserve<br>`+Required when replying` |
| **salePrice** | Float | Sale price<br>`+Required when replying` |
| **stock** | Float | Remaining<br>`+Required when replying` |
| **stockDays** | Int | Number of days in stock<br>`+Mandatorylnoe when replying` |
| **uom** | Object | Unit of measurement. [Learn more](../reports/#reports-stock-report-extended-stock-report-unit)<br>`+Required when replying` |

#### Nested entity attributes
#### Unit

| Title | Type | Description |
| ------- | ----------- |-------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Unit metadata<br>`+Required when replying` |
| **name** | String(255) | Name of the unit of measurement<br>`+Required when replying` |

#### Group

| Title | Type | Description |
| ------- | ----------- |--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Product group metadata<br>`+Required when replying` |
| **name** | String(255) | Group name<br>`+Required when replying` |
| **pathName** | String | Parent group name<br>`+Required when replying` |

#### Attributes available for filtering

The report results can be filtered using the filter parameter.

| Title | Type | Filtration | Description |
|--------------------|---------- | --------- |----|
| **archived** | Boolean | `=` | parameter for filtering by archived products. Possible values: true, false. To return both archived and non-archived products, you need to pass two values at once, true and false. |
| **inTransitOnly** | Boolean | `=` | parameter to filter by wait value. If you pass true, only products with pending will be included in the selection. |
| **moment** | DateTime | `=` | point in time at which you want to withdraw the data. Passed as a string in [date-time format](../#kladana-json-api-general-info-date-and-time-format). |
| **product** | Object | `=` `!=` | option to filter by multiple products. The parameter value is a link to a product that should be included in the selection or excluded from it. You can pass multiple values. This filter option can be combined with the `variant` option. |
| **productFolder** | Object | `=` `!=` | parameter for filtering by several product groups. The value of the parameter is a link to a product group that should be included in the selection or excluded from it. You can pass multiple values. |
| **withSubFolders** | Boolean | `=` | option to consider nested subgroups. Works only if there is a filter by `productFolder`. By default `true`, products from child subgroups of the filtered group / groups of products are displayed. When passing `false`, only products from the filtered group / groups are displayed, without taking into account subgroups. |
| **quantityMode** | Enum | `=` | option to filter by value is available. The default value is nonEmpty. [Available values](../reports/#reports-stock-report-extended-stock-report-attributes-available-for-filtering-available-values-for-quantitymode) |
| **reserveOnly** | Boolean | `=` | parameter for filtering by reserve value. If you pass true, I will get into the selectiont only goods with a reserve. |
| **search** | String(255) | `=` `!~` | special text search option. The search is carried out by the occurrence of a substring in the names of products, product variants, batches. |
| **soldByWeight** | Boolean | `=` | parameter for filtering by weight item. Possible values: true, false. |
| **stockDaysFrom** | Int | `=` | parameter for filtering by the number of days in stock. You need to send an integer. The selection will include products with the number of days in stock greater than or equal to the specified one. This filter parameter can be combined with the `stockDaysTo` parameter. |
| **stockDaysTo** | Int | `=` | parameter for filtering by the number of days in stock. You need to send an integer. The selection will include products with the number of days in the warehouse less than or equal to the specified one. This filtering option can be combined with the `stockDaysFrom` option. |
| **stockMode** | Enum | `=` | parameter for filtering by the remainder value. The default value is all. [Available values](../reports/#reports-stock-report-extended-stock-report-attributes-available-for-filtering-available-values-for-stockmode) |
| **store** | Object | `=` `!=` | parameter for filtering by multiple warehouses. The value of the parameter is a reference to the warehouse that should be taken into account in the selection or excluded from it. You can pass multiple values. |
| **supplier** | Object | `=` `!=` | option to filter by multiple vendors. The value of the parameter is a link to the counterparty or organization. The selection will include or exclude products from the specified suppliers. You can pass an empty value, then the selection will include products with an empty or filled supplier. |
| **variant** | Object | `=` `!=` | parameter for filtering by several product variants. The value of the parameter is a reference to the product variant that should be included in the selection or excluded from it. You can pass multiple values. This filter option can be combined with the `product` option. |

##### Available values for stockMode

The default value is all.

| Value | Description |
| ------- | ----------- |
| **all** | Any value of the remainder |
| **positiveOnly** | Positive stock |
| **negativeOnly** | Negative stock |
| **empty** | Zero stock |
| **nonEmpty** | Non-zero remainder |
| **underMinimum** | The stock is below the minimum |

##### Available values for quantityMode
The default value is nonEmpty.

| Value | Description |
| ------- | ----------- |
| **all** | Any value of the remainder |
| **positiveOnly** | Positive balance |
| **negativeOnly** | Negative balance |
| **empty** | Zero balance |
| **nonEmpty** | Non-zero remainder |
| **underMinimum** | Balance below minimum balance |

For filtering parameters **product**, **variant**, **productFolder** and **search** within a single query, only the same operators can be used (for **search**, the `!~` operator is combined with the operator `!=` other fields).

Filtering examples:

- `filter=store=https://api.kladana.com/api/remap/1.2/entity/store/656c4032-8667-11e6-8a84-bae500003321`
- `filter=productFolder=https://api.kladana.com/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1`
- `filter=productFolder=https://api.kladana.com/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;withSubFolders=false`
- `filter=productFolder=https://api.kladana.com/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;productFolder=https://api.kladana.com/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b2`
- `filter=productFolder=https://api.kladana.com/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;productFolder=https://api.kladana.com/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b2;withSubFolders=false`
- `filter=product=https://api.kladana.com/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044;product=https://api.kladana.com/api/remap/1.2/entity/product/706b9cd3-8552-11e6-8a84-bae500000045;product=https://api.kladana.com/api/remap/1.2/entity/product/7a5f0ed5-8552-11e6-8a84-bae500000046`
- `filter=stockMode=all`
- `filter=quantityMode=all`
- `filter=stockMode=all;quantityMode=all`
- `filter=moment=2019-07-10 12:00:00`
- `filter=stockDaysFrom=10;stockDaysTo=50`
- `filter=soldByWeight=true`
- `filter=reserveOnly=true`
- `filter=inTransitOnly=true`
- `filter=archived=true`
- `filter=archived=false;archived=true`
- `filter=supplier=https://api.kladana.com/api/remap/1.2/entity/counterparty/656c4032-8667-11e6-8a84-bae5000033aa`
- `filter=search=div`

#### Filtering by additional fields and characteristics

Using the filter parameter, the selection can also be filtered by the values of additional product fields and product variant characteristics.

To filter by the value of an additional field, you need to pass a reference to the additional field and its value:

`filter=https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/<id>=<Value>`

To filter by the value of additional fields like string, text and link, use the `=` operator. You can also use the `=` and `!=` operators with an empty value to get products with only an empty additional field or only a filled one, respectively.

To filter by the value of additional fields of type integer, real number, date, you can use the operators `=`, `>=`, `<=`. You can also use the `=` and `!=` operators with an empty value to get products with only an empty additional field or only a filled one, respectively. For an additional date-time field, the value is passed as a string in [date-time format](../#kladana-json-api-general-info-date-and-time-format).

To filter by the value of additional fields of the lookup type, you can use the `=` and `!=` operators. As a value, you need to pass a reference to the directory object. You can also use the `=` and `!=` operators with an empty value to get products with only an empty additional field or only a filled one, respectively.

An example of filtering by an additional field of the warehouse reference type: `filter=https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/ea12a6dd-79e5-11e9-9ff4-31500040893d=http:// api.kladana.com/api/remap/1.2/entity/store/302f2a81-9977-11e9-9109-f8fc00020e02`

An example of filtering by an additional field of the user directory type: `filter=https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/ea12a6dd-79e5-11e9-9ff4-31500040893d=http:// api.kladana.com/api/remap/1.2/entity/customentity/8955249d-997d-11e9-9ff4-3150000e65c3/8955314d-997d-11e9-9ff4-3150000e65c4`

To filter by the value of additional fields of the checkbox type, use the `=` operator. Possible values: true, false.

Filtering by additional fields of the file type is not supported.

To filter by the value of a characteristic, you need to pass a reference to the characteristic and value:

`filter=https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/<id>=<Value>`

To filter by the value of a characteristic, use the `=` operator. You can also use the `=` and `!=` operators with an empty value to get products or product variants with only an empty characteristic or only a filled one, respectively.

#### Attributes available for sorting

The report results can be sorted using the [order](../#kladana-json-api-general-info-sorting-of-objects) parameter.

| Title | Description |
| -------| ------------- |
| **avgStockDays** | by number of days in stock |
| **code** | by code |
| **inTransit** | by expectation value |
| **minimumBalance** | by minimum balance |
| **name** | by name |
| **pathName** | by product group |
| **price** | at cost |
| **productCode** | by article |
| **quantity** | available by value |
| **reserve** | by reserve value |
| **salePrice** | at the selling price |
| **stock** | by value of remainder |
| **sumTotal** | by cost |

By default, the selection is sorted by product group and product name.

### Get Advanced Stock report

**Parameters**

| Parameter | Description | 
| ------- | ----------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **groupBy** | `string` (optional) The type to group the output by. By default, the groupBy parameter is set to variant. If you want to see objects of type product, you must set the appropriate parameter value. <ul><li>groupBy=product - lists products only</li><li>groupBy=variant - lists products and product variants</li></ul> |
| **includeRelated** | `boolean` (optional) Output of stock by product product variants and batches. This parameter allows you to include detalisation by product variants and batches for goods in the selection. A prerequisite for applying the parameter is the **mandatory** filtering by products or product variants, or a combination of them. If the value `includeRelated=true` is selected, all stock for products, product variants and batches specified in the filtering parameters will be included.|

Examples of using the `includeRelated` parameter: <br> `filter=variant!=<URL>&includeRelated=true` displays the rest of products, product variants, batches, except for the specific product variant specified in the URL. <br>`filter=product=<URL>&includeRelated=true` displays the remnants of a specific product specified in the URL, its product variant and batch.
 
> Request for an Advanced Stock Report.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/report/stock/all"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

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
     "href": "https://api.kladana.com/api/remap/1.2/report/stock/all",
     "type": "stock",
     "mediaType": "application/json",
     "size": 26,
     "limit": 10,
     "offset": 0,
     "nextHref": "https://api.kladana.com/api/remap/1.2/report/stock/all?limit=10&offset=10"
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/c02e3a5c-007e-11e6-9464-e4de00000006?expand=supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stock": -30,
       "inTransit": 0,
       "reserve": 0,
       "quantity": -30,
       "name": "Product",
       "code": "one1",
       "article": "Ar23",
       "price": 0.0,
       "salePrice": 346347237000.0,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/cc99c055-fa34-11e5-9464-e4de00000069?expand=supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stock": 4,
       "inTransit": 0,
       "reserve": 0,
       "quantity": 4,
       "name": "ItemWithout Barcode",
       "code": "00006",
       "price": 0.0,
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/e8f5f9ff-fa34-11e5-9464-e4de0000008a?expand=supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stock": 1,
       "inTransit": 0,
       "reserve": 0,
       "quantity": 1,
       "name": "Product with fashion without bar code",
       "code": "00008",
       "price": 0.0,
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/e8f9d714-fa34-11e5-9464-e4de0000008d?expand=product.supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stock": 1,
       "inTransit": 0,
       "reserve": 0,
       "quantity": 1,
       "name": "Product with fashion without bar code (1)",
       "code": "00208",
       "price": 0.0,
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/e8fc24b5-fa34-11e5-9464-e4de00000091?expand=product.supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stock": 1,
       "inTransit": 0,
       "reserve": 0,
       "quantity": 1,
       "name": "Product with fashion without bar code (2)",
       "code": "00209",
       "price": 0.0,
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/e91042b4-fa34-11e5-9464-e4de00000095?expand=product.supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stock": 1,
       "inTransit": 0,
       "reserve": 0,
       "quantity": 1,
       "name": "Product with fashion without bar code (3)",
       "code": "00210",
       "price": 0.0,
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/daf1186d-fa34-11e5-9464-e4de0000006f?expand=supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stock": 1,
       "inTransit": 0,
       "reserve": 0,
       "quantity": 1,
       "name": "Item with fashion_and_code",
       "code": "00007",
       "price": 0.0,
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/db1a888a-fa34-11e5-9464-e4de00000073?expand=product.supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stock": 1,
       "inTransit": 0,
       "reserve": 0,
       "quantity": 1,
       "name": "Item with fashion_and_code(1)",
       "code": "00205",
       "price": 0.0,
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/db2066c8-fa34-11e5-9464-e4de00000077?expand=product.supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stock": 1,
       "inTransit": 0,
       "reserve": 0,
       "quantity": 1,
       "name": "Item with fashion_and_code(2)",
       "code": "00206",
       "price": 0.0,
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/db22f3e8-fa34-11e5-9464-e4de0000007b?expand=product.supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stock": 1,
       "inTransit": 0,
       "reserve": 0,
       "quantity": 1,
       "name": "Item with fashion_and_code(3)",
       "code": "00207",
       "price": 0.0,
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/d3e2dcd6-f648-11e5-8a84-bae500000074?expand=supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stock": -6438,
       "inTransit": 0,
       "reserve": 0,
       "quantity": -6438,
       "name": "ProductWithCountry",
       "code": "00002",
       "price": 0.0,
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/eeef177f-f648-11e5-8a84-bae50000007a?expand=supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stock": -113,
       "inTransit": 0,
       "reserve": 0,
       "quantity": -113,
       "name": "Ball",
       "code": "00003",
       "price": 0.0,
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type":"uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/fd867506-f67d-11e5-8a84-bae50000006e?expand=product.supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stock": -21,
       "inTransit": 0,
       "reserve": 0,
       "quantity": -21,
       "name": "Ball (Soccer)",
       "code": "00002",
       "price": 0.0,
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/fd92dbb9-f67d-11e5-8a84-bae500000076?expand=product.supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stock": -1,
       "inTransit": 0,
       "reserve": 0,
       "quantity": -1,
       "name": "Ball (Volleyball)",
       "code": "00004",
       "price": 0.0,
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/be903062-f504-11e5-8a84-bae50000019a?expand=supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stock": 69,
       "inTransit": 0,
       "reserve": 20,
       "quantity": 49,
       "name": "Trollolosha",
       "code": "00001",
       "price": 50260.86956521739,
       "salePrice": 123000.0,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/d1bef0a1-ffe7-11e5-9464-e4de0000001c?expand=product.supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stock": -1,
       "inTransit": 0,
       "reserve": 0,
       "quantity": -1,
       "name": "Comrade (10)",
       "code": "00214",
       "article": "Article",
       "price": 0.0,
       "salePrice": 346347237000.0,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "folder": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/productfolder/0c78adde-ffe3-11e5-9464-e4de000000a2",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productFolder/metadata",
           "type": "productfolder",
           "mediaType": "application/json"
         },
         "name": "Products From custom group",
         "pathName": "Group"
       },
       "images": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/variant/d1bef0a1-ffe7-11e5-9464-e4de0000001c/images",
           "type": "image",
           "mediaType": "application/json",
           "size": 1,
           "limit": 1000,
           "offset": 0
         }
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     }
   ]
}
```
### Brief Stock Report

Brief Stock Report is a report that shows only the product item ID, stock balance, 'Committed' and 'In Transit' items at the time of the request.
Endpoints are designed to update the stock, the 'Committed' items, and the 'In Transit' items for a large number of products frequently and quickly.
Use the report if you need to monitor the balance of a large number of goods and request data every 5-15 minutes.
 
Differences from the Advanced balance report:

- Only the administrator can request the Brief Stock Report.
- You can get a report with a large amount of data much faster.
- All data is transmitted in one response, without the need for paging.
- The number of products in stock is indicated excluding nested warehouses.
- When splitting by warehouses, the line without a warehouse contains reserves that are not tied to a warehouse.
- Only one data type is returned, it is specified in the `stockType` parameter.
- No sorting, data is displayed in random order.

#### Stock Report Variants
To get the report, use one of the following endpoints:

- Product-wise Stock Summary `/report/stock/all/current` - shows balances grouped by products
- Warehouse-wise Stock Summary `/report/stock/bystore/current` - shows balances grouped by products and warehouses
- Bin-wise Stock Summary `/report/stock/byslot/current` - shows balances grouped by products, warehouses, and warehouse bins

### Get the Brief Stock Report
#### include parameter
By default, only results with a non-zero remainder value are displayed. To display zero stock, add the `include=zeroLines` parameter.

#### changedSince parameter
By default, current stock is displayed. With the `changedSince` parameter, you can get the remainder,
that have changed between the time specified in the `changedSince` parameter and the current moment.
Residuals in responses to endpoints `/report/stock/all/current` and `/report/stock/bystore/current`
this is the actual stock at the current time in all warehouses and broken down by warehouses, respectively, not a delta for the period,
not the stock at the `changedSince` point in time, but the actual quantity of the items, which stock has changed over the interval.
The parameter value format is a string like "yyyy-mm-dd hh-mm-ss". Example: `changedSince=2016-08-23 15:21:09`. [Learn more](../#kladana-json-api-general-info-date-and-time-format)

Restrictions and recommendations imposed on the parameter:

- When using the `changedSince` parameter, the output of zero residuals is always enabled.
- The maximum value of the `changedSince` parameter in the past from the current moment should not exceed 24 hours.
- The minimum value of the `changedSince` parameter in the past from the current moment is not limited.
- The `changedSince` parameter cannot exceed the current moment.
- Slight overlapping of query intervals will help to avoid missing update of stock at interval boundaries. Example: querying stock every 30 minutes in the past 35 minutes.
- It is recommended to perform a full synchronization of stock without the `changedSince` parameter once a day and more often, depending on the frequency of change of stock.

Important: if a product or warehouse was deleted or archived during the requested interval, then the remainder equal to 0 will be displayed. It should be borne in mind that it will no longer be possible to request this product or warehouse by id.

#### stockType parameter
The `stockType` parameter selects the type of stock, 'Committed' and 'In Transit' items to be calculated.
At the moment it is possible to get only one type of stock.
The default value is `stock`

| Value | Description |
| ------- | ------------- |
| **stock** | Physical stock in warehouses, excluding reserve and waiting |
| **freeStock** | stock in warehouses less reserve |
| **quantity** | Available. Considers reserve and expectations |
| **reserve** | 'Committed' items|
| **inTransit** | 'In Transit' items |

#### Available filters for the Current Stock report
You can limit the report to a few products or warehouses.
The entity ID is specified, not the url.

| Value | Type | Filtration | Description |
| -------- | ----- | --------- | --------- |
| **assortmentId** | UUID | `=` | Display only the specified products, product variants and batches in the report |
| **storeId** | UUID | `=` | Display only specified warehouses in the report |

Multiple values can be specified separated by commas or multiple parameters:

- `filter=assortmentId=00000000-0000-0000-0000-000000000001,00000000-0000-0000-0000-000000000002`
- `filter=assortmentId=00000000-0000-0000-0000-000000000001;assortmentId=00000000-0000-0000-0000-000000000002`
- `filter=assortmentId=00000000-0000-0000-0000-000000000001&filter=assortmentId=00000000-0000-0000-0000-000000000002`

#### Request examples
> Request to receive current stock without breakdown by warehouses.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/report/stock/all/current"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
[
   {"assortmentId":"12345678-5838-aaeb-0a80-003a003ef439","stock":11},
   {"assortmentId":"12345678-279c-aaeb-0a80-00d6001f847c","stock":46.5}
]
```

> Request to get the current stock "available" with the output of zero values.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/report/stock/all/current?stockType=quantity&include=zeroLines"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
[
   {"assortmentId":"12345678-5838-aaeb-0a80-003a003ef439","quantity":11},
   {"assortmentId":"12345678-279c-aaeb-0a80-00d6001f1981","quantity":0},
   {"assortmentId":"12345678-279c-aaeb-0a80-00d6001f847c","quantity":46.5},
   {"assortmentId":"12345678-279c-aaeb-0a80-00d6001f3215","quantity":0}
]
```

> Request to get stock with "changedSince" parameter.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/report/stock/all/current?changedSince=2022-08-23 15:00:00"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
[
   {"assortmentId":"12345678-5838-aaeb-0a80-003a003ef439","quantity":1},
   {"assortmentId":"12345678-279c-aaeb-0a80-00d6001f847c","quantity":4.5}
]
```

> Request to receive current stock in warehouses, indicating the type of stock.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/report/stock/bystore/current?stockType=freeStock"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.
The string with "storeId":null corresponds to a part of 'Committed' products for a Sales Order without specifying a warehouse.

```json
[
   {"assortmentId":"12345678-5838-aaeb-0a80-003a003ef439","storeId":"12345678-b123-aaee-0a80-012b0001bb10","freeStock":4},
   {"assortmentId":"12345678-5838-aaeb-0a80-003a003ef439","storeId":"12345678-b123-aaee-0a80-012b0001bb12","freeStock":7},
   {"assortmentId":"12345678-279c-aaeb-0a80-00d6001f847c","storeId":null, "freeStock":-5},
   {"assortmentId":"12345678-279c-aaeb-0a80-00d6001f847c","storeId":"12345678-b123-aaee-0a80-012b0001bb10","freeStock":46}
]
```

> Request to obtain current reserves by warehouses with the type 'reserve' type.

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/report/stock/bystore/current?stockType=reserve"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. Result - JSON representation of the report.
The string with "storeId":null corresponds to a reservation for a Sales Order without specifying a warehouse.

```json
[
  {"assortmentId":"12345678-5838-aaeb-0a80-003a003ef439","storeId":"12345678-b123-aaee-0a80-012b0001bb10","reserve":3},
  {"assortmentId":"12345678-5838-aaeb-0a80-003a003ef439","storeId":"12345678-b123-aaee-0a80-012b0001bb12","reserve":4},
  {"assortmentId":"12345678-279c-aaeb-0a80-00d6001f847c","storeId":null, "reserve":5},
  {"assortmentId":"12345678-279c-aaeb-0a80-00d6001f847c","storeId":"12345678-b123-aaee-0a80-012b0001bb10","reserve":40}
]
```

> Request to get current waiting lists for warehouses of the 'inTransit' type.

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/report/stock/bystore/current?stockType=inTransit"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. Result is a JSON representation of the report.
The row with "storeId":null matches the expectation for a Sales Order without a warehouse specified.

```json
[
  {"assortmentId":"12345678-5838-aaeb-0a80-003a003ef439","storeId":"12345678-b123-aaee-0a80-012b0001bb10","inTransit":7},
  {"assortmentId":"12345678-5838-aaeb-0a80-003a003ef439","storeId":"12345678-b123-aaee-0a80-012b0001bb12","inTransit":10},
  {"assortmentId":"12345678-279c-aaeb-0a80-00d6001f847c","storeId":null, "inTransit":12},
  {"assortmentId":"12345678-279c-aaeb-0a80-00d6001f847c","storeId":"12345678-b123-aaee-0a80-012b0001bb10","inTransit":25}
]
```

> Request for current stock with filtering.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/report/stock/bystore/current?filter=assortmentId=12345678-5838-aaeb-0a80-003a003ef439,12345678-279c-aaeb-0a80-00d6001f847c;storeId=12345678-b123-aaee-0a80-012b0001bb10,12345678-b123-aaee-0a80-012b0001bb13"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
[
   {"assortmentId":"12345678-5838-aaeb-0a80-003a003ef439","storeId":"12345678-b123-aaee-0a80-012b0001bb10","stock":1},
   {"assortmentId":"12345678-279c-aaeb-0a80-00d6001f847c","storeId":"12345678-b123-aaee-0a80-012b0001bb10","stock":3}
]
```

### Get a Brief Report on Warehouse Bin Balances
The report displays the balances of products / product variants / batches in warehouse bins for a specific warehouse(s) or for all warehouses for a particular product(s).
Balances stored outside of warehouse bins will not be included.

Restrictions on the Warehouse Bin Balances Endpoint:
- mandatory filtering parameter: **assortmentId** or **storeId**

#### Available Filters for the Current Warehouse Bin Balances Report
Specify the entity ID, not the URL.

| Title            | Type   | Filtration | Description                                                                  |
|------------------|:-------| :--------- |------------------------------------------------------------------------------|
| **assortmentId** | UUID   | `=`        | Include only specified products, product variants, and batches in the report |
| **storeId**      | UUID   | `=`        | Include only specified warehouses in the report                              |

Multiple values can be specified using commas or multiple parameters:

- `filter=assortmentId=00000000-0000-0000-0000-000000000001,00000000-0000-0000-0000-000000000002`
- `filter=assortmentId=00000000-0000-0000-0000-000000000001;assortmentId=00000000-0000-0000-0000-000000000002`
- `filter=assortmentId=00000000-0000-0000-0000-000000000001&filter=assortmentId=00000000-0000-0000-0000-000000000002`

> Request to retrieve current warehouse bin balances with filtering

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/report/stock/byslot/current?filter=assortmentId=12345678-5838-aaeb-0a80-003a003ef439,12345678-279c-aaeb-0a80-00d6001f847c;storeId=12345678-b123-aaee-0a80-012b0001bb10,12345678-b123-aaee-0a80-012b0001bb13"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the report.

```json
[
  {
    "assortmentId":"12345678-5838-aaeb-0a80-003a003ef439",
    "storeId":"12345678-b123-aaee-0a80-012b0001bb10",
    "slotId":"c3b59812-cd5a-11ed-0a80-0142000026a3",
    "stock":1.2
  },
  {
    "assortmentId":"12345678-279c-aaeb-0a80-00d6001f847c",
    "storeId":"12345678-b123-aaee-0a80-012b0001bb10",
    "slotId":"ede4720d-212f-11ee-ac12-000d000000f0",
    "stock":3
  },
  {
    "assortmentId":"12345678-279c-aaeb-0a80-00d6001f847c",
    "storeId":"12345678-b123-aaee-0a80-012b0001bb10",
    "slotId":"dc27cf31-212f-11ee-ac12-001000000000",
    "stock":1
  }
]
```

### The Warehouse Stock report 

The report displays a list of products and their quantities at each of your warehouses. The report provides current inventory information, offering a clear overview of the availability of items in stock.

#### Report object attributes

| Title | Type | Description |
| -------| ------------- |--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the items in stock<br>`+Required when replying` |
| **stockByStore** | Object | The stock at the warehouse. [Learn more](../reports/#reports-stock-report-the-warehouse-stock-report-stock-balance)<br>`+Required when replying` |

#### Stock balance
The `stockByStore` field is returned from objects with the following attributes:

| Title | Type | Description |
| -------| ------------- |--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Warehouse metadata for the stock displaying <br>`+Required when replying` |
| **stock** | Float | Stock<br>`+Required when replying` |
| **inTransit** | Float | Waiting<br>`+Required for response` |
| **reserve** | Float | Reserve<br>`+Required when replying` |
| **name** | String(255) | Warehouse name<br>`+Required when replying` |

The dimension of this field is always equal to the number of warehouses in the system.

#### Attributes available for filtering

The report results can be filtered using the filter parameter. You cannot specify empty values.

| Title | Type | Filtration | Description |
| -------- | -----| -------- | ------------ |
| **moment** | DateTime | `=` | point in time at which you want to withdraw the stock balance. Passed as a string in [date-time format](../#kladana-json-api-general-info-date-and-time-format) |
| **product** | Object | `=`  | a link to the product you want to filter by. |
| **productFolder** | Object | `=` | a link to the product group by which you want to filter. |
| **search** | String(255) | `=` | special text search option. The search is carried out by the occurrence of a substring in the names of products, product variants, batches. |
| **soldByWeight** | Boolean | `=` | parameter for filtering by weight item. Possible values: true, false. |
| **stockMode** | Enum | `=` | parameter for filtering by the remainder value. The default value is nonEmpty. [Available values](../reports/#reports-stock-report-the-warehouse-stock-report-attributes-available-for-filtering-available-values-for-stockmode) |
| **store** | Object | `=`  | a link to the warehouse for which you want to generate a report. |
| **supplier** | Object | `=` | parameter for filtering by supplier. The value of the parameter is a link to the counterparty or organization. The selection will include products with the specified supplier. |
| **variant** | Object | `=`  | link to the product variant by which you want to filter. |

##### Available values for stockMode

Default value is **nonEmpty**.

| Value | Description |
| -------| ------------- |
| **all** | Any value of the remainder |
| **positiveOnly** | Positive stock |
| **negativeOnly** | Negative stock |
| **empty** | Zero stock |
| **nonEmpty** | Non-zero remainder |
| **underMinimum** | stock is below the minimum level |

Only one of the **product**, **variant**, **productFolder** and **search** parameters can be used in a single query.

Filtering examples:

- `filter=store=https://api.kladana.com/api/remap/1.2/entity/store/656c4032-8552-11e6-8a84-bae500000043`
- `filter=product=https://api.kladana.com/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044`
- `filter=variant=https://api.kladana.com/api/remap/1.2/entity/variant/656c4032-8552-11e6-8a84-bae500000045`
- `filter=productFolder=https://api.kladana.com/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1`
- `filter=stockMode=all`
- `filter=moment=2019-07-10 12:00:00`
- `filter=soldByWeight=true`
- `filter=supplier=https://api.kladana.com/api/remap/1.2/entity/counterparty/656c4032-8667-11e6-8a84-bae5000033aa`
- `filter=search=div`

#### Filtering by additional fields and characteristics

Using the filter parameter, the selection can also be filtered by the values of additional product fields and product variant characteristics.

To filter by the value of an additional field, you need to pass a reference to the additional field and its value:

`filter=https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/<id>=<Value>`

To filter by the value of additional fields like string, text and link, use the `=` operator.

To filter by the value of additional fields of type integer, real number, date, you can use the operators `=`, `>=`, `<=`. For an additional date-time field, the value is passed as a string in [date-time format](../#kladana-json-api-general-info-date-and-time-format).

To filter by the value of additional fields of the lookup type, you need to use the `=` operator. As a value, you need to pass a reference to the directory object.

An example of filtering by an additional field of the warehouse reference type: `filter=https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/ea12a6dd-79e5-11e9-9ff4-31500040893d=https:// api.kladana.com/api/remap/1.2/entity/store/302f2a81-9977-11e9-9109-f8fc00020e02`

Example of filtering by additional field ttype user reference: `filter=https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/ea12a6dd-79e5-11e9-9ff4-31500040893d=https://api.kladana.com/api/remap/1.2/entity/customentity/8955249d-997d-11e9-9ff4-3150000e65c3/8955314d-997d-11e9-9ff4-3150000e65c4`

To filter by the value of additional fields of the checkbox type, use the `=` operator. Possible values: true, false.

Filtering by additional fields of the file type is not supported.

To filter by the value of a characteristic, you need to pass a reference to the characteristic and value:

`filter=https://api.kladana.com/api/remap/1.2/entity/variant/metadata/characteristics/<id>=<Value>`

To filter by the value of a characteristic, use the `=` operator.

#### Attributes available for sorting

The report results can be sorted using the [order](../#kladana-json-api-general-info-sorting-of-objects) parameter.

| Title | Description |
| -------| ------------- |
| **pathName** | by product group |
| **name** | by name |
| **code** | by code |
| **productCode** | by article |
| **stockOnAllStores** | by the amount of stock in all warehouses |

By default, the selection is sorted by product group and product name.

### Get stock balance

**Parameters**

| Parameter | Description |
| -------| ------------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **groupBy** | `string` (optional) the type to group the output by. By default, the groupBy parameter is set to variant. If you want to see objects of type product, you must set the appropriate parameter value. <ul><li>groupBy=product - lists products only</li><li>groupBy=variant - lists products and product variants</li></ul> |
 
> Request to receive the Stock report by warehouses.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/report/stock/bystore"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

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
     "href": "https://api.kladana.com/api/remap/1.2/report/stock/bystore",
     "type": "stockbystore",
     "mediaType": "application/json",
     "size": 225,
     "limit": 1000,
     "offset": 0,
     "nextHref": "https://api.kladana.com/api/remap/1.2/report/stock/bystore?limit=25&offset=25"
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/c02e3a5c-007e-11e6-9464-e4de00000006?expand=supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stockByStore": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Not the main warehouse",
           "stock": -30,
           "reserve": 0,
           "inTransit": 0
         },
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Main warehouse",
           "stock": 0,
           "reserve": 0,
           "inTransit": 0
         }
       ]
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/cc99c055-fa34-11e5-9464-e4de00000069?expand=supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stockByStore": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Not the main warehouse",
           "stock": 0,
           "reserve": 0,
           "inTransit": 0
         },
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Main warehouse",
           "stock": 4,
           "reserve": 0,
           "inTransit": 0
         }
       ]
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/e8f5f9ff-fa34-11e5-9464-e4de0000008a?expand=supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stockByStore": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Not the main warehouse",
           "stock": 0,
           "reserve": 0,
           "inTransit": 0
         },
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Main warehouse",
           "stock": 1,
           "reserve": 0,
           "inTransit": 0
         }
       ]
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/e8f9d714-fa34-11e5-9464-e4de0000008d?expand=product.supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stockByStore": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Not the main warehouse",
           "stock": 0,
           "reserve": 0,
           "inTransit": 0
         },
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Main warehouse",
           "stock": 1,
           "reserve": 0,
           "inTransit": 0
         }
       ]
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/e8fc24b5-fa34-11e5-9464-e4de00000091?expand=product.supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stockByStore": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Not the main warehouse",
           "stock": 0,
           "reserve": 0,
           "inTransit": 0
         },
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Main warehouse",
           "stock": 1,
           "reserve": 0,
           "inTransit": 0
         }
       ]
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/e91042b4-fa34-11e5-9464-e4de00000095?expand=product.supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stockByStore": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Not the main warehouse",
           "stock": 0,
           "reserve": 0,
           "inTransit": 0
         },
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Main warehouse",
           "stock": 1,
           "reserve": 0,
           "inTransit": 0
         }
       ]
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/daf1186d-fa34-11e5-9464-e4de0000006f?expand=supplier",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stockByStore": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Not the main warehouse",
           "stock": 0,
           "reserve": 0,
           "inTransit": 0
         },
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Main warehouse",
           "stock": 1,
           "reserve": 0,
           "inTransit": 0
         }
       ]
     }
   ]
}
```
