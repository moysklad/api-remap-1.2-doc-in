## Sales Order
### Sales Orders

Kladana JSON API allows you to create and update information about Sales Orders, request lists of Sales Orders, and information on individual Sales Orders. You can manage Sales Order items as part of a Sales Order or separately with item managing means. The entity code for a Sales Order in the JSON API is the **customerorder** keyword. Sales Order also supports the widget updates notification protocol - **change-handler**. Learn more about [Sales Orders](https://kladana.zendesk.com/hc/en-us/articles/360011348457-Sales-Orders).

#### Entity attributes

| Name | Type                                               | Filtration | Description |
|-------|----------------------------------------------------| -----------| ------------|
| **accountId** | UUID                                               | `=` `!=` | Account ID<br>`+Required when replying` `+Read-only``+Change-handler` |
| **agent** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Counterparty metadata<br>`+Required when replying` `+Expand` `+Required when creating``+Change-handler` `+Update-provider` |
| **agentAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Counterparty account metadata<br>`+Expand``+Change-handler` `+Update-provider` |
| **applicable** | Boolean                                            | `=` `!=` | Postmark<br>`+Required when replying` `+Change-handler` `+Update-provider` |
| **attributes** | Array(Object)                                      | Operators of additional fields | Additional fields metadata collection<br>`+Change-handler` `+Update-provider` |
| **code** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Sales Order Code |
| **contract** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Contract metadata<br>`+Expand``+Change-handler` `+Update-provider` |
| **created** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Creation date<br>`+Required when replying` `+Read-only``+Change-handler` |
| **deleted** | Datetime                                           | `=` `!=` `<` `>` `<=` `>=` | The Sales Order last deletion date and time<br>`+Read Only` |
| **deliveryPlannedMoment** | Datetime                                           | `=` `!=` `<` `>` `<=` `>=` | Estimated date of shipment<br>`+Change-handler` `+Update-provider` |
| **description** | String(4096)                                       | `=` `!=` `~` `~=` `=~` | Sales Order Comment<br>`+Change-handler` `+Update-provider` |
| **externalCode** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Sales Order External Code<br>`+Required when replying``+Change-handler` `+Update-provider` |
| **files** | MetaArray                                          | | Files array metadata. Maximum number of files - 100<br>`+Required when replying` `+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID                                               | `=` `!=` | Sales Order ID<br>`+Required when replying` `+Read-only``+Change-handler` |
| **invoicedSum** | Float                                              | | Sales invoice amount<br>`+Required when replying` `+Read-only``+Change-handler` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Sales Order Metadata<br>`+Required when replying``+Change-handler` |
| **moment** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | The date of transaction<br>`+Required when replying``+Change-handler` `+Update-provider` |
| **name** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Sales Order Name<br>`+Required when replying``+Change-handler` `+Update-provider` |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Legal entity metadata<br>`+Required when replying` `+Expand` `+Required when creating``+Change-handler` `+Update-provider` |
| **organizationAccount** | [Meta](../#kladana-json-api-general-info-metadata) | | Legal entity account metadata<br>`+Expand``+Change-handler` `+Update-provider` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Expand` |
| **paidSum** | Float                                              | | Amount of incoming payments for the Sales Order<br>`+Required when replying` `+Read-only``+Change-handler` |
| **positions** | MetaArray                                          | | Sales Order item metadata<br>`+Required when replying` `+Expand``+Change-handler` `+Update-provider` |
| **printed** | Boolean                                            | `=` `!=` | Is the document printed<br>`+Required when replying` `+Read Only` |
| **project** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Project metadata<br>`+Expand``+Change-handler` `+Update-provider` |
| **published** | Boolean                                            | `=` `!=` | Is the transaction published or not<br>`+Required when replying` `+Read Only` |
| **rate** | Object                                             | | Currency<br>`+Required when replying``+Change-handler` `+Update-provider` |
| **reservedSum** | Float                                              | | Amount of reserved products<br>`+Required when replying` `+Read-only``+Change-handler` |
| **salesChannel** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Sales channel metadata<br>`+Expand` |
| **shared** | Boolean                                            | `=` `!=` | Sharing<br>`+Required when replying` |
| **shipmentAddress** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Sales Order Delivery Address<br>`+Change-handler` |
| **shipmentAddressFull** | Object                                             | | Delivery address of the Sales Order with individual fields details. [Learn more](../documents/#transactions-sales-order-sales-orders-entity-attributes-39-delivery-address-39)<br>`+Change-handler` |
| **shippedSum** | Float                                              | | Amount of shipped products<br>`+Required when replying` `+Read-only``+Change-handler` |
| **state** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Sales Order status metadata<br>`+Expand``+Change-handler` `+Update-provider` |
| **store** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Warehouse metadata<br>`+Expand``+Change-handler` `+Update-provider` |
| **sum** | Float                                              | `=` `!=` `<` `>` `<=` `>=` | Amount of the Sales Order in the specified currency<br>`+Required when replying` `+Read-only``+Change-handler` |
| **syncId** | UUID                                               | `=` `!=` | Synchronization ID. Cannot be edited |
| **taxSystem** | Enum                                               | | Tax system code. [Learn more](../dictionaries/#entities-product-products-entity-attributes-tax-system-code)<br>`+Change-handler` |
| **updated** | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Date and time of the Sales Order last update<br>`+Required when replying` `+Read-only``+Change-handler` |
 
##### Tax system code 

The values of the `taxSystem` field.

| Value | Description |
| ----- | ----------- |
| **TAX**  | Tax   |
| **GST** | GST |

#### Links to the other transactions

| Name | Description |
|---------|--------------------|
| **purchaseOrders** | Array of links to the related Purchase Orders in the [metadata](../#kladana-json-api-general-info-metadata)format|
| **demands** | Array of links to the related Shipments in the [metadata](../#kladana-json-api-general-info-metadata)format|
| **payments** | Array of links to the related Payments in the [metadata](../#kladana-json-api-general-info-metadata)format|
| **productionTasks** | Array of links to the related Production Orders in the [metadata](../#kladana-json-api-general-info-metadata)format|
| **invoicesOut** | Array of links to the related Sales Invoices in the [metadata](../#kladana-json-api-general-info-metadata)format|
| **moves** | Array of links to the related Transfers in the [metadata](../#kladana-json-api-general-info-metadata)format|

#### Sales Orders Items

Sales Order items are arranged as a list of objects (products, services, variants, bundles). The objects contain the following fields:

| Name | Type    | Description |
| ----- | -------- | --------- |
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Read-only``+Change-handler` |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of an item (product/service/bundle/variant) <br>`+Required when replying` `+Expand``+Change-handler` `+Update-provider` |
| **discount** | Float                                                | The percentage of a discount or a margin. The margin is indicated as a negative number, i.e. -10 creates 10% margin<br>`+Required when replying``+Change-handler` `+Update-provider` |
| **id** | UUID                                               | Item ID<br>`+Required when replying` `+Read-only``+Change-handler` `+Update-provider` |
| **pack** | Object                                             | Product packaging. [Learn more](../dictionaries/#entities-product-products-nested-entity-attributes-product-packaging)<br>`+Change-handler` `+Update-provider` |
| **price** | Float                                              | Price of a product/service in paise<br>`+Required when replying``+Change-handler` `+Update-provider` |
| **quantity** | Float                                               | The number of product/service items of a certain type. If the item is a product that has tracking by serial numbers enabled, the value in this field is always equal to the number of serial numbers for this item in the transaction.<br>`+Required when replying``+Change-handler` `+Update-provider `|
| **reserve** | Float                                                | The item reserve<br>`+Change-handler` `+Update-provider` |
| **shipped** | Float                                               | Shipped<br>`+Required when replying` `+Read-only` `+Change-handler` |
| **taxSystem** | Enum                                               | Tax system code. [Learn more](../dictionaries/#entities-product-products-entity-attributes-tax-system-code) |
| **vat** | Int                                                | VAT applicable to the current item<br>`+Required when replying``+Change-handler` `+Update-provider` |
| **vatEnabled** | Boolean                                            | Whether VAT is included for the item, or not. If it is on, you can set VAT = 0, or VAT = "excluding VAT" for an item. (vat = 0, vatEnabled = false) -> vat = "without VAT", (vat = 0, vatEnabled = true) -> vat = 0%.<br>`+Required when replying``+Change-handler` ` +Update-provider`|

You can manage Sales Order items as part of a Sales Order or separately with item managing means. 

To manage the items as part of a Sales Order, send requests to create a Sales Order with an array of items included in the request body. If the number of items exceeds the limit, for further replenishment of items, use the Sales Order Items resource.

To manage the items separately, send requests to update the list of items with an array of items included in the request body. 

**Note:** The list of items is regarded as "all items of the Sales Order". It entirely replaces the current list of items during the update. Extra
items are deleted, new items are added, and existing ones are changed.

#### Entity attributes 'Delivery Address'

| Name | Type | Description |
| -----|----- | ----------- |
| **addInfo** | String(255) | Other |
| **apartment** | String(30) | Apartment |
| **city** | String(255) | City |
| **comment** | String(255) | Comment |
| **country** | [Meta](../#kladana-json-api-general-info-metadata)| Country metadata |
| **house** | String(30) | Building |
| **postalCode** | String(6) | Postcode |
| **region** |[Meta](../#kladana-json-api-general-info-metadata) | Region metadata |
| **street** | String(255) | Street |

The address string is a concatenation of the structured address fields in the following order: 'postalCode' -> 'country' -> 'region' -> 'city' -> 'street' -> 'house' -> 'apartment' -> 'addInfo'. Use commas to separate the fields.

To pass an entity with an address to Kladana, use a string address or a structured address. If both addresses are passed, the string address is ignored. If only a string address is passed, it is reflected in both the string field and the 'addInfo' structured address.

The `null` value for an address is not supported. If you pass `null` to an address, it does not remove it. To remove an address, pass the empty string `""` to the `shipmentAddress` string field.

### Get the list of Sales Orders

Query: All the Sales Orders on the account.
Result: JSON object with the following fields:

| Name | Type | Description |
| -----|----- | ----------- |
| **meta** | Meta | Issuance metadata.|
| **context** | Meta | Metadata of the employee who made the request. |
| **rows** | Array(Object) | JSON object array representing Sales Orders.|

**Parameters**

| Parameter  | Description                                                                                                                      |
|------------|----------------------------------------------------------------------------------------------------------------------------------|
| **limit**  | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities.                                          |
| **search** | `string` (optional) *Example: 0001* Transaction filter by the specified search string.                                           |

> Get the list of Sales Orders

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/customerorder" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of a list of Sales Orders.

```json
{
  "context": {
    "employee": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/context/employee",
        "type": "employee",
        "mediaType": "application/json"
      }
    }
  },
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/customerOrder",
    "type": "customerorder",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/34efe2ee-015e-11e6-9464-e4de0000006b",
        "type": "customerorder",
        "mediaType": "application/json"
      },
      "id": "34efe2ee-015e-11e6-9464-e4de0000006b",
      "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
      "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
      "updated": "2016-04-14 12:03:05",
      "name": "00001",
      "description": "Comment to the Sales Order",
      "externalCode": "CntjFix4hoyZOIhZiULjv2",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json"
        }
      },
      "shared": false,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "moment": "2016-04-13 12:57:00",
      "applicable": true,
      "created": "2007-02-07 17:16:41",
      "printed": true,
      "published": true,
      "vatEnabled": true,
      "vatIncluded": true,
      "sum": 346453701206,
      "rate": {
        "currency": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/bc1b4fde-019a-11e6-9464-e4de00000073",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json"
          }
        },
        "value": 214
      },
      "organization": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
          "type": "organization",
          "mediaType": "application/json"
        }
      },
      "store": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
          "type": "store",
          "mediaType": "application/json"
        }
      },
      "contract": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/contract/8ce3c179-015e-11e6-9464-e4de0000007a",
          "type": "contract",
          "mediaType": "application/json"
        }
      },
      "agent": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
          "type": "counterparty",
          "mediaType": "application/json"
        }
      },
      "state": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
          "type": "state",
          "mediaType": "application/json"
        }
      },
      "organizationAccount": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/850c8af2-f504-11e5-8a84-bae50000015f",
          "type": "account",
          "mediaType": "application/json"
        }
      },
      "agentAccount": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078/accounts/9794f7a0-f689-11e5-8a84-bae500000079",
          "type": "account",
          "mediaType": "application/json"
        }
      },
      "salesChannel": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
          "type": "saleschannel",
          "mediaType": "application/json"
        }
      },
      "attributes": [
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
            "type": "attributemetadata",
            "mediaType": "application/json"
          },
          "id": "c2ecd338-015e-11e6-9464-e4de0000008f",
          "name": "AttributeName1",
          "type": "string",
          "value": "1251252"
        }
      ],
      "positions": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/34efe2ee-015e-11e6-9464-e4de0000006b/positions",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
          "type": "customerorderposition",
          "mediaType": "application/json",
          "size": 4,
          "limit": 1000,
          "offset": 0
        }
      },
      "reservedSum": 346389501206,
      "deliveryPlannedMoment": "2016-04-15 12:58:00",
      "payedSum": 365939611804,
      "shippedSum": 408739611676,
      "invoicedSum": 408739611676,
      "taxSystem": "GENERAL_TAX_SYSTEM",
      "shipmentAddress":"110008, India, Delhi, New Delhi, Karol Bagh, Akbar Road, 1, 123 , addInfo",
      "shipmentAddressFull": {
        "postalCode":"125009",
        "country": {
          "meta": {
            "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
            "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
            "type":"country",
            "mediaType":"application/json"
          }
        },
        "region": {
          "meta": {
            "href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
            "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
            "type":"region",
            "mediaType":"application/json"
          }
        },
        "city":"New Delhi",
        "street":"Akbar Road",
        "house":"1",
        "apartment":"123",
        "addInfo":"addinfo",
        "comment":"some words about the address"
      }
    }
  ]
}
```

### Create Sales Order

Request to create a new Sales Order.
The fields required to create:

| Parameter | Description |
| --------- | ----------- |
| **organization** | Link to your legal entity in the [Metadata](../#kladana-json-api-general-info-metadata) format |
| **agent** | Link to the counterparty (buyer) in the [Metadata](../#kladana-json-api-general-info-metadata) format|

> Example: Creating a new Sales Order with a request body containing the required fields only.

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/customerorder" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '{
            "organization": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                "type": "organization",
                "mediaType": "application/json"
              }
            },
            "agent": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
                "type": "counterparty",
                "mediaType": "application/json"
              }
            }
          }'  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the created Sales Order.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/d9ceb08f-01ae-11e6-9464-e4de00000020",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
    "type": "customerorder",
    "mediaType": "application/json"
  },
  "id": "d9ceb08f-01ae-11e6-9464-e4de00000020",
  "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
  "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
  "updated": "2016-04-14 13:02:24",
  "name": "00003",
  "externalCode": "08ehdxhRgVIB5-Sa-QNI42",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json"
    }
  },
  "shared": false,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "moment": "2016-04-14 13:02:24",
  "applicable": true,
  "vatEnabled": true,
  "vatIncluded": true,
  "rate": {
    "currency": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json"
      }
    }
  },
  "sum": 0,
  "organization": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
      "type": "organization",
      "mediaType": "application/json"
    }
  },
  "agent": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
      "type": "counterparty",
      "mediaType": "application/json"
    }
  },
  "state": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
      "type": "state",
      "mediaType": "application/json"
    }
  },
  "organizationAccount": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
      "type": "account",
      "mediaType": "application/json"
    }
  },
  "agentAccount": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078/accounts/9794f7a0-f689-11e5-8a84-bae500000079",
      "type": "account",
      "mediaType": "application/json"
    }
  },
  "created": "2007-02-07 17:16:41",
  "printed": true,
  "published": true,
  "positions": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/d9ceb08f-01ae-11e6-9464-e4de00000020/positions",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
      "type": "customerorderposition",
      "mediaType": "application/json",
      "size": 0,
      "limit": 1000,
      "offset": 0
    }
  },
  "reservedSum": 0,
  "payedSum": 0,
  "shippedSum": 0,
  "invoicedSum": 0
}
```

