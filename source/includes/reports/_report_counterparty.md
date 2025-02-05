## Report Indicators of counterparties

Using the JSON API, you can request the "Account metrics" report for all or for an individual counterparty. Access to the report via the API requires the right to view CRM metrics for `viewCompanyCRM` counterparties. To get the value in the `profit` field, you additionally need the right to see the cost price, purchase price and profit of goods `viewProductCostAndProfit`.


### Indicators of counterparties
#### Indicator attributes

| Title | Type                                               | Filtration | Description |
| ----- |----------------------------------------------------| ------ | ------ |
| **averageReceipt** | Float                                              | `=` `!=` `<` `>` `<=` `>=` | Average bill<br>`+Required when replying` |
| **balance** | Float                                              | `=` `!=` `<` `>` `<=` `>=` | Balance<br>`+Required when replying` |
| **bonusbalance** | Float                                              | | Points<br>`+Required when replying` |
| **counterparty** | object                                             | | Counterparty. [Learn more](../dictionaries/#entities-product-products-entity-attributes-tax-system-code)<br>`+Required when replying` |
| **demandsCount** | Int                                                | `=` `!=` `<` `>` `<=` `>=` | Number of sales<br>`+Required when replying` |
| **demandssum** | Float                                              | `=` `!=` `<` `>` `<=` `>=` | Sales amount<br>`+Required when replying` |
| **discountSum** | Float                                              | `=` `!=` `<` `>` `<=` `>=` | Discount amount<br>`+Required when replying` |
| **firstDemandDate** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Date of first sale<br>`+Required when replying` |
| **lastDemandDate** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Date of last sale<br>`+Required when replying` |
| **lastEventDate** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Last event date<br>`+Required when replying` |
| **lastEventText** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Last event text<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Metadata of the Report for this counterparty<br>`+Required when replying` |
| **profit** | Float                                              | `=` `!=` `<` `>` `<=` `>=` | Profit<br>`+Required when replying` |
| **returnsCount** | Int                                                | `=` `!=` `<` `>` `<=` `>=` | Number of returns<br>`+Required when replying` |
| **returnsSum** | Float                                              | `=` `!=` `<` `>` `<=` `>=` | Refund amount<br>`+Required when replying` |
| **updated** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | The moment of the last change of the counterparty<br>`+Required when replying` |

### Additional attributes available for filtering

| Title | Type | Filtration | Description |
| ------- | ---------- | --------- |------- |
| **counterparty.name**| String(255) | `=` `!=` `~` `~=` `=~` | Counterparty name |
| **counterparty.companyType** | Enum | `=` `!=` | Counterparty type |
| **counterparty.description** | String(4096) | `=` `!=` `~` `~=` `=~` | Comment to the Counterparty |
| **counterparty.email** | String(255) | `=` `!=` `~` `~=` `=~` | Email address |
| **counterparty.inn** | String(255) | `=` `!=` `~` `~=` `=~` | Counterparty Tax Identification Number |
| **counterparty.phone** | String(255) | `=` `!=` `~` `~=` `=~` | Phone number |
| **id** | UUID | `=` `!=` | Counterparty ID |

#### Counterparty

| Title | Type | Description |
| ------ | ----- | ------- |
| **companyType** | Enum | Counterparty type<br>`+Required when replying` |
| **externalCode** | String(255) | External counterparty code<br>`+Required when replying` |
| **id** | UUID | Counterparty ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Counterparty<br>`+Required when replying` |
| **name** | String(255) | Name of Counterparty<br>`+Required when replying` |

#### Tariff limits
If your plan does not include the CRM option, you will not be able to receive this request via the API.


### Get indicators of counterparties
Request for a report on counterparties.
The result of a successful request is a JSON representation of a list of reports for individual Counterparties:


| Title | Type | Description |
| -------- | ------- | ------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing reports on individual counterparties. |

**Parameters**

| Parameter | Description |
| -------- | ------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Request for a report on counterparties.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/report/counterparty"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a report on counterparties.

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
     "href": "https://api.kladana.com/api/remap/1.2/report/counterparty",
     "type": "counterparty",
     "mediaType": "application/json",
     "size": 5,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/report/counterparty/b80ea81b-7058-11e6-8a84-bae500000000",
         "type": "counterparty",
         "mediaType": "application/json"
       },
       "counterparty": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         },
         "id": "b80ea81b-7058-11e6-8a84-bae500000000",
         "name": "OOO Rainbow",
         "externalCode": "o7732zkki541HDkZZD1Yt3",
         "companyType": "legal"
       },
       "firstDemandDate": null,
       "lastDemandDate": null,
       "demandsCount": 0,
       "demandsSum": 0,
       "averageReceipt": 0,
       "returnsCount": 0,
       "returnsSum": 0,
       "discountsSum": 0,
       "balance": 0,
       "profit": 0,
       "lastEventDate": null,
       "lastEventText": null,
       "updated": "2016-09-01 18:32:17"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/report/counterparty/df2fdd2d-6934-11e6-8a84-bae500000049",
         "type": "counterparty",
         "mediaType": "application/json"
       },
       "counterparty": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/df2fdd2d-6934-11e6-8a84-bae500000049",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         },
         "id": "df2fdd2d-6934-11e6-8a84-bae500000049",
         "name": "rtr",
         "externalCode": "rRlzrdZmjql9r9dveXPE43",
         "companyType": "legal"
       },
       "firstDemandDate": null,
       "lastDemandDate": null,
       "demandsCount": 0,
       "demandsSum": 0,
       "averageReceipt": 0,
       "returnsCount": 0,
       "returnsSum": 0,
       "discountsSum": 0,
       "balance": 0,
       "profit": 0,
       "lastEventDate": "2016-09-08 13:07:30",
       "lastEventText": "sale",
       "updated": "2016-08-23 16:24:08"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/report/counterparty/12c9ebcf-692c-11e6-8a84-bae50000005d",
         "type": "counterparty",
         "mediaType": "application/json"
       },
       "counterparty": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/12c9ebcf-692c-11e6-8a84-bae50000005d",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         },
         "id": "12c9ebcf-692c-11e6-8a84-bae50000005d",
         "name": "Retail customer",
         "externalCode": "lBvYwLWMiBsct7sVRrFnJ2",
         "companyType": "legal"
       },
       "firstDemandDate": "2016-08-26 15:49:00",
       "lastDemandDate": "2016-08-26 15:49:00",
       "demandsCount": 1,
       "demandsSum": 80000,
       "averageReceipt": 80000,
       "returnsCount": 0,
       "returnsSum": 0,
       "discountsSum": 0,
       "balance": 0,
       "bonusBalance": 120,
       "profit": -103040600,
       "lastEventDate": null,
       "lastEventText": null,
       "updated": "2016-08-23 15:21:09"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/report/counterparty/12a8e347-692c-11e6-8a84-bae500000055",
         "type": "counterparty",
         "mediaType": "application/json"
       },
       "counterparty": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/12a8e347-692c-11e6-8a84-bae500000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         },
         "id": "12a8e347-692c-11e6-8a84-bae500000055",
         "name": "LLC \"Buyer\"",
         "externalCode": "DTItQRbDhyl472ZqC5OWw2",
         "inn": "7736570902",
         "companyType": "legal"
       },
       "firstDemandDate": "2016-09-01 17:54:00",
       "lastDemandDate": "2016-09-01 17:54:00",
       "demandsCount": 1,
       "demandsSum": 60000,
       "averageReceipt": 60000,
       "returnsCount": 0,
       "returnsSum": 0,
       "discountsSum": 0,
       "balance": 1241255000,
       "bonusBalance": 298,
       "profit": 50000,
       "lastEventDate": null,
       "lastEventText": null,
       "updated": "2016-08-23 15:21:09"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/report/counterparty/12a8b923-692c-11e6-8a84-bae500000053",
         "type": "counterparty",
         "mediaType": "application/json"
       },
       "counterparty": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/12a8b923-692c-11e6-8a84-bae500000053",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         },
         "id": "12a8b923-692c-11e6-8a84-bae500000053",
         "name": "LLC \"Supplier\"",
         "externalCode": "aZBfWOKzj-lcq7c7IWZON3",
         "inn": "7736570901",
         "companyType": "legal"
       },
       "firstDemandDate": null,
       "lastDemandDate": null,
       "demandsCount": 0,
       "demandsSum": 0,
       "averageReceipt": 0,
       "returnsCount": 0,
       "returnsSum": 0,
       "discountsSum": 0,
       "balance": 0,
       "profit": 0,
       "lastEventDate": null,
       "lastEventText": null,
       "updated": "2016-08-23 15:21:09"
     }
   ]
}
```

### Selected indicators of counterparties
Request to receive a report on the specified counterparties. You need to pass an array of `counterparties`,
containing metadata of counterparties for which reports are required.
The result of a successful request is a JSON representation of the list of reports for the specified Counterparties:


| Title | Type | Description|
| ------ | ------- | ------ |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | json arrayprojects that submit reports on individual counterparties. |

> An example of requesting reports for several counterparties.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/report/counterparty"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "counterparties": [
               {
                 "counterparty": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/49b40d55-66cc-11e7-6adb-ede500000054",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                     "type": "counterparty",
                     "mediaType": "application/json"
                   }
                 }
               },
               {
                 "counterparty": {
                   "meta": {
                     "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/37e4efe0-6ade-11e7-6adb-ede50000001a",
                     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                     "type": "counterparty",
                     "mediaType": "application/json"
                   }
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a report on counterparties.

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
     "href": "https://api.kladana.com/api/remap/1.2/report/counterparty",
     "type": "counterparty",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/report/counterparty/49b40d55-66cc-11e7-6adb-ede500000054",
         "type": "counterparty",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#company/edit?id=49b40d55-66cc-11e7-6adb-ede500000054"
       },
       "counterparty": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/49b40d55-66cc-11e7-6adb-ede500000054",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#company/edit?id=49b40d55-66cc-11e7-6adb-ede500000054"
         },
         "id": "49b40d55-66cc-11e7-6adb-ede500000054",
         "name": "LLC \"Supplier\"",
         "externalCode": "btkD664AiiIaIYMdI50OW3",
         "inn": "7736570901",
         "companyType": "legal"
       },
       "firstDemandDate": null,
       "lastDemandDate": null,
       "demandsCount": 0,
       "demandsSum": 0,
       "averageReceipt": 0,
       "returnsCount": 0,
       "returnsSum": 0,
       "discountsSum": 0,
       "balance": 0,
       "profit": 0,
       "lastEventDate": null,
       "lastEventText": null,
       "updated": "2017-07-12 09:35:26"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/report/counterparty/37e4efe0-6ade-11e7-6adb-ede50000001a",
         "type": "counterparty",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#company/edit?id=37e4efe0-6ade-11e7-6adb-ede50000001a"
       },
       "counterparty": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/37e4efe0-6ade-11e7-6adb-ede50000001a",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#company/edit?id=37e4efe0-6ade-11e7-6adb-ede50000001a"
         },
         "id": "37e4efe0-6ade-11e7-6adb-ede50000001a",
         "name": "LLC \"Supplier 2\"",
         "externalCode": "WG4JRabzgb6aW9asZ20yy3",
         "inn": "7736570901",
         "companyType": "legal"
       },
       "firstDemandDate": null,
       "lastDemandDate": null,
       "demandsCount": 0,
       "demandsSum": 0,
       "averageReceipt": 0,
       "returnsCount": 0,
       "returnsSum": 0,
       "discountsSum": 0,
       "balance": 0,
       "profit": 0,
       "lastEventDate": null,
       "lastEventText": null,
       "updated": "2017-07-17 13:54:30"
     }
   ]
}
```

### Counterparty indicators
#### Counterparty indicators

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities.|
 
> Request to receive a report on the counterparty with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/report/counterparty/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a report on a counterparty.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/report/counterparty/df2fdd2d-6934-11e6-8a84-bae500000049",
     "type": "counterparty",
     "mediaType": "application/json"
   },
   "counterparty": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/df2fdd2d-6934-11e6-8a84-bae500000049",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     },
     "id": "df2fdd2d-6934-11e6-8a84-bae500000049",
     "name": "rtr",
     "externalCode": "rRlzrdZmjql9r9dveXPE43",
     "companyType": "legal"
   },
   "firstDemandDate": "2016-09-01 17:54:00",
   "lastDemandDate": "2016-09-01 17:54:00",
   "demandsCount": 1,
   "demandsSum": 60000,
   "averageReceipt": 60000,
   "returnsCount": 0,
   "returnsSum": 0,
   "discountsSum": 0,
   "balance": -60000,
   "bonusBalance": 200,
   "profit": 50000,
   "lastEventDate": "2016-09-08 13:07:30",
   "lastEventText": "sale",
   "updated": "2016-08-23 16:24:08"
}
```
