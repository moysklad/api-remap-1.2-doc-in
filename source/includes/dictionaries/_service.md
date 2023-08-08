## Service
Using the JSON API, you can create and update information about the Services, request lists of Services and information on individual Services. The entity code for a Service in the JSON API is the **service** keyword. Service is a special kind of goods, without a purchase price and packaging. You can read more about Products and working with them in the main interface in our support service in the section [Products and Services](https://kladana.zendesk.com/hc/en-us/articles/4435291832465-Overview-of-Products-and-Services).

This entity can be contextually searched using the special `search` parameter. More details can be found at [link](../#kladana-json-api-general-info-context-search).

Search among service objects for matching the search string will be carried out in the following fields:

+ by Service name **name**
+ by Service code **code**

### Services
#### Entity attributes

| Title | Type | Filtration | Description |
| ----- | ------ | ------ | ------ |
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **archived** | Boolean | `=` `!=` | Has the Service been added to the archive<br>`+Required when replying` |
| **attributes** | Array(Object) | [Operators of additional fields](../#mojsklad-json-api-obschie-swedeniq-fil-traciq-wyborki-s-pomosch-u-parametra-filter-fil-traciq-po-dopolnitel-nym-polqm) | Collection of additional fields |
| **barcodes** | Array(Object) | `=` `!=` `~` `~=` `=~` | Kit barcodes. [More here](../dictionaries/#entities-usluga-uslugi-metadannye-uslug-shtrih-kody) |
| **buyprice** | object | | Purchasing sale. [More here](../dictionaries/#entities-usluga-uslugi-metadannye-uslug-zakupochnaq-cena) |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Service Code |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Description of the Service|
| **discountProhibited** | Boolean | | Sign of prohibition of discounts<br>`+Required when answering` |
| **effectiveVat** | int | | Real VAT %<br>`+Read only` |
| **effectiveVatEnabled** | Boolean | | Additional characteristic for determining delimitation of real VAT = 0 or "without VAT". (effectiveVat = 0, effectiveVatEnabled = false) -> "without VAT", (effectiveVat = 0, effectiveVatEnabled = true) -> 0%.<br>`+Read Only` |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | External Service Code<br>`+Required when replying` |
| **files** | MetaArray | | [Files] array metadata(../dictionaries/#entities-fajly) (Maximum number of files - 100)<br>`+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee department metadata<br>`+Required when replying` `+Expand` |
| **id** | UUID | `=` `!=` | Service ID<br>`+Required when replying` `+Read only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Metadata Services<br>`+Required when replying` |
| **minprice** | object | | Minimum price. [More here](../dictionaries/#entities-usluga-uslugi-metadannye-uslug-minimal-naq-cena) |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Name of the Service<br>`+Required when replying` `+Required when creating` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee) metadata<br>`+Expand`|
| **pathName** | string | `=` `!=` `~` `~=` `=~` | Name of the group that the Service belongs to<br>`+Required when replying` `+Read only` |
| **paymentItemType** | Enum | | Sign of the subject of calculation. [More details here](../dictionaries/#entities-usluga-uslugi-atributy-suschnosti-priznak-predmeta-rascheta) |
| **productFolder** | [Meta](../#kladana-json-api-general-info-metadata) | | Kit group metadata<br>`+Expand` |
| **saleprice** | Array(Object) | | Sale prices. [More here](../dictionaries/#entities-usluga-uslugi-metadannye-uslug-ceny-prodazhi) |
| **shared** | Boolean | `=` `!=` | Sharing<br>`+Required when replying` |
| **syncId** | UUID | `=` `!=` | Synchronization ID<br>`+Read-only` `+Fill on creation` |
| **taxSystem** | Enum | | Tax system code. [More here](../dictionaries/#entities-usluga-uslugi-atributy-suschnosti-kod-sistemy-nalogooblozheniq) |
| **wom** | [Meta](../#kladana-json-api-general-info-metadata) | | Units<br>`+Expand` |
| **updated** | datetime | `=` `!=` `<` `>` `<=` `>=` | When the entity was last updated<br>`+Required for response` `+Read-only` |
| **useParentVat** | Boolean | | Whether the VAT rate of the parent group is used. If true for the assortment unit, the rate set for the parent group will be applied.<br>`+Required when answering` |
| **vat** | int || VAT % |
| **vatEnabled** | Boolean | | Is VAT included for the service. With this flag, you can set VAT = 0 or VAT = "without VAT" for the service. (vat = 0, vatEnabled = false) -> vat = "excluding VAT", (vat = 0, vatEnabled = true) -> vat = 0%. |

The **pathName** attribute itself is a read-only attribute, but it can be changed
by updating the **productFolder** attribute.

##### Sign of the subject of calculation
Values of the paymentItemType field.

|Value | Description |
| ----- | ------ |
| **SERVICE** | Service |
| **WORK** | Work |
| **PROVIDING_RID** | Provision of RIA |
| **COMPOUND_PAYMENT_ITEM** | Composite subject of calculation |
| **ANOTHER_PAYMENT_ITEM** | Other subject of calculation |

##### Tax system code
The values of the taxSystem field.

| Value | Description |
| ----- | ------ |
| **GENERAL_TAX_SYSTEM** | DOS |
| **PATENT_BASED** | Patent |
| **PRESUMPTIVE_TAX_SYSTEM** | UTII |
| **SIMPLIFIED_TAX_SYSTEM_INCOME** | USN. Income |
| **SIMPLIFIED_TAX_SYSTEM_INCOME_OUTCOME** | USN. Income-Expense |
| **TAX_SYSTEM_SAME_AS_GROUP** | Same as group |
| **UNIFIED_AGRICULTURAL_TAX** | ESHN |

#### Nested entity attributes

#### Services Metadata
Services metadata contains information about additional fields.

View all addons created in the main interface. Service fields,
as well as all types of prices, you can use the [Products](../dictionaries/#entities-towar-metadannye-towarow) metadata request.

Structures of objects of individual collections:

##### Barcodes:
When creating a barcode, you need to describe an object with a field that is a lowercase barcode representation format with the string value of the barcode itself. The names of the fields of a separate object representing a barcode:

| Title | Description |
| ----- | ------ |
| **ean13** | barcode in EAN13 format if you want to generate an EAN13 barcode |
| **ean8** | barcode in EAN8 format if you want to generate an EAN8 barcode |
| **code128** | barcode in Code128 format, if you want to generate a barcode in Code128 format |

About working with Service fields can be read [here](../#kladana-json-api-general-info-additional-fields)

##### Sales prices

| Title | Type | Description |
| ----- | ------ |------ |
| **value** | float | Price value<br>`+Required when answering` |
| **currency** | [Meta](../#kladana-json-api-general-info-metadata) | Reference to the currency in the format [Metadata](../#kladana-json-api-general-info-metadata)<br>`+Required when replying` `+Expand` |
| **priceType** | object | Price type<br>`+Required when replying` |


##### Purchase price

| Title | Type | Description |
| ----- | ------ |------ |
| **value** | float | Price value<br>`+Required when replying` |
| **currency** | [Meta](../#kladana-json-api-general-info-metadata) | Reference to the currency in the format [Metadata](../#kladana-json-api-general-info-metadata)<br>`+Required when replying` `+Expand` |

##### Minimum price

| Title | Type | Description |
| ----- | ------ |------- |
| **value** | float | Price value<br>`+Required when answering` |
| **currency** | [Meta](../#kladana-json-api-general-info-metadata) | Reference to the currency in the format [Metadata](../#kladana-json-api-general-info-metadata)<br>`+Required when replying` `+Expand` |

##### Group Services

| Title | Type | Description |
| ----- | ------ |------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata containing a link to the Services group.<br>`+Required when replying` |
You can see the description of the Group entity [here](../dictionaries/#entities-gruppa-towarow).
Updating this attribute will also update the **pathName** attribute.

##### Features of filtering the archived field
If filtering by the **id** and **archived** fields is performed at the same time, then the filtering by the **archived** field is not taken into account.


### Get a list of Services
Request to receive all Services for this account.
Result: JSON object including fields:

| Title | Type | Description |
| ----- | ------ |------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing [Services](../dictionaries/#entities-usluga). |

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get a list of services

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/service"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Services.
  
```json
{
   context: {
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
     "href": "https://app.kladana.in/api/remap/1.2/entity/service/",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
     "type": "service",
     "mediaType": "application/json",
     size: 2
     limit: 1000
     offset: 0
   },
   rows: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/service/63e4fa87-2c87-11e6-8a84-bae500000030",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "service",
         "mediaType": "application/json"
       },
       "id": "63e4fa87-2c87-11e6-8a84-bae500000030",
       "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       shared: false
       group: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-06-07 11:11:08",
       "name": "Cover",
       "description": "Delivery cladding",
       "code": "additionalprot",
       "externalCode": "addProt",
       archived: false
       "pathName": "",
       vat: 6,
       "vatEnabled": true
       "useParentVat": false,
       "effectiveVat": 6,
       "effectiveVatEnabled": true,
       "discountProhibited": false,
       "minprice": {
        value: 500.0
         currency: {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "salePrices": [
         {
           "value": 1052.0
           currency: {
             "meta": {
               "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
               "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
               "type": "currency",
               "mediaType": "application/json"
             }
           },
           "priceType": {
             "meta": {
               "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
               "type": "pricetype",
               "mediaType": "application/json"
             },
             "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
             "name": "Sale price",
             "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
           }
         },
         {
           "value": 1020
           currency: {
             "meta": {
               "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
               "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
               "type": "currency",
               "mediaType": "application/json"
             }
           },
           "priceType": {
             "meta": {
               "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
               "type": "pricetype",
               "mediaType": "application/json"
             },
             "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
             "name": "Price for friends",
             "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
           }
         }
       ],
       "buyprice": {
         "value": 700.0
         currency: {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "barcodes": [
         {
           "ean13": "34875834765872435"
         },
         {
           "ean8": "234234234234"
         },
         {
           "code128": "23423423452351"
         }
       ],
       "attributes": [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/0c2e54cd-2c80-11e6-8a84-bae50000009c",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "0c2e54cd-2c80-11e6-8a84-bae50000009c",
           "name": "Export",
           "type": "boolean",
           "value": true
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/0c2e5dc5-2c80-11e6-8a84-bae50000009d",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "0c2e5dc5-2c80-11e6-8a84-bae50000009d",
           "name": "Manufacturer",
           "type": "counter party",
           "value": "OOO Company"
         }
       ],
       "taxSystem": "GENERAL_TAX_SYSTEM"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/service/f6ecdc65-2c86-11e6-8a84-bae500000027",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "service",
         "mediaType": "application/json"
       },
       "id": "f6ecdc65-2c86-11e6-8a84-bae500000027",
       "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       shared: false
       group: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2016-06-07 11:08:06",
       "name": "Delivery",
       "description": "Delivery of selected item",
       "code": "delivery",
       "externalCode": "delCode",
       archived: false
       "pathName": "",
       vat: 10
       "vatEnabled": true
       "useParentVat": false,
       "effectiveVat": 10,
       "effectiveVatEnabled": true,
       "minprice": {
        value: 500.0
         currency: {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "salePrices": [
         {
           "value": 10532.0,
           currency: {
             "meta": {
               "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
               "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
               "type": "currency",
               "mediaType": "application/json"
             }
           },
           "priceType": {
             "meta": {
               "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
               "type": "pricetype",
               "mediaType": "application/json"
             },
             "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
             "name": "Sale price",
             "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
           }
         },
         {
           value: 100
           currency: {
             "meta": {
               "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
               "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
               "type": "currency",
               "mediaType": "application/json"
             }
           },
           "priceType": {
             "meta": {
               "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
               "type": "pricetype",
               "mediaType": "application/json"
             },
             "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
             "name": "Price for friends",
             "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
           }
         }
       ],
       "buyprice": {
         "value": 700.0
         currency: {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "barcodes": [
         {
           "ean13": "34875834765872435"
         },
         {
           "ean8": "234234234234"
         },
         {
           "code128": "23423423452351"
         }
       ]
     }
   ]
}
```

### Create Service

Create a new Service.

#### Description
The service is created based on the passed JSON object,
which contains the representation of the new Service.
The result is a JSON representation of the created Service. To create a new Service,
it is necessary and sufficient to specify a non-empty `name` field in the passed object

When creating a Service with a specified array of barcodes, for each barcode, you must specify what type the barcode belongs to.
For example, to create a barcode of type Code 128, a JSON object with a code128 field with the value of the barcode must be added to the array of barcodes.

> An example of the most complete request in terms of the number of fields.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/service"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "Delivery",
             "code": "delivery",
             "externalCode": "delCode",
             "description": "Delivery of selected item",
             vat: 10
             "effectiveVat": 10,
             "discountProhibited": false,
             "minprice": {
              value: 500.0
               "currency": {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                   "type": "currency",
                   "mediaType": "application/json"
                 }
               }
             },
             "salePrices": [
               {
                 "value": 10532.0,
                 currency: {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                     "type": "currency",
                     "mediaType": "application/json"
                   }
                 },
                 "priceType": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
                     "type": "pricetype",
                     "mediaType": "application/json"
                   }
                 }
               },
               {
                 value: 100
                 currency: {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                     "type": "currency",
                     "mediaType": "application/json"
                   }
                 },
                 "priceType": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
                     "type": "pricetype",
                     "mediaType": "application/json"
                   }
                 }
               }
             ],
             "buyprice": {
               "value": 1047.0
               currency: {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                   "type": "currency",
                   "mediaType": "application/json"
                 }
               }
             },
             "barcodes": [
               {
                 "ean13": "34875834765872435"
               },
               {
                 "ean8": "234234234234"
               },
               {
                 "code128": "23423423452351"
               }
             ]
           }'
```

> Response 200(application/json)
   Successful request. The result is a JSON representation of the created Service.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/service/f6ecdc65-2c86-11e6-8a84-bae500000027",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
     "type": "service",
     "mediaType": "application/json"
   },
   "id": "f6ecdc65-2c86-11e6-8a84-bae500000027",
   "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   shared: false
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-06-07 11:08:06",
   "name": "Delivery",
   "description": "Delivery of selected item",
   "code": "delivery",
   "externalCode": "delCode",
   archived: false
   "pathName": "",
   vat: 10
   "vatEnabled": true
   "useParentVat": false,
   "effectiveVat": 10,
   "effectiveVatEnabled": true,
   "discountProhibited": false,
   "minprice": {
     value: 500.0
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "salePrices": [
     {
       "value": 10532.0,
       currency: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
         "name": "Sale price",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
       }
     },
     {
       value: 100
       currency: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
         "name": "Price for friends",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
       }
     }
   ],
   "buyprice": {
     "value": 1047.0
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "barcodes": [
     {
       "ean13": "34875834765872435"
     },
     {
       "ean8": "234234234234"
     },
     {
       "code128": "23423423452351"
     }
   ]
}
```
> An example of a request to create a Service with the only required field.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/service"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "Service for which we only came up with a name"
           }'
```

> Response 200(application/json)
   Successful request. The result is a JSON representation of the created Service.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/service/cce4dae4-2c87-11e6-8a84-bae500000037",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
     "type": "service",
     "mediaType": "application/json"
   },
   "id": "cce4dae4-2c87-11e6-8a84-bae500000037",
   "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   shared: false
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "salePrices": [
     {
       "value": 346347237000.0,
       currency: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/2b50da23-296b-11e6-8a84-bae500000055",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
         "name": "Sale price",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
       }
     },
     {
       value: 100
       currency: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/2b50da23-296b-11e6-8a84-bae500000055",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
         "name": "Price for friends",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
       }
     }
   ],
   "updated": "2016-06-07 11:14:05",
   "name": "Service for which we came up with only a name",
   "code": "pumpkin2",
   "externalCode": "5fZe-Qyji8mSwoHYs7kSA2",
   archived: false
   "pathName": "",
   "vatEnabled": false,
   "useParentVat": true,
}
```

> An example of a request to create a Service with additional fields.


```shell
   curl-X POST
     "https://app.kladana.in/api/remap/1.2/entity/service"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "Cover",
             "code": "additionalprot",
             "externalCode": "addProt",
             "description": "Delivery cladding",
             vat: 6,
             "effectiveVat": 5,
             "minprice": {
              value: 500.0
               currency: {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                   "type": "currency",
                   "mediaType": "application/json"
                 }
               }
             },
             "salePrices": [
               {
                 "value": 1052.0
                 currency: {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                     "type": "currency",
                     "mediaType": "application/json"
                   }
                 },
                 "priceType": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
                     "type": "pricetype",
                     "mediaType": "application/json"
                   }
                 }
               },
               {
                 "value": 1020
                 currency: {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                     "type": "currency",
                     "mediaType": "application/json"
                   }
                 },
                 "priceType": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
                     "type": "pricetype",
                     "mediaType": "application/json"
                   }
                 }
               }
             ],
             "buyprice": {
               "value": 700.0
               currency: {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
                   "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                   "type": "currency",
                   "mediaType": "application/json"
                 }
               }
             },
             "barcodes": [
               {
                 "ean13": "34875834765872435"
               },
               {
                 "ean8": "234234234234"
               },
               {
                 "code128": "23423423452351"
               }
             ],
             "attributes": [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/0c2e54cd-2c80-11e6-8a84-bae50000009c",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "name": "Export",
                 "value": true
               },
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/0c2e5dc5-2c80-11e6-8a84-bae50000009d",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "name": "Manufacturer",
                 "value": "OOO Company"
               }
             ]
           }'
