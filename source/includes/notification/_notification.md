# Notifications

## Notification feed
### General notification attributes

| Title | Type                                               | Description |
| --------------- |----------------------------------------------------| --------- |
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Read Only` |
| **created** | DateTime                                           | Date and time when the Notification was generated<br>`+Required when replying` `+Read only` |
| **description** | String(4096)                                       | Notification description<br>`+Required for response` `+Read only` |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata. Contains the specific notification type<br>`+Required in response` |
| **read** | Boolean                                            | Indicates whether the Notification has been read<br>`+Required when replying` |
| **title** | String(255)                                        | Brief notification text<br>`+Required when replying` `+Read only` |

### Get notification feed
Request to receive a notification feed.
Result: JSON object including fields:

| Title | Type | Description |
| --------------- | ------ | --------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing [Notifications](/#notifications-notification-feed). |

**Parameters**

| Parameter | Description |
| --------------- | ------ | 
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get notification feed

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Notifications.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/notification",
    "type": "notification",
    "mediaType": "application/json",
    "size": 3,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/notification/32f118d3-5b8f-11e9-9bea-3ff700000070",
        "type": "NotificationGoodCountTooLow",
        "mediaType": "application/json"
      },
      "id": "32f118d3-5b8f-11e9-9bea-3ff700000070",
      "accountId": "45b76d0a-5aa2-11e9-727d-307300000002",
      "created": "2019-04-10 15:50:20.271",
      "read": true,
      "title": "Out of Stock Potatoes (yes)",
      "description": "Remainder below 1",
      "good": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/0daf8e9a-5b7a-11e9-727d-307300000007",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json"
        },
        "id": "0daf8e9a-5b7a-11e9-727d-307300000007",
        "name": "Potato (yes)"
      },
      "actualBalance": 0,
      "minimumBalance": 1
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/notification/0f423542-5b7a-11e9-9bea-3ff70000000f",
        "type": "NotificationImportCompleted",
        "mediaType": "application/json"
      },
      "id": "0f423542-5b7a-11e9-9bea-3ff70000000f",
      "accountId": "45b76d0a-5aa2-11e9-727d-307300000002",
      "created": "2019-04-10 13:19:01.123",
      "read": true,
      "title": "Import completed",
      "description": "0002",
      "message": "Handle 7 row",
      "taskType": "importer_good",
      "taskState": "completed",
      "createdDocumentName": "00002"
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/notification/a805beb5-5adf-11e9-9bea-3ff700000025",
        "type": "NotificationTaskChanged",
        "mediaType": "application/json"
      },
      "id": "a805beb5-5adf-11e9-9bea-3ff700000025",
      "accountId": "45b76d0a-5aa2-11e9-727d-307300000002",
      "created": "2019-04-09 18:53:45.314",
      "read": true,
      "title": "Task changed",
      "description": "admin task changed",
      "performedBy": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/188cb787-5aa5-11e9-727d-30730000009c",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json"
        },
        "id": "188cb787-5aa5-11e9-727d-30730000009c",
        "name": "admin"
      },
      "task": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/task/14ac66b6-5add-11e9-727d-30730000002f",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/task/metadata",
          "type": "task",
          "mediaType": "application/json"
        },
        "id": "14ac66b6-5add-11e9-727d-30730000002f",
        "name": "New task description",
        "deadline": "2019-04-02 18:53:00.000"
      },
      "diff": {
        "description": {
          "oldValue": "Old task description",
          "newValue": "New task description"
        },
        "deadline": {
          "newValue": "2019-04-02 18:53:00.000"
        }
      }
    }
  ]
}
```

[//]: # (Здесь пропущены разделы: Получить Уведомление, Удалить Уведомление, Отметить Уведомление как прочитанное)

### Mark all Notifications as read
Mark all Notifications of the current user as read.

> Mark all Notifications of the current user as read

```shell
curl -X PUT
   "https://api.kladana.com/api/remap/1.2/notification/markasreadall"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successfully affixing the "read" flag to all unread Notifications.

## Notification types
### Field formats
#### Changed field format
The format of the changed field contains the old and new values:

| Title | Type | Description |
| --------------- | ------ | --------- |
| **oldValue** | String(255) | Attribute value before deletion<br>`+Required for response` `+Read only` |
| **newValue** | String(255) | Attribute value after update<br>`+Required for response` `+Read-only` |

The format of oldValue and newValue is the same as the format of the field whose change is displayed. One of the fields may be left blank.

#### Possible export type values
+ **export_csv_good**
+ **export_csv_agent**
+ **export_ms_xml**
+ **export_1c_v2_xml**
+ **export_unisender**
+ **export_1c_v3_xml**
+ **export_subscribepro**
+ **export_1c_client_bank**
+ **export_alfa_payments**
+ **export_tochka_payments**
+ **export_modulbank_payments**
+ **export_1c_enterprise_data**
+ **export_tinkoff_payments**
+ **export_good**
+ **export_custom_entity**

#### Possible import type values
+ **importer_csv**
+ **importer_yml**
+ **importer_csv_agent**
+ **importer_csv_customerorder**
+ **importer_csv_purchaseorder**
+ **importer_ms_xml**
+ **importer_1c_client_bank**
+ **import_alfa_payments**
+ **import_alfa_payments_request**
+ **import_alfa_payments_save**
+ **import_tochka_payments**
+ **import_modulbank_payments**
+ **import_tochka_payments_save**
+ **import_modulbank_payments_save**
+ **import_tinkoff_payments**
+ **import_tinkoff_payments_save**
+ **importer_good**
+ **importer_good_in_doc**
+ **import_edo_supply**
+ **import_union_company**
+ **import_sberbank_payments_request**
+ **import_sberbank_payments_save**
+ **import_update_vat_to_20_percents**
+ **import_custom_entity**


### Summary table of notification types
| Notification type | Group | What is the notice |
| --------------- | ------ | --------- |
| **FacebookTokenExpirationNotification** | Internet shopping | About the imminent expiration of access to your Facebook account |
| **NotificationExportCompleted** | Data exchange | Export completed |
| **NotificationGoodCountTooLow** | Remains | Reducing the quantity of goods to a minimum balance |
| **NotificationImportCompleted** | Data exchange | Import completed |
| **NotificationInvoiceOutOverdue** | Account | Overdue invoice that was not paid or not fully paid by the buyer |
| **NotificationOrderNew** | Sales Order | New Sales Order |
| **NotificationOrderOverdue** | Sales Order | Order expired |
| **NotificationRetailShiftClosed** | Retail | Shift closed |
| **NotificationRetailShiftOpened** | Retail | Shift is open |
| **NotificationScript** | Scenarios | Script Notification |
| **NotificationSubscribeExpired** | Billing | End of subscription |
| **NotificationSubscribeTermsExpired** | Billing | Subscription terms expire |
| **NotificationTaskAssigned** | Task | Task assigned |
| **NotificationTaskChanged** | Task | The task has changed |
| **NotificationTaskCommentChanged** | Task | The task comment has been changed |
| **NotificationTaskCommentDeleted** | Task | Task comment has been removed|
| **NotificationTaskCompleted** | Task | Mission accomplished |
| **NotificationTaskDeleted** | Task | Task removed |
| **NotificationTaskNewComment** | Task | The task has a new comment |
| **NotificationTaskOverdue** | Task | Task overdue |
| **NotificationTaskReopened** | Task | Task reopened |
| **NotificationTaskUnassigned** | Task | Task removed |
| **NotificationBonusMoney** | Balance | Bonus money has been credited to the account |

## Detailed description of notification types

### Completion of Export
#### Notification type
NotificationExportCompleted - export completion
#### Notification attributes

| Title | Type                                               | Description |
| --------------- |----------------------------------------------------| --------- |
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Required when creating` |
| **created** | DateTime                                           | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating` |
| **createdDocumentName** | String(255)                                        | The name of the exported document |
| **description** | String(4096)                                       | Notification description<br>`+Required when replying` `+Required when creating` |
| **errorMessage** | String(255)                                        | Error message |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Required when creating` |
| **message** | String(255)                                        | Export completion message |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating` |
| **read** | Boolean                                            | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating` |
| **taskState** | Object                                             | Completion status. Can be `completed`, `interrupted`, `interrupted_by_user`, `interrupted_by_timeout`, `interrupted_by_system`<br>`+Required when responding` `+Required when creating` |
| **taskType** | Object                                             | [Export type](/#notifications-notification-types-field-formats-possible-export-type-values)<br>`+Required when replying` `+Required when creating` |
| **title**| String(255)                                        | Brief text of notification<br>`+Required when replying` `+Required when creating` |

**Parameters**

| Parameter | Description |
| --------------- | ------ | 
| **id** | `string` (required) *Example: 02950e3c-35f2-11e9-9ff4-34e8000799c0* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/02950e3c-35f2-11e9-9ff4-34e8000799c0"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/02950e3c-35f2-11e9-9ff4-34e8000799c0",
     "type": "NotificationExportCompleted",
     "mediaType": "application/json"
   },
   "id": "02950e3c-35f2-11e9-9ff4-34e8000799c0",
   "accountId": "45eb22e0-0e7b-11e2-1c31-3c4a92f3a0a7",
   "created": "2019-02-21 19:01:55.277",
   "read": true,
   "title": "Export completed",
   "description": "Export of goods (Excel). Exported 43465 goods and 2080 product variants",
   "message": "43465 items and 2080 product variants exported",
   "taskType": "export_good",
   "taskState": "completed"
}
```

### Completion of Import
#### Notification type

NotificationImportCompleted is an import completion.

#### Notification attributes

| Title | Type                                               | Description |
| --------------- |----------------------------------------------------| --------- |
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Required when creating` |
| **created** | DateTime                                           | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating` |
| **createdDocumentName** | String(255)                                        | The name of the exported document |
| **description** | String(4096)                                       | Notification description<br>`+Required when replying` `+Required when creating` |
| **errorMessage** | String(255)                                        | Error message |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Required when creating` |
| **message** | String(255)                                        | Export completion message |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating` |
| **read** | Boolean                                            | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating` |
| **taskState** | Object                                             | Completion status. Can take the values `completed`, `interrupted`, `interrupted_by_user`, `interrupted_by_timeout`, `interrupted_by_system`<br>`+Required when replying` `+Required when creating` |
| **taskType** | Object                                             | [Export type](/#notifications-notification-types-field-formats-possible-export-type-values)<br>`+Required when replying` `+Required when creating` |
| **title** | String(255)                                        | Brief text of notification<br>`+Required when replying` `+Required when creating` |

**Parameters**

| Parameter | Description |
| ------ | ----------- |
| **id** | `string` (required) *Example: 02950e31-35f2-11e9-9ff4-34e8000799c0* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/02950e31-35f2-11e9-9ff4-34e8000799c0"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/02950e31-35f2-11e9-9ff4-34e8000799c0",
     "type": "NotificationImportCompleted",
     "mediaType": "application/json"
   },
   "id": "02950e31-35f2-11e9-9ff4-34e8000799c0",
   "accountId": "45eb22e0-0e7b-11e2-1c31-3c4a92f3a0a7",
   "created": "2019-02-21 19:01:55.277",
   "read": true,
   "title": "Import completed",
   "description": "Import of accounts (Excel). 3 rows processed, 0 accounts created, 0 accounts updated.",
   "message": "3 lines processed, 0 accounts created, 0 accounts updated.",
   "taskType": "importer_csv_agent",
   "taskState": "completed"
}
```

### Reducing the balance of goods below the minimum

#### Notification type

NotificationGoodCountTooLow - reducing the balance of goods below the irreducible.

#### Notification attributes

| Title | Type                                               | Description |
| --------------- |----------------------------------------------------| --------- |
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Required when creating` |
| **actualBalance** | Int                                                | Remaining goods<br>`+Required when replying` `+Required when creating` |
| **created** | DateTime                                           | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating` |
| **description** | String(4096)                                       | Notification description<br>`+Required when replying` `+Required when creating` |
| **good** | [Meta](../#kladana-json-api-general-info-metadata) | Product metadata<br>`+Required when replying` `+Required when creating` |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Required when creating` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating` |
| **minimumBalance** | Int                                                | Minimum balance of goods<br>`+Required when replying` `+Required when creating` |
| **read** | Boolean                                            | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating` |
| **title** | String(255)                                        | Brief text of notification<br>`+Required when replying` `+Required when creating` |

