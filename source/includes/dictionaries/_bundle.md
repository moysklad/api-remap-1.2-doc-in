## Bundle
### Bundles

Using the JSON API, you can create and update information about Bundles, request a list of Bundles, and information on individual Bundles. The entity code for Bundles in the JSON API is the **bundle** keyword.

#### Entity attributes

| Title | Type | Filtration | Description |
| ----------| -------| ------ | --------- |
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **archived** | Boolean | `=` `!=` | Has the Bundle been added to the archive<br>`+Required when replying` |
| **article** | String(255) | `=` `!=` `~` `~=` `=~` | Article |
| **attributes** | Array(Object) | [Operators of additional fields](../#mojsklad-json-api-obschie-swedeniq-fil-traciq-wyborki-s-pomosch-u-parametra-filter-fil-traciq-po-dopolnitel-nym-polqm) | Collection of additional fields |
| **barcodes** | Array(Object) | `=` `!=` `~` `~=` `=~` | Bundles Barcodes [Learn more](../dictionaries/#entities-komplekt-komplekty-komponenty-komplekta-shtrih-kody) |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Bundle Code |
| **components** | MetaArray | | Array of components of Bundle<br>`+Expand` |
| **country** | [Meta](../#kladana-json-api-general-info-metadata) | | Country Metadata<br>`+Expand` |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Bundle Description |
| **discountProhibited** | Boolean | | Sign of prohibition of discounts<br>`+Required when answering` |
| **effectiveVat** | Int | | Real VAT %<br>`+Read Only`|
| **effectiveVatEnabled** | Boolean | | Additional characteristic for determining delimitation of real VAT = 0 or "without VAT". (effectiveVat = 0, effectiveVatEnabled = false) -> "without VAT", (effectiveVat = 0, effectiveVatEnabled = true) -> 0%.<br>`+Read Only` |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | External Bundle Code<br>`+Required when replying` |
| **files** | MetaArray | | [Files] array metadata(../dictionaries/#entities-fajly) (Maximum number of files - 100)<br>`+Expand` |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee department metadata<br>`+Required when replying` `+Expand` |
| **id** | UUID | `=` `!=` | Bundle ID<br>`+Required for response` `+Read only` |
| **images** | MetaArray | | [Images] metadata array(../dictionaries/#entities-izobrazhenie) (Maximum number of images - 10)<br>`+Expand` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Bundle Metadata<br>`+Required when replying` |
| **minprice** | Object | | Minimum price. [More here](../dictionaries/#entities-komplekt-komplekty-atributy-wlozhennyh-suschnostej-minimal-naq-cena) |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Bundle Name<br>`+Required when responding` `+Required when creating` |
| **overhead** | Object | | Additional expenses. [More here](../dictionaries/#entities-komplekt-komplekty-atributy-wlozhennyh-suschnostej-dopolnitel-nye-rashody) |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee) metadata<br>`+Expand`|
| **partialDisposal** | Boolean | | Management of the state of partial disposal of marked goods. "true" - the feature is enabled. |
| **pathName** | String | `=` `!=` `~` `~=` `=~` | The name of the group the Bundle belongs to<br>`+Required when replying` `+Read-only` |
| **paymentItemType** | Enum | | Sign of the subject of calculation. [More here](../dictionaries/#entities-komplekt-komplekty-atributy-suschnosti-priznak-predmeta-rascheta) |
| **productFolder** | [Meta](../#kladana-json-api-general-info-metadata) | | Group metadata of Bundles<br>`+Expand` |
| **salePrice** | Array(Object) | | Sale prices |
| **shared** | Boolean | `=` `!=` | Sharing<br>`+Required when replying` |
| **syncId** | UUID | `=` `!=` | Synchronization ID<br>`+Read-only` `+Fill on creation` |
| **taxSystem** | Enum | | Tax system code. [More here](../dictionaries/#entities-komplekt-komplekty-atributy-suschnosti-kod-sistemy-nalogooblozheniq) |
| **tnved** | String(255) | | TN VED code |
| **trackingType** | Enum | | Type of labeled product. [More here](../dictionaries/#entities-komplekt-komplekty-atributy-suschnosti-tip-markiruemoj-produkcii) |
| **uom* | [Meta](../#kladana-json-api-general-info-metadata) || Units<br>`+Expand` |
| **updated** | DateTime | `=` `!=` `<` `>` `<=` `>=` | When the entity was last updated<br>`+Required for response` `+Read-only` |
| **useParentVat** | Boolean | | Whether the VAT rate of the parent group is used. If true for the assortment unit, the rate set for the parent group will be applied.<br>`+Required when answering` |
| **vat** | Int | | VAT % |
| **vatEnabled** | Boolean | | Is VAT included on the item. Using this flag, you can set VAT = 0 or VAT = "without VAT" for the product. (vat = 0, vatEnabled = false) -> vat = "excluding VAT", (vat = 0, vatEnabled = true) -> vat = 0%. |
| **volume** | Int | `=` `!=` `<` `>` `<=` `>=` | Volume |
| **weight** | Int | `=` `!=` `<` `>` `<=` `>=` | Weight |

##### Type of labeled products

The values of the trackingType field.

| Value| Description |
| ---------- | ------------ |
| **ELECTRONICS** | Cameras and flash lamps |
| **LP_CLOTHES** | Type of marking "Clothes" |
| **LP_LINENS** | Type of marking "Bed linen" |
| **MILC** | Dairy products |
| **NCP** | Products containing nicotine |
| **NOT_TRACKED** | Unmarked |
| **OTP** | Alternative tobacco products |
| **PERFUMERY** | Perfume and toilet water |
| **SHOES** | Type of marking "Shoes" |
| **TIRES** | Tires and tires |
| **TOBACCO** | Type of marking "Tobacco" |
| **WATER** | Packaged water |

##### Sign of the subject of calculation

Values of the paymentItemType field.

| Value| Description |
| -------- | -----------|
| **GOOD** | Product |
| **EXCISABLE_GOOD** | Excisable goods |
| **COMPOUND_PAYMENT_ITEM** | Composite subject of calculation |
| **ANOTHER_PAYMENT_ITEM** | Other subject of calculation |

##### Tax system code
The values of the taxSystem field.

| Value | Description |
| ------ | --------- |
| **GENERAL_TAX_SYSTEM** | DOS |
| **PATENT_BASED** | Patent |
| **PRESUMPTIVE_TAX_SYSTEM** | UTII |
| **SIMPLIFIEDD_TAX_SYSTEM_INCOME** | USN. Income |
| **SIMPLIFIED_TAX_SYSTEM_INCOME_OUTCOME** | USN. Income-Expense |
| **TAX_SYSTEM_SAME_AS_GROUP** | Same as group |
| **UNIFIED_AGRICULTURAL_TAX** | ESHN |

#### Bundle as an item in transaction

Bundle can act as a transaction item. Products, product variants, services of a bundle can be transferred as part of a item in the metadata format.

The restrictions associated with using Bundles as items:

+ Number of Bundles must be an integer
+ Bundles cannot be items in the following types of transactions:
   - Orders to suppliers
   - Supplier invoices
   - Receivings
   - Returns to suppliers
   - Issued commission agent reports
   - Write-offs
   - Posting
   - Movements
   - Inventory
   - Bills of Materials
   - Internal orders
+ Bundle cannot be a shipment item under a commission agreement:
   - you cannot add a Bundle to a shipment under a commission agreement
   - it is impossible to establish a commission agreement in shipment with Bundles
   - you cannot change the contract to a commission if it has shipments from Bundles


#### Nested entity attributes
##### Additional expenses
The structure of the overhead object.

| Title | Type | Description |
| ------| ----- |------ |
| **value** | float | Price value<br>`+Required when answering` |
| **currency** | [Meta](../#kladana-json-api-general-info-metadata) | Reference to the currency in the format [Metadata](../#kladana-json-api-general-info-metadata)<br>`+Required when replying` `+Expand` |

##### Minimum price
The structure of the minPrice object.

| Title | Type | Description |
| ------|------| -------------|
| **value** | float | Price value<br>`+Required when answering` |
| **currency** | [Meta](../#kladana-json-api-general-info-metadata) | Reference to the currency in the format [Metadata](../#kladana-json-api-general-info-metadata)<br>`+Required when replying` `+Expand` |

#### Bundle Components
Bundle Components is a list of goods/services/modifications that are part of a Bundle. Bundle can have from 1 to 50 components. Object of a Bundle component contains the following fields:

| Title | Type | Description |
| ------------- | --------------- |----------------- |
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Read Only` |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the product/service/series that the component represents<br>`+Required for response` `+Expand` |
| **id** | UUID | Component ID<br>`+Required for response` `+Read-only` |
| **quantity** | Int | Quantity of goods/services of this type in the <br>component`+Required when replying` `+Read-only` |

##### Bundles Metadata

Bundles Metadata contains information about additional fields.

View all additional fields of Bundles created in the main interface,
as well as all types of prices, you can use the [Products](../dictionaries/#entities-towar-metadannye-towarow) metadata request.

Structures of objects of individual collections:

##### Barcodes
When creating a barcode, you need to describe an object with a field that is a lowercase barcode representation format with the string value of the barcode itself. The names of the fields of a separate object representing a barcode:

| Title | Description |
| -------------|----------------- |
| **ean13** | barcode in EAN13 format if you want to generate an EAN13 barcode |
| **ean8** | barcode in EAN8 format if you want to generate an EAN8 barcode |
| **code128** | barcode in Code128 format, if you want to generate a barcode in Code128 format |
| **gtin** | barcode in GTIN format, if you want to generate a barcode in GTIN format. Validated against GS1 format |

To update the list of barcodes, it is necessary to transfer their complete list, including both old and new values.
Missing barcode values will be removed during the update. When updating the list of barcodes, only new values are validated.
Previously stored barcodes are not validated. That is, if one of the old barcodes does not meet the validation requirements, then there will be no error when updating the list.
If an empty list of barcodes or a list of empty values is passed to the input, then the previously created barcodes will be deleted.

Features of creating a list of barcodes when creating a Bundle:

+ If you pass a list of barcodes to the input, then the received barcode values are saved, and empty values are ignored.
+ If you pass a list of empty barcode values to the input, then no barcodes will be created for the products.
+ If you do not pass the barcodes attribute to the input or pass an empty list in it, then by default one random barcode of the EAN13 type will be created for the product.

[Learn more](../#kladana-json-api-general-info-additional-fields) about additional fields of Bundles.

##### Image: structure and loading

Requesting of a Bundle with images will return a json representation of the Bundle containing the **images** field. This field is
an array of elements. **images** field elements have fields:

| Title | Type | Description |
| ------------- | ------ | ------------ |
| **filename** | String(255) | File name<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying` |
| **miniature** | [Meta](../#kladana-json-api-general-info-metadata) | Image thumbnail metadata<br>`+Required when replying` |
| **size** | Int | File size in bytes<br>`+Required when replying` |
| **tiny** | [Meta](../#kladana-json-api-general-info-metadata) | Thumbnail metadata<br>`+Required when replying` |
| **title** | String(255) | Image Title<br>`+Required when replying` |
| **updated** | DateTime | File upload time to server<br>`+Required when replying` |

#### Loading

To upload an image in the request body to [create](../dictionaries/#entities-komplekt-sozdat-komplekt) or [update](../dictionaries/#entities-komplekt-izmenit-komplekt) of a Bundle indicate the * *images** field with a list of elements that have the following attributes:

| Title | Description |
| --------------- | ----------- |
| **filename** | filename with extension . For example - "banana.png" |
| **content** | Base64 encoded image. |

If **images** contain an empty array of elements in an update request, all images in the Bundle will be removed. The server interprets this as a request from the user to update the list of Bundle images.

The API documentation for working with Images can be found in the [Image](../dictionaries/#entities-izobrazhenie) chapter.

[Learn more](../#kladana-json-api-general-info-additional-fields) about Bundles additional fields.

### Get the list of Bundles

Request for all Bundles for this account.
Result: JSON object including fields:

| Title | Type | Description |
| ----------- | ------- | ------ |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Bundles. |

**Parameters**

| Parameter | Description |
| --------- | ------------|
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get the list of Bundles

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/bundle"
   -H "Authorization: Basic <Credentials>"
```

> Response 200 (application/json) the list of Bundles=.

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
     "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
     "type": "bundle",
     "mediaType": "application/json",
     "size": 1,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "bundle",
         "mediaType": "application/json"
       },
       "id": "c21646cf-ee08-11e6-8af5-581e00000023",
       "accountId": "badae4a0-ee05-11e6-8af5-581e00000001",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/bb430a4e-ee05-11e6-8af5-581e0000002a",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": true,
       "group": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/bade121f-ee05-11e6-8af5-581e00000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2017-02-08 17:13:26",
       "name": "Bundle of products and service",
       "code": "00003",
       "externalCode": "iOzqxcTCiAK1-6-eAjVR12",
       "archived": false,
       "pathName": "",
       "discountProhibited": false,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         }
       },
       "images": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/images",
           "type": "image",
           "mediaType": "application/json",
           "size": 0,
           "limit": 1000,
           "offset": 0
         }
       },
       "minPrice": {
         "value": 500.0,
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
           "value": 0.0,
           "currency": {
             "meta": {
               "href": "https://app.kladana.in/api/remap/1.2/entity/currency/bb724075-ee05-11e6-8af5-581e00000058",
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
         }
       ],
       "weight": 0,
       "volume": 0,
       "trackingType": "NOT_TRACKED",
       "barcodes": [
         {
           "ean13": "2000000000039"
         }
       ],
       "vatEnafaded": false,
       "useParentVat": true,
       "components": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components",
           "type": "bundlecomponent",
           "mediaType": "application/json",
           "size": 2,
           "limit": 1000,
           "offset": 0
         }
       }
     }
   ],
   "taxSystem": "GENERAL_TAX_SYSTEM"
}
```

### Create Bundle

Create a new bundle.

#### Description

Bundle is created based on the passed JSON object,
which contains a representation of the new Bundle.
The result is a JSON representation of the generated Bundle. To create a new Bundle
it is necessary and sufficient to specify in the passed object a non-empty `name` field and a non-empty set of `components` components.
The maximum number of components in a Bundle is 50.

> An example of the most complete request in terms of the number of fields.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/bundle"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
              "name": "Bundle with a product and one more product",
              "code": "00003",
              "externalCode": "iOzqxcTCiAK1-6-eAjVR12",
              "archived": false,
              "pathName": "",
              "discountProhibited": false,
              "uom": {
                  "meta": {
                      "href": "https://app.kladana.in/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
                      "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
                      "type": "uom",
                      "mediaType": "application/json"
                  }
              },
              "minPrice": {
                  "value": 500.0,
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
                      "value": 20.0,
                      "currency": {
                          "meta": {
                              "href": "https://app.kladana.in/api/remap/1.2/entity/currency/bb724075-ee05-11e6-8af5-581e00000058",
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
                  }
              ],
              "weight": 0,
              "volume": 0,
              "trackingType": "NOT_TRACKED",
              "barcodes": [
                  {
                      "ean8": "20000000"
                  },
                  {
                      "ean13": "2000000000000"
                  },
                  {
                      "code128": "code128 barcode"
                  },
                  {
                      "gtin": "00000000000130"
                  }
              ],
              "vat": 20,
              "useParentVat": false,
              "components": [
                  {
                      "assortment": {
                          "meta": {
                              "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b8",
                              "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                              "type": "product",
                              "mediaType": "application/json"
                          }
                      },
                      "quantity": 1
                  },
                  {
                      "assortment": {
                          "meta": {
                              "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b9",
                              "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                              "type": "product",
                              "mediaType": "application/json"
                          }
                      },
                      "quantity": 1
                  }
              ]
          }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Bundle.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
     "type": "bundle",
     "mediaType": "application/json"
   },
   "id": "c21646cf-ee08-11e6-8af5-581e00000023",
   "accountId": "badae4a0-ee05-11e6-8af5-581e00000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/bb430a4e-ee05-11e6-8af5-581e0000002a",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/bade121f-ee05-11e6-8af5-581e00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2017-02-08 17:13:26",
   "name": "Bundle with a product and one more product",
   "code": "00003",
   "externalCode": "iOzqxcTCiAK1-6-eAjVR12",
   "archived": false,
   "pathName": "",
   "discountProhibited": false,
   "uom": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
       "type": "uom",
       "mediaType": "application/json"
     }
   },
   "images": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/images",
       "type": "image",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "minPrice": {
     "value": 500.0,
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
       "value": 20.0,
       "currency": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/bb724075-ee05-11e6-8af5-581e00000058",
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
     }
   ],
   "weight": 0,
   "volume": 0,
   "trackingType": "NOT_TRACKED",
   "barcodes": [
     {
       "ean8": "20000000"
     },
     {
       "ean13": "2000000000000"
     },
     {
       "code128": "code128 barcode"
     },
     {
       "gtin": "00000000000130"
     }
   ],
   "vat": 20,
   "useParentVat": false,
   "vatEnabled": true,
   "components": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components",
       "type": "bundlecomponent",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     },
     "rows": [
       {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components/9404273f-eeb6-11e6-5bed-427b0000000c",
           "type": "bundlecomponent",
           "mediaType": "application/json"
         },
         "id": "9404273f-eeb6-11e6-5bed-427b0000000c",
         "accountId": "903083d9-d973-11e6-5bed-427b00000001",
         "assortment": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b8",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json"
           }
         },
         "quantity": 1
       },
       {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components/9404273f-eeb6-11e6-5bed-427b0000000d",
           "type": "bundlecomponent",
           "mediaType": "application/json"
         },
         "id": "9404273f-eeb6-11e6-5bed-427b0000000d",
         "accountId": "903083d9-d973-11e6-5bed-427b00000001",
         "assortment": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b9",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json"
           }
         },
         "quantity": 1
       }
     ]
   }
}
```

> Sample request to create of a Bundle with image upload

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/bundle"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type:application/json"
      -d '{
            "name": "Bundle с изображением",
            "images": [
              {
                "filename": "birdimage.png",
                "content": "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}
             ],
             "components": [
               {
                 "assortment": {
                   "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b8",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                     "type": "product",
                     "mediaType": "application/json"
                   }
                 },
                 "quantity": 1
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Bundle.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
     "type": "bundle",
     "mediaType": "application/json"
   },
   "id": "c21646cf-ee08-11e6-8af5-581e00000023",
   "accountId": "badae4a0-ee05-11e6-8af5-581e00000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/bb430a4e-ee05-11e6-8af5-581e0000002a",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/bade121f-ee05-11e6-8af5-581e00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2017-02-08 17:13:26",
   "name": "Bundle with picture",
   "code": "00003",
   "externalCode": "iOzqxcTCiAK1-6-eAjVR12",
   "archived": false,
   "pathName": "",
   "discountProhibited": false,
   "uom": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
       "type": "uom",
       "mediaType": "application/json"
     }
   },
   "images": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/images",
       "type": "image",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     },
     "updated": "2017-01-11 14:54:10",
     "title": "birdimage.png",
     "filename": "birdimage.png",
     "size": 14052,
     "miniature": {
       "href": "https://app.kladana.in/api/remap/1.2/download/bd159783-95ee-11e6-8a84-bae500000001?miniature=true",
       "mediaType": "image/png",
       "downloadHref": "https://miniature-prod.app.kladana.in/miniature/79b17fec-2f08-11eb-0a80-052200009a8a/documentminiature/7129822c-2409-417c-977f-31a1e889039a"
     },
     "tiny": {
       "href": "https://app.kladana.in/app/download/bd14f0b6-95ee-11e6-8a84-bae500000000.png",
       "mediaType": "image/png"
     }
   },
   "minPrice": {
     "value": 500.0,
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
       "value": 20.0,
       "currency": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/bb724075-ee05-11e6-8af5-581e00000058",
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
     }
   ],
   "weight": 0,
   "volume": 0,
   "trackingType": "NOT_TRACKED",
   "barcodes": [
     {
       "ean13": "2000000000039"
     }
   ],
   "useParentVat": true,
   "vatEnabled": false,
   "components": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components",
       "type": "bundlecomponent",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     },
     "rows": [
       {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components/9404273f-eeb6-11e6-5bed-427b0000000c",
           "type": "bundlecomponent",
           "mediaType": "application/json"
         },
         "id": "9404273f-eeb6-11e6-5bed-427b0000000c",
         "accountId": "903083d9-d973-11e6-5bed-427b00000001",
         "assortment": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b8",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json"
           }
         },
         "quantity": 1
       },
       {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components/9404273f-eeb6-11e6-5bed-427b0000000d",
           "type": "bundlecomponent",
           "mediaType": "application/json"
         },
         "id": "9404273f-eeb6-11e6-5bed-427b0000000d",
         "accountId": "903083d9-d973-11e6-5bed-427b00000001",
         "assortment": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b9",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json"}
         },
         "quantity": 1
       }
     ]
   }
}
```

### Bundles bulk creation and update
Bundles [bulk creation and update]
In the body of the request, you need to pass an array containing the JSON representation of the Bundles that you want to create or update.
Updated Bundles must contain the identifier in the form of metadata.

> Example of creating and updating multiple Bundles

   ```shell
     curl -X POST
       "https://app.kladana.in/api/remap/1.2/entity/bundle"
       -H "Authorization: Basic <Credentials>"
       -H "Content-Type: application/json"
         -d'[
              {
                  "name": "Bundle with a product and one more product",
                  "code": "00003",
                  "externalCode": "iOzqxcTCiAK1-6-eAjVR12",
                  "archived": false,
                  "pathName": "",
                  "uom": {
                      "meta": {
                          "href": "https://app.kladana.in/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
                          "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
                          "type": "uom",
                          "mediaType": "application/json"
                      }
                  },
                  "minPrice": {
                      "value": 500.0,
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
                          "value": 20.0,
                          "currency": {
                              "meta": {
                                  "href": "https://app.kladana.in/api/remap/1.2/entity/currency/bb724075-ee05-11e6-8af5-581e00000058",
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
                      }
                  ],
                  "weight": 0,
                  "volume": 0,
                  "trackingType": "NOT_TRACKED",
                  "barcodes": [
                      {
                          "ean8": "20000000"
                      },
                      {
                          "ean13": "2000000000000"
                      },
                      {
                          "code128": "code128 barcode"
                      },
                      {
                          "gtin": "00000000000130"
                      }
                  ],
                  "components": [
                      {
                          "assortment": {
                              "meta": {
                                  "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b8",
                                  "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                                  "type": "product",
                                  "mediaType": "application/json"
                              }
                          },
                          "quantity": 1
                      },
                      {
                          "assortment": {
                              "meta": {
                                  "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b9",
                                  "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                                  "type": "product",
                                  "mediaType": "application/json"
                              }
                          },
                          "quantity": 1
                      }
                  ]
              },
              {
                  "meta": {
                      "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023",
                      "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                      "type": "bundle",
                      "mediaType": "application/json"
                  },
                  "name": "New name",
                  "barcodes": [
                      {
                          "ean8": "20000000"
                      },
                      {
                          "ean13": "2000000000000"
                      },
                      {
                          "code128": "code128 barcode"
                      },
                      {
                          "gtin": "00000000000130"
                      }
                  ]
              }
          ]'
   ```
> Response 200(application/json)
Successful request. The result is a JSON array of representations of the generated and updated Bundles.
  
   ```json
   [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "bundle",
         "mediaType": "application/json"
       },
       "id": "c21646cf-ee08-11e6-8af5-581e00000023",
       "accountId": "badae4a0-ee05-11e6-8af5-581e00000001",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/bb430a4e-ee05-11e6-8af5-581e0000002a",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": true,
       "group": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/bade121f-ee05-11e6-8af5-581e00000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2017-02-08 17:13:26",
       "name": "Bundle with a product and one more product",
       "code": "00003",
       "externalCode": "iOzqxcTCiAK1-6-eAjVR12",
       "archived": false,
       "pathName": "",
       "discountProhibited": false,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         }
       },
       "images": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/images",
             "type": "image",
             "mediaType": "application/json",
             "size": 0,
             "limit": 1000,
             "offset": 0
           }
       },
       "minPrice": {
         "value": 500.0,
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
           "value": 20.0,
           "currency": {
             "meta": {
               "href": "https://app.kladana.in/api/remap/1.2/entity/currency/bb724075-ee05-11e6-8af5-581e00000058",
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
         }
       ],
       "weight": 0,
       "volume": 0,
       "trackingType": "NOT_TRACKED",
       "barcodes": [
         {
           "ean8": "20000000"
         },
         {
           "ean13": "2000000000000"
         },
         {
           "code128": "code128 barcode"
         },
         {
           "gtin": "00000000000130"
         }
       ],
       "useParentVat": true,
       "vatEnabled": false,
       "components": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components",
           "type": "bundlecomponent",
           "mediaType": "application/json",
           "size": 2,
           "limit": 1000,
           "offset": 0
         },
         "rows": [
           {
             "meta": {
               "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components/9404273f-eeb6-11e6-5bed-427b0000000c",
               "type": "bundlecomponent",
               "mediaType": "application/json"
             },
             "id": "9404273f-eeb6-11e6-5bed-427b0000000c",
             "accountId": "903083d9-d973-11e6-5bed-427b00000001",
             "assortment": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b8",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                 "type": "product",
                 "mediaType": "application/json"
               }
             },
             "quantity": 1
           },
           {
             "meta": {
               "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components/9404273f-eeb6-11e6-5bed-427b0000000d",
               "type": "bundlecomponent",
               "mediaType": "application/json"
             },
             "id": "9404273f-eeb6-11e6-5bed-427b0000000d",
             "accountId": "903083d9-d973-11e6-5bed-427b00000001",
             "assortment": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b9",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                 "type": "product",
                 "mediaType": "application/json"
               }
             },
             "quantity": 1
           }
         ]
       }
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
         "type": "bundle",
         "mediaType": "application/json"
       },
       "id": "c21646cf-ee08-11e6-8af5-581e00000023",
       "accountId": "badae4a0-ee05-11e6-8af5-581e00000001",
       "owner": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/employee/bb430a4e-ee05-11e6-8af5-581e0000002a",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       },
       "shared": true,
       "group": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/group/bade121f-ee05-11e6-8af5-581e00000002",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
           "type": "group",
           "mediaType": "application/json"
         }
       },
       "updated": "2017-02-08 17:13:26",
       "name": "New name",
       "code": "00003",
       "externalCode": "iOzqxcTCiAK1-6-eAjVR12",
       "archived": false,
       "pathName": "",
       "discountProhibited": false,
       "uom": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         }
       },
      "images": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/images",
           "type": "image",
           "mediaType": "application/json",
           "size": 0,
           "limit": 1000,
           "offset": 0
         }
       },
       "minPrice": {
         "value": 500.0,
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
           "value": 20.0,
           "currency": {
             "meta": {
               "href": "https://app.kladana.in/api/remap/1.2/entity/currency/bb724075-ee05-11e6-8af5-581e00000058",
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
         }
       ],
       "weight": 0,
       "volume": 0,
       "trackingType": "NOT_TRACKED",
       "barcodes": [
         {
           "ean8": "20000000"
         },
         {
           "ean13": "2000000000000"
         },
         {
           "code128": "code128 barcode"
         },
         {
           "gtin": "00000000000130"
         }
       ],
       "useParentVat": true,
       "vatEnabled": false,
       "components": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components",
           "type": "bundlecomponent",
           "mediaType": "application/json",
           "size": 2,
           "limit": 1000,
           "offset": 0
         },
         "rows": [
           {
             "meta": {
               "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components/9404273f-eeb6-11e6-5bed-427b0000000c",
               "type": "bundlecomponent",
               "mediaType": "application/json"
             },
             "id": "9404273f-eeb6-11e6-5bed-427b0000000c",
             "accountId": "903083d9-d973-11e6-5bed-427b00000001",
             "assortment": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b8",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                 "type": "product",
                 "mediaType": "application/json"
               }
             },
             "quantity": 1
           },
           {
             "meta": {
               "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components/9404273f-eeb6-11e6-5bed-427b0000000d",
               "type": "bundlecomponent",
               "mediaType": "application/json"
             },
             "id": "9404273f-eeb6-11e6-5bed-427b0000000d",
             "accountId": "903083d9-d973-11e6-5bed-427b00000001",
             "assortment": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b9",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                 "type": "product",
                 "mediaType": "application/json"
               }
             },
             "quantity": 1
           }
         ]
       }
     }
   ]
   ```
  
### Bundles Metadata

View all additional fields of Bundles created in the main interface,
as well as all types of prices, you can use the [Products](../dictionaries/#entities-towar-metadannye-towarow) metadata request.

### Bundle

**Parameters**

| Parameter | Description |
| ------- | ------------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bundle ID. |

###Get Bundle

> Request to receive of the Bundle with indicated ID.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/bundle/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Bundle.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
     "type": "bundle",
     "mediaType": "application/json"
   },
   "id": "c21646cf-ee08-11e6-8af5-581e00000023",
   "accountId": "badae4a0-ee05-11e6-8af5-581e00000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/bb430a4e-ee05-11e6-8af5-581e0000002a",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/bade121f-ee05-11e6-8af5-581e00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2017-02-08 17:13:26",
   "name": "Bundle with a product and a service",
   "code": "00003",
   "externalCode": "iOzqxcTCiAK1-6-eAjVR12",
   "archived": false,
   "pathName": "",
   "discountProhibited": false,
   "uom": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
       "type": "uom",
       "mediaType": "application/json"
     }
   },
   "images": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/images",
       "type": "image",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "minPrice": {
     "value": 500.0,
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
       "value": 0.0,
       "currency": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/bb724075-ee05-11e6-8af5-581e00000058",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata","type": "currency",
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
     }
   ],
   "weight": 0,
   "volume": 0,
   "trackingType": "NOT_TRACKED",
   "barcodes": [
     {
       "ean13": "2000000000039"
     }
   ],
   "useParentVat": true,
   "vatEnabled": false,
   "components": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components",
       "type": "bundlecomponent",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     }
   }
}
```

### Edit Bundle

Request to update of an existing Bundle.
Price types in sales prices, additional fields and components are updated as elements of nested collections:

+ If in the current object some of the additional fields / price types / components no value,
and in the passed collection it is - the value is written to the additional field / price type / component.
+ If this attribute already has a value, it is overwritten with the one passed.
+ If this attribute has a value in the object, but it is missing
in the collection passed in the body of the request (not passed at all), then the value of the object attribute is not changed.

**Parameters**

| Parameter | Description |
| ------ |--------------------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bundle ID. |

> Sample update request of a Bundle
 
  ```shell
    curl -X PUT
      "https://app.kladana.in/api/remap/1.2/entity/bundle/7944ef04-f831-11e5-7a69-971500188b19"
      -H "Authorization: Basic <Credentials>"
      -H "Content-Type: application/json"
        -d '{
              "name": "New name",
              "barcodes": [
                {
                  "ean8": "20000000"
                },
                {
                  "ean13": "2000000000000"
                },
                {
                  "code128": "code128 barcode"
                },
                {
                  "gtin": "00000000000130"
                }
              ],
            }'
  ```
 
> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Bundle.
 
  ```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
     "type": "bundle",
     "mediaType": "application/json"
   },
   "id": "c21646cf-ee08-11e6-8af5-581e00000023",
   "accountId": "badae4a0-ee05-11e6-8af5-581e00000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/bb430a4e-ee05-11e6-8af5-581e0000002a",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/bade121f-ee05-11e6-8af5-581e00000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2017-02-08 17:13:26",
   "name": "New name",
   "code": "00003",
   "externalCode": "iOzqxcTCiAK1-6-eAjVR12",
   "archived": false,
   "pathName": "",
   "discountProhibited": false,
   "uom": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/uom/metadata",
       "type": "uom",
       "mediaType": "application/json"
     }
   },
   "images": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/images",
       "type": "image",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "minPrice": {
     "value": 500.0,
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
       "value": 20.0,
       "currency": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/currency/bb724075-ee05-11e6-8af5-581e00000058",
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
     }
   ],
   "weight": 0,
   "volume": 0,
   "trackingType": "NOT_TRACKED",
   "barcodes": [
     {
       "ean8": "20000000"
     },
     {
       "ean13": "2000000000000"
     },
     {
       "code128": "code128 barcode"
     },
     {
       "gtin": "00000000000130"
     }
   ],
   "useParentVat": true,
   "vatEnabled": false,
   "components": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components",
       "type": "bundlecomponent",
       "mediaType": "application/json",
       "size": 2,
       "limit": 1000,
       "offset": 0
     },
     "rows": [
       {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components/9404273f-eeb6-11e6-5bed-427b0000000c",
           "type": "bundlecomponent",
           "mediaType": "application/json"
         },
         "id": "9404273f-eeb6-11e6-5bed-427b0000000c",
         "accountId": "903083d9-d973-11e6-5bed-427b00000001",
         "assortment": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b8",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json"
           }
         },
         "quantity": 1
       },
       {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components/9404273f-eeb6-11e6-5bed-427b0000000d",
           "type": "bundlecomponent",
           "mediaType": "application/json"
         },
         "id": "9404273f-eeb6-11e6-5bed-427b0000000d",
         "accountId": "903083d9-d973-11e6-5bed-427b00000001",
         "assortment": {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b9",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
             "type": "product",
             "mediaType": "application/json"
           }
         },
         "quantity": 1
       }
     ]
   }
}
  ```
  
### Delete Bundle

**Parameters**

| Parameter | Description |
| ------- | ----------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bundle ID. |

> Request to delete of the Bundle with the specified id.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/bundle/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful removal of the Bundle.

### Bundles bulk deletion

In the body of the request, you need to pass an array containing JSON of the metadata of Bundles that you want to remove.


> Bulk delete request of Bundles.

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/bundle/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d'[
          {
              "meta": {
                  "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/7944ef04-f831-11e5-7a69-971500188b1",
                  "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                  "type": "bundle",
                  "mediaType": "application/json"
              }
          },
          {
              "meta": {
                  "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/7944ef04-f831-11e5-7a69-971500188b2",
                  "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                  "type": "bundle",
                  "mediaType": "application/json"
              }
          }
      ]'
```

