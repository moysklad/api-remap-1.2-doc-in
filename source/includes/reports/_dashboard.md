## Indicators

As part of the JSON API, you can request daily, monthly, and weekly metrics. Accessing the report via the API requires the right to view `viewDashboard` metrics.

### Indicators object structure

| Title | Type | Description |
| ------ | ----- | ---------- |
| **sales** | object | A nested object that represents sales information for the specified period. [Learn more](../dictionaries/#suschnosti-towar-towary-atributy-suschnosti-kod-sistemy-nalogooblozheniq)<br>`+Required when answering` |
| **orders** | object | A nested object representing information about orders for the specified period. [Learn more](../dictionaries/#suschnosti-towar-towary-atributy-suschnosti-kod-sistemy-nalogooblozheniq)<br>`+Required when answering` |
| **money** | object | A nested object representing money information for the specified period. [Learn more](../dictionaries/#suschnosti-towar-towary-atributy-suschnosti-kod-sistemy-nalogooblozheniq)<br>`+Required when answering` |
  
#### Sales for the period

| Title | Type | Description |
| ----- | ------- | -----------|
| **count** | int | Number of sales<br>`+Required when answering` |
| **amount** | int | Profit<br>`+Required when answering` |
| **movementAmount** | int | Delta compared to the previous same period<br>`+Required when answering` |

#### Orders for the period

| Title | Type | Description |
| ------------------ | ----- | --------- |
| **count** | int | Number of sales<br>`+Required when answering` |
| **amount** | int | Profit<br>`+Required when answering` |
| **movementAmount** | int | Delta compared to the previous same period<br>`+Required when answering` |

#### Money for the period

| Title | Type | Description |
| ----------------- | ---- | --------- |
| **income** | int | Income for the period<br>`+Required when answering` |
| **outcome** | float | Expenses for the period<br>`+Required when answering` |
| **balance** | float | Current balance<br>`+Required when answering` |
| **todayMovement** | float | Delta for today<br>`+Required when answering` |
| **movement** | float | Delta for the period<br>`+Required when answering` |

### Get daily metrics
> Request for daily metrics.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/report/dashboard/day"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the metrics.

```json
{
   sales: {
     count: 0
     "amount": 0
     "movementAmount": -80000
   },
   orders: {
     count: 0
     "amount": 0
     "movementAmount": 0
   },
   money: {
     "income": 0,
     "outcome": 0,
     "balance": 69700,
     "todayMovement": 0,
     movement: 0
   }
}
```

### Get weekly stats

> Request for weekly metrics.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/report/dashboard/week"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the metrics.

```json
{
   sales: {
     count: 0
     "amount": 0
     "movementAmount": -80000
   },
   orders: {
     count: 0
     "amount": 0
     "movementAmount": 0
   },
   money: {
     "income": 0,
     "outcome": 0,
     "balance": 69700,
     "todayMovement": 0,
     movement: 0
   }
}

```

### Get monthly figures

> Request for monthly metrics.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/report/dashboard/month"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the metrics.

```json
{
   sales: {
     count: 0
     "amount": 0
     "movementAmount": -80000
   },
   orders: {
     count: 0
     "amount": 0
     "movementAmount": 0
   },
   money: {
     "income": 0,
     "outcome": 0,
     "balance": 69700,
     "todayMovement": 0,
     movement: 0
   }
}
```