## Webhooks

The webhook mechanism in Kladana is a powerful and easy-to-use tool for tracking changes in your account. Use webhooks to control the interaction of Kladana and your system in real time, so that you can get rid of periodic change requests.

### Webhook

A webhook is a mechanism for sending notifications when an event occurs in the system, to which the client application is subscribed.

An event is a change in the state of a system. For example, events are: creation of a new product, change of fields
at the counterparty, deleting the buyer's order. The notification will be a POST method request that will contain the following information about the occurred event: its type and a link to the changed object. For example, when changing the product name, a notification will be sent containing a link to the modified product.

The webhook itself contains a description of the change (object type and a link to the changed object), which is sent to the specified url.

> Sample webhook request body:

```json
{
   "url": "http://www.example.com",
   "action": "CREATE",
   "entityType": "supply"
}
```

#### Difference between API and webhooks

There are two approaches to get information about changes in the system: polling via API (polling) and subscribing to webhooks.

API polling involves round-robin requests to get changes. Subscribing to webhooks involves receiving a change notification in the system.

We can draw the following analogy. Suppose you ordered a product, but it was out of stock, so you call the store every day, to find out when a product is available, it's like an API survey. But you can just ask the manager in the store to call you at the indicated phone number when the product appears, this is a subscription to webhooks.

Obviously, subscribing to webhooks is more efficient and easier, as it guarantees prompt receipt of changes in the system and less load on
client application.

#### Using API and Webhooks

Despite the benefits of using webhooks, it's important to understand that subscribing to webhooks is just a form of notification of system changes. Entity actions (CRUD) must be performed using the API.

Possible scenarios where subscribing to webhooks seems preferable to polling via the JSON API:

* creating customer orders and changing their statuses
* change in the price of the goods
* updating the phone number of the counterparty

### How to use webhooks via JSON API
#### Webhooks in JSON API

Working with webhooks in Kladana is possible only through the JSON API. Webhook methods allow you to create, delete, update, get, and
disable webhooks.

The key features of a webhook are the sending address (url), entity type (entityType) and event type (action). A pair of features (entityType and action)
must be unique, i.e. cannot be repeated in other webhooks.
There are following types of events (action):

* CREATE
* UPDATE
* DELETE

These event types can be applied to all types of entities - basic entities and transactions. Reports and Audit are not the entities.

Consider methods of working with webhooks.
To create a webhook, just specify the url, entityType and action, as in the example below

> Request

```shell
curl -X POST
   https://app.kladana.in/api/remap/1.2/entity/webhook
   -H 'Authorization: Bearer <Access-Token>'
   -H 'Content-Type: application/json'
   -d '{
   "url": "http://www.example.com",
   "action": "CREATE",
   "entityType": "service"
}'
```

The response should be json containing a description of the webhook

> Reply

```json
{
     "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/webhook/a5b3cd1f-caee-11e8-9ff4-34e80022dcb3",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
         "type": "webhook",
         "mediaType": "application/json"
     },
     "id": "a5b3cd1f-caee-11e8-9ff4-34e80022dcb3",
     "accountId": "45eb22e0-0e7b-11e2-1c31-3c4a92f3a0a7",
     "entityType": "service",
     "url": "http://www.example.com",
     "method": "POST",
     "enabled": true
     "action": "CREATE"
}
```

As with other JSON API entity requests, other actions on webhooks are only possible when an identifier is specified.
  In the received json field id. An example of getting a webhook by ID.

> Request

```shell
curl -X GET
   https://app.kladana.in/api/remap/1.2/entity/webhook/a5b3cd1f-caee-11e8-9ff4-34e80022dcb3
   -H 'Authorization: Bearer <Access-Token>'
   -H 'Content-Type: application/json'
```

For a webhook, you can change the fields specified during creation, as well as enable/disable it. To do this, a PUT request is made with an identifier.
Example of a request with an event change

> Request

```shell
curl -X PUT
   https://app.kladana.in/api/remap/1.2/entity/webhook/a5b3cd1f-caee-11e8-9ff4-34e80022dcb3
   -H 'Authorization: Bearer <Access-Token>'
   -H 'Content-Type: application/json'
   -d '{
   "action": "UPDATE"
}'
```

> Sample request with webhook disabled.

```shell
curl -X PUT
   https://app.kladana.in/api/remap/1.2/entity/webhook/a5b3cd1f-caee-11e8-9ff4-34e80022dcb3
   -H 'Authorization: Bearer <Access-Token>'
   -H 'Content-Type: application/json'
   -d '{
   "enabled": false
}'
```