> Example: Creating a new Sales Order with a larger request body.

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/customerorder" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '{
            "name": "000034",
            "owner": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                "type": "employee",
                "mediaType": "application/json"
              }
            },
            "shared": false,
            "group": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
                "type": "group",
                "mediaType": "application/json"
              }
            },
            "organization": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                "type": "organization",
                "mediaType": "application/json"
              }
            },
            "code": "1243521",
            "moment": "2016-04-19 13:50:24",
            "applicable": false,
            "vatEnabled": false,
            "agent": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
                "type": "counterparty",
                "mediaType": "application/json"
              }
            },
            "state": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
                "type": "state",
                "mediaType": "application/json"
              }
            },
            "shipmentAddressFull": {  
              "postalCode":"125009",
              "country": {  
                "meta": {  
                  "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
                  "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
                  "type":"country",
                  "mediaType":"application/json"
                }
              },
              "region": {  
                "meta": {  
                  "href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
                  "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
                  "type":"region",
                  "mediaType":"application/json"
                }
              },
              "city":"New Delhi",
              "street":"Akbar Road",
              "house":"1",
              "apartment":"123",
              "addInfo":"addinfo",
              "comment":"some words about the address"
            }
          }'  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the created Sales Order

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
    "type": "customerorder",
    "mediaType": "application/json"
  },
  "id": "c49e83b3-01af-11e6-9464-e4de00000026",
  "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
  "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
  "updated": "2016-04-14 13:08:58",
  "name": "000034",
  "code": "1243521",
  "externalCode": "DAD9peGij6sDNii49Dkam2",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json"
    }
  },
  "shared": false,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "moment": "2016-04-19 13:50:24",
  "applicable": false,
  "vatEnabled": false,
  "rate": {
    "currency": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json"
      }
    }
  },
  "sum": 0,
  "organization": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
      "type": "organization",
      "mediaType": "application/json"
    }
  },
  "agent": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterperty/metadata",
      "type": "counterparty",
      "mediaType": "application/json"
    }
  },
  "state": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
      "type": "state",
      "mediaType": "application/json"
    }
  },
  "organizationAccount": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
      "type": "account",
      "mediaType": "application/json"
    }
  },
  "agentAccount": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078/accounts/9794f7a0-f689-11e5-8a84-bae500000079",
      "type": "account",
      "mediaType": "application/json"
    }
  },
  "created": "2007-02-07 17:16:41",
  "printed": true,
  "published": true,
  "positions": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026/positions",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
      "type": "customerorderposition",
      "mediaType": "application/json",
      "size": 0,
      "limit": 1000,
      "offset": 0
    }
  },
  "reservedSum": 0,
  "payedSum": 0,
  "shippedSum": 0,
  "invoicedSum": 0,
  "shipmentAddress":"110008, India, Delhi, New Delhi, Karol Bagh, Akbar Road, 1, 123 , addInfo",
  "shipmentAddressFull": {
    "postalCode":"125009",
    "country": {
      "meta": {
        "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
        "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
        "type":"country",
        "mediaType":"application/json"
      }
    },
    "region": {
      "meta": {
        "href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
        "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
        "type":"region",
        "mediaType":"application/json"
      }
    },
    "city":"New Delhi",
    "street":"Akbar Road",
    "house":"1",
    "apartment":"123",
    "addInfo":"addinfo",
    "comment":"some words about the address"
  }
}
```

> Example: Creating a new Sales Order with additional fields.

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/customerorder" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '{
            "name" : "000034",
            "organization": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                "type": "organization",
                "mediaType": "application/json"
              }
            },
            "code" : "1243521",
            "moment": "2016-04-19 13:50:24",
            "applicable": false,
            "vatEnabled": false,
            "agent": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
                "type": "counterparty",
                "mediaType": "application/json"
              }
            },
            "state": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
                "type": "state",
                "mediaType": "application/json"
              }
            },
            "attributes": [
              {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
                  "type": "attributemetadata",
                  "mediaType": "application/json"
                },
                "value": "Атрибут заказа",
              }
            ]
          }'  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the created Sales Order

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
    "type": "customerorder",
    "mediaType": "application/json"
  },
  "id": "c49e83b3-01af-11e6-9464-e4de00000026",
  "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
  "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
  "updated": "2016-04-14 13:08:58",
  "name": "000034",
  "code": "1243521",
  "externalCode": "DAD9peGij6sDNii49Dkam2",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json"
    }
  },
  "shared": false,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "moment": "2016-04-19 13:50:24",
  "applicable": false,
  "vatEnabled": false,
  "rate": {
    "currency": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json"
      }
    }
  },
  "sum": 0,
  "organization": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
      "type": "organization",
      "mediaType": "application/json"
    }
  },
  "agent": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
      "type": "counterparty",
      "mediaType": "application/json"
    }
  },
  "state": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
      "type": "state",
      "mediaType": "application/json"
    }
  },
  "organizationAccount": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
      "type": "account",
      "mediaType": "application/json"
    }
  },
  "agentAccount": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078/accounts/9794f7a0-f689-11e5-8a84-bae500000079",
      "type": "account",
      "mediaType": "application/json"
    }
  },
  "attributes": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
        "type": "attributemetadata",
        "mediaType": "application/json"
      },
      "id": "c2ecd338-015e-11e6-9464-e4de0000008f",
      "name": "AttributeName1",
      "type": "string",
      "value": "Order attribute"
    }
  ],
  "created": "2007-02-07 17:16:41",
  "printed": true,
  "published": true,
  "positions": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026/positions",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
      "type": "customerorderposition",
      "mediaType": "application/json",
      "size": 0,
      "limit": 1000,
      "offset": 0
    }
  },
  "reservedSum": 0,
  "payedSum": 0,
  "shippedSum": 0,
  "invoicedSum": 0
}
```

