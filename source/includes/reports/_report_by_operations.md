## Report on product range documents

You can request a report on documents using the JSON API. To work with the report, you need the rights to view products, as well as the rights to view balances.

There are three reports on documents:

* a report on documents displaying product stock;
* a report on documents displaying 'Committed' products;
* a report on documents displaying 'In transit' products.

The content of the report is affected by the visibility settings of documents available to the user who requested the report.

If the user does not have the `View cost price, purchase price, profit of goods` permission, the product cost and cost amount fields will not be displayed in the report on documents displaying balances.

In all reports, the filter by product range `assortment` is a mandatory filtering parameter. You can filter only by one product range: Product, Product variant, Batch.

Learn more about the [stock](https://support.kladana.com/hc/en-us/articles/360012272317-Stock-report). 

### Report with stock

The report is generated for a specific item and contains information about documents that form balances in which this item is used.

#### Report object attributes

| Name | Type | Description |
| ---------- | ----- | --------- |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Product, Product variant, or Batch metadata<br>`+Required in response` |
| **avgStockDays** | Float | Number of days in stock<br>`+Required in response` |
| **costPerUnit** | Float | Cost per unit |
| **moment** | DateTime | Document date<br>`+Required in response` |
| **operation** | [Meta](../#kladana-json-api-general-info-metadata) | Document metadata<br>`+Required in response` |
| **stock** | Float | Stock<br>`+Required in response` |
| **store** | [Meta](../#kladana-json-api-general-info-metadata) | Warehouese metadata<br>`+Required when responding` |
| **sumCost** | Float | Cost sum |

#### Attributes available for filtering

Report results can be filtered using the filter parameter.

| Name | Type | Filtering | Description |
| -------------| ------ | ---------- | --------- |
| **assortment** | Object | `=` | parameter for filtering by product category: Product, Product variant, Batch. The value corresponds to a link to the corresponding product category. You can only filter by one product category. |

Filtering examples:

- `filter=assortment=https://api.kladana.com/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044`
- `filter=assortment=https://api.kladana.com/api/remap/1.2/entity/consignment/656c4032-8552-11e6-8a84-bae500000044`
- `filter=assortment=https://api.kladana.com/api/remap/1.2/entity/variant/656c4032-8552-11e6-8a84-bae500000044`

#### Get Document Report displaying balances

**Parameters**

| Parameter | Description |
| ---------- | --------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to retrieve.`Allowed values ​​are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the returned list of entities. |

> Request for obtaining a Document Report displaying stock.

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/report/byoperations/stock?filter=assortment=https://api.kladana.com/api/remap/1.2/entity/product/bb1865dc-32e1-11ef-ac16-001100000003"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. Result - JSON representation of the report.

```json
{
    "context": {
        "employee": {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/context/employee",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                "type": "employee",
                "mediaType": "application/json"
            }
        }
    },
    "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/report/byoperations/stock?filter=assortment=https://api.kladana.com/api/remap/1.2/entity/product/bb1865dc-32e1-11ef-ac16-001100000003",
        "type": "byoperations",
        "mediaType": "application/json",
        "size": 1,
        "limit": 1000,
        "offset": 0
    },
    "rows": [
        {
            "assortment": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/product/bb1865dc-32e1-11ef-ac16-001100000003",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                    "type": "product",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#good/edit?id=bb175fd6-32e1-11ef-ac16-001100000001"
                }
            },
            "operation": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/supply/ff473101-3871-11ef-ac16-001100000039",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/supply/metadata",
                    "type": "supply",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#supply/edit?id=ff473101-3871-11ef-ac16-001100000039"
                }
            },
            "moment": "2024-07-02 15:52:00.000",
            "store": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/store/eca7b8c0-32e0-11ef-ac16-0011000000cb",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                    "type": "store",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#warehouse/edit?id=eca7b8c0-32e0-11ef-ac16-0011000000cb"
                }
            },
            "stock": 1.0,
            "costPerUnit": 0.0,
            "sumCost": 0.0,
            "avgStockDays": 9.72
        }
    ]
}
```

### Reserves report
The report is generated for a specific item and contains information about transactions that form reserves in which this item is used.

#### Report object attributes:

| Name | Type | Description |
| ---------- | ----- | -------- |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Product, Product variant, or Batch metadata<br>`+Required when replying` |
| **moment** | DateTime | Document date<br>`+Required when replying` |
| **operation** | [Meta](../#kladana-json-api-general-info-metadata) | Document metadata<br>`+Required when replying` |
| **reserve** | Float | 'Commited' products<br>`+Required when replying` |
| **store** | [Meta](../#kladana-json-api-general-info-metadata) | Warehouse metadata |

#### Attributes available for filtering

Report results can be filtered using the filter parameter.

| Name | Type | Filtering | Description |
| -----| ---- | --------- | ----------- |
| **assortment** | Object | `=` | parameter for filtering by product category: Product, Product variant, Batch. The value corresponds to the link to the corresponding product category. You can filter only by one product category. |

Filtering examples:

- `filter=assortment=https://api.kladana.com/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044`
- `filter=assortment=https://api.kladana.com/api/remap/1.2/entity/consignment/656c4032-8552-11e6-8a84-bae500000044`
- `filter=assortment=https://api.kladana.com/api/remap/1.2/entity/variant/656c4032-8552-11e6-8a84-bae500000044`

