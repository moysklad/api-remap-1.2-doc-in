## Stock movement report

Using the JSON API, you can request a Stock Movement report for all products and modifications. To access the report via the API, you need the right to view the Stock Movement report.

Learn more [Stock Movement report](https://kladana.zendesk.com/hc/en-us/articles/6507166907677-Stock-Movement-report-).

### Stock movement report by goods
A general Stock movement report for goods and variants without warehouses.

#### Report object attributes

| Title | Type | Description |
| ---------| ----- | ----- |
| **assortment** | Object | Brief presentation of the Item or Modification in the report. [More details here](#reports-stock-movement-report-stock-movement-report-by-goods-assortment-object-structure)<br>`+Required when answering` |
| **onPeriodStart** | Object | Indicators at the beginning of the period. [More details here](#reports-stock-movement-report-stock-movement-report-by-goods-indicators-object-structure-onperiodstart-onperiodend-income-outcome)<br>`+Required when replying` |
| **onPeriodEnd** | Object | Indicators at the end of the period. [More details here](#reports-stock-movement-report-stock-movement-report-by-goods-indicators-object-structure-onperiodstart-onperiodend-income-outcome)<br>`+Required when replying` |
| **income** | Object | Revenue figures during the reporting period. [More details here](#reports-stock-movement-report-stock-movement-report-by-goods-indicators-object-structure-onperiodstart-onperiodend-income-outcome)<br>`+Required when replying` |
| **outcome** | Object | Consumption figures during the reporting period. [More details here](#reports-stock-movement-report-stock-movement-report-by-goods-indicators-object-structure-onperiodstart-onperiodend-income-outcome)<br>`+Required when replying` |

#### Assortment object structure

| Title | Type | Description |
| ----- | ----- |--------- |
| **article** | String(255) | Article of Goods |
| **code** | String(255) | Product Code |
| **images** | Object | The first image of the Product or Modification |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Product or Modification<br>`+Required when replying` |
| **name** | String(255) | Name of Goods or Modifications<br>`+Required when answering` |
| **productFolder** | Object | Product Group or Modification |
| **uom* | Object | Unit of measurement |

#### Indicators object structure (onPeriodStart, onPeriodEnd, income, outcome)

| Title | Type | Description |
| ----- | ----- |-------- |
| **sum** | Float | Cost amount<br>`+Required when answering` |
| **quantity** | Float | Number of product units<br>`+Required when answering` |

#### Attributes available for filtering

The report results can be filtered using the filter parameter. Only one value can be specified for each parameter. You cannot specify empty values.

| Title | Type | Filtration | Description |
| --------- | ---------- | --------- | ----- |
| **agent** | Object | `=` | link to the counterparty by which you want to filter. |
| **agentTag** | String(255) | `=` | string with the name of the group of counterparties by which you want to filter. |
| **contract** | Object | `=` | link to the contract by which you want to filter. |
| **organization** | Object | `=` | link to the legal entity by which you want to filter. |
| **product** | Object | `=` | a link to the product you want to filter by. The output will include the product along with its modifications with `groupBy=variant`.|
| **project** | Object | `=` | a link to the project by which you want to filter. |
| **retailStore** | Object | `=` | a link to the point of sale by which you want to filter. |
| **store** | Object | `=` | a link to the warehouse by which you want to filter. |
| **supplier** | Object | `=` | parameter for filtering by supplier. The value of the parameter is a link to the counterparty or organization. The selection will include or exclude products from the specified supplier. You can pass an empty value, then the selection will include products with an empty or filled supplier. |
| **type** | Enum | `=` | parameter for filtering "document type" by which you can producesti filtering. Possible values are `supply`, `purchasereturn`, `demand`, `salesreturn`, `loss`, `enter`, `move`, `processing`, `retaildemand`, `retailsalesreturn`. |
| **variant** | Object | `=` | link to the modification by which you want to filter. |
| **withoutturnover** | Boolean | `=` | parameter for filtering "Show products without movement". Possible values: `true`, `false`. |

Filtering examples:

- `filter=agent=https://api.kladana.com/api/remap/1.2/entity/counterparty/f8f729a5-a784-11e9-ac12-000800000000`
- `filter=product=https://api.kladana.com/api/remap/1.2/entity/product/f8f729a5-a784-11e9-ac12-000800000000`
- `filter=organization=https://api.kladana.com/api/remap/1.2/entity/organization/0347beb0-a785-11e9-ac12-000800000003`
- `filter=store=https://api.kladana.com/api/remap/1.2/entity/store/656c4032-8667-11e6-8a84-bae500003321`
- `filter=project=https://api.kladana.com/api/remap/1.2/entity/project/7a5f0ed5-8552-11e6-8a84-bae500000046`
- `filter=contract=https://api.kladana.com/api/remap/1.2/entity/contract/7a5f0ed5-8552-11e6-8a84-bae500085742`
- `filter=retailStore=https://api.kladana.com/api/remap/1.2/entity/retailstore/9ca74859-85c7-11e9-ac12-000d00000030`
- `filter=agentTag=favorites`
- `filter=withoutturnover=true`
- `filter=type=supply`
- `filter=supplier=https://api.kladana.com/api/remap/1.2/entity/counterparty/656c4032-8667-11e6-8a84-bae5000033aa`

#### Filtering by additional fields

Using the filter parameter, the selection can also be filtered by the values of additional product fields.

To filter by the value of an additional field, you need to pass a reference to the additional field and its value:

`filter=https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/<id>=<Value>`

To filter by the value of additional fields like string, text and link, use the `=` operator. You can also use the `=` and `!=` operators with an empty value to get products with only an empty additional field or only a filled one, respectively.

To filter by the value of additional fields of type integer, real number, date, you can use the operators `=`, `>=`, `<=`. You can also use the `=` and `!=` operators with an empty value to get products with only an empty additional field or only a filled one, respectively. For an additional date-time field, the value is passed as a string in [date-time format](../#kladana-json-api-general-info-date-and-time-format).

To filter by the value of additional fields of the lookup type, you can use the `=` and `!=` operators. As a value, you need to pass a reference to the directory object. You can also use the `=` and `!=` operators with an empty value to get products with only an empty additional field or only a filled one, respectively.

An example of filtering by an additional field of the warehouse reference type: `filter=https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/ea12a6dd-79e5-11e9-9ff4-31500040893d=http:// api.kladana.com/api/remap/1.2/entity/store/302f2a81-9977-11e9-9109-f8fc00020e02`

An example of filtering by an additional field of the user directory type: `filter=https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/ea12a6dd-79e5-11e9-9ff4-31500040893d=http:// api.kladana.com/api/remap/1.2/entity/customentity/8955249d-997d-11e9-9ff4-3150000e65c3/8955314d-997d-11e9-9ff4-3150000e65c4`

To filter by the value of additional fields of the checkbox type, use the `=` operator. Possible values: true, false.

Filtering by additional fields of the file type is not supported.


### Get Stock movement report by goods

Request to receive the Stock movement report by goods.

**Parameters**

| Parameter | Description |
| --------- | ------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **momentFrom** | `date` (optional) *Example: 2018-09-01 00:00:00* Report period start |
| **momentTo** | `date` (optional) *Example: 2018-10-01 00:00:00* Report period end |
| **groupBy** | `string` (optional) the type to group the output by. By default, the **groupBy** parameter is set to `product`. If you want to see only objects of the product type, you must set the appropriate parameter value. <ul><li>groupBy=product - products only</li><li>groupBy=variant - products and modifications</li></ul> |

**Headers**

| Title | Description |
| --------- | ------- |
| **X-Lognex-Accept-Timezone** | An optional header that specifies the current date on the client in RFC 3522. The time zone must be specified in the format sign and 4 characters (not in Obsolete Date and Time). Date example: `Wed, 16 Aug 2017 23:07:01 +0700`. When calculating indicators, the dates of transactions are shifted to the client's time zone. |
| **X-Lognex-Content-Timezone** | Response header. It specifies (as the server thinks) the current date on the client in RFC 3522. |


> Request to receive the "Stock movement report by goods".

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/report/turnover/all"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

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
     "href": "https://api.kladana.com/api/remap/1.2/report/turnover/all",
     "type": "turnover",
     "mediaType": "application/json",
     "size": 3,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/66990dc7-bdfe-11eb-c0a8-800c00000016",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=66989c14-bdfe-11eb-c0a8-800c00000014"
         },
         "name": "product 2"
       },
       "onPeriodStart": {
         "quantity": 0.0,
         "sum": 0.0
       },
       "onPeriodEnd": {
         "quantity": 1.0,
         "sum": 0.0
       },
       "income": {
         "quantity": 3.0,
         "sum": 0.0
       },
       "outcome": {
         "quantity": 2.0,
         "sum": 0.0
       }
     },
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/variant/3e32ef51-c1f1-11eb-c0a8-800c00000003",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
           "type": "variant",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3e3278e5-c1f1-11eb-c0a8-800c00000001"
         },
         "name": "2 (char)"
       },
       "onPeriodStart": {
         "quantity": 0.0,
         "sum": 0.0
       },
       "onPeriodEnd": {
         "quantity": 2.0,
         "sum": 20000.0
       },
       "income": {
         "quantity": 3.0,
         "sum": 30000.0
       },
       "outcome": {
         "quantity": 1.0,
         "sum": 10000.0
       }
     },
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/b008915c-b977-11eb-c0a8-800a00000008",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=b0078621-b977-11eb-c0a8-800a00000006"
         },
         "name": "product 1",
         "code": "00001",
         "article": "123",
         "uom": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
             "type": "uom",
             "mediaType": "application/json"
           },
           "name": "pcs"
         },
         "productFolder": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/productfolder/e229bb59-c202-11eb-c0a8-800b00000002",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/productfolder/metadata",
             "type": "productfolder",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#good/edit?id=e229bb59-c202-11eb-c0a8-800b00000002"
           },
           "name": "group"
         }
       },
       "onPeriodStart": {
         "quantity": 0.0,
         "sum": 0.0
       },
       "onPeriodEnd": {
         "quantity": 2.0,
         "sum": 4400.0
       },
       "income": {
         "quantity": 3.0,
         "sum": 6600.0
       },
       "outcome": {
         "quantity": 1.0,
         "sum": 2200.0
       }
     }
   ]
}
```

### Stock movement report by product with warehouses details

Stock movement report by products and their variants with detalization by warehouses.

#### Report object attributes

| Title | Type | Description |
| --------- | ------- |------- |
| **assortment** | Object | Brief presentation of the Item or Modification in the report. [More details here](#reports-stock-movement-report-stock-movement-report-by-goods-assortment-object-structure)<br>`+Required when replying` |
| **stockByStore** | Object | Detailing of Stock movement report by warehouses. [Learn more](#reports-stock-movement-report-stock-movement-report-by-product-with-warehouses-details-stock-movement-report-object-structure-detailing-by-warehouses)<br>`+Required when replying` |

#### Assortment object structure

| Title | Type | Description |
| --------- | ------- |--------- |
| **article** | String(255) | Article of Goods |
| **code** | String(255) | Product Code |
| **images** | Object | The first image of the Product or Modification |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Product or Modification<br>`+Required when replying` |
| **name** | String(255) | Name of Goods or Modifications<br>`+Required when answering` |
| **productFolder** | Object | Product Group or Modification |
| **uom* | Object | Unit of measurement |

#### Stock movement report object structure detailing by warehouses

| Title | Type | Description |
| --------- | ---- |------ |
| **store** | Object | Warehouse.<br>`+Required when replying` |
| **onPeriodStart** | Object | Indicators at the beginning of the period. [More details here](#reports-stock-movement-report-stock-movement-report-by-goods-indicators-object-structure-onperiodstart-onperiodend-income-outcome)<br>`+Required when replying ` |
| **onPeriodEnd** | Object | Indicators at the end of the period. [More details here](#reports-stock-movement-report-stock-movement-report-by-goods-indicators-object-structure-onperiodstart-onperiodend-income-outcome)<br>`+Required when replying ` |
| **income** | Object | Revenue figures during the reporting period. [More details here](#reports-stock-movement-report-stock-movement-report-by-goods-indicators-object-structure-onperiodstart-onperiodend-income-outcome)<br>`+Required when replying ` |
| **outcome** | Object | Consumption figures during the reporting period. [More details here](#reports-stock-movement-report-stock-movement-report-by-goods-indicators-object-structure-onperiodstart-onperiodend-income-outcome)<br>`+Required when replying ` |

#### Indicators object structure (onPeriodStart, onPeriodEnd, income, outcome)

| Title | Type | Description |
| --------- | ------- |----- |
| **sum** | Float | Cost amount<br>`+Required when answering` |
| **quantity** | Float | Number of product units<br>`+Required when answering` |

#### Attributes available for filtering

The report results can be filtered using the filter parameter. Only one value can be specified for each parameter. You cannot specify empty values.

It is mandatory to specify one of the filtering parameters **product** or **variant**.

| Title | Type | Filtration | Description |
| --------- | ------- |------ | ------- |
| **agent** | Object | `=` | link to the counterparty by which you want to filter. |
| **agentTag** | String(255) | `=` | string with the name of the group of counterparties by which you want to filter. |
| **contract** | Object | `=` | link to the contract by which you want to filter. |
| **organization** | Object | `=` | link to the legal entity by which you want to filter. |
| **product** | Object | `=` | a link to the product you want to filter by. The issue will include the product along with its modifications. |
| **project** | Object | `=` | a link to the project by which you want to filter. |
| **retailStore** | Object | `=` | a link to the point of sale by which you want to filter. |
| **store** | Object | `=` | a link to the warehouse by which you want to filter.|
| **variant** | Object | `=` | link to the modification by which you want to filter. |

Filtering examples:

- `filter=agent=https://api.kladana.com/api/remap/1.2/entity/counterparty/f8f729a5-a784-11e9-ac12-000800000000`
- `filter=product=https://api.kladana.com/api/remap/1.2/entity/product/f8f729a5-a784-11e9-ac12-000800000000`
- `filter=organization=https://api.kladana.com/api/remap/1.2/entity/organization/0347beb0-a785-11e9-ac12-000800000003`
- `filter=store=https://api.kladana.com/api/remap/1.2/entity/store/656c4032-8667-11e6-8a84-bae500003321`
- `filter=project=https://api.kladana.com/api/remap/1.2/entity/project/7a5f0ed5-8552-11e6-8a84-bae500000046`
- `filter=contract=https://api.kladana.com/api/remap/1.2/entity/contract/7a5f0ed5-8552-11e6-8a84-bae500085742`
- `filter=retailStore=https://api.kladana.com/api/remap/1.2/entity/retailstore/9ca74859-85c7-11e9-ac12-000d00000030`
- `filter=agentTag=favorites`

