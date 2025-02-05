## The Transaction Stock

The transaction stock report is a brief variant of the Stock report for the items specified in the transaction path.

The Stock report by transaction can be obtained for the following transactions: Shipment, Sales Order, Supplier Invoice, Sales Invoice, Purchase Order, Receiving, Purchase Return, Sales Return.

The stock for the **Shipment**, **Receiving**, **Purchase/Sales Return** transactions is calculated at the time indicated in the **moment** field in the transaction.

The stock for the **Sales Order**, **Sales Invoice**, **Purchase Order** and **Supplier Invoice** transactions is calculated at the moment of the request.

#### Report object attributes

| Value | TPI | Description |
| ------------- |-----|--------------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the transaction which stock is requested<br>`+Required when replying` |
| **positions** | Array(Object) | An array of objects representing the stock<br>`+Required when replying` |

#### Item attributes

| Value | TPI | Description |
| ------------- |-----|--------------|
|**meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the transaction which stock is requested<br>`+Required when replying` |
|**name** | String(255) | Item name<br>`+Required when replying` |
|**stock** | Float | Stock<br>`+Required when replying` |
|**cost** | Float | Cost price in paise<br>`+Required when replying` |
|**inTransit** | Float | Waiting. The **bundle** entity always has a value of `0`.<br>`+Required for response` |
|**reserve**| Float | Reserve. The **bundle** entity always has a value of `0`.<br>`+Required when replying` |
|**quantity** | Float | Available. The **bundle** entity always has a value of `0`.<br>`+Required for response` |

### Get Transaction Stock

Request to receive the Transaction stock report. The stock for the **Shipment** transaction is calculated at the time indicated in the **moment**. The stock of **Sales Order** is calculated at the moment of request.

This query works with the following types of transactions:

+ [Shipment](../documents/#transactions-shipment)
+ [Sales Order](../documents/#transactions-sales-order)
+ [Supplier Invoice](../documents/#transactions-supplier-invoice)
+ [Purchase Order](../documents/#transactions-purchase-order)
+ [Receiving](../documents/#transactions-receiving)
+ [Purchase Returns](../documents/#transactions-purchase-returns)
+ [Sales Returns](../documents/#transactions-sales-return)

The result of the query is the stock of items in the transaction, on the date of the transaction, from the warehouse specified in the transaction, the cost price of transaction items according to FIFO, taking into account the quantity.

#### Request examples

> Request to receive the current stock without detalization by warehouse.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/report/stock/byoperation?operation.id=34efe2ee-015e-11e6-9464-e4de0000006b"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the report.

```json
{
   "context": {
     "employee": {
       "href": "https://api.kladana.com/api/remap/1.2/context/employee",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/report/stock/byoperation?operation.id=34efe2ee-015e-11e6-9464-e4de0000006b",
     "type": "stockbyoperation",
     "mediaType": "application/json",
     "size": 1,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/34efe2ee-015e-11e6-9464-e4de0000006b",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerOrder/metadata",
         "type": "customerorder",
         "mediaType": "application/json"
       },
       "positions": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/eeef177f-f648-11e5-8a84-bae50000007a",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
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
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/60fc3826-00d7-11e6-9464-e4de00000097",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
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
             "href": "https://api.kladana.com/api/remap/1.2/entity/variant/d1bed68b-ffe7-11e5-9464-e4de0000001a",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
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
             "href": "https://api.kladana.com/api/remap/1.2/entity/variant/671b3522-f7d2-11e5-8a84-bae500000084",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
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
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/66ccbc9f-f7d2-11e5-8a84-bae500000076",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
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
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/8b382799-f7d2-11e5-8a84-bae5000003a5",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
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
