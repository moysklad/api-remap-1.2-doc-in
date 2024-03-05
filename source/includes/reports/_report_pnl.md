## Profitability Report 

Using the JSON API, you can request a "Profitability" report for all products, services, modifications, employees, customers, and sales channels.
To access the report via the API, you need the right to view the *Profit and Loss* report.


#### Profitability by goods
#### Report object attributes

| Title              | Type | Description |
|--------------------| -----|---------|
| **assortment**     | Object | Brief presentation of the Good or Service in the report. [More here](../dictionaries/#entities-product) and [here](../dictionaries/#entities-service)<br>`+Required when answering` |
| **margin**         | Float | Profitability<br>`+Required when answering` |
| **profit**         | Float | Profit<br>`+Required when answering` |
| **returnCost**     | Float | Cost of returns<br>`+Required when replying` |
| **returnCostSum**  | Float | The sum of the cost of returns<br>`+Required when answering` |
| **returnPrice**    | Float | Price returns<br>`+Required when replying` |
| **returnQuantity** | Int | Number of returns<br>`+Required when replying` |
| **returnSum**      | Float | Refund amount<br>`+Required when replying` |
| **sellCost**       | Float | Cost price<br>`+Required when answering` |
| **sellCostSum**    | Float | Sum of cost of sales<br>`+Required when answering` |
| **sellPrice**      | Float | Sales price (average)<br>`+Required when answering` |
| **sellQuantity**   | Int | Quantity sold<br>`+Required when replying` |
| **sellSum**        | Float | Sales amount<br>`+Required when answering` |

#### Assortment object structure

| Title | Type | Description |
| -----|---------|--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Product or Service<br>`+Required when replying` |
| **name** | String(255) | Name of Goods or Services<br>`+Required when answering` |
| **code** | String(255) | Product or service code |
| **uom* | Object | Unit of measurement |
| **article** | String(255) | Product SKU |
| **images** | Object | Product Image |

#### Attributes available for filtering

The report results can be filtered using the filter parameter.
Only one value can be specified for each parameter, except for the sales channel.
You cannot specify empty values.

| Title | Type | Filtration | Description|
|------------| -----|---------|------------|
| **product** | Object | `=` `!=` | a link to a product, service, kit, modification or series by which you want to filter. You can pass multiple values. |
| **productFolder** | Object | `=` `!=` | parameter for filtering by several product groups. The value of the parameter is a link to a product group that should be included in the selection or excluded from it. You can pass multiple values. |
| **withSubFolders**| Boolean | `=` | option to consider nested subgroups. Works only if there is a filter by `productFolder`. By default `true`, products from child subgroups of the filtered group / groups of products are displayed. When passing `false`, only products from the filtered group / groups are displayed, without taking into account subgroups. |
| **agentTag** | String(255) | `=` | string with the name of the group of counterparties by which you want to filter. |
| **counterparty** | Object | `=` | link to the counterparty by which you want to filter. |
| **organization** | Object | `=` | link to the legal entity by which you want to filter. |
| **store** | Object | `=` | a link to the warehouse by which you want to filter. |
| **project** | Object | `=` | a link to the project by which you want to filter. |
| **retailStore** | Object | `=` | a link to the point of sale by which you want to filter. |
| **supplier** | Object | `=` | parameter for filtering by supplier. The value of the parameter is a link to the counterparty or organization. The selection will include products with the specified supplier. |
| **salesChannel** | Object | `=` | a link to the sales channel by which you want to filter. You can reuse a filter when filtering across multiple sales channels is required. |

Simultaneous filtering by **product** and **productFolder** is not supported.


Filtering examples:

- `filter=product=https://api.kladana.in/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044`
- `filter=product=https://api.kladana.in/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044;product=https://api.kladana.in/api/remap/1.2/entity/service/706b9cd3-8552-11e6-8a84-bae500000045;product=https://api.kladana.in/api/remap/1.2/entity/bundle/7a5f0ed5-8552-11e6-8a84-bae500000046`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;withSubFolders=false`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b2`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b2;withSubFolders=false`
- `filter=counterparty=https://api.kladana.in/api/remap/1.2/entity/counterparty/f8f729a5-a784-11e9-ac12-000800000000`
- `filter=organization=https://api.kladana.in/api/remap/1.2/entity/organization/0347beb0-a785-11e9-ac12-000800000003`
- `filter=store=https://api.kladana.in/api/remap/1.2/entity/store/656c4032-8667-11e6-8a84-bae500003321`
- `filter=project=https://api.kladana.in/api/remap/1.2/entity/project/7a5f0ed5-8552-11e6-8a84-bae500000046`
- `filter=retailStore=https://api.kladana.in/api/remap/1.2/entity/retailstore/9ca74859-85c7-11e9-ac12-000d00000030`
- `filter=agentTag=favorites`
- `filter=supplier=https://api.kladana.in/api/remap/1.2/entity/counterparty/f8f729a5-a784-11e9-ac12-000800000000`
- `filter=salesChannel=https://api.kladana.in/api/remap/1.2/entity/saleschannel/65cc7e08-ea79-4ad7-9cde-3cc053f1c1b9`
- `filter=salesChannel=https://api.kladana.in/api/remap/1.2/entity/saleschannel/65cc7e08-ea79-4ad7-9cde-3cc053f1c1b9;salesChannel=https://api.kladana.in/api/remap/1.2/entity/saleschannel/ea012b09-4df3-439b-acf7-7d0464fbf603`
- `filter=product=https://api.kladana.in/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044;counterparty=https://api.kladana.in/api/remap/1.2/entity/counterparty/f8f729a5-a784-11e9-ac12-000800000000;organization=https://api.kladana.in/api/remap/1.2/entity/organization/0347beb0-a785-11e9-ac12-000800000003; store=https://api.kladana.in/api/remap/1.2/entity/store/656c4032-8667-11e6-8a84-bae500003321;project=https://api.kladana.in/api/remap/1.2/ entity/project/7a5f0ed5-8552-11e6-8a84-bae500000046;retailStore=https://api.kladana.in/api/remap/1.2/entity/retailstore/9ca74859-85c7-11e9-ac12-000d00000030;salesChannel=https: //api.kladana.in/api/remap/1.2/entity/saleschannel/65cc7e08-ea79-4ad7-9cde-3cc053f1c1b9`

### Get Product Profitability

Profitability report for goods includes: goods, kits, services. The product takes into account the profitability of its modifications, but without specifying the modifications themselves.

**Parameters**

| Parameter | Description |
| -----|---------|
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **momentFrom** | `date` (optional) *Example: 2016-04-15 15:48:46* One of the [selection filter options](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter). |
| **momentTo** | `date` (optional) *Example: 2016-04-15 15:48:46* One of the [selection filter options](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter). |
If the **momentFrom** and **momentTo** parameters are missing, reports for the last month are displayed.
If the **momentFrom** parameter is absent and the **momentTo** parameter is specified, reports from the beginning of the current year up to **momentTo** are displayed.
If the **momentTo** parameter is absent and the **momentFrom** parameter is specified, reports from **momentFrom** up to the current day are displayed.

> Request for a "Profitability by Products" report.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/report/profit/byproduct"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
{
   "context": {
     "employee": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/context/employee",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     }
   },
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/report/profit/byproduct",
     "type": "salesbyproduct",
     "mediaType": "application/json",
     "size": 5,
     "limit": 2,
     "offset": 0,
     "nextHref": "https://api.kladana.in/api/remap/1.2/report/profit/byproduct?limit=2&offset=2"
   },
   "rows": [
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/product/6af0f1c9-4814-11e6-8a84-bae5000006b4",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json"
         },
         "name": "Smoke",
         "code": "00067",
         "uom": {
           "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/uom/metadata",
             "type": "uom",
             "mediaType": "application/json"
           },
           "name": "pcs"
         }
       },
       "sellQuantity": 8643,
       "sellPrice": 216174.97396737244,
       "sellCost": 0,
       "sellSum": 1868400300,
       "sellCostSum": 0,
       "returnQuantity": 0,
       "returnPrice": 0.0,
       "returnCost": 0,
       "returnSum": 0,
       "returnCostSum": 0,
       "profit": 1868400300,
       "margin": 0
     },
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/product/6a9bdfe4-4814-11e6-8a84-bae500000503",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json"
         },
         "name": "Nail Post",
         "code": "00198",
         "uom": {
           "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/uom/metadata",
             "type": "uom",
             "mediaType": "application/json"
           },
           "name": "pcs"
         }
       },
       "sellQuantity": 4765,
       "sellPrice": 100000000.0,
       "sellCost": 0,
       "sellSum": 476500000000,
       "sellCostSum": 0,
       "returnQuantity": 0,
       "returnPrice": 0.0,
       "returnCost": 0,
       "returnSum": 0,
       "returnCostSum": 0,
       "profit": 476500000000,
       "margin": 0
     },
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/service/3413f2dd-484e-11e8-6a80-332a00000091",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "service",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#good/edit?id=3412d794-484e-11e8-6a80-332a0000008f"
         },
         "name": "Sharpening skates",
         "code": "00045",
         "uom": {
           "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/uom/metadata",
             "type": "uom",
             "mediaType": "application/json"
           },
           "name": "pcs"
         }
       },
       "sellQuantity": 10,
       "sellPrice": 500000.0,
       "sellCost": 300000,
       "sellSum": 5000000,
       "sellCostSum": 3000000,
       "returnQuantity": 3,
       "returnPrice": 500000.0,
       "returnCost": 300000,
       "returnSum": 1500000,
       "returnCostSum": 900000,
       "profit": 1400000,
       "margin": 0.6666666666666666
     }
   ]
}
```

#### Profitability by modifications
#### Report object attributes:

| Title              | Type | Description |
|--------------------|---------|----- |
| **assortment**     | Object | Brief representation of the Modification, Service, or Bundle in the report. [More here](../dictionaries/#entities-product-variant), [here](../dictionaries/#entities-service) and [here](../dictionaries/#entities-bundle)<br>`+ Mandatory when replying` |
| **margin**         | Float | Profitability<br>`+Required when answering` |
| **profit**         | Float | Profit<br>`+Required when answering` |
| **returnCost**     | Float | Cost of returns<br>`+Required when replying` |
| **returnCostSum**  | Float | The sum of the cost of returns<br>`+Required when answering`|
| **returnPrice**    | Float | Price returns<br>`+Required when replying` |
| **returnQuantity** | Int | Number of returns<br>`+Required when replying` |
| **returnSum**      | Float | Refund amount<br>`+Required when replying` |
| **sellCost**       | Float | Cost price<br>`+Required when answering` |
| **sellCostSum**    | Float | Sum of cost of sales<br>`+Required when answering` |
| **sellPrice**      | Float | Sales price (average)<br>`+Required when answering` |
| **sellQuantity**   | Int | Quantity sold<br>`+Required when replying` |
| **sellSum**        | Float | Sales amount<br>`+Required when answering` |

#### Assortment object structure

| Title | Type | Description |
| -----|---------|-------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Modification, Service, or Bundle Metadata<br>`+Required when responding` |
| **name** | String(255) | Entity name<br>`+Required when replying` |
| **code** | String(255) | Entity code<br>`+Required for response` |
| **article** | String(255) | Article of Modification or Kit<br>`+Required when answering` |
| **images** | Object | Image Modifications<br>`+Required when answering` |

#### Attributes available for filtering

The report results can be filtered using the filter parameter.
Only one value can be specified for each parameter, except for the sales channel.
You cannot specify empty values.

| Title | Type | Filtration | Description |
|-------| ------|--------|-------|
| **product** | Object | `=` `!=` | a link to a product, service, kit, modification or series by which you want to filter. You can pass multiple values. |
| **productFolder** | Object | `=` `!=` | parameter for filtering by several product groups. The value of the parameter is a link to a product group that should be included in the selection or excluded from it. You can pass multiple values. |
| **withSubFolders**| Boolean | `=` | option to consider nested subgroups. Works only if there is a filter by `productFolder`. By default `true`, products from child are displayedthe lower subgroups of the filtered group / product groups. When passing `false`, only products from the filtered group / groups are displayed, without taking into account subgroups. |
| **agentTag** | String(255) | `=` | string with the name of the group of counterparties by which you want to filter. |
| **counterparty** | Object | `=` | link to the counterparty by which you want to filter. |
| **organization** | Object | `=` | link to the legal entity by which you want to filter. |
| **store** | Object | `=` | a link to the warehouse by which you want to filter. |
| **project** | Object | `=` | a link to the project by which you want to filter. |
| **retailStore** | Object | `=` | a link to the point of sale by which you want to filter. |
| **supplier** | Object | `=` | parameter for filtering by supplier. The value of the parameter is a link to the counterparty or organization. The selection will include products with the specified supplier. |
| **salesChannel** | Object | `=` | a link to the sales channel by which you want to filter. You can reuse a filter when filtering across multiple sales channels is required. |

Simultaneous filtering by **product** and **productFolder** is not supported.


Filtering examples:

- `filter=product=https://api.kladana.in/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044`
- `filter=product=https://api.kladana.in/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044;product=https://api.kladana.in/api/remap/1.2/entity/service/706b9cd3-8552-11e6-8a84-bae500000045;product=https://api.kladana.in/api/remap/1.2/entity/bundle/7a5f0ed5-8552-11e6-8a84-bae500000046`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;withSubFolders=false`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b2`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b2;withSubFolders=false`
- `filter=counterparty=https://api.kladana.in/api/remap/1.2/entity/counterparty/f8f729a5-a784-11e9-ac12-000800000000`
- `filter=organization=https://api.kladana.in/api/remap/1.2/entity/organization/0347beb0-a785-11e9-ac12-000800000003`
- `filter=store=https://api.kladana.in/api/remap/1.2/entity/store/656c4032-8667-11e6-8a84-bae500003321`
- `filter=project=https://api.kladana.in/api/remap/1.2/entity/project/7a5f0ed5-8552-11e6-8a84-bae500000046`
- `filter=retailStore=https://api.kladana.in/api/remap/1.2/entity/retailstore/9ca74859-85c7-11e9-ac12-000d00000030`
- `filter=agentTag=favorites`
- `filter=supplier=https://api.kladana.in/api/remap/1.2/entity/counterparty/f8f729a5-a784-11e9-ac12-000800000000`
- `filter=salesChannel=https://api.kladana.in/api/remap/1.2/entity/saleschannel/65cc7e08-ea79-4ad7-9cde-3cc053f1c1b9`
- `filter=salesChannel=https://api.kladana.in/api/remap/1.2/entity/saleschannel/65cc7e08-ea79-4ad7-9cde-3cc053f1c1b9;salesChannel=https://api.kladana.in/api/remap/1.2/entity/saleschannel/ea012b09-4df3-439b-acf7-7d0464fbf603`
- `filter=product=https://api.kladana.in/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044;counterparty=https://api.kladana.in/api/remap/1.2/entity/counterparty/f8f729a5-a784-11e9-ac12-000800000000;organization=https://api.kladana.in/api/remap/1.2/entity/organization/0347beb0-a785-11e9-ac12-000800000003; store=https://api.kladana.in/api/remap/1.2/entity/store/656c4032-8667-11e6-8a84-bae500003321;project=https://api.kladana.in/api/remap/1.2/ entity/project/7a5f0ed5-8552-11e6-8a84-bae500000046;retailStore=https://api.kladana.in/api/remap/1.2/entity/retailstore/9ca74859-85c7-11e9-ac12-000d00000030;salesChannel=https: //api.kladana.in/api/remap/1.2/entity/saleschannel/65cc7e08-ea79-4ad7-9cde-3cc053f1c1b9`

