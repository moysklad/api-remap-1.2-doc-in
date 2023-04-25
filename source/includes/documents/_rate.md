### Currency in transactions

The **rate** field contains an object representing the currency in the transactions.

#### Currency object attributes

| Title | Type | Description |
| ------------ | ------- | ---------- |
| **currency** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Currency metadata<br>`+Required when replying` `+Expand` |
| **value** | float | Currency rate in this document (contained in the response if the rate value is different from 1) |

Instead of a currency reference, you can get the entire currency object using the `?expand=rate.currency` query parameter.