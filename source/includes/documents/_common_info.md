# Transactions
## Transaction templates

Transaction template is a JSON object prefilled with standard fields, which can then be used to successfully create a transaction. Using the JSON API, you can get pre-filled transaction templates. They can be pre-filled both on the basis of other Transactions and with standard values without links to other transactions.

To do this, in all Transactions from which you can get a template, there is a special resource `Transaction template`, the address of which is formed as following: `https://app.kladana.in/api/remap/1.2/entity/<transaction keyword>/new`.

In the body of the PUT request for this resource, you need to pass the metadata of the transaction, on the basis of which the template of the new transaction will be created, or simply pass an empty request body.

The metadata must be "wrapped" in an object whose name is the keyword for the base transaction in the JSON API.
For each of these resources, there are examples of requests and responses.

At the moment, you can get templates for the following transactions based on others:

| Transaction | The basis on which it can be created |
| --------- | --------- |
| Invoice to the buyer (invoiceout) | Sales Order (customerorder) |
| Sales Return (sales return) | Shipment (demand), <br>Retail sale (retaildemand) |
| Return to supplier (purchasereturn) | receiving(supply) |
| Incoming payment (paymentin) | Sales Order (salesreturn), <br>Return to supplier (purchasereturn), <br>Shipping (demand), <br>Invoice to buyer (invoiceout)|
| Production order (processingorder) | Those. map (processingplan) |
| Order to the supplier (purchaseorder) | Internal order (internalorder) |
| Outgoing payment (paymentout) | Sales Return(salesreturn), <br>Receiving (supply), <br>Vendor Invoice (invoicein), <br>Order to Supplier (purchaseorder) |
| Stock Adjustment (enter) | Inventory Count(inventory) |
| Shipment (demand) | Sales Order (customerorder) |
| Move (move) | Internal order (internalorder) |
| Credit order (cashin) | Sales Order (salesreturn), <br>Return to supplier (purchasereturn), <br>Shipping (demand), <br>Invoice to buyer (invoiceout)|
| Cashout |Sales Return (salesreturn), <br>Receiving (supply), <br>Supplier Invoice (invoicein), <br>Order to Supplier (purchaseorder)|
| Retail sale (retaildemand) | Retail shift, Sales Order |
| Write-off (loss) | Sales Return (salesreturn),<br>Inventory Count(inventory) |
| Supplier invoice (invoicein) | Order to the supplier (purchaseorder) |
| Those. operation (processing) | Production order (processingorder), Bills of Materials (processingplan) |

As a resultA PUT request to /entity/entityName/new will NOT create a new transaction. The returned pre-filled object is just a "blank" with some fields filled in (the fields are filled in according to the same logic as as in a similar situation in the main interface), which facilitates the creation of a transaction. It is not stored in the system. This the object can then be passed in the body of the request to create the corresponding transaction, and then the transaction will already be created and associated with the base transaction.

If an empty request body is sent to this resource, then only standard fields will be pre-filled in the final template, incl. specified in the user settings in the Kladana account.

If the Inventory Count contains more than 500 suitable items, then the write-off template (loss) and Stock Adjustment (entry) will be created for the first 500 items.