### Get Product Stock movement report

Request to receive the Stock movement report by product.

To successfully complete the request, one of the filtering parameters **product** or **variant** must be specified.

**Parameters**

| Parameter | Description|
| --------- | ------- |
| **momentFrom** | `date` (optional) *Example: 2018-09-01 00:00:00* Report period start |
| **momentTo** | `date` (optional) *Example: 2018-10-01 00:00:00* Report period end |

**Headers**

| Title | Description |
| --------- | ------- |
| **X-Lognex-Accept-Timezone** | An optional header that specifies the current date on the client in RFC 3522. The time zone must be specified in the format sign and 4 characters (not in Obsolete Date and Time). Date example: `Wed, 16 Aug 2017 23:07:01 +0700`. When calculating indicators, the dates of transactions are shifted to the client's time zone. |
| **X-Lognex-Content-Timezone** | Response header. It specifies (as the server thinks) the current date on the client in RFC 3522. |


> Request to receive the "Product Stock movement report" with the specified product id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/report/turnover/bystore?filter=product=https://api.kladana.com/api/remap/1.2/entity/product/66990dc7-bdfe-11eb-c0a8-800c00000016"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

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
     "href": "https://api.kladana.com/api/remap/1.2/report/turnover/bystore?filter=product=https://api.kladana.com/api/remap/1.2/entity/product/66990dc7-bdfe-11eb-c0a8-800c00000016",
     "type": "turnoverbystore",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/66990dc7-bdfe-11eb-c0a8-800c00000016",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=66989c14-bdfe-11eb-c0a8-800c00000014"
         },
         "name": "product 2",
         "uom": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/uom/af3b8110-5a23-4839-b3f7-a486f771a315",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
             "type": "uom",
             "mediaType": "application/json"
           },
           "name": "10^6 m3"
         }
       },
       "stockByStore": [
         {
           "store": {
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/entity/store/9238b396-b719-11eb-c0a8-800c00000074",
               "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
               "type": "store",
               "mediaType": "application/json",
               "uuidHref": "https://app.kladana.com/app/#warehouse/edit?id=9238b396-b719-11eb-c0a8-800c00000074"
             },
             "name": "Main warehouse"
           },
           "onPeriodStart": {
             "quantity": 0.0,
             "sum": 0.0
           },
           "onPeriodEnd": {
             "quantity": 1.0,
             "sum": 0.0
           },
           "income": {
             "quantity": 3.0,
             "sum": 0.0
           },
           "outcome": {
             "quantity": 2.0,
             "sum": 0.0
           }
         }
       ]
     },
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/variant/3e32ef51-c1f1-11eb-c0a8-800c00000003",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
           "type": "variant",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3e3278e5-c1f1-11eb-c0a8-800c00000001"
         },
         "name": "product 2 (red)",
         "uom": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/uom/af3b8110-5a23-4839-b3f7-a486f771a315",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
             "type": "uom",
             "mediaType": "application/json"
           },
           "name": "10^6 m3"
         }
       },
       "stockByStore": [
         {
           "store": {
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/entity/store/9238b396-b719-11eb-c0a8-800c00000074",
               "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
               "type": "store",
               "mediaType": "application/json",
               "uuidHref": "https://app.kladana.com/app/#warehouse/edit?id=9238b396-b719-11eb-c0a8-800c00000074"
             },
             "name": "Main warehouse"
           },
           "onPeriodStart": {
             "quantity": 0.0,
             "sum": 0.0
           },
           "onPeriodEnd": {
             "quantity": 2.0,
             "sum": 20000.0
           },
           "income": {
             "quantity": 3.0,
             "sum": 30000.0
           },
           "outcome": {
             "quantity": 1.0,
             "sum": 10000.0
           }
         },
         {
           "store": {
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/entity/store/8d3d4ad8-be02-11eb-c0a8-800c00000025",
               "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
               "type": "store",
               "mediaType": "application/json",
               "uuidHref": "https://app.kladana.com/app/#warehouse/edit?id=8d3d4ad8-be02-11eb-c0a8-800c00000025"
             },
             "name": "warehouse 2"
           },
           "onPeriodStart": {
             "quantity": 0.0,
             "sum": 0.0
           },
           "onPeriodEnd": {
             "quantity": -5.0,
             "sum": 0.0
           },
           "income": {
             "quantity": 0.0,
             "sum": 0.0
           },
           "outcome": {
             "quantity": 5.0,
             "sum": 0.0
           }
         }
       ]
     }
   ]
}
```

### Stock movement report by product with details by transactions

Stock movement report for the product and their variants with warehouses and transactions details.

#### Report object attributes

| Title | Type | Description |
| --------- | ----- | ---------- |
| **assortment** | Object | Brief presentation of the Item or Modification in the report. [More details here](#reports-stock-movement-report-stock-movement-report-by-goods-assortment-object-structure)<br>`+Required when replying` |
| **store** | Object | Warehouse.<br>`+Required when replying` |
| **operation** | Object | The document associated with the Product. [More details here](#reports-stock-movement-report-stock-movement-report-by-product-with-details-by-transactions-operation-object-structure)<br>`+Required when replying` |
| **quantity** | Float | Quantity of goods in the document.<br>`+Required when answering` |
| **cost** | Float | The cost of goods in the document.<br>`+Required when answering` |
| **sum** | Float | Cost sum.<br>`+Required when answering` |

#### Assortment object structure

| Title | Type | Description |
| --------- | ------- |--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Product or Modification<br>`+Required when replying` |
| **name** | String(255) | Name of Goods or Modifications<br>`+Required when answering` |
| **code** | String(255) | Product Code |
| **article** | String(255) | Article of Goods |
| **productFolder** | Object | Product Group or Modification |
| **uom* | Object | Unit of measurement |

#### Operation object structure

| Title | Type | Description |
| --------- | ------- |------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Document metadata<br>`+Required when replying` |
| **name** | String(255) | Document number<br>`+Required when replying` |
| **dedescription** | String(255) | Document comment |
| **moment** | Object | Date of the document<br>`+Required when replying` |
| **agent** | Object | Document counterparty |

#### Attributes available for filtering

The report results can be filtered using the filter parameter. Only one value can be specified for each parameter. You cannot specify empty values.

It is mandatory to specify one of the filtering parameters **product** or **variant**.

| Title | Description |
| --------- | ------- |
| **agent** | link to the counterparty by which you want to filter. |
| **agentTag** | string with the name of the group of counterparties by which you want to filter. |
| **contract** | link to the contract by which you want to filter. |
| **organization** | link to the legal entity by which you want to filter. |
| **project** | a link to the project by which you want to filter. |
| **retailStore** | a link to the point of sale by which you want to filter. |
| **store** | a link to the warehouse by which you want to filter. |

Filtering examples:

- `filter=agent=https://api.kladana.com/api/remap/1.2/entity/counterparty/f8f729a5-a784-11e9-ac12-000800000000`
- `filter=organization=https://api.kladana.com/api/remap/1.2/entity/organization/0347beb0-a785-11e9-ac12-000800000003`
- `filter=store=https://api.kladana.com/api/remap/1.2/entity/store/656c4032-8667-11e6-8a84-bae500003321`
- `filter=project=https://api.kladana.com/api/remap/1.2/entity/project/7a5f0ed5-8552-11e6-8a84-bae500000046`
- `filter=contract=https://api.kladana.com/api/remap/1.2/entity/contract/7a5f0ed5-8552-11e6-8a84-bae500085742`
- `filter=retailStore=https://api.kladana.com/api/remap/1.2/entity/retailstore/9ca74859-85c7-11e9-ac12-000d00000030`
- `filter=agentTag=favorites`

