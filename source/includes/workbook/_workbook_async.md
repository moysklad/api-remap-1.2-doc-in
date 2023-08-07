## Dealing with asynchronous exchange

Asynchronous exchange provides the ability to receive the results of long-running queries asynchronously,
without using multiple paging requests.
In the case of a large amount of unloaded data, the use of asynchronous exchange allows you to get the same result as
spending less time in locks.

You can see the list of requests for which the ability to work in asynchronous mode is implemented in [documentation](../#mojsklad-json-api-asinhronnyj-obmen).

Let's consider the advantage of working with the JSON API in asynchronous mode with some example.
Suppose you need to obtain information on the balance of the entire range in order to replenish the reserves in stores.
With a large number of items and warehouses, it was previously necessary to request a [stock balance report] (../reports/#otchety-otchet-ostatki-poluchit-ostatki-po-skladam)
several times, specifying the **offset** parameter to get reports on all items. Since the construction of large reports takes
some time, up to 5 minutes, collecting all the information can take a long time.
In addition, each individual request forces you to keep the connection open while waiting for the result.

Asynchronous exchange offers a different sequence of actions.

### 1. Create an asynchronous task

> Request to create an Asynchronous task

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/report/stock/bystore?async=true"
   -H "Authorization: Bearer <Access-Token>"
```

> Reply

```shell
no body

Titles:
Location: https://app.kladana.in/api/remap/1.2/async/498b8673-0308-11e6-9464-e4de00000089/result
Content-Location: https://app.kladana.in/api/remap/1.2/async/498b8673-0308-11e6-9464-e4de00000089
```

We make a request for the rest with the `async=true` parameter. The **limit** and **offset** query string parameters do not need to be specified, as the report will be built completely.

The **Location** response header contains a link to get the result of the asynchronous task, and the **Content-Location** header contains a link to get the status of the asynchronous task execution.

While tasks are in progress, creating new asynchronous tasks will be [limited by current limits](../#mojsklad-json-api-obschie-swedeniq-ogranicheniq) per queue
asynchronous tasks and when you repeat the request, you will get error 61002:

`Error creating an asynchronous task: the limit on the number of concurrently executing asynchronous operations has been exceeded.`

### 2. Polling the status of an asynchronous task

> Polling the status of an asynchronous task

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/async/498b8673-0308-11e6-9464-e4de00000089"
   -H "Authorization: Bearer <Access-Token>"
```

> Response when task is in progress

```json
{
   "id": "498b8673-0308-11e6-9464-e4de00000089",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "owner": {
       "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/98fa7086-8aa1-11e8-7210-075e0000002c",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#employee/edit?id=98fa7086-8aa1-11e8-7210-075e0000002c"
       }
   },
   "state" : "PROCESSING",
   "request": "https://app.kladana.in/api/remap/1.2/report/stock/bystore?async=true"
}
```

> Response when the task is ready

```json
{
   "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/async/498b8673-0308-11e6-9464-e4de00000089",
       "type": "async",
       "mediaType": "application/json"
   },
   "id": "498b8673-0308-11e6-9464-e4de00000089",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "owner": {
       "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/98fa7086-8aa1-11e8-7210-075e0000002c",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#employee/edit?id=98fa7086-8aa1-11e8-7210-075e0000002c"
       }
   },
   "state" : "DONE",
   "request": "https://app.kladana.in/api/remap/1.2/report/stock/bystore?async=true",
   "resultUrl": "https://app.kladana.in/api/remap/1.2/async/f97aa1fb-2e58-11e6-8a84-bae500000002/result",
   "deletionDate": "2021-02-16 16:21:09"
}
```

To determine when an asynchronous task will be completed, it is necessary to poll the execution status of the asynchronous task.

This can be done by sending requests to the URL in the **Content-Location** header of the response to the task creation request.

If the status of the task (the **state** field) is `PROCESSING`, then the result of the task is not ready yet, and the request to get the result must be repeated after some time.

As soon as the status of the task becomes `DONE`, the result of the task is ready, and you can proceed to getting the result.

> Request to get Asynchronous tasks with result

```shell
curl -X GET"https://app.kladana.in/api/remap/1.2/async?filter=state=done&deletionDate<2021-02-16 16:21:09"
   -H "Authorization: Bearer <Access-Token>"
```

> Reply

```json
{
   "context": {
     "employee": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/context/employee",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     }
   },
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/async?filter=state=done;deletionDate%3C2021-02-16%2016:21:09",
     "type": "async",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/async/baade4ee-a1d0-11eb-ac12-000b00000000",
         "type": "async",
         "mediaType": "application/json"
       },
       "id": "baade4ee-a1d0-11eb-ac12-000b00000000",
       "accountId": "4f811ce5-983a-11eb-0a80-1d0d00000002",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/4fe188f9-983a-11eb-0a80-39d600000034",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#employee/edit?id=4fe188f9-983a-11eb-0a80-39d600000034"
         }
       },
       "state": "DONE",
       "request": "https://app.kladana.in/api/remap/1.2/report/stock/all?async=true",
       "resultUrl": "https://app.kladana.in/api/remap/1.2/async/baade4ee-a1d0-11eb-ac12-000b00000000/result",
       "deletionDate": "2021-04-16 16:07:13.027"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/async/d2bfbf9f-a1e0-11eb-ac12-000b00000000",
         "type": "async",
         "mediaType": "application/json"
       },
       "id": "d2bfbf9f-a1e0-11eb-ac12-000b00000000",
       "accountId": "4f811ce5-983a-11eb-0a80-1d0d00000002",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/4fe188f9-983a-11eb-0a80-39d600000034",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#employee/edit?id=4fe188f9-983a-11eb-0a80-39d600000034"
         }
       },
       "state": "DONE",
       "request": "https://app.kladana.in/api/remap/1.2/report/stock/bystore?async=true",
       "resultUrl": "https://app.kladana.in/api/remap/1.2/async/d2bfbf9f-a1e0-11eb-ac12-000b00000000/result",
       "deletionDate": "2021-04-16 16:07:19.301"
     }
   ]
}
```

You can also monitor the status of multiple tasks. To do this, you can send requests to the resource for obtaining the statuses of asynchronous tasks.

Let's say you want to get all asynchronous tasks for which a result is available. To do this, specify the status of the task with the value `DONE` in the filter and the deletion time is less than the current time.

### 3. Getting the task result

> Request to get the result of an Asynchronous Task

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/async/498b8673-0308-11e6-9464-e4de00000089/result"
   -H "Authorization: Bearer <Access-Token>"
```

> Reply

```shell
302 FOUND
no body

Titles:
Location: https://123.selcdn.ru/batch-prod/batch/002b9772-8583-11eb-ac12-000c00000001/apiasynctaskresult/4d363a5f-ae72-4a14-9951-7038a4a67060?temp_url_sig=9a24e12250f72328c27 3491&temp_url_expires=1616516805&filename=asynctask_d1746c6c-8bf3- 11eb-ac12-000b00000001_result.json
```

> Example of received report

```json
{
   "context": {
     "employee": {
       "href": "https://app.kladana.in/api/remap/1.2/context/employee",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/report/stock/bystore?async=true",
     "type": "stockbystore",
     "mediaType": "application/json",
     "size": 2135
   },
   "rows": [
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
           "reserve": 0,
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
           "stock": 0,
           "reserve": 0,
           "inTransit": 0
         }
       ]
     },
     ...
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
           "stock": 0,
           "reserve": 0,
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
           "reserve": 0,
           "inTransit": 0
         }
       ]
     }
   ]
}
```

When the task status is set to `DONE`, the request to get the task execution status contains 2 additional fields:

* **resultUrl** - URL where the result of the completed task is available.
Matches the URL from the **Location** header of the response to the create task request.
* **deletionDate** - date after which the result of the task will become unavailable. The lifetime of the task execution result is 1 hour.

The result of a request to the URL in the **resultUrl** field is a redirect with a `302 FOUND` status, and the **Location** header contains a link to the task result file.
Most HTTP clients do the redirect automatically. The link is valid for 5 minutes from the moment you receive it.

If your client doesn't automatically redirect, all that's left to do is send a GET request to the URL in the **Location** header to get the required report.

The resulting report has minor differences from the synchronous version: **meta** does not contain the **limit** and **offset** fields, and the **rows** array is not limited to 1000 elements.

If the status of the task is `API_ERROR`, then the json response to the request for obtaining the result of the task will contain [error](../#mojsklad-json-api-oshibki),
similar to the one returned by the synchronous resource call.

> An example of a request to get the result of an Asynchronous task with the API_ERROR status

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/async/498b8673-0308-11e6-9464-e4de00000089/result"
   -H "Authorization: Bearer <Access-Token>"
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

If something went wrong during the execution of the task, for example, the user does not have access to the report or the required headers are not specified,
then the task will be marked as completed successfully, and the result will contain text describing the error.

### 4. Set up a webhook to complete an Asynchronous Task

In order not to poll the endpoint for the status of a running asynchronous task, you can configure [webhook](../dictionaries/#suschnosti-vebhuki) to notify when the task is completed.
As with regular webhooks, you need to set:
 
  * entity type `entityType`, in our case it will be `async`
  * the `action` that the webhook should trigger, in this case it will be `PROCESSED`
  * and the `url` where the message will be sent when the webhook fires
 
> An example of a request to create a webhook on the execution event of an Asynchronous task

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/webhook"
   -H "Authorization: Bearer <Access-Token>"
   -H "Content-Type: application/json"
   -d '{
           "url": "http://some_url.ru",
           "action": "PROCESSED",
           "entityType": "async"
       }'
```

> Response200
> Example of received report

```json
{
     "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/webhook/c6010bf9-a683-11eb-ac12-000900000001",
         "metadataHref": "https://app.kladana.in//api/remap/1.2/entity/webhook/metadata",
         "type": "webhook",
         "mediaType": "application/json"
     },
     "id": "c6010bf9-a683-11eb-ac12-000900000001",
     "accountId": "6c240ac7-a683-11eb-ac12-000c00000000",
     "entityType": "async",
     "url": "http://some_url.ru",
     "method": "POST",
     "encapable": true,
     "action": "PROCESSED"
}
```

This completes the configuration of the notification about the completion of the asynchronous execution. Now you will receive webhooks, to the specified address, each time the asynchronous task completes. This way you don't need to ask the state of the asynchronous task until the webhook arrives.
