## Sorting

Most of the collections returned by the JSON API are sortable.
Sorting is supported for the following field types:

* numeric,
* string,
* date-time,
* logical,
* uuid.

### Available fields for sorting

Depending on the called endpoint, the sorted fields may differ.
The tables below show the sortable fields of directories and documents.

| Endpoint (directories)                                                       | Sortable fields                                                                                                                                                                                   |
|------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <a href="../dictionaries/#entities-counterparty">Account</a>                 | `id`, `version`, `updated`, `updatedBy`, `name`, `description`, `code`, `externalCode`, `archived`, `created`, `phone`, `email`, `fax`                                                            |
| <a href="../dictionaries/#entities-assortment">Assortment</a>                | `name`, `code`                                                                                                                                                                                    |
| <a href="../dictionaries/#entities-bills-of-materials">Bill of Materials</a> | `id`, `syncId`, `version`, `updated`, `updatedBy`, `name`, `description`, `externalCode`                                                                                                          |
| <a href="../dictionaries/#entities-currency">Currency</a>                    | `id`, `name`, `archived`, `default`, `fullname`, `code`, `isoCode`, `multiplicity`                                                                                                                |
| <a href="../dictionaries/#entities-product">Product</a>                      | `id`, `version`, `updated`, `updatedBy`, `name`, `code`, `externalCode`, `archived`, `pathName`, `isSerialTrackable`, `weighed`, `weight`, `volume`, `syncId`                                     |
| <a href="../dictionaries/#entities-service">Service</a>                      | `id`, `version`, `updated`, `updatedBy`, `name`, `code`, `externalCode`, `archived`, `pathName`, `syncId`                                                                                         |
| <a href="../dictionaries/#entities-bundle">Bundle</a>                        | `id`, `version`, `updated`, `updatedBy`, `name`, `description`, `code`, `externalCode`, `archived`, `pathName`, `article`, `weight`, `volume`, `syncId`                                           |
| <a href="../dictionaries/#entities-product-variant">Product variant</a>              | `id`,`version`, `updated`,`updatedBy`, `name`, `description`, `code`, `externalCode`                                                                                                              |
| <a href="../dictionaries/#entities-product-group">Product group</a>          | `id`, `version`, `updated`, `updatedBy`, `name`, `externalCode`, ` archived`, `pathName`                                                                                                          |
| <a href="../dictionaries/#entities-batch">Batch</a>                        | `id`,`version`, `updated`,`updatedBy`, `name`, `description`, `code`, `externalCode`                                                                                                              |
| <a href="../dictionaries/#entities-contract">Contract</a>                    | `id`, `version`, `updated`, `updatedBy`, `name`, `description`, `code`, `externalCode`, `archived`, `moment`                                                                                      |
| <a href="../dictionaries/#entities-project">Project</a>                      | `id`,`version`, `updated`,`updatedBy`, `name`, `code`,`externalCode`, `archived`                                                                                                                  |
| <a href="../dictionaries/#entities-expense-item">Expense item</a>            | `id`,`version`, `updated`,`updatedBy`, `name`, `description` , `code`,`externalCode`                                                                                                              |
| <a href="../dictionaries/#entities-country">Country</a>                      | `id`,`version`, `updated`,`updatedBy`, `name`, `description`, `code`, `externalCode`                                                                                                              |
| <a href="../dictionaries/#entities-department">Department</a>                | `id`                                                                                                                                                                                              |
| <a href="../dictionaries/#entities-unit-of-measure">Unit</a>                 | `id`, `version`, `updated`, `name`, `description`, `code`, ` externalCode`                                                                                                                        |
| <a href="../dictionaries/#entities-employee">Employee</a>                    | `id`, `version`, `updated`, `updatedBy`, `name`, `description`, `externalCode`, `archived`,`email`,`phone`,`lastname`, `firstname`, `middlename`, `uid`                                           |
| <a href="../dictionaries/#entities-warehouse">Warehouse</a>                  | `id`,`version`, `updated`,`updatedBy`, `name`, `description`, `code`, `externalCode`, `address`, `archived`, `pathName`                                                                           |
| <a href="../dictionaries/#entities-entity">Legal entity</a>                  | `id`,`version`, `updated`,`updatedBy`, `name`, `description`, `code`, `externalCode`, `archived`, `created`, `inn`, `actualAddress`, `legalTitle`, `legalAddress`, `kpp`, `phone`, `email`, `fax` |
| <a href="../dictionaries/#entities-task">Task</a>                            | `id`, `created`, `version`, `updated`, `description`, `dueToDate`, `done`                                                                                                                         |