```

> Response 200(application/json)
   Successful request. The result is a JSON representation of the created Service.
  

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/service/63e4fa87-2c87-11e6-8a84-bae500000030",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
     "type": "service",
     "mediaType": "application/json"
   },
   "id": "63e4fa87-2c87-11e6-8a84-bae500000030",
   "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   shared: false
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-06-07 11:11:08",
   "name": "Cover",
   "description": "Delivery cladding",
   "code": "additionalprot",
   "externalCode": "addProt",
   archived: false
   "pathName": "",
   vat: 6,
   "vatEnabled": true
   "useParentVat": false,
   "effectiveVat": 6,
   "effectiveVatEnabled": true,
   "discountProhibited": false,
   "minprice": {
     value: 500.0
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "salePrices": [
     {
       "value": 1052.0
       currency: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
         "name": "Sale price",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
       }
     },
     {
       "value": 1020
       currency: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
         "name": "Price for friends",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
       }
     }
   ],
   "buyprice": {
     "value": 700.0
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "barcodes": [
     {
       "ean13": "34875834765872435"
     },
     {
       "ean8": "234234234234"
     },
     {
       "code128": "23423423452351"
     }
   ],
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/0c2e54cd-2c80-11e6-8a84-bae50000009c",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "0c2e54cd-2c80-11e6-8a84-bae50000009c",
       "name": "Export",
       "type": "boolean",
       "value": true
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/0c2e5dc5-2c80-11e6-8a84-bae50000009d",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "0c2e5dc5-2c80-11e6-8a84-bae50000009d",
       "name": "Manufacturer",
       "type": "counter party",
       "value": "OOO Company"
     }
   ]
}
```