> Example: Creating a new Sales Order with items in the request body.

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/customerorder" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '{
            "name": "000034",
            "organization": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                "type": "organization",
                "mediaType": "application/json"
              }
            },
            "code": "1243521",
            "moment": "2016-04-19 13:50:24",
            "applicable": false,
            "vatEnabled": false,
            "agent": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
                "type": "counterparty",
                "mediaType": "application/json"
              }
            },
            "state": {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
                "type": "state",
                "mediaType": "application/json"
              }
            },
            "positions": [
              {
                "quantity": 10,
                "price": 100.0,
                "discount": 0,
                "vat": 0,
                "assortment": {
                  "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/product/8b382799-f7d2-11e5-8a84-bae5000003a5",
                    "type": "product",
                    "mediaType": "application/json"
                  }
                },
                "reserve": 10
              },
              {
                "quantity": 20,
                "price": 200.0,
                "discount": 0,
                "vat": 21,
                "assortment": {
                  "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/product/be903062-f504-11e5-8a84-bae50000019a",
                    "type": "product",
                    "mediaType": "application/json"
                  }
                },
                "reserve": 20
              },
              {
                "quantity": 30,
                "price": 300.0,
                "discount": 0,
                "vat": 7,
                "assortment": {
                  "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/product/c02e3a5c-007e-11e6-9464-e4de00000006",
                    "type": "product",
                    "mediaType": "application/json"
                  }
                },
                "pack": {
                  "id": "1bf22e62-8b47-11e8-56c0-000800000006"
                },
                "reserve": 30
              }
            ]
          }'  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the created Sales Order

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
    "type": "customerorder",
    "mediaType": "application/json"
  },
  "id": "c49e83b3-01af-11e6-9464-e4de00000026",
  "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
  "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
  "version": 0,
  "updated": "2016-04-14 13:08:58",
  "name": "000034",
  "code": "1243521",
  "externalCode": "DAD9peGij6sDNii49Dkam2",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json"
    }
  },
  "shared": false,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "moment": "2016-04-19 13:50:24",
  "applicable": false,
  "vatEnabled": false,
  "rate": {
    "currency": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json"
      }
    }
  },
  "sum": 0,
  "organization": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
      "type": "organization",
      "mediaType": "application/json"
    }
  },
  "agent": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterperty/metadata",
      "type": "counterparty",
      "mediaType": "application/json"
    }
  },
  "state": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
      "type": "state",
      "mediaType": "application/json"
    }
  },
  "organizationAccount": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
      "type": "account",
      "mediaType": "application/json"
    }
  },
  "agentAccount": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078/accounts/9794f7a0-f689-11e5-8a84-bae500000079",
      "type": "account",
      "mediaType": "application/json"
    }
  },
  "documents": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/06406b97-9138-11e6-8a84-bae500000000/documents",
      "mediaType": "application/json",
      "size": 0,
      "limit": 100,
      "offset": 0
    }
  },
  "created": "2007-02-07 17:16:41",
  "printed": true,
  "published": true,
  "positions": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026/positions",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
      "type": "customerorderposition",
      "mediaType": "application/json",
      "size": 3,
      "limit": 100,
      "offset": 0
    }
  },
  "reservedSum": 10000,
  "payedSum": 0,
  "shippedSum": 0,
  "invoicedSum": 0
}
```

### Sales Orders bulk creating and update

In the body of the request, you need to pass an array containing JSON representations of the Sales Orders that you want to create or update. Updated Sales Orders must contain the identifier in the form of metadata. [Learn more](../#kladana-json-api-general-info-create-and-update-multiple-objects).

> Example: Creating and updating multiple Sales Orders

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/customerorder" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '[
            {
              "name": "00003",
              "organization": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
                  "type": "organization",
                  "mediaType": "application/json"
                }
              },
              "agent": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
                  "type": "counterparty",
                  "mediaType": "application/json"
                }
              }
            },
            {
              "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
                "type": "customerorder",
                "mediaType": "application/json"
              },
              "name": "000039",
              "group": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/group/ee2d9c89-1fea-4791-8c99-722e8f8294d0",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
                  "type": "group",
                  "mediaType": "application/json"
                }
              },
              "externalCode": "championCode",
              "code": "codeOfChampion",
              "moment": "2013-04-19 13:50:24",
              "applicable": true,
              "vatEnabled": true,
              "vatIncluded": true,
              "agent": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/71d48933-fd85-11e5-9464-e4de00000005",
                  "type": "counterparty",
                  "mediaType": "application/json"
                }
              },
              "agentAccount": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/71d48933-fd85-11e5-9464-e4de00000005/accounts/71d4cfdb-fd85-11e5-9464-e4de00000006",
                  "type": "account",
                  "mediaType": "application/json"
                }
              },
              "state": {
                "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
                  "type": "state",
                  "mediaType": "application/json"
                }
              }
            }
          ]'  
```