Details and examples for each of the transactions can be found in the relevant sections of the documentation.
For example, for a shipping template - look in [Shipping Templates](../documents/#transactions-shipment-shipment-template)

### Context search for transactions

The JSON API allows you to contextually search a list of entities of a particular type by their string fields. For this
the URI filter parameter **search** is used.

+ **search**
   A filtering option that can be used to search the list of entities. The search takes place on the main string fields of the entities of the given
   type. The search result will be a list of entities of this type, sorted by relevance, that have been filtered by the passed search string. Unlike selection filtering
   using the **filter** parameter, in which the values are checked for an exact match to the specified ones, with contextual search, the match check is not strict.
   Thus, if you filter like `../entity/<entity_type>?filter=name=ivan`, only those entities with the **name** field will get into the filtered selection
   which have the meaning `ivan` and no others. In a contextual search like `../entity/<entity_type>?search=ivan` will be displayed as entities with **name** equal to
   `ivan`, and entities whose name (or other string field) simply contains `ivan`, for example, `sofa`, `ivanova`, etc.

   Search among transactions for matching the search string will be carried out in the following fields:
   + by name (name)
   + by description
   + by incoming number (incomingNumber)

   + Examples of contextual search queries (values must be urlencoded):
     - `https://app.kladana.in/api/remap/1.2/entity/retaildemand?search=100`
     - `https://app.kladana.in/api/remap/1.2/entity/salesreturn?search=marriage`
     - `https://app.kladana.in/api/remap/1.2/entity/retailshift?search=night`

### Removing to trash

The Recycle Bin helps you avoid the risk of accidentally deleting important transactions. Removal
to the cart is available only if the employee has the appropriate rights, and company settings on the use of the shopping cart.

### Example of deleting Putaway to Trash

> Request to delete the Acceptance with the specified id in the trash.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/supply/be3a3a0e-370c-11e7-1542-821d00000001/trash"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d''
```

> Response 200(application/json)
Successful deletion of Acceptance.

### Binding transactions to the transactions

In order to link another transaction to an existing transaction, you need to
pass the **meta** of the linked transaction to the collection of linked transactions, or to a single transaction of that type.

Such fields are present among transaction attributes. In the description of entities, they are described in the section **Links to other transactions**.

For collections, each field is named as a plural keyword for the types of transactions being linked. For example, the **invoicesOut** field for shipments responsible for communications with Sales invoices. If you want to link an invoice to the shipment, in this field, as part of the collection, you need to put **meta** of the Sales invoice that you want to link, you can link more than 1 transaction.

### Binding example 1

Associating an internal order with a transfer.

> An example of a request to link an internal order to a transfer.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/move/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "internalOrder": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/31d58bde-b2fd-11e6-8a84-bae500000068",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata",
                 "type": "internal order",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
The result is a move with the internalOrder field filled in.

```json
{
   "meta": {
     href: "https://app.kladana.in/api/remap/1.2/entity/move/d9318341-b0da-11e6-8a84-bae5000000c7",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/move/metadata",
     "type": "move",
     "mediaType": "application/json"
   },
   "id": "d9318341-b0da-11e6-8a84-bae5000000c7",
   "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/b905bfb0-9128-11e6-8a84-bae50000002a",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   shared: false
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/b8ba0d3f-9128-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-11-22 20:41:07",
   "name": "00001",
   "externalCode": "8Fn2HqBbguhZxoYrjWYAf3",
   "moment": "2016-11-22 20:40:00",
   "applicable": true
   sum: 0
   "project": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/project/6c6dd3f9-97a1-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
       "type": "project",
       "mediaType": "application/json"
     }
   },
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "created": "2007-02-07 17:16:41",
   positions: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/move/d9318341-b0da-11e6-8a84-bae5000000c7/positions",
       "type": "move position",
       "mediaType": "application/json",
       size: 1
       limit: 1000
       offset: 0
     }
   },
   sourcestore: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/b942743c-9128-11e6-8a84-bae500000053",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "targetStore": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/85a8e439-b0d8-11e6-8a84-bae500000070",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "internalOrder": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/31d58bde-b2fd-11e6-8a84-bae500000068",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata",
       "type": "internal order",
       "mediaType": "application/json"
     }
   }
}
```

### Binding example 2

Linking the invoice to the buyer for the Shipment.

> An example of a request to link an invoice to a buyer for a shipment.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "invoicesOut": [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/invoiceout/6cb87758-95f4-11e6-8a84-bae500000067",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/invoiceout/metadata",
                   "type": "invoiceout",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
The result is a shipment with a new item in the invoicesOut collection.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/demand/06406b97-9138-11e6-8a84-bae500000000",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
     "type": "demand",
     "mediaType": "application/json"
   },
   "id": "06406b97-9138-11e6-8a84-bae500000000",
   "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/b905bfb0-9128-11e6-8a84-bae50000002a",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   shared: false
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/b8ba0d3f-9128-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-10-13 14:27:29",
   "name": "000201",
   "externalCode": "q5Ot--p3gHJrOFylVF2lQ2",
   "moment": "2016-10-13 12:38:00",
   "applicable": false
   sum: 0
   store: {
     "meta": {"href": "https://app.kladana.in/api/remap/1.2/entity/store/b942743c-9128-11e6-8a84-bae500000053",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   agent: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   agentAccount: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051/accounts/b932bc5b-9128-11e6-8a84-bae500000052",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   organizationAccount: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051/accounts/b932bc5b-9128-11e6-8a84-bae500000052",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2007-02-07 17:16:41",
   positions: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/06406b97-9138-11e6-8a84-bae500000000/positions",
       "type": "demand position",
       "mediaType": "application/json",
       size: 1
       limit: 1000
       offset: 0
     }
   },
   "vatEnabled": true
   "vatIncluded": true,
   "vatSum": 0,
   "paidSum": 0,
   "invoicesOut": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/invoiceout/6cb87758-95f4-11e6-8a84-bae500000067",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/invoiceout/metadata",
         "type": "invoiceout",
         "mediaType": "application/json"
       }
     }
   ]
}
```

### Binding example 3

Linking transfers to the Sales Order.

