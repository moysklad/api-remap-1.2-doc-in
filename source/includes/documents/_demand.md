## Shipment
### Shipments

Using the JSON API, you can create and update information about Shipments, request lists of Shipments, and information on individual Shipments. Shipment items can be managed both as part of a separate Shipment, and separately using special resources for managing Shipment items. 

The entity code for Shipment as part of the JSON API is the **demand** keyword. Learn more about [Shipment](https://kladana.zendesk.com/hc/en-us/articles/360012338478-Create-Shipments).

Shipment supports external widget change notification protocol **change-handler**.

#### Entity attributes

| Title | Type | Filtration | Description |
|-----------|---------| --------- |--------|
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **agent** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Counterparty metadata<br>`+Required when replying` `+Expand` `+Required when creating` `+Change-handler` `+Update-provider` |
| **agentAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Counterparty account metadata<br>`+Expand` `+Change-handler` `+Update-provider` |
| **applicable** | Boolean | `=` `!=` | Postmark<br>`+Required when replying` `+Change-handler` `+Update-provider` |
| **attributes** | Array(Object) | [Operators add. fields](../#mojsklad-json-api-obschie-swedeniq-fil-traciq-wyborki-s-pomosch-u-parametra-filter-fil-traciq-po-dopolnitel-nym-polqm) | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields)<br> `+Change-handler` `+Update-provider` |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Shipment Code |
| **contract** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Contract metadata<br>`+Expand` `+Change-handler` `+Update-provider` |
| **created** | datetime | `=` `!=` `<` `>` `<=` `>=` | Creation date<br>`+Required for response` `+Read-only` `+Change-handler` |
| **deleted** | datetime | `=` `!=` `<` `>` `<=` `>=` | The moment when Shipment was last deleted<br>`+Read Only` |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Shipment Comment <br/> `+Change-handler` `+Update-provider`|
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | External Shipment Code<br>`+Required in response` `+Change-handler` |
| **files** | MetaArray | | [Files](../dictionaries/#entities-fajly) array metadata. Maximum number of files - 100.<br>`+Required when replying` `+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID | `=` `!=` | Shipment ID<br>`+Required for response` `+Read-only` `+Change-handler` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Shipment Metadata<br>`+Required in response` `+Change-handler` |
| **moment** | datetime | `=` `!=` `<` `>` `<=` `>=` | Shipment date<br>`+Required for response` `+Change-handler` `+Update-provider` |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Name of Shipment<br>`+Required for response` `+Change-handler` `+Update-provider` |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Legal entity metadata<br>`+Required when responding` `+Expand` `+Required when creating` `+Change-handler` `+Update-provider` |
| **organizationAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Legal entity account metadata<br>`+Expand` `+Change-handler` `+Update-provider` |
| **overhead** | object | | Overheads. [More details here](../dictionaries/#dokumenty-shipment-otgruzki-nakladnye-rashody). If Shipping Items are not set, then charges cannot be set<br>`+Update-provider` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Required when replying` `+Expand` |
| **paidSum** | float || Amount of incoming payments for Shipment<br>`+Required when replying` `+Read only` |
| **positions** | MetaArray | | Shipment item metadata<br>`+Required in response` `+Expand` `+Change-handler` `+Update-provider` |
| **printed** | Boolean | `=` `!=` | Is the Shipment document printed<br>`+Required when responding` `+Read Only` |
| **project** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Project metadata<br>`+Expand` `+Change-handler` `+Update-provider` |
| **published** | Boolean | `=` `!=` | Is the Shipment document published<br>`+Required when replying` `+Read Only` |
| **rate** | object | | Currency. [More details here](../documents/#transactions-teh-operaciq-valuta-w-dokumentah)<br>`+Required when replying` `+Change-handler` `+Update-provider` |
| **salesChannel** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Sales channel metadata<br>`+Expand` |
| **shared** | Boolean | `=` `!=` | Sharing<br>`+Required when replying` |
| **shipmentAddress** | String(255) | `=` `!=` `~` `~=` `=~` | Shipping address Shipping <br/> `+Change-handler` |
| **shipmentAddressFull** | object | | Delivery address of Shipments with details for individual fields. [More details here](../documents/#transactions-shipment-otgruzki-attributy-suschnosti-adres-dostawki)<br> `+Change-handler` |
| **state** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Shipment status metadata<br>`+Expand` `+Change-handler` `+Update-provider` |
| **store** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Warehouse metadata<br>`+Required when responding` `+Expand` `+Required when creating` `+Change-handler` `+Update-provider` |
| **sum** | int | `=` `!=` `<` `>` `<=` `>=`| Shipment amount in rupees<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **syncId** | UUID | `=` `!=` | Synchronization ID. After filling it is not available for change |
| **updated** | datetime | `=` `!=` `<` `>` `<=` `>=` | Shipment last updated time<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **vatEnabled** | Boolean | | Is VAT taken into account<br>`+Required when replying` `+Change-handler` `+Update-provider` |
| **vatIncluded** | Boolean | | Is VAT included in the price <br/> `+Change-handler` `+Update-provider` |
| **vatSum** | float | | VAT amount <br/> `+Change-handler` `+Read-only` |

#### Overhead Expenses

Description of overhead fields.

| Title | Type | Description |
| ------- | ----- | -------- |
| **sum** | int | Amount in rupees<br>`+Required when replying` `+Update-provider` |
| **distribution** | Enum | Overhead distribution `[weight, volume, price]` -> `[by weight, by volume, by price]`<br>`+Required when replying` `+Update-provider` |

#### Links to other transactions

| Title | Description |
| ------- | -------- |
| **customerOrder** | Link to the Sales Orderto which this Shipment is associated in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **returns** | An array of links to related returns in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **payments** | An array of links to related payments in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **invoicesOut** | An array of links to related customer invoices in the format [Metadata](../#kladana-json-api-general-info-metadata) |

#### Other fields

| Title | Type | Description |
| ------- | ------- | -------- |
| **cargoName** | String(255) | Name of cargo <br/> `+Change-handler` |
| **carrier** | [Meta](../#kladana-json-api-general-info-metadata) | Carrier metadata (contractor or legal entity)<br>`+Expand` `+Change-handler` |
| **consignee** | [Meta](../#kladana-json-api-general-info-metadata) | Consignee's metadata (contractor or legal entity) <br/> `+Change-handler` |
| **goodPackQuantity** | int | Total seats <br/> `+Change-handler` |
| **shipping instructions** | String(255) | Shipper instructions <br/> `+Change-handler` |
| **stateContractId** | String(255) | Identifier of the state contract, contract (agreement) <br/> `+Change-handler` |
| **transport facility** | String(255) | Vehicle <br/> `+Change-handler` |
| **transportFacilityNumber** | String(255) | Vehicle number <br/> `+Change-handler` |

#### Shipment Items

Shipment Items is a list of products, product variants, bundles, and services.

The Shipment item object contains the following fields:

| Title | Type | Description |
| ------ | ------ | ------- |
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the product/service/series/modification/bundle, which is the item<br>`+Required when replying` `+Expand` `+Change-handler` `+Update-provider` |
| **cost** | int | Cost price (only for services) |
| **discount** | int | The percentage of the discount or markup. The markup is indicated as a negative number, i.e. -10 will create a markup of 10%<br>`+Required when replying` `+Change-handler` `+Update-provider` |
| **id** | UUID | Item ID<br>`+Required for response` `+Read-only` `+Change-handler` |
| **pack** | object | Product packaging. [More info here](../dictionaries/#entities-towar-towary-atributy-wlozhennyh-suschnostej-upakowki-towara) `+Change-handler` `+Update-provider` |
| **price** | float | The price of the product/service in rupees<br>`+Required when replying` `+Change-handler` `+Updat-provider` |
| **quantity** | int | The number of goods/services of this type in the item. If the item is a product that has tracking by serial numbers enabled, then the value in this field will always be equal to the number of serial numbers for this item in the document.<br>`+Required when replying` `+Change-handler` `+Update-provider ` |
| **slot** | [Meta](../#kladana-json-api-general-info-metadata) | Cell in the warehouse. [More here](../dictionaries/#entities-sklad-yachejki-sklada)<br>`+Expand` |
| **things** | Array(String) | Serial numbers. The value of this attribute is ignored if the item is not in serial accounting. Otherwise, the number of items in the item will be equal to the number of serial numbers passed in the attribute value. `+Change-handler` |
| **tracking codes** | Array(Object) | Codes for marking goods and transport packages. [More details here](../documents/#transactions-shipment-otgruzki-kody-markirowki-towarow-i-transportnyh-upakowok) |
| **trackingCodes_1162** | Array(Object) | Codes for marking goods in tag format 1162. [More details here](../documents/#transactions-shipment-otgruzki-kody-markirowki-towarow-i-transportnyh-upakowok-w-formate-tega-1162) |
| **overhead** | int | Overheads. [More here](../dictionaries/#dokumenty-stock-adjustment-oprihodowaniq-nakladnye-rashody). If no Shipment Items are set, then Write-offs cannot be set.<br>`+Required when replying` `+Read Only` |
| **vat** | int | VAT applicable to the current item<br>`+Required when replying` `+Change-handler` `+Update-provider` |
| **vatEnabled** | Boolean | Whether VAT is included for the item. With this flag, you can set VAT = 0 or VAT = "excluding VAT" for an item. (vat = 0, vatEnabled = false) -> vat = "without VAT", (vat = 0, vatEnabled = true) -> vat = 0%.<br>`+Required when replying` `+Change-handler` ` +Update-provider` |

You can work with items using [special resources for managing Shipments](../documents/#transactions-shipment-pozicii-otgruzki), and also as part of a separate Shipment. When working as part of a separate Shipment, you can send requests to create a separate Shipment with included in the request body array of Shipment items. 
If the number of items exceeds the maximum allowed, then for further replenishment of items, you will need to work with a special resource "Shipment items".

Also, when working as part of a separate Shipment, you can send requests to update the list of items
with an array of Shipment items included in the request body. It is important to remember that the collection of items will be perceived as "all Shipment items" and will completely replace the existing collection when updating the object - superfluous
items will be deleted, new ones added, existing ones changed.

About working with Shipments fields can be read [here](../#kladana-json-api-general-info-additional-fields).

#### Codes for marking of goods and transport packages

Supported as a hierarchical JSON structure.

| Title | Type | Description |
| ------ | ------- | -------- |
| **cis** | string | Marking code value<br>`+Required when replying` `+Required when creating` |
| **type** | Enum | Marking code type. Possible values: `trackingcode`, `consumerpack`, `transportpack`<br>`+Required when replying` `+Required when creating` |
| **tracking codes** | Array(Object) | An array of nested marking codes. Maybebe present only if **type** is `consumerpack` or `transportpack` |

The code value is specified in the **cis** attribute.
For each code, the **type** type is specified: `trackingcode` (product labeling code), `consumerpack` (consumer package labeling code) or `transportpack` (shipping packaging code).
Nesting of product labeling codes in shipping packages is allowed. Shipping packages cannot have nested packages.
Packing codes may be missing - in this case the structure will not be nested.

If the product is not tagged, then the tagging codes for the item will not be saved.
The number of marking codes may differ from the actual number of product units.

#### Codes for marking goods and transport packages in tag format 1162

Supported as a hierarchical JSON structure.

| Title | Type | Description |
| ------ | ------ | --------- |
| **cis_1162** | string | The value of the marking code in the tag format 1162<br>`+Required for response` `+Read only` |
| **type** | Enum | Marking code type. Possible values: `trackingcode`, `consumerpack`, `transportpack`<br>`+Required for response` `+Read only` |
| **trackingCodes_1162** | Array(Object) | An array of nested marking codes in tag format 1162. Can only be present if **type** is `consumerpack` or `transportpack` |

The code value is specified in the **cis_1162** attribute.
For each code, the **type** type is specified: `trackingcode` (product labeling code), `consumerpack` (consumer package labeling code) or `transportpack` (shipping packaging code).
Nesting of product labeling codes in shipping packages is allowed. Shipping packages cannot have nested packages.
Packing codes may be missing - in this case the structure will not be nested.

If the product is not tagged, then the tagging codes in tag format 1162 for the item will not be stored.
The number of marking codes may differ from the actual number of product units.

#### Working with marking codes and serial numbers for a transaction item

When working with a Shipment item, the following features should be taken into account.

+ The number of **trackingCodes** marking codes in a document item does not affect the number of **quantity** units in the item.
+ The number of serial numbers **things** in the item of the document strictly corresponds to the number of **quantity** units in the item.
   Changing **quantity** to a value that does not match the number of serial numbers is not allowed.
+ To update the list of tracking codes **trackingCodes** and the list of serial numbers **things** of a Shipment item,
   it is necessary to transfer their complete list, including both old and new values. Missing values will be removed during the update.
  
It is unacceptable to store duplicate marking codes and serial numbers inside the Shipment document.

#### Entity attributes Delivery address

| Title | Type | Description |
| ----- | ---- | -------- |
| **addInfo** | String(255) | Other |
| **apartment** | String(30) | Apartment |
| **city** | String(255) | City |
| **comment** | String(255) | Comment |
| **country** | [Meta](../#kladana-json-api-general-info-metadata) | Country metadata |
| **house** | String(30) | House |
| **postalCode** | String(6) | Postcode |
| **region** | [Meta](../#kladana-json-api-general-info-metadata) | Region metadata |
| **street** | String(255) | Street |

The address string is a concatenation of the structured address fields in the following order: postalCode -> country -> region -> city -> street -> house -> apartment -> addInfo, using a comma as a separator.

When passing entities with an address to Kladana, use a string address or a structured address.

When passing both addresses, the string will be ignored.

When passing only a string, it will be reflected both in the string field and in the addInfo of the structured address.
For address not underretains [`null` value](../#mojsklad-json-api-obschie-swedeniq-podderzhka-null).

Passing `null` to this attribute will not remove it.
To delete an address, you need to pass an empty string `""` to the string field `shipmentAddress`.

### Get a list of Shipments

Query all Shipments on this account.
Result: JSON object including fields:

| Title | Type | Description |
| ----------- | ------- | ---------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Shipments. |

**Parameters**

| Parameter | Description |
| ---------- | --------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** | `string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Get a list of Shipments

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/demand"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Shipments.

```json
{
   "context": {
     "employee": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/context/employee",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     }
   },
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/demand/?limit=2",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
     "type": "demand",
     "mediaType": "application/json",
     "size": 13,
     "limit": 2,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/0ee24723-f640-11e5-8a84-bae500000065",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
         "type": "demand",
         "mediaType": "application/json"
       },
       "id": "0ee24723-f640-11e5-8a84-bae500000065",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
       "updated": "2016-03-30 09:24:29",
       "name": "00001",
       "externalCode": "1SB6iRE9imMFJDMlab7Nk0",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "moment": "2016-03-30 09:24:00",
       "applicable": true,
       "vatEnabled": true,
       "vatIncluded": true,
       "printed": true,
       "published": true,
       "sum": 123000,
       "rate": {
         "currency": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "organization": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "store": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
           "type": "store",
           "mediaType": "application/json"
         }
       },
       "agent": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/850efc5f-f504-11e5-8a84-bae500000161",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
           "type": "counter party",
           "mediaType": "application/json"
         }
       },
       "organizationAccount": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/850c8af2-f504-11e5-8a84-bae50000015f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "agentAccount": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/850efc5f-f504-11e5-8a84-bae500000161/accounts/850f0617-f504-11e5-8a84-bae500000162",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "salesChannel": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
           "type": "sales channel",
           "mediaType": "application/json"
         }
       },
       "positions": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/demand/0ee24723-f640-11e5-8a84-bae500000065/positions",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
           "type": "demand position",
           "mediaType": "application/json",
           "size": 1,
           "limit": 1000,
           "offset": 0
         }
       },
       "paidSum": 0,
       "consignee": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/869d7628-6396-11e6-8a84-bae50000000a",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
           "type": "counter party",
           "mediaType": "application/json"
         }
       },
       "transportFacilityNumber": "lb777m",
       "shippingInstructions": "Keep out of the sun",
       "cargoName": "Vegetables",
       "transport facility": "mercedes benz",
       "carrier": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/cffd2c81-62b4-11e6-8a84-bae500000053",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
           "type": "counter party",
           "mediaType": "application/json"
         }
       },
       "overhead": {
         "sum": 200,
         "distribution": "price"
       },
       "shipmentAddress":"125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
       "shipmentAddressFull":{
         "postalCode":"125009",
         "country":{
           "meta":{
             "href":"https://app.kladana.in/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
             "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/country/metadata",
             "type":"country",
             "mediaType":"application/json"
           }
         },
         "region":{
           "meta":{
             "href":"https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
             "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/region/metadata",
             "type":"region",
             "mediaType":"application/json"
           }
         },
         "city":"Moscow",
         "street": "Tverskaya street",
         "house":"1",
         "apartment":"123",
         "addinfo":"addinfo",
         "comment":"some words about address"
       }
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/b44f220c-f64e-11e5-8a84-bae500000068",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
         "type": "demand",
         "mediaType": "application/json"
       },
       "id": "b44f220c-f64e-11e5-8a84-bae500000068",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
       "updated": "2016-04-01 10:37:29",
       "name": "00002",
       "externalCode": "btlob8zrgFoJoxXLNyxBi3",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": false,
       "group": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "moment": "2016-03-30 11:08:00",
       "applicationble": false,
       "vatEnabled": true,
       "vatIncluded": true,
       "printed": true,
       "published": true,
       "sum": 123000,
       "rate": {
         "currency": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "organization": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
           "type": "organization",
           "mediaType": "application/json"
         }
       },
       "store": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
           "type": "store",
           "mediaType": "application/json"
         }
       },
       "agent": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/850f1667-f504-11e5-8a84-bae500000163",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
           "type": "counter party",
           "mediaType": "application/json"
         }
       },
       "organizationAccount": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/850c8af2-f504-11e5-8a84-bae50000015f",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "agentAccount": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/850f1667-f504-11e5-8a84-bae500000163/accounts/850f1eab-f504-11e5-8a84-bae500000164",
           "type": "account",
           "mediaType": "application/json"
         }
       },
       "positions": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/demand/b44f220c-f64e-11e5-8a84-bae500000068/positions",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
           "type": "demand position",
           "mediaType": "application/json",
           "size": 3,
           "limit": 1000,
           "offset": 0
         }
       },
       "paidSum": 0,
       "overhead": {
         "sum": 300,
         "distribution": "weight"
       }
     }
   ]
}
```

### Create Shipment

Request to create a new Shipment.
Mandatory fields to create:

| Parameter | Description |
| ---------- | --------- |
| **organization** | Link to your legal entity in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **agent** | Link to the counterparty in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **store** | Link to the warehouse in the format [Metadata](../#kladana-json-api-general-info-metadata) |

> An example of creating a new Shipment with a request body containing only the required fields.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/demand"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "organization": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "agent": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
                 "type": "counter party",
                 "mediaType": "application/json"
               }
             },
             "store": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
                 "type": "store",
                 "mediaType": "application/json"
               }
             }
           }
'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Shipment.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/demand/2464c97a-030a-11e6-9464-e4de00000000",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
     "type": "demand",
     "mediaType": "application/json"
   },
   "id": "2464c97a-030a-11e6-9464-e4de00000000",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-15 16:01:17",
   "name": "888",
   "externalCode": "Dt7BqCkBhCxUMXayh4NfA2",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2016-04-15 16:01:17",
   "applicable": true,
   "vatEnabled": true,
   "vatIncluded": true,
   "sum": 0,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078/accounts/9794f7a0-f689-11e5-8a84-bae500000079",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/2464c97a-030a-11e6-9464-e4de00000000/positions",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
       "type": "demand position",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0
}
```

