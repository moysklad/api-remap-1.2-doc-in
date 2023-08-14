## Internal Order

Using the JSON API, you can create and update information about Internal Orders, query lists of Internal Orders, and query individual Internal Orders. Items of Internal orders can be managed either as part of a separate order or using special resources for managing items. The entity code for an Internal Order in the JSON API is the **internalorder** keyword.

### Internal Order
#### Entity attributes

| Title | Type | Filtration | Description |
| ------ | ------ | ------- | ------- |
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **applicable** | Boolean | `=` `!=` | Check mark<br>`+Required when answering` |
| **attributes** | Array(Object) | [Operators of additional fields](../#mojsklad-json-api-obschie-swedeniq-fil-traciq-wyborki-s-pomosch-u-parametra-filter-fil-traciq-po-dopolnitel-nym-polqm) | Additional metadata collection fields. [Object fields](../#kladana-json-api-general-info-additional-fields)<br>`+Read only` |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Internal order code |
| **created** | datetime | `=` `!=` `<` `>` `<=` `>=` | Creation date<br>`+Required when replying` `+Read only` |
| **deleted** | datetime | `=` `!=` `<` `>` `<=` `>=` | The moment when the Internal Order was last deleted<br>`+Required when replying` `+Read Only` |
| **deliveryPlannedMoment** | datetime | | Planned acceptance date |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Comment of Internal order |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | External code of the Internal order<br>`+Required when replying` |
| **files** | MetaArray | | [Files] array metadata(../dictionaries/#entities-fajly) (Maximummaximum number of files - 100)<br>`+Required when replying` `+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID | `=` `!=` | Internal Order ID<br>`+Required when replying` `+Read Only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Internal Order Metadata<br>`+Required when Response` `+Read Only` |
| **moment** | datetime | `=` `!=` `<` `>` `<=` `>=` | Document date<br>`+Required when replying` |
| **moves** | Array(Object) | | A collection of metadata for related transfer orders<br>`+Required when replying` |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Internal Order Name<br>`+Required when replying` `+Required when creating` |
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Legal entity metadata<br>`+Required when replying` `+Expand` `+Required when creating` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Required when replying` `+Expand` |
| **positions** | MetaArray | | Metadata of Internal Order Items<br>`+Required on Response` `+Read Only` `+Expand` |
| **printed** | Boolean | `=` `!=` | Is the document printed<br>`+Required when responding` `+Read Only` |
| **project** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Project metadata<br>`+Expand` |
| **published** | Boolean | `=` `!=` | Is the document published<br>`+Required when replying` `+Read Only` |
| **purchaseOrders** | Array(Object) | | A collection of metadata for related orders to a supplier<br>`+Required when replying` |
| **rate** | object | | Currency. [More details here](../documents/#transactions-teh-operaciq-valuta-w-dokumentah)<br>`+Required when replying` |
| **shared** | Boolean | `=` `!=` | Sharing<br>`+Required when replying` `+Read Only` |
| **state** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Internal order status metadata<br>`+Expand` |
| **store** | [Meta](../#kladana-json-api-general-info-metadata) | | Warehouse metadata<br>`+Expand` |
| **sum** | int | `=` `!=` `<` `>` `<=` `>=` | Amount of the Internal order in rupees<br>`+Required when replying` `+Read only` |
| **syncId** | UUID | `=` `!=` | Synchronization ID. After filling it is not available for editing<br>`+Read-only` |
| **updated** | datetime | `=` `!=` `<` `>` `<=` `>=` | Time when Internal Order was last updated<br>`+Required when replying` `+Read Only` |
| **vatEnabled** | Boolean | | Is VAT taken into account<br>`+Required when answering` |
| **vatIncluded** | Boolean | | Is VAT included in the price |
| **vatSum** | float | | VAT amount<br>`+Required when replying` `+Read only` |

#### Internal order items

Items of the Internal order is a list of products, services, and product variants. The Internal Order item object contains the following fields:

| Title | Type | Description |
| ------- | ------- |---------- |
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Read Only`|
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of a product/service/series/modification, which is a item<br>`+Required when answering` `+Expand` |
| **id** | UUID | Item ID<br>`+Required when replying` `+Read Only` |
| **pack** | object | Product packaging. [More here](../dictionaries/#entities-towar-towary-atributy-wlozhennyh-suschnostej-upakowki-towara) |
| **price** | float | The price of the product/service in rupees<br>`+Required when answering` |
| **quantity** | int | The number of goods/services of this type in the item. If an item is a product with serial number accounting enabled, then the value in this field will always be equal to the number of serial numbers for this item in the document.<br>`+Required when replying` |
| **vat** | int | VAT applicable to the current item<br>`+Required when replying` |
| **vatEnabled** | Boolean | Whether VAT is included for the item. With this flag, you can set VAT = 0 or VAT = "excluding VAT" for an item. (vat = 0, vatEnabled = false) -> vat = "excluding VAT", (vat = 0, vatEnabled = true) -> vat = 0%.<br>`+Required when replying` |

Items can be managed using [special resources for managing Internal Order items](../documents/#transactions-internal-order-poluchit-vnutrennie-zakazy),
and as part of a separate Internal Order. When working as part of a separate Internal Order,
you can send requests to create a separate Internal Order with included in the request body
array of internal order items. 

If the number of items exceeds the maximum allowed, then for further replenishment of items, you will need to work with a special resource "Items of the Internal Order".
Also, when working as part of a separate Internal Order, you can send requests to update the list of items
with an array of Internal Order items included in the request body. 

It is important to remember that the collection of items will be perceived as "All items of the Internal Order" and will completely replace the existing collection when updating the object - superfluous
items will be deleted, new ones added, existing ones changed.

About working with Internal Order fields can be read [here](../#kladana-json-api-general-info-additional-fields).


### Get Internal Orders

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** | `string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Get Internal Orders

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/internalorder"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of Internal Orders.

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
   },"meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata",
     "type": "internalorder",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/31d58bde-b2fd-11e6-8a84-bae500000068",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata",
         "type": "internalorder",
         "mediaType": "application/json"
       },
       "id": "31d58bde-b2fd-11e6-8a84-bae500000068",
       "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
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
       "updated": "2016-11-25 13:52:01",
       "name": "00002",
       "description": "Comment",
       "externalCode": "00KNqzWbjDRhZ1A0411hS2",
       "moment": "2016-11-25 13:50:00",
       "applicable": true,
       "printed": true,
       "published": true,
       "rate": {
         "currency": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/currency/b942e6f2-9128-11e6-8a84-bae500000058",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         },
         "value": 1
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
       "project": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/project/6c6dd3f9-97a1-11e6-8a84-bae500000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
           "type": "project",
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
       "state": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata/states/f804ff3d-b2fc-11e6-8a84-bae500000065",
           "type": "state",
           "mediaType": "application/json"
         }
       },
       "positions": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/31d58bde-b2fd-11e6-8a84-bae500000068/positions",
           "type": "internalorderposition",
           "mediaType": "application/json",
           "size": 2,
           "limit": 1000,
           "offset": 0
         }
       },
       "vatEnabled": true,
       "vatIncluded": true,
       "vatSum": 0,
       "deliveryPlannedMoment": "2016-11-30 13:50:00"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/64e426af-b0d8-11e6-8a84-bae500000064",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata",
         "type": "internalorder",
         "mediaType": "application/json"
       },
       "id": "64e426af-b0d8-11e6-8a84-bae500000064",
       "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
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
       "updated": "2016-11-22 21:04:24",
       "name": "00001",
       "externalCode": "80QQopc4h8yBc0LnmTPpT3",
       "moment": "2016-11-22 20:23:00",
       "applicable": true,
       "printed": true,
       "published": true,
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
       "project": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/project/6c6dd3f9-97a1-11e6-8a84-bae500000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
           "type": "project",
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
       "positions": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/64e426af-b0d8-11e6-8a84-bae500000064/positions",
           "type": "internalorderposition",
           "mediaType": "application/json",
           "size": 5,
           "limit": 1000,
           "offset": 0
         }
       },
       "vatEnabled": true,
       "vatIncluded": true,
       "vatSum": 0,
       "moves": [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/move/a3b68a79-b0dc-11e6-8a84-bae5000000cd",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/move/metadata",
             "type": "move",
             "mediaType": "application/json"
           }
         }
       ]
     }
   ]
}
```

### Create Internal Order

Request to create a new Internal Order.
Mandatory fields to create:

+ **organization** - Link to your legal entity in the format [Metadata](../#kladana-json-api-general-info-metadata)

> An example of creating a new Internal Order.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/internalorder"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
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
            "name": "000222",
            "description": "My Comment",
            "externalCode": "00KNqzWbjDRhZ1A0411ss1231hS2",
            "moment": "2016-11-25 13:52:00",
            "applicable": true,
            "rate": {
                "currency": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/currency/b942e6f2-9128-11e6-8a84-bae500000058",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                        "type": "currency",
                        "mediaType": "application/json"
                    }
                },
                "value": 1
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
            "project": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/project/6c6dd3f9-97a1-11e6-8a84-bae500000002",
                    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
                    "type": "project",
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
            "state": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata/states/f804ff3d-b2fc-11e6-8a84-bae500000065",
                    "type": "state",
                    "mediaType": "application/json"
                }
            },
            "positions": [
                {
                    "quantity": 1,
                    "price": 0.0,
                    "discount": 0,
                    "vat": 0,
                    "assortment": {
                        "meta": {
                            "href": "https://app.kladana.in/api/remap/1.2/entity/variant/fc635ded-acf7-11e6-8a84-bae500000075",
                            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
                            "type": "variant",
                            "mediaType": "application/json"
                        }
                    }
                },
                {
                    "quantity": 1,
                    "price": 0.0,
                    "discount": 0,
                    "vat": 0,
                    "assortment": {
                        "meta": {
                            "href": "https://app.kladana.in/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
                            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                            "type": "product",
                            "mediaType": "application/json"
                        }
                    }
                }
            ],
            "vatEnabled": true,
            "vatIncluded": true,
            "vatSum": 0,
            "deliveryPlannedMoment": "2016-11-30 13:50:00"
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Internal Order.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/eb75f6b8-b2ff-11e6-8a84-bae500000000",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata",
     "type": "internalorder",
     "mediaType": "application/json"
   },
   "id": "eb75f6b8-b2ff-11e6-8a84-bae500000000",
   "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
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
   "updated": "2016-11-25 14:11:31",
   "name": "000222",
   "description": "My Comment",
   "externalCode": "00KNqzWbjDRhZ1A0411ss1231hS2",
   "moment": "2016-11-25 13:52:00",
   "applicable": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/b942e6f2-9128-11e6-8a84-bae500000058",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     },
     "value": 63.45
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
   "project": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/project/6c6dd3f9-97a1-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
       "type": "project",
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
   "state": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata/states/f804ff3d-b2fc-11e6-8a84-bae500000065",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "created": "2007-02-07 17:16:41",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/eb75f6b8-b2ff-11e6-8a84-bae500000000/positions",
       "type": "internalorderposition",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     }
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "vatSum": 0,
   "deliveryPlannedMoment": "2016-11-30 13:50:00"
}
```

### Internal Order Template

Request for an Internal Order template.

> An example of creating a new Internal Order.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/internalorder/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d''
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the pre-filled Internal Order template.

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
   "moment": "2016-11-25 14:59:18",
   "applicable": true,
   "printed": true,
   "published": true,
   "sum": 0,
   "store": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/b942743c-9128-11e6-8a84-bae500000053",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "project": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/project/6c6dd3f9-97a1-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
       "type": "project",
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
   "state": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata/states/f804ff3d-b2fc-11e6-8a84-bae500000065",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "positions": {
     "rows": []
   },
   "vatEnabled": true,
   "vatIncluded": true
}

```

