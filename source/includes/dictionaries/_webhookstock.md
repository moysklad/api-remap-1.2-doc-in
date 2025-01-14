## Webhook for Stock Update

Webhooks allow you to receive notifications about product stock updates. Notifications are sent to the user every 1-5 minutes if there has been a change in stock. To receive notifications, create a webhook for stock updates and turn it on. The keyword for webhooks to update stock within the JSON API is **webhookstock**.

The set of features also depends on your tariff:

- With paid plans, you can: receive, create, update, disable and delete webhooks for stock updates.
- The free plan does not send webhooks, you cannot create a new webhook or modify an existing webhook.

### Description of the webhook for stock update

> An example of how the data will be transmitted: POST https://example.com/webhook_path?requestId=640569eb-522d-427a-b07e-fa757c5d4217

```json
{
   "accountId": "f71cb8b6-f7b5-11ec-ac12-000f000000eb",
   "stockType": "stock",
   "reportType": "all",
   "reportUrl": "https://api.kladana.com/api/remap/1.2/report/stock/all/current?fromDate=2022-09-24 19:14:32"
}
```

#### Attributes of the sent message

| Title | Type | Description |
| ------- | ---------- |--------- |
| **accountId** | UUID | Account ID<br>`+Required when replying` |
| **stockType** | Enum | The type of residues whose change causes the webhook to change residues. Possible values: `[stock]`<br>`+Required when replying` |
| **reportType** | Enum | The Stock report type to which the webhook for changing stock is attached. Possible values: `[all, bystore]`<br>`+Required when replying` |
| **reportUrl** | String(255) | URL for receiving data on [changed products, bundles, services, product variants for the specified period](../reports/#reports-stock-report-brief-stock-report)<br>`+Required when replying` |

The request parameter **requestId** is the notification identifier.

When a request is sent, the system expects to receive a response from the client application with HTTP status 200 or 204 within 1500 milliseconds. If the system receives an incorrect response, it makes 3 more attempts to send. The attempts are made sequentially, with no timeouts between them. If all attempts fail or the response times out, the notification is considered unsent and is deleted.

To prevent notification attempts from failing because the server timed out for a response, separate receiving webhooks from processing them. The requestId request parameter indicates that the event notification has been resent. When the notification is resent, the identifier will remain the same.

#### SSL handshake
If the recipient's address uses an SSL certificate, then you need to make sure that the certificate has the correct Certification Paths. You can check the certificate in the service https://www.ssllabs.com/ssltest/index.html

#### Entity attributes

| Title | Type | Description |
| ------- | ---------- |---------|
| **accountId** | UUID | Account ID<br>`+Required when replying`|
| **authorApplication** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Application that created the leftover webhook<br>`+Read Only` |
| **enabled** | Boolean | Webhook status checkbox for changing stock (enabled / disabled)<br>`+Required when replying` |
| **stockType** | Enum | The type of residues that the webhook triggers to change. Possible values: `[stock]`<br>`+Required when replying` `+Required when creating` |
| **reportType** | Enum | The Stock report type to which the webhook for changing stock is attached. Possible values: `[all, bystore]`<br>`+Required when replying` `+Required when creating` |
| **id** | UUID | Webhook ID for changing stock<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Webhook metadata for changing stock<br>`+Required when replying` |
| **url** | URL | The URL where the webhook will be processed. Allowed length is up to 255 characters<br>`+Required when replying` `+Required when creating` |

### Get a list of webhooks for changing stock
> Request to receive all webhooks to change stock on this account.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/webhookstock"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of webhooks for changing stock.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/webhookstock",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/metadata",
     "type": "webhookstock",
     "mediaType": "application/json",
     "size": 3,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/aec51463-bbd2-11e6-8a84-bae500000003",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/metadata",
         "type": "webhookstock",
         "mediaType": "application/json"
       },
       "authorApplication" : {
         "meta" : {
           "href" : "https://api.kladana.com/api/remap/1.2/entity/application/9e1ad712-3e45-4679-8896-7159973a8ef5",
           "metadataHref" : "https://api.kladana.com/api/remap/1.2/entity/application/metadata",
           "type" : "application",
           "mediaType" : "application/json"
         }
       },
       "id": "aec51463-bbd2-11e6-8a84-bae500000003",
       "accountId": "8afc8c88-38a5-11ed-ac14-000f00000001",
       "stockType": "stock",
       "reportType": "all",
       "url": "http://www.example.com",
       "enabled": true
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/d08f9217-bbd2-11e6-8a84-bae500000004",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/metadata",
         "type": "webhookstock",
         "mediaType": "application/json"
       },
       "id": "d08f9217-bbd2-11e6-8a84-bae500000004",
       "accountId": "8afc8c88-38a5-11ed-ac14-000f00000001",
       "stockType": "stock",
       "reportType": "all",
       "url": "http://www.example.com",
       "enabled": true
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/d946c7ff-bbd2-11e6-8a84-bae500000005",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/metadata",
         "type": "webhookstock",
         "mediaType": "application/json"
       },
       "id": "d946c7ff-bbd2-11e6-8a84-bae500000005",
       "accountId": "8afc8c88-38a5-11ed-ac14-000f00000001",
       "stockType": "stock",
       "reportType": "all",
       "url": "http://www.example.com",
       "enabled": true
     }
   ]
}
```

### Create a webhook for changing stock
The combination **stockType**, **reportType**, **url** must be unique.
Only one unique combination of **stockType**, **reportType** can create no more than 5 webhooks per change
remnants with different **url** for users and no more than 1 for the application.

> An example of a request to create a new webhook to change stock.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/webhookstock"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "url": "http://www.example.com",
             "enabled": true,
             "reportType": "all",
             "stockType": "stock"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created webhook for changing the stock.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/d08f9217-bbd2-11e6-8a84-bae500000004",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/metadata",
     "type": "webhookstock",
     "mediaType": "application/json"
   },
   "id": "d08f9217-bbd2-11e6-8a84-bae500000004",
   "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
   "stockType": "stock",
   "reportType": "all",
   "url": "http://www.example.com",
   "enabled": true
}
```