> Response 200 (application/json)
The result is a JSON representations array of created and updated Sales Orders.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/d9ceb08f-01ae-11e6-9464-e4de00000020",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
      "type": "customerorder",
      "mediaType": "application/json"
    },
    "id": "d9ceb08f-01ae-11e6-9464-e4de00000020",
    "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
    "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
    "updated": "2016-04-14 13:02:24",
    "name": "00003",
    "externalCode": "08ehdxhRgVIB5-Sa-QNI42",
    "owner": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json"
      }
    },
    "shared": false,
    "group": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
        "type": "group",
        "mediaType": "application/json"
      }
    },
    "moment": "2016-04-14 13:02:24",
    "applicable": true,
    "vatEnabled": true,
    "vatIncluded": true,
    "rate": {
      "currency": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
          "type": "currency",
          "mediaType": "application/json"
        }
      }
    },
    "sum": 0,
    "organization": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
        "type": "organization",
        "mediaType": "application/json"
      }
    },
    "agent": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
        "type": "counterparty",
        "mediaType": "application/json"
      }
    },
    "state": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
        "type": "state",
        "mediaType": "application/json"
      }
    },
    "organizationAccount": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
        "type": "account",
        "mediaType": "application/json"
      }
    },
    "agentAccount": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078/accounts/9794f7a0-f689-11e5-8a84-bae500000079",
        "type": "account",
        "mediaType": "application/json"
      }
    },
    "created": "2007-02-07 17:16:41",
    "printed": true,
    "published": true,
    "positions": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/d9ceb08f-01ae-11e6-9464-e4de00000020/positions",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
        "type": "customerorderposition",
        "mediaType": "application/json",
        "size": 0,
        "limit": 1000,
        "offset": 0
      }
    },
    "reservedSum": 0,
    "payedSum": 0,
    "shippedSum": 0,
    "invoicedSum": 0
  },
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
      "type": "customerorder",
      "mediaType": "application/json"
    },
    "id": "c49e83b3-01af-11e6-9464-e4de00000026",
    "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
    "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
    "updated": "2016-04-14 13:30:05",
    "name": "000039",
    "code": "codeOfChampion",
    "externalCode": "championCode",
    "owner": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json"
      }
    },
    "shared": false,
    "group": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/group/ee2d9c89-1fea-4791-8c99-722e8f8294d0",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
        "type": "group",
        "mediaType": "application/json"
      }
    },
    "moment": "2013-04-19 12:50:24",
    "applicable": true,
    "vatEnabled": true,
    "vatIncluded": true,
    "rate": {
      "currency": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
          "type": "currency",
          "mediaType": "application/json"
        }
      }
    },
    "sum": 0,
    "organization": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
        "type": "organization",
        "mediaType": "application/json"
      }
    },
    "agent": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/71d48933-fd85-11e5-9464-e4de00000005",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
        "type": "counterparty",
        "mediaType": "application/json"
      }
    },
    "state": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
        "type": "state",
        "mediaType": "application/json"
      }
    },
    "organizationAccount": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
        "type": "account",
        "mediaType": "application/json"
      }
    },
    "agentAccount": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/71d48933-fd85-11e5-9464-e4de00000005/accounts/71d4cfdb-fd85-11e5-9464-e4de00000006",
        "type": "account",
        "mediaType": "application/json"
      }
    },
    "created": "2007-02-07 17:16:41",
    "printed": true,
    "published": true,    
    "positions": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026/positions",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
        "type": "customerorderposition",
        "mediaType": "application/json",
        "size": 3,
        "limit": 1000,
        "offset": 0
      }
    },
    "reservedSum": 0,
    "payedSum": 0,
    "shippedSum": 0,
    "invoicedSum": 0
  }
]
```

### Delete Sales Order

**Parameters**

| Parameter | Description |
| ---------- | ----------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Order ID |

> Request to delete the Sales Order with the specified ID.

```shell
curl --compressed -X DELETE \
  "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
