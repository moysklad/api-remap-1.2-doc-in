## Indicators

As part of the JSON API, you can request daily, monthly, and weekly metrics. Accessing the report via the API requires the right to view `viewDashboard` metrics.

### Indicators object structure

| Title | Type | Description |
| ------ | ----- | ---------- |
| **sales** | Object | A nested object that represents sales information for the specified period. [Learn more](../dictionaries/#entities-product-products-entity-attributes-tax-system-code)<br>`+Required when answering` |
| **orders** | Object | A nested object representing information about orders for the specified period. [Learn more](../dictionaries/#entities-product-products-entity-attributes-tax-system-code)<br>`+Required when answering` |
| **money** | Object | A nested object representing money information for the specified period. [Learn more](../dictionaries/#entities-product-products-entity-attributes-tax-system-code)<br>`+Required when answering` |
  
#### Sales for the period

| Title | Type | Description |
| ----- |------| -----------|
| **count** | Int  | Number of sales<br>`+Required when answering` |
| **amount** | Int  | Profit<br>`+Required when answering` |
| **movementAmount** | Int  | Delta compared to the previous same period<br>`+Required when answering` |

#### Orders for the period

| Title | Type | Description |
| ------------------ |------| --------- |
| **count** | Int  | Number of sales<br>`+Required when answering` |
| **amount** | Int  | Profit<br>`+Required when answering` |
| **movementAmount** | Int  | Delta compared to the previous same period<br>`+Required when answering` |

#### Money for the period

| Title | Type  | Description |
| ----------------- |-------| --------- |
| **income** | Int   | Income for the period<br>`+Required when answering` |
| **outcome** | Float | Expenses for the period<br>`+Required when answering` |
| **balance** | Float | Current balance<br>`+Required when answering` |
| **todayMovement** | Float | Delta for today<br>`+Required when answering` |
| **movement** | Float | Delta for the period<br>`+Required when answering` |

### Get daily metrics
> Request for daily metrics.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/report/dashboard/day"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the metrics.

```json
{
   "sales": {
     "count": 0,
     "amount": 0,
     "movementAmount": -80000
   },
   "orders": {
     "count": 0,
     "amount": 0,
     "movementAmount": 0
   },
   "money": {
     "income": 0,
     "outcome": 0,
     "balance": 69700,
     "todayMovement": 0,
     "movement": 0
   }
}
```

### Get weekly stats

> Request for weekly metrics.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/report/dashboard/week"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the metrics.

```json
{
   "sales": {
     "count": 0,
     "amount": 0,
     "movementAmount": -80000
   },
   "orders": {
     "count": 0,
     "amount": 0,
     "movementAmount": 0
   },
   "money": {
     "income": 0,
     "outcome": 0,
     "balance": 69700,
     "todayMovement": 0,
     "movement": 0
   }
}

```

### Get monthly figures

> Request for monthly metrics.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/report/dashboard/month"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the metrics.

```json
{
   "sales": {
     "count": 0,
     "amount": 0,
     "movementAmount": -80000
   },
   "orders": {
     "count": 0,
     "amount": 0,
     "movementAmount": 0
   },
   "money": {
     "income": 0,
     "outcome": 0,
     "balance": 69700,
     "todayMovement": 0,
     "movement": 0
   }
}
```