> Successful request. The result is JSON information about the deletion of Bundles.

```json
[
   {
     "info":"Entity 'bundle' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'bundle' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Bundle Components

A separate resource for managing the components of the Bundle.

### Get Bundle components
Request to get a list of all components of this Bundle.

| Title | Type | Description |
| ------| -----| ----------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata, |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the Bundle. |

**Parameters**

| Parameter | Description |
| -------- | -------------------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bundle ID. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get the components of the Complex

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/bundle/7944ef04-f831-11e5-7a69-971500188b19/components"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of individual Bundle components.

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
     "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components",
     "type": "bundlecomponent",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components/c21661f2-ee08-11e6-8af5-581e00000026",
         "type": "bundlecomponent",
         "mediaType": "application/json"
       },
       "id": "c21661f2-ee08-11e6-8af5-581e00000026",
       "accountId": "badae4a0-ee05-11e6-8af5-581e00000001",
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/service/b3d8d132-ee08-11e6-8af5-581e00000013",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "service",
           "mediaType": "application/json"
         }
       },
       "quantity": 1
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components/c21668eb-ee08-11e6-8af5-581e00000027",
         "type": "bundlecomponent",
         "mediaType": "application/json"
       },
       "id": "c21668eb-ee08-11e6-8af5-581e00000027",
       "accountId": "badae4a0-ee05-11e6-8af5-581e00000001",
       "assortment": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/product/b01e8dfd-ee08-11e6-8af5-581e00000005",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
           "type": "product",
           "mediaType": "application/json"
         }
       },
       "quantity": 1
     }
   ]
}
```