The Sales Order is successfully deleted.

### Sales Order Metadata
#### Sales Order Metadata

Request to receive the metadata of Sales Orders. The result is a JSON object including:

**Parameters**

| Parameter | Description |
| ----------| ------------|
| **meta** | Link to the Sales Order metadata |
| **attributes** | Array of objects added. Sales Order fields in [Metadata](../#kladana-json-api-general-info-metadata) format |
| **states** | Sales Order statuses array|
| **createShared** | Create new Sales Orders with the "General" label |

The structure of a separate object representing an additional field is described in detail in [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

### Sales Orders bulk deletion

In the request body, you need to pass an array containing JSON metadata of the Sales Orders that you want to delete.


> Request for bulk deletion of Sales Orders.

```shell
curl --compressed -X POST \
   "https://api.kladana.com/api/remap/1.2/entity/customerorder/delete" \
   -H "Authorization: Basic <Credentials>" \
   -H "Accept-Encoding: gzip" \
   -H "Content-Type: application/json" \
   -d'[
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b1",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
             "type": "customerorder",
             "mediaType": "application/json"
         },
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b2",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
             "type": "customerorder",
             "mediaType": "application/json"
         }
       ]'
```

> Successful request. The result is JSON information about deleting Sales Orders.

```json
[
   {
     "info":"Entity 'salesorder' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'salesorder' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

> Sales Order Metadata

```shell
curl --compressed -X GET \
   "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata" \
   -H "Authorization: Basic <Credentials>" \
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional fields of Sales Orders.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/attributes/c2ecd338-015e-11e6-9464-e4de0000008f",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "name": "AttributeName1",
       "type": "boolean",
       "required": false
     }
   ],
   "states": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56c504-2e58-11e6-8a84-bae500000069",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "New",
       "color": 15106326,
       "stateType": "Regular",
       "entityType": "customerorder"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56cae3-2e58-11e6-8a84-bae50000006a",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56cae3-2e58-11e6-8a84-bae50000006a",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Confirmed",
       "color": 40931,
       "stateType": "Regular",
       "entityType": "customerorder"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56cf4f-2e58-11e6-8a84-bae50000006b",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56cf4f-2e58-11e6-8a84-bae50000006b",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Assembled",
       "color": 8767198,
       "stateType": "Regular",
       "entityType": "customerorder"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56d433-2e58-11e6-8a84-bae50000006c",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56d433-2e58-11e6-8a84-bae50000006c",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Shipped",
       "color": 10774205,
       "stateType": "Regular",
       "entityType": "customerorder"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56d92f-2e58-11e6-8a84-bae50000006d",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56d92f-2e58-11e6-8a84-bae50000006d",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Delivered",
       "color": 8825440,
       "stateType": "Successful",
       "entityType": "customerorder"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56de0a-2e58-11e6-8a84-bae50000006e",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56de0a-2e58-11e6-8a84-bae50000006e",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Return",
       "color": 15280409,
       "stateType": "Unsuccessful",
       "entityType": "customerorder"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56e2b4-2e58-11e6-8a84-bae50000006f",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "fb56e2b4-2e58-11e6-8a84-bae50000006f",
       "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
       "name": "Cancelled",
       "color": 15280409,
       "stateType": "Unsuccessful",
       "entityType": "customerorder"
     }
   ],
   "createShared": false
}
```
### Separate additional field

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Field ID. |

#### Separate additional field
> Request for information on a separate additional field.

```shell
curl --compressed -X GET \
   "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19" \
   -H "Authorization: Basic <Credentials>" \
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/attributes/57ab884e-558b-11e6-8a84-bae500000078",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "57ab884e-558b-11e6-8a84-bae500000078",
   "name": "AttributeName1",
   "type": "boolean",
   "required": false
}
```

### Sales Order

### Get Sales Order

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Order id. |
 
> Request to receive a separate Sales Order with the specified id.

```shell
curl --compressed -X GET \
   "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19" \
   -H "Authorization: Basic <Credentials>" \
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Sales Order.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/34efe2ee-015e-11e6-9464-e4de0000006b",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerOrder/metadata",
     "type": "customerorder",
     "mediaType": "application/json"
   },
   "id": "34efe2ee-015e-11e6-9464-e4de0000006b",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-14 12:03:05",
   "name": "00001",
   "description": "This is a comment on the customer's order!",
   "externalCode": "CntjFix4hoyZOIhZiULjv2",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2016-04-13 12:57:00",
   "applicable": true,
   "vatEnabled": true,
   "vatIncluded": true,
   "printed": true,
   "published": true,
   "sum": 346453701206,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/bc1b4fde-019a-11e6-9464-e4de00000073",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     },
     "value": 214
   },
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/850ee995-f504-11e5-8a84-bae500000160",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "contract": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/contract/8ce3c179-015e-11e6-9464-e4de0000007a",
       "type": "contract",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {"href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/850c8af2-f504-11e5-8a84-bae50000015f",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/9794d400-f689-11e5-8a84-bae500000078/accounts/9794f7a0-f689-11e5-8a84-bae500000079",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "salesChannel": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/56446e7f-3633-11ec-ac13-000d00000000",
       "type": "saleschannel",
       "mediaType": "application/json"
     }
   },
   "attributes": [{
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/attributes/c2ecd338-015e-11e6-9464-e4de0000008f",
       "type": "attributemetadata",
       "mediaType": "application/json"
     },
     "id": "c2ecd338-015e-11e6-9464-e4de0000008f",
     "name": "AttributeName1",
     "type": "long",
     "value": "1251252"
   }],
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/34efe2ee-015e-11e6-9464-e4de0000006b/positions",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
       "type": "customerorderposition",
       "mediaType": "application/json",
       "size": 4,
       "limit": 1000,
       "offset": 0
     }
   },
   "reservedSum": 346389501206,
   "deliveryPlannedMoment": "2016-04-15 12:58:00",
   "payedSum": 365939611804,
   "shippedSum": 408739611676,
   "invoicedSum": 408739611676,
   "shipmentAddress":"110008, India, Delhi, New Delhi, Karol Bagh, Akbar Road, 1, 123 , addInfo",
   "shipmentAddressFull": {
     "postalCode":"125009",
     "country": {
       "meta": {
         "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type":"country",
         "mediaType":"application/json"
       }
     },
     "region": {
       "meta": {
         "href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type":"region",
         "mediaType":"application/json"
       }
     },
     "city":"New Delhi",
     "street":"Akbar Road",
     "house":"1",
     "apartment":"123",
     "addInfo":"addinfo",
     "comment":"some words about address"
   }
}
```

### Change Sales Order

Request to update the Sales Order with the specified id.
In the body of the request, you can specify only those fields that need to be changed for the Sales Order, except for those that
are marked `Read Only` in the description of [Sales Order Attributes](../documents/#transactions-sales-order).
When updating the **organization** and **agent** fields, you must also update the **organizationAccount** and
**agentAccount** respectively, otherwise an error will occur.

**Parameters**

| Parameter | Description |
| ------- | --------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Order id. |

> Example: Request to update a single Sales Order.

```shell
   curl --compressed -X PUT \
     "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19" \
     -H "Authorization: Basic <Credentials>" \
     -H "Accept-Encoding: gzip" \
     -H "Content-Type: application/json" \
       -d '{
            "name": "000039",
            "group": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/group/ee2d9c89-1fea-4791-8c99-722e8f8294d0",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
                    "type": "group",
                    "mediaType": "application/json"
                }
            },
            "externalCode": "championCode",
            "code": "codeOfChampion",
            "moment": "2013-04-19 13:50:24",
            "applicable": true,
            "vatEnabled": true,
            "vatIncluded": true,
            "agent": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/71d48933-fd85-11e5-9464-e4de00000005",
                    "type": "counterparty",
                    "mediaType": "application/json"
                }
            },
            "agentAccount": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/71d48933-fd85-11e5-9464-e4de00000005/accounts/71d4cfdb-fd85-11e5-9464-e4de00000006",
                    "type": "account",
                    "mediaType": "application/json"
                }
            },
            "state": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
                    "type": "state",
                    "mediaType": "application/json"
                }
            },
            "shipmentAddressFull": {
                "postalCode": "125009",
                "country": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
                        "type": "country",
                        "mediaType": "application/json"
                    }
                },
                "region": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
                        "type": "region",
                        "mediaType": "application/json"
                    }
                },
                "city": "New Delhi",
                "street": "Akbar Road",
                "house": "1",
                "apartment": "111",
                "addInfo": "addinfo",
                "comment": "some words about address"
            }
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Sales Order.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
     "type": "customerorder",
     "mediaType": "application/json"
   },
   "id": "c49e83b3-01af-11e6-9464-e4de00000026",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-14 13:30:05",
   "name": "000039",
   "code": "codeOfChampion",
   "externalCode": "championCode",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/ee2d9c89-1fea-4791-8c99-722e8f8294d0",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2013-04-19 12:50:24",
   "applicable": true,
   "vatEnabled": true,
   "vatIncluded": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 0,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/71d48933-fd85-11e5-9464-e4de00000005",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/71d48933-fd85-11e5-9464-e4de00000005/accounts/71d4cfdb-fd85-11e5-9464-e4de00000006",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2007-02-07 17:16:41",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026/positions",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
       "type": "customerorderposition",
       "mediaType": "application/json",
       "size": 3,
       "limit": 1000,
       "offset": 0
     }
   },
   "reservedSum": 0,
   "paidSum": 0,
   "shippedSum": 0,
   "invoicedSum": 0,
   "shipmentAddress":"110008, India, Delhi, New Delhi, Karol Bagh, Akbar Road, 1, 123 , addInfo",
   "shipmentAddressFull": {
     "postalCode":"125009",
     "country": {
       "meta": {
         "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type":"country",
         "mediaType":"application/json"
       }
     },
     "region": {
       "meta": {
         "href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type":"region",
         "mediaType":"application/json"
       }
     },
     "city":"New Delhi",
     "street":"Akbar Road",
     "house":"1",
     "apartment":"111",
     "addInfo":"addinfo",
     "comment":"some words about address"
   }
}
```

> Example: Request to change a Sales Order with additional fields.

```shell
   curl --compressed -X PUT \
     "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19" \
     -H "Authorization: Basic <Credentials>" \
     -H "Accept-Encoding: gzip" \
     -H "Content-Type: application/json" \
       -d '{
             "name": "000039",
             "externalCode": "championCode",
             "code": "codeOfChampion",
             "moment": "2013-04-19 13:50:24",
             "applicable": true,
             "vatEnabled": true,
             "vatIncluded": true,
             "agent": {
               "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/71d48933-fd85-11e5-9464-e4de00000005",
                   "type": "counterparty",
                   "mediaType": "application/json"
               }
             },
             "agentAccount": {
               "meta": {
                           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/71d48933-fd85-11e5-9464-e4de00000005/accounts/71d4cfdb-fd85-11e5-9464-e4de00000006",
                           "type": "account",
                           "mediaType": "application/json"
                       }
             },
             "state": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
                 "type": "state",
                 "mediaType": "application/json"
               }
             },
             "attributes": [
               {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "Updated Order Attribute",
               }
             ]
           }'