### Bulk creation and updating of webhooks for changing stock
[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) webhooks to change stock.
In the body of the request, you need to pass an array containing the JSON representation of the remnant change webhooks that you want to create or update.
Residue change webhooks that are updated must contain the identifier as metadata.

> An example of creating and updating several webhooks for changing stock

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/webhookstock"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "url": "http://www.example.com",
               "stockType": "stock",
               "reportType": "all",
             },
             {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/aec51463-bbd2-11e6-8a84-bae500000003",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/metadata",
                 "type": "webhookstock",
                 "mediaType": "application/json"
               },
               "url": "http://www.example.com",
               "stockType": "stock",
               "reportType": "bystore",
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of generated and updated webhooks for rest changes.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/d08f9217-bbd2-11e6-8a84-bae500000004",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/metadata",
       "type": "webhookstock",
       "mediaType": "application/json"
     },
     "id": "d08f9217-bbd2-11e6-8a84-bae500000004",
     "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
     "stockType": "stock",
     "reportType": "all",
     "url": "http://www.example.com",
     "enabled": true
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/aec51463-bbd2-11e6-8a84-bae500000003",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/metadata",
       "type": "webhookstock",
       "mediaType": "application/json"
     },
     "id": "aec51463-bbd2-11e6-8a84-bae500000003",
     "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
     "stockType": "stock",
     "reportType": "bystore",
     "url": "http://www.example.com",
     "enabled": true
   }
]

```

### Get a separate webhook for changing stock

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required)*Example: 7944ef04-f831-11e5-7a69-971500188b19* Webhook ID for changing the stock |
 
> Request to receive a separate webhook to change stock with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/webhookstock/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a webhook for changing stock with the specified id.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/7944ef04-f831-11e5-7a69-971500188b19",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/metadata",
     "type": "webhookstock",
     "mediaType": "application/json"
   },
   "id": "7944ef04-f831-11e5-7a69-971500188b19",
   "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
   "stockType": "stock",
   "reportType": "bystore",
   "url": "http://www.example.com",
   "enabled": true
}
```

### Change webhook to change stock
An example of a request to change webhook details for changing stock.

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Webhook ID for changing the stock. |

> An example of a request to change a webhook to change stock.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/webhookstock/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "url": "http://www.example.com",
             "stockType": "stock",
             "reportType": "bystore"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the modified webhook for changing stock.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/7944ef04-f831-11e5-7a69-971500188b19",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/metadata",
     "type": "webhookstock",
     "mediaType": "application/json"
   },
   "id": "7944ef04-f831-11e5-7a69-971500188b19",
   "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
   "stockType": "stock",
   "reportType": "bystore",
   "url": "http://www.example.com",
   "enabled": true
}
```

### Disable webhook for changing stock
An example of a request to disable a webhook to change stock.

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Webhook ID for changing the stock. |

> An example of a request to disable a webhook to change stock.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/webhookstock/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "enabled": false
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a disabled webhook for changing stock.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/7944ef04-f831-11e5-7a69-971500188b19",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/metadata",
     "type": "webhookstock",
     "mediaType": "application/json"
   },
   "id": "7944ef04-f831-11e5-7a69-971500188b19",
   "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
   "stockType": "stock",
   "reportType": "bystore",
   "url": "http://www.example.com",
   "enabled": false
}
```

### Delete webhook for changing stock

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Webhook ID for changing the stock. |

> An example of a request to delete a webhook to change the stock with the specified ID.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/webhookstock/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of webhook for changing the stock.

### Bulk deletion of webhooks for changing stock

In the body of the request, you need to pass an array containing JSON metadata for webhooks to change the stock you want to remove.


> Bulk removal request for a webhook to change stock.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/webhookstock/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/7944ef04-f831-11e5-7a69-971500188b1",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/metadata",
                "type": "webhookstock",
                "mediaType": "application/json"
            }
        },
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/7944ef04-f831-11e5-7a69-971500188b2",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/webhookstock/metadata",
                "type": "webhookstock",
                "mediaType": "application/json"
            }
        }
      ]'
```

> Successful request. The result is JSON information about deleting the webhook to change the rest.

```json
[
   {
     "info":"Entity 'webhookstock' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'webhookstock' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```