### Get Stock movement report by product with details by transactions

Request to receive the Stock movement report by product with transaction details.

**Parameters**

| Parameter | Description |
| --------- | ------- |
| **momentFrom** | `date` (required) *Example: 2021-06-01 00:00:00* Report period start |
| **momentTo** | `date` (required) *Example: 2021-07-01 00:00:00* Report period end |

**Headers**

| Title | Description |
| --------- | ------- |
| **X-Lognex-Accept-Timezone** | An optional header that specifies the current date on the client in RFC 3522. The time zone must be specified in the format sign and 4 characters (not in Obsolete Date and Time). Date example: `Wed, 16 Aug 2017 23:07:01 +0700`. When calculating indicators, the dates of transactions are shifted to the client's time zone. |
| **X-Lognex-Content-Timezone** | Response header. It specifies (as the server thinks) the current date on the client in RFC 3522. |

> Request to receive the report "Product Stock movement report with transaction details" with the specified product id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/report/turnover/byoperations?filter=product=https://api.kladana.com/api/remap/1.2/entity/product/66990dc7-bdfe-11eb-c0a8-800c00000016"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

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
     "href": "https://api.kladana.com/api/remap/1.2/report/turnover/byoperations?filter=product=https://api.kladana.com/api/remap/1.2/entity/product/66990dc7-bdfe-11eb-c0a8-800c00000016",
     "type": "turnoverbyoperation",
     "mediaType": "application/json",
     "size": 4,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/66990dc7-bdfe-11eb-c0a8-800c00000016",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=66989c14-bdfe-11eb-c0a8-800c00000014"
         },
         "name": "2",
         "uom": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/uom/af3b8110-5a23-4839-b3f7-a486f771a315",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
             "type": "uom",
             "mediaType": "application/json"
           },
           "name": "10^6 m3"
         }
       },
       "store": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/9238b396-b719-11eb-c0a8-800c00000074",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#warehouse/edit?id=9238b396-b719-11eb-c0a8-800c00000074"
         },
         "name": "Main warehouse"
       },
       "operation": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/supply/29d1cb69-bfb7-11eb-c0a8-800d00000039",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
           "type": "supply",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#supply/edit?id=29d1cb69-bfb7-11eb-c0a8-800d00000039"
         },
         "name": "00001",
         "moment": "2021-05-28 16:18:00.000",
         "agent": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/923916c6-b719-11eb-c0a8-800c00000075",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
             "type": "counterparty",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#company/edit?id=923916c6-b719-11eb-c0a8-800c00000075"
           },
           "name": "LLC \"Supplier\""
         }
       },
       "quantity": 3.0,
       "cost": 0.0,
       "sum": 0.0
     },
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/66990dc7-bdfe-11eb-c0a8-800c00000016",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=66989c14-bdfe-11eb-c0a8-800c00000014"
         },
         "name": "2",
         "uom": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/uom/af3b8110-5a23-4839-b3f7-a486f771a315",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
             "type": "uom",
             "mediaType": "application/json"
           },
           "name": "10^6 m3"
         }
       },
       "store": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/9238b396-b719-11eb-c0a8-800c00000074",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#warehouse/edit?id=9238b396-b719-11eb-c0a8-800c00000074"
         },
         "name": "Main warehouse"
       },
       "operation": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/demand/0410e6b6-bfb7-11eb-c0a8-800d0000000f",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/demand/metadata",
           "type": "demand",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#demand/edit?id=0410e6b6-bfb7-11eb-c0a8-800d0000000f"
         },
         "name": "00001",
         "moment": "2021-05-28 16:25:00.000",
         "agent": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/92394ebc-b719-11eb-c0a8-800c00000077",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
             "type": "counterparty",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#company/edit?id=92394ebc-b719-11eb-c0a8-800c00000077"
           },
           "name": "LLC \"Buyer\""
         }
       },
       "quantity": -2.0,
       "cost": 0.0,
       "sum": 0.0
     },
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/variant/3e32ef51-c1f1-11eb-c0a8-800c00000003",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
           "type": "variant",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3e3278e5-c1f1-11eb-c0a8-800c00000001"
         },
         "name": "2 (char)",
         "uom": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/uom/af3b8110-5a23-4839-b3f7-a486f771a315",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
             "type": "uom",
             "mediaType": "application/json"
           },
           "name": "10^6 m3"
         }
       },
        "store": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/9238b396-b719-11eb-c0a8-800c00000074",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#warehouse/edit?id=9238b396-b719-11eb-c0a8-800c00000074"
         },
         "name": "Main warehouse"
       },
       "operation": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/supply/5588e522-c1f1-11eb-c0a8-800c0000000c",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
           "type": "supply",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#supply/edit?id=5588e522-c1f1-11eb-c0a8-800c0000000c"
         },
         "name": "00002",
         "moment": "2021-05-31 12:19:00.000",
         "agent": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/923916c6-b719-11eb-c0a8-800c00000075",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
             "type": "counterparty",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#company/edit?id=923916c6-b719-11eb-c0a8-800c00000075"
           },
           "name": "LLC \"Supplier\""
         }
       },
       "quantity": 3.0,
       "cost": 10000.0,
       "sum": 30000.0
     },
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/variant/3e32ef51-c1f1-11eb-c0a8-800c00000003",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
           "type": "variant",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3e3278e5-c1f1-11eb-c0a8-800c00000001"
         },
         "name": "2 (char)",
         "uom": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/uom/af3b8110-5a23-4839-b3f7-a486f771a315",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
             "type": "uom",
             "mediaType": "application/json"
           },
           "name": "10^6 m3"
         }
       },
       "store": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/store/9238b396-b719-11eb-c0a8-800c00000074",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
           "type": "store",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#warehouse/edit?id=9238b396-b719-11eb-c0a8-800c00000074"
         },
         "name": "Main warehouse"
       },
       "operation": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/demand/5d21e1a0-c1f1-11eb-c0a8-800c00000012",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/demand/metadata",
           "type": "demand",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#demand/edit?id=5d21e1a0-c1f1-11eb-c0a8-800c00000012"
         },
         "name": "00002",
         "moment": "2021-05-31 12:19:00.000",
         "agent": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/92394ebc-b719-11eb-c0a8-800c00000077",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
             "type": "counterparty",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.com/app/#company/edit?id=92394ebc-b719-11eb-c0a8-800c00000077"
           },
           "name": "LLC \"Buyer\""
         }
       },
       "quantity": -1.0,
       "cost": -10000.0,
       "sum": -10000.0
     }
   ]
}
```