```

> Response 200(application/json)
successful request. The result is a JSON representation of the updated Sales Order.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
     "type": "customerorder",
     "mediaType": "application/json"
   },
   "id": "c49e83b3-01af-11e6-9464-e4de00000026",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-14 13:30:05",
   "name": "000039",
   "code": "codeOfChampion",
   "externalCode": "championCode",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2013-04-19 12:50:24",
   "applicable": true,
   "vatEnabled": true,
   "vatIncluded": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 0,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/71d48933-fd85-11e5-9464-e4de00000005",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/71d48933-fd85-11e5-9464-e4de00000005/accounts/71d4cfdb-fd85-11e5-9464-e4de00000006",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "c2ecd338-015e-11e6-9464-e4de0000008f",
       "name": "AttributeName1",
       "type": "string",
       "value": "Updated Order Attribute"
     }
   ],
   "created": "2007-02-07 17:16:41",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026/positions",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
       "type": "customerorderposition",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "reservedSum": 0,
   "paidSum": 0,
   "shippedSum": 0,
   "invoicedSum": 0
}
```

> Example: Request to update a Sales Order with items in the request body.

```shell
   curl --compressed -X PUT \
     "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19" \
     -H "Authorization: Basic <Credentials>" \
     -H "Accept-Encoding: gzip" \
     -H "Content-Type: application/json" \
       -d '{
            "name": "000039",
            "externalCode": "championCode",
            "code": "codeOfChampion",
            "moment": "2013-04-19 13:50:24",
            "applicable": true,
            "vatEnabled": true,
            "vatIncluded": true,
            "agent": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/71d48933-fd85-11e5-9464-e4de00000005",
                    "type": "counterparty",
                    "mediaType": "application/json"
                }
            },
            "agentAccount": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/71d48933-fd85-11e5-9464-e4de00000005/accounts/71d4cfdb-fd85-11e5-9464-e4de00000006",
                    "type": "account",
                    "mediaType": "application/json"
                }
            },
            "state": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
                    "type": "state",
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
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/8b382799-f7d2-11e5-8a84-bae5000003a5",
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
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/be903062-f504-11e5-8a84-bae50000019a",
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
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/c02e3a5c-007e-11e6-9464-e4de00000006",
                            "type": "product",
                            "mediaType": "application/json"
                        }
                    },
                    "reserve": 30
                }
            ]
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Sales Order.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
     "type": "customerorder",
     "mediaType": "application/json"
   },
   "id": "c49e83b3-01af-11e6-9464-e4de00000026",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "syncId": "734a9e26-45a2-4ead-849c-e144daeb854d",
   "updated": "2016-04-14 13:30:05",
   "name": "000039",
   "code": "codeOfChampion",
   "externalCode": "championCode",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": false,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/ee2d9c89-1fea-4791-8c99-722e8f8294d0",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "moment": "2013-04-19 12:50:24",
   "applicable": true,
   "vatEnabled": true,
   "vatIncluded": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/baac25f0-50ac-11e5-300d-c79b00000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "sum": 0,
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json"
     }
   },
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/71d48933-fd85-11e5-9464-e4de00000005",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "state": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "organizationAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/850c8195-f504-11e5-8a84-bae50000015e/accounts/3a30e844-016f-11e6-9464-e4de00000068",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "agentAccount": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/71d48933-fd85-11e5-9464-e4de00000005/accounts/71d4cfdb-fd85-11e5-9464-e4de00000006",
       "type": "account",
       "mediaType": "application/json"
     }
   },
   "created": "2007-02-07 17:16:41",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/c49e83b3-01af-11e6-9464-e4de00000026/positions",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
       "type": "customerorderposition",
       "mediaType": "application/json",
       "size": 3,
       "limit": 1000,
       "offset": 0
     }
   },
   "reservedSum": 0,
   "paidSum": 0,
   "shippedSum": 0,
   "invoicedSum": 0
}
```