### Add Bundle component

**Parameters**

| Parameter | Description |
| ------- | ---------------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bundle ID. |

> Request to add a Bundle component.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/bundle/7944ef04-f831-11e5-7a69-971500188b19/components"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "assortment": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b8",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
                 "type": "product",
                 "mediaType": "application/json"
               }
             },
             "quantity": 1
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the added component.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components/9404273f-eeb6-11e6-5bed-427b0000000c",
     "type": "bundlecomponent",
     "mediaType": "application/json"
   },
   "id": "9404273f-eeb6-11e6-5bed-427b0000000c",
   "accountId": "903083d9-d973-11e6-5bed-427b00000001",
   "assortment": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b8",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json"
     }
   },
   "quantity": 1
}
```


### Bundle Component

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Bundle component ID. |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bundle ID. |

### Get component

> Request to get a separate Bundle component with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/bundle/7944ef04-f831-11e5-7a69-971500188b19/components/34f6344f-015e-11e6-9464-e4de0000006c"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a single Bundle component.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components/9404273f-eeb6-11e6-5bed-427b0000000c",
     "type": "bundlecomponent",
     "mediaType": "application/json"
   },
   "id": "9404273f-eeb6-11e6-5bed-427b0000000c",
   "accountId": "903083d9-d973-11e6-5bed-427b00000001",
   "assortment": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b8",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json"
     }
   },
   "quantity": 1
}
```