> An example of creating a new Shipment with a richer request body.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/demand"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
            "name": "888",
            "organization": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                    "type": "organization",
                    "mediaType": "application/json"
                }
            },
            "agent": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
                    "type": "counter party",
                    "mediaType": "application/json"
                }
            },
            "store": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
                    "type": "store",
                    "mediaType": "application/json"
                }
            },
            "code": "1243521",
            "moment": "2016-04-19 13:50:24",
            "applicable": false,
            "vatEnabled": true,
            "vatIncluded": true,
            "customerOrder": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026",
                    "type": "salesOrder",
                    "mediaType": "application/json"
                }
            },
            "consignee": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/869d7628-6396-11e6-8a84-bae50000000a",
                    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                    "type": "counterParty",
                    "mediaType": "application/json"
                }
            },
            "transportFacilityNumber": "MK2142",
            "shippingInstructions": "Flammable",
            "cargoName": "oil",
            "transportFacility": "Kamaz 2007",
            "carrier": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/cffd2c81-62b4-11e6-8a84-bae500000053",
                    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                    "type": "counter party",
                    "mediaType": "application/json"
                }
            },
            "stateContractId": "s11233dsasd233",
            "shipmentAddressFull": {
                "postalCode": "125009",
                "country": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
                        "type": "country",
                        "mediaType": "application/json"
                    }
                },
                "region": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
                        "type": "region",
                        "mediaType": "application/json"
                    }
                },
                "city": "Moscow",
                "street": "Tverskaya street",
                "house": "1",
                "apartment": "123",
                "addinfo": "addinfo",
                "comment": "some words about address"
            }
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Shipment.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/demand/c2a04da5-030a-11e6-9464-e4de00000005",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
     "type": "demand",
     "mediaType": "application/json"
   },
   "id": "c2a04da5-030a-11e6-9464-e4de00000005",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-15 16:05:43",
   "name": "888",
   "code": "1243521",
   "externalCode": "p7TPtR1hgOBjUev7rJLmo1",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2016-04-19 13:50:24",
   "applicable": false,
   "vatEnabled": true,
   "vatIncluded": true,
   "sum": 0,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078/accounts/9794f7a0-f689-11e5-8a84-bae500000079",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/c2a04da5-030a-11e6-9464-e4de00000005/positions",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
       "type": "demand position",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "stateContractId": "s11233dsasd233",
   "shipmentAddress":"125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
   "shipmentAddressFull":{
     "postalCode":"125009",
     "country":{
       "meta":{
         "href":"https://app.kladana.in/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/country/metadata",
         "type":"country",
         "mediaType":"application/json"
       }
     },
     "region":{
       "meta":{
         "href":"https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type":"region",
         "mediaType":"application/json"
       }
     },
     "city":"Moscow",
     "street": "Tverskaya street",
     "house":"1",
     "apartment":"123",
     "addinfo":"addinfo",
     "comment":"some words about address"
   }
}
```

> An example of a request to create a Shipment with additional fields.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/demand"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "888",
             "organization": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "agent": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
                 "type": "counter party",
                 "mediaType": "application/json"
               }
             },
             "store": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
                 "type": "store",
                 "mediaType": "application/json"
               }
             },
             "code": "1243521",
             "moment": "2016-04-19 13:50:24",
             "applicable": false,
             "vatEnabled": true,
             "vatIncluded": true,
             "customerOrder": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026",
                 "type": "sales order",
                 "mediaType": "application/json"
               }
             },
             "attributes": [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "AttributeValue1"
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Shipment.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/demand/c2a04da5-030a-11e6-9464-e4de00000005",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
     "type": "demand",
     "mediaType": "application/json"
   },
   "id": "c2a04da5-030a-11e6-9464-e4de00000005",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-15 16:05:43",
   "name": "888",
   "code": "1243521",
   "externalCode": "p7TPtR1hgOBjUev7rJLmo1",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2016-04-19 13:50:24",
   "applicable": false,
   "vatEnabled": true,
   "vatIncluded": true,
   "sum": 0,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078/accounts/9794f7a0-f689-11e5-8a84-bae500000079",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "23d3965d-0313-11e6-9464-e4de00000097",
       "name": "AttributeName1",
       "type": "string",
       "value": "AttributeValue1"
     }
   ],
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/c2a04da5-030a-11e6-9464-e4de00000005/positions",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
       "type": "demand position",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0
}
```

