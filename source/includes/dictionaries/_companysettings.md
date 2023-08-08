## Company settings

You can get information about company settings and product price types.

#### Company settings
#### Entity attributes

| Title | Type | Description |
|----------|-------|------------|
| **checkMinPrice** | Boolean | Automatically set the minimum price. If enabled, when saving sales documents with prices less than the minimum prices (specified in the item cards), the prices will be automatically increased to the minimum prices.<br>`+Required when replying` |
| **checkShippingStock** | Boolean | Prohibit shipment of missing items. If the prohibition is set (true value), users will not be able to ship out-of-stock items from the warehouse.<br>`+Required when replying` |
| **companyAddress** | String(255) | Company email address |
| **currency** | [Meta](../#kladana-json-api-general-info-metadata) | Standard currency metadata<br>`+Required when replying` |
| **discountStrategy** | Enum | Joint application of discounts. [More details here](../dictionaries/#entities-nastrojki-kompanii-sowmestnoe-primenenie-skidok)<br>`+Required when answering` `+Required when creating` |
| **globalOperationNumbering** | Boolean | Use consecutive numbering of documents. If true, continuous numbering will be set for the entire history, otherwise the numbering of documents will start anew every calendar year.<br>`+Required when answering` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Company Settings Metadata<br>`+Required when replying` |
| **priceTypes** | Array(Object) | Collection of all existing price types. [More details here](../dictionaries/#entities-nastrojki-kompanii-tip-ceny)<br>`+Required when answering` |
| **useCompanyAddress** | Boolean | Use the company address for emails. If enabled, emails will be sent from the address specified in companyAddress, otherwise emails will be sent from the user's address.<br>`+Reply Required` |
| **useRecycleBin** | Boolean | Use cart. If enabled, all documents will be placed in the trash when they are deleted. It will also be possible to recover erroneously deleted documents.<br>`+Required when replying` |
| **accountCountry** | String(255) | Passed for information about which country configuration is active on the user's account. Possible values: RU, BY, KZ.<br>`+Required when replying` `+Read only` |

#### Price type
The structure of a separate object representing the price type:

| Title | Type | Description |
|----------|-------|------------|
| **externalCode** | String(255) | Price Type External Code<br>`+Required when replying` |
| **id** | UUID | Price Type ID<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Price Type Metadata<br>`+Required when Response` `+Read Only` |
| **name** | String(255) | Price Type Name<br>`+Required when replying` `+Required when creating` |

#### Combined application of discounts
An enumeration of values representing the combined application of discounts:

| Title | Description |
|----------|------------|
| **bySum** | Discount amount. Means that the amount of discounts should apply. |
| **byPriority** | Priority. There should be one, the most favorable discount for the buyer. |

#### Settings metadata
In the Company Settings metadata,the **customEntities** field shows a list of user dictionaries.
Each user directory contains the fields:

| Title | Type | Description |
|----------|-------|------------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the User Directory<br>`+Required when responding` `+Read Only` |
| **entityMeta** | URL | Link to the list of entities in this user reference |
| **name** | String(255) | Directory name |

### Get company settings
> Request for Company Settings.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/context/companysettings"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of Company Settings.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/context/companysettings",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/context/companysettings/metadata",
     "type": "companysettings",
     "mediaType": "application/json"
   },
   currency: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/currency/45ffbac2-24a5-11e6-8a84-bae500000055",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
       "type": "currency",
       "mediaType": "application/json"
     },
     "id": "45ffbac2-24a5-11e6-8a84-bae500000055",
     "system": true
     "name": "rub",
     "fullName": "Russian ruble",
     rate: 1
     "multiplicity": 1,
     "indirect": false
     "rateUpdateType": "manual",
     "code": "643",
     "isoCode": "RUB",
     "majorUnit": {
       "gender": "masculine",
       "s1": "ruble",
       "s2": "ruble",
       "s5": "rubles"
     },
     "minorUnit": {
       "gender": "feminine",
       "s1": "penny",
       "s2": "penny",
       "s5": "kopecks"
     },
     archived: false
     default: true
   },
   "priceTypes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
         "type": "pricetype",
         "mediaType": "application/json"
       },
       "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
       "name": "Price for friends",
       "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f4444",
         "type": "pricetype",
         "mediaType": "application/json"
       },
       "id": "672559f1-cbf3-11e1-9eb9-889ffa6f4444",
       "name": "Price for competitors",
       "externalCode": "cbcf493b-55bc-11d9-848a-00112f434444"
     }
   ],
   "discountStrategy": "bySum",
    "globalOperationNumbering": true,
    "checkShippingStock": true,
    "checkMinPrice": true,
    "useRecycleBin": true,
    "useCompanyAddress": true,
    "companyAddress": "MyCompany@kladana.in",
    "accountCountry": "RU"
}
```

### Edit Company Settings
  You can edit the following company settings:

| Title | Type | Description |
|----------|-------|------------|
| **checkMinPrice** | Boolean | Automatically set the minimum price. If enabled, when saving sales documents with prices less than the minimum prices (specified in the item cards), the prices will be automatically increased to the minimum prices. |
| **checkShippingStock** | Boolean | Prohibit shipment of missing items. If the prohibition is set (true value), users will not be able to ship out-of-stock items from the warehouse. |
| **companyAddress** | String(255) | Company email address |
| **discountStrategy** | Enum | Joint application of discounts. [More here](../dictionaries/#entities-nastrojki-kompanii-sowmestnoe-primenenie-skidok) |
| **globalOperationNumbering** | Boolean | Use consecutive numbering of documents. If true, continuous numbering will be set for the entire history, otherwise the numbering of documents will start anew every calendar year. |
| **useCompanyAddress** | Boolean | Use the company address for emails. If enabled, emails will be sent from the address specified in companyAddress, otherwise emails will be sent from the user's address. |
| **useRecycleBin** | Boolean | Use cart. If enabled, all documents will be placed in the trash when they are deleted. It will also be possible to recover mistakenly deleted documents. |

Partial editing is allowed - only the fields present in the request will be edited.
> Request to change settingscompanies.

```shell
curl -X PUT
   "https://app.kladana.in/api/remap/1.2/context/companysettings"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
       -d '{
