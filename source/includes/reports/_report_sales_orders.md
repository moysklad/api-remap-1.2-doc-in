## Sales and Orders Indicators

Using the JSON API, you can request sales and orders indicators - the number and amounts for a certain period, broken down by hours, days or months. Accessing the report via the API requires the right to view `viewDashboard` metrics.

#### Report attributes:

| Title | Type | Description |
| ---------- | ----------- | -------- |
| **series** | Array(Object) | An array of indicators. More details in the table below<br>`+Required when answering` |

#### Indicators (series)

| Title | Type | Description |
| ------------ | ------ | -------------- |
| **date** | datetime | Date<br>`+Required when replying` |
| **quantity** | int | Quantity<br>`+Required when answering` |
| **sum** | float | Amount<br>`+Required when answering` |

**Parameters**

| Parameter | Description |
| -------- | ---------- |
| **momentFrom** | `date` (required) *Example: 2018-09-01 00:00:00* Report period start |
| **momentTo** | `date` (required) *Example: 2018-10-01 00:00:00* Report period end |
| **interval** | `string` (required) The interval at which the report will be built. Can take the values *hour*, *day*, *month* to split the specified period into hours, days and months, respectively |
 
**Headers**

| Title | Description |
| -------- | ---------- |
| **X-Lognex-Accept-Timezone** | An optional header that specifies the current date on the client in RFC 3522. The time zone must be specified in the format sign and 4 characters (not in Obsolete Date and Time). Date example: `Wed, 16 Aug 2017 23:07:01 +0700`. When calculating indicators, the dates of transactions are shifted to the client's time zone. |
| **X-Lognex-Content-Timezone** | Response header. It specifies (as the server thinks) the current date on the client in RFC 3522. |

 
### Order figures

Orders only count of Sales Orders.

#### Parameters available for filtering

Transactions included in the report can be filtered using the **filter** parameter. You can specify multiple values for each parameter. You cannot specify empty values.

| Title | Type | Filtration | Description |
| ------- | ----- | --------- | ------ |
| **organization** | object | `=` | link to legal face |
| **store** | object | `=` | warehouse link |
| **project** | object | `=` | project link |

> Request for order metrics

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/report/orders/plotseries?momentFrom=2018-09-06 00:00:00&momentTo=2018-09-06 01:00:01&interval=hour"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
{
   "context": {
     "employee": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/context/employee",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     }
   },
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/report/orders/plotseries?momentFrom=2018-09-06 00:00:00&momentTo=2016-09-06 01:00:01&interval =hour",
     "type": "ordersplotseries",
     "mediaType": "application/json"
   },
   "series": [
     {
       "date": "2018-09-06 00:00:00",
       "quantity": 3,
       "sum": 600
     },
     {
       "date": "2018-09-06 01:00:00",
       "quantity": 2,
       "sum": 200
     }
   ]
}
```

> Query to get order metrics with filtering

```shell
curl -X GET
   "https://app.kladana.in/report/orders/plotseries?momentFrom=2018-09-06 00:00:00&momentTo=2018-09-06 01:00:01&interval=hour&filter=organization=https://app .kladana.in/api/remap/1.2/entity/organization/00cd5a99-6897-11e7-7a6c-d2a9000c4fc0;project=https://app.kladana.in/api/remap/1.2/entity/project/02e64f51-6897 -11e7-7a34-5acf000c8448;store=https://app.kladana.in/api/remap/1.2/entity/store/32213d37-8101-11e8-9107-50480004c6c1"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
{
   "context": {
     "employee": {
       "meta": {
         "href": "https://app.kladana.in/context/employee",
         "metaseriesHref": "https://app.kladana.in/employee/metaseries",
         "type": "employee",
         "mediaType": "application/json"
       }
     }
   },
   "meta": {
     "href": "https://app.kladana.in/report/orders/plotseries?momentFrom=2018-09-06 00:00:00&momentTo=2016-09-06 01:00:01&interval=hour&filter=organization=https ://app.kladana.in/api/remap/1.2/entity/organization/00cd5a99-6897-11e7-7a6c-d2a9000c4fc0;project=https://app.kladana.in/api/remap/1.2/entity/project /02e64f51-6897-11e7-7a34-5acf000c8448;store=https://app.kladana.in/api/remap/1.2/entity/store/32213d37-8101-11e8-9107-50480004c6c1",
     "type": "ordersplotseries",
     "mediaType": "application/json"
   },
   "series": [
     {
       "date": "2018-09-06 00:00:00",
       "quantity": 1,
       "sum": 100
     },
     {
       "date": "2018-09-06 01:00:00",
       "quantity": 1,
       "sum": 100
     }
   ]
}
```

### Sales figures

Sales figures take into account shipments, retail sales, commission agent reports received.

#### Parameters available for filtering

Transactions included in the report can be filtered using the **filter** parameter. You can specify multiple values for each parameter. You cannot specify empty values.

| Title | Type | Filtration | Description |
| ------- | ----- | ------- | -------- |
| **organization** | object | `=` | link to legal face |
| **store** | object | `=` | warehouse link |
| **project** | object | `=` | project link |
| **retailstore** | object | `=` | link to point of sale. When using this parameter, only retail sales are taken into account. |

> Request for obtaining sales figures with filtering

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/report/sales/plotseries?momentFrom=2018-09-06 00:00:00&momentTo=2018-09-10 01:00:01&interval=hour&filter=retailStore =https://app.kladana.in/api/remap/1.2/entity/retailstore/d9a8a213-6703-11e7-9464-e4de00000060&amp;project=https://app.kladana.in/api/remap/1.2/entity /project/d9a8a213-6703-11e7-9464-e4de00000060&amp;store=https://app.kladana.in/api/remap/1.2/entity/store/d9a8a213-6703-11e7-9464-e4de00000060&amp;organization=https:/ /app.kladana.in/api/remap/1.2/entity/organization/d9a8a213-6703-11e7-9464-e4de00000060"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
{
   "context": {
     "employee": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/context/employee",
         "metaseriesHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metaseries",
         "type": "employee",
         "mediaType": "application/json"
       }
     }
   },
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/report/sales/plotseries?momentFrom=2018-09-06 00:00:00&momentTo=2018-09-10 01:00:01&interval =hour&filter=retailStore=https://app.kladana.in/api/remap/1.2/entity/retailstore/d9a8a213-6703-11e7-9464-e4de00000060&amp;project=https://app.kladana.in/api/remap /1.2/entity/project/d9a8a213-6703-11e7-9464-e4de00000060&amp;store=https://app.kladana.in/api/remap/1.2/entity/store/d9a8a213-6703-11e7-9464-e4de00000060&amp;organization =https://app.kladana.in/api/remap/1.2/entity/organization/d9a8a213-6703-11e7-9464-e4de00000060",
     "type": "salesplot series",
     "mediaType": "application/json"
   },
   "series": [
     {
       "date": "2018-09-06 00:00:00",
       "quantity": 3,
       "sum": 900
     },
     {
       "date": "2018-09-06 01:00:00",
       "quantity": 4,
       "sum": 400
     }
   ]
}
```