| Endpoint (transactions) | Sortable fields |
|-----------|---------|
| <a href="../documents/#transactions-stock-adjustment">Stock Adjustment</a>|`id`, `syncId`,`version`, `updated`,`updatedBy`,`name`, `description`, `externalCode`,`moment`, `applicable`,`sum`, `created` |
| <a href="../documents/#transactions-sales-order">Sales Order</a>|`id`, `syncId`,`version`, `updated`,`updatedBy`,`name`, ` description`, `externalCode`,`moment`, `applicable`,`sum`, `created`, `deliveryPlannedMoment`|
| <a href="../documents/#transactions-purchase-order">Purchase Order</a>|`id`, `syncId`,`version`, `updated`,`updatedBy`,`name`, `description`, `externalCode`,`moment`, `applicable`,`sum`, `created`, `deliveryPlannedMoment`|
| <a href="../documents/#transactions-sales-invoice">Sales Invoice</a>|`id`, `syncId`, `version`, `updated`, `updatedBy`, `name`, ` description`, `externalCode`, `moment`, `applicable`, `sum`, `created`, `paymentPlannedMoment` |
| <a href="../documents/#transactions-supplier-invoice">Supplier Invoice</a>|`id`, `syncId`,`version`, `updated`,`updatedBy`, `name`, ` description`, `externalCode`,`moment`, `applicable`, `sum`, `created`, `incomingNumber`, `incomingDate`, `paymentPlannedMoment` |
| <a href="../documents/#transactions-incoming-payment">Incoming payment</a>|`id`, `syncId`,`version`, `updated`,`updatedBy`, `name`, ` description`, `externalCode`,`moment`, `applicable`, `sum`, `created`, `paymentPurpose`, `incomingNumber`, `incomingDate` |
| <a href="../documents/#transactions-outgoing-payment">Outgoing payment</a>|`id`, `syncId`,`version`, `updated`,`updatedBy`, `name`, ` description`, `externalCode`,`moment`, `applicable`, `sum`, `created`, `paymentPurpose` |
| <a href="../documents/#transactions-incoming-cash-payment">Incoming Cash Payment</a>|`id`, `syncId`,`version`, `updated`,`updatedBy`, `name`, ` description`, `externalCode`,`moment`, `applicable`, `sum`, `created`, `paymentPurpose` |
| <a href="../documents/#transactions-outgoing-cash-payment">Outgoing Cash Payment</a>|`id`, `syncId`,`version`, `updated`,`updatedBy`, `name`, ` description`, `externalCode`,`moment`, `applicable`, `sum`, `created`, `paymentPurpose` |
| <a href="../documents/#transactions-shipment">Shipment</a>|`id`, `syncId`,`version`, `updated`,`updatedBy`, `name`, `description`, `externalCode`,`moment`, `applicable`, `sum`, `created` |
| <a href="../documents/#transactions-receiving">Receiving</a>|`id`, `syncId`,`version`, `updated`,`updatedBy`, `name`, `description`, `externalCode`,`moment`, `applicable`, `sum`, `created` |
| <a href="../documents/#transactions-write-off">Write-off</a>|`id`, `syncId`,`version`, `updated`,`updatedBy`, `name`, `description`, `externalCode`,`moment`, `applicable`, `sum`, `created` |
| <a href="../documents/#transactions-transfer">Transfer</a>|`id`, `syncId`,`version`, `updated`,`updatedBy`, `name`, `description`, `externalCode`,`moment`, `applicable`, `sum`, `created` |
| <a href="../documents/#transactions-sales-return">Sales Return</a>|`id`, `syncId`,`version`, `updated`,`updatedBy`, `name`, ` description`, `externalCode`,`moment`, `applicable`, `sum`, `created` |
| <a href="../documents/#transactions-purchase-returns">Purchase Return</a>|`id`, `syncId`,`version`, `updated`,`updatedBy`, `name`, ` description`, `externalCode`,`moment`, `applicable`, `sum`, `created` |
| <a href="../documents/#transactions-inventory-count">Inventory Count</a>|`id`, `syncId`,`version`, `updated`,`updatedBy`, `name`, `description`, `externalCode`,`moment`, `applicable`, `sum`, `created` |
| <a href="../documents/#transactions-production-order">Production Order</a>|`id`, `syncId`,`version`, `updated`,`updatedBy`, `name`, `description`, ` externalCode`,`moment`, `applicable`, `sum`, `created`, `deliveryPlannedMoment`, `quantity`|
| <a href="../documents/#transactions-internal-order">Internal Order</a>|`id`, `syncId`,`version`, `updated`,`updatedBy`, `name`, ` description`, `externalCode`,`moment`, `applicable`, `sum`, `created`, `quantity` |