### Bulk creation and updating of Internal Orders

[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Internal orders.
In the body of the request, you need to pass an array containing the JSON representation of the Internal Orders that you want to create or update.
Updated Internal Orders must contain the identifier in the form of metadata.

> Example of creating and updating multiple Internal Orders

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/internalorder/new"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
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
                "name": "000222",
                "description": "My Comment",
                "externalCode": "00KNqzWbjDRhZ1A0411ss1231hS2",
                "moment": "2016-11-25 13:52:00",
                "applicable": true,
                "rate": {
                    "currency": {
                        "meta": {
                            "href": "https://app.kladana.in/api/remap/1.2/entity/currency/b942e6f2-9128-11e6-8a84-bae500000058",
                            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                            "type": "currency",
                            "mediaType": "application/json"
                        }
                    },
                    "value": 1
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
                "project": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/project/6c6dd3f9-97a1-11e6-8a84-bae500000002",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
                        "type": "project",
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
                "state": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata/states/f804ff3d-b2fc-11e6-8a84-bae500000065",
                        "type": "state",
                        "mediaType": "application/json"
                    }
                },
                "positions": [
                    {
                        "quantity": 1,
                        "price": 0.0,
                        "discount": 0,
                        "vat": 0,
                        "assortment": {
                            "meta": {
                                "href": "https://app.kladana.in/api/remap/1.2/entity/variant/fc635ded-acf7-11e6-8a84-bae500000075",
                                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/variant/metadata",
                                "type": "variant",
                                "mediaType": "application/json"
                            }
                        }
                    },
                    {
                        "quantity": 1,
                        "price": 0.0,
                        "discount": 0,
                        "vat": 0,
                        "assortment": {
                            "meta": {
                                "href": "https://app.kladana.in/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
                                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                                "type": "product",
                                "mediaType": "application/json"
                            }
                        }
                    }
                ],
                "vatEnabled": true,
                "vatIncluded": true,
                "vatSum": 0,
                "deliveryPlannedMoment": "2016-11-30 13:50:00"
            },
            {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/64e426af-b0d8-11e6-8a84-bae500000064",
                    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata",
                    "type": "internalorder",
                    "mediaType": "application/json"
                },
                "owner": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/employee/b905bfb0-9128-11e6-8a84-bae50000002a",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
                        "type": "employee",
                        "mediaType": "application/json"
                    }
                },
                "shared": true,
                "group": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/group/b8ba0d3f-9128-11e6-8a84-bae500000002",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
                        "type": "group",
                        "mediaType": "application/json"
                    }
                },
                "name": "700222",
                "description": "My updated Comment",
                "externalCode": "00KNqzWbjDRhZ1A0411ss1231hS2",
                "moment": "2016-11-25 13:52:00",
                "applicable": true,
                "rate": {
                    "currency": {
                        "meta": {
                            "href": "https://app.kladana.in/api/remap/1.2/entity/currency/b942e6f2-9128-11e6-8a84-bae500000058",
                            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                            "type": "currency",
                            "mediaType": "application/json"
                        }
                    },
                    "value": 1
                },
                "store": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/store/b942743c-9128-11e6-8a84-bae500000053",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
                        "type": "store",
                        "mediaType": "application/json"
                    }
                },
                "project": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/project/6c6dd3f9-97a1-11e6-8a84-bae500000002",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
                        "type": "project",
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
                "state": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata/states/f804ff3d-b2fc-11e6-8a84-bae500000065",
                        "type": "state",
                        "mediaType": "application/json"
                    }
                },
                "positions": [
                    {
                        "quantity": 1,
                        "price": 2230.0,
                        "discount": 0,
                        "vat": 0,
                        "assortment": {
                            "meta": {
                                "href": "https://app.kladana.in/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
                                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                                "type": "product",
                                "mediaType": "application/json"
                            }
                        }
                    }
                ],
                "vatEnabled": true,
                "vatIncluded": true,
                "vatSum": 0,
                "deliveryPlannedMoment": "2016-12-30 13:52:00"
            }
        ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Internal Orders.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/eb75f6b8-b2ff-11e6-8a84-bae500000000",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata",
       "type": "internalorder",
       "mediaType": "application/json"
     },
     "id": "eb75f6b8-b2ff-11e6-8a84-bae500000000",
     "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
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
     "updated": "2016-11-25 14:11:31",
     "name": "000222",
     "description": "My Comment",
     "externalCode": "00KNqzWbjDRhZ1A0411ss1231hS2",
     "moment": "2016-11-25 13:52:00",
     "applicable": true,
     "rate": {
       "currency": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/b942e6f2-9128-11e6-8a84-bae500000058",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "value": 63.45
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
     "project": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/project/6c6dd3f9-97a1-11e6-8a84-bae500000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
         "type": "project",
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
     "state": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata/states/f804ff3d-b2fc-11e6-8a84-bae500000065",
         "type": "state",
         "mediaType": "application/json"
       }
     },
     "created": "2007-02-07 17:16:41",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/eb75f6b8-b2ff-11e6-8a84-bae500000000/positions",
         "type": "internalorderposition",
         "mediaType": "application/json",
         "size": 2,
         "limit": 1000,
         "offset": 0
       }
     },
     "vatEnabled": true,
     "vatIncluded": true,
     "vatSum": 0,
     "deliveryPlannedMoment": "2016-11-30 13:50:00"
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/64e426af-b0d8-11e6-8a84-bae500000064",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata",
       "type": "internalorder",
       "mediaType": "application/json"
     },
     "id": "64e426af-b0d8-11e6-8a84-bae500000064",
     "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/b905bfb0-9128-11e6-8a84-bae50000002a",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     "shared": true,
     "group": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/b8ba0d3f-9128-11e6-8a84-bae500000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2016-11-25 14:48:02",
     "name": "700222",
     "description": "My updated Comment",
     "externalCode": "00KNqzWbjDRhZ1A0411ss1231hS2",
     "moment": "2016-11-25 13:52:00",
     "applicable": true,
     "rate": {
       "currency": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/b942e6f2-9128-11e6-8a84-bae500000058",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "value": 63.45
     },
     "sum": 2230,
     "store": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/store/b942743c-9128-11e6-8a84-bae500000053",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
         "type": "store",
         "mediaType": "application/json"
       }
     },
     "project": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/project/6c6dd3f9-97a1-11e6-8a84-bae500000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
         "type": "project",
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
     "state": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata/states/f804ff3d-b2fc-11e6-8a84-bae500000065",
         "type": "state",
         "mediaType": "application/json"
       }
     },
     "created": "2007-02-07 17:16:41",
     "printed": true,
     "published": true,
     "positions": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/64e426af-b0d8-11e6-8a84-bae500000064/positions",
         "type": "internalorderposition",
         "mediaType": "application/json",
         "size": 1,
         "limit": 1000,
         "offset": 0
       }
     },
     "vatEnabled": true,
     "vatIncluded": true,
     "vatSum": 0,
     "deliveryPlannedMoment": "2016-12-30 13:52:00",
     "moves": [
       {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/move/a3b68a79-b0dc-11e6-8a84-bae5000000cd",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/move/metadata",
           "type": "move",
           "mediaType": "application/json"
         }
       }
     ]
   }
]
```

### Delete Internal order

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Internal order id. |
 
> Request to delete an Internal Order with the specified id.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/internalorder/7944ef04-f831-11e5-7a69-971500188b1"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of the Internal Order.

### Bulk deletion of Internal Orders

In the body of the request, you need to pass an array containing the JSON metadata of the Internal Orders that you want to remove.


> Bulk deletion request for Internal Orders.

```shell
  curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/internalorder/delete"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
     -d'[
            {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/7944ef04-f831-11e5-7a69-971500188b1",
                    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata",
                    "type": "internalorder",
                    "mediaType": "application/json"
                }
            },
            {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/7944ef04-f831-11e5-7a69-971500188b2",
                    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata",
                    "type": "internalorder",
                    "mediaType": "application/json"
                }
            }
        ]'
