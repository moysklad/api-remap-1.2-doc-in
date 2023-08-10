## Webhooks
Using the JSON API, you can work with webhooks.

A webhook is a mechanism for sending notifications. A notification is sent when there is a change in the system that tracks the webhook. For example, if you enable a product webhook, when you change the product name, you receive a notification with a link to the changed product. Read more about working with webhooks in [Webhooks](../workbook/#workbook-webhooks).

Using API version 1.2, you can view, modify, delete webhooks created only using API version 1.2.

The set of features also depends on your tariff. The free plan does not send webhooks, you cannot create a new webhook or modify an existing one.

Webhook management is available to **account administrator only**.

### Webhook example

An example of how the data will be transmitted:

> POST https://example.com/webhook_path?requestId=640569eb-522d-427a-b07e-fa757c5d4217

```json
{
   "auditContext": {
     "meta": {
       "type": "audit",
       "href": "https://app.kladana.in/api/remap/1.2/audit/75fe3b73-db16-11eb-c0a8-800d00000004"
     },
     "moment": "2021-07-21 15:51:16",
     "uid": "test@test"
   },
   "events": [
     {
       "meta": {
         "type": "product",
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/75c896d0-db16-11eb-c0a8-800d00000002"
       },
       "updatedFields": ["name", "description"],
       "action": "UPDATE",
       "accountId": "9171a53c-b719-11eb-c0a8-800d00000001"
     }
   ]
}
```

#### Entity attributes of the sent webhook

| Title | Type   | Description |
| ------- |--------|---------- |
| **events** | Object | Data about the event that triggered the webhook<br>`+Required for response` |
| **auditContext** | Object | Audit context corresponding to the webhook event |

#### Event entity attributes

| Title | Type | Description |
| ------- | ------- |--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Changed entity metadata<br>`+Required when replying` |
| **action** | Enum | The action that triggered the webhook. Possible values: `[CREATE, UPDATE, DELETE, PROCESSED]`<br>`+Required for response` |
| **accountId** | UUID | Cashier account ID<br>`+Required when replying` |
| **updatedFields** | Array(String) | Entity fields modified by the user |

To display an entity attribute, the **updatedFields** event needs the webhook to have **diffType=FIELDS** and **action=UPDATE**

#### Audit context entity attributes
| Title | Type                                               | Description |
| ------- |----------------------------------------------------|--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Audit context metadata<br>`+Required in response` |
| **id** | String(255)                                        | Employee Login<br>`+Required when replying` `+Read Only` |
| **moment** | DateTime                                           | Modified date<br>`+Required when replying` `+Read only` |

There can be several objects in the **events** array. Request parameter **requestId** - notification identifier.

In response to our request, we expect to receive a response with HTTP status 200 or 204 within 1500 milliseconds.
With an invalid response from the client application, our system makes 3 more attempts to send.

These attempts are made sequentially, with no timeouts between them. If all attempts fail or time out waiting for a response -
this notification is considered unsent and is subsequently deleted; it will not be sent to the client application,
because The problem is on the client side.

To ensure that attempts to send a notification do not fail due to a server timeout, it is recommended toshare the reception of webhooks and their processing.
You can understand that the event notification was resent by the request parameter **requestId** - when the notification is resent, the identifier will remain the same.

Using API version 1.2, you can view, modify, delete webhooks created only using API version 1.2.

#### Temporary disable header via API
Through the JSON API or POS API, when making requests, you can disable webhook notifications in the context of a given request. To do this, you need to specify the `X-Lognex-WebHook-Disable` header with an arbitrary value.

Disabling webhook notifications should only be done when absolutely necessary, as this may affect integrations or disable critical notifications.

#### SSL handshake
If the recipient's address uses an SSL certificate, then you need to make sure that the certificate has the correct Certification Paths. You can check the certificate in the service https://www.ssllabs.com/ssltest/index.html

#### Entity attributes

| Title | Type | Description |
| ------- | ------- |---------|
| **accountId** | UUID | Account ID<br>`+Required when replying` |
| **action** | Enum | The action that the webhook is tracking. Possible values: `[CREATE, UPDATE, DELETE, PROCESSED]`. Setting `PROCESSED` is only possible for [asynchronous tasks](../#mojsklad-json-api-asinhronnyj-obmen)<br>`+Required when responding` `+Required when creating` |
| **authorApplication** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Application that created the webhook<br> |
| **diffType** | Enum | Entity change display mode. Only specified for the `UPDATE` action. Possible values: `[NONE, FIELDS]` (default `NONE`) |
| **enabled** | Boolean | Webhook status checkbox (enabled / disabled)<br>`+Required when replying` |
| **entityType** | String(255) | The type of the entity that the webhook is bound to<br>`+Required when responding` `+Required when creating` |
| **id** | UUID | Webhook ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Webhook metadata<br>`+Required when replying` |
| **method** | Enum| The HTTP method with which the request will be made. Possible values: `POST`<br>`+Required when replying` |
| **url** | URL | The URL to which the request will be made. Allowed length is up to 255 characters<br>`+Required when replying` `+Required when creating` |

#### Available entity types
Creating webhooks is available for all entity and document types, except for the following:

* `webhook`
*`discount`

### Get a list of webhooks
> Request to get all webhooks on this account.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/webhook"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of webhooks.

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
     "href": "https://app.kladana.in/api/remap/1.2/entity/webhook",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
     "type": "webhook",
     "mediaType": "application/json",
     "size": 3,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/webhook/aec51463-bbd2-11e6-8a84-bae500000003",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
         "type": "webhook",
         "mediaType": "application/json"
       },
       "authorApplication" : {
         "meta" : {
           "href" : "https://app.kladana.in/api/remap/1.2/entity/application/9e1ad712-3e45-4679-8896-7159973a8ef5",
           "metadataHref" : "https://app.kladana.in/api/remap/1.2/entity/application/metadata",
           "type" : "application",
           "mediaType" : "application/json"
         }
       },
       "id": "aec51463-bbd2-11e6-8a84-bae500000003",
       "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
       "entityType": "demand",
       "url": "http://www.example.com",
       "method": "POST",
       "enabled": true,
       "action": "CREATE"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/webhook/d08f9217-bbd2-11e6-8a84-bae500000004",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
         "type": "webhook",
         "mediaType": "application/json"
       },
       "id": "d08f9217-bbd2-11e6-8a84-bae500000004",
       "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
       "entityType": "supply",
       "url": "http://www.example.com",
       "method": "POST",
       "enabled": true,
       "action": "CREATE"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/webhook/d946c7ff-bbd2-11e6-8a84-bae500000005",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
         "type": "webhook",
         "mediaType": "application/json"
       },
       "id": "d946c7ff-bbd2-11e6-8a84-bae500000005",
       "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
       "entityType": "cash",
       "url": "http://www.example.com",
       "method": "POST",
       "enabled": true,
       "action": "UPDATE",
       "diffType": "NONE"
     }
   ]
}
```

### Create webhook
An example of a request to create a new webhook. Make sure you're creating a webhook that doesn't exist yet:
combination of **entityType**, **action**, **url** must be unique. Just one unique combination of **entityType**,
**action** can be created no more than 5 webhooks with different **url** for users and no more than 1 for application.

> Sample request to create a new webhook.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/webhook"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "url": "http://www.example.com",
             "action": "CREATE",
             "entityType": "supply"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created webhook.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/webhook/d08f9217-bbd2-11e6-8a84-bae500000004",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
     "type": "webhook",
     "mediaType": "application/json"
   },
   "id": "d08f9217-bbd2-11e6-8a84-bae500000004",
   "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
   "entityType": "supply",
   "url": "http://www.example.com",
   "method": "POST",
   "enabled": true,
   "action": "CREATE"
}
```

