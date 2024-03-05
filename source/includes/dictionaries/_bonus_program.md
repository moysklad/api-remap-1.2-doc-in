## Bonus program
### Bonus programs

The entity code for Bonus Programs as part of the JSON API is the **bonusprogram** keyword. Create and update operations are not supported. Before working with discounts learn more about [Discounting](https://kladana.zendesk.com/hc/en-us/sections/360005674458-Discounting).

#### Entity attributes

| Title                         | Type | Description |
|-------------------------------| ------------ | ------------- |
| **accountId**                 | UUID | Account ID<br>`+Required when replying` `+Read Only` |
| **active**                    | Boolean | An indicator of whether the bonus program is currently active<br>`+Required when answering` |
| **agentTags**                 | Array(String) | Tags of counterparties to which the bonus program is applied. In the case of an empty account value, an empty array is displayed as a result.<br>`+Required when replying` |
| **allAgents**                 | Boolean | An indicator of whether the discount applies to all counterparties (see [Discounts](../dictionaries/#entities-discounts))<br>`+Required when answering` |
| **allProducts**               | Boolean | An indicator of whether the bonus program is valid for all products (always `true`, see [Discounts](../dictionaries/#entities-discounts))<br>`+Required when answering` |
| **earnRateRoublesToPoint**    | Int | Accrual rate |
| **earnWhileRedeeming**        | Boolean | Allow simultaneous accrual and write-off of bonuses. If `true` - bonuses will be credited to the monetary part of the purchase, even if the purchase is partially paid with points.<br>`+Required when answering` |
| **id**                        | UUID | Bonus Program ID<br>`+Required when replying` `+Read Only` |
| **maxPaidRatePercents**       | Int | Maximum percentage of payment by points |
| **meta**                      | [Meta](../#kladana-json-api-general-info-metadata) | Bonus Program Metadata<br>`+Required when answering` |
| **name**                      | String(255) | Name of the Bonus program |
| **postponedBonusesDelayDays** | Int | Points are credited after [N] days<br>`+Tariff option "Extended bonus program"` |
| **spendRatePointsToRouble**   | Int | Write-off rate |
| **welcomeBonusesEnabled**     | Boolean | Ability to earn welcome points<br>`+Required when answering` |
| **welcomeBonusesMode**        | Enum | Condition for earning welcome points. Cannot be empty if `welcomeBonusesEnabled` = true. [More here](../dictionaries/#entities-bonus-program-bonus-programs-entity-attributes-bonus-points-conditions) |
| **welcomeBonusesValue**       | Int | The number of welcome points accrued to the participants of the bonus program. Can't be negative. Cannot be empty if `welcomeBonusesEnabled` = true |

##### Bonus points conditions

| Title | Description |
| --------- | ------------- |
| **REGISTRATION** | Welcome points are awarded to participants after registration in the bonus program. |
| **FIRST_PURCHASE** | Welcome points are awarded to the participants of the bonus program after making the first purchase. |

### Get all Bonus Programs

Request to receive all bonus programs of the account.
Result: JSON object including fields:

| Title | Type | Description |
| ----------- | -------- | ---------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | Array of JSON objects representing Bonus Programs |

**Parameters**

| Parameter | Description |
| --------- | ----------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get all Bonus Programs

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/bonusprogram"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a list of all bonus programs for the account.

```json
{
   "context": {
     "employee": {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/context/employee",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     }
   },
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/bonusprogram",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/metadata",
     "type": "bonusprogram",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/1223d051-ba76-11e8-3353-995e0000005a",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/metadata",
         "type": "bonusprogram",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#discount/edit?id=1223d051-ba76-11e8-3353-995e0000005a"
       },
       "id": "1223d051-ba76-11e8-3353-995e0000005a",
       "accountId": "dbb8cfc1-cbfa-11e1-6dfb-889ffa6f49fd",
       "name": "test",
       "active": true,
       "allAgents": true,
       "agentTags": [
         "group of agents"
       ],
       "earnRateRoublesToPoint": 1,
       "spendRatePointsToRouble": 1,
       "maxPaidRatePercents": 100,
       "welcomeBonusesEnabled": false,
       "postponedBonusesDelayDays": 14,
       "earnWhileRedeeming": true
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/87c69fae-c1ad-4700-a852-f21939470760",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/metadata",
         "type": "bonusprogram",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#discount/edit?id=1223d051-ba76-11e8-3353-995e0000005a"
       },
       "id": "87c69fae-c1ad-4700-a852-f21939470760",
       "accountId": "dbb8cfc1-cbfa-11e1-6dfb-889ffa6f49fd",
       "name": "bonus program",
       "active": false,
       "allAgents": true,
       "agentTags": [
         "group of agents"
       ],
       "earnRateRoublesToPoint": 7,
       "spendRatePointsToRouble": 4,
       "maxPaidRatePercents": 50,
       "welcomeBonusesEnabled": true,
       "welcomeBonusesValue": 100,
       "welcomeBonusesMode": "REGISTRATION",
       "postponedBonusesDelayDays": 7,
       "earnWhileRedeeming": true
     }
   ]
}
```

### Bonus program

### Create Bonus Program

Request to create a new bonus program. Required fields: **name** (name of the discount), **active** (is the discount active), **allProducts** (is the discount valid for all products), **allAgents** (is the discount active for all counterparties) **earnRateRoublesToPoint** (accrual rate), **spendRatePointsToRouble** (write-off rate), **maxPaidRatePercents** (maximum percentage of payment by points).

> An example of creating a new bonus program

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/bonusprogram"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
              "name": "bonus program",
              "active": true,
              "allProducts": true,
              "allAgents": false,
              "agentTags": [
                  "tag1",
                  "tag2"
              ],
              "earnRateRoublesToPoint": 7,
              "spendRatePointsToRouble": 4,
              "maxPaidRatePercents": 50,
              "postponedBonusesDelayDays": 7,
              "earnWhileRedeeming": false
          }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created bonus program.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/87c69fae-c1ad-4700-a852-f21939470760",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/metadata",
     "type": "bonusprogram",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#discount/edit?id=1223d051-ba76-11e8-3353-995e0000005a"
   },
   "id": "87c69fae-c1ad-4700-a852-f21939470760",
   "accountId": "dbb8cfc1-cbfa-11e1-6dfb-889ffa6f49fd",
   "name": "bonus program",
   "active": false,
   "agentTags": ["tag1", "tag2"],
   "earnRateRoublesToPoint": 7,
   "spendRatePointsToRouble": 4,
   "maxPaidRatePercents": 50,
   "welcomeBonusesEnabled": false,
   "postponedBonusesDelayDays": 7,
   "earnWhileRedeeming": false
}
```

### Change Bonus Program

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| id | `string` (required) *Example: 87c69fae-c1ad-4700-a852-f21939470760* Rewards program ID. |

Request to change the bonus program. In the body of the request, you must pass the fields that will be changed

> An example of changing the bonus program

```shell
   curl -X PUT
     "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/87c69fae-c1ad-4700-a852-f21939470760"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'{
              "name": "updatedName",
              "active": true,
              "agentTags": [
                  "tag2"
              ]
          }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the modified bonus program.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/87c69fae-c1ad-4700-a852-f21939470760",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/metadata",
     "type": "bonusprogram",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#discount/edit?id=87c69fae-c1ad-4700-a852-f21939470760"
   },
   "id": "87c69fae-c1ad-4700-a852-f21939470760",
   "accountId": "dbb8cfc1-cbfa-11e1-6dfb-889ffa6f49fd",
   "name": "bonus program",
   "active": true,
   "agentTags": ["tag2"],
   "earnRateRoublesToPoint": 7,
   "spendRatePointsToRouble": 4,
   "maxPaidRatePercents": 50,
   "welcomeBonusesEnabled": false,
   "earnWhileRedeeming": true
}
```


### Get the Bonus Program

**Parameters**

| Parameter | Description |
| ------- | ------------ |
| **id** | `string` (required) *Example: 87c69fae-c1ad-4700-a852-f21939470760* Rewards program ID. |

> Request for a separate bonus program with the specified ID

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/87c69fae-c1ad-4700-a852-f21939470760"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```
  
> Response 200(application/json)
Successful request. The result is a JSON representation of the Bonus Program with the specified ID.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/87c69fae-c1ad-4700-a852-f21939470760",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/metadata",
     "type": "bonusprogram",
     "mediaType": "application/json",
     "uuidHref": "https://app.kladana.in/app/#discount/edit?id=1223d051-ba76-11e8-3353-995e0000005a"
   },
   "id": "87c69fae-c1ad-4700-a852-f21939470760",
   "accountId": "dbb8cfc1-cbfa-11e1-6dfb-889ffa6f49fd",
   "name": "bonus program",
   "active": false,
   "agentTags": [
     "group of agents"
   ],
   "earnRateRoublesToPoint": 7,
   "spendRatePointsToRouble": 4,
   "maxPaidRatePercents": 50,
   "welcomeBonusesEnabled": false,
   "postponedBonusesDelayDays": 7,
   "earnWhileRedeeming": true
}
```

### Remove Bonus Program

**Parameters**

| Parameter | Description |
| ------- | --------- |
| **id** | `string` (required) *Example: 87c69fae-c1ad-4700-a852-f21939470760* Rewards program ID. |

> Request to remove bonus program

```shell
curl -X DELETE
   "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/87c69fae-c1ad-4700-a852-f21939470760"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful removal of the Bonus program

### Bulk removal of Bonus programs

In the body of the request, you need to pass an array containing JSON metadata of the Bonus Programs you wish to remove.

> Bulk removal request for Rewards Programs.

```shell
curl -X POST
   "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
        {
            "meta": {
                "href": "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/7944ef04-f831-11e5-7a69-971500188b1",
                "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/metadata",
                "type": "bonusprogram",
                "mediaType": "application/json"
            }
        },
        {
            "meta": {
                "href": "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/7944ef04-f831-11e5-7a69-971500188b2",
                "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/bonusprogram/metadata",
                "type": "bonusprogram",
                "mediaType": "application/json"
            }
        }
      ]'
```

> Successful request. The result is JSON information about the removal of Bonus programs.

```json
[
   {
     "info":"Entity 'bonusprogram' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'bonusprogram' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```