### Sales Order Items
A separate resource for managing the items of the Sales Order. With it, you can manage the items of a large document that has more lines than the limit on the number of lines saved with the document. This limit is 1000. You can read more about limits on the number of document lines and working with large documents [here](../#kladana-json-api-general-info-working-with-transaction-items).

### Get Sales Order items
Request to receive a list of all items of this Sales Order.

| Title | Type | Description |
| ----------- | ------- | ------------ |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | issuance metadata.|
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the Sales Order items. |

**Parameters**

| Parameter | Description |
| --------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Order id. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Request for a list of all items in this Sales Order.

```shell
curl --compressed -X GET \
   "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19/positions" \
   -H "Authorization: Basic <Credentials>" \
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of individual Sales Order items.

```json
{
   "context": {
     "employee": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/context/employee",
         "type": "employee",
         "mediaType": "application/json"
       }
     }
   },
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19/positions",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
     "type": "customerorderposition",
     "mediaType": "application/json",
     "size": 4,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
         "type": "customerorderposition",
         "mediaType": "application/json"
       },
       "id": "34f6344f-015e-11e6-9464-e4de0000006c",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "quantity": 1,
       "price": 123050.0,
       "discount": 0,
       "vat": 18,
       "vatEnabled": true,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/66ccbc9f-f7d2-11e5-8a84-bae500000076",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=e639e90c-2a99-11e9-ac12-000c0000003e"
         }
       },
       "reserve": 1
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6451e-015e-11e6-9464-e4de0000006d",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
         "type": "customerorderposition",
         "mediaType": "application/json"
       },
       "id": "34f6451e-015e-11e6-9464-e4de0000006d",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "quantity": 1,
       "price": 64200000.0,
       "discount": 0,
       "vat": 18,
       "vatEnabled": true,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/60fc3826-00d7-11e6-9464-e4de00000097",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=e639e90c-2a99-11e9-ac12-000c0000003e"
         }
       },
       "reserve": 0
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6551d-015e-11e6-9464-e4de0000006e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
         "type": "customerorderposition",
         "mediaType": "application/json"
       },
       "id": "34f6551d-015e-11e6-9464-e4de0000006e",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "quantity": 1,
       "price": 346347237062.0,
       "discount": 0,
       "vat": 18,
       "vatEnabled": true,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/56c73633-ffe4-11e5-9464-e4de000000c6",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "variant",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#feature/edit?id=e639e90c-2a99-11e9-ac12-000c00001222"
         }
       },
       "reserve": 1
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f66948-015e-11e6-9464-e4de0000006f",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
         "type": "customerorderposition",
         "mediaType": "application/json"
       },
       "id": "34f66948-015e-11e6-9464-e4de0000006f",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "quantity": 1,
       "price": 42141094.0,
       "discount": 0,
       "vat": 18,
       "vatEnabled": true,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/variant/66cc36dc-f7d2-11e5-8a84-bae500000074",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
           "type": "variant",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3c6dc9b8-2842-11e9-ac12-000c00000071"
         }
       },
       "reserve": 1
     }
   ]
}
```

### Sales Order Item
A separate Sales Order item with the specified item ID.

### Get an Item

**Parameters**

| Parameter     | Description   |
| ------------- | ------------- |
| **id**         | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Order ID.         |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Sales Order Item ID. |

> Request to receive a separate Sales Order item with the specified ID.

```shell
curl --compressed -X GET \
  "https://app.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. Result is JSON representation of an individual Sales Order item.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
    "metadataHref": "https://app.kladana.com/api/remap/1.2/entity/customerorder/metadata",
    "type": "customerorderposition",
    "mediaType": "application/json"
  },
  "id": "34f6344f-015e-11e6-9464-e4de0000006c",
  "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
  "quantity": 1,
  "price": 123050.0,
  "discount": 0,
  "vat": 18,
  "vatEnabled": true,
  "assortment": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/66ccbc9f-f7d2-11e5-8a84-bae500000076",
      "metadataHref": "https://app.kladana.com/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#good/edit?id=392c045c-2842-11e9-ac12-000a00000002"
    }
  },
  "reserve": 1
}
```

### Create an Item
Request to create a new item in the Sales Order.
For successful creation, the following fields must be specified in the request body:

+ **assortment** - Link to the product/service/batches/product variant/set that the item represents. You can read more about this field in the description of the [Order item](../documents/#transactions-sales-order-sales-orders-sales-orders-items)

+ **quantity** - Quantity of the specified item. Must be positive, otherwise an error will occur.

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Order id. |

> Example: Creating an item in a Sales Order.

```shell
   curl --compressed -X POST \
     "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19/positions" \
     -H "Authorization: Basic <Credentials>" \
     -H "Accept-Encoding: gzip" \
     -H "Content-Type: application/json" \
       -d '{
             "quantity": 49,
             "price": 12345.0,
             "discount": 0.0,
             "vat": 18,
             "assortment": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/product/66ccbc9f-f7d2-11e5-8a84-bae500000076",
                 "type": "product",
                 "mediaType": "application/json"
               }
             },
             "reserve": 19
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created item of a single Sales Order.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19/positions/a7a61c8b-acdd-11e6-8a84-bae500000000",
       "type": "customerorderposition",
       "mediaType": "application/json"
     },
     "id": "a7a61c8b-acdd-11e6-8a84-bae500000000",
     "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
     "quantity": 49,
     "price": 12345.0,
     "discount": 0.0,
     "vat": 18,
     "vatEnabled": true,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/66ccbc9f-f7d2-11e5-8a84-bae500000076",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=3c6dc9b8-2842-11e9-ac12-000c00000071"
       }
     },
     "reserve": 19
   }
]
```

> Example: Creating several items at once in a Sales Order.

```shell
   curl --compressed -X POST \
     "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19/positions" \
     -H "Authorization: Basic <Credentials>" \
     -H "Accept-Encoding: gzip" \
     -H "Content-Type: application/json" \
       -d'[
             {
               "quantity": 12,
               "price": 300.0,
               "vat": 0,
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                   "type": "variant",
                   "mediaType": "application/json"
                 }
               },
               "reserve": 11
             },
             {
               "quantity": 3,
               "price": 1000.0,
               "discount": 0,
               "vat": 10,
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/product/7a6f697f-3c64-11e6-8a84-bae500000006",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                   "type": "product",
                   "mediaType": "application/json"
                 }
               },
               "reserve": 1
             },
             {
               "quantity": 404,
               "price": 454.0,
               "discount": 200,
               "vat": 21,
               "assortment": {
                 "meta": {
                   "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a83c422-3c64-11e6-8a84-bae500000012",
                   "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                   "type": "variant",
                   "mediaType": "application/json"
                 }
               },
               "reserve": 216
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of created items of a single Sales Order.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19/positions/f389488d-3f71-11e6-8a84-bae50000005f",
       "type": "customerorderposition",
       "mediaType": "application/json"
     },
     "id": "f389488d-3f71-11e6-8a84-bae50000005f",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 12,
     "price": 300.0,
     "discount": 0,
     "vat": 0,
     "vatEnabled": false,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a81082f-3c64-11e6-8a84-bae50000000e",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#feature/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
       }
     },
     "shipped": 0,
     "reserve": 11
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19/positions/f389521b-3f71-11e6-8a84-bae500000060",
       "type": "customerorderposition",
       "mediaType": "application/json"
     },
     "id": "f389521b-3f71-11e6-8a84-bae500000060",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 3,
     "price": 1000.0,
     "discount": 0,
     "vat": 10,
     "vatEnabled": true,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/7a6f697f-3c64-11e6-8a84-bae500000006",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
       }
     },
     "shipped": 0,
     "reserve": 1
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19/positions/f3895aa1-3f71-11e6-8a84-bae500000061",
       "type": "customerorderposition",
       "mediaType": "application/json"
     },
     "id": "f3895aa1-3f71-11e6-8a84-bae500000061",
     "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
     "quantity": 404,
     "price": 454.0,
     "discount": 200,
     "vat": 21,
     "vatEnabled": true,
     "assortment": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/variant/7a83c422-3c64-11e6-8a84-bae500000012",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
         "type": "variant",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#feature/edit?id=392c045c-2842-11e9-ac12-000a00000002"
       }
     },
     "shipped": 0,
     "reserve": 216
   }
]
```

### Change Sales Order Item

Request to update a line item of the Order. There is no way to update the item required fields in the body of the request. Only the ones you want to update.

**Parameters**

| Parameter | Description |
| ------- | ----------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Order id. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Sales Order item id. |
 
> Example: Request to update a single item in a Sales Order.

```shell
   curl --compressed -X PUT \
     "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c" \
     -H "Authorization: Basic <Credentials>" \
     -H "Accept-Encoding: gzip" \
     -H "Content-Type: application/json" \
       -d '{
             "quantity": 111,
             "price": 26332700.0,
             "discount": 0,
             "vat": 18,
             "assortment": {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/product/eeef177f-f648-11e5-8a84-bae50000007a",
                 "type": "product",
                 "mediaType": "application/json"
               }
             },
             "reserve": 13
           }'