### Bulk creation and update of Services

[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Services.
In the body of the request, you need to pass an array containing the JSON representation of the Services that you want to create or update.
The updated Services must contain the identifier in the form of metadata.

> Example of creating and updating multiple Services

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/service"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "Service for which we only came up with a name"
             },
             {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/service/f6ecdc65-2c86-11e6-8a84-bae500000027",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                 "type": "service",
                 "mediaType": "application/json"
               },
               "name": "Product Delivery",
               "description": "Home delivery of the selected item",
               "externalCode": "deliveryCode",
               vat: 11
               "effectiveVat": 11,
               "minprice": {value: 500.0
                 currency: {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                     "type": "currency",
                     "mediaType": "application/json"
                   }
                 }
               },
               "salePrices": [
                 {
                   "value": 700.0
                   currency: {
                     "meta": {
                       "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                       "type": "currency",
                       "mediaType": "application/json"
                     }
                   },
                   "priceType": {
                     "meta": {
                       "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
                       "type": "pricetype",
                       "mediaType": "application/json"
                     }
                   }
                 },
                 {
                   value: 7000
                   currency: {
                     "meta": {
                       "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                       "type": "currency",
                       "mediaType": "application/json"
                     }
                   },
                   "priceType": {
                     "meta": {
                       "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
                       "type": "pricetype",
                       "mediaType": "application/json"
                     }
                   }
                 }
               ],
               "buyprice": {
                 "value": 700.0
                 currency: {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                     "type": "currency",
                     "mediaType": "application/json"
                   }
                 }
               },
               "barcodes": [
                 {
                   "ean13": "34875834765872435"
                 },
                 {
                   "ean8": "234234234234"
                 },
                 {
                   "code128": "23423423452351"
                 }
               ]
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the created and updated Services.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/service/cce4dae4-2c87-11e6-8a84-bae500000037",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
       "type": "service",
       "mediaType": "application/json"
     },
     "id": "cce4dae4-2c87-11e6-8a84-bae500000037",
     "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     shared: false
     group: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "salePrices": [
       {
         "value": 346347237000.0,
         currency: {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/currency/2b50da23-296b-11e6-8a84-bae500000055",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         },
         "priceType": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
             "type": "pricetype",
             "mediaType": "application/json"
           },
           "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
           "name": "Sale price",
           "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
         }
       },
       {34234"
       },
       {
         "code128": "23423423452351"
       }
     ]
   }
]
```

### Remove Service

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* service id. |

> Request to remove the Service with the specified id.

```shell
   curl -X DELETE
     "https://app.kladana.in/api/remap/1.2/entity/service/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