> An example of a request to create a new webhook showing the changed fields.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/webhook"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "url": "http://www.example.com",
             "action": "UPDATE",
             "entityType": "supply",
             "diffType": "FIELDS"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created webhook.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/webhook/d08f9217-bbd2-11e6-8a84-bae500000004",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
     "type": "webhook",
     "mediaType": "application/json"
   },
   "id": "d08f9217-bbd2-11e6-8a84-bae500000004",
   "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
   "entityType": "supply",
   "url": "http://www.example.com",
   "method": "POST",
   "enabled": true,
   "action": "UPDATE",
   "diffType": "FIELDS"
}
```

### Bulk create and update webhooks
[Bulk create and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) webhooks.
In the body of the request, you need to pass an array containing the JSON representation of the webhooks you want to create or update.
Updated webhooks must contain the ID as metadata.

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* webhook id. |

> Example of creating and updating multiple webhooks

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/webhook/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "url": "http://www.example.com",
               "action": "CREATE",
               "entityType": "supply"
             },
             {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/webhook/aec51463-bbd2-11e6-8a84-bae500000003",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
                 "type": "webhook",
                 "mediaType": "application/json"
               },
               "url": "http://www.example.com",
               "action": "DELETE"
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated webhooks.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/webhook/d08f9217-bbd2-11e6-8a84-bae500000004",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
       "type": "webhook",
       "mediaType": "application/json"
     },
     "id": "d08f9217-bbd2-11e6-8a84-bae500000004",
     "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
     "entityType": "supply",
     "url": "http://www.example.com",
     "method": "POST",
     "enabled": true,
     "action": "CREATE"
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/webhook/aec51463-bbd2-11e6-8a84-bae500000003",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
       "type": "webhook",
       "mediaType": "application/json"
     },
     "id": "aec51463-bbd2-11e6-8a84-bae500000003",
     "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
     "entityType": "demand",
     "url": "http://www.example.com",
     "method": "POST",
     "enabled": true,
     "action": "DELETE"
   }
]

```

