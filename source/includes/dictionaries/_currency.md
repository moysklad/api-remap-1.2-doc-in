## Currency
### Currency

Using the JSON API, you can request lists of currencies and information on individual currencies, as well as create new and update information on existing currencies. The entity code for currencies in the JSON API is the **currency** keyword.Learn more about [Currencies](https://kladana.zendesk.com/hc/en-us/articles/6492493269405-Currencies).

This entity can be contextually searched using the special `search` parameter. [Learn more](../#kladana-json-api-general-info-context-search). The search with the search parameter differs from others in that the search is not prefixed, without tokenization, and only goes through one field at a time. Searches for strings that include the value of the search string.

The search among currency objects to match the search string will be carried out using the following fields:

+ by the short name of the Currency **name**

#### Entity Attributes

| Title | Type                                               | Filtration | Description |
| ---------- |----------------------------------------------------| -------- | ----------- |
| **archived** | Boolean                                            | `=` `!=` | Has the Currency been added to the archive<br>`+Required when answering` |
| **code** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Numeric Code of the Currency<br>`+Required when answering` `+Required when creating` |
| **default** | Boolean                                            | `=` `!=` | Is the currency the accounting currency<br>`+Required when answering` `+Read only` |
| **fullName** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Full name of the Currency |
| **id** | UUID                                               | `=` `!=` | Currency ID<br>`+Required when replying` `+Read only` |
| **indirect** | Boolean                                            | | Sign of the reverse exchange rate of the Currency<br>`+Required when replying` |
| **isoCode** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Letter Code of the Currency<br>`+Required when replying` `+Required when creating` |
| **majorUnit** | Object                                             | | Forms of units of the whole part of the Currency. [Learn more](../dictionaries/#entities-currency-currency-entity-attributes-forms-of-units)<br>`+Required when replying` |
| **margin** | Double                                             | | Mark-up for automatic course update<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Currency Metadata<br>`+Required when replying` |
| **minorUnit** | Object                                             | | Forms of units of the fractional part of the Currency. [Learn more](../dictionaries/#entities-currency-currency-entity-attributes-forms-of-units)<br>`+Required when replying` |
| **multiplicity** | Int                                                | `=` `!=` `<` `>` `<=` `>=` | Multiplicity of the exchange rate<br>`+Required when replying` |
| **name** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Brief name of the currency <br>`+Required when replying` `+Required when creating` |
| **rate** | Double                                             | | Exchange rate<br>`+Required when replying` |
| **rateUpdateType** | String(255)                                        | | How to update the exchange rate. **auto** or **manual**<br>`+Required when replying` `+Read Only` |
| **system** | Boolean                                            | | Is the currency based on the system reference currency<br>`+Read Only` |

##### Forms of units

The **majorUnit** and **minorUnit** fields contain the following attributes:

| Attribute | Description |
| ---------- | --------- |
| **gender** | The grammatical gender of the currency unit (valid values are `masculine` - masculine, `feminine` - feminine) |
| **s1** | The form of the unit used in the numeral 1|
| **s2** | The form of the unit used in the numeral 2 |
| **s5** | The form of the unit used in the numeral 5 |

In the JSON API, currencies are mostly represented as part of entities in the [Metadata](../#kladana-json-api-general-info-metadata) format. In order to expand them as part of another object, you need to use the [expand parameter](../#kladana-json-api-general-info-replacing-links-with-objects-using-expand)

### Get Currencies

The result of a successful request is a JSON representation of a list of currencies with the listed fields:

| Field | Description |
| ------ | ---------- |
| **meta** | [Metadata](../#kladana-json-api-general-info-metadata) issuance |
| **context** | [Metadata](../#kladana-json-api-general-info-metadata) about the person who made the request |
| **rows** | Array of JSON objects representing [currencies](../dictionaries/#entities-currency) |

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |


> Request for a list of all currencies on this account.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/currency/"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of Currencies.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/currency",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
     "type": "currency",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#currency/edit?id=6314188d-2c7f-11e6-8a84-bae500000055"
       },
       "id": "6314188d-2c7f-11e6-8a84-bae500000055",
       "system": false,
       "name": "rub",
       "fullName": "Ruble",
       "rate": 1.0,
       "multiplicity": 1,
       "indirect": false,
       "rateUpdateType": "manual",
       "code": "643",
       "isoCode": "RUB",
       "majorUnit": {
         "gender": "masculine",
         "s1": "ruble",
         "s2": "ruble",
         "s5": "rubles"
       },
       "minorUnit": {
         "gender": "feminine",
         "s1": "penny",
         "s2": "penny",
         "s5": "kopecks"
       },
       "archived": false,
       "default": true
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/dc5f76ae-2c89-11e6-8a84-bae50000003f",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#currency/edit?id=dc5f76ae-2c89-11e6-8a84-bae50000003f"
       },
       "id": "dc5f76ae-2c89-11e6-8a84-bae50000003f",
       "system": true,
       "name": "dollar",
       "fullName": "US Dollar",
       "rate": 63.0,
       "multiplicity": 1,
       "indirect": false,
       "rateUpdateType": "manual",
       "code": "840",
       "isoCode": "USD",
       "majorUnit": {
         "gender": "masculine",
         "s1": "dollar",
         "s2": "dollar",
         "s5": "dollars"
       },
       "minorUnit": {
         "gender": "masculine",
         "s1": "cent",
         "s2": "cent",
         "s5": "cents"
       },
       "archived": false,
       "default": false
     }
   ]
}
```

### Create a new Currency

Required fields for currency creation: **name**, **code** and **isoCode**.
You cannot specify a currency rate (**rate**) equal to zero in the request body.

> Request to create a new currency.

```shell
curl -X POST
   https://api.kladana.com/api/remap/1.2/entity/currency/
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H 'Content-Type: application/json'
   -d '{
   "name": "dollar",
   "rate": 63,
   "code": "840",
   "isoCode": "USD"
}
'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Currency.

```json
{
     "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/dc5f76ae-2c89-11e6-8a84-bae50000003f",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#currency/edit?id=dc5f76ae-2c89-11e6-8a84-bae50000003f"
     },
     "id": "dc5f76ae-2c89-11e6-8a84-bae50000003f",
     "system": false,
     "name": "dollar",
     "rate": 63.0,
     "multiplicity": 1,
     "indirect": false,
     "rateUpdateType": "manual",
     "code": "840",
     "isoCode": "USD",
     "majorUnit": {
         "gender": "masculine"
     },
     "minorUnit": {
         "gender": "masculine"
     },
     "archived": false,
     "default": false
}
```

### Create system currency

A system currency is a currency for which Kladana already has all the parameters and the ability to automatically update the rate.
To add a system currency, you should specify **system**=**true** and one of the **code** or **isoCode** parameters.
Additionally, you can specify **rateUpdateType** and **margin**.

> Request to create a system currency with automatic updating of the rate by ISO code.

```shell
curl -X POST
   https://api.kladana.com/api/remap/1.2/entity/currency/
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H 'Content-Type: application/json'
   -d '{
   "system": true,
   "isoCode": "EUR"
}
'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Currency.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/currency/03f1855b-43d7-11ec-ac13-000400000050",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
     "type": "currency",
     "mediaType": "application/json",
     "uuidHref": "http://app.kladana.com/app/#currency/edit?id=03f1855b-43d7-11ec-ac13-000400000050"
   },
   "id": "03f1855b-43d7-11ec-ac13-000400000050",
   "system": true,
   "name": "euro",
   "fullName": "Euro",
   "rate": 1.0,
   "multiplicity": 1,
   "indirect": false,
   "rateUpdateType": "auto",
   "code": "978",
   "isoCode": "EUR",
   "majorUnit": {
     "gender": "masculine",
     "s1": "euro",
     "s2": "euro",
     "s5": "euro"
   },
   "minorUnit": {
     "gender": "masculine",
     "s1": "cent",
     "s2": "cent",
     "s5": "cents"
   },
   "archived": false,
   "default": false
}
```

> Request to create a system currency with manual update of the exchange rate by digital code.

```shell
curl -X POST
   https://api.kladana.com/api/remap/1.2/entity/currency/
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H 'Content-Type: application/json'
   -d '{
   "system": true,
   "code": "978",
   "rateUpdateType": "manual"
}
'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Currency.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/currency/03f1855b-43d7-11ec-ac13-000400000050",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
     "type": "currency",
     "mediaType": "application/json",
     "uuidHref": "http://app.kladana.com/app/#currency/edit?id=03f1855b-43d7-11ec-ac13-000400000050"
   },
   "id": "03f1855b-43d7-11ec-ac13-000400000050",
   "system": true,
   "name": "euro",
   "fullName": "Euro",
   "rate": 1.0,
   "multiplicity": 1,
   "indirect": false,
   "rateUpdateType": "manual",
   "code": "978",
   "isoCode": "EUR",
   "majorUnit": {
     "gender": "masculine",
     "s1": "euro",
     "s2": "euro",
     "s5": "euro"
   },
   "minorUnit": {
     "gender": "masculine",
     "s1": "cent",
     "s2": "cent",
     "s5": "cents"
   },
   "archived": false,
   "default": false
}
```

### Bulk creation and updating of Currencies
[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects)
In the body of the request, you need to pass an array containing the JSON representation of the Currencies that you want to create or update.
Updated Currencies must contain the identifier in the form of metadata.

> Bulk creation and update of Currencies

```shell
curl -X POST
   https://api.kladana.com/api/remap/1.2/entity/currency/
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H 'Content-Type: application/json'
   -d'[
   {
     "name": "dollar",
     "rate": 63,
     "code": "840",
     "isoCode": "USD"
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/currency/dc5f76ae-2c89-11e6-8a84-bae50000003f",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
       "type": "currency",
       "mediaType": "application/json"
     },
     "name": "dollar",
     "rate": 66,
     "code": "dollarusd",
     "isoCode": "USD"
   }
]
'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Currencies.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/currency/dc5f76ae-2c89-11e6-8a84-bae50000003f",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
       "type": "currency",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#currency/edit?id=dc5f76ae-2c89-11e6-8a84-bae50000003f"
     },
     "id": "dc5f76ae-2c89-11e6-8a84-bae50000003f",
     "system": false,
     "name": "dollar",
     "rate": 63.0,
     "multiplicity": 1,
     "indirect": false,
     "rateUpdateType": "manual",
     "code": "840",
     "isoCode": "USD",
     "majorUnit": {
       "gender": "masculine"
     },
     "minorUnit": {
       "gender": "masculine"
     },
     "archived": false,
     "default": false
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/currency/dc5f76ae-2c89-11e6-8a84-bae50000003f",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
       "type": "currency",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#currency/edit?id=dc5f76ae-2c89-11e6-8a84-bae50000003f"
     },
     "id": "dc5f76ae-2c89-11e6-8a84-bae50000003f",
     "system": false,
     "name": "dollar",
     "rate": 66.0,
     "multiplicity": 1,
     "indirect": false,
     "rateUpdateType": "manual",
     "code": "dollarusd",
     "isoCode": "USD",
     "majorUnit": {
       "gender": "masculine"
     },
     "minorUnit": {
       "gender": "masculine"
     },
     "archived": false,
     "default": false
   }
]
```

### Delete Currency
Request to delete the Currency with the specified id. The accounting currency cannot be deleted.

**Parameters**

| Parameter | Description |
| -------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - Currency ID |

> Request to delete a Currency

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/currency/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of Currency

### Bulk deletion of Currencies

In the body of the request, you need to pass an array containing the JSON metadata of the Currencies that you want to remove.


> Request for bulk deletion of Currencies

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/currency/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/currency/7944ef04-f831-11e5-7a69-971500188b1",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                  "type": "currency",
                  "mediaType": "application/json"
              }
          },
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/currency/7944ef04-f831-11e5-7a69-971500188b2",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                  "type": "currency",
                  "mediaType": "application/json"
              }
          }
      ]'