> An example of a request to link transfers to a Sales Order.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/customerorder/c60e87dc-97b2-11ed-c0a8-a00d00000001"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "moves": [
                     {
                         "meta": {
                             "href": "https://app.kladana.in/api/remap/1.2/entity/move/bc8aa8d7-95fa-11ed-c0a8-a00c0000001a",
                             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/move/metadata",
                             "type": "move",
                             "mediaType": "application/json",
                             "uuidHref": "https://app.kladana.in/app/#move/edit?id=bc8aa8d7-95fa-11ed-c0a8-a00c0000001a"
                         }
                     },
                     {
                         "meta": {
                             "href": "https://app.kladana.in/api/remap/1.2/entity/move/06406b97-9138-11e6-8a84-bae500000000",
                             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/move/metadata",
                             "type": "move",
                             "mediaType": "application/json",
                             "uuidHref": "https://app.kladana.in/app/#move/edit?id=06406b97-9138-11e6-8a84-bae500000000"
                         }
                     }
                 ]
         }'
```

> Response 200(application/json)
The result is a Sales Order with new items in the moves collection.

```json
{
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/b905bfb0-9128-11e6-8a84-bae50000002a",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   shared: false
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/b8ba0d3f-9128-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "name": "Sales Order 1",
   "moment": "2016-11-25 17:33:33",
   "applicable": true
   sum: 0
   store: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/b942743c-9128-11e6-8a84-bae500000053",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   state: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/metadata/states/8c33b721-8782-11ed-c0a8-a00c000000b6",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/customerorder/metadata",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "printed": false
   "published": false
   "files": {
     rows: []
   },
   positions: {
     rows: []
   },
   "vatEnabled": true
   "vatIncluded": true,
   "paidSum": 0.0,
   "shippedSum": 0.0
   "invoicedSum": 0.0,
   "moves": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/move/bc8aa8d7-95fa-11ed-c0a8-a00c0000001a",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/move/metadata",
         "type": "move",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#move/edit?id=bc8aa8d7-95fa-11ed-c0a8-a00c0000001a"
       }
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/move/06406b97-9138-11e6-8a84-bae500000000",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/move/metadata",
         "type": "move",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#move/edit?id=06406b97-9138-11e6-8a84-bae500000000"
       }
     }
   ]
}
```

### Linking payments to transactions

Payments can be attached to some transactions in the JSON API. There are 4 types of payments: [Incoming payment](../documents/#transactions-incoming-payment), [Incoming order](../documents/#transactions-incoming-cash-payment), [Outgoing payment](.. /documents/#transactions-outgoing-payment), [Expense order](../documents/#transactions-outgoing-cash-payment).

Transactions that can be associated with payments contain a subcollection of **payments** among the transaction attributes. 

Payments, in turn, contain the **operations** collection - the operations to which this payment is linked. In order to link a payment to a transaction, you need to
to create/update a payment as part of the **operations** collection, specify **meta** of the transaction. 

Tansactions in this collection can have different types, but this does not mean that all 4 types of payments can be attached to any transaction. 

Valid types of payments are determined by the transaction itself, to which the binding takes place. For example, only an incoming payment or incoming order can be linked to the received commission agent's report. 

As a result of linking the payment, a new object will appear in the **operations** collection of the payment, pointing to the transaction, and in the **payments** collection, the transaction to which a payment is attached, a new element will appear referring to this payment.

### An example of linking a payment

Linking a receipt order to a Sales Order.

> An example of a request to link an incoming order to a Sales Order.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/cashin/7944ef04-f831-11e5-7a69-971500188b19
"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             operations: [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/559adab5-915c-11e6-8a84-bae500000014",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/customerorder/metadata",
                   "type": "sales order",
                   "mediaType": "application/json"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
The result is a credit note with a new element in the operations collection.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/cashin/834d731c-b313-11e6-8a84-bae50000008e",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/cashin/metadata",
     "type": "cash",
     "mediaType": "application/json"
   },
   "id": "834d731c-b313-11e6-8a84-bae50000008e",
   "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/b905bfb0-9128-11e6-8a84-bae50000002a",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   shared: false
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/b8ba0d3f-9128-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-11-25 16:31:47",
   "name": "1111",
   "externalCode": "WpAtzal3hGUnUfQS55x781",
   "moment": "2016-11-25 16:31:00",
   "applicable": true
   sum: 32131000,
   contract: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/contract/92df2d9c-ab02-11e6-8a84-bae500000084",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/contract/metadata",
       "type": "contract",
       "mediaType": "application/json"
     }
   },
   "project": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/project/6c6dd3f9-97a1-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
       "type": "project",
       "mediaType": "application/json"
     }
   },
   agent: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/b942c396-9128-11e6-8a84-bae500000056",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   organization: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "vatSum": 0,
   operations: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/559adab5-915c-11e6-8a84-bae500000014",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/customerorder/metadata",
         "type": "sales order",
         "mediaType": "application/json"
       },
       "linkedSum": 0
     }
   ]
}
```