> An example of a request to create a Shipment with items in the body of the request.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/demand"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
            "name": "888",
            "organization": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                    "type": "organization",
                    "mediaType": "application/json"
                }
            },
            "agent": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
                    "type": "counter party",
                    "mediaType": "application/json"
                }
            },
            "store": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
                    "type": "store",
                    "mediaType": "application/json"
                }
            },
            "code": "1243521",
            "moment": "2016-04-19 13:50:24",
            "applicable": false,
            "vatEnabled": true,
            "vatIncluded": true,
            "positions": [
                {
                    "quantity": 10,
                    "price": 100.0,
                    "discount": 0,
                    "vat": 0,
                    "assortment": {
                        "meta": {
                            "href": "https://app.kladana.in/api/remap/1.2/entity/product/8b382799-f7d2-11e5-8a84-bae5000003a5",
                            "type": "product",
                            "mediaType": "application/json"
                        }
                    },
                    "trackingCodes": [
                        {
                            "cis": "012345678912345672",
                            "type": "transportpack",
                            "trackingCodes": [
                                {
                                    "cis": "010463003759026521uHpIIf2111114",
                                    "type": "tracking code"
                                },
                                {
                                    "cis": "010463003759026521uHpIIf2111111",
                                    "type": "tracking code"
                                }
                            ]
                        }
                    ],
                    "reserve": 10,
                    "overhead": 20
                },
                {
                    "quantity": 20,
                    "price": 200.0,
                    "discount": 0,
                    "vat": 21,
                    "assortment": {
                        "meta": {
                            "href": "https://app.kladana.in/api/remap/1.2/entity/product/be903062-f504-11e5-8a84-bae50000019a",
                            "type": "product",
                            "mediaType": "application/json"
                        }
                    },
                    "reserve": 20,
                    "overhead": 20
                },
                {
                    "quantity": 30,
                    "price": 300.0,
                    "discount": 0,
                    "vat": 7,
                    "assortment": {
                        "meta": {
                            "href": "https://app.kladana.in/api/remap/1.2/entity/service/c02e3a5c-007e-11e6-9464-e4de00000006",
                            "type": "service",
                            "mediaType": "application/json"
                        }
                    },
                    "pack": {
                        "id": "1bf22e62-8b47-11e8-56c0-000800000006"
                    },
                    "reserve": 30,
                    "overhead": 20,
                    "cost": 47
                }
            ]
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Shipment.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/demand/c2a04da5-030a-11e6-9464-e4de00000005",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
     "type": "demand",
     "mediaType": "application/json"
   },
   "id": "c2a04da5-030a-11e6-9464-e4de00000005",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-15 16:05:43",
   "name": "888",
   "code": "1243521",
   "externalCode": "p7TPtR1hgOBjUev7rJLmo1",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2016-04-19 13:50:24",
   "applicable": false,
   "vatEnabled": true,
   "vatIncluded": true,
   "sum": 0,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078/accounts/9794f7a0-f689-11e5-8a84-bae500000079",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/c2a04da5-030a-11e6-9464-e4de00000005/positions",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
       "type": "demand position",
       "mediaType": "application/json",
       "size": 3,
       "limit": 1000,
       "offset": 0
     }
   },
   "paidSum": 0,
   "overhead": {
     "sum": 60,
     "distribution": "price"
   }
}
```

### Bulk creating and update of Shipments

[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) Shipments.

In the body of the request, you need to pass an array containing the JSON representation of the Shipments you want to create or update.
Updated Shipments must contain the identifier in the form of metadata.

> Example of creating and updating multiple Shipments

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/demand"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "888",
               "organization": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                   "type": "organization",
                   "mediaType": "application/json"
                 }
               },
               "agent": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
                   "type": "counter party",
                   "mediaType": "application/json"
                 }
               },
               "store": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
                   "type": "store",
                   "mediaType": "application/json"
                 }
               }
             },
             {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/demand/405f69c0-019e-11e6-9464-e4de00000085",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
                 "type": "demand",
                 "mediaType": "application/json"
               },
               "name": "887",
               "moment": "2004-01-14 19:03:00",
               "organization": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                   "type": "organization",
                   "mediaType": "application/json"
                 }
               },
               "agent": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
                   "type": "counter party",
                   "mediaType": "application/json"
                 }
               },
               "store": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
                   "type": "store",
                   "mediaType": "application/json"
                 }
               },
               "code": "666",
               "applicable": false,
               "vatEnabled": true,
               "vatIncluded": true,
               "customerOrder": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026",
                   "type": "sales order",
                   "mediaType": "application/json"
                 }
               },
               "stateContractId": "s11233dsasd233"
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Shipments.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/2464c97a-030a-11e6-9464-e4de00000000",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
       "type": "demand",
       "mediaType": "application/json"
     },
     "id": "2464c97a-030a-11e6-9464-e4de00000000",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
     "updated": "2016-04-15 16:01:17",
     "name": "888",
     "externalCode": "Dt7BqCkBhCxUMXayh4NfA2",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": false,
     "group": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "moment": "2016-04-15 16:01:17",
     "applicable": true,
     "vatEnabled": true,
     "vatIncluded": true,
     "sum": 0,
     "rate": {
       "currency": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       }
     },
     "organization": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     "store": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
         "type": "store",
         "mediaType": "application/json"
       }
     },
     "agent": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
         "type": "counter party",
         "mediaType": "application/json"
       }
     },
     "organizationAccount": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "agentAccount": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078/accounts/9794f7a0-f689-11e5-8a84-bae500000079",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/2464c97a-030a-11e6-9464-e4de00000000/positions",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
         "type": "demand position",
         "mediaType": "application/json",
         "size": 0,
         "limit": 1000,
         "offset": 0
       }
     },
     "paidSum": 0
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/405f69c0-019e-11e6-9464-e4de00000085",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
       "type": "demand",
       "mediaType": "application/json"
     },
     "id": "405f69c0-019e-11e6-9464-e4de00000085",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
     "updated": "2016-04-15 16:26:20",
     "name": "887",
     "code": "666",
     "externalCode": "ibWbdtWWhXiIwfZVEal6z2",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": false,
     "group": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "moment": "2004-01-14 19:03:00",
     "applicable": false,
     "vatEnabled": true,
     "vatIncluded": true,
     "sum": 346389501420,
     "rate": {
       "currency": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       }
     },
     "organization": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
         "type": "organization",
         "mediaType": "application/json"
       }
     },
     "store": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
         "type": "store",
         "mediaType": "application/json"
       }
     },
     "contract": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/contract/8ce3c179-015e-11e6-9464-e4de0000007a",
         "type": "contract",
         "mediaType": "application/json"
       }
     },
     "project": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/project/51f263f9-0307-11e6-9464-e4de0000007c",
         "type": "project",
         "mediaType": "application/json"
       }
     },
     "agent": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
         "type": "counter party",
         "mediaType": "application/json"
       }
     },
     "state": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
         "type": "state",
         "mediaType": "application/json"
       }
     },
     "organizationAccount": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/850c8af2-f504-11e5-8a84-bae50000015f",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "agentAccount": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078/accounts/9794f7a0-f689-11e5-8a84-bae500000079",
         "type": "account",
         "mediaType": "application/json"
       }
     },
     "salesChannel": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
         "type": "sales channel",
         "mediaType": "application/json"
       }
     },
     "created": "2016-08-25 19:55:00",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/405f69c0-019e-11e6-9464-e4de00000085/positions",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
         "type": "demand position",
         "mediaType": "application/json",
         "size": 4,
         "limit": 1000,
         "offset": 0
       }
     },
     "payedSum": 365939611804,
     "customerOrder": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/34efe2ee-015e-11e6-9464-e4de0000006b",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/customerOrder/metadata",
         "type": "sales order",
         "mediaType": "application/json"
       }
     },
     "stateContractId": "s11233dsasd233"
   }
]
```

