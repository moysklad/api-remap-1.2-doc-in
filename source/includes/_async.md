## Asynchronous exchange

With the JSON API, it is possible to execute some queries asynchronously. This allows you to upload large collections,
without resorting to paging if real-time work is not critical.

Asynchronous exchange is not supported for all requests. List of requests that can be executed asynchronously:

+ [Stock Report](reports/#reports-stock-report)
+ [Profit Report](reports/#reports-profit-report)
+ [Report Money](reports/#reports-money-report)
+ [Sales and Orders Report](reports/#reports-sales-and-orders-indicators)
+ [Report Counterparties indicators](reports/#reports-report-indicators-of-counterparties) (except [selected indicators](reports/#reports-report-indicators-of-counterparties-selected-indicators-of-counterparties))
+ [Report Metrics](reports/#reports-indicators)
+ [Getting a list of Counterparties](dictionaries/#entities-counterparty-get-a-list-of-counterparties)
+ [Get Assortment](dictionaries/#entities-assortment)

After executing a query in asynchronous mode, the result is available within 1 hour.

There are [limits](#kladana-json-api-limitations) on the number of tasks in the queue and the number of simultaneously executing asynchronous tasks.

At the moment, in the process of asynchronous query execution, duplicates of item collection may occur,
if new elements are added in parallel with the preparation of the result.
In addition, elements may be missing if, in parallel with the processing of an Asynchronous task, the entities associated with the task are deleted.
(for example, deletion of an item during the preparation of the Inventory Report).

### Execute request in asynchronous mode

> Sample request to create an Asynchronous task

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/report/stock/bystore?async=true"
  -H "Authorization: Bearer <Access-Token>"
  -H "Accept-Encoding: gzip"
```

> Response 202
Successful creation of an Asynchronous Task

```shell
Location: https://api.kladana.com/api/remap/1.2/async/498b8673-0308-11e6-9464-e4de00000089/result
Content-Location: https://api.kladana.com/api/remap/1.2/async/498b8673-0308-11e6-9464-e4de00000089
```

To execute a request in asynchronous mode, you need to specify `async=true` in the query string parameters.
Specifying the **offset** and **limit** query string options that are specific to synchronous queries is an error.

**Parameters**

| Parameter | Description |
| ---------|---------|
| **async** | `boolean`<br>`true` - an Asynchronous task will be created.<br>`false` (default) - the request will be executed in synchronous mode |

The result of the request execution will be the creation of an Asynchronous Task, which will be placed in the queue. The response will contain headers containing the URL of the task's status and result.

| Parameter | Description |
| -------------------- | -------------------------------------------------- |
| **Location** | The URL of the result of the execution of the Asynchronous Task. |
| **Content-Location** | Status URL of the Asynchronous Task. |

### Asynchronous task

An asynchronous task contains information about the creator of the task, its current status, the presence of a response, and other information.

#### Entity attributes

| Title | Type | Description |
| ---------|------| ----------|
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Read Only` |
| **deletionDate** | DateTime | The date after which the result of the task will become unavailable. Contained in the response if the **state** field is set to `DONE`<br>`+Read Only` |
| **errors** | Object | json api error if **state** field is set to `API_ERROR`<br>`+Read Only` |
| **id** | UUID | Asynchronous Task ID<br>`+Required for response` `+Read Only` |
| **meta** | [Meta](#kladana-json-api-general-info-metadata) | Asynchronous Task Metadata<br>`+Required for response` |
| **owner** | [Meta](#kladana-json-api-general-info-metadata) | The user or application that created the Asynchronous Task<br>`+Read Only` |
| **request** | String | The URL of the request that created the Asynchronous Task<br>`+Required for response` `+Read Only` |
| **resultUrl** | String | Link to the task result. Contained in the response if the **state** field is set to `DONE`<br>`+Read Only` |
| **state** | Enum | The execution status of the Asynchronous Task. [Learn more](#kladana-json-api-asynchronous-exchange-asynchronous-task-entity-attributes-asynchronous-task-execution-status)<br>`+Required when replying` `+Read only` |

##### Asynchronous task execution status

| Meaning | Description |
| ---------------- | ------------ |
| **PENDING** | The task is in the queue |
| **PROCESSING** | The task is being processed, the result is not ready yet |
| **DONE** | Task completed successfully |
| **ERROR** | The task was not completed due to an internal error. In this case, you should try to run the task again |
| **CANCEL** | The task has been canceled |
| **API_ERROR** | The task was completed with an api error |

### Statuses of Asynchronous Tasks

> Example of a request to get a list of statuses of Asynchronous tasks

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/async/"
  -H "Authorization: Bearer <Access-Token>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the list of Asynchronous Task statuses.

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
    "href": "https://api.kladana.com/api/remap/1.2/async",
    "type": "async",
    "mediaType": "application/json",
    "size": 2,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/async/1f26ca08-a293-11eb-ac12-000a00000000",
        "type": "async",
        "mediaType": "application/json"
      },
      "id": "1f26ca08-a293-11eb-ac12-000a00000000",
      "accountId": "4f811ce5-983a-11eb-0a80-1d0d00000002",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/application/e715fb95-983a-11eb-0a80-321a00000004",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/application/metadata",
          "type": "application",
          "mediaType": "application/json"
        }
      },
      "state": "PROCESSING",
      "request": "https://api.kladana.com/api/remap/1.2/report/stock/bystore?async=true"
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/async/b3ff426e-a291-11eb-ac12-000a00000000",
        "type": "async",
        "mediaType": "application/json"
      },
      "id": "b3ff426e-a291-11eb-ac12-000a00000000",
      "accountId": "4f811ce5-983a-11eb-0a80-1d0d00000002",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/acc59092-a291-11eb-ac12-000d00000014",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=acc59092-a291-11eb-ac12-000d00000014"
        }
      },
      "state": "DONE",
      "request": "https://api.kladana.com/api/remap/1.2/report/stock/bystore?async=true",
      "resultUrl": "https://api.kladana.com/api/remap/1.2/async/b3ff426e-a291-11eb-ac12-000a00000000/result",
      "deletionDate": "2021-04-21 15:07:05.996"
    }
  ]
}
```

Request to get a list of execution statuses of an Asynchronous task.
The result contains the statuses of the Asynchronous Tasks for the last week.

Filtering by **state**, **request**, **deletionDate** fields is available.

### Getting the status of an Asynchronous Task

> Example of a request to get the status of an Asynchronous task

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/async/498b8673-0308-11e6-9464-e4de00000089"
  -H "Authorization: Bearer <Access-Token>"
  -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the execution status of the Asynchronous Task.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/async/498b8673-0308-11e6-9464-e4de00000089",
    "type": "async",
    "mediaType": "application/json"
  },
  "id": "498b8673-0308-11e6-9464-e4de00000089",
  "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
  "owner": {
      "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/98fa7086-8aa1-11e8-7210-075e0000002c",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=98fa7086-8aa1-11e8-7210-075e0000002c"
      }
  },
  "state" : "DONE",
  "request": "https://api.kladana.com/api/remap/1.2/report/stock/bystore?async=true",
  "resultUrl": "https://api.kladana.com/api/remap/1.2/async/f97aa1fb-2e58-11e6-8a84-bae500000002/result",
  "deletionDate": "2021-02-16 16:21:09" 
}
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the execution status of the Asynchronous Task with the API_ERROR status.

```json
{
  "id": "498b8673-0308-11e6-9464-e4de00000089",
  "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
  "owner": {
      "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/98fa7086-8aa1-11e8-7210-075e0000002c",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=98fa7086-8aa1-11e8-7210-075e0000002c"
      }
  },
  "state" : "API_ERROR",
  "request": "https://api.kladana.com/api/remap/1.2/report/sales/plotseries?momentFrom=2018-09-06&interval=hour&async=true",
  "errors": [
      {
          "error": "Error: A required parameter for the metrics request was not specified: momentTo.",
          "code": 39000
      }
  ]
}
```

Request to get the execution status of an Asynchronous task.

**Parameters**

| Parameter | Description|
| ------- | -------- |
| **id** | `string` (required) *Example: 498b8673-0308-11e6-9464-e4de00000089* Asynchronous task id. |

### Getting the result of an Asynchronous task execution

> Example of a request to get the result of an Asynchronous task

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/async/498b8673-0308-11e6-9464-e4de00000089/result"
  -H "Authorization: Bearer <Access-Token>"
  -H "Accept-Encoding: gzip"
```

> Response 200. Successful request. The result is a file with the result of the execution of the Asynchronous task in json format. 

```json
{
  "context": {
      "employee": {
        "href": "https://api.kladana.com/api/remap/1.2/context/employee",
        "type": "employee",
        "mediaType": "application/json"
      },
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/report/stock/bystore?async=true",
      "type": "stockbystore",
      "mediaType": "application/json",
      "size": 2
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
            "name": "Not main warehouse",
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
      }
    ]
  }
}
```


A request to receive the result of an Asynchronous task execution.

**Parameters**

| Parameter | Description|
| ------- | --------- |
| **id** | `string` (required) *Example: 498b8673-0308-11e6-9464-e4de00000089* Asynchronous task id. |

If the status of the task is `DONE` and the result has not expired, the response to the request will be a redirect to the download link of the result of the execution of the Asynchronous Task.
The link is valid for 5 minutes from the moment you receive it.
Most HTTP clients do the redirect automatically, but if your client doesn't,
then the result of the request will have the status `302 FOUND` with the header **Location**, which contains a link to the result.
After the date specified in the **deletionDate** field, the result becomes unavailable.

If the task status is set to `API_ERROR`, then the json response to the request to get the result of the task will contain [error](#kladana-json-api-errors),
similar to the one returned by the synchronous resource call.

> An example of a request to get the result of an Asynchronous task with the API_ERROR status

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/async/498b8673-0308-11e6-9464-e4de00000089/result"
  -H "Authorization: Bearer <Access-Token>"
  -H "Accept-Encoding: gzip"
```

> An example of a task result that contains a description of the error
Response 403 Forbidden
 

```json
{
     "errors": [
         {
             "error": "Access Denied: You do not have permission to view this object",
             "code": 1016
         }
     ]
}
```


### Asynchronous Task Webhooks

You can set up [webhooks](dictionaries/#entities-webhooks) for an asynchronous task in the same way as other entities, but there are a number of exceptions:

* for asynchronous tasks, you cannot set up a webhook for the delete event, since asynchronous tasks are automatically deleted
* for asynchronous tasks in webhooks, a new `PROCESSED` event appears. It means that the task has completed and you can find out its status
* the update webhook comes when the status of an asynchronous task changes

When forming a request to create a webhook, the `entityType` field must specify the type `async` - an asynchronous task.

  > An example of a request to create a webhook on the PROCESSED event for an Asynchronous task

```shell
curl -X POST
  "https://api.kladana.com/api/remap/1.2/entity/webhook"
  -H "Authorization: Bearer <Access-Token>"
  -H "Accept-Encoding: gzip"
  -H "Content-Type: application/json"
  -d '{
          "url": "http://some_url.ru",
          "action": "PROCESSED",
          "entityType": "async"
      }'
```

> Response200
> Sample response received

```json
{
    "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/webhook/c6010bf9-a683-11eb-ac12-000900000001",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/webhook/metadata",
        "type": "webhook",
        "mediaType": "application/json"
    },
    "id": "c6010bf9-a683-11eb-ac12-000900000001",
    "accountId": "6c240ac7-a683-11eb-ac12-000c00000000",
    "entityType": "async",
    "url": "http://some_url.ru",
    "method": "POST",
    "enabled": true,
    "action": "PROCESSED"
}
```

When the webhook is triggered, the address specified in the `url` field will receive a message with the url specified in `meta` in the `href` field
to get the status of an asynchronous task.

> Sample webhook result

```json
{
  "events": [
    {
      "meta": {
        "type": "async",
        "href": "https://api.kladana.com/api/remap/1.2/async/91adc76b-a71c-11eb-ac12-000e00000000"
      },
      "action": "PROCESSED",
      "accountId": "6c240ac7-a683-11eb-ac12-000c00000000"
    }
  ]
}
```

### Cancel Asynchronous Task

> Sample Request to Cancel an Asynchronous Task

```shell
curl -X PUT
  "https://api.kladana.com/api/remap/1.2/async/498b8673-0308-11e6-9464-e4de00000089/cancel"
  -H "Authorization: Bearer <Access-Token>"
  -H "Accept-Encoding: gzip"
```

> Response 204
Successful cancellation of the task

A request to cancel a `PENDING` queue or `PROCESSING` Asynchronous task in progress.

**Parameters**

| Parameter | Description |
| ------- | --------------- |
| **id** | `string` (required) *Example: 498b8673-0308-11e6-9464-e4de00000089* Asynchronous task ID. |