```
> Response 200(application/json)
Successful deletion of the Service.

### Bulk removal of Services

In the body of the request, you need to pass an array containing the JSON metadata of the Services you want to remove.


> Request to bulk remove Services.

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/service/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d'[
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/service/7944ef04-f831-11e5-7a69-971500188b1",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
             "type": "service",
             "mediaType": "application/json"
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/service/7944ef04-f831-11e5-7a69-971500188b2",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
             "type": "service",
             "mediaType": "application/json"
         }
       ]'
```

> Successful request. The result is JSON information about the deletion of the Services.

```json
[
   {
     "info":"Entity 'service' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 deleted successfully"
   },
   {
     "info":"Entity 'service' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 was deleted successfully"
   }
]
```

### Services Metadata

View all addons created in the main interface. Service fields,
as well as all types of prices, you can use the [Products](../dictionaries/#entities-towar-metadannye-towarow) metadata request.

### Service
 
A separate Service, which is accessed by its id value.

### Get Service

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* service id. |

> Request for receiving the Service with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/service/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Service.
    
```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/service/63e4fa87-2c87-11e6-8a84-bae500000030",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
     "type": "service",
     "mediaType": "application/json"
   },
   "id": "63e4fa87-2c87-11e6-8a84-bae500000030",
   "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   shared: false
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-06-07 11:11:08",
   "name": "Cover",
   "description": "Delivery cladding",
   "code": "additionalprot",
   "externalCode": "addProt",
   archived: false
   "pathName": "",
   vat: 6,
   "vatEnabled": true
   "useParentVat": false,
   "effectiveVat": 6,
   "effectiveVatEnabled": true,
   "discountProhibited": false,
   "minprice": {
     value: 500.0
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "salePrices": [
     {
       "value": 1052.0
       currency: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
"href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
         "name": "Sale price",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
       }
     },
     {
       "value": 1020
       currency: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
         "name": "Price for friends",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
       }
     }
   ],
   "buyprice": {
     "value": 700.0
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "barcodes": [
     {
       "ean13": "34875834765872435"
     },
     {
       "ean8": "234234234234"
     },
     {
       "code128": "23423423452351"
     }
   ],
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/0c2e54cd-2c80-11e6-8a84-bae50000009c",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "0c2e54cd-2c80-11e6-8a84-bae50000009c",
       "name": "Export",
       "type": "boolean",
       "value": true
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/0c2e5dc5-2c80-11e6-8a84-bae50000009d",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "0c2e5dc5-2c80-11e6-8a84-bae50000009d",
       "name": "Manufacturer",
       "type": "counterpaerty",
       "value": "OOO Company"
     }
   ]
}
```

### Change Service
Update an existing Service.
Price types in sales prices and additional fields are updated as elements of nested collections:

+ If in the current object some of the additional fields / price types no value,
and in the passed collection it is - the value is written to the additional field / price type.
+ If this attribute already has a value, it is overwritten with the one passed.
+ If this attribute has a value in the object, but it is missing
in the collection passed in the body of the request (not passed at all), then the value of the object attribute is not changed.

When updating a Service with a specified array of barcodes, for each barcode, you must specify what type the barcode belongs to.
For example, to create a barcode of type Code 128, a JSON object with a code128 field with the value of the barcode must be added to the array of barcodes.

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* service id. |

> Sample Service Update Request
  
   ```shell
     curl -X PUT
       "https://app.kladana.in/api/remap/1.2/entity/service/7944ef04-f831-11e5-7a69-971500188b19"
       -H "Authorization: Basic <Credentials>"
       -H "Content-Type: application/json"
         -d '{
               "name": "Product Delivery",
               "description": "Home delivery of the selected item",
               "externalCode": "deliveryCode",
               vat: 11
               "effectiveVat": 11,
               "minprice": {
                value: 500.0
                 currency: {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                     "type": "currency",
                     "mediaType": "application/json"
                   }
                 }
               },
               "salePrices": [
                 {
                   "value": 700.0
                   currency: {
                     "meta": {
                       "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                       "type": "currency","mediaType": "application/json"
                     }
                   },
                   "priceType": {
                     "meta": {
                       "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
                       "type": "pricetype",
                       "mediaType": "application/json"
                     }
                   }
                 },
                 {
                   value: 7000
                   currency: {
                     "meta": {
                       "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                       "type": "currency",
                       "mediaType": "application/json"
                     }
                   },
                   "priceType": {
                     "meta": {
                       "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
                       "type": "pricetype",
                       "mediaType": "application/json"
                     }
                   }
                 }
               ],
               "buyprice": {
                 "value": 700.0
                 currency: {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                     "type": "currency",
                     "mediaType": "application/json"
                   }
                 }
               },
               "barcodes": [
                 {
                   "ean13": "34875834765872435"
                 },
                 {
                   "ean8": "234234234234"
                 },
                 {
                   "code128": "23423423452351"
                 }
               ]
             }'
   ```

> Response 200(application/json)
   Successful request. The result is a JSON representation of the updated Service.
    
   ```json
  {
    "meta": {
      "href": "https://app.kladana.in/api/remap/1.2/entity/service/f6ecdc65-2c86-11e6-8a84-bae500000027",
      "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
      "type": "service",
      "mediaType": "application/json"
    },
    "id": "f6ecdc65-2c86-11e6-8a84-bae500000027",
    "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
    "owner": {
      "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json"
      }
    },
    shared: false
    group: {
      "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
        "type": "group",
        "mediaType": "application/json"
      }
    },
    "updated": "2016-06-07 11:20:40",
    "name": "Product Delivery",
    "description": "Home delivery of the selected item",
    "code": "delivery",
    "externalCode": "deliveryCode",
    archived: false
    "pathName": "",
    vat: 11
    "vatEnabled": true
    "useParentVat": false,
    "effectiveVat": 11,
    "effectiveVatEnabled": true,
    "discountProhibited": false,
    "minprice": {
      value: 500.0
      currency: {
        "meta": {
          "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
          "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
          "type": "currency",
          "mediaType": "application/json"
        }
      }
    },
    "salePrices": [
      {
        "value": 700.0
        currency: {
          "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json"
          }
        },
        "priceType": {
          "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
            "type": "pricetype",
            "mediaType": "application/json"
          },
          "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
          "name": "Sale price",
          "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
        }
      },
      {
        value: 7000
        currency: {
          "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json"
          }
        },
        "priceType": {
          "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
            "type": "pricetype",
            "mediaType": "application/json"
          },
          "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
          "name": "Price for friends",
          "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
        }
      }
    ],
    "buyprice": {
      "value": 700.0
      currency: {
        "meta": {
          "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
          "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
          "type": "currency",
          "mediaType": "application/json"
        }
      }
    },
    "barcodes": [
      {
        "ean13": "34875834765872435"
      },
      {
        "ean8": "234234234234"
      },
      {
        "code128": "23423423452351"
      }
    ]
  }
   ```

> Example of a request to change a Service with additional fields.
 
  ```shell
    curl -X PUT
      "https://app.kladana.in/api/remap/1.2/entity/service/7944ef04-f831-11e5-7a69-971500188b19"
      -H "Authorization: Basic <Credentials>"
      -H "Content-Type: application/json"
        -d '{
              "name": "Cargo lining",
              "description": "Delivery cladding",
              "code": "additional protection",
              "externalCode": "addProtection",
              "productFolder": {
                "meta": {
                  "href": "https://app.kladana.in/api/remap/1.2/entity/productfolder/238e806f-2c89-11e6-8a84-bae5000000a8",
                  "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/productfolder/metadata",
                  "type": "productfolder",
                  "mediaType": "application/json"
                }
              },
              vat: 6,
              "effectiveVat": 6,
              "minprice": {
               value: 500.0
                currency: {
                  "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
                    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                    "type": "currency",
                    "mediaType": "application/json"
                  }
                }
              },
              "salePrices": [
                {
                  "value": 778.0
                  currency: {
                    "meta": {
                      "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                      "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                      "type": "currency",
                      "mediaType": "application/json"
                    }
                  },
                  "priceType": {
                    "meta": {
                      "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
                      "type": "pricetype",
                      "mediaType": "application/json"
                    }
                  }
                },
                {
                  "value": 777
                  currency: {
                    "meta": {
                      "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                      "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                      "type": "currency",
                      "mediaType": "application/json"
                    }
                  },
                  "priceType": {
                    "meta": {
                      "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
                      "type": "pricetype",
                      "mediaType": "application/json"
                    }
                  }
                }
              ],
              "buyprice": {
                "value": 700.0
                currency: {
                  "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
                    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                    "type": "currency",
                    "mediaType": "application/json"
                  }
                }
              },
              "barcodes": [
                {
                  "ean13": "34875834765872435"
                },
                {
                  "ean8": "234234234234"
                },
                {
                  "code128": "23423423452351"
                }
              ],"attributes": [
                {
                  "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/0c2e54cd-2c80-11e6-8a84-bae50000009c",
                    "type": "attributemetadata",
                    "mediaType": "application/json"
                  },
                  "name": "Export",
                  "value": true
                },
                {
                  "meta": {
                    "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/0c2e5dc5-2c80-11e6-8a84-bae50000009d",
                    "type": "attributemetadata",
                    "mediaType": "application/json"
                  },
                  "name": "Manufacturer",
                  "value": "LLC Company Delivery Department"
                }
              ]
            }'
  ```
 
> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Service.

  ```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/service/63e4fa87-2c87-11e6-8a84-bae500000030",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
     "type": "service",
     "mediaType": "application/json"
   },
   "id": "63e4fa87-2c87-11e6-8a84-bae500000030",
   "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   shared: false
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-06-07 11:26:11",
   "name": "Cargo lining",
   "description": "Delivery cladding",
   "code": "additional protection",
   "externalCode": "addProtection",
   archived: false
   "pathName": "Company Services",
   vat: 6,
   "vatEnabled": true
   "useParentVat": false,
   "effectiveVat": 6,
   "effectiveVatEnabled": true,
   "productFolder": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/productfolder/238e806f-2c89-11e6-8a84-bae5000000a8",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/productfolder/metadata",
       "type": "productfolder",
       "mediaType": "application/json"
     }
   },
   "discountProhibited": false,
   "minprice": {
     value: 500.0
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "salePrices": [
     {
       "value": 778.0
       currency: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
         "name": "Sale price",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
       }
     },
     {
       "value": 777
       currency: {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
         "name": "Price for friends",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
       }
     }
   ],
   "buyprice": {
     "value": 700.0
     currency: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "barcodes": [
     {
       "ean13": "34875834765872435"
     },
     {
       "ean8": "234234234234"
     },
     {
       "code128": "23423423452351"
     }
   ],
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/0c2e54cd-2c80-11e6-8a84-bae50000009c",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "0c2e54cd-2c80-11e6-8a84-bae50000009c",
       "name": "Export",
       "type": "boolean",
       "value": true
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/0c2e5dc5-2c80-11e6-8a84-bae50000009d",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "0c2e5dc5-2c80-11e6-8a84-bae50000009d",
       "name": "Manufacturer",
       "type": "string",
       "value": "LLC Company Delivery Department"
     }
   ]
}
  ```