### Delete Shipment

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Shipment id. |

> Request to delete the Shipment with the specified id.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of the Shipment.

### Bulk deletion of Shipments

In the body of the request, you need to pass an array containing the JSON metadata of the Shipments you want to remove.


> Request for Bulk Deletion of Shipments.

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/demand/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d'[
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b1",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
             "type": "demand",
             "mediaType": "application/json"
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b2",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
             "type": "demand",
             "mediaType": "application/json"
         }
       ]'
```

> Successful request. The result is JSON information about deleting Shipments.

```json
[
   {
     "info":"Entity 'demand' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'demand' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Shipments Metadata

Request to get Shipments metadata. The result is a JSON object including:

| Parameter | Description |
| ---------- | --------- |
| **meta** | Link to Metadata of Shipments |
| **attributes** | Array of objects additional Shipments fields in [Metadata](../#kladana-json-api-general-info-metadata) format |
| **states** | Array of Shipments statuses |
| **createShared** | create new Shipments labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Shipment Metadata

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/demand/metadata"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional shipment fields.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/23d3965d-0313-11e6-9464-e4de00000097",
         "type": "attributeutemetadata",
         "mediaType": "application/json"
       },
       "id": "23d3965d-0313-11e6-9464-e4de00000097",
       "name": "AttributeName1",
       "type": "boolean",
       "required": false
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/5290a290-0313-11e6-9464-e4de00000020",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "5290a290-0313-11e6-9464-e4de00000020",
       "name": "AttributeName2",
       "type": "boolean",
       "required": false
     }
   ],
   "states": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56c504-2e58-11e6-8a84-bae500000069",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "New",
       "color": 15106326,
       "stateType": "Regular",
       "entityType": "demand"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/states/fb56cae3-2e58-11e6-8a84-bae50000006a",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56cae3-2e58-11e6-8a84-bae50000006a",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Confirmed",
       "color": 40931,
       "stateType": "Regular",
       "entityType": "demand"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/states/fb56cf4f-2e58-11e6-8a84-bae50000006b",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56cf4f-2e58-11e6-8a84-bae50000006b",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Assembled",
       "color": 8767198,
       "stateType": "Regular",
       "entityType": "demand"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/states/fb56d433-2e58-11e6-8a84-bae50000006c",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56d433-2e58-11e6-8a84-bae50000006c",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Shipped",
       "color": 10774205,
       "stateType": "Regular",
       "entityType": "demand"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/states/fb56d92f-2e58-11e6-8a84-bae50000006d",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56d92f-2e58-11e6-8a84-bae50000006d",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Delivered",
       "color": 8825440,
       "stateType": "Successful",
       "entityType": "demand"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/states/fb56de0a-2e58-11e6-8a84-bae50000006e",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56de0a-2e58-11e6-8a84-bae50000006e",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Return",
       "color": 15280409,
       "stateType": "Unsuccessful",
       "entityType": "demand"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/states/fb56e2b4-2e58-11e6-8a84-bae50000006f",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56e2b4-2e58-11e6-8a84-bae50000006f",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Cancelled",
       "color": 15280409,
       "stateType": "Unsuccessful",
       "entityType": "demand"
     }
   ],
   "createShared": false
}
```

### Separate additional field

**Parameters**

| Parameter | Description |
| ---------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Fields id. |
 
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/127d484e-3f81-11e6-8a84-bae5000000cb",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "127d484e-3f81-11e6-8a84-bae5000000cb",
   "name": "AttributeName1",
   "type": "boolean",
   "required": false
}

```

### Shipment Template