### Get Profit by modifications

The product profitability report includes: products, kits, services and modifications (the modification itself is displayed, not the parent product).

**Parameters**

| Parameter | Description |
| -----|---------|
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **momentFrom** | `date` (optional) *Example: 2016-04-15 15:48:46* One of the [selection filter options](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter). |
| **momentTo** | `date` (optional) *Example: 2016-04-15 15:48:46* One of the [selection filter options](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter). |
If the **momentFrom** and **momentTo** parameters are missing, reports for the last month are displayed.
If the **momentFrom** parameter is absent and the **momentTo** parameter is specified, reports from the beginning of the current year up to **momentTo** are displayed.
If the **momentTo** parameter is absent and the **momentFrom** parameter is specified, reports from **momentFrom** up to the current day are displayed.

> Request for the report "Profitability by modifications".

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/report/profit/byvariant"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
{
   "context": {
     "employee": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/context/employee",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     }
   },
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/report/profit/byvariant",
     "type": "salesbyvariant",
     "mediaType": "application/json",
     "size": 5,
     "limit": 2,
     "offset": 0,
     "nextHref": "https://api.kladana.in/api/remap/1.2/report/profit/byvariant?limit=2&offset=2"
   },
   "rows": [
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/variant/6af0f1c9-4814-11e6-8a84-bae5000006b4?expand=product.supplier",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/variant/metadata",
           "type": "variant",
           "mediaType": "application/json"
         },
         "name": "Smoking (Africa, 0.2, Harvesters)",
         "code": "00067",
         "uom": {
           "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/uom/metadata",
             "type": "uom",
             "mediaType": "application/json"
           },
           "name": "pcs"
         }
       },
       "sellQuantity": 8643,
       "sellPrice": 216174.97396737244,
       "sellCost": 0,
       "sellSum": 1868400300,
       "sellCostSum": 0,
       "returnQuantity": 0,
       "returnPrice": 0.0,
       "returnCost": 0,
       "returnSum": 0,
       "returnCostSum": 0,
       "profit": 1868400300,
       "margin": 0
     },
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/variant/6a9bdfe4-4814-11e6-8a84-bae500000503?expand=product.supplier",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/variant/metadata",
           "type": "variant",
           "mediaType": "application/json"
         },
         "name": "Nail Post (White, 20, No, 1000)",
         "code": "00198",
         "uom": {
           "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/uom/metadata",
             "type": "uom",
             "mediaType": "application/json"
           },
           "name": "pcs"
         }
       },
       "sellQuantity": 4765,
       "sellPrice": 100000000.0,
       "sellCost": 0,
       "sellSum": 476500000000,
       "sellCostSum": 0,
       "returnQuantity": 0,
       "returnPrice": 0.0,
       "returnCost": 0,
       "returnSum": 0,
       "returnCostSum": 0,
       "profit": 476500000000,
       "margin": 0
     },
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/service/3413f2dd-484e-11e8-6a80-332a00000091",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "service",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#good/edit?id=3412d794-484e-11e8-6a80-332a0000008f"
         },
         "name": "Sharpening skates",
         "code": "00045",
         "uom": {
           "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/uom/metadata",
             "type": "uom",
             "mediaType": "application/json"
           },
           "name": "pcs"
         }
       },
       "sellQuantity": 10,
       "sellPrice": 500000.0,
       "sellCost": 300000,
       "sellSum": 5000000,
       "sellCostSum": 3000000,
       "returnQuantity": 3,
       "returnPrice": 500000.0,
       "returnCost": 300000,
       "returnSum": 1500000,
       "returnCostSum": 900000,
       "profit": 1400000,
       "margin": 0.6666666666666666
     }
   ]
}
```

#### Profitability by employee
#### Report object attributes

| Title | Type | Description |
| -----|---------|------ |
| **employees** | Object | Brief representation of the Employee in the report. [More details here](../dictionaries/#entities-employee)<br>`+Required when answering` |
| **margin** | Float | Profitability<br>`+Required when answering` |
| **profit** | Float | Profit<br>`+Required when answering` |
| **returnAvgCheck** | Float | Average refund receipt<br>`+Required when replying` |
| **returnCostSum** | Float | The sum of the cost of returns<br>`+Required when answering` |
| **returnCount** | Int | Number of returns<br>`+Required when replying` |
| **returnSum** | Float | Refund amount<br>`+Required when replying` |
| **salesAvgCheck** | Float | Average sales receipt<br>`+Required when answering` |
| **salesCount** | Int | Number of sales<br>`+Required when answering` |
| **sellCostSum** | Float | Sum of cost of sales<br>`+Required when answering` |
| **sellSum** | Float | Sales amount<br>`+Required when answering` |

#### Employee object structure

| Title | Type | Description |
| -----|---------|---------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Employee Metadata<br>`+Required when responding` |
| **name** | String(255) | Employee Name<br>`+Required when replying` |

#### Attributes available for filtering

The report results can be filtered using the filter parameter.
Only one value can be specified for each parameter, except for the sales channel.
You cannot specify empty values.

| Title | Type | Filtration | Description |
|-------| -----|----------|------|
| **product** | Object | `=` `!=` | a link to a product, service, kit, modification or series by which you want to filter. You can pass multiple values. |
| **productFolder** | Object | `=` `!=` | parameter for filtering by several product groups. The value of the parameter is a link to a product group that should be included in the selection or excluded from it. You can pass multiple values. |
| **withSubFolders**| Boolean | `=` | option to consider nested subgroups. Works only if there is a filter by `productFolder`. By default `true`, products from child subgroups of the filtered group / groups of products are displayed. When passing `false`, only products from the filtered group / groups are displayed, without taking into account subgroups. |
| **agentTag** | String(255) | `=` | string with the name of the group of counterparties by which you want to filter. |
| **counterparty** | Object | `=` | link to the counterparty by which you want to filter. |
| **organization** | Object | `=` | link to the legal entity by which you want to filter. |
| **store** | Object | `=` | a link to the warehouse by which you want to filter. |
| **project** | Object | `=` | a link to the project by which you want to filter. |
| **retailStore** | Object | `=` | a link to the point of sale by which you want to filter. |
| **supplier** | Object | `=` | parameter for filtering by supplier. The value of the parameter is a link to the counterparty or organization. The selection will include products with the specified supplier. |
| **salesChannel** | Object | `=` | a link to the sales channel by which you want to filter. You can reuse a filter when filtering across multiple sales channels is required. |

Simultaneous filtering by **product** and **productFolder** is not supported.


Filtering examples:

- `filter=product=https://api.kladana.in/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044`
- `filter=product=https://api.kladana.in/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044;product=https://api.kladana.in/api/remap/1.2/entity/service/706b9cd3-8552-11e6-8a84-bae500000045;product=https://api.kladana.in/api/remap/1.2/entity/bundle/7a5f0ed5-8552-11e6-8a84-bae500000046`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;withSubFolders=false`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b2`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b2;withSubFolders=false`
- `filter=counterparty=https://api.kladana.in/api/remap/1.2/entity/counterparty/f8f729a5-a784-11e9-ac12-000800000000`
- `filter=organization=https://api.kladana.in/api/remap/1.2/entity/organization/0347beb0-a785-11e9-ac12-000800000003`
- `filter=store=https://api.kladana.in/api/remap/1.2/entity/store/656c4032-8667-11e6-8a84-bae500003321`
- `filter=project=https://api.kladana.in/api/remap/1.2/entity/project/7a5f0ed5-8552-11e6-8a84-bae500000046`
- `filter=retailStore=https://api.kladana.in/api/remap/1.2/entity/retailstore/9ca74859-85c7-11e9-ac12-000d00000030`
- `filter=agentTag=favorites`
- `filter=supplier=https://api.kladana.in/api/remap/1.2/entity/counterparty/f8f729a5-a784-11e9-ac12-000800000000`
- `filter=salesChannel=https://api.kladana.in/api/remap/1.2/entity/saleschannel/65cc7e08-ea79-4ad7-9cde-3cc053f1c1b9`
- `filter=salesChannel=https://api.kladana.in/api/remap/1.2/entity/saleschannel/65cc7e08-ea79-4ad7-9cde-3cc053f1c1b9;salesChannel=https://api.kladana.in/api/remap/1.2/entity/saleschannel/ea012b09-4df3-439b-acf7-7d0464fbf603`
- `filter=product=https://api.kladana.in/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044;counterparty=https://api.kladana.in/api/remap/1.2/entity/counterparty/f8f729a5-a784-11e9-ac12-000800000000;organization=https://api.kladana.in/api/remap/1.2/entity/organization/0347beb0-a785-11e9-ac12-000800000003; store=https://api.kladana.in/api/remap/1.2/entity/store/656c4032-8667-11e6-8a84-bae500003321;project=https://api.kladana.in/api/remap/1.2/ entity/project/7a5f0ed5-8552-11e6-8a84-bae500000046;retailStore=https://api.kladana.in/api/remap/1.2/entity/retailstore/9ca74859-85c7-11e9-ac12-000d00000030;salesChannel=https: //api.kladana.in/api/remap/1.2/entity/saleschannel/65cc7e08-ea79-4ad7-9cde-3cc053f1c1b9`