### How to use sorting via JSON API

To apply sorting to a collection, add `order=[field name],[asc/desc]` to the query, where field name is the name of the field to sort. Optionally, you can specify the sort direction separated by commas:

* `asc` - ascending, default value,
* `desc` - descending.

For example, to sort the `name` field in ascending order, use `?order=name, asc` or `?order=name`, and in descending order `?order=name,desc`.

Sorting is also available for several fields at the same time, fields for sorting must be specified through the separator `;`.
For example, `?order=name,asc;code,desc`.

Consider the use of sorting.
Let's first create products with different names that can start with Latin, Cyrillic, numbers or special characters.

> Request

```shell
curl -X POST
https://api.kladana.com/api/remap/1.2/entity/product
  -H 'Authorization: Bearer <Access-Token>'
  -H "Accept-Encoding: gzip"
  -H 'Cache-Control: no-cache' 
  -H 'Content-Type: application/json' 
  -d '[
     {
      "name":"12345",
      "weight":0.1,
      "weighed":true,
      "syncId":"8b7c97cf-cf77-4f7e-b200-d264125578ab"
     },
     {
      "name":"Pencil",
      "weight":0.01,
      "syncId":"5b7c97cf-cf77-4f7e-b200-d264125578ab"
     },
     {
      "name":"Pencil 123",
      "weight":0.01,
      "syncId":"3b7c97cf-cf77-4f7e-b200-d264125578ab"
     },
     {
      "name":"Pencil Blue",
      "weight":0.11,
      "weighed":true
     },
     {
      "name":"Pencil Red",
      "weight":0.2,
      "syncId":"1b7c97cf-cf77-4f7e-b200-d264125578ab"
     },
     {
      "name":"!!! Pencil",
      "weight":0.1,
      "syncId":"2b7c97cf-cf77-4f7e-b200-d264125578ab"
     },
     {
      "name":"Pencil 123",
      "weight":0.32,
      "syncId":"4b7c97cf-cf77-4f7e-b200-d264125578ab"
     },
     {
      "name":"Pencil yellow",
      "weight":0.12,
      "weighed":true,
      "syncId":"7b7c97cf-cf77-4f7e-b200-d264125578ab"
     },
     {
      "name":"Pencil green",
      "weight":0.4,
      "syncId":"8c7c97cf-cf77-4f7e-b200-d264125578ab"
     },
     {
      "name":"!!! This is a pencil",
      "weight":0.1,
      "syncId":"3d7c97cf-cf77-4f7e-b200-d264125578ab"
     }
  ]'
```

To get a collection of products sorted by name, you must specify the `name` field and sort direction, as in the example below.

> Request