```

> Successful request. The result is JSON information about deleting Internal Orders.

```json
[
   {
     "info":"Entity 'internalorder' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'internalorder' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Internal orders metadata

Request for metadata of Internal Orders. The result is a JSON object including:

| Parameter | Description |
| ------- | ------- |
| **meta** | Link to internal orders metadata |
| **attributes** | Array of objects additional fields of Internal Orders in [Metadata](../#kladana-json-api-general-info-metadata) format |
| **states** | Array of statuses of Internal Orders |
| **createShared** | create new Internal Orders labeled "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Internal orders metadata

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Internal Orders metadata.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata/attributes/68d142e7-b300-11e6-8a84-bae50000008b",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "68d142e7-b300-11e6-8a84-bae50000008b",
       "name": "Additional field inside order",
       "type": "string",
       "required": false
     }
   ],
   "states": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata/states/f804ff3d-b2fc-11e6-8a84-bae500000065",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "f804ff3d-b2fc-11e6-8a84-bae500000065",
       "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
       "name": "OMG",
       "color": 10066329,
       "stateType": "Regular",
       "entityType": "internalorder"
     }
   ],
   "createShared": false
}
```

### Separate additional field

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id fields. |

 
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata/attributes/68d142e7-b300-11e6-8a84-bae50000008b",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "68d142e7-b300-11e6-8a84-bae50000008b",
   "name": "Additional field inside order",
   "type": "string",
   "required": false
}
```