### Get Profitability by Employee

**Parameters**

| Parameter | Description |
| ---------| ---- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **momentFrom** | `date` (optional) *Example: 2016-04-15 15:48:46* One of the [selection filter options](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter). |
| **momentTo** | `date` (optional) *Example: 2016-04-15 15:48:46* One of the [selection filter options](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter). |
If the **momentFrom** and **momentTo** parameters are missing, reports for the last month are displayed.
If the **momentFrom** parameter is absent and the **momentTo** parameter is specified, reports from the beginning of the current year up to **momentTo** are displayed.
If the **momentTo** parameter is absent and the **momentFrom** parameter is specified, reports from **momentFrom** up to the current day are displayed.

> Request for a Profitability by Employee report.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/report/profit/byemployee"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
{
   "context": {
     "employee": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/context/employee",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     }
   },
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/report/profit/byEmployee",
     "type": "salesbyemployee",
     "mediaType": "application/json",
     "size": 1,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "employee": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/employee/3c9ef5be-4814-11e6-8a84-bae500000028",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         },
         "name": "Administrator"
       },
       "salesCount": 3,
       "salesAvgCheck": 104498369718788910,
       "sellSum": 313495109156366700,
       "sellCostSum": 0,
       "returnCount": 0,
       "returnAvgCheck": 0,
       "returnSum": 0,
       "returnCostSum": 0,
       "profit": 313495109156366700,
       "margin": 0
     }
   ]
}
```

#### Profitability by customers
#### Report object attributes:

| Title | Type | Description |
| ------- | ----- | ------ |
| **counterparty** | Object | Brief presentation of the Buyer in the report. [More details here](../dictionaries/#entities-counterparty)<br>`+Required when answering` |
| **margin** | Float | Profitability<br>`+Required when answering`|
| **profit** | Float | Profit<br>`+Required when answering` |
| **returnAvgCheck** | Float | Average refund receipt<br>`+Required when replying` |
| **returnCostSum** | Float | The sum of the cost of returns<br>`+Required when answering` |
| **returnCount** | Int | Number of returns<br>`+Required when replying` |
| **returnSum** | Float | Refund amount<br>`+Required when replying` |
| **salesAvgCheck** | Float | Average sales receipt<br>`+Required when answering` |
| **salesCount** | Int | Number of sales<br>`+Required when answering` |
| **sellCostSum** | Float | Sum of cost of sales<br>`+Required when answering` |
| **sellSum** | Float | Sales amount<br>`+Required when answering` |

#### Structure of the counterparty object

| Title | Type | Description |
| ---------| ---- |------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Buyer Metadata<br>`+Required when replying` |
| **name** | String(255) | Name of the Buyer<br>`+Required when replying` |

#### Attributes available for filtering

The report results can be filtered using the filter parameter.
Only one value can be specified for each parameter, except for the sales channel.
You cannot specify empty values.

| Title | Type | Filtration | Description |
|--------| ------|--------| ---- |
| **product** | Object | `=` `!=` | a link to a product, service, kit, modification or series by which you want to filter. You can pass multiple values. |
| **productFolder** | Object | `=` `!=` | parameter for filtering by several product groups. The value of the parameter is a link to a product group that should be included in the selection or excluded from it. You can pass multiple values. |
| **withSubFolders**| Boolean | `=` | option to consider nested subgroups. Works only if there is a filter by `productFolder`. By default `true`, products from child subgroups of the filtered group / groups of products are displayed. When passing `false`, only products from the filtered group / groups are displayed, without taking into account subgroups. |
| **agentTag** | String(255) | `=` | string with the name of the group of counterparties by which you want to filter. |
| **counterparty** | Object | `=` | link to the counterparty by which you want to filter. |
| **organization** | Object | `=` | link to the legal entity by which you want to filter. |
| **store**| Object | `=` | a link to the warehouse by which you want to filter. |
| **project** | Object | `=` | a link to the project by which you want to filter. |
| **retailStore** | Object | `=` | a link to the point of sale by which you want to filter. |
| **supplier** | Object | `=` | parameter for filtering by supplier. The value of the parameter is a link to the counterparty or organization. The selection will include products with the specified supplier. |
| **salesChannel** | Object | `=` | a link to the sales channel by which you want to filter. You can reuse a filter when filtering across multiple sales channels is required. |

Simultaneous filtering by **product** and **productFolder** is not supported.


Filtering examples:

- `filter=product=https://api.kladana.in/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044`
- `filter=product=https://api.kladana.in/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044;product=https://api.kladana.in/api/remap/1.2/entity/service/706b9cd3-8552-11e6-8a84-bae500000045;product=https://api.kladana.in/api/remap/1.2/entity/bundle/7a5f0ed5-8552-11e6-8a84-bae500000046`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;withSubFolders=false`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b2`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b2;withSubFolders=false`
- `filter=counterparty=https://api.kladana.in/api/remap/1.2/entity/counterparty/f8f729a5-a784-11e9-ac12-000800000000`
- `filter=organization=https://api.kladana.in/api/remap/1.2/entity/organization/0347beb0-a785-11e9-ac12-000800000003`
- `filter=store=https://api.kladana.in/api/remap/1.2/entity/store/656c4032-8667-11e6-8a84-bae500003321`
- `filter=project=https://api.kladana.in/api/remap/1.2/entity/project/7a5f0ed5-8552-11e6-8a84-bae500000046`
- `filter=retailStore=https://api.kladana.in/api/remap/1.2/entity/retailstore/9ca74859-85c7-11e9-ac12-000d00000030`
- `filter=agentTag=favorites`
- `filter=supplier=https://api.kladana.in/api/remap/1.2/entity/counterparty/f8f729a5-a784-11e9-ac12-000800000000`
- `filter=salesChannel=https://api.kladana.in/api/remap/1.2/entity/saleschannel/65cc7e08-ea79-4ad7-9cde-3cc053f1c1b9`
- `filter=salesChannel=https://api.kladana.in/api/remap/1.2/entity/saleschannel/65cc7e08-ea79-4ad7-9cde-3cc053f1c1b9;salesChannel=https://api.kladana.in/api/remap/1.2/entity/saleschannel/ea012b09-4df3-439b-acf7-7d0464fbf603`
- `filter=product=https://api.kladana.in/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044;counterparty=https://api.kladana.in/api/remap/1.2/entity/counterparty/f8f729a5-a784-11e9-ac12-000800000000;organization=https://api.kladana.in/api/remap/1.2/entity/organization/0347beb0-a785-11e9-ac12-000800000003; store=https://api.kladana.in/api/remap/1.2/entity/store/656c4032-8667-11e6-8a84-bae500003321;project=https://api.kladana.in/api/remap/1.2/ entity/project/7a5f0ed5-8552-11e6-8a84-bae500000046;retailStore=https://api.kladana.in/api/remap/1.2/entity/retailstore/9ca74859-85c7-11e9-ac12-000d00000030;salesChannel=https: //api.kladana.in/api/remap/1.2/entity/saleschannel/65cc7e08-ea79-4ad7-9cde-3cc053f1c1b9`