> Request to receive a Shipment template pre-filled with standard values without being associated with any document.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/demand/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d''
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled shipment.

```json
{
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/105a788e-36e7-11e7-8a7f-40d000000069",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/103cca6f-36e7-11e7-8a7f-40d000000005",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2017-05-12 15:31:10",
   "applicable": true,
   "sum": 0,
   "store": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/1076a96a-36e7-11e7-8a7f-40d000000092",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/107430bc-36e7-11e7-8a7f-40d000000090",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "positions": {
     "rows": []
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "paidSum": 0
}
```

### Shipment template based on Sales Order

Request for a Shipment template based on a Sales Order or invoice to the customer.

As a result of the request, a pre-filled Shipment template will be created based on the submitted
document.

> Request to create a shipment based on a Sales Order.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/demand/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "customerOrder": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/451cb4c0-3d1d-11e6-8a84-bae500000004",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/customerorder/metadata",
                 "type": "sales order",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled shipment.

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
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/b8ba0d3f-9128-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2016-11-25 18:02:21",
   "applicable": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 0,
   "store": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/b942743c-9128-11e6-8a84-bae500000053",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051/accounts/b932bc5b-9128-11e6-8a84-bae500000052",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/b9324d71-9128-11e6-8a84-bae500000051/accounts/b932bc5b-9128-11e6-8a84-bae500000052",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "rows": [
       {
         "quantity": 1,
         "price": 0.0,
         "discount": 0,
         "vat": 0,
         "vatEnabled": false,
         "assortment": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/product/c55b5e7c-9128-11e6-8a84-bae500000087",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.in/app/#good/edit?id=392c045c-2842-11e9-ac12-000a00000002"
           }
         },
         "overhead": 0
       }
     ]
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "paidSum": 0,
   "customerOrder": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/559adab5-915c-11e6-8a84-bae500000014",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/customerorder/metadata",
       "type": "sales order",
       "mediaType": "application/json"
     }
   }
}
```

> Request to create a shipment based on the Sales invoice.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/demand/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "invoicesOut": [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/invoiceout/1571eb25-d03d-11e7-6a80-332a00000002",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/invoiceout/metadata",
                   "type": "invoiceout",
                   "mediaType": "application/json",
                   "uuidHref": "https://app.kladana.in/app/#invoiceout/edit?id=1571eb25-d03d-11e7-6a80-332a00000002"
                 }
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the prefilled shipment.

```json
{
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/46073d61-ca1f-11e7-6a80-332a0000002a",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#employee/edit?id=46073d61-ca1f-11e7-6a80-332a0000002a"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/452fb22f-ca1f-11e7-6a80-332a00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "name": "",
   "moment": "2017-11-23 13:59:29",
   "applicable": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/464062ac-ca1f-11e7-6a80-332a00000058",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#currency/edit?id=464062ac-ca1f-11e7-6a80-332a00000058"
       }
     }
   },
   "sum": 0,
   "store": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/463f8970-ca1f-11e7-6a80-332a00000053",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#warehouse/edit?id=463f8970-ca1f-11e7-6a80-332a00000053"
     }
   },
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/463fe231-ca1f-11e7-6a80-332a00000056",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#company/edit?id=463fe231-ca1f-11e7-6a80-332a00000056"
     }
   },
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/463a706e-ca1f-11e7-6a80-332a00000051",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#mycompany/edit?id=463a706e-ca1f-11e7-6a80-332a00000051"
     }
   },
   "documents": {
     "rows": []
   },
   "positions": {
     "rows": [
       {
         "quantity": 1,
         "price": 100000.0,
         "discount": 0,
         "vat": 0,
         "vatEnabled": false,
         "assortment": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/variant/b5d94dd1-cab0-11e7-6a80-332a00000011",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
             "type": "variant",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.in/app/#feature/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
           }
         },
         "overhead": 0
       }
     ]
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "paidSum": 0,
   "invoicesOut": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/invoiceout/1571eb25-d03d-11e7-6a80-332a00000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/invoiceout/metadata",
         "type": "invoiceout",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#invoiceout/edit?id=1571eb25-d03d-11e7-6a80-332a00000002"
       }
     }
   ]
}
```

### Get Shipment

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Shipment id. |
 
> Request to receive a separate Shipment with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Shipment.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/demand/405f69c0-019e-11e6-9464-e4de00000085",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
     "type": "demand",
     "mediaType": "application/json"
   },
   "id": "405f69c0-019e-11e6-9464-e4de00000085",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-15 15:48:46",
   "name": "24124",
   "externalCode": "ibWbdtWWhXiIwfZVEal6z2",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2016-04-14 11:03:00",
   "applicable": true,
   "vatEnabled": true,
   "vatIncluded": true,
   "sum": 346389501420,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/bc1b4fde-019a-11e6-9464-e4de00000073",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     },
     "value": 214
   },
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "contract": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/contract/8ce3c179-015e-11e6-9464-e4de0000007a",
       "type": "contract",
       "mediaType": "application/json"
     }
   },
   "project": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/project/51f263f9-0307-11e6-9464-e4de0000007c",
       "type": "project",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/850c8af2-f504-11e5-8a84-bae50000015f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078/accounts/9794f7a0-f689-11e5-8a84-bae500000079",
       "type": "account",
       "mediaType": "applicationtion/json"
     }
   },
   "salesChannel": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
       "type": "sales channel",
       "mediaType": "application/json"
     }
   },
   "positions": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/405f69c0-019e-11e6-9464-e4de00000085/positions",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
       "type": "demand position",
       "mediaType": "application/json",
       "size": 4,
       "limit": 1000,
       "offset": 0
     }
   },
   "payedSum": 365939611804,
   "customerOrder": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/34efe2ee-015e-11e6-9464-e4de0000006b",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/customerOrder/metadata",
       "type": "sales order",
       "mediaType": "application/json"
     }
   },
   "consignee": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/869d7628-6396-11e6-8a84-bae50000000a",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   "transportFacilityNumber": "lo777v",
   "shippingInstructions": "Keep out of the sun",
   "cargoName": "Vegetables",
   "transport facility": "mercedes benz",
   "goodPackQuantity": 500,
   "carrier": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/cffd2c81-62b4-11e6-8a84-bae500000053",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   "overhead": {
     "sum": 200,
     "distribution": "price"
   },
   "shipmentAddress":"125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
   "shipmentAddressFull":{
     "postalCode":"125009",
     "country":{
       "meta":{
         "href":"https://app.kladana.in/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/country/metadata",
         "type":"country",
         "mediaType":"application/json"
       }
     },
     "region":{
       "meta":{
         "href":"https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type":"region",
         "mediaType":"application/json"
       }
     },
     "city":"Moscow",
     "street": "Tverskaya street",
     "house":"1",
     "apartment":"123",
     "addinfo":"addinfo",
     "comment":"some words about address"
   }
}
```

### Change Shipment