#### Get a Document Report displaying reserves

**Parameters**

| Parameter | Description |
| --------- | ----------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to retrieve.`Valid values ​​are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indentation in the returned list of entities. |

> Request to get a Document Report displaying 'Committed' products.

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/report/byoperations/reserve?filter=assortment=https://api.kladana.com/api/remap/1.2/entity/product/bb1865dc-32e1-11ef-ac16-001100000003"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. Result - JSON representation of the report.

```json
{
    "context": {
        "employee": {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/context/employee",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                "type": "employee",
                "mediaType": "application/json"
            }
        }
    },
    "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/report/byoperations/reserve?filter=assortment=https://api.kladana.com/api/remap/1.2/entity/product/bb1865dc-32e1-11ef-ac16-001100000003",
        "type": "byoperations",
        "mediaType": "application/json",
        "size": 1,
        "limit": 1000,
        "offset": 0
    },
    "rows": [
        {
            "assortment": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/product/bb1865dc-32e1-11ef-ac16-001100000003",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                    "type": "product",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#good/edit?id=bb175fd6-32e1-11ef-ac16-001100000001"
                }
            },
            "operation": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/customerorder/59826b4c-3879-11ef-ac16-000f00000032",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/customerorder/metadata",
                    "type": "customerorder",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#customerorder/edit?id=59826b4c-3879-11ef-ac16-000f00000032"
                }
            },
            "moment": "2024-07-02 16:45:00.000",
            "store": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/store/eca7b8c0-32e0-11ef-ac16-0011000000cb",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                    "type": "store",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#warehouse/edit?id=eca7b8c0-32e0-11ef-ac16-0011000000cb"
                }
            },
            "reserve": 5.0
        }
    ]
}
```
### Report with Waiting
The report is generated for a specific product and contains information about documents that form waiting periods in which this product is used.

#### Report object attributes:

| Name | Type | Description |
| --------- | ----- | -------- |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Product, Product variant, or Batch metadata<br>`+Required when responding` |
| **inTransit** | Float | 'In transit' products<br>`+Required when responding` |
| **moment** | DateTime | Document date<br>`+Required when responding` |
| **operation** | [Meta](../#kladana-json-api-general-info-metadata) | Document metadata<br>`+Required in response` |
| **store** | [Meta](../#kladana-json-api-general-info-metadata) | Warehouse metadata |

#### Attributes available for filtering

The report results can be filtered using the filter parameter.

| Name | Type | Filtering | Description |
|--------------------| --------- | --------- | ---------- |
| **assortment** | Object | `=` | parameter for filtering by product category: Product, Product variant, Batch. The value corresponds to a link to the corresponding product category. You can only filter by one product category. |

Filtering examples:

- `filter=assortment=https://api.kladana.com/api/remap/1.2/entity/product/656c4032-8552-11e6-8a84-bae500000044`
- `filter=assortment=https://api.kladana.com/api/remap/1.2/entity/consignment/656c4032-8552-11e6-8a84-bae500000044`
- `filter=assortment=https://api.kladana.com/api/remap/1.2/entity/variant/656c4032-8552-11e6-8a84-bae500000044`

#### Get a Document Report displaying pending

**Parameters**

| Parameter | Description |
| --------- | --------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to retrieve.`Possible values ​​are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the returned list of entities. |

> Request to receive a Document Report showing pending.

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/report/byoperations/intransit?filter=assortment=https://api.kladana.com/api/remap/1.2/entity/product/bb1865dc-32e1-11ef-ac16-001100000003"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. Result - JSON representation of the report.

```json
{
  "context": {
    "employee": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/context/employee",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json"
      }
    }
  },
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/report/byoperations/intransit?filter=assortment=https://api.kladana.com/api/remap/1.2/entity/product/bb1865dc-32e1-11ef-ac16-001100000003",
    "type": "byoperations",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "assortment": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/bb1865dc-32e1-11ef-ac16-001100000003",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#good/edit?id=bb175fd6-32e1-11ef-ac16-001100000001"
        }
      },
      "operation": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/dba8c216-401c-11ef-ac16-00110000002b",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/purchaseorder/metadata",
          "type": "purchaseorder",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#purchaseorder/edit?id=dba8c216-401c-11ef-ac16-00110000002b"
        }
      },
      "moment": "2024-07-12 10:03:00.000",
      "store": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/store/eca7b8c0-32e0-11ef-ac16-0011000000cb",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
          "type": "store",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#warehouse/edit?id=eca7b8c0-32e0-11ef-ac16-0011000000cb"
        }
      },
      "inTransit": 5.0
    }
  ]
}
```