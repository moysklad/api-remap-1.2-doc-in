## Expense item
### Expense items
Using the JSON API, you can request lists of Expense Items and information on individual Expense Items. The entity code for Expense Items in the JSON API is the **expenseitem** keyword.
This entity can be contextually searched using the special `search` parameter. More details can be found at [link](../#kladana-json-api-general-info-context-search). The search with the search parameter differs from others in that the search is not prefixed, without tokenization, and only goes through one field at a time. Searches for strings that include the value of the search string.

The search among the objects of the Items of expenditure for matching the search string will be carried out in the following fields:

+ by name Item of expenditure **name**
+ according to description Expense item **description**

#### Entity attributes
| Title | Type                                               | Filtration | Description |
| ---------------- |----------------------------------------------------| ------- |----------- |
| **accountId** | UUID                                               | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **code** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Code Items of expenditure |
| **description** | String(4096)                                       | `=` `!=` `~` `~=` `=~` | Description Items of expenditure |
| **externalCode** | String(255)                                        | `=` `!=` `~` `~=` `=~` | External code Expense item<br>`+Required when replying` |
| **id** | UUID                                               | `=` `!=` | Country ID<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Expense Item Metadata<br>`+Required when replying` |
| **name** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Name Item of expenses<br>`+Required when replying` `+Required when creating` |
| **updated** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | When the entity was last updated<br>`+Required for response` `+Read-only` |

### Get Expense Items

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
 
> Request for a list of expense items.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/expenseitem"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Expense Items.

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
     "href": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
     "type": "expenseitem",
     "mediaType": "application/json",
     "size": 8,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/1be2350e-0479-11e5-b03a-448a5b426e7e",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
         "type": "expenseitem",
         "mediaType": "application/json"
       },
       "id": "1be2350e-0479-11e5-b03a-448a5b426e7e",
       "updated": "2015-05-27 17:03:10",
       "name": "Procurement of goods",
       "description": "The cost of purchasing goods is accounted for in the Profit and Loss Statement as cost of goods sold",
       "code": "1",
       "externalCode": "1"
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/1be2395a-0479-11e5-baee-448a5b426e7e",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
         "type": "expenseitem",
         "mediaType": "application/json"
       },
       "id": "1be2395a-0479-11e5-baee-448a5b426e7e",
       "updated": "2015-05-27 17:03:10",
       "name": "Return",
       "description": "Return Write-offs are not included in the Profit and Loss statement",
       "code": "3",
       "externalCode": "3"
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/1be23a18-0479-11e5-a260-448a5b426e7e",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
         "type": "expenseitem",
         "mediaType": "application/json"
       },
       "id": "1be23a18-0479-11e5-a260-448a5b426e7e",
       "updated": "2015-05-27 17:03:10",
       "name": "Taxes and Fees",
       "description": "Expenses on taxes and fees are accounted for as a separate item, not included in operating expenses",
       "code": "2",
       "externalCode": "2"
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/23f05a1e-0479-11e5-8bb9-448a5b426e7e",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
         "type": "expenseitem",
         "mediaType": "application/json"
       },
       "id": "23f05a1e-0479-11e5-8bb9-448a5b426e7e",
       "updated": "2015-05-27 17:03:24",
       "name": "Write-offs",
       "description": "Write-offs",
       "code": "4",
       "externalCode": "4"
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/82031d62-2e58-11e6-ab5c-d8cb8a84bae5",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
         "type": "expenseitem",
         "mediaType": "application/json"
       },
       "id": "82031d62-2e58-11e6-ab5c-d8cb8a84bae5",
       "updated": "2016-06-09 18:40:35",
       "name": "Move",
       "description": "Money transfers between cash registers are not included in the Profit and Loss report.",
       "code": "5",
       "externalCode": "5"
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/fb0a4b75-2e58-11e6-8a84-bae500000058",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
         "type": "expenseitem",
         "mediaType": "application/json"
       },
       "id": "fb0a4b75-2e58-11e6-8a84-bae500000058",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "updated": "2016-06-09 18:43:58",
       "name": "Rent",
       "description": "Rent",
       "code": "Rent",
       "externalCode": "IVslr34uhCUuglxPD7Idm0"
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/fb0c8620-2e58-11e6-8a84-bae500000059",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
         "type": "expenseitem",
         "mediaType": "application/json"
       },
       "id": "fb0c8620-2e58-11e6-8a84-bae500000059",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "updated": "2016-06-09 18:43:58",
       "name": "Salary",
       "description": "Salary",
       "code": "Salary",
       "externalCode": "RY7G3TULiTyjqYRrzr3V03"
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/fb0dc966-2e58-11e6-8a84-bae50000005a",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
         "type": "expenseitem",
         "mediaType": "application/json"
       },
       "id": "fb0dc966-2e58-11e6-8a84-bae50000005a",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "updated": "2016-06-09 18:43:58",
       "name": "Marketing and advertising",
       "description": "Marketing and advertising",
       "code": "Marketing and advertising",
       "externalCode": "1PMtKJq-jjVJQbu5OWqBG1"
     }
   ]
}