Request to update the Shipment with the specified id.
In the request body, you can specify only those fields that need to be changed for the Shipment, except for those that
are marked `Read-Only` in the description of [Shipment attributes](../documents/#transactions-shipment).
When updating the **organization** and **agent** fields, you must also update the **organizationAccount** and
**agentAccount** respectively, otherwise an error will occur.

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Shipment id. |

> An example of a request to update a single Shipment.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
            "name": "887",
            "moment": "2004-01-14 19:03:00",
            "organization": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                    "type": "organization",
                    "mediaType": "application/json"
                }
            },
            "agent": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
                    "type": "counter party",
                    "mediaType": "application/json"
                }
            },
            "store": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
                    "type": "store",
                    "mediaType": "application/json"
                }
            },
            "code": "666",
            "applicable": false,
            "vatEnabled": true,
            "vatIncluded": true,
            "customerOrder": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026",
                    "type": "customorder",
                    "mediaType": "application/json"
                }
            },
            "stateContractId": "s11233dsasd233",
            "shipmentAddressFull": {
                "postalCode": "125009",
                "country": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/country/metadata",
                        "type": "country",
                        "mediaType": "application/json"
                    }
                },
                "region": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/region/metadata",
                        "type": "region",
                        "mediaType": "application/json"
                    }
                },
                "city": "Moscow",
                "street": "Tverskaya street",
                "house": "1",
                "apartment": "111",
                "addinfo": "addinfo",
                "comment": "some words about address"
            }
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Shipment.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/demand/405f69c0-019e-11e6-9464-e4de00000085",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
     "type": "demand",
     "mediaType": "application/json"
   },
   "id": "405f69c0-019e-11e6-9464-e4de00000085",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-15 16:26:20",
   "name": "887",
   "code": "666",
   "externalCode": "ibWbdtWWhXiIwfZVEal6z2",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2004-01-14 19:03:00",
   "applicable": false,
   "vatEnabled": true,
   "vatIncluded": true,
   "sum": 346389501420,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "contract": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/contract/8ce3c179-015e-11e6-9464-e4de0000007a",
       "type": "contract",
       "mediaType": "application/json"
     }
   },
   "project": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/project/51f263f9-0307-11e6-9464-e4de0000007c",
       "type": "project",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/850c8af2-f504-11e5-8a84-bae50000015f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078/accounts/9794f7a0-f689-11e5-8a84-bae500000079",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "salesChannel": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
       "type": "sales channel",
       "mediaType": "application/json"
     }
   },
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/405f69c0-019e-11e6-9464-e4de00000085/positions",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
       "type": "demand position",
       "mediaType": "application/json",
       "size": 4,
       "limit": 1000,
       "offset": 0
     }
   },
   "payedSum": 365939611804,
   "customerOrder": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/34efe2ee-015e-11e6-9464-e4de0000006b",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/customerOrder/metadata",
       "type": "sales order",
       "mediaType": "application/json"
     }
   },
   "stateContractId": "s11233dsasd233",
   "shipmentAddress":"125009, Russia, Moscow, Moscow, Tverskaya st., 1, 111, addInfo",
   "shipmentAddressFull":{
     "postalCode":"125009",
     "country":{
       "meta":{
         "href":"https://app.kladana.in/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/country/metadata",
         "type":"country",
         "mediaType":"application/json"
       }
     },
     "region":{
       "meta":{
         "href":"https://app.kladana.in/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/region/metadata",
         "type":"region",
         "mediaType":"application/json"
       }
     },
     "city":"Moscow",
     "street": "Tverskaya street",
     "house":"1",
     "apartment":"111",
     "addinfo":"addinfo",
     "comment":"some words about address"
   }
}
```

> Example of a request to change a Shipment with additional fields.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "887",
             "moment": "2004-01-14 19:03:00",
             "organization": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                 "type": "organization",
                 "mediaType": "application/json"
               }
             },
             "agent": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
                 "type": "counter party",
                 "mediaType": "application/json"
               }
             },
             "store": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
                 "type": "store",
                 "mediaType": "application/json"
               }
             },
             "code": "666",
             "applicable": false
             "vatEnabled": true
             "vatIncluded": true,
             "customerOrder": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026",
                 "type": "sales order",
                 "mediaType": "application/json"
               }
             },
             "attributes": [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "name": "AttributeName1",
                 "type": "boolean",
                 "value": true
               }
             ],
             "consignee": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/869d7628-6396-11e6-8a84-bae50000000a",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                 "type": "counter party",
                 "mediaType": "application/json"
               }
             },
             "transportFacilityNumber": "MK2142",
             "shippingInstructions": "Flammable",
             "cargoName": "oil",
             "transportFacility": "Kamaz 2007",
             carrier: {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/cffd2c81-62b4-11e6-8a84-bae500000053",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                 "type": "counter party",
                 "mediaType": "application/json"
               }
             },
             "overhead": {sum: 990
               "distribution": "price"
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Shipment.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/demand/405f69c0-019e-11e6-9464-e4de00000085",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
     "type": "demand",
     "mediaType": "application/json"
   },
   "id": "405f69c0-019e-11e6-9464-e4de00000085",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-15 16:26:20",
   "name": "887",
   "code": "666",
   "externalCode": "ibWbdtWWhXiIwfZVEal6z2",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2004-01-14 19:03:00",
   "applicable": false,
   "vatEnabled": true,
   "vatIncluded": true,
   "sum": 346389501420,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "contract": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/contract/8ce3c179-015e-11e6-9464-e4de0000007a",
       "type": "contract",
       "mediaType": "application/json"
     }
   },
   "project": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/project/51f263f9-0307-11e6-9464-e4de0000007c",
       "type": "project",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/850c8af2-f504-11e5-8a84-bae50000015f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078/accounts/9794f7a0-f689-11e5-8a84-bae500000079",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "salesChannel": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
       "type": "sales channel",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "23d3965d-0313-11e6-9464-e4de00000097",
       "name": "AttributeName1",
       "type": "boolean",
       "value": true
     }
   ],
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/405f69c0-019e-11e6-9464-e4de00000085/positions",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
       "type": "demand position",
       "mediaType": "application/json",
       "size": 4,
       "limit": 1000,
       "offset": 0
     }
   },
   "payedSum": 365939611804,
   "customerOrder": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/34efe2ee-015e-11e6-9464-e4de0000006b",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/customerOrder/metadata",
       "type": "sales order",
       "mediaType": "application/json"
     }
   },
   "consignee": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/869d7628-6396-11e6-8a84-bae50000000a",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   "transportFacilityNumber": "MK2142",
   "shippingInstructions": "Flammable",
   "cargoName": "oil",
   "transportFacility": "Kamaz 2007",
   "carrier": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/cffd2c81-62b4-11e6-8a84-bae500000053",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   "overhead": {
     "sum": 990,
     "distribution": "price"
   }
}
```

> An example of a request to update a Shipment with items in the body of the request.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
    "name": "887",
    "moment": "2004-01-14 19:03:00",
    "organization": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
            "type": "organization",
            "mediaType": "application/json"
        }
    },
    "agent": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
            "type": "counter party",
            "mediaType": "application/json"
        }
    },
    "store": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
            "type": "store",
            "mediaType": "application/json"
        }
    },
    "code": "666",
    "applicable": false,
    "vatEnabled": true,
    "vatIncluded": true,
    "customerOrder": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026",
            "type": "sales order",
            "mediaType": "application/json"
        }
    },
    "positions": [
        {
            "id": "34f6344f-015e-11e6-9464-e4de0000006c",
            "quantity": 10,
            "price": 100.0,
            "discount": 0,
            "vat": 0,
            "assortment": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/product/8b382799-f7d2-11e5-8a84-bae5000003a5",
                    "type": "product",
                    "mediaType": "application/json"
                }
            },
            "reserve": 10
        },
        {
            "id": "34f6344f-015e-11e6-9464-e4de0000006d",
            "quantity": 20,
            "price": 200.0,
            "discount": 0,
            "vat": 21,
            "assortment": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/product/be903062-f504-11e5-8a84-bae50000019a",
                    "type": "product",
                    "mediaType": "application/json"
                }
            },
            "reserve": 20
        },
        {
            "id": "34f6344f-015e-11e6-9464-e4de0000006e",
            "quantity": 30,
            "price": 300.0,
            "discount": 0,
            "vat": 7,
            "assortment": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/product/c02e3a5c-007e-11e6-9464-e4de00000006",
                    "type": "product",
                    "mediaType": "application/json"
                }
            },
            "reserve": 30
        }
    ],
    "overhead": {
        "sum": 1000,
        "distribution": "weight"
    }
}'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Shipment.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/demand/405f69c0-019e-11e6-9464-e4de00000085",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
     "type": "demand",
     "mediaType": "application/json"
   },
   "id": "405f69c0-019e-11e6-9464-e4de00000085",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-15 16:26:20",
   "name": "887",
   "code": "666",
   "externalCode": "ibWbdtWWhXiIwfZVEal6z2",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2004-01-14 19:03:00",
   "applicable": false,
   "vatEnabled": true,
   "vatIncluded": true,
   "sum": 346389501420,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "organization": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/86c857d6-0302-11e6-9464-e4de00000072",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "contract": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/contract/8ce3c179-015e-11e6-9464-e4de0000007a",
       "type": "contract",
       "mediaType": "application/json"
     }
   },
   "project": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/project/51f263f9-0307-11e6-9464-e4de0000007c",
       "type": "project",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
       "type": "counter party",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/850c8af2-f504-11e5-8a84-bae50000015f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078/accounts/9794f7a0-f689-11e5-8a84-bae500000079",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "salesChannel": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
       "type": "sales channel",
       "mediaType": "application/json"
     }
   },
   "created": "2016-08-25 19:55:00",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/405f69c0-019e-11e6-9464-e4de00000085/positions",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
       "type": "demand position",
       "mediaType": "application/json",
       "size": 4,
       "limit": 1000,
       "offset": 0
     }
   },
   "payedSum": 365939611804,
   "customerOrder": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/customerorder/34efe2ee-015e-11e6-9464-e4de0000006b",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/customerOrder/metadata",
       "type": "sales order",
       "mediaType": "application/json"
     }
   },
   "stateContractId": "s11233dsasd233"
}
```

### Shipment Items

A separate resource for managing Shipment positions. With it, you can manage the positions of a larger document that has more lines than the limit on the number of lines saved with the document. The limit is 1000. You can read more about limits on the number of document lines and working with a larger documents [here](../#mojsklad-json-api-obschie-swedeniq-rabota-s-poziciqmi-dokumentow).

### Get Shipment Items

Request to get a list of all items of this Shipment.

| Title | Type | Description |
| ------- | ------- |------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the Shipment items. |

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Shipment id. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Shipment Items

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19/positions"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the item list of a single Shipment.

```json
{
   "context": {
     "employee": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/context/employee",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     }
   },
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19/positions",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
     "type": "demand position",
     "mediaType": "application/json",
     "size": 4,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19/positions/40603fbd-019e-11e6-9464-e4de00000086",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
         "type": "demand position",
         "mediaType": "application/json"
       },
       "id": "40603fbd-019e-11e6-9464-e4de00000086",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "quantity": 1,
       "sum": 123050,
       "discount": 0,
       "vat": 18,
       "vatEnabled": true,
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/66ccbc9f-f7d2-11e5-8a84-bae500000076",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#good/edit?id=63b1e1f15-2842-11e9-ac12-000c0000002f"
         }
       }
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19/positions/40604612-019e-11e6-9464-e4de00000087",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
         "type": "demand position",
         "mediaType": "application/json"
       },
       "id": "40604612-019e-11e6-9464-e4de00000087",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "quantity": 1,
       "sum": 214,
       "discount": 0,
       "vat": 18,
       "vatEnabled": true,
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/service/60fc3826-00d7-11e6-9464-e4de00000097",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "service",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#service/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
         }
       },
       "cost": 34
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19/positions/40604a79-019e-11e6-9464-e4de00000088",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
         "type": "demand position",
         "mediaType": "application/json"
       },
       "id": "40604a79-019e-11e6-9464-e4de00000088",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "quantity": 1,
       "sum": 346347237062,
       "discount": 0,
       "vat": 18,
       "vatEnabled": true,
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/56c73633-ffe4-11e5-9464-e4de000000c6",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
           "type": "variant",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#feature/edit?id=392c045c-2842-11e9-ac12-000a00000002"
         }
       },
       "country": {
         "name": "Germany"
       }
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19/positions/406055cb-019e-11e6-9464-e4de00000089",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
         "type": "demand position",
         "mediaType": "application/json"
       },
       "id": "406055cb-019e-11e6-9464-e4de00000089",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "quantity": 1,
       "sum": 42141094,
       "discount": 0,
       "vat": 18,
       "vatEnabled": true,
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/66cc36dc-f7d2-11e5-8a84-bae500000074",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
           "type": "variant",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#feature/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
         }
       }
     }
   ]
}
```

> Example with marking codes

```shell
curl --location --request GET 'https://app.kladana.in/api/remap/1.2/entity/demand/8830a022-8a03-11ea-0a80-01cb00000040/positions' \
--header 'Authorization: Basic <Credentials>'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the item list of a single Shipment.