```shell
curl -X GET
'https://api.kladana.com/api/remap/1.2/entity/product?order=name'
-H 'Authorization: Bearer <Access-Token>'
-H "Accept-Encoding: gzip"
-H 'Cache-Control: no-cache'
```
The response will contain the following ascending order:

| name |
| ---- |
| 12345 |
| pencil |
| Pencil 123 |
| Pencil Blue |
| Pencil Red |
| Pencil |
| Pencil 123 |
| Yellow pencil |
| Green pencil |
| !!! This is a pencil |

Change the sort direction

> Request

```shell
curl -X GET
'https://api.kladana.com/api/remap/1.2/entity/product?order=name,desc'
-H 'Authorization: Bearer <Access-Token>'
-H "Accept-Encoding: gzip"
-H 'Cache-Control: no-cache'
```

|name|
|-----|
| !!! This is a pencil |
| Green pencil |
| Yellow pencil |
| Pencil 123 |
| !!! Pencil |
| Pencil Red |
| Pencil Blue |
| Pencil 123 |
| Pencil |
| 12345 |

Let's try to sort products simultaneously in descending order of the `weighed` logical field and in ascending order of the `name` field.

> Request

```shell
curl -X GET
'https://api.kladana.com/api/remap/1.2/entity/product?order=weighed,desc;name'
-H 'Authorization: Bearer <Access-Token>'
-H "Accept-Encoding: gzip"
-H 'Cache-Control: no-cache'
-H 'Content-Type: application/json'
```

| weighted | name |
| -------- | ---- |
| true | 12345 |
| true | Pencil Blue |
| true | Pencil Yellow |
| false | Pencil |
| false | Pencil 123 |
| false | Pencil Red |
| false | !!! Pencil |
| false | Pencil 123 |
| false | Pencil Green |
| false | !!! This is a pencil |

Let's add sorting by the `weight` numeric field.

> Request

```shell
curl -X GET
'https://api.kladana.com/api/remap/1.2/entity/product?order=weighed,desc;weight,desc;name'
-H 'Authorization: Bearer <Access-Token>'
-H "Accept-Encoding: gzip"
-H 'Cache-Control: no-cache'
-H 'Content-Type: application/json'
```

| weighted | weight | name |
| -------- | ------ | ---- |
|true|0.12| Pencil Yellow |
|true|0.11| Pencil Blue |
|true|0.1| 12345 |
|false|0.4| Pencil Green |
|false|0.32| Pencil 123 |
|false|0.2| Pencil Red |
|false|0.1| !!! Pencil |
|false|0.1| !!! This is a pencil |
|false|0.01| Pencil |
|false|0.01| Pencil 123 |

In addition to text, numeric and boolean fields, sorting by fields of uuid and date-time types is available. For example, let's sort by the `syncId` field.

> Request

```shell
curl -X GET
'https://api.kladana.com/api/remap/1.2/entity/product?order=syncId'
-H 'Authorization: Bearer <Access-Token>'
-H "Accept-Encoding: gzip"
-H 'Cache-Control: no-cache'
-H 'Content-Type: application/json'
```

| syncId | name |
| ------ | ---- |
| 1b7c97cf-cf77-4f7e-b200-d264125578ab | Pencil Red |
| 2b7c97cf-cf77-4f7e-b200-d264125578ab | !!! Pencil |
| 3b7c97cf-cf77-4f7e-b200-d264125578ab | Pencil 123 |
| 3d7c97cf-cf77-4f7e-b200-d264125578ab | !!! This is a pencil |
| 4b7c97cf-cf77-4f7e-b200-d264125578ab | Pencil 123 |
| 5b7c97cf-cf77-4f7e-b200-d264125578ab | Pencil |
| 7b7c97cf-cf77-4f7e-b200-d264125578ab | Pencil Yellow |
| 8b7c97cf-cf77-4f7e-b200-d264125578ab | 12345 |
| 8c7c97cf-cf77-4f7e-b200-d264125578ab | Pencil Green |
| null | Pencil Blue |

The product `Pencil Blue` does not have a field value, so when sorting in ascending order, it is displayed at the end. Similar behavior for other fields with the value `null`.