### Get Profitability by Customers

**Parameters**

| Parameter | Description |
| ---------| ---- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
|**momentFrom** | `date` (optional) *Example: 2016-04-15 15:48:46* One of the [selection filter options](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter). |
| **momentTo** | `date` (optional) *Example: 2016-04-15 15:48:46* One of the [selection filter options](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter). |
If the **momentFrom** and **momentTo** parameters are missing, reports for the last month are displayed.
If the **momentFrom** parameter is absent and the **momentTo** parameter is specified, reports from the beginning of the current year up to **momentTo** are displayed.
If the **momentTo** parameter is absent and the **momentFrom** parameter is specified, reports from **momentFrom** up to the current day are displayed.

> Request for a "Profitability by Buyers" report.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/report/profit/bycounterparty"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
{
   "context": {
     "employee": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/context/employee",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     }
   },
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/report/profit/bycounterparty",
     "type": "salesbycounterparty",
     "mediaType": "application/json",
     "size": 3,
     "limit": 1,
     "offset": 0,
     "nextHref": "https://api.kladana.in/api/remap/1.2/report/profit/bycounterparty?limit=1&offset=1"
   },
   "rows": [
     {
       "counterparty": {
         "meta": {
           "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/3cd88c00-4814-11e6-8a84-bae500000053",
           "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         },
         "name": "LLC \"Buyer\""
       },
       "salesCount": 1,
       "salesAvgCheck": 310390615323104640,
       "sellSum": 310390615323104640,
       "sellCostSum": 0,
       "returnCount": 0,
       "returnAvgCheck": 0,
       "returnSum": 0,
       "returnCostSum": 0,
       "profit": 310390615323104640,
       "margin": 0
     }
   ]
}
```

#### Profitability by sales channel
#### Report object attributes

| Title | Type | Description |
| ---------| ---- |----------|
| **salesChannel** | Object | A brief representation of the Sales Channel in the report. [More details here](../dictionaries/#entities-sales-channel)<br>`+Required when replying` |
| **margin** | Float | Profitability<br>`+Required when answering` |
| **profit** | Float | Profit<br>`+Required when answering` |
| **returnAvgCheck** | Float | Average refund receipt<br>`+Required when replying` |
| **returnCostSum** | Float | The sum of the cost of returns<br>`+Required when answering` |
| **returnCount** | Int | Number of returns<br>`+Required when replying` |
| **returnSum** | Float | Refund amount<br>`+Required when replying` |
| **salesAvgCheck** | Float | Average sales receipt<br>`+Required when answering` |
| **salesCount** | Int | Number of sales<br>`+Required when answering` |
| **sellCostSum** | Float | Sum of cost of sales<br>`+Required when answering` |
| **sellSum** | Float | Sales amount<br>`+Required when answering` |

#### SalesChannel object structure

| Title | Type | Description |
| ---------| ---- |---------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Sales Channel Metadata<br>`+Required when responding` |
| **name** | String(255) | Sales Channel Name<br>`+Required when replying` |
| **type** | Enum | Sales Channel Type [Details here](../dictionaries/#entities-sales-channel-sales-channels-sales-channel-type)<br>`+Required when answering ` |

#### Attributes available for filtering

The report results can be filtered using the filter parameter.
Only one value can be specified for each parameter, except for the sales channel.
You cannot specify empty values.

| Title | Type | Filtration | Description |
|--------------------|-----------|-----------|---------|
| **product** | Object | `=` `!=` | a link to a product, service, kit, modification or series by which you want to filter. You can pass multiple values. |
| **productFolder** | Object | `=` `!=` | parameter for filtering by several product groups. The value of the parameter is a link to a product group that should be included in the selection or excluded from it. You can pass multiple values. |
| **withSubFolders**| Boolean | `=` | option to consider nested subgroups. Works only if there is a filter by `productFolder`. By default `true`, products from child subgroups of the filtered group / groups of products are displayed. When passing `false`, only products from the filtered group / groups are displayed, without taking into account subgroups. |
| **agentTag** | String(255) | `=` | string with the name of the group of counterparties by which you want to filter. |
| **counterparty** | Object | `=` | link to the counterparty by which you want to filter. |
| **organization** | Object | `=` | link to the legal entity by which you want to filter. |
| **store** | Object | `=` | a link to the warehouse by which you want to filter. |
| **project** | Object | `=` | a link to the project by which you want to filter. |
| **supplier** | Object | `=` | parameter for filtering by supplier. The value of the parameter is a link to the counterparty or organization. The selection will include products with the specified supplier. |
| **salesChannel** | Object | `=` | a link to the sales channel by which you want to filter. You can reuse a filter when filtering across multiple sales channels is required. |

Simultaneous filtering by **product** and **productFolder** is not supported.


Filtering examples:

- `filter=product=https://api.kladana.in/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044`
- `filter=product=https://api.kladana.in/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044;product=https://api.kladana.in/api/remap/1.2/entity/service/706b9cd3-8552-11e6-8a84-bae500000045;product=https://api.kladana.in/api/remap/1.2/entity/bundle/7a5f0ed5-8552-11e6-8a84-bae500000046`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;withSubFolders=false`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b2`
- `filter=productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b1;productFolder=https://api.kladana.in/api/remap/1.2/entity/productfolder/c56d0702-85c7-11e9-ac12-000d000000b2;withSubFolders=false`
- `filter=counterparty=https://api.kladana.in/api/remap/1.2/entity/counterparty/f8f729a5-a784-11e9-ac12-000800000000`
- `filter=organization=https://api.kladana.in/api/remap/1.2/entity/organization/0347beb0-a785-11e9-ac12-000800000003`
- `filter=store=https://api.kladana.in/api/remap/1.2/entity/store/656c4032-8667-11e6-8a84-bae500003321`
- `filter=project=https://api.kladana.in/api/remap/1.2/entity/project/7a5f0ed5-8552-11e6-8a84-bae500000046`
- `filter=agentTag=favorites`
- `filter=supplier=https://api.kladana.in/api/remap/1.2/entity/counterparty/f8f729a5-a784-11e9-ac12-000800000000`
- `filter=salesChannel=https://api.kladana.in/api/remap/1.2/entity/saleschannel/65cc7e08-ea79-4ad7-9cde-3cc053f1c1b9`
- `filter=salesChannel=https://api.kladana.in/api/remap/1.2/entity/saleschannel/65cc7e08-ea79-4ad7-9cde-3cc053f1c1b9;salesChannel=https://api.kladana.in/api/remap/1.2/entity/saleschannel/ea012b09-4df3-439b-acf7-7d0464fbf603`
- `filter=product=https://api.kladana.in/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044;counterparty=https://api.kladana.in/api/remap/1.2/entity/counterparty/f8f729a5-a784-11e9-ac12-000800000000;organization=https://api.kladana.in/api/remap/1.2/entity/organization/0347beb0-a785-11e9-ac12-000800000003; store=https://api.kladana.in/api/remap/1.2/entity/store/656c4032-8667-11e6-8a84-bae500003321;project=https://api.kladana.in/api/remap/1.2/ entity/project/7a5f0ed5-8552-11e6-8a84-bae500000046;salesChannel=https://api.kladana.in/api/remap/1.2/entity/saleschannel/65cc7e08-ea79-4ad7-9cde-3cc053f1c1b9`