### Internal order

### Get Internal order

**Parameters**

| Parameter | Description|
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Internal order id. |
 
> Request to receive a separate Internal Order with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/internalorder/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Internal Order.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/31d58bde-b2fd-11e6-8a84-bae500000068",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata",
     "type": "internalorder",
     "mediaType": "application/json"
   },
   "id": "31d58bde-b2fd-11e6-8a84-bae500000068",
   "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
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
   "updated": "2016-11-25 13:52:01",
   "name": "00002",
   "description": "Comment",
   "externalCode": "00KNqzWbjDRhZ1A0411hS2",
   "moment": "2016-11-25 13:50:00",
   "applicable": true,
   "printed": true,
   "published": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/b942e6f2-9128-11e6-8a84-bae500000058",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     },
     "value": 1
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
   "project": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/project/6c6dd3f9-97a1-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
       "type": "project",
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
   "state": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata/states/f804ff3d-b2fc-11e6-8a84-bae500000065",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "positions": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/31d58bde-b2fd-11e6-8a84-bae500000068/positions",
       "type": "internalorderposition",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     }
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "vatSum": 0,
   "deliveryPlannedMoment": "2016-11-30 13:50:00",
   "moves": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/move/3aa6f577-b2ff-11e6-8a84-bae500000070",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/move/metadata",
         "type": "move",
         "mediaType": "application/json"
       }
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/move/3fe38e12-b2ff-11e6-8a84-bae500000077",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/move/metadata",
         "type": "move",
         "mediaType": "application/json"
       }
     }
   ],
   "purchaseOrders": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchaseorder/4a29b74e-b2ff-11e6-8a84-bae500000084",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchaseorder/metadata",
         "type": "purchaseorder",
         "mediaType": "application/json"
       }
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/purchaseorder/45353c47-b2ff-11e6-8a84-bae50000007e",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/purchaseorder/metadata",
         "type": "purchaseorder",
         "mediaType": "application/json"
       }
     }
   ]
}
```

### Change Internal Order

Request to update an Internal Order with the specified id.

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Internal order id. |

> An example of a request to update a single Internal Order.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/internalorder/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
            "owner": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/employee/b905bfb0-9128-11e6-8a84-bae50000002a",
                    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
                    "type": "employee",
                    "mediaType": "application/json"
                }
            },
            "shared": true,
            "group": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/group/b8ba0d3f-9128-11e6-8a84-bae500000002",
                    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
                    "type": "group",
                    "mediaType": "application/json"
                }
            },
            "name": "700222",
            "description": "My updated Comment",
            "externalCode": "00KNqzWbjDRhZ1A0411ss1231hS2",
            "moment": "2016-11-25 13:52:00",
            "applicable": true,
            "rate": {
                "currency": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/currency/b942e6f2-9128-11e6-8a84-bae500000058",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                        "type": "currency",
                        "mediaType": "application/json"
                    }
                },
                "value": 1
            },
            "store": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/store/b942743c-9128-11e6-8a84-bae500000053",
                    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
                    "type": "store",
                    "mediaType": "application/json"
                }
            },
            "project": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/project/6c6dd3f9-97a1-11e6-8a84-bae500000002",
                    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
                    "type": "project",
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
            "state": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata/states/f804ff3d-b2fc-11e6-8a84-bae500000065",
                    "type": "state",
                    "mediaType": "application/json"
                }
            },
            "positions": [
                {
                    "quantity": 1,
                    "price": 2230.0,
                    "discount": 0,
                    "vat": 0,
                    "assortment": {
                        "meta": {
                            "href": "https://app.kladana.in/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
                            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                            "type": "product",
                            "mediaType": "application/json"
                        }
                    }
                }
            ],
            "vatEnabled": true,
            "vatIncluded": true,
            "vatSum": 0,
            "deliveryPlannedMoment": "2016-12-30 13:52:00"
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Internal Order.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/64e426af-b0d8-11e6-8a84-bae500000064",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata",
     "type": "internalorder",
     "mediaType": "application/json"
   },
   "id": "64e426af-b0d8-11e6-8a84-bae500000064",
   "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/b905bfb0-9128-11e6-8a84-bae50000002a",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/b8ba0d3f-9128-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-11-25 14:48:02",
   "name": "700222",
   "description": "My updated Comment",
   "externalCode": "00KNqzWbjDRhZ1A0411ss1231hS2",
   "moment": "2016-11-25 13:52:00",
   "applicable": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/b942e6f2-9128-11e6-8a84-bae500000058",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     },
     "value": 63.45
   },
   "sum": 2230,
   "store": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/store/b942743c-9128-11e6-8a84-bae500000053",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json"
     }
   },
   "project": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/project/6c6dd3f9-97a1-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/project/metadata",
       "type": "project",
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
   "state": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/metadata/states/f804ff3d-b2fc-11e6-8a84-bae500000065",
       "type": "state",
       "mediaType": "application/json"
     }
   },
   "created": "2007-02-07 17:16:41",
   "printed": true,
   "published": true,
   "positions": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/64e426af-b0d8-11e6-8a84-bae500000064/positions",
       "type": "internalorderposition",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   },
   "vatEnabled": true,
   "vatIncluded": true,
   "vatSum": 0,
   "deliveryPlannedMoment": "2016-12-30 13:52:00",
   "moves": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/move/a3b68a79-b0dc-11e6-8a84-bae5000000cd",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/move/metadata",
         "type": "move",
         "mediaType": "application/json"
       }
     }
   ]
}
```