```

### Create Line Item
Request to create a new expense item. Mandatory field for creating an expense item is **name**.

> An example of a request to create a new expense item.

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/expenseitem"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
                "name": "Taxes and non-taxes",
                "description": "Expense item taxes",
                "code": "tax",
                "externalCode": "wwoaon21431"
            }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated expense item.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/76e88dff-3f9b-11e6-8a84-bae50000009b",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
     "type": "expenseitem",
     "mediaType": "application/json"
   },
   "id": "76e88dff-3f9b-11e6-8a84-bae50000009b",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "updated": "2016-07-01 17:52:42",
   "name": "Taxes and non-taxes",
   "description": "Expense item taxes",
   "code": "tax",
   "externalCode": "wwoaon21431"
}
```

### Bulk creation and updating of Line Items
[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Expenses.
In the body of the request, you must pass an array containing the JSON representation of the Line Items you want to create or update.
Updated Line Items must contain the identifier in the form of metadata.

> Example of creating and updating multiple Line Items

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/expenseitem"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "Taxes and non-taxes",
               "description": "Expense item taxes",
               "code": "tax",
               "externalCode": "wwoaon21431"
             },
             {
               "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/7944ef04-f831-11e5-7a69-971500188b19",
                 "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
                 "type": "expenseitem",
                 "mediaType": "application/json"
               },
               "name": "Additional costs",
               "description": "More additional costs",
               "code": "additional",
               "externalCode": "sdeEfr32rfe"
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Line Items.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/76e88dff-3f9b-11e6-8a84-bae50000009b",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     },
     "id": "76e88dff-3f9b-11e6-8a84-bae50000009b",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "updated": "2016-07-01 17:52:42",
     "name": "Taxes and non-taxes",
     "description": "Expense item taxes",
     "code": "tax",
     "externalCode": "wwoaon21431"
   },
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/7944ef04-f831-11e5-7a69-971500188b19",
       "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
       "type": "expenseitem",
       "mediaType": "application/json"
     },
     "id": "7944ef04-f831-11e5-7a69-971500188b19",
     "accountId": "7944ef04-f831-11e5-7a69-971500188b19",
     "updated": "2016-07-01 17:52:42",
     "name": "Additional costs",
     "description": "More additional costs",
     "code": "additional",
     "externalCode": "sdeEfr32rfe"
   }
]
```

### Delete Line Item

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id of the expense item. |

> Request to delete an Expense Item with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.in/api/remap/1.2/entity/expenseitem/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of an expense item.

### Bulk deletion of Expenses

In the body of the request, you need to pass an array containing the JSON metadata of the Items you want to delete.


> Request for bulk deletion of Line Items.

```shell
curl -X POST
   "https://api.kladana.in/api/remap/1.2/entity/expenseitem/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
          {
              "meta": {
                  "href": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/7944ef04-f831-11e5-7a69-971500188b1",
                  "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
                  "type": "expenseitem",
                  "mediaType": "application/json"
              }
          },
          {
              "meta": {
                  "href": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/7944ef04-f831-11e5-7a69-971500188b2",
                  "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
                  "type": "expenseitem",
                  "mediaType": "application/json"
              }
          }
      ]'
```

> Successful request. Result - JSON information about deleting Expenses.

```json
[
   {
     "info":"Entity 'expenseitem' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'expenseitem' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Expense item

Working with an expense item with the specified id.

### Get Expense Item

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Expense item ID. |


> Request to get an expense item with the specified ID.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/expenseitem/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Expense Items.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/fb0a4b75-2e58-11e6-8a84-bae500000058",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
     "type": "expenseitem",
     "mediaType": "application/json"
   },
   "id": "fb0a4b75-2e58-11e6-8a84-bae500000058",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "updated": "2016-06-09 18:43:58",
   "name": "Rent",
   "description": "Rent",
   "code": "Rent",
   "externalCode": "IVslr34uhCUuglxPD7Idm0"
}
```
        
### Change Line Item
Request to change an existing expense item.
 
**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id of the expense item. |
 
> An example of a request to update an expense item.

```shell
   curl -X PUT
     "https://api.kladana.in/api/remap/1.2/entity/expenseitem/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "Not taxes and taxes",
             "description": "Taxes and non-taxes. Such an article",
             "code": "nalogi net",
             "externalCode": "wwoa1142aon21431"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated expense item.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/76e88dff-3f9b-11e6-8a84-bae50000009b",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/expenseitem/metadata",
     "type": "expenseitem",
     "mediaType": "application/json"
   },
   "id": "76e88dff-3f9b-11e6-8a84-bae50000009b",
   "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
   "updated": "2016-07-01 17:52:42",
   "name": "Not taxes and taxes",
   "description": "Taxes and non-taxes. Description example",
   "code": "nalogi net",
   "externalCode": "wwoa1142aon21431"
}
```