**Parameters**

| Parameter | Description |
| --------------- | ------ | 
| **id** | `string` (required) *Example: 9338c8bd-56e5-11e9-c0a8-100b00000023* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/9338c8bd-56e5-11e9-c0a8-100b00000023"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. Result - JSONpresentation of the notice.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/9338c8bd-56e5-11e9-c0a8-100b00000023",
     "type": "NotificationGoodCountTooLow",
     "mediaType": "application/json"
   },
   "id": "9338c8bd-56e5-11e9-c0a8-100b00000023",
   "accountId": "c45c23d5-5640-11e9-c0a8-100a00000001",
   "created": "2019-04-04 17:26:02.000",
   "read": false,
   "title": "Out of stock 1",
   "description": "Remainder below 200",
   "good": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/bdca925e-56e1-11e9-c0a8-100a00000016",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json"
     },
     "id": "bdca925e-56e1-11e9-c0a8-100a00000016",
     "name": "1"
   },
   "actualBalance": 180.0,
   "minimumBalance": 200.0
}
```

### Buyer invoice overdue
#### Notification type
NotificationInvoiceOutOverdue - customer's invoice is overdue
#### Notification attributes

| Title | Type                                               | Description |
| --------------- |----------------------------------------------------| --------- |
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Required when creating` |
| **agentName** | String(255)                                        | Counterparty name<br>`+Required when replying` |
| **created** | DateTime                                           | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating` |
| **description** | String(4096)                                       | Notification description<br>`+Required when replying` `+Required when creating` |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Required when creating` |
| **invoice** | [Meta](../#kladana-json-api-general-info-metadata) | Invoice metadata<br>`+Required when replying` `+Required when creating` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating` |
| **paymentPlannedMoment** | DateTime                                           | Scheduled payment date<br>`+Required when replying` |
| **read** | Boolean                                            | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating` |
| **sum** | Int                                                | Invoice amount<br>`+Required when answering` |
| **title** | String(255)                                        | Brief text of notification<br>`+Required when replying` `+Required when creating` |

**Parameters**

| Parameter | Description |
| --------------- | ------ |
| **id** | `string` (required) *Example: 572d1dd9-56fc-11e9-c0a8-100b00000006* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/572d1dd9-56fc-11e9-c0a8-100b00000006"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/572d1dd9-56fc-11e9-c0a8-100b00000006",
     "type": "NotificationInvoiceOutOverdue",
     "mediaType": "application/json"
   },
   "id": "572d1dd9-56fc-11e9-c0a8-100b00000006",
   "accountId": "c45c23d5-5640-11e9-c0a8-100a00000001",
   "created": "2019-04-04 20:09:00.000",
   "read": false,
   "title": "Invoice for buyer #00003 is overdue",
   "description": "Date of payment: 04/01/2019 20:08. Amount: 500.00. Buyer: Retail buyer.",
   "invoice": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/571b1ac4-56fc-11e9-c0a8-100e0000002b",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/invoiceout/metadata",
       "type": "invoiceout",
       "mediaType": "application/json"
     },
     "id": "571b1ac4-56fc-11e9-c0a8-100e0000002b",
     "name": "00003",
     "paymentPlannedMoment": "2019-04-01 20:08:00.000",
     "sum": 50000,
     "customerName": "Retail customer"
   }
}
```

### New order

#### Notification type

NotificationOrderNew - new order.

#### Notification attributes

| Title | Type                                               | Description |
| --------------- |----------------------------------------------------| --------- |
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Required when creating` |
| **agentName** | String(255)                                        | Counterparty name<br>`+Required when replying` |
| **created** | DateTime                                           | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating` |
| **deliveryPlannedMoment** | DateTime                                           | Estimated time of shipment<br>`+Required when replying` |
| **description** | String(4096)                                       | Notification description<br>`+Required when replying` `+Required when creating` |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Required when creating` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating` |
| **order** | [Meta](../#kladana-json-api-general-info-metadata) | Order metadata<br>`+Required when replying` `+Required when creating` |
| **read** | Boolean                                            | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating` |
| **sum** | Int                                                | Invoice amount<br>`+Required when answering` |
| **title** | String(255)                                        | Brief text of notification<br>`+Required when replying` `+Required when creating` |

**Parameters**

| Parameter | Description |
| --------------- | ------ |
| **id** | `string` (required) *Example: c6082a9e-56e1-11e9-c0a8-100b00000011* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/c6082a9e-56e1-11e9-c0a8-100b00000011"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/c6082a9e-56e1-11e9-c0a8-100b00000011",
     "type": "NotificationOrderNew",
     "mediaType": "application/json"
   },
   "id": "c6082a9e-56e1-11e9-c0a8-100b00000011",
   "accountId": "c45c23d5-5640-11e9-c0a8-100a00000001",
   "created": "2019-04-04 16:58:50.000",
   "read": false,
   "title": "New Sales Order #00001",
   "description": "Amount: 499.99. Buyer: Retail buyer.",
   "order": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/c5ab5d93-56e1-11e9-c0a8-100a0000001d",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
       "type": "customerorder",
       "mediaType": "application/json"
     },
     "id": "c5ab5d93-56e1-11e9-c0a8-100a0000001d",
     "name": "00001",
     "sum": 49999,
     "agentName": "Retail customer"
   }
}
```

### Overdue order
#### Notification type
NotificationOrderOverdue - overdue order
#### Notification attributes

| Title | Type                                               | Description |
| --------------- |----------------------------------------------------| --------- |
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Required when creating` || **agentName* | String(255) | Counterparty name<br>`+Required when replying` |
| **created** | DateTime                                           | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating` |
| **deliveryPlannedMoment** | DateTime                                           | Estimated time of shipment<br>`+Required when replying` |
| **description** | String(4096)                                       | Notification description<br>`+Required when replying` `+Required when creating` |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Required when creating` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating` |
| **order** | [Meta](../#kladana-json-api-general-info-metadata) | Order metadata<br>`+Required when replying` `+Required when creating` |
| **read** | Boolean                                            | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating` |
| **sum** | Int                                                | Invoice amount<br>`+Required when answering` |
| **title** | String(255)                                        | Brief text of notification<br>`+Required when replying` `+Required when creating` |

**Parameters**

| Parameter | Description |
| --------------- | ------ |
| **id** | `string` (required) *Example: c6082a9e-56e1-11e9-c0a8-100b00000011* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/c6082a9e-56e1-11e9-c0a8-100b00000011"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/c6082a9e-56e1-11e9-c0a8-100b00000011",
     "type": "NotificationOrderOverdue",
     "mediaType": "application/json"
   },
   "id": "c6082a9e-56e1-11e9-c0a8-100b00000011",
   "accountId": "c45c23d5-5640-11e9-c0a8-100a00000001",
   "created": "2019-04-04 16:58:50.000",
   "read": false,
   "title": "Sales Order #00001 Expired",
   "description": "Sales Order #00001 Expired Amount: 300.00. Buyer: Retail Buyer.",
   "order": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/c5ab5d93-56e1-11e9-c0a8-100a0000001d",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
       "type": "customerorder",
       "mediaType": "application/json"
     },
     "id": "c5ab5d93-56e1-11e9-c0a8-100a0000001d",
     "name": "00001",
     "sum": 30000,
     "agentName": "Retail customer"
   }
}
```


### End of subscription
#### Notification type
NotificationSubscribeExpired - subscription expiration
#### Notification attributes

| Title | Type                                               | Description |
| --------------- |----------------------------------------------------| --------- |
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Required when creating` |
| **created** | DateTime                                           | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating` |
| **description** | String(4096)                                       | Notification description<br>`+Required when replying` `+Required when creating` |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Required when creating` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating` |
| **read** | Boolean                                            | Etcsign of whether the Notification was read<br>`+Required when replying` `+Required when creating` |
| **title** | String(255)                                        | Brief text of notification<br>`+Required when replying` `+Required when creating` |

**Parameters**

| Parameter | Description |
| --------------- | ------ | 
| **id** | `string` (required) *Example: c2582a9e-56e1-11e9-c0a8-100b00000123* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/c2582a9e-56e1-11e9-c0a8-100b00000123"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/c2582a9e-56e1-11e9-c0a8-100b00000123",
     "type": "NotificationOrderOverdue",
     "mediaType": "application/json"
   },
   "id": "c2582a9e-56e1-11e9-c0a8-100b00000123",
   "accountId": "c45c23d5-5640-11e9-c0a8-100a00000001",
   "created": "2019-04-04 16:58:50.000",
   "read": false,
   "title": "End Subscription",
   "description": "AccountName's subscription has ended. You can still work using the free plan. The subscription will resume when the balance is replenished."
}
```

### Subscription terms expire
#### Notification type
NotificationSubscribeTermsExpired - subscription terms expire
#### Attributes

| Title | Type                                               | Description |
| --------------- |----------------------------------------------------| --------- |
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Required when creating` |
| **created** | DateTime                                           | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating` |
| **daysLeft** | Int                                                | Number of remaining days of subscription<br>`+Required when replying` `+Required when creating` |
| **description** | String(4096)                                       | Notification description<br>`+Required when replying` `+Required when creating` |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Required when creating` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating` |
| **read** | Boolean                                            | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating` |
| **title** | String(255)                                        | Brief text of notification<br>`+Required when replying` `+Required when creating` |

**Parameters**

| Parameter | Description |
| --------------- | ------ | 
| **id** | `string` (required) *Example: c2582a9e-56e1-11e9-c0a8-100b00000125* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/c2582a9e-56e1-11e9-c0a8-100b00000125"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/c2582a9e-56e1-11e9-c0a8-100b00000125",
     "type": "NotificationOrderOverdue",
     "mediaType": "application/json"
   },
   "id": "c2582a9e-56e1-11e9-c0a8-100b00000125",
   "accountId": "c45c23d5-5640-11e9-c0a8-100a00000001",
   "created": "2019-04-04 16:58:50.000",
   "read": false,
   "title": "Until the end of the subscription 5 days",
   "description": "There are 3 days left until the end of the subscription on AccountName. We recommend topping up the balance in advance.",
   "daysLeft": 5
}
```

### Task assigned
#### Notification type
NotificationTaskAssigned - the task has been assigned
#### Notification attributes

| Title | Type                                               | Description|
| --------------- |----------------------------------------------------| --------- |
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Required when creating` |
| **created** | DateTime                                           | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating` |
| **description** | String(4096)                                       | Notification description<br>`+Required when replying` `+Required when creating` |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Required when creating` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating` |
| **performedBy** | Object                                             | The person who made the change. [Learn more](#notifications-detailed-description-of-notification-types-task-assigned-nested-entity-attributes-employee-who-made-the-change)<br>`+Required when replying` `+Required when creating` |
| **read** | Boolean                                            | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating` |
| **task** | Object                                             | Task. [Learn more](#notifications-detailed-description-of-notification-types-task-assigned-nested-entity-attributes-task)<br>`+Required when answering` `+Required when creating` |
| **title** | String(255)                                        | Brief text of notification<br>`+Required when replying` `+Required when creating` |

#### Nested entity attributes
##### Employee who made the change

| Title | Type | Description |
| --------------- | ------ | --------- |
| **id** | UUID | Notification ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **name** | String(255) | Name of Counterparty<br>`+Required when replying` |

##### Task

| Title | Type                                               | Description |
| --------------- |----------------------------------------------------| --------- |
| **deadline** | DateTime                                           | Estimated completion date of the task<br>`+Required when replying` |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **name** | String(255)                                        | Name of Counterparty<br>`+Required when replying` |


**Parameters**

| Parameter | Description|
| --------------- | ------ |
| **id** | `string` (required) *Example: bcd815b9-56ca-11e9-c0a8-100b00000001* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/bcd815b9-56ca-11e9-c0a8-100b00000001"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/bcd815b9-56ca-11e9-c0a8-100b00000001",
     "type": "NotificationTaskAssigned",
     "mediaType": "application/json"
   },
   "id": "bcd815b9-56ca-11e9-c0a8-100b00000001",
   "accountId": "c45c23d5-5640-11e9-c0a8-100a00000001",
   "created": "2019-04-04 14:13:56.000",
   "read": false,
   "title": "New task: Task text 1",
   "description": "ntest1 has assigned you a task Task text 1",
   "performedBy": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/c4e1397b-807c-11e9-9ff4-31500025d4ed",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     },
     "id": "c4e1397b-807c-11e9-9ff4-31500025d4ed",
     "name": "ntest1"
   },
   "task": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/task/91d6e8a5-807d-11e9-9109-f8fc0024968d",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/task/metadata",
       "type": "task",
       "mediaType": "application/json"
     },
     "id": "91d6e8a5-807d-11e9-9109-f8fc0024968d",
     "name": "Text of task 1"
   }
}
```

### Task canceled
#### Notification type
NotificationTaskUnassigned - the task has been unassigned
#### Notification attributes

| Title | Type                                               | Description                                                                                                                                                                                                                                |
| --------------- |----------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Required when creating`                                                                                                                                                                          |
| **created** | DateTime                                           | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating`                                                                                                                                   |
| **description** | String(4096)                                       | Notification description<br>`+Required when replying` `+Required when creating`                                                                                                                                                            |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Required when creating`                                                                                                                                                                     |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating`                                                                                                                                                                     |
| **performedBy** | Object                                             | The person who made the change. [More details here](#notifications-detailed-description-of-notification-types-task-canceled-nested-entity-attributes-employee-who-made-the-change)<br>`+Required when replying` `+Required when creating` |
| **read** | Boolean                                            | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating`                                                                                                                                    |
| **task** | Object                                             | Task [More details here](#notifications-detailed-description-of-notification-types-task-canceled-nested-entity-attributes-task)<br>`+Required when answering` `+Required when creating`                                                    |
| **title** | String(255)                                        | Brief text of notification<br>`+Required when replying` `+Required when creating`                                                                                                                                                          |

#### Nested entity attributes
##### Employee who made the change

| Title | Type | Description |
| --------------- | ------ | --------- |
| **id** | UUID | Notification ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **name** | String(255) | Name of Counterparty<br>`+Required when replying` |

##### Task

| Title | Type                                               | Description |
| --------------- |----------------------------------------------------| --------- |
| **deadline** | DateTime                                           | Estimated completion date of the task<br>`+Required when replying` |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **name** | String(255)                                        | Name of Counterparty<br>`+Required when replying` |

**Parameters**

| Parameter | Description |
| --------------- | ------ |
| **id** | `string` (required) *Example: 80c8a58b-56cb-11e9-c0a8-100b00000009* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/80c8a58b-56cb-11e9-c0a8-100b00000009"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/80c8a58b-56cb-11e9-c0a8-100b00000009",
     "type": "NotificationTaskUnassigned",
     "mediaType": "application/json"
   },
   "id": "80c8a58b-56cb-11e9-c0a8-100b00000009",
   "accountId": "c45c23d5-5640-11e9-c0a8-100a00000001",
   "created": "2019-04-04 14:19:25.000",
   "read": false,
   "title": "Task canceled: New text for task 1",
   "description": "ntest1 has removed the task from you",
   "performedBy": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/c4e1397b-807c-11e9-9ff4-31500025d4ed",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     },
     "id": "c4e1397b-807c-11e9-9ff4-31500025d4ed",
     "name": "ntest1"
   },
   "task": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/task/91d6e8a5-807d-11e9-9109-f8fc0024968d",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/task/metadata",
       "type": "task",
       "mediaType": "application/json"
     },
     "id": "91d6e8a5-807d-11e9-9109-f8fc0024968d",
     "name": "New task text 1",
     "deadline": "2019-05-27 15:49:00.000"
   }
}
```

### Task changed
#### Notification type
NotificationTaskChanged - the task has changed
#### Notification attributes

| Title | Type                                               | Description                                                                                                                                                                                                                               |
| --------------- |----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Required when creating`                                                                                                                                                                         |
| **created** | DateTime                                           | Date and time generatedNotifications<br>`+Required when replying` `+Required when creating`                                                                                                                                               |
| **description** | String(4096)                                       | Notification description<br>`+Required when replying` `+Required when creating`                                                                                                                                                           |
| **diff** | Object                                             | Modified fields. [Learn more](#notifications-detailed-description-of-notification-types-task-changed-nested-entity-attributes-changed-fields)<br>`+Required when replying` `+Required when creating`                                       |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Required when creating`                                                                                                                                                                    |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating`                                                                                                                                                                    |
| **performedBy** | Object                                             | The person who made the change. [Learn more](#notifications-detailed-description-of-notification-types-task-changed-nested-entity-attributes-employee-who-made-the-change)<br>`+Required when replying` `+Required when creating` |
| **read** | Boolean                                            | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating`                                                                                                                                   |
| **task** | Object                                             | Task. [Learn more](#notifications-detailed-description-of-notification-types-task-changed-nested-entity-attributes-task)<br>`+Required when answering` `+Required when creating`                                                    |
| **title** | String(255)                                        | Brief text of notification<br>`+Required when replying` `+Required when creating`                                                                                                                                                         |

#### Nested entity attributes
##### Employee who made the change

| Title | Type | Description |
| --------------- | ------ | --------- |
| **id** | UUID | Notification ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **name** | String(255) | Name of Counterparty<br>`+Required when replying` |

##### Changed fields

| Title | Type | Description |
| --------------- | ------ | --------- |
| **description** | String(255) | Change task description in [field change format](/#notifications-notification-types-field-formats-changed-field-format)<br>`+Required when replying` |
| **deadline** | String(255) | Change the scheduled completion date of the task in [field change format](/#notifications-notification-types-field-formats-changed-field-format)<br>`+Required when replying` |
| **agentLink** | String(255) | Changing the counterparty in the [field change format](/#notifications-notification-types-field-formats-changed-field-format)<br>`+Required when replying` |
| **documentlink** | String(255) | Edit linked document in [field change format](/#notifications-notification-types-field-formats-changed-field-format)<br>`+Required when replying` |
| **assignee** | String(255) | Change executor in [field change format](/#notifications-notification-types-field-formats-changed-field-format)<br>`+Required when replying`|

##### Task

| Title | Type                                               | Description |
| --------------- |----------------------------------------------------| --------- |
| **deadline** | DateTime                                           | Estimated completion date of the task<br>`+Required when replying` |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **name** | String(255)                                        | Name of Counterparty<br>`+Required when replying` |

**Parameters**

| Parameter | Description |
| --------------- | ------ |
| **id** | `string` (required) *Example: bd0dbccf-56ca-11e9-c0a8-100b00000003* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/bd0dbccf-56ca-11e9-c0a8-100b00000003"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/bd0dbccf-56ca-11e9-c0a8-100b00000003",
     "type": "NotificationTaskChanged",
     "mediaType": "application/json"
   },
   "id": "bd0dbccf-56ca-11e9-c0a8-100b00000003",
   "accountId": "c45c23d5-5640-11e9-c0a8-100a00000001",
   "created": "2019-04-04 14:13:56.000",
   "read": false,
   "title": "Task changed: New text of task 1",
   "description": "ntest1 changed task",
   "performedBy": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/c4e1397b-807c-11e9-9ff4-31500025d4ed",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     },
     "id": "c4e1397b-807c-11e9-9ff4-31500025d4ed",
     "name": "ntest1"
   },
   "task": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/task/91d6e8a5-807d-11e9-9109-f8fc0024968d",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/task/metadata",
       "type": "task",
       "mediaType": "application/json"
     },
     "id": "91d6e8a5-807d-11e9-9109-f8fc0024968d",
     "name": "New task text 1",
     "deadline": "2019-05-27 15:49:00.000"
   },
   "diff": {
     "deadline": {
       "oldValue": "2019-05-29 15:47:00.000",
       "newValue": "2019-05-27 15:49:00.000"
     }
   }
}
```

### Task accomplished
#### Notification type
NotificationTaskCompleted - task completed
#### Notification attributes

| Title | Type                                               | Description                                                                                                                                                                                                                                   |
| --------------- |----------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Required when creating`                                                                                                                                                                             |
| **created** | DateTime                                           | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating`                                                                                                                                      |
| **description** | String(4096)                                       | Notification description<br>`+Required when replying` `+Required when creating`                                                                                                                                                               |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Required when creating`                                                                                                                                                                        |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating`                                                                                                                                                                        |
| **performedBy** | Object                                             | The person who made the change. [More details here](#notifications-detailed-description-of-notification-types-task-accomplished-nested-entity-attributes-employee-who-made-the-change)<br>`+Required when replying` `+Required when creating` |
| **read** | Boolean                                            | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating`                                                                                                                                       |
| **task** | Object                                             | Task [More details here](#notifications-detailed-description-of-notification-types-task-accomplished-nested-entity-attributes-task)<br>`+Required when answering` `+Required when creating`                                                   |
| **title** | String(255)                                        | Brief text of notification<br>`+Required when replying` `+Required when creating`                                                                                                                                                             |

#### Nested entity attributes
##### Employee who made the change

| Title | Type | Description |
| --------------- | ------ | --------- |
| **id** | UUID | Notification ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **name** | String(255) | Name of Counterparty<br>`+Required when replying` |

##### Task

| Title | Type                                               | Description |
| --------------- |----------------------------------------------------| --------- |
| **deadline** | DateTime                                           | Estimated completion date of the task<br>`+Required when replying` |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **name** | String(255)                                        | Name of Counterparty<br>`+Required when replying` |

**Parameters**

| Parameter | Description |
| --------------- | ------ |
| **id** | `string` (required) *Example: 7945a089-56fd-11e9-c0a8-100b00000008* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/7945a089-56fd-11e9-c0a8-100b00000008"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/7945a089-56fd-11e9-c0a8-100b00000008",
     "type": "NotificationTaskCompleted",
     "mediaType": "application/json"
   },
   "id": "7945a089-56fd-11e9-c0a8-100b00000008",
   "accountId": "45eb22e0-0e7b-11e2-1c31-3c4a92f3a0a7",
   "created": "2019-05-27 15:47:47.000",
   "read": false,
   "title": "Task completed: New task text 1",
   "description": "ntest1 completed task New task text 1 Deadline: 05/29/2019 15:47",
   "performedBy": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/c4e1397b-807c-11e9-9ff4-31500025d4ed",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     },
     "id": "c4e1397b-807c-11e9-9ff4-31500025d4ed",
     "name": "ntest1"
   },
   "task": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/task/91d6e8a5-807d-11e9-9109-f8fc0024968d",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/task/metadata",
       "type": "task",
       "mediaType": "application/json"
     },
     "id": "91d6e8a5-807d-11e9-9109-f8fc0024968d",
     "name": "New task text 1",
     "deadline": "2019-05-29 15:47:00.000"
   }
}
```

### Task deleted
#### Notification type
NotificationTaskDeleted - the task has been deleted
#### Notification attributes

| Title | Type                                               | Description                                                                                                                                                                                                                              |
| --------------- |----------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Required when creating`                                                                                                                                                                        |
| **created** | DateTime                                           | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating`                                                                                                                                 |
| **description** | String(4096)                                       | Notification description<br>`+Required when replying` `+Required when creating`                                                                                                                                                          |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Required when creating`                                                                                                                                                                   |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating`                                                                                                                                                                   |
| **performedBy** | Object                                             | The person who made the change. [More details here](#notifications-detailed-description-of-notification-types-task-deleted-nested-entity-attributes-employee-who-made-the-change)<br>`+Required when replying` `+Required when creating` |
| **read** | Boolean                                            | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating`                                                                                                                                  |
| **task** | Object                                             | Task [More details here](#notifications-detailed-description-of-notification-types-task-deleted-nested-entity-attributes-task)<br>`+Required when answering` `+Required when creating`                                                   |
| **title** | String(255)                                        | Brief text of notification<br>`+Required when replying` `+Required when creating`                                                                                                                                                        |

#### Nested entity attributes
##### Employee who made the change

| Title | Type | Description |
| --------------- | ------ | --------- |
| **id** | UUID | Notification ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **name** | String(255) | Name of Counterparty<br>`+Required when replying` |

##### Task

| Title | Type | Description |
| --------------- | ------ | --------- |
| **name** | String(255) | Name of Counterparty<br>`+Required when replying` |

**Parameters**

| Parameter | Description |
| --------------- | ------ |
| **id** | `string` (required) *Example: 8d07388c-56cb-11e9-c0a8-100b0000000d* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/8d07388c-56cb-11e9-c0a8-100b0000000d"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/8d07388c-56cb-11e9-c0a8-100b0000000d",
     "type": "NotificationTaskDeleted",
     "mediaType": "application/json"
   },
   "id": "8d07388c-56cb-11e9-c0a8-100b0000000d",
   "accountId": "45eb22e0-0e7b-11e2-1c31-3c4a92f3a0a7",
   "created": "2019-05-27 15:58:45.000",
   "read": false,
   "title": "Task Deleted: Task Text 2",
   "description": "ntest1 deleted task Task text 2",
   "task": {
     "name": "Text of task 2"
   },
   "performedBy": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/c4e1397b-807c-11e9-9ff4-31500025d4ed",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     },
     "id": "c4e1397b-807c-11e9-9ff4-31500025d4ed",
     "name": "ntest1"
   }
}
```

### Task expired
#### Notification type
NotificationTaskOverdue - the task is overdue
#### Notification attributes

| Title | Type                                               | Description |
| --------------- |----------------------------------------------------| --------- |
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Required when creating` |
| **created** | DateTime                                           | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating` |
| **description** | String(4096)                                       | Notification description<br>`+Required when replying` `+Required when creating` |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Required when creating` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating` |
| **read** | Boolean                                            | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating` |
| **task** | Object                                             | Task [More details here](#notifications-detailed-description-of-notification-types-task-expired-nested-entity-attributes-employee-who-made-the-change)<br>`+Required when answering` `+Required when creating` |
| **title** | String(255)                                        | Brief text of notification<br>`+Required when replying` `+Required when creating` |

#### Nested entity attributes
##### Employee who made the change

| Title | Type | Description |
| --------------- | ------ | --------- |
| **id** | UUID | Notification ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **name** | String(255) | Onnaming of Counterparty<br>`+Required when replying` |

**Parameters**

| Parameter | Description |
| --------------- | ------ |
| **id** | `string` (required) *Example: 51a5b0a3-56e4-11e9-c0a8-100b00000014* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/51a5b0a3-56e4-11e9-c0a8-100b00000014"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/51a5b0a3-56e4-11e9-c0a8-100b00000014",
     "type": "NotificationTaskOverdue",
     "mediaType": "application/json"
   },
   "id": "51a5b0a3-56e4-11e9-c0a8-100b00000014",
   "accountId": "45eb22e0-0e7b-11e2-1c31-3c4a92f3a0a7",
   "created": "2019-05-27 15:49:01.000",
   "read": false,
   "title": "Task Overdue: New Task 1 Text",
   "description": "Task is overdue New task text 1 Deadline: 05/27/2019 15:49",
   "task": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/task/91d6e8a5-807d-11e9-9109-f8fc0024968d",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/task/metadata",
       "type": "task",
       "mediaType": "application/json"
     },
     "id": "91d6e8a5-807d-11e9-9109-f8fc0024968d",
     "name": "New task text 1",
     "deadline": "2019-05-27 15:49:00.000"
   }
}
```

### Task reopened

#### Notification type

NotificationTaskReopened - the task has been reopened.

#### Notification attributes

| Title | Type                                               | Description                                                                                                                                                                                                                                      |
| --------------- |----------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Required when creating`                                                                                                                                                                                |
| **created** | DateTime                                           | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating`                                                                                                                                         |
| **description** | String(4096)                                       | Notification description<br>`+Required when replying` `+Required when creating`                                                                                                                                                                  |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Required when creating`                                                                                                                                                                           |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating`                                                                                                                                                                           |
| **performedBy** | Object                                             | The person who made the change. [More details here](#notifications-detailed-description-of-notification-types-task-reopened-nested-entity-attributes-employee-who-made-the-change)<br>`+Required when answering` `+Required when creating` |
| **read** | Boolean                                            | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating`                                                                                                                                          |
| **task** | Object                                             | Task [More details here](#notifications-detailed-description-of-notification-types-task-reopened-nested-entity-attributes-task)<br>`+Required when answering` `+Required when creating`                                                    |
| **title** | String(255)                                        | Brief text of notification<br>`+Required when replying` `+Required when creating`                                                                                                                                                                |

#### Nested entity attributes
##### Employee who made the change

| Title | Type | Description |
| --------------- | ------ | --------- |
| **id** | UUID | Notification ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **name** | String(255) | Name of Counterparty<br>`+Required when replying` |

##### Task

| Title | Type                                               | Description |
| --------------- |----------------------------------------------------| --------- |
| **deadline** | DateTime                                           | Estimated completion date of the task<br>`+Required when replying` |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **name** | String(255)                                        | Name of Counterparty<br>`+Required when replying` |

**Parameters**

| Parameter | Description |
| --------------- | ------ |
| **id** | `string` (required) *Example: df0c3e22-56fd-11e9-c0a8-100b0000000a* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/df0c3e22-56fd-11e9-c0a8-100b0000000a"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/df0c3e22-56fd-11e9-c0a8-100b0000000a",
     "type": "NotificationTaskReopened",
     "mediaType": "application/json"
   },
   "id": "df0c3e22-56fd-11e9-c0a8-100b0000000a",
   "accountId": "45eb22e0-0e7b-11e2-1c31-3c4a92f3a0a7",
   "created": "2019-05-27 15:48:06.000",
   "read": false,
   "title": "Issue open: New text for issue 1",
   "description": "ntest1 opened task New task text 1 Deadline: 05/29/2019 15:47",
   "performedBy": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/c4e1397b-807c-11e9-9ff4-31500025d4ed",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     },
     "id": "c4e1397b-807c-11e9-9ff4-31500025d4ed",
     "name": "ntest1"
   },
   "task": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/task/91d6e8a5-807d-11e9-9109-f8fc0024968d",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/task/metadata",
       "type": "task",
       "mediaType": "application/json"
     },
     "id": "91d6e8a5-807d-11e9-9109-f8fc0024968d",
     "name": "New task text 1",
     "deadline": "2019-05-29 15:47:00.000"
   }
}
```

### New comment for the task
#### Notification type
NotificationTaskNewComment - new comment for the task
#### Notification attributes

| Title | Type                                               | Description                                                                                                                                                                                                                                              |
| --------------- |----------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Required when creating`                                                                                                                                                                                        |
| **created** | DateTime                                           | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating`                                                                                                                                                 |
| **description** | String(4096)                                       | Notification description<br>`+Required when replying` `+Required when creating`                                                                                                                                                                          |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Required when creating`                                                                                                                                                                                   |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating`                                                                                                                                                                                   |
| **noteContent** | String(4096)                                       | Comment content<br>`+Required when replying` `+Required when creating`                                                                                                                                                                                   |
| **performedBy** | Object                                             | The person who made the change. [More details here](#notifications-detailed-description-of-notification-types-new-comment-for-the-task-nested-entity-attributes-employee-who-made-the-change)<br>`+Required when replying` `+Required when creating ` |
| **read** | Boolean                                            | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating`                                                                                                                                                  |
| **task** | Object                                             | Task [More here](#notifications-detailed-description-of-notification-types-new-comment-for-the-task-nested-entity-attributes-task)<br>`+Required when answering` `+Required when creating`                                                            |
| **title** | String(255)                                        | Brief text of notification<br>`+Required when replying` `+Required when creating`                                                                                                                                                                        |

#### Nested entity attributes
##### Employee who made the change

| Title | Type | Description |
| --------------- | ------ | --------- |
| **id** | UUID | Notification ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **name** | String(255) | Name of Counterparty<br>`+Required when replying` |

##### Task

| Title | Type                                               | Description |
| --------------- |----------------------------------------------------| --------- |
| **deadline** | DateTime                                           | Estimated completion date of the task<br>`+Required when replying` |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **name** | String(255)                                        | Name of Counterparty<br>`+Required when replying` |

**Parameters**

| Parameter | Description |
| --------------- | ------ |
| **id** | `string` (required) *Example: 240706df-5704-11e9-c0a8-100b00000003* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/240706df-5704-11e9-c0a8-100b00000003"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/240706df-5704-11e9-c0a8-100b00000003",
     "type": "NotificationTaskNewComment",
     "mediaType": "application/json"
   },
   "id": "240706df-5704-11e9-c0a8-100b00000003",
   "accountId": "45eb22e0-0e7b-11e2-1c31-3c4a92f3a0a7",
   "created": "2019-05-27 15:50:16.000",
   "read": false,
   "title": "New comment: New text for task 1",
   "description": "ntest1 added comment Comment 1",
   "performedBy": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/c4e1397b-807c-11e9-9ff4-31500025d4ed",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     },
     "id": "c4e1397b-807c-11e9-9ff4-31500025d4ed",
     "name": "ntest1"
   },
   "task": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/task/91d6e8a5-807d-11e9-9109-f8fc0024968d",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/task/metadata",
       "type": "task",
       "mediaType": "application/json"
     },
     "id": "91d6e8a5-807d-11e9-9109-f8fc0024968d",
     "name": "New task text 1",
     "deadline": "2019-05-27 15:49:00.000"
   },
   "noteContent": "Comment 1"
}
```


### Changed the comment to the task
#### Notification type
NotificationTaskCommentChanged - task comment changed
#### Notification attributes

| Title | Type                                               | Description                                                                                                                                                                                                                                                |
| --------------- |----------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Required when creating`                                                                                                                                                                                          |
| **created** | DateTime                                           | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating`                                                                                                                                                  |
| **description** | String(4096)                                       | Notification description<br>`+Required when replying` `+Required when creating`                                                                                                                                                                            |
| **diff** | String(255)                                        | Comment changes in [field change format](/#notifications-notification-types-field-formats-changed-field-format)<br>`+Required when replying` `+Required when creating`                                                                                     |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Required when creating`                                                                                                                                                                                     |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating`                                                                                                                                                                                     |
| **noteContent** | String(4096)                                       | Comment content<br>`+Required when replying` `+Required when creating`                                                                                                                                                                                     |
| **performedBy** | Object                                             | The person who made the change. [More details here](#notifications-detailed-description-of-notification-types-changed-the-comment-to-the-task-nested-entity-attributes-employee-who-made-the-change)<br>`+Required when replying` `+Required when creating ` |
| **read** | Boolean                                            | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating`                                                                                                                                                    |
| **task** | Object                                             | Task [More here](#notifications-detailed-description-of-notification-types-changed-the-comment-to-the-task-nested-entity-attributes-task)<br>`+Required when answering` `+Required when creating`                                                            |
| **title** | String(255)                                        | Brief text of notification<br>`+Required when replying` `+Required when creating`                                                                                                                                                                          |

#### Nested entity attributes
##### Employee who made the change

| Title | Type | Description |
| -------- | ------ | ---- |
| **id** | UUID | Notification ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **name** | String(255) | Name of Counterparty<br>`+Required when replying` |

##### Task

| Title | Type                                               | Description |
| ------------ |----------------------------------------------------| ------- |
| **deadline** | DateTime                                           | Estimated completion date of the task<br>`+Required when replying` |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **name** | String(255)                                        | Name of Counterparty<br>`+Required when replying` |

**Parameters**

| Parameter | Description |
| ------- | ------------- |
| **id** | `string` (required) *Example: 3d3423ee-5704-11e9-c0a8-100b00000007* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/3d3423ee-5704-11e9-c0a8-100b00000007"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/3d3423ee-5704-11e9-c0a8-100b00000007",
     "type": "NotificationTaskCommentChanged",
     "mediaType": "application/json"
   },
   "id": "3d3423ee-5704-11e9-c0a8-100b00000007",
   "accountId": "45eb22e0-0e7b-11e2-1c31-3c4a92f3a0a7",
   "created": "2019-05-27 15:50:53.000",
   "read": false,
   "title": "Comment changed: New text for task 1",
   "description": "ntest1 changed comment New text for comment 1, Comment 1",
   "performedBy": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/c4e1397b-807c-11e9-9ff4-31500025d4ed",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     },
     "id": "c4e1397b-807c-11e9-9ff4-31500025d4ed",
     "name": "ntest1"
   },
   "task": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/task/91d6e8a5-807d-11e9-9109-f8fc0024968d",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/task/metadata",
       "type": "task",
       "mediaType": "application/json"
     },
     "id": "91d6e8a5-807d-11e9-9109-f8fc0024968d",
     "name": "New task text 1",
     "deadline": "2019-05-27 15:49:00.000"
   },
   "diff": {
     "noteContent": {
       "oldValue": "Comment 1",
       "newValue": "New comment text 1"
     }
   }
}
```

### Removed comment on the task
#### Notification type
NotificationTaskCommentDeleted - the comment to the task has been deleted
#### Notification attributes

| Title | Type                                               | Description|
| --------------- |----------------------------------------------------| --------- |
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Required when creating` |
| **created** | DateTime                                           | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating` |
| **description** | String(4096)                                       | Notification description<br>`+Required when replying` `+Required when creating` |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` `+Required when creating` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating` |
| **noteContent** | String(4096)                                       | Comment content<br>`+Required when replying` `+Required when creating` |
| **performedBy** | Object                                             | The person who made the change. [More details here](#notifications-detailed-description-of-notification-types-removed-comment-on-the-task-nested-entity-attributes-employee-who-made-the-change)<br>`+Required when replying` `+Required when creating ` |
| **read** | Boolean                                            | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating` |
| **task** | Object                                             | Task [More details here](#notifications-detailed-description-of-notification-types-removed-comment-on-the-task-nested-entity-attributes-employee-who-made-the-change)<br>`+Required when answering` `+Required when creation` |
| **title** | String(255)                                        | Brief text of notification<br>`+Required when replying` `+Required when creating` |

#### Nested entity attributes
##### Employee who made the change

| Title | Type | Description |
| --------------- | ------ | --------- |
| **id** | UUID | Notification ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **name** | String(255) | Name of Counterparty<br>`+Required when replying` |

##### Task

| Title | Type                                               | Description |
| --------------- |----------------------------------------------------| --------- |
| **deadline** | DateTime                                           | Estimated completion date of the task<br>`+Required when replying` |
| **id** | UUID                                               | Notification ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **name** | String(255)                                        | Name of Counterparty<br>`+Required when replying` |

**Parameters**

| Parameter | Description |
| --------------- | ------ |
| **id** | `string` (required) *Example: 3d2abf0f-5704-11e9-c0a8-100b00000005* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/3d2abf0f-5704-11e9-c0a8-100b00000005"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/3d2abf0f-5704-11e9-c0a8-100b00000005",
     "type": "NotificationTaskCommentDeleted",
     "mediaType": "application/json"
   },
   "id": "3d2abf0f-5704-11e9-c0a8-100b00000005",
   "accountId": "45eb22e0-0e7b-11e2-1c31-3c4a92f3a0a7",
   "created": "2019-05-27 15:51:09.000",
   "read": false,
   "title": "Comment deleted: New text for task 1",
   "description": "ntest1 deleted comment New comment text 1",
   "performedBy": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/c4e1397b-807c-11e9-9ff4-31500025d4ed",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     },
     "id": "c4e1397b-807c-11e9-9ff4-31500025d4ed",
     "name": "ntest1"
   },
   "task": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/task/91d6e8a5-807d-11e9-9109-f8fc0024968d",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/task/metadata",
       "type": "task",
       "mediaType": "application/json"
     },
     "id": "91d6e8a5-807d-11e9-9109-f8fc0024968d",
     "name": "New task text 1",
     "deadline": "2019-05-27 15:49:00.000"
   },
   "noteContent": "New comment text 1"
}
```

### Shift is open

#### Notification type

NotificationRetailShiftOpened - the shift is open.

#### Notification attributes

| Title | Type | Description |
| --------------- | ------ | --------- |
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Required when creating` |
| **created** | DateTime | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating` |
| **description** | String(4096) | Notification description<br>`+Required when replying` `+Required when creating` |
| **id** | UUID | Notification ID<br>`+Required when replying` `+Required when creating` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating` |
| **read** | Boolean | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating` |
| **retailShift** | Object | Shift description<br>`+Required when replying` `+Required when creating` |
| **retailStore** | Object | Point of sale<br>`+Required when replying` `+Required when creating` |
| **title** | String(255) | Brief text of notification<br>`+Required when replying` `+Required when creating` |
| **user** | Object | Employee<br>`+Required when replying` `+Required when creating` |

**Parameters**

| Parameter | Description |
| --------------- | ------ |
| **id** | `string` (required) *Example: 8002409b-351d-11e9-9ff4-34e80002a126* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/8002409b-351d-11e9-9ff4-34e80002a126"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/8002409b-351d-11e9-9ff4-34e80002a126",
     "type": "NotificationRetailShiftOpened",
     "mediaType": "application/json"
   },
   "id": "8002409b-351d-11e9-9ff4-34e80002a126",
   "accountId": "45eb22e0-0e7b-11e2-1c31-3c4a92f3a0a7",
   "created": "2019-02-20 17:40:42.000",
   "read": true,
   "title": "Shift is open at Point of sale",
   "description": "Cashier: Cashier Kladkin",
   "user": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/4d4ba195-0e7b-11e2-480d-3c4a92f3a0a7",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     },
     "id": "4d4ba195-0e7b-11e2-480d-3c4a92f3a0a7",
     "name": "Cashier Kladkin"
   },
   "retailStore": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/retailstore/ffa5bbf4-351b-11e9-9ff4-34e800131be8",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/retailstore/metadata",
       "type": "retailstore",
       "mediaType": "application/json"
     },
     "id": "ffa5bbf4-351b-11e9-9ff4-34e800131be8",
     "name": "Point of sale"
   },
   "retailShift": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/retailshift/7e41bd3c-351c-11e9-9ff4-34e80012cfc1",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/retailshift/metadata",
       "type": "retailshift",
       "mediaType": "application/json"
     },
     "id": "7e41bd3c-351c-11e9-9ff4-34e80012cfc1",
     "name": "00002",
     "open": "2019-02-20 17:33:00.000",
     "proceed": 3000000
   }
}
```

### Shift closed
#### Notification type
NotificationRetailShiftClosed - the shift is closed
#### Notification attributes

| Title | Type | Description |
| --------------- | ------ | --------- |
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Required when creating` |
| **created** | DateTime | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating` |
| **description** | String(4096) | Notification description<br>`+Required when replying` `+Required when creating` |
| **id** | UUID | Notification ID<br>`+Required when replying` `+Required when creating` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating` |
| **read** | Boolean | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating` |
| **retailShift** | Object | Shift description<br>`+Required when replying` `+Required when creating` |
| **retailStore** | Object | Point of sale<br>`+Required when replying` `+Required when creating` |
| **returns** | Int | Number of returns<br>`+Required when replying` `+Required when creating` |
| **sales** | Int | Number of sales<br>`+Required when replying` `+Required when creating` |
| **title** | String(255) | Brief text of notification<br>`+Required when replying` `+Required when creating` |
| **user** | Object | Employee<br>`+Required when replying` `+Required when creating` |

**Parameters**

| Parameter | Description |
| --------------- | ------ |
| **id** | `string` (required) *Example: 3929d717-351c-11e9-9ff4-34e800029ad4* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/3929d717-351c-11e9-9ff4-34e800029ad4"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/3929d717-351c-11e9-9ff4-34e800029ad4",
     "type": "NotificationRetailShiftClosed",
     "mediaType": "application/json"
   },
   "id": "3929d717-351c-11e9-9ff4-34e800029ad4",
   "accountId": "45eb22e0-0e7b-11e2-1c31-3c4a92f3a0a7",
   "created": "2019-02-20 17:31:34.000",
   "read": true,
   "title": "Shift closed at Point of sale",
   "description": "Cashier: Cashier Kladkin. Duration: 1 min. Sales: 2. Refunds: 0. Revenue: 40000.00",
   "user": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/4d4ba195-0e7b-11e2-480d-3c4a92f3a0a7",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     },
     "id": "4d4ba195-0e7b-11e2-480d-3c4a92f3a0a7",
     "name": "Cashier Kladkin"
   },
   "retailStore": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/retailstore/ffa5bbf4-351b-11e9-9ff4-34e800131be8",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/retailstore/metadata",
       "type": "retailstore",
       "mediaType": "application/json"
     },
     "id": "ffa5bbf4-351b-11e9-9ff4-34e800131be8",
     "name": "Point of sale"
   },
   "retailShift": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/retailshift/08fd47a8-351c-11e9-9109-f8fc0013f6cd",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/retailshift/metadata",
       "type": "retailshift",
       "mediaType": "application/json"
     },
     "id": "08fd47a8-351c-11e9-9109-f8fc0013f6cd",
     "name": "00001",
     "open": "2019-02-20 17:30:00.000",
     "close": "2019-02-20 17:31:11.000",
     "proceed": 4000000
   },
   "sales": 2,
   "returns": 0
}
```

### Notification from script
#### Notification type
NotificationScript - notification from a script
#### Notification attributes

| Title | Type | Description |
| --------------- | ------ | --------- |
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Read Only` |
| **created** | DateTime | Date and time when the Notification was generated<br>`+Required when replying` `+Read only` |
| **description** | String(255) | Notification description<br>`+Required for response` `+Read only` |
| **entities** | Object | Script object reference<br>`+Required for response` `+Read-only` |
| **eventType** | Event | Script event type<br>`+Required for response` `+Read-only` |
| **id** | UUID | Notification ID<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required for response` `+Read-only` |
| **read** | Boolean | Indicates whether the Notification has been read<br>`+Required when replying` `+Read Only` |
| **title** | String(255) | Brief notification text<br>`+Required when replying` `+Read only` |

#### Nested entity attributes
##### Event
Script event type. Possible values:

+ **ADD** - created
+ **MODIFY** - changed
+ **CHANGE_STATUS** - status changed

##### An object
The object that the script fired on.

| Title | Type | Description |
| --------------- | ------ | --------- |
| **id** | UUID | Object ID<br>`+Required for response` `+Read-only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required for response` `+Read-only` |
| **name** | String(255) | Object name<br>`+Required for response``+Read Only` |

Valid values for **meta.type**:

+ **customerorder** - Sales order
+ **invoiceout** - Sales invoice
+ **demand** - Shipment
+ **purchaseorder** - Purchase order 
+ **invoicein** - Purchase invoice
+ **supply** - Receiving

**Parameters**

| Parameter | Description |
|----- | ---------- |
| **id** | `string` (required) *Example: 3929d717-351c-11e9-9ff4-34e800029ad4* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/b22dc861-645b-11eb-0a80-1f8500000044"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/b22dc861-645b-11eb-0a80-1f8500000044",
     "type": "NotificationScript",
     "mediaType": "application/json"
   },
   "id": "b22dc861-645b-11eb-0a80-1f8500000044",
   "accountId": "882bbcfa-645b-11eb-0a80-1f8000000016",
   "created": "2021-02-01 10:04:15.907",
   "read": false,
   "title": "subject",
   "description": "notification text",
   "eventType": "MODIFY",
   "entity": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/afa8525a-645b-11eb-0a80-2b47000003b7",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
       "type": "customerorder",
       "mediaType": "application/json"
     },
     "id": "afa8525a-645b-11eb-0a80-2b47000003b7",
     "name": "00001"
   }
}
```

### Warning about the imminent expiration of access to your Facebook account

#### Notification type

FacebookTokenExpirationNotification - warning about the imminent expiration of access to your Facebook account.

#### Notification attributes

| Title | Type | Description |
| --------------- | ------ | --------- |
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Required when creating` |
| **connectorName** | String(4096) | Connector name "Instagram and Facebook"<br>`+Required when replying` |
| **created** | DateTime | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating` |
| **daysLeftToExpiration** | Int | Number of days left before Facebook account access expires<br>`+Required when replying` |
| **description** | String(4096) | Notification description<br>`+Required when replying` `+Required when creating` |
| **id** | UUID | Notification ID<br>`+Required when replying` `+Required when creating` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating` |
| **read** | Boolean | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating` |
| **title** | String(255) | Brief text of notification<br>`+Required when replying` `+Required when creating` |

**Parameters**

| Parameter | Description |
| ----- | -------- |
| **id** | `string` (required) *Example: 9596251d-da73-11eb-ac12-000c00000015* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/9596251d-da73-11eb-ac12-000c00000015"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/9596251d-da73-11eb-ac12-000c00000015",
     "type": "FacebookTokenExpirationNotification",
     "mediaType": "application/json"
   },
   "id": "9596251d-da73-11eb-ac12-000c00000015",
   "accountId": "54148a9e-d8fa-11eb-ac12-000b00000001",
   "created": "2021-07-01 16:52:33",
   "read": true,
   "title": "Update Facebook Link",
   "description": "In order for the Instagram shop to work properly, account access needs to be renewed every 60 days - just click the button in the settings. Days until synchronization stops: 5",
   "connectorName": "Instagram store",
   "daysLeftToExpiration": 5
}
```