> Deleting a webhook is done in the same way, but only using the DELETE method.

```shell
curl -X DELETE
   https://app.kladana.in/api/remap/1.2/entity/webhook/a5b3cd1f-caee-11e8-9ff4-34e80022dcb3
   -H 'Authorization: Bearer <Access-Token>'
   -H 'Content-Type: application/json'
```

> You can get all webhooks with a typical GET request.

```shell
curl -X GET
   https://app.kladana.in/api/remap/1.2/entity/webhook
   -H 'Authorization: Bearer <Access-Token>'
   -H 'Content-Type: application/json'
```

> A collection of webhooks will come in response.

```json
{
    "context":{
       "employee":{
          "meta":{
             "href":"https://app.kladana.in/api/remap/1.2/context/employee",
             "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
             "type":"employee",
             "mediaType":"application/json"
          }
       }
    },
    "meta":{
       "href":"https://app.kladana.in/api/remap/1.2/entity/webhook",
       "type":"webhook",
       "mediaType":"application/json",
       "size":1,
       "limit":25,
       "offset":0
    },
    "rows":[
       {
          "meta":{
             "href":"https://app.kladana.in/api/remap/1.2/entity/webhook/a5b3cd1f-caee-11e8-9ff4-34e80022dcb3",
             "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
             "type":"webhook",
             "mediaType":"application/json"
          },
          "id":"a5b3cd1f-caee-11e8-9ff4-34e80022dcb3",
          "accountId":"45eb22e0-0e7b-11e2-1c31-3c4a92f3a0a7",
          "entityType":"service",
          "url":"http://www.example.com",
          "method":"POST",
          "enabled":true
          "action":"CREATE"
       }
    ]
}
```

#### Webhook limits

There are a number of important things to keep in mind when working with webhooks:

* webhooks are only available on a paid plan
* working with webhooks is available only to the account administrator
* work with webhooks is possible only through JSON API

#### Sending webhooks to the client application

Kladana sends the webhook to the client application using the POST method, specifying the _User-Agent_ header with the value _Kladana webhook touch agent
  2.0 (/https://www.kladana.in)_. Kladana adds the request parameter _requestId_ to the specified sending address (url) - the notification identifier.

When sending a webhook notification, Kladana waits for a response from the client application with status 200 or 204 within 1500 milliseconds to read notification delivered. With an invalid response from the client application, our system makes 3 more attempts to send. These attempts are made sequentially, with no timeouts between them. 

If all attempts fail or time out waiting for a response -
this notification is considered unsent and is subsequently deleted; it will not be sent to the client application,
because The problem is on the client side. 

To avoid sending notifications failing because the server timed out for a response and resending the same notification, we recommend separating receiving webhooks from processing them. You can understand that the event notification was resent by the _requestId_ request parameter - when the notification is resent, the identifier will remain the same.

### How to check a webhook working

The service <a href="https://webhook.site/" target="_blank">https://webhook.site/</a> is convenient for checking the performance of a webhook. He creates
a unique test url that must be specified in the webhook and interactively shows incoming requests, i.e. webhook notifications.

1. Go to <a href="https://webhook.site/" target="_blank">webhook</a>.
2. We get a unique url. You need to copy it to use when creating a webhook.
  ![useful image](../../images/webhooks/step-2.png?raw=true)
 
  > Request to create a webhook to create a service
 
  ```shell
  curl -X POST
    https://app.kladana.in/api/remap/1.2/entity/webhook
    -H 'Authorization: Bearer <Access-Token>'
    -H 'Cache-Control: no-cache'
    -H 'Content-Type: application/json'
    -d '{
    "url": "https://webhook.site/c314f269-d524-4b1a-bf9e-5c59060b220c",
    "action": "CREATE",
    "entityType": "service"
  }'
  ```
 
<p>3. Create a webhook, in the example below, a webhook for creating a service.</p>

> Request to create a service

```shell
curl -X POST
   https://app.kladana.in/api/remap/1.2/entity/service
   -H 'Authorization: Bearer <Access-Token>'
   -H 'Content-Type: application/json'
   -d '{
   "name": "Sharpening skates"
}'
```

<p>4. We create a service in Kladana, in the example below, the creation of a service through the JSON API.</p>

<p>5. We've received a notification to our unique address.</p>
  