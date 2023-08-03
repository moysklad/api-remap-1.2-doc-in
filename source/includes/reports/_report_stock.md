# Reports

## Balance report

The report on the balances in MySklad is available in extended and short form. You can request a report using the JSON API. You can also subscribe to webhooks to change balances. Use the JSON API if balances change frequently and you want to query them every few minutes. If balances change less than once every few minutes and you want to be notified of changes, use webhooks.

No additional rights are required to work with the report.

The content of the report is affected by the visibility settings of the documents available to the user who requested the report. If the user does not have the appropriate visibility rights, the report may not display:

- data on specific goods and warehouses;
- cost, purchase price, profit.

Learn more about [Stock report](https://kladana.zendesk.com/hc/en-us/articles/360012272317-Stock-report).

### Extended balance report
An extended stock report is a detailed report that collects data on all products with all the necessary information about the product (barcode, prices, image, etc.). Use the report to get detailed information about products or periodically perform full synchronization with My Warehouse, for example, once a day. However, this is a rather long and heavy request, and it is often not recommended to use it.

#### Report object attributes:

| Title | Type | Description |
| ------ | ------- | ----------- |
| **article** | String(255) | Article |
| **code** | String(255) | Code<br>`+Required when replying` |
| **externalCode** | String(255) | External code of the entity for which the balance is displayed<br>`+Required when replying` |
| **folder** | object | Group of Goods/Modifications/Series. [More details here](../reports/#reports-balance-report-rasshirennyj-otchet-ob-ostatkah-gruppa)<br>`+Required when replying` |
| **images** | [Meta](../#kladana-json-api-general-info-metadata) | Image metadata of Product/Modification/Series |
| **inTransit** | float | Waiting<br>`+Required for response` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Product/Modification/Series for which the rest is issued<br>`+Required when answering` |
| **name** | String(255) | Name<br>`+Required when answering` |
| **price** | float | Cost price |
| **quantity** | float | Available<br>`+Required when replying` |
| **reserve** | float | Reserve<br>`+Required when replying` |
| **saleprice** | float | Sale price |
| **stock** | float | Remaining<br>`+Required when answering` |
| **stockDays** | int | Number of days in stock<br>`+Mandatorylnoe when answering` |
| **wom** | object | Unit of measurement. [More details here](../reports/#reports-balance-report-rasshirennyj-otchet-ob-ostatkah-edinica-izmereniq)<br>`+Required when replying` |

#### Nested entity attributes
#### Unit

| Title | Type | Description |
| ------- | ----------- |-------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Unit metadata<br>`+Required when replying` |
| **name** | String(255) | Name of measurement unit<br>`+Required when answering` |

#### Group

| Title | Type | Description |
| ------- | ----------- |--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Product group metadata<br>`+Required when replying` |
| **name** | String(255) | Group name<br>`+Required when replying` |
| **pathName** | string | Parent group name<br>`+Required when replying` |

#### Attributes available for filtering

The report results can be filtered using the filter parameter.

| Title | Type | Filtration | Description |
|--------------------|---------- | --------- |----|
| **archived** | Boolean | `=` | parameter for filtering by archived products. Possible values: true, false. To return both archived and non-archived products, you need to pass two values at once, true and false. |
| **inTransitOnly** | Boolean | `=` | parameter to filter by wait value. If you pass true, only products with pending will be included in the selection. |
| **moment** | datetime | `=` | point in time at which you want to withdraw the balances. Passed as a string in [date-time format](../#mojsklad-json-api-obschie-swedeniq-format-daty-i-wremeni) |
| **product** | object | `=` `!=` | option to filter by multiple products. The parameter value is a link to a product that should be included in the selection or excluded from it. You can pass multiple values. This filter option can be combined with the `variant` option. |
| **productFolder** | object | `=` `!=` | parameter for filtering by several product groups. The value of the parameter is a link to a product group that should be included in the selection or excluded from it. You can pass multiple values. |
| **withSubFolders** | Boolean | `=` | option to consider nested subgroups. Works only if there is a filter by `productFolder`. By default `true`, products from child subgroups of the filtered group / groups of products are displayed. When passing `false`, only products from the filtered group / groups are displayed, without taking into account subgroups. |
| **quantityMode** | Enum | `=` | option to filter by value is available. The default value is nonEmpty. [Available values](../reports/#reports-balance-report-rasshirennyj-otchet-ob-ostatkah-atributy-dostupnye-dlq-fil-tracii-dostupnye-znacheniq-dlq-quantitymode) |
| **reserveOnly** | Boolean | `=` | parameter for filtering by reserve value. If you pass true, I will get into the selectiont only goods with a reserve. |
| **search** | String(255) | `=` `!~` | special text search option. The search is carried out by the occurrence of a substring in the names of goods, modifications, series. |
| **soldByWeight** | Boolean | `=` | parameter for filtering by weight item. Possible values: true, false. |
| **stockDaysFrom** | int | `=` | parameter for filtering by the number of days in stock. You need to send an integer. The selection will include products with the number of days in stock greater than or equal to the specified one. This filter parameter can be combined with the `stockDaysTo` parameter. |
| **stockDaysTo** | int | `=` | parameter for filtering by the number of days in stock. You need to send an integer. The selection will include products with the number of days in the warehouse less than or equal to the specified one. This filtering option can be combined with the `stockDaysFrom` option. |
| **stockMode** | Enum | `=` | parameter for filtering by the remainder value. The default value is all. [Available values](../reports/#reports-balance-report-rasshirennyj-otchet-ob-ostatkah-atributy-dostupnye-dlq-fil-tracii-dostupnye-znacheniq-dlq-stockmode) |
| **store** | object | `=` `!=` | parameter for filtering by multiple warehouses. The value of the parameter is a reference to the warehouse that should be taken into account in the selection or excluded from it. You can pass multiple values. |
| **supplier** | object | `=` `!=` | option to filter by multiple vendors. The value of the parameter is a link to the counterparty or organization. The selection will include or exclude products from the specified suppliers. You can pass an empty value, then the selection will include products with an empty or filled supplier. |
| **option** | object | `=` `!=` | parameter for filtering by several modifications. The value of the parameter is a reference to the modification that should be included in the selection or excluded from it. You can pass multiple values. This filter option can be combined with the `product` option. |

##### Available values for stockMode

The default value is all.

| Value | Description |
| ------- | ----------- |
| **all** | Any value of the remainder |
| **positiveOnly** | Positive balance |
| **negativeOnly** | Negative balance |
| **empty** | Zero balance |
| **nonEmpty** | Non-zero remainder |
| **underMinimum** | Balance below minimum balance |

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

- `filter=store=https://app.kladana.in/api/remap/1.2/entity/store/656c4032-8667-11e6-8a84-bae500003321`
- `filter=productFolder=https://app.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1`
- `filter=productFolder=https://app.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;withSubFolders=false`
- `filter=productFolder=https://app.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;productFolder=https://app.kladana.in/api/ remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b2`
- `filter=productFolder=https://app.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;productFolder=https://app.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b2;withSubFolders=false`
- `filter=product=https://app.kladana.in/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044;product=https://app.kladana.in/api/ remap/1.2/entity/product/706b9cd3-8552-11e6-8a84-bae500000045;product=https://app.kladana.in/api/remap/1.2/entity/product/7a5f0ed5-8552-11e6-8a84-bae500000046`
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
- `filter=supplier=https://app.kladana.in/api/remap/1.2/entity/counterparty/656c4032-8667-11e6-8a84-bae5000033aa`
- `filter=search=div`

#### Filtering by additional fields and characteristics

Using the filter parameter, the selection can also be filtered by the values of additional product fields and modification characteristics.

To filter by the value of an additional field, you need to pass a reference to the additional field and its value:

`filter=https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/<id>=<Value>`

To filter by the value of additional fields like string, text and link, use the `=` operator. You can also use the `=` and `!=` operators with an empty value to get products with only an empty additional field or only a filled one, respectively.

To filter by the value of additional fields of type integer, real number, date, you can use the operators `=`, `>=`, `<=`. You can also use the `=` and `!=` operators with an empty value to get products with only an empty additional field or only a filled one, respectively. For an additional date-time field, the value is passed as a string in [date-time format](../#mojsklad-json-api-obschie-swedeniq-format-daty-i-wremeni).

To filter by the value of additional fields of the lookup type, you can use the `=` and `!=` operators. As a value, you need to pass a reference to the directory object. You can also use the `=` and `!=` operators with an empty value to get products with only an empty additional field or only a filled one, respectively.

An example of filtering by an additional field of the warehouse reference type: `filter=https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/ea12a6dd-79e5-11e9-9ff4-31500040893d=http:// app.kladana.in/api/remap/1.2/entity/store/302f2a81-9977-11e9-9109-f8fc00020e02`

An example of filtering by an additional field of the user directory type: `filter=https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/ea12a6dd-79e5-11e9-9ff4-31500040893d=http:// app.kladana.in/api/remap/1.2/entity/customentity/8955249d-997d-11e9-9ff4-3150000e65c3/8955314d-997d-11e9-9ff4-3150000e65c4`

To filter by the value of additional fields of the checkbox type, use the `=` operator. Possible values: true, false.

Filtering by additional fields of the file type is not supported.

To filter by the value of a characteristic, you need to pass a reference to the characteristic and value:

`filter=https://app.kladana.in/api/remap/1.2/entity/variant/metadata/characteristics/<id>=<Value>`

To filter by the value of a characteristic, use the `=` operator. You can also use the `=` and `!=` operators with an empty value to get products or modifications with only an empty characteristic or only a filled one, respectively.

#### Attributes available for sorting

The report results can be sorted using the [order](../#mojsklad-json-api-obschie-swedeniq-sortirowka-ob-ektow) parameter.

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
| **saleprice** | at the selling price |
| **stock** | by value of remainder |
| **sumTotal** | by cost |

By default, the selection is sorted by product group and product name.

### Get Advanced balance report

**Parameters**

| Parameter | Description | 
| ------- | ----------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **groupBy** | `string` (optional) The type to group the output by. By default, the groupBy parameter is set to variant. If you want to see objects of type product, you must set the appropriate parameter value. <ul><li>groupBy=product - lists products only</li><li>groupBy=variant - lists products and modifications</li></ul> |
| **includeRelated** | `boolean` (optional) Output of balances by product modifications and series. This parameter allows you to include balances by modifications and series for goods in the selection. A prerequisite for applying the parameter is the **mandatory** filtering by products or modifications, or a combination of them. If the value `includeRelated=true` is selected, all balances for products, modifications and series specified in the filtering parameters will be included.|

Examples of using the `includeRelated` parameter: <br> `filter=variant!=<URL>&includeRelated=true` displays the rest of products, modifications, series, except for the specific modification specified in the URL. <br>`filter=product=<URL>&includeRelated=true` displays the remnants of a specific product specified in the URL, its modification and series.
 
> Request for an Advanced Balance Report.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/report/stock/all"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
{
   context: {
     "employee": {
       "href": "https://app.kladana.in/api/remap/1.2/context/employee",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/report/stock/all",
     "type": "stock",
     "mediaType": "application/json",
     size: 26
     limit: 10
     offset: 0
     "nextHref": "http://app.kladana.in/api/remap/1.2/report/stock/all?limit=10&offset=10"
   },
   rows: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/c02e3a5c-007e-11e6-9464-e4de00000006?expand=supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stock": -30,
       "inTransit": 0
       "reserve": 0
       "quantity": -30,
       "name": "Product",
       "code": "one1",
       "article": "Ar23",
       price: 0.0
       "salePrice": 346347237000.0,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/cc99c055-fa34-11e5-9464-e4de00000069?expand=supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stock": 4,
       "inTransit": 0
       "reserve": 0
       "quantity": 4,
       "name": "ItemWithout Barcode",
       "code": "00006",
       price: 0.0
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/e8f5f9ff-fa34-11e5-9464-e4de0000008a?expand=supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stock": 1,
       "inTransit": 0
       "reserve": 0
       quantity: 1
       "name": "Product with fashion without bar code",
       "code": "00008",
       price: 0.0
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/variant/e8f9d714-fa34-11e5-9464-e4de0000008d?expand=product.supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stock": 1,
       "inTransit": 0
       "reserve": 0
       quantity: 1
       "name": "Product with fashion without bar code (1)",
       "code": "00208",
       price: 0.0
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/variant/e8fc24b5-fa34-11e5-9464-e4de00000091?expand=product.supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stock": 1,
       "inTransit": 0
       "reserve": 0
       quantity: 1
       "name": "Product with fashion without bar code (2)",
       "code": "00209",
       price: 0.0
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/variant/e91042b4-fa34-11e5-9464-e4de00000095?expand=product.supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stock": 1,
       "inTransit": 0
       "reserve": 0
       quantity: 1
       "name": "Product with fashion without bar code (3)",
       "code": "00210",
       price: 0.0
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/daf1186d-fa34-11e5-9464-e4de0000006f?expand=supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stock": 1,
       "inTransit": 0
       "reserve": 0
       quantity: 1
       "name": "Item with fashion_and_code",
       "code": "00007",
       price: 0.0
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/variant/db1a888a-fa34-11e5-9464-e4de00000073?expand=product.supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stock": 1,
       "inTransit": 0
       "reserve": 0
       quantity: 1
       "name": "Item with fashion_and_code(1)",
       "code": "00205",
       price: 0.0
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/variant/db2066c8-fa34-11e5-9464-e4de00000077?expand=product.supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stock": 1,
       "inTransit": 0
       "reserve": 0
       quantity: 1
       "name": "Item with fashion_and_code(2)",
       "code": "00206",
       price: 0.0
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/variant/db22f3e8-fa34-11e5-9464-e4de0000007b?expand=product.supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stock": 1,
       "inTransit": 0
       "reserve": 0
       quantity: 1
       "name": "Item with fashion_and_code(3)",
       "code": "00207",
       price: 0.0
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/d3e2dcd6-f648-11e5-8a84-bae500000074?expand=supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stock": -6438,
       "inTransit": 0
       "reserve": 0
       "quantity": -6438,
       "name": "ProductWithCountry",
       "code": "00002",
       price: 0.0
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/eeef177f-f648-11e5-8a84-bae50000007a?expand=supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stock": -113,
       "inTransit": 0
       "reserve": 0
       "quantity": -113,
       "name": "Ball",
       "code": "00003",
       price: 0.0
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           type:"uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/variant/fd867506-f67d-11e5-8a84-bae50000006e?expand=product.supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stock": -21,
       "inTransit": 0
       "reserve": 0
       "quantity": -21,
       "name": "Ball (Soccer)",
       "code": "00002",
       price: 0.0
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/variant/fd92dbb9-f67d-11e5-8a84-bae500000076?expand=product.supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stock": -1,
       "inTransit": 0
       "reserve": 0
       "quantity": -1,
       "name": "Ball (Volleyball)",
       "code": "00004",
       price: 0.0
       "salePrice": 0.0,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/be903062-f504-11e5-8a84-bae50000019a?expand=supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       stock: 69
       "inTransit": 0
       "reserve": 20
       "quantity": 49,
       "name": "Trollolosha",
       "code": "00001",
       "price": 50260.86956521739,
       "salePrice": 123000.0,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/variant/d1bef0a1-ffe7-11e5-9464-e4de0000001c?expand=product.supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stock": -1,
       "inTransit": 0
       "reserve": 0
       "quantity": -1,
       "name": "Comrade (10)",
       "code": "00214",
       "article": "Article",
       price: 0.0
       "salePrice": 346347237000.0,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         },
         "name": "pcs"
       },
       folder: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/productfolder/0c78adde-ffe3-11e5-9464-e4de000000a2",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/productFolder/metadata",
           "type": "productfolder",
           "mediaType": "application/json"
         },
         "name": "Products From custom group",
         "pathName": "Group"
       },
       "images": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/variant/d1bef0a1-ffe7-11e5-9464-e4de0000001c/images",
           "type": "image",
           "mediaType": "application/json",
           size: 1
           limit: 1000
           offset: 0
         }
       },
       "externalCode": "ibWbdtWWhXiIwfZVEal6z2"
     }
   ]
}
```
### Summary of balances

A stock summary report is a report that shows only the item ID and stock balance at the time of the request. Use the report if you need to monitor the balance of a large number of goods and request data every 5-15 minutes.
 
Differences from the Advanced balance report:

- Only the administrator can request a summary of the balances.
- You can get a report with a large amount of data much faster.
- All data is transmitted in one response, without the need for paging.
- The number of warehouses is indicated excluding nested warehouses.
- When splitting by warehouses, the line without a warehouse contains reserves that are not tied to a warehouse.
- Only one type of stock is returned, specified in the `stockType` parameter.
- No sorting, data is displayed in random order.

### Get Summary Summary of Balances
To get a report, use the `/report/stock/all/current` and `/report/stock/bystore/current` endpoints.

Endpoints are designed to frequently and quickly update balances for a large number of products.

#### include parameter
By default, only results with a non-zero remainder value are displayed.
To display zero balances, you need to add the `include=zeroLines` parameter.

#### changedSince parameter
By default, current balances are displayed. With the `changedSince` parameter, you can get the remainder,
that have changed between the time specified in the `changedSince` parameter and the current moment.
Residuals in responses to endpoints `/report/stock/all/current` and `/report/stock/bystore/current`
this is the actual balance at the current time in all warehouses and broken down by warehouses, respectively, not a delta for the period,
not the balance at the `changedSince` point in time, but the actual balance of the item, whose balance has changed over the interval.
The parameter value format is a string like "yyyy-mm-dd hh-mm-ss". Example: `changedSince=2016-08-23 15:21:09`. [Learn more](../#mojsklad-json-api-obschie-swedeniq-format-date-i-wremeni)

Restrictions and recommendations imposed on the parameter:

- When using the `changedSince` parameter, the output of zero residuals is always enabled.
- The maximum value of the `changedSince` parameter in the past from the current moment should not exceed 24 hours.
- The minimum value of the `changedSince` parameter in the past from the current moment is not limited.
- The `changedSince` parameter cannot exceed the current moment.
- Slight overlapping of query intervals will help to avoid missing update of balances at interval boundaries (example: querying balances every 30 minutes in the past 35 minutes).
- It is recommended to perform a full synchronization of balances without the `changedSince` parameter once a day and more often, depending on the frequency of change of balances.

Important: if a product or warehouse was deleted (not archived) during the requested interval, then the remainder equal to 0 will be displayed. It should be borne in mind that it will no longer be possible to request this product or warehouse by id.

#### stockType parameter
The `stockType` parameter selects the type of stock to be calculated.
At the moment it is possible to get only one type of balance.
The default value is `stock`

| Value | Description |
| -------| ------------- |
| **stock** | Physical balance in warehouses, excluding reserve and waiting |
| **freeStock** | Balance in warehouses less reserve |
| **quantity** | Available. Considers reserve and expectations |

#### Available filters for the Current Balances report
You can limit the report to a few products or warehouses.
The entity id is specified, not the url.

| Value | Type | Filtration | Description |
| --------|----- |--------- | --------- |
| **assortmentId** | UUID | `=` | Display only the specified products, modifications and series in the report |
| **storeId** | UUID | `=` | Display only specified warehouses in the report |

Multiple values can be specified separated by commas or multiple parameters:

- `filter=assortmentId=00000000-0000-0000-0000-000000000001,00000000-0000-0000-0000-000000000002`
- `filter=assortmentId=00000000-0000-0000-0000-000000000001;assortmentId=00000000-0000-0000-0000-000000000002`
- `filter=assortmentId=00000000-0000-0000-0000-000000000001&filter=assortmentId=00000000-0000-0000-0000-000000000002`

#### Request examples
> Request to receive current balances without breakdown by warehouses.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/report/stock/all/current"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
[
   {"assortmentId":"12345678-5838-aaeb-0a80-003a003ef439","stock":11},
   {"assortmentId":"12345678-279c-aaeb-0a80-00d6001f847c","stock":46.5}
]
```

> Request to get the current balances "available" with the output of zero values.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/report/stock/all/current?stockType=quantity&include=zeroLines"
   -H "Authorization: Basic <Credentials>"
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

> Request to get balances with "changedSince" parameter.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/report/stock/all/current?changedSince=2022-08-23 15:00:00"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
[
   {"assortmentId":"12345678-5838-aaeb-0a80-003a003ef439","quantity":1},
   {"assortmentId":"12345678-279c-aaeb-0a80-00d6001f847c","quantity":4.5}
]
```

> Request to receive current balances in warehouses, indicating the type of balance.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/report/stock/bystore/current?stockType=freeStock"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.
The string with "storeId":null corresponds to a reserve for a Sales Order without specifying a warehouse.

```json
[
   {"assortmentId":"12345678-5838-aaeb-0a80-003a003ef439","storeId":"12345678-b123-aaee-0a80-012b0001bb10","freeStock":4},
   {"assortmentId":"12345678-5838-aaeb-0a80-003a003ef439","storeId":"12345678-b123-aaee-0a80-012b0001bb12","freeStock":7},
   {"assortmentId":"12345678-279c-aaeb-0a80-00d6001f847c","storeId":null, "freeStock":-5},
   {"assortmentId":"12345678-279c-aaeb-0a80-00d6001f847c","storeId":"12345678-b123-aaee-0a80-012b0001bb10","freeStock":46}
]
```

> Request for current balances with filtering.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/report/stock/bystore/current?filter=assortmentId=12345678-5838-aaeb-0a80-003a003ef439,12345678-279c-aaeb-0a80-00d6001f847c;storeId =12345678-b123-aaee-0a80-012b0001bb10,12345678-b123-aaee-0a80-012b0001bb13"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
[
   {"assortmentId":"12345678-5838-aaeb-0a80-003a003ef439","storeId":"12345678-b123-aaee-0a80-012b0001bb10","stock":1},
   {"assortmentId":"12345678-279c-aaeb-0a80-00d6001f847c","storeId":"12345678-b123-aaee-0a80-012b0001bb10","stock":3}
]
```


### Stock balances
The "Balance by warehouse" report is an array of objects, each of
which shows the Remaining for each of the goods in each of the warehouses.
#### Report object attributes:

| Title | Type | Description |
| -------| ------------- |--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the item for which the Balance is given<br>`+Required when answering` |
| **stockByStore** | object | The rest of the warehouses. [More details here](../reports/#reports-balance-report-ostatki-po-skladam-ostatki-po-skladam)<br>`+Required when replying` |

#### Stock balances
The "Stock by stock" field (stockByStore) is a return from objects with the following attributes:

| Title | Type | Description |
| -------| ------------- |--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Warehouse metadata for displaying Remaining<br>`+Required when replying` |
| **stock** | int | Remaining<br>`+Required when answering` |
| **inTransit** | int | Waiting<br>`+Required for response` |
| **reserve** | int | Reserve<br>`+Required when replying` |
| **name** | String(255) | Warehouse name<br>`+Required when replying` |

The dimension of this field is always equal to the number of warehouses in the system.

#### Attributes available for filtering

The report results can be filtered using the filter parameter. You cannot specify empty values.

| Title | Type | Filtration | Description |
| -------- | -----| -------- | ------------ |
| **moment** | datetime | `=` | point in time at which you want to withdraw the balances. Passed as a string in [date-time format](../#mojsklad-json-api-obschie-swedeniq-format-date-i-wremeni) |
| **product** | object | `=` `!=` | a link to the product you want to filter by. |
| **productFolder** | object | `=` `!=` | a link to the product group by which you want to filter. |
| **search** | String(255) | `=` | special text search option. The search is carried out by the occurrence of a substring in the names of goods, modifications, series. |
| **soldByWeight** | Boolean | `=` | parameter for filtering by weight item. Possible values: true, false. |
| **stockMode** | Enum | `=` | parameter for filtering by the remainder value. The default value is nonEmpty. [Available values](../reports/#reports-balance-report-ostatki-po-skladam-atributy-dostupnye-dlq-fil-tracii-dostupnye-znacheniq-dlq-stockmode) |
| **store** | object | `=` `!=` | a link to the warehouse for which you want to generate a report. |
| **supplier** | object | `=` `!=` | parameter for filtering by supplier. The value of the parameter is a link to the counterparty or organization. The selection will include products with the specified supplier. |
| **option** | object | `=` `!=` | link to the modification by which you want to filter. |

##### Available values for stockMode
The default value is all.

| Value | Description |
| -------| ------------- |
| **all** | Any value of the remainder |
| **positiveOnly** | Positive balance |
| **negativeOnly** | Negative balance |
| **empty** | Zero balance |
| **nonEmpty** | Non-zero remainder |
| **underMinimum** | Balance below minimum balance |

Only one of the **product**, **variant**, **productFolder** and **search** parameters can be used in a single query.

Filtering examples:

- `filter=store=https://app.kladana.in/api/remap/1.2/entity/store/656c4032-8552-11e6-8a84-bae500000043`
- `filter=product=https://app.kladana.in/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044`
- `filter=variant=https://app.kladana.in/api/remap/1.2/entity/variant/656c4032-8552-11e6-8a84-bae500000045`
- `filter=productFolder=https://app.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1`
- `filter=stockMode=all`
- `filter=moment=2019-07-10 12:00:00`
- `filter=soldByWeight=true`
- `filter=supplier=https://app.kladana.in/api/remap/1.2/entity/counterparty/656c4032-8667-11e6-8a84-bae5000033aa`
- `filter=search=div`

#### Filtering by additional fields and characteristics

Using the filter parameter, the selection can also be filtered by the values of additional product fields and modification characteristics.

To filter by the value of an additional field, you need to pass a reference to the additional field and its value:

`filter=https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/<id>=<Value>`

To filter by the value of additional fields like string, text and link, use the `=` operator.

To filter by the value of additional fields of type integer, real number, date, you can use the operators `=`, `>=`, `<=`. For an additional date-time field, the value is passed as a string in [date-time format](../#mojsklad-json-api-obschie-swedeniq-format-daty-i-wremeni).

To filter by the value of additional fields of the lookup type, you need to use the `=` operator. As a value, you need to pass a reference to the directory object.

An example of filtering by an additional field of the warehouse reference type: `filter=https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/ea12a6dd-79e5-11e9-9ff4-31500040893d=https:// app.kladana.in/api/remap/1.2/entity/store/302f2a81-9977-11e9-9109-f8fc00020e02`

Example of filtering by additional field ttype user reference: `filter=https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/ea12a6dd-79e5-11e9-9ff4-31500040893d=http://app.kladana.in /api/remap/1.2/entity/customentity/8955249d-997d-11e9-9ff4-3150000e65c3/8955314d-997d-11e9-9ff4-3150000e65c4`

To filter by the value of additional fields of the checkbox type, use the `=` operator. Possible values: true, false.

Filtering by additional fields of the file type is not supported.

To filter by the value of a characteristic, you need to pass a reference to the characteristic and value:

`filter=https://app.kladana.in/api/remap/1.2/entity/variant/metadata/characteristics/<id>=<Value>`

To filter by the value of a characteristic, use the `=` operator.

#### Attributes available for sorting

The report results can be sorted using the [order](../#mojsklad-json-api-obschie-swedeniq-sortirowka-ob-ektow) parameter.

| Title | Description |
| -------| ------------- |
| **pathName** | by product group |
| **name** | by name |
| **code** | by code |
| **productCode** | by article |
| **stockOnAllStores** | by the amount of balance in all warehouses |

By default, the selection is sorted by product group and product name.

### Get stock balances

**Parameters**

| Parameter | Description |
| -------| ------------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **groupBy** | `string` (optional) the type to group the output by. By default, the groupBy parameter is set to variant. If you want to see objects of type product, you must set the appropriate parameter value. <ul><li>groupBy=product - lists products only</li><li>groupBy=variant - lists products and modifications</li></ul> |
 
> Request to receive the report "Balances by warehouses".

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/report/stock/bystore"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
{
   context: {
     "employee": {
       "href": "https://app.kladana.in/api/remap/1.2/context/employee",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/report/stock/bystore",
     "type": "stockbystore",
     "mediaType": "application/json",
     size: 225
     limit: 1000
     offset: 0
     "nextHref": "http://app.kladana.in/api/remap/1.2/report/stock/bystore?limit=25&offset=25"
   },
   rows: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/c02e3a5c-007e-11e6-9464-e4de00000006?expand=supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stockByStore": [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Not the main warehouse",
           "stock": -30,
           "reserve": 0
           "inTransit": 0
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Main warehouse",
           stock: 0,
           "reserve": 0
           "inTransit": 0
         }
       ]
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/cc99c055-fa34-11e5-9464-e4de00000069?expand=supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stockByStore": [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Not the main warehouse",
           stock: 0,
           "reserve": 0
           "inTransit": 0
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Main warehouse",
           "stock": 4,
           "reserve": 0
           "inTransit": 0
         }
       ]
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/e8f5f9ff-fa34-11e5-9464-e4de0000008a?expand=supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stockByStore": [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Not the main warehouse",
           stock: 0,
           "reserve": 0
           "inTransit": 0
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Main warehouse",
           "stock": 1,
           "reserve": 0
           "inTransit": 0
         }
       ]
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/variant/e8f9d714-fa34-11e5-9464-e4de0000008d?expand=product.supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stockByStore": [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Not the main warehouse",
           stock: 0,
           "reserve": 0
           "inTransit": 0
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Main warehouse",
           "stock": 1,
           "reserve": 0
           "inTransit": 0
         }
       ]
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/variant/e8fc24b5-fa34-11e5-9464-e4de00000091?expand=product.supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stockByStore": [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Not the main warehouse",
           stock: 0,
           "reserve": 0
           "inTransit": 0
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Main warehouse",
           "stock": 1,
           "reserve": 0
           "inTransit": 0
         }
       ]
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/variant/e91042b4-fa34-11e5-9464-e4de00000095?expand=product.supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json"
       },
       "stockByStore": [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Not the main warehouse",
           stock: 0,
           "reserve": 0
           "inTransit": 0
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Main warehouse",
           "stock": 1,
           "reserve": 0
           "inTransit": 0
         }
       ]
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/daf1186d-fa34-11e5-9464-e4de0000006f?expand=supplier",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "stockByStore": [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Not the main warehouse",
           stock: 0,
           "reserve": 0
           "inTransit": 0
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
             "type": "store",
             "mediaType": "application/json"
           },
           "name": "Main warehouse",
           "stock": 1,
           "reserve": 0
           "inTransit": 0
         }
       ]
     }
   ]
}
```