```json
{
    "context":{
       "employee":{
          "meta":{
             "href":"https://app.kladana.in/api/remap/1.2/context/employee",
             "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
             "type":"employee",
             "mediaType":"application/json"
          }
       }
    },
    "meta":{
       "href":"https://app.kladana.in/api/remap/1.2/entity/demand/8830a022-8a03-11ea-0a80-01cb00000040/positions",
       "type":"demand position",
       "mediaType":"application/json",
       "size":2,
       "limit":1000,
       "offset":0
    },
    "rows":[
       {
          "meta":{
             "href":"https://app.kladana.in/api/remap/1.2/entity/demand/8830a022-8a03-11ea-0a80-01cb00000040/positions/8830b0fe-8a03-11ea-0a80-01cb00000041",
             "type":"demand position",
             "mediaType":"application/json"
          },
          "id":"8830b0fe-8a03-11ea-0a80-01cb00000041",
          "accountId":"de6b5113-8491-11ea-0a80-134500000014",
          "quantity":20.0,
          "price":200.0,
          "discount":0.0,
          "vat":21,
          "vatEnabled": true,
          "assortment":{
             "meta":{
                "href":"https://app.kladana.in/api/remap/1.2/entity/product/aa1b1814-8493-11ea-0a80-037a00000307",
                "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                "type":"product",
                "mediaType":"application/json",
                "uuidHref":"https://app.kladana.in/app/#good/edit?id=aa1b0d42-8493-11ea-0a80-037a00000305"
             }
          },
          "tracking codes":[
             {
                "cis":"012345678912345672",
                "type":"transportpack",
                "tracking codes":[
                   {
                      "cis":"010463003759026521uHpIIf2111111",
                      "type":"tracking code"
                   },
                   {
                      "cis":"010463003759026521uHpIIf2111114",
                      "type":"tracking code"
                   }
                ]
             }
          ],
          "trackingCodes_1162":[
             {
                "cis_1162":"0000",
                "type":"transportpack",
                "trackingCodes_1162":[
                   {
                      "cis_1162":"444D043603BEF0F975487049496632313131313131",
                      "type":"tracking code"
                   },
                   {
                      "cis_1162":"444D043603BEF0F975487049496632313131313134",
                      "type":"tracking code"
                   }
                ]
             }
          ],
          "overhead":0.0
       },
       {
          "meta":{
             "href":"https://app.kladana.in/api/remap/1.2/entity/demand/8830a022-8a03-11ea-0a80-01cb00000040/positions/770f45b4-8a04-11ea-0a80-01cb00000060",
             "type":"demand position",
             "mediaType":"application/json"
          },
          "id":"770f45b4-8a04-11ea-0a80-01cb00000060",
          "accountId":"de6b5113-8491-11ea-0a80-134500000014",
          "quantity":10.0,
          "price":0.0,
          "discount":0.0,
          "vat":0,
          "vatEnabled": false,
          "assortment":{
             "meta":{
                "href":"https://app.kladana.in/api/remap/1.2/entity/product/b20184da-8493-11ea-0a80-037a00000314",
                "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                "type":"product",
                "mediaType":"application/json",
                "uuidHref":"https://app.kladana.in/app/#good/edit?id=b20178fb-8493-11ea-0a80-037a00000312"
             }
          },
          "tracking codes":[
             {
                "cis":"010463003759026521uHpIIf-nXIH>1",
                "type":"tracking code"
             },
             {
                "cis":"012345678912345671",
                "type":"transportpack"
             },
             {
                "cis":"012345678912345678",
                "type":"transportpack",
                "tracking codes":[
                   {
                      "cis":"010463003759026521uHpIIf-nXIH>0",
                      "type":"tracking code"
                   },
                   {
                      "cis":"010463003759026521uHpIIf-nXIH>4",
                      "type":"tracking code"
                   },
                   {
                      "cis":"010463003759026521uHpIIf-111114",
                      "type":"tracking code"
                   }
                ]
             },
             {
                "cis":"010463003759026521uHpIIf-111122",
                "type":"tracking code"
             },
             {
                "cis":"010463003759026521uHpIIf-nXIH>2",
                "type":"tracking code"
             }
          ],
          "trackingCodes_1162":[
             {
                "cis_1162":"444D043603BEF0F97548704949662D6E5849483E31",
                "type":"tracking code"
             },
             {
                "cis_1162":"0000",
                "type":"transportpack"
             },
             {
                "cis_1162":"0000",
                "type":"transportpack",
                "trackingCodes_1162":[
                   {
                      "cis_1162":"444D043603BEF0F97548704949662D6E5849483E30",
                      "type":"tracking code"
                   },
                   {
                      "cis_1162":"444D043603BEF0F97548704949662D6E5849483E34",
                      "type":"tracking code"
                   },
                   {
                      "cis_1162":"444D043603BEF0F97548704949662D313131313134",
                      "type":"tracking code"
                   }
                ]
             },
             {
                "cis_1162":"444D043603BEF0F97548704949662D313131313232",
                "type":"tracking code"
             },
             {
                "cis_1162":"444D043603BEF0F97548704949662D6E5849483E32",
                "type":"tracking code"
             }
          ],
          "overhead":0.0
       }
    ]
}
```

### Create Shipment Item

Request to create a new item in the Shipment.
For successful creation, the following fields must be specified in the request body:

+ **assortment** - Link to the product/service/series/modification/set that the item represents.
You can also specify a field named **service**, **variant** according to
what the indicated item is. You can read more about this field in the description of the [Shipment item](../documents/#transactions-shipment-otgruzki-pozicii-otgruzki)
+ **quantity** - Quantity of the specified item. Must be positive, otherwise an error will occur.
You can create one or more Shipment items at the same time. All items created by this request
will be added to the existing ones.

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Shipment id. |

> An example of creating one item in the Shipment.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19/positions"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "quantity": 4,
             "price": 12345.0,
             "discount": 0,
             "vat": 0,
             "assortment": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/product/66ccbc9f-f7d2-11e5-8a84-bae500000076",
                 "type": "product",
                 "mediaType": "application/json"
               }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the single Shipment item created.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19/positions/3bf025cc-0310-11e6-9464-e4de0000000e",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
       "type": "demand position",
       "mediaType": "application/json"
     },
     "id": "3bf025cc-0310-11e6-9464-e4de0000000e",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "quantity": 4,
     "price": 12345.0,
     "discount": 0,
     "vat": 0,
     "vatEnabled": false,
     "assortment": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/66ccbc9f-f7d2-11e5-8a84-bae500000076",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#good/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
       }
     }
   }
]
```

> An example of creating several items at once in the Shipment.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19/positions"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
            {
                "quantity": 103,
                "price": 1002.0,
                "discount": 0,
                "vat": 0,
                "assortment": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/product/8b382799-f7d2-11e5-8a84-bae5000003a5",
                        "type": "product",
                        "mediaType": "application/json"
                    }
                }
            },
            {
                "quantity": 21,
                "price": 2300.0,
                "discount": 0,
                "vat": 21,
                "assortment": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/product/be903062-f504-11e5-8a84-bae50000019a",
                        "type": "product",
                        "mediaType": "application/json"
                    }
                }
            },
            {
                "quantity": 3,
                "price": 3500.0,
                "discount": 0,
                "vat": 7,
                "assortment": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/service/c02e3a5c-007e-11e6-9464-e4de00000006",
                        "type": "service",
                        "mediaType": "application/json"
                    }
                },
                "pack": {
                    "id": "1bf22e62-8b47-11e8-56c0-000800000006"
                },
                "cost": 47
            }
        ]'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of created items of a single Shipment.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19/positions/727cf336-0310-11e6-9464-e4de00000013",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
       "type": "demand position",
       "mediaType": "application/json"
     },
     "id": "727cf336-0310-11e6-9464-e4de00000013",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "quantity": 10,
     "price": 100.0,
     "discount": 0,
     "vat": 0,
     "vatEnabled": false,
     "assortment": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/8b382799-f7d2-11e5-8a84-bae5000003a5",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#good/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
       }
     }
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19/positions/727cfce0-0310-11e6-9464-e4de00000014",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
       "type": "demand position",
       "mediaType": "application/json"
     },
     "id": "727cfce0-0310-11e6-9464-e4de00000014",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "quantity": 20,
     "price": 200.0,
     "discount": 0,
     "vat": 21,
     "vatEnabled": true,
     "assortment": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/be903062-f504-11e5-8a84-bae50000019a",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#good/edit?id=392c045c-2842-11e9-ac12-000a00000002"
       }
     }
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19/positions/727d057f-0310-11e6-9464-e4de00000015",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
       "type": "demand position",
       "mediaType": "application/json"
     },
     "id": "727d057f-0310-11e6-9464-e4de00000015",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "quantity": 30,
     "price": 300.0,
     "discount": 0,
     "vat": 7,
     "vatEnabled": true,
     "assortment": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/service/c02e3a5c-007e-11e6-9464-e4de00000006",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "service",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#service/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
       }
     },
     "pack": {
       "id": "1bf22e62-8b47-11e8-56c0-000800000006",
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/2ec1170c-3f69-4409-87bb-c68e0011b275",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         }
       },
       "quantity": 2
     },
     "cost": 47
   }
]
```

> Example with marking codes.

```shell
curl --location --request POST 'https://app.kladana.in/api/remap/1.2/entity/demand/8830a022-8a03-11ea-0a80-01cb00000040/positions' \
--header 'Authorization: Basic <Credentials>' \
--header 'Content-Type: application/json' \
--data-raw '{
    "quantity":10.0,
    "price":100.0,
    "discount":0.0,
    "vat":0,
    "assortment":{
       "meta":{
          "href":"https://app.kladana.in/api/remap/1.2/entity/product/b20184da-8493-11ea-0a80-037a00000314",
          "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/product/metadata",
          "type":"product",
          "mediaType":"application/json",
          "uuidHref":"https://app.kladana.in/app/#good/edit?id=b20178fb-8493-11ea-0a80-037a00000312"
       }
    },
    "tracking codes":[
       {
          "cis":"010463003759026521uHpIIf-111122",
          "type":"tracking code"
       },
       {
          "cis":"012345678912345671",
          "type":"transportpack"
       },
       {
          "cis":"010463003759026521uHpIIf-nXIH>1",
          "type":"tracking code"
       },
       {
          "cis":"012345678912345678",
          "type":"transportpack",
          "tracking codes":[
             {
                "cis":"010463003759026521uHpIIf-111114",
                "type":"tracking code"
             },
             {
                "cis":"010463003759026521uHpIIf-nXIH>4",
                "type":"tracking code"
             },
             {
                "cis":"010463003759026521uHpIIf-nXIH>0",
                "type":"tracking code"
             }
          ]
       },
       {
          "cis":"010463003759026521uHpIIf-nXIH>2",
          "type":"tracking code"
       }
    ],
    "overhead":0.0
}'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the single Shipment item created.

```json
[
    {
       "meta":{
          "href":"https://app.kladana.in/api/remap/1.2/entity/demand/8830a022-8a03-11ea-0a80-01cb00000040/positions/770f45b4-8a04-11ea-0a80-01cb00000060",
          "type":"demand position",
          "mediaType":"application/json"
       },
       "id":"770f45b4-8a04-11ea-0a80-01cb00000060",
       "accountId":"de6b5113-8491-11ea-0a80-134500000014",
       "quantity":10.0,
       "price":100.0,
       "discount":0.0,
       "vat":0,
       "vatEnabled": false,
       "assortment":{
          "meta":{
             "href":"https://app.kladana.in/api/remap/1.2/entity/product/b20184da-8493-11ea-0a80-037a00000314",
             "metadataHref":"https://app.kladana.in/api/remap/1.2/entity/product/metadata",
             "type":"product",
             "mediaType":"application/json",
             "uuidHref":"https://app.kladana.in/app/#good/edit?id=b20178fb-8493-11ea-0a80-037a00000312"
          }
       },
       "tracking codes":[
          {
             "cis":"010463003759026521uHpIIf-111122",
             "type":"tracking code"
          },
          {
             "cis":"012345678912345671",
             "type":"transportpack"
          },
          {
             "cis":"010463003759026521uHpIIf-nXIH>1",
             "type":"tracking code"
          },
          {
             "cis":"012345678912345678",
             "type":"transportpack",
             "tracking codes":[
                {
                   "cis":"010463003759026521uHpIIf-111114",
                   "type":"tracking code"
                },
                {
                   "cis":"010463003759026521uHpIIf-nXIH>4",
                   "type":"tracking code"
                },
                {
                   "cis":"010463003759026521uHpIIf-nXIH>0",
                   "type":"tracking code"
                }
             ]
          },
          {
             "cis":"010463003759026521uHpIIf-nXIH>2",
             "type":"tracking code"
          }
       ],
       "trackingCodes_1162":[
          {
             "cis_1162":"444D043603BEF0F97548704949662D313131313232",
             "type":"tracking code"
          },
          {
             "cis_1162":"0000",
             "type":"transportpack"
          },
          {
             "cis_1162":"444D043603BEF0F97548704949662D6E5849483E31",
             "type":"tracking code"
          },
          {
             "cis_1162":"0000",
             "type":"transportpack",
             "trackingCodes_1162":[
                {
                   "cis_1162":"444D043603BEF0F97548704949662D313131313134",
                   "type":"tracking code"
                },{
                   "cis_1162":"444D043603BEF0F97548704949662D6E5849483E34",
                   "type":"tracking code"
                },
                {
                   "cis_1162":"444D043603BEF0F97548704949662D6E5849483E30",
                   "type":"tracking code"
                }
             ]
          },
          {
             "cis_1162":"444D043603BEF0F97548704949662D6E5849483E32",
             "type":"tracking code"
          }
       ],
       "overhead":0.0
    }
]
```

### Shipment Items
 
### Get item

**Parameters**

| Parameter | Description |
| ------------ | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Shipment id. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Shipment item id. |
 
> Request to receive a separate Shipment item with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Shipment line item.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
     "type": "demand position",
     "mediaType": "application/json"
   },
   "id": "34f6344f-015e-11e6-9464-e4de0000006c",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "quantity": 20,
   "sum": 200,
   "discount": 0,
   "vat": 21,
   "vatEnabled": true,
   "assortment": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/product/be903062-f504-11e5-8a84-bae50000019a",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
     }
   }
}
```

### Change item

Request to update a Shipment line item. There is no way to update the item required fields in the body of the request. Only the ones you want to update.

When updating the list of marking codes, take into account that their number may differ from the actual number of product units.
To change the number of product units, you must use the **quantity** parameter.

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Shipment id. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Shipment item id. |
 
> An example of a request to update a line item in a Shipment.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
            "quantity": 111,
            "price": 26332700.0,
            "discount": 0,
            "vat": 18,
            "assortment": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/product/eeef177f-f648-11e5-8a84-bae50000007a",
                    "type": "product",
                    "mediaType": "application/json"
                }
            }
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Shipment item.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
     "type": "demand position",
     "mediaType": "application/json"
   },
   "id": "34f6344f-015e-11e6-9464-e4de0000006c",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "quantity": 111,
   "price": 26332700.0,
   "discount": 0,
   "vat": 18,
   "vatEnabled": true,
   "assortment": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/product/eeef177f-f648-11e5-8a84-bae50000007a",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
     }
   }
}
```

### Delete item

**Parameters**

| Parameter | Description|
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Shipment id. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Shipment item id. |

> Request to delete a single Shipment item with the specified id.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/demand/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of the Shipment item.