### Change component

**Parameters**

| Parameter | Description |
| ------- |---------|
| **id** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Bundle component ID. |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bundle ID. |

Request to change an individual Bundle component with the specified id.

> Sample Request to Change a Bundle Component

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/bundle/7944ef04-f831-11e5-7a69-971500188b19/components/34f6344f-015e-11e6-9464-e4de0000006c
"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "quantity": 50
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a single Bundle component.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/bundle/c21646cf-ee08-11e6-8af5-581e00000023/components/9404273f-eeb6-11e6-5bed-427b0000000c",
     "type": "bundlecomponent",
     "mediaType": "application/json"
   },
   "id": "9404273f-eeb6-11e6-5bed-427b0000000c",
   "accountId": "903083d9-d973-11e6-5bed-427b00000001",
   "assortment": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/product/010afdea-ea40-11e6-5bed-427b000000b8",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json"
     }
   },
   "quantity": 50
}
```

### Delete component

**Parameters**

| Parameter | Description |
|------ |-------------------- |
| **id** | `string` (required) *Example: 34f6344f-015e-11e6-9464-e4de0000006c* Bundle component ID. |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Bundle ID. |

> Request to remove a single Bundle component with the specified id.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/bundle/7944ef04-f831-11e5-7a69-971500188b19/components/34f6344f-015e-11e6-9464-e4de0000006c"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of the Bundle component.
