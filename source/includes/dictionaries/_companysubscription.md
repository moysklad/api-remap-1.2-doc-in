## Company Subscription

The entity code for a Company Subscription in the JSON API is the **subscription** keyword.

Get information about the current subscription of the company.

#### Company Subscription
#### Entity attributes

| Title | Type        | Description |
| ---------|-------------| ---------- |
| **role** | String(255) | Authorized user role (USER/ADMIN)<br>`+Required when replying` `+Read-only` |
| **tariff** | String(255) | Account's current rate<br>`+Required when replying` `+Read only` |
| **isSubscriptionChangeAvailable** | Boolean     | Subscription Change Availability<br>`+Required when replying` `+Read Only` |
| **subscriptionEndDate** | Long        | Date (in milliseconds) when the current tariff expires, if the tariff is different from “Trial” and “Free”<br>`+Required when replying` `+Read Only` |

#### Current account rate
Tariff field values

| Meaning | Description |
| --------- | --------- |
| **BASIC** | Tariff "Basic" |
| **CORPORATE** | Tariff "Corporate" |
| **FREE** | Tariff "Free 2014" |
| **MINIMAL** | Tariff "Individual" |
| **PROFESSIONAL** | Tariff "Professional" |
| **RETAIL** | Tariff "Free" |
| **START** | Tariff "Start" |
| **TRIAL** | Tariff "Trial" |

### Get Company Subscription
> Request for a company subscription.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/accountSettings/subscription"
   -H Authorization: Basic <Credentials>
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the company's Subscription.

```json
{
     "role": "admin",
     "tariff": "CORPORATE",
     "isSubscriptionChangeAvailable": true,
     "subscriptionEndDate": 1642520241922
}
```