### Internal Order Items

A separate resource for managing Internal Order items. With it, you can manage the items of a larger document, the number of lines in which exceeds 1000. You can read more about limits on the number of lines in a document and working with large documents [here](../#mojsklad-json-api-obschie-swedeniq- worka-s-poziciqmi-dokumentow).

### Get Internal Order Items

Request for a list of all items in this Internal Order.

| Title | Type | Description |
| ------- | ------- |--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Internal Order items. |

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Internal order id. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **search** | string` (optional) *Example: 0001* Filter documents by the specified search string. |

> Get internal order items

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/internalorder/7944ef04-f831-11e5-7a69-971500188b19/positions"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the item list of a single Internal Order.

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
     "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/7944ef04-f831-11e5-7a69-971500188b19/positions",
     "type": "internalorderposition",
     "mediaType": "application/json",
     "size": 1,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/7944ef04-f831-11e5-7a69-971500188b19/positions/05379d42-b305-11e6-8a84-bae500000008",
         "type": "internalorderposition",
         "mediaType": "application/json"
       },
       "id": "05379d42-b305-11e6-8a84-bae500000008",
       "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
       "quantity": 1,
       "price": 2230.0,
       "vat": 0,
       "vatEnabled": false,
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.in/app/#good/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
         }
       }
     }
   ]
}
```

### Create Internal Order Items

Request to create a new item in the Internal Order.
For successful creation, the following fields must be specified in the request body:

+ **assortment** - Link to the product/service/series/modification that the item represents.
You can also specify a field named **service**, **variant** according to
what the indicated item is. You can read more about this field in the description of the [Internal order item](../documents/#transactions-internal-order-vnutrennie-zakazy-pozicii-vnutrennego-zakaza)
+ **quantity** - Quantity of the specified item. Must be positive, otherwise an error will occur.
You can create one or more Internal Order items at the same time. All items created by this request
will be added to the existing ones.

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Internal order id. |

> An example of creating items in an internal order.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/internalorder/7944ef04-f831-11e5-7a69-971500188b19/positions"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
            {
                "quantity": 1,
                "price": 100.0,
                "vat": 10,
                "assortment": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                        "type": "product",
                        "mediaType": "application/json"
                    }
                }
            },
            {
                "quantity": 12,
                "price": 200.0,
                "vat": 18,
                "assortment": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                        "type": "product",
                        "mediaType": "application/json"
                    }
                }
            },
            {
                "quantity": 3,
                "price": 2230.0,
                "vat": 0,
                "assortment": {
                    "meta": {
                        "href": "https://app.kladana.in/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
                        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                        "type": "product",
                        "mediaType": "application/json"
                    }
                }
            }
        ]'
