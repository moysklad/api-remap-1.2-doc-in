### Recalculation of the calculated balance in Inventory Count

Using JSON API, you can recalculate the calculated balances in the items of an Inventory Count. As a result, the value of the **calculatedQuantity** field of the Inventory Count item will change and the document will be resaved.

#### Recalculation of the calculated balance in Inventory Count

**Parameters**

| Parameter | Description |
| ------- | ---- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Inventory Count id. |

Send a request to recalculate the estimated balances of Inventory Count items.

> An example of a request (with an empty body) to recalculate the calculated balances of the Inventory Count item.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/rpc/inventory/7944ef04-f831-11e5-7a69-971500188b19/recalcCalculatedQuantity"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d''
```

> Response 201(application/json)
Successful request. The result is an empty response body.