### Get Profitability by Sales Channels

**Parameters**

| Parameter | Description |
| ---------| ---- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **momentFrom** | `date` (optional) *Example: 2016-04-15 15:48:46* One of the [selection filter options](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter). |
| **momentTo** | `date` (optional) *Example: 2016-04-15 15:48:46* One of the [selection filter options](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter). |
If the **momentFrom** and **momentTo** parameters are missing, reports for the last month are displayed.
If the **momentFrom** parameter is absent and the **momentTo** parameter is specified, reports from the beginning of the current year up to **momentTo** are displayed.
If the **momentTo** parameter is absent and the **momentFrom** parameter is specified, reports from **momentFrom** up to the current day are displayed.

> Request for a Profitability by Sales Channel report.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/report/profit/bysaleschannel"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
{
   "context" : {
     "employee" : {
       "meta" : {
         "href" : "https://api.kladana.in/api/remap/1.2/context/employee",
         "metadataHref" : "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type" : "employee",
         "mediaType" : "application/json"
       }
     }
   },
   "meta" : {
     "href" : "https://api.kladana.in/api/remap/1.2/report/profit/bysaleschannel",
     "type" : "salesbysaleschannel",
     "mediaType" : "application/json",
     "size" : 1,
     "limit" : 1000,
     "offset" : 0
   },
   "rows" : [{
     "salesChannel" : {
       "meta" : {
         "href" : "https://api.kladana.in/api/remap/1.2/entity/saleschannel/656c4032-8552-11e6-8a84-bae500000044",
         "metadataHref" : "https://api.kladana.in/api/remap/1.2/entity/saleschannel/metadata",
         "type" : "saleschannel",
         "mediaType" : "application/json",
         "uuidHref" : "https://app.kladana.in/app/#saleschannel/edit?id=656c4032-8552-11e6-8a84-bae500000044"
       },
       "name" : "ijk-shop.ru",
       "type" : "ECOMMERCE"
     },
     "salesCount" : 1.0,
     "salesAvgCheck" : 252500.0,
     "sellSum" : 252500.0,
     "sellCostSum" : 0.0,
     "returnCount" : 0.0,
     "returnAvgCheck" : 0.0,
     "returnSum" : 0.0,
     "returnCostSum" : 0.0,
     "profit" : 252500.0,
     "margin" : 0.0
   } ]
}
```