"globalOperationNumbering": true,
"checkShippingStock": true,
       "checkMinPrice": true,
       "useRecycleBin": true,
       "useCompanyAddress": true,
       "companyAddress": "MyCompany@kladana.in",
       "discountStrategy": "bySum"
}'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of Company Settings.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/context/companysettings",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/context/companysettings/metadata",
     "type": "companysettings",
     "mediaType": "application/json"
   },
   currency: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/currency/45ffbac2-24a5-11e6-8a84-bae500000055",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
       "type": "currency",
       "mediaType": "application/json"
     },
     "id": "45ffbac2-24a5-11e6-8a84-bae500000055",
     "system": true
     "name": "rub",
     "fullName": "Russian ruble",
     rate: 1
     "multiplicity": 1,
     "indirect": false
     "rateUpdateType": "manual",
     "code": "643",
     "isoCode": "RUB",
     "majorUnit": {
       "gender": "masculine",
       "s1": "ruble",
       "s2": "ruble",
       "s5": "rubles"
     },
     "minorUnit": {
       "gender": "feminine",
       "s1": "penny",
       "s2": "penny",
       "s5": "kopecks"
     },
     archived: false
     default: true
   },
   "priceTypes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
         "type": "pricetype",
         "mediaType": "application/json"
       },
       "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
       "name": "Price for friends",
       "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f4444",
         "type": "pricetype",
         "mediaType": "application/json"
       },
       "id": "672559f1-cbf3-11e1-9eb9-889ffa6f4444",
       "name": "Price for competitors",
       "externalCode": "cbcf493b-55bc-11d9-848a-00112f434444"
     }
   ],
   "discountStrategy": "bySum",
    "globalOperationNumbering": true,
    "checkShippingStock": true,
    "checkMinPrice": true,
    "useRecycleBin": true,
    "useCompanyAddress": true,
    "companyAddress": "MyCompany@kladana.in",
    "accountCountry": "RU"
}
```

### Get company settings metadata
> Request to get company settings metadata.

```shell
curl -X GET
   "ttps://app.kladana.in/api/remap/1.2/context/companysettings/metadata"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of company settings metadata.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/context/companysettings",
     "mediaType": "application/json"
   },
   "customEntities": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/metadata/customEntities/eaacabaf-2655-11e6-8a84-bae500000045",
         "type": "customer metadata",
         "mediaType": "application/json"
       },
       "name": "Partners",
       "createShared": true
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/metadata/customEntities/f3aff189-2655-11e6-8a84-bae500000046",
         "type": "customer metadata",
         "mediaType": "application/json"
       },
       "name": "Advertising Agencies",
       "createShared": true
     }
   ]
}
```