```

> Response 200(application/json)
Successful request. Result - JSON preSubmission of the created item of a separate Internal Order.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/7944ef04-f831-11e5-7a69-971500188b19/positions/705ff11b-b305-11e6-8a84-bae50000000c",
       "type": "internalorderposition",
       "mediaType": "application/json"
     },
     "id": "705ff11b-b305-11e6-8a84-bae50000000c",
     "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
     "quantity": 1,
     "price": 100.0,
     "vat": 10,
     "vatEnabled": true,
     "assortment": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#good/edit?id=3bb1af6c-2842-11e9-ac12-000c00000061"
       }
     }
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/7944ef04-f831-11e5-7a69-971500188b19/positions/705ffca0-b305-11e6-8a84-bae50000000d",
       "type": "internalorderposition",
       "mediaType": "application/json"
     },
     "id": "705ffca0-b305-11e6-8a84-bae50000000d",
     "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
     "quantity": 12,
     "price": 200.0,
     "vat": 18,
     "vatEnabled": true,
     "assortment": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#good/edit?id=e64d0a86-2a99-11e9-ac12-000c00000041"
       }
     }
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/7944ef04-f831-11e5-7a69-971500188b19/positions/706006cd-b305-11e6-8a84-bae50000000e",
       "type": "internalorderposition",
       "mediaType": "application/json"
     },
     "id": "706006cd-b305-11e6-8a84-bae50000000e",
     "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
     "quantity": 3,
     "price": 2230.0,
     "vat": 0,
     "vatEnabled": false,
     "assortment": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
       }
     }
   }
]

```