```

> Response 200(application/json)
successful request. The result is a JSON representation of the updated item in the Sales Order.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
     "type": "customerorderposition",
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
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/eeef177f-f648-11e5-8a84-bae50000007a",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#good/edit?id=392c045c-2842-11e9-ac12-000a00000002"
     }
   },
   "reserve": 13
}
```

### Delete Item

**Parameters**

| Parameter | Description |
| ------------ | ------------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Sales Order id. |
| **positionID** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Sales Order item id. |
 
> Request to delete a single Sales Order item with the specified ID.

```shell
curl --compressed -X DELETE \
   "https://api.kladana.com/api/remap/1.2/entity/customerorder/7944ef04-f831-11e5-7a69-971500188b19/positions/34f6344f-015e-11e6-9464-e4de0000006c" \
   -H "Authorization: Basic <Credentials>" \
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
The item of the Sales Order was successfully deleted.


### Bulk deletion of items

**Parameters**

| Parameter | Description |
| --------- | ----------- |
| **id**   | `string` (required) *Example: 3e1c03bb-684f-11ee-ac12-000c000000b0* Sales Order ID.|

> Request for bulk deletion of Sales Order items.

```shell
curl --compressed -X POST \
  "https://api.kladana.com/api/remap/1.2/entity/customerorder/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/delete" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip" \
  -H "Content-Type: application/json" \
  -d '[
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/7fce2da5-684d-11ee-ac12-000c000000a2",
            "type": "customerorderposition",
            "mediaType": "application/json"
          }
        },
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/3e1c03bb-684f-11ee-ac12-000c000000b0/positions/7fce37a5-684d-11ee-ac12-000c000000a3",
            "type": "customerorderposition",
            "mediaType": "application/json"
          }
        }
      ]'  
```

> Response 200 (application/json)
The items of the Sales Order was successfully deleted.