### Get a separate webhook

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* webhook id. |
 
> Request to get a single webhook with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/webhook/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the webhook with the specified id.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/webhook/aec51463-bbd2-11e6-8a84-bae500000003",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
     "type": "webhook",
     "mediaType": "application/json"
   },
   "id": "aec51463-bbd2-11e6-8a84-bae500000003",
   "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
   "entityType": "demand",
   "url": "http://www.example.com",
   "method": "POST",
   "enabled": true,
   "action": "CREATE"
}
```

### Edit webhook
An example request to change webhook details.

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* webhook id. |

> Webhook change request example.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/webhook/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "url": "http://www.example.com",
             "action": "DELETE"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the modified webhook.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/webhook/aec51463-bbd2-11e6-8a84-bae500000003",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
     "type": "webhook",
     "mediaType": "application/json"
   },
   "id": "aec51463-bbd2-11e6-8a84-bae500000003",
   "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
   "entityType": "demand",
   "url": "http://www.example.com",
   "method": "POST",
   "enabled": true,
   "action": "DELETE"
}
```

### Disable webhook
An example request to disable a webhook.

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* webhook id. |

> Sample request to disable a webhook.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/webhook/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "enabled": false
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the disabled webhook.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/webhook/aec51463-bbd2-11e6-8a84-bae500000003",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
     "type": "webhook",
     "mediaType": "application/json"
   },
   "id": "aec51463-bbd2-11e6-8a84-bae500000003",
   "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
   "entityType": "demand",
   "url": "http://www.example.com",
   "method": "POST",
   "enabled": false,
   "action": "DELETE"
}
```

### Remove webhook

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* webhook id. |

> An example request to remove a webhook with the specified id.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/webhook/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of the webhook.

### Bulk removal of webhooks

In the body of the request, you need to pass an array containing JSON of the webhook metadata that you want to remove.


> Request to bulk remove webhooks.

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/webhook/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d'[
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/webhook/7944ef04-f831-11e5-7a69-971500188b1",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
             "type": "webhook",
             "mediaType": "application/json"
           }
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/webhook/7944ef04-f831-11e5-7a69-971500188b2",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/webhook/metadata",
             "type": "webhook",
             "mediaType": "application/json"
           }
         }
       ]'
```

> Successful request. The result is JSON information about removing webhooks.

```json
[
   {
     "info":"Entity 'webhook' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 deleted successfully"
   },
   {
     "info":"Entity 'webhook' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```