### Delete Internal Order Item

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Internal order item id. |

> Request to delete an Internal Order item with the specified id.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/internalorder/positions/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of an Internal Order item.

### Internal Order Items

### Get Internal Order Item

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Internal order id. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b20* Internal order item id. |

> Request to receive an Internal Order line item with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/internalorder/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of an Internal Order line item.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20",
     "type": "internalorderposition",
     "mediaType": "application/json"
   },
   "id": "7944ef04-f831-11e5-7a69-971500188b20",
   "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
   "quantity": 12,
   "price": 200.0,
   "vat": 18,
   "vatEnabled": true,
   "assortment": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
     }
   }
}
```

### Change Internal Order Item

Request to update an Internal Order line item.

**Parameters**

| Parameter | Description |
| ------- | ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Internal order id. |
| **positionID** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b20* Internal order item id. |

> An example of a request to update a line item in an Internal Order.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/internalorder/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
            "quantity": 2,
            "price": 500.0,
            "vat": 18,
            "assortment": {
                "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
                    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                    "type": "product",
                    "mediaType": "application/json"
                }
            }
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated order item.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/internalorder/7944ef04-f831-11e5-7a69-971500188b19/positions/7944ef04-f831-11e5-7a69-971500188b20",
     "type": "internalorderposition",
     "mediaType": "application/json"
   },
   "id": "7944ef04-f831-11e5-7a69-971500188b20",
   "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
   "quantity": 2,
   "price": 500.0,
   "vat": 18,
   "vatEnabled": true,
   "assortment": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/product/f4ac4460-acf7-11e6-8a84-bae500000068",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.in/app/#good/edit?id=3b1e1f15-2842-11e9-ac12-000c0000002f"
     }
   }
}
```
