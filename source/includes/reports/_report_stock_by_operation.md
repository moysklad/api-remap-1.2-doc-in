### Transaction balances

The report "Balances by Transactions" is the issuance of Balances for the items of the specified
in the transaction path.

Balances can be obtained from the following transactions: Shipment, Sales Order, Supplier Invoice, Sales Invoice, Purchase Order, Receiving, Purchase Return, Sales Return.

Balances for the transaction **Shipment**, **Receiving**, **Purchase/Sales Return** are calculated at the time of the **moment** field in these transactions.

For **Sales Order**, **Sales Invoice**, **Purchase Order** and **Supplier Invoice**, balances are calculated at the current time.

#### Report object attributes:

| Value | TPI | Description |
| ------------- |-----|--------------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata, which is a link to the transaction for which Remainings are issued<br>`+Required when replying` |
| **positions** | Array(Object) | An array of objects representing the Remainder for each item.<br>`+Required when answering` |

#### Item attributes

| Value | TPI | Description |
| ------------- |-----|--------------|
|**meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata, which is a link to the item for which the Remaining is issued<br>`+Required when answering` |
|**name** | String(255) | Item name<br>`+Required when answering` |
|**stock** | float | Remaining<br>`+Required when answering` |
|**cost** | float | Cost price<br>`+Required when answering` |
|**inTransit** | float | Waiting<br>`+Required for response` |
|**reserve**| float | Reserve<br>`+Required when replying` |
|**quantity** | float | Available. The value of the **Set** entity is always `0`.<br>`+Required for response` |

### Get Transaction balances

Request to receive the "Transaction balance" report.
Balances for the **Shipment** transaction is calculated at the time of the **moment** field in these transactions.
For **Sales Order**, balances are calculated at the current time.

This query works with the following types of transactions:

+ [Shipment](../documents/#transactions-shipment)
+ [Sales Order](../documents/#transactions-sales-order)
+ [Supplier Invoice](../documents/#transactions-supplier-invoice)
+ [Purchase Order](../documents/#transactions-purchase-order)
+ [Receiving](../documents/#transactions-receiving)
+ [Purchase Returns](../documents/#transactions-purchase-returns)
+ [Sales Returns](../documents/#transactions-sales-return)

The result of the query is the balances on the items of the transaction, on the date of the transaction, from the warehouse specified in the transaction,
as well as the cost price of transaction items according to FIFO, taking into account the quantity.

#### Request examples

> Request to receive current balances without breakdown by warehouses.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/report/stock/byoperation?operation.id=34efe2ee-015e-11e6-9464-e4de0000006b"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

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
     "href": "https://app.kladana.in/api/remap/1.2/report/stock/byoperation?operation.id=34efe2ee-015e-11e6-9464-e4de0000006b",
     "type": "stockbyoperation",
     "mediaType": "application/json",
     "size": 1,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/34efe2ee-015e-11e6-9464-e4de0000006b",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/customerOrder/metadata",
         "type": "customerorder",
         "mediaType": "application/json"
       },
       "positions": [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/product/eeef177f-f648-11e5-8a84-bae50000007a",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json"
           },
           "name": "Hockey Stick",
           "stock": -2,
           "cost": 0,
           "inTransit": 0,
           "reserve": 0,
           "quantity": 0
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/product/60fc3826-00d7-11e6-9464-e4de00000097",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json"
           },
           "name": "Raising Penguins",
           "stock": 0,
           "cost": 0,
           "inTransit": 0,
           "reserve": 0,
           "quantity": 0
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/variant/d1bed68b-ffe7-11e5-9464-e4de0000001a",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
             "type": "variant",
             "mediaType": "application/json"
           },
           "name": "Comrade (10)",
           "stock": 0,
           "cost": 0,
           "inTransit": 0,
           "reserve": 0,
           "quantity": 0
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/variant/671b3522-f7d2-11e5-8a84-bae500000084",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
             "type": "variant",
             "mediaType": "application/json"
           },
           "name": "ItemManyModifications (1, 100, 30)",
           "stock": 3,
           "cost": 0,
           "inTransit": 0,
           "reserve": 0,
           "quantity": 3
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/product/66ccbc9f-f7d2-11e5-8a84-bae500000076",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json"
           },
           "name": "ItemManyModifications",
           "stock": 3,
           "cost": 0,
           "inTransit": 0,
           "reserve": 1,
           "quantity": 2
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/product/8b382799-f7d2-11e5-8a84-bae5000003a5",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json"
           },
           "name": "ItemManyModifications2",
           "stock": 0,
           "cost": 0,
           "inTransit": 0,
           "reserve": 0,
           "quantity": 0
         }
       ]
     }
   ]
}

```
