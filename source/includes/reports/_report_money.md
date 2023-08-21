## Money Report

Using the JSON API, you can request reports that reflect the movement of funds for a given period and current cash and account balances.
Access to the report via the API requires the right to view indicators `viewDashboard` and the right "See money balances" `viewMoneyDashboard`.

### Flow of funds
#### Report attributes

| Title | Type | Description |
| ---------- | ------------ | ------ |
| **credit** | Float | Income<br>`+Required when answering` |
| **debit** | Float | Cost<br>`+Required when answering` |
| **series** | Array(Object) | An array of indicators. More details in the table below<br>`+Required when answering` |

#### Indicators (series)

| Title | Type | Description |
| ----------- |  ------------ | ------ |
| **date** | DateTime | Date<br>`+Required when replying` |
| **credit** | Float | Income for the period<br>`+Required when answering` |
| **debit** | Float | Expense for the period<br>`+Required when answering` |
| **balance** | Float | Balance (income-expense)<br>`+Required when answering` |

#### Parameters available for filtering

Transactions included in the report can be filtered using the **filter** parameter. You can specify multiple values for each parameter. You cannot specify empty values.

| Title | Type | Filtration | Description |
| ------ |------| ------------ | ------ |
| **organization** | Object | `=` | link to legal face |
| **project** | Object | `=` | project link |


**Parameters**

| Parameter | Description |
| ------------ | ------ |
| **momentFrom** | `date` (required) *Example: 2018-09-01 00:00:00* Report period start |
| **momentTo** | `date` (required) *Example: 2018-10-01 00:00:00* Report period end |
| **interval** | `string` (required) The interval at which the report will be built. Can take the values *hour*, *day*, *month* to split the specified period into hours, days and months, respectively |

**Headers**

| Header | Description |
| ------------ | ------ |
| **X-Lognex-Accept-Timezone** | An optional header that specifies the current date on the client in RFC 3522. The time zone must be specified in the format sign and 4 characters (not in Obsolete Date and Time). Date example: `Wed, 16 Aug 2017 23:07:01 +0700`. When calculating indicators, the dates of transactions are shifted to the client's time zone. |
| **X-Lognex-Content-Timezone** | Response header. It specifies (as the server thinks) the current date on the client in RFC 3522. |

> Request for a cash flow chart

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/report/money/plotseries?momentFrom=2018-09-01&momentTo=2018-09-04&interval=day"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
{
   "context": {
     "employee": {
       "meta": {
         "href":"https://app.kladana.in/api/remap/1.2/context/employee",
         "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type":"employee",
         "mediaType":"application/json"
       }
     }
   },
   "meta": {
     "href":"https://app.kladana.in/api/remap/1.2/report/money/plotseries?momentFrom=2018-09-01&momentTo=2018-09-04&interval=day",
     "type":"moneyplotseries",
     "mediaType":"application/json"
   },
   "credit":400,
   "debit":200,
   "series":[
     {
       "date":"2018-09-01 00:00:00",
       "credit":100,
       "debit":50,
       "balance":50
     },
     {
       "date":"2018-09-02 00:00:00",
       "credit":100,
       "debit":50,
       "balance":50
     },
     {
       "date":"2018-09-03 00:00:00",
       "credit":100,
       "debit":50,
       "balance":50
     },
     {
       "date":"2018-09-04 00:00:00",
       "credit":100,
       "debit":50,
       "balance":50
     }
   ]
}
```

> Graph request with filtering

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/report/money/plotseries?momentFrom=2018-09-01&momentTo=2018-09-04&interval=day&filter=organization=https://app.kladana.in/api/remap/1.2/entity/organization/00cd5a99-6897-11e7-7a6c-d2a9000c4fc0;project=https://app.kladana.in/api/remap/1.2/entity/project/02e64f51-6897-11e7-7a34-5acf000c8448"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
{
   "context": {
     "employee": {
       "meta": {
         "href":"https://app.kladana.in/api/remap/1.2/context/employee",
         "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type":"employee",
         "mediaType":"application/json"
       }
     }
   },
   "meta": {
     "href":"https://app.kladana.in/api/remap/1.2/report/money/plotseries?momentFrom=2018-09-01&momentTo=2018-09-04&interval=day&filter=organization=https://app.kladana.in/api/remap/1.2/entity/organization/00cd5a99-6897-11e7-7a6c-d2a9000c4fc0;project=https://app.kladana.in/api/remap/1.2/entity/project/02e64f51-6897-11e7-7a34-5acf000c8448",
     "type":"moneyplotseries",
     "mediaType":"application/json"
   },
   "credit":60,
   "debit":20,
   "series":[
     {
       "date":"2018-09-01 00:00:00",
       "credit":50,
       "debit":0,
       "balance":50
     },
     {
       "date":"2018-09-02 00:00:00",
       "credit":10,
       "debit":20,
       "balance":-10
     },
     {
       "date":"2018-09-03 00:00:00",
       "credit":0,
       "debit":0,
       "balance":0
     },
     {
       "date":"2018-09-04 00:00:00",
       "credit":0,
       "debit":0,
       "balance":0
     }
   ]
}
```

### Cash balances
#### Report object attributes:

#### Unit
| Title | Type | Description |
| ------------ | ------ |----- |
| **account** | Object | Account of the organization (not displayed for the balance of the cash desk, since there is only one cash desk for the organization). [More details here](../dictionaries/#entities-towar-towary-atributy-suschnosti-kod-sistemy-nalogooblozheniq)<br>`+Required when answering` |
| **organization** | Object | Organization. [More details here](../dictionaries/#entities-towar-towary-atributy-suschnosti-kod-sistemy-nalogooblozheniq)<br>`+Required when answering` |
| **balance** | Float | Current balance<br>`+Required when answering` |

#### Organization account

| Title | Type | Description |
| ------------ | ------ |--------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Organization metadata<br>`+Required when replying` |
| **name** | String(255) | Account number<br>`+Required when replying` |

#### Organization

| Title | Type | Description |
| ------------ | ------ |---- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Organization metadata<br>`+Required when replying` |
| **name** | String(255) | Organization name<br>`+Required when answering` |

> Request for receipt of cash balances on cash desks and accounts

```shell
curl -X GET"https://app.kladana.in/api/remap/1.2/report/money/byaccount"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
{
   "context": {
     "employee": {
       "meta": {
         "href":"https://app.kladana.in/api/remap/1.2/context/employee",
         "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type":"employee",
         "mediaType":"application/json"
       }
     }
   },
   "meta": {
     "href":"https://app.kladana.in/api/remap/1.2/report/money/byaccount",
     "type":"moneyreport",
     "mediaType":"application/json"
   },
   "rows": [
     {
       "organization": {
         "meta": {
           "href":"https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
           "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type":"organization",
           "mediaType":"application/json"
         },
         "name":"OOO Chamomile"
       },
       "balance":100
     },
     {
       "organization": {
         "meta": {
           "href":"https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
           "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type":"organization",
           "mediaType":"application/json"
         },
         "name":"OOO Serious Legal Entity"
       },
       "balance":100
     },
     {
       "account": {
         "meta": {
           "href":"https://app.kladana.in/api/remap/1.2/entity/organization/4b9d5bec-0575-11e6-9464-e4de00000008/accounts/4b9d69b7-0575-11e6-9464-e4de00000009",
           "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type":"account",
           "mediaType":"application/json"
         },
         "name":"00000"
       },
       "organization": {
         "meta": {
           "href":"https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
           "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type":"organization",
           "mediaType":"application/json"
         },
         "name":"OOO Serious Legal Entity"
       },
       "balance":200
     }
   ]
}
```