### Bonus money has been credited to the account

#### Notification type

NotificationBonusMoney - Bonus money has been credited to the account.

#### Notification attributes

| Title | Type | Description |
| --------------- | ------ | --------- |
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Required when creating` |
| **created** | DateTime | Date and time when the Notification was generated<br>`+Required when replying` `+Required when creating` |
| **description** | String(4096) | Notification description<br>`+Required when replying` `+Required when creating` |
| **id** | UUID | Notification ID<br>`+Required when replying` `+Required when creating` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` `+Required when creating` |
| **read** | Boolean | Indicates whether the Notification has been read<br>`+Required when replying` `+Required when creating` |
| **title** | String(255) | Brief text of notification<br>`+Required when replying` `+Required when creating` |

**Parameters**

| Parameter | Description |
| ----- | ------- |
| **id** | `string` (required) *Example: c2582a9e-56e1-11e9-c0a8-100b00000123* Notification id. |

> Request to receive a Notification with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/c2582a9e-56e1-11e9-c0a8-100b00000123"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Notification.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/notification/c2582a9e-56e1-11e9-c0a8-100b00000123",
     "type": "NotificationBonusMoney",
     "mediaType": "application/json"
   },
   "id": "c2582a9e-56e1-11e9-c0a8-100b00000123",
   "accountId": "c45c23d5-5640-11e9-c0a8-100a00000001",
   "created": "2019-04-04 16:58:50.000",
   "read": false,
   "title": "Account replenished",
   "description": "500 bonus rubles have been credited to your account"
}
```

## Notification settings

### Entity attributes

+ **groups** - Subscribe to notifications by groups
   + ``groupName`` - Notification group code
     + **enabled**: (boolean, required) - Flag "active" for subscribing to notifications of this group
     + **channels**: (array[string], required) - An array of channels. Contains values from the list: `email` (Email notifications), `push` (notifications on mobile devices)

Notification group code values.

| Notification group code | Description |
| ----------- | ------ |
| **customer_order** | Sales Orders |
| **data_exchange** | Data exchange |
| **invoice** | Buyer Accounts |
| **retail** | Retail |
| **scripts** | Scenarios |
| **stock** | Warehouse balances |
| **task** | Tasks |

### Get notification settings
Query the current user's Notification settings.

> Query the current user's Notification settings.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/notification/subscription"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. JSON representation of notification settings.

```json
{
   "groups" : {
     "customer_order" : {
       "enabled" : true,
       "channels" : [ "email", "push" ]
     },
     "invoice" : {
       "enabled" : true,
       "channels" : [ "email", "push" ]
     },
     "stock" : {
       "enabled" : true,
       "channels" : [ "email", "push" ]
     },
     "retail" : {
       "enabled" : true,
       "channels" : [ "email", "push" ]
     },
     "task" : {
       "enabled" : true,
       "channels" : [ "email", "push" ]
     },
     "data_exchange" : {
       "enabled" : true,
       "channels" : [ "email", "push" ]
     },
     "scripts" : {
       "enabled" : true,
       "channels" : [ "email", "push" ]
     },
     "online_stores" : {
       "enabled" : true,
       "channels" : [ "email", "push" ]
     }
   }
}
```

### Change notification settings

Change the current user's Notification settings.

Disabling notifications from scripts is not allowed. The **enabled** parameter is ignored.

> Change the current user's Notification settings.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/notification/subscription"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "groups" : {
               "customer_order" : {
                 "enabled" : true,
                 "channels" : [ "email", "push" ]
               },
               "invoice" : {
                 "enabled" : true,
                 "channels" : [ "email", "push" ]
               },
               "stock" : {
                 "enabled" : true,
                 "channels" : [ "email", "push" ]
               },
               "retail" : {
                 "enabled" : true,
                 "channels" : [ "email", "push" ]
               },
               "task" : {
                 "enabled" : true,
                 "channels" : [ "email", "push" ]
               },
               "data_exchange" : {
                 "enabled" : true,
                 "channels" : [ "email", "push" ]
               },
               "scripts" : {
                 "enabled" : true,
                 "channels" : [ "email", "push" ]
               },
               "online_stores" : {
                 "enabled" : true,
                 "channels" : [ "email", "push" ]
               }
             }
           }'
```

> Response 200(application/json)
Successfully changed notification settings.