```

> Successful request. The result is JSON information about deleting Currencies.

```json
[
   {
     "info":"Entity 'currency' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'currency' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Currency
#### Get Currency

**Parameters**

| Parameter | Description |
| -------- | ---------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - Currency ID |

> Get Currency

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/currency/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the requested Currency.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
     "type": "currency",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#currency/edit?id=6314188d-2c7f-11e6-8a84-bae500000055"
   },
   "id": "6314188d-2c7f-11e6-8a84-bae500000055",
   "system": false,
   "name": "rub",
   "fullName": "Ruble",
   "rate": 1.0,
   "multiplicity": 1,
   "indirect": false,
   "rateUpdateType": "manual",
   "code": "643",
   "isoCode": "RUB",
   "majorUnit": {
     "gender": "masculine",
     "s1": "ruble",
     "s2": "ruble",
     "s5": "rubles"
   },
   "minorUnit": {
     "gender": "feminine",
     "s1": "penny",
     "s2": "penny",
     "s5": "kopecks"
   },
   "archived": false,
   "default": true
}
```

### Change Currency
Request to update an existing currency.
In the body of the request, you cannot specify the exchange rate (**rate**) equal to zero,
  as well as empty fields **name**, **code**, **isoCode**.
You cannot change the values of the fields **name**, **fullName**, **code**, **isoCode**, **majorUnit**, **minorUnit**
for currencies based on the system currency directory. You can't change the exchange rate you're accounting. You cannot change the exchange rate with automatic updating.

**Parameters**

| Parameter | Description|
| -------- | -------|
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - Currency ID |

> Change Currency

```shell
curl -X PUT
   "https://api.kladana.com/api/remap/1.2/entity/currency/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -d '{
   "name": "dollar",
   "rate": 66,
   "code": "dollarusd",
   "isoCode": "USD"
}'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Currency.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/currency/dc5f76ae-2c89-11e6-8a84-bae50000003f",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
     "type": "currency",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.com/app/#currency/edit?id=dc5f76ae-2c89-11e6-8a84-bae50000003f"
   },
   "id": "dc5f76ae-2c89-11e6-8a84-bae50000003f",
   "system": false,
   "name": "dollar",
   "rate": 66.0,
   "multiplicity": 1,
   "indirect": false,
   "rateUpdateType": "manual",
   "code": "dollarusd",
   "isoCode": "USD",
   "majorUnit": {
     "gender": "masculine"
   },
   "minorUnit": {
     "gender": "masculine"
   },
   "archived": false,
   "default": false
}
```
