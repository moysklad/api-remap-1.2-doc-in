## Autocomplete

Using the JSON API, you can calculate the value of discounts, prices, and taxes for the items in the following transactions:

- [Stock Adjustment](../documents/#transactions-stock-adjustment)
- [Sales Order](../documents/#transactions-sales-order)
- [Purchase Order](../documents/#transactions-purchase-order)
- [Sales Invoice](../documents/#transactions-sales-invoice)
- [Supplier Invoice](../documents/#transactions-supplier-invoice)
- [Shipment](../documents/#transactions-shipment)
- [Receiving](../documents/#transactions-receiving)
- [Write-off](../documents/#transactions-write-off)
- [Transfer](../documents/#transactions-transfer)
- [Sales Return](../documents/#transactions-sales-return)
- [Purchase Returns](../documents/#transactions-purchase-returns)
- [Inventory Count](../documents/#transactions-inventory-count)
- [Internal Order](../documents/#transactions-internal-order)

Discount autocomplete is not available in the following transactions:

- [Inventory Count](../documents/#transactions-inventory-count)
- [Transfer](../documents/#transactions-transfer)
- [Internal Order](../documents/#transactions-internal-order)
- [Stock Adjustment](../documents/#transactions-stock-adjustment)
- [Write-off](../documents/#transactions-write-off)

Pricing is not available in [Inventory Count](../documents/#transactions-inventory-count).

Cost price autocomplete is only available for Returns without Reason in [Sales Return](../documents/#transactions-sales-return). 

### Autocomplete template

#### Entity attributes

Entity attributes need to be passed depending on the type of document that will be autocompleted. IN
matches the type, the corresponding fields will be processed.

Below are the fields that affect the filling of discounts, prices, taxes, cost.

+ **organization** - Link to a legal entity in the [Metadata](../#kladana-json-api-general-info-metadata) format. Required with the value `evaluate_vat` of the `action` parameter
+ **agent** - Link to the counterparty in the [Metadata](../#kladana-json-api-general-info-metadata) format.
Required with `evaluate_price`, `evaluate_discount` values of `action` parameter
+ **vatEnabled** - Whether tax is taken into account
+ **vatIncluded** - Is tax included in the price
+ **rate** - Currency. If not transferred, filled in with accounting currency
+ **store** - Link to the warehouse in the format [Metadata](../#kladana-json-api-general-info-metadata). Required with the `evaluate_cost` value of the `action` parameter
+ **moment** - Date of the document. Influences cost calculation
+ **positions** - transaction items

At the same time, if in addition to the above fields, others were added that do not affect the filling, then they will be present in
answer in the same order and with the same values.

**Notes**

`action` parameter values can be passed separated by commas.

If the document does not use the `agent` field, then to calculate prices `evaluate_price` and discounts `evaluate_discount`
the value of the `organization` field is used.

#### Transaction Items

Items in the template are a list of products, services, product variants, and bundles. The item object contains the following fields:

+ **quantity** - Quantity of goods/services of this type in the item. If the item is a product that has accounting by serial numbers enabled, then the value in this field will always be equal to the number of serial numbers for this item in the document.
+ **price** - The price of the product/service in rupees.
+ **discount** - Discount or markup percentage.
+ **vat** - tax applied to the current item.
+ **vatEnabled** - whether tax is enabled for the current item. With this flag, you can set tax = 0 or tax = "no taxes" for a item. (vat = 0, vatEnabled = false) -> vat = "excluding tax", (vat = 0, vatEnabled = true) -> vat = 0%.
+ **assortment** - Link to the product/service/series/modification/kit that the item represents, in the [Metadata](../#kladana-json-api-general-info-metadata) format.
+ **discountedPrice** - The price of the product/service, including discounts and taxes, in rupees.
+ **sum** - The total amount including the discount for the specified quantity of goods in the item in rupees. Calculated when passing the **quantity** field.

### Autocomplete request

Request to fill in the template fields.
Result: A JSON object, with the template filled in.

**Parameters**

| Parameter | Description |
| --------- | ---------- |
| action | `enum` (optional) *Example: evaluate_discount, evaluate_price, evaluate_discount* Defines what information to fill in: prices (evaluate_price), taxes (evaluate_vat), discounts (evaluate_discount) or cost (evaluate_cost). `Allowed values: evaluate_price, evaluate_discount, evaluate_vat, evaluate_cost`. |

### Price Autocomplete Request

Autocomplete request with `action` parameter with value `evaluate_price`. The **agent** field is required (or **organization** if there is no **agent** field).

Fills in the product price field **price** (if not explicitly specified) with the price of the counterparty specified in the **agent** field, as well as the **discountedPrice** field, taking into account thecalculated or transferred discount **discount** (taken as 0 if the value is missing) and tax **vat** (not taken into account, if empty, the field **vatEnabled** is `false` or **vatIncluded** is `true`). If the **quantity** field is passed, then the **sum** field will be calculated. The calculation uses the passed `rate`.

> Request to autocomplete prices

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/wizard/demand?action=evaluate_price"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'{
            "agent": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/eff93a94-c03a-11ea-c0a8-f00c0000001f",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                    "type": "counterparty",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#company/edit?id=eff93a94-c03a-11ea-c0a8-f00c0000001f"
                }
            },
            "positions": [
                {
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/46628fb5-c1c8-11ea-c0a8-f00c0000001a",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                            "type": "product",
                            "mediaType": "application/json",
                            "uuidHref": "https://app.kladana.com/app/#good/edit?id=46628fb5-c1c8-11ea-c0a8-f00c00000018"
                        }
                    },
                    "quantity": 12
                },
                {
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/bb989405-bf9e-11ea-c0a8-f0100000000e",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                            "type": "product",
                            "mediaType": "application/json",
                            "uuidHref": "https://app.kladana.com/app/#good/edit?id=bb96904c-bf9e-11ea-c0a8-f0100000000c"
                        }
                    },
                    "discount": 20
                }
            ]
        }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the completed document template.

```json
{
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/eff93a94-c03a-11ea-c0a8-f00c0000001f",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#company/edit?id=eff93a94-c03a-11ea-c0a8-f00c0000001f"
     }
   },
   "positions": [
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/46628fb5-c1c8-11ea-c0a8-f00c0000001a",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=46628fb5-c1c8-11ea-c0a8-f00c00000018"
         }
       },
       "price": 3300.0,
       "discountedPrice": 3300.0,
       "quantity": 12.0,
       "sum": 39600.0
     },
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/bb989405-bf9e-11ea-c0a8-f0100000000e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=bb96904c-bf9e-11ea-c0a8-f0100000000c"
         }
       },
       "price": 3300.0,
       "discountedPrice": 2640.0,
       "discount": 20.0
     }
   ]
}
```

### Request to autocomplete discounts

Autocomplete request with `action` parameter with value `evaluate_discount`. The **agent** field is required (or **organization** if there is no **agent** field).
Fills in the discount field **discount** (if not explicitly provided) with the amount of active discounts applicable to this product
the counterparty passed in the **agent** field.

> Request to autocomplete discounts

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/wizard/demand?action=evaluate_discount"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'{
            "agent": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/eff93a94-c03a-11ea-c0a8-f00c0000001f",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                    "type": "counterparty",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#company/edit?id=eff93a94-c03a-11ea-c0a8-f00c0000001f"
                }
            },
            "positions": [
                {
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/46628fb5-c1c8-11ea-c0a8-f00c0000001a",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                            "type": "product",
                            "mediaType": "application/json",
                            "uuidHref": "https://app.kladana.com/app/#good/edit?id=46628fb5-c1c8-11ea-c0a8-f00c00000018"
                        }
                    },
                    "quantity": 12
                },
                {
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/bb989405-bf9e-11ea-c0a8-f0100000000e",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                            "type": "product",
                            "mediaType": "application/json",
                            "uuidHref": "https://app.kladana.com/app/#good/edit?id=bb96904c-bf9e-11ea-c0a8-f0100000000c"
                        }
                    }
                }
            ]
        }'
```

> Response 200(application/json)
> Successful request. The result is a JSON representation of the completed document template.

```json
{
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/eff93a94-c03a-11ea-c0a8-f00c0000001f",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#company/edit?id=eff93a94-c03a-11ea-c0a8-f00c0000001f"
     }
   },
   "positions": [
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/46628fb5-c1c8-11ea-c0a8-f00c0000001a",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=46628fb5-c1c8-11ea-c0a8-f00c00000018"
         }
       },
       "quantity": 12.0,
       "discount": 65.0
     },
     {
       "discount": 40.0,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/bb989405-bf9e-11ea-c0a8-f0100000000e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=bb96904c-bf9e-11ea-c0a8-f0100000000c"
         }
       }
     }
   ]
}
```

### Tax autocomplete request

Autocomplete request with `action` parameter with value `evaluate_vat`. The **organization** field is required.
Populates the **vatEnabled** field based on whether the organization passed in the **organization** field is a payer
taxes and **vat** fields for items with the value from the product card, if the organization is a tax payer.

> Tax autocomplete request

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/wizard/demand?action=evaluate_vat"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'{
            "organization": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/organization/44055d92-bf76-11ea-c0a8-f01000000070",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
                    "type": "organization",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=44055d92-bf76-11ea-c0a8-f01000000070"
                }
            },
            "vatEnabled": "true",
            "rate": {
                "currency": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/44126ea6-bf76-11ea-c0a8-f01000000077",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                        "type": "currency",
                        "mediaType": "application/json",
                        "uuidHref": "https://app.kladana.com/app/#currency/edit?id=44126ea6-bf76-11ea-c0a8-f01000000077"
                    }
                }
            },
            "positions": [
                {
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/46628fb5-c1c8-11ea-c0a8-f00c0000001a",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                            "type": "product",
                            "mediaType": "application/json",
                            "uuidHref": "https://app.kladana.com/app/#good/edit?id=466222d6-c1c8-11ea-c0a8-f00c00000018"
                        }
                    },
                    "quantity": 12
                },
                {
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/bb989405-bf9e-11ea-c0a8-f0100000000e",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                            "type": "product",
                            "mediaType": "application/json",
                            "uuidHref": "https://app.kladana.com/app/#good/edit?id=bb96904c-bf9e-11ea-c0a8-f0100000000c"
                        }
                    }
                }
            ]
        }'
```

> Response 200(application/json)
> Successful request. Result - JSON representationEditing a completed document template.

```json
{
   "organization": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/organization/44055d92-bf76-11ea-c0a8-f01000000070",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/organization/metadata",
       "type": "organization",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#mycompany/edit?id=44055d92-bf76-11ea-c0a8-f01000000070"
     }
   },
   "vatEnabled": true,
   "rate": {
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/44126ea6-bf76-11ea-c0a8-f01000000077",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#currency/edit?id=44126ea6-bf76-11ea-c0a8-f01000000077"
       }
     }
   },
   "positions": [
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/46628fb5-c1c8-11ea-c0a8-f00c0000001a",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=466222d6-c1c8-11ea-c0a8-f00c00000018"
         }
       },
       "quantity": 12.0,
       "vat": 10,
       "vatEnabled": true
     },
     {
       "vat": 18,
       "vatEnabled": true,
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/bb989405-bf9e-11ea-c0a8-f0100000000e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=bb96904c-bf9e-11ea-c0a8-f0100000000c"
         }
       }
     }
   ]
}
```


### Request to autocomplete of cost price

Autocomplete request with `action` parameter with value `evaluate_cost`. Valid only for Buyer Returns and Retail Returns *no reason*. The **store** field is required.
Fills in the **cost** fields of items with the cost value calculated according to FIFO at the moment **moment**. If the **moment** field is not specified, then the cost price is calculated for the current date.

> Autocomplete cost request

```shell
   curl -X POST
   "https://api.kladana.com/api/remap/1.2/wizard/salesreturn?action=evaluate_cost"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
     -d'{
            "store": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/store/16a3019e-1204-11eb-c0a8-300c00000072",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                    "type": "store",
                    "mediaType": "application/json",
                    "uuidHref": "https://app.kladana.com/app/#warehouse/edit?id=16a3019e-1204-11eb-c0a8-300c00000072"
                }
            },
            "moment": "2020-10-20 17:45:00.000",
            "positions": [
                {
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/46628fb5-c1c8-11ea-c0a8-f00c0000001a",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                            "type": "product",
                            "mediaType": "application/json",
                            "uuidHref": "https://app.kladana.com/app/#good/edit?id=466222d6-c1c8-11ea-c0a8-f00c00000018"
                        }
                    }
                },
                {
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/bb989405-bf9e-11ea-c0a8-f0100000000e",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                            "type": "product",
                            "mediaType": "application/json",
                            "uuidHref": "https://app.kladana.com/app/#good/edit?id=bb96904c-bf9e-11ea-c0a8-f0100000000c"
                        }
                    }
                }
            ]
        }'
```

> Response 200(application/json)
> Successful request. The result is a JSON representation of the completed document template.

```json
{
   "store": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/store/16a3019e-1204-11eb-c0a8-300c00000072",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
       "type": "store",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#warehouse/edit?id=16a3019e-1204-11eb-c0a8-300c00000072"
     }
   },
   "moment": "2020-10-20 17:45:00.000",
   "positions": [
     {
       "assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/46628fb5-c1c8-11ea-c0a8-f00c0000001a",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=466222d6-c1c8-11ea-c0a8-f00c00000018"
         }
       },
     "cost": 1200.0
     },
     {"assortment": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/bb989405-bf9e-11ea-c0a8-f0100000000e",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json",
           "uuidHref": "https://app.kladana.com/app/#good/edit?id=bb96904c-bf9e-11ea-c0a8-f0100000000c"
         }
       },
       "cost": 3500.0
     }
   ]
}
```

