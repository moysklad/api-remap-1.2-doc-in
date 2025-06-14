## Product
### Products
Using the JSON API, you can create and update information about Products, request lists of Products and information on individual Products.
  The entity code for a Product in the JSON API is the **product** keyword. Learn more about [Products](https://kladana.zendesk.com/hc/en-us/articles/4435291832465-Overview-of-Products-and-Services).

This entity can be contextually searched using the special `search` parameter. [Learn more](../#kladana-json-api-general-info-context-search).

The search among the objects of products to match the search string will be carried out in the following fields:

+ by product name (name)
+ by product code (code)
+ by article

#### Entity attributes

| Title                   | Type                                               | Filtration                                                                                                                                            | Description                                                                                                                                                                                                                                              |
|-------------------------|----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **accountId**           | UUID                                               |                                                                                                                                                       | Account ID<br>`+Required when replying` `+Read Only`                                                                                                                                                                                                     |
| **alcoholic**           | Object                                             |                                                                                                                                                       | An object containing the fields of alcoholic products. [Learn more](../dictionaries/#entities-product-products-nested-entity-attributes-an-object-containing-the-fields-of-alcoholic-products)                                                           |
| **archived**            | Boolean                                            | `=` `!=`                                                                                                                                              | Has the Product been added to the archive<br>`+Required when replying`                                                                                                                                                                                   |
| **article**             | String(255)                                        | `=` `!=` `~` `~=` `=~`                                                                                                                                | Article                                                                                                                                                                                                                                                  |
| **attributes**          | Array(Object)                                      | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Collection of additional fields                                                                                                                                                                                                                          |
| **barcodes**            | Array(Object)                                      | `=` `!=` `~` `~=` `=~`                                                                                                                                | Bundle barcodes. [Learn more](../dictionaries/#entities-product-products-nested-entity-attributes-barcodes)                                                                                                                                              |
| **buyPrice**            | Object                                             |                                                                                                                                                       | Purchase price. [Learn more](../dictionaries/#entities-product-products-nested-entity-attributes-purchase-price)                                                                                                                                         |
| **code**                | String(255)                                        | `=` `!=` `~` `~=` `=~`                                                                                                                                | Product Code                                                                                                                                                                                                                                             |
| **country**             | [Meta](../#kladana-json-api-general-info-metadata) || Country Metadata<br>`+Expand`                                                                                                                         |
| **description**         | String(4096)                                       | `=` `!=` `~` `~=` `=~`                                                                                                                                | Product Description                                                                                                                                                                                                                                      |
| **discountProhibited**  | Boolean                                            |                                                                                                                                                       | Sign of prohibition of discounts<br>`+Required when replying`                                                                                                                                                                                           |
| **effectiveVat**        | Int                                                |                                                                                                                                                       | Real VAT %<br>`+Read only`                                                                                                                                                                                                                               |
| **effectiveVatEnabled** | Boolean                                            |                                                                                                                                                       | Additional characteristic for determining delimitation of real VAT = 0 or "without VAT". (effectiveVat = 0, effectiveVatEnabled = false) -> "without VAT", (effectiveVat = 0, effectiveVatEnabled = true) -> 0%.<br>`+Read Only`                         |
| **externalCode**        | String(255)                                        | `=` `!=` `~` `~=` `=~`                                                                                                                                | External Product Code<br>`+Required when replying`                                                                                                                                                                                                       |
| **files**               | MetaArray                                          |                                                                                                                                                       | [Files](../dictionaries/#entities-files) array metadata (Maximum number of files - 100)<br>`+Expand`                                                                                                                                                     |
| **group**               | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                                                                                                                                              | Employee department metadata<br>`+Required when replying` `+Expand`                                                                                                                                                                                      |
| **id**                  | UUID                                               | `=` `!=`                                                                                                                                              | Item ID<br>`+Required when replying` `+Read Only`                                                                                                                                                                                                        |
| **images**              | MetaArray                                          |                                                                                                                                                       | [Images](../dictionaries/#entities-image) metadata array (Maximum number of images - 10)<br>`+Expand`                                                                                                                                                    |
| **isSerialTrackable**   | Boolean                                            | `=` `!=`                                                                                                                                              | Accounting for serial numbers. This mark is not compatible with the features **weighed**, **alcoholic**, **ppeType**, **trackingType**, **onTap**.                                                                                                       |
| **meta**                | [Meta](../#kladana-json-api-general-info-metadata) |                                                                                                                                                       | Product Metadata<br>`+Required when replying`                                                                                                                                                                                                            |
| **minPrice**            | Object                                             |                                                                                                                                                       | Minimum price. [Learn more](../dictionaries/#entities-product-products-nested-entity-attributes-minimum-price)                                                                                                                                           |
| **minimumBalance**      | Float                                              | `=` `!=` `<` `>` `<=` `>=`                                                                                                                            | Minimum stock<br>`+Deprecated`                                                                                                                                                                                                                           |
| **minimumStock**        | Object                                             |                                                                                                                                                       | Minimum stock. [Learn more here](../dictionaries/#entities-product-products-nested-entity-attributes-minimum-stock)<br>`+Available upon request`                                                   |
| **name**                | String(255)                                        | `=` `!=` `~` `~=` `=~`                                                                                                                                | Item Name<br>`+Required when replying` `+Required when creating`                                                                                                                                                                                         |
| **owner**               | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                                                                                                                                              | Owner (Employee) metadata<br>`+Expand`                                                                                                                                                                                                                   |
| **packs**               | Array(Object)                                      |                                                                                                                                                       | Product packaging. [Learn more](../dictionaries/#entities-product-products-nested-entity-attributes-product-packaging)                                                                                                                                   |
| **partialDisposal**     | Boolean                                            |                                                                                                                                                       | Management of the state of partial disposal of marked products. "true" - the feature is enabled.                                                                                                                                                         |
| **pathName**            | String                                             | `=` `!=` `~` `~=` `=~`                                                                                                                                | Name of the group that the Product belongs to<br>`+Required when replying` `+Read only`                                                                                                                                                                  |
| **paymentItemType**     | Enum                                               |                                                                                                                                                       | Sign of the subject of calculation. [Learn more](../dictionaries/#entities-product-products-entity-attributes-sign-of-the-subject-of-calculation)                                                                                                        |
| **ppeType**             | Enum                                               |                                                                                                                                                       | Classification type code for medical personal protective equipment (EAN-13). [Learn more](../dictionaries/#entities-product-products-entity-attributes-classification-codes-for-types-of-products-and-services-of-medical-personal-protective-equipment) |
| **productFolder**       | [Meta](../#kladana-json-api-general-info-metadata) |                                                                                                                                                       | Product group metadata<br>`+Expand`                                                                                                                                                                                                                      |
| **salePrice**           | Array(Object)                                      |                                                                                                                                                       | Sale prices. [Learn more](../dictionaries/#entities-product-products-nested-entity-attributes-sales-prices)                                                                                                                                              |
| **shared**              | Boolean                                            | `=` `!=`                                                                                                                                              | Sharing<br>`+Required when replying`                                                                                                                                                                                                                     |
| **supplier**            | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`                                                                                                                                              | Supplier counterparty metadata<br>`+Expand`                                                                                                                                                                                                              |
| **syncId**              | UUID                                               | `=` `!=`                                                                                                                                              | Synchronization ID<br>`+Read-only` `+Fill on creation`                                                                                                                                                                                                   |
| **taxSystem**           | Enum                                               |                                                                                                                                                       | Tax system code. [Learn more](../dictionaries/#entities-product-products-entity-attributes-tax-system-code)                                                                                                                                              |
| **things**              | Array(String)                                      |                                                                                                                                                       | Serial numbers                                                                                                                                                                                                                                           |
| **tnved**               | String(255)                                        |                                                                                                                                                       | TN VED code                                                                                                                                                                                                                                              |
| **trackingType**        | Enum                                               |                                                                                                                                                       | Type of labeled product. [Learn more](../dictionaries/#entities-product-products-entity-attributes-type-of-labeled-products)                                                                                                                             |
| **uom**                 | [Meta](../#kladana-json-api-general-info-metadata) |                                                                                                                                                       | Units<br>`+Expand`                                                                                                                                                                                                                                       |
| **updated**             | DateTime                                           | `=` `!=` `<` `>` `<=` `>=`                                                                                                                            | When the entity was last updated<br>`+Required when replying` `+Read-only`                                                                                                                                                                                |
| **useParentVat**        | Boolean                                            |                                                                                                                                                       | Whether the VAT rate of the parent group is used. If true for the assortment unit, the rate set for the parent group will be applied.<br>`+Required when replying`                                                                                      |
| **variantsCount**       | Int                                                |                                                                                                                                                       | Number of variants for this product<br>`+Required when replying` `+Read only`                                                                                                                                                                            |
| **vat**                 | Int                                                |                                                                                                                                                       | VAT %                                                                                                                                                                                                                                                    |
| **vatEnabled**          | Boolean                                            |                                                                                                                                                       | Is VAT included on the item. Using this flag, you can set VAT = 0 or VAT = "without VAT" for the product. (vat = 0, vatEnabled = false) -> vat = "excluding VAT", (vat = 0, vatEnabled = true) -> vat = 0%.                                              |
| **volume**              | Float                                              | `=` `!=` `<` `>` `<=` `>=`                                                                                                                            | Volume                                                                                                                                                                                                                                                   |
| **weight**              | Float                                              | `=` `!=` `<` `>` `<=` `>=`                                                                                                                            | Weight                                                                                                                                                                                                                                                   |


The **pathName** attribute itself is a read-only attribute, but it can be changed
by updating the **productFolder** attribute.

##### Type of labeled products
The values of the trackingType field.

| Value               | Description                          |
|---------------------|--------------------------------------|
| **BEER_ALCOHOL**    | Beer and low-alcohol beverages       |
| **ELECTRONICS**     | Cameras and flash lamps              |
| **FOOD_SUPPLEMENT** | Biologically active food supplements |
| **LP_CLOTHES**      | Label type "Clothing"                |
| **LP_LINENS**       | Label type "Bed linen"               |
| **MEDICAL_DEVICES** | Medical devices and wheelchairs      |
| **MILK**            | Dairy products                       |
| **NCP**             | Nicotine-containing products         |
| **NOT_TRACKED**     | No label                             |
| **OTP**             | Alternative tobacco products         |
| **PERFUMERY**       | Perfumes and eau de toilette         |
| **SANITIZER**       | Antiseptics                          |
| **SHOES**           | Label type "Shoes"                   |
| **SOFT_DRINKS**     | Soft drinks                          |
| **TIRES**           | Tires and tires                      |
| **TOBACCO**         | Label type "Tobacco"                 |
| **WATER**           | Packaged water                       |

##### Sign of the subject of calculation

Values of the paymentItemType field.

| Values                    | Description                      |
|---------------------------|----------------------------------|
| **GOOD**                  | Product                          |
| **EXCISABLE_GOOD**        | Excisable products               |
| **COMPOUND_PAYMENT_ITEM** | Composite subject of calculation |
| **ANOTHER_PAYMENT_ITEM**  | Other subject of calculation     |

##### Tax system code
The values of the taxSystem field.

| Values                                   | Description         |
|------------------------------------------|---------------------|
| **GENERAL_TAX_SYSTEM**                   | DOS                 |
| **PATENT_BASED**                         | Patent              |
| **PRESUMPTIVE_TAX_SYSTEM**               | UTII                |
| **SIMPLIFIED_TAX_SYSTEM_INCOME**         | USN. Income         |
| **SIMPLIFIED_TAX_SYSTEM_INCOME_OUTCOME** | USN. Income-Expense |
| **TAX_SYSTEM_SAME_AS_GROUP**             | Same as group       |
| **UNIFIED_AGRICULTURAL_TAX**             | ESHN                |

##### Classification codes for types of products and services of medical personal protective equipment

Values of the ppeType field.

| Values            | Description                                                                       |
|-------------------|-----------------------------------------------------------------------------------|
| **2400001225408** | gloves, examination (procedural), rubber latex, powder-free, non-sterile          |
| **2400001225606** | gloves, examination (procedural), rubber latex, powdered                          |
| **2400001226108** | gloves, examination (procedural), rubber latex, powder-free, sterile              |
| **2400001226306** | rubber latex surgical gloves, powder free                                         |
| **2400001226405** | rubber latex surgical gloves, powdered                                            |
| **2400001323807** | face mask, respiratory protection, reusable                                       |
| **2400001368105** | nasal product for protection against polluted air, local action                   |
| **2400001393107** | polychloroprene surgical gloves, powder-free                                      |
| **2400001393503** | examination (procedure) gloves, polychloroprene, powder-free                      |
| **2400001393602** | examination (procedural) gloves, polychloroprene, powdered                        |
| **2400001565306** | styrene block copolymer surgical gloves, powder-free, antibacterial               |
| **2400001807703** | respirator for general use                                                        |
| **2400001818303** | respirator, surgical                                                              |
| **2400001857005** | surgical gloves, nitrile, powder-free                                             |
| **2400001857203** | surgical gloves, nitrile, powdered                                                |
| **2400001858309** | gloves, examination (procedural), nitrile, powder-free, non-sterile               |
| **2400001858507** | examination (procedure) gloves, nitrile, powdered                                 |
| **2400002015909** | surgical gloves, polyisoprene, powder-free                                        |
| **2400002016005** | surgical gloves, polyisoprene, powder-free, antibacterial                         |
| **2400002016104** | surgical gloves, polyisoprene, powdered                                           |
| **2400002052805** | gloves, examination (procedural), vinyl, powder-free                              |
| **2400002052904** | gloves, examination (procedural), vinyl, powdered                                 |
| **2400002186203** | respirator, surgical, antibacterial                                               |
| **2400002886707** | hygienic overalls for visitors                                                    |
| **2400002886806** | set of hygienic clothes for visitors                                              |
| **2400002984502** | gloves, examination (procedural), guayule latex, powder-free                      |
| **2400003117107** | examination (procedure) gloves, ethylene vinyl acetate, powder-free, sterile      |
| **2400003117206** | examination (procedural) gloves, ethylene vinyl acetate, powder-free, non-sterile |
| **2400003161209** | gloves, styrene block copolymer, powder-free                                      |
| **2400003207907** | gloves, examination (procedural), nitrile, powder-free, antibacterial             |
| **2400003215308** | gloves, examination (procedural), polyisoprene, powder-free                       |
| **2400003227806** | gloves, polymer composite, powder-free                                            |
| **2400003237409** | gloves, polymer composite, powder-free                                            |
| **2400003263408** | rubber latex surgical gloves, powder-free, antibacterial                          |
| **2400003297700** | gloves, examination (procedure), nitrile, powder-free, sterile                    |
| **2400003356704** | gloves, examination (procedure), vinyl, powder-free, sterile                      |
| **2400003356803** | gloves, examination (procedure), vinyl, powdered, sterile                         |
| **2400003356902** | guayule latex surgical gloves, powder-free                                        |
| **2400003356902** | gloves, polychloroprene, powdered                                                 |
| **2400003433108** | gloves, examination (procedural), hevea latex, powdered, sterile                  |
| **2400003492303** | gloves, examination (procedural), polyisoprene, powdered                          |
| **2400003495700** | examination (procedure) gloves, polychloroprene, powder-free, sterile             |
| **2400003495809** | examination (procedure) gloves, polychloroprene, powder-free, sterile             |
| **2400003495908** | gloves, examination (procedural), nitrile, powdered, sterile                      |
| **2400003496004** | gloves, examination (procedure), polyisoprene, powder-free, sterile               |
| **2400003496103** | gloves, examination (procedural), polyisoprene, powdered, sterile                 |
| **2400003675805** | face mask, respiratory protection, single use                                     |

This flag cannot be combined with the **weighed**, **isSerialTrackable**, **alcoholic**, **trackingType**, **onTap** features.

#### Nested entity attributes
##### Product Packaging:

| Title        | Type                                               | Description                                                                                                                                                   |
|--------------|----------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **barcodes** | Array(Object)                                      | An array of barcodes for product packaging. This array can contain at most one barcode. If there is no barcode in the array, then this field is not displayed |
| **id**       | UUID                                               | Product Package ID<br>`+Required when replying` `+Read Only`                                                                                                  |
| **quantity** | Float                                              | Quantity of products in this type of package<br>`+Required when replying` `+Required when creating`                                                           |
| **uom*       | [Meta](../#kladana-json-api-general-info-metadata) | Units metadata<br>`+Required when replying` `+Expand`                                                                                                         |

In API version 1.2, a separate resource for working with product packages was removed. Now packages are a nested collection.

In order to create a new package for this product, you need to specify it as an item in the product update request.
**packs** fields, and in its composition indicate a link in the meta format to the unit of measurement and the number of products in the package.

For product packaging, you cannot specify a reference to a unit of measure that matches the unit of measure of the product, otherwise an error will occur.
When updating packaging barcodes as part of a product update, the transferred collection of packaging barcodes completely replaces the existing one
collection.

To update the list of product packages, it is necessary to transfer a new collection of packages as part of the product update. New collection of product packaging will completely replace the old collection.

##### Product Metadata

Product Metadata contains information about additional fields.

You can view all additional Product fields created in the main interface using a request to obtain Product metadata.

The response is an object, with the following structure:

| Title            | Type          | Description                                                                                                                                 |
|------------------|---------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| **meta**         | Meta          | Metadata<br>`+Required when replying`                                                                                                       |
| **attributes**   | Array(Object) | Collection of all existing additional Product fields in [Metadata](../#kladana-json-api-general-info-metadata)<br>`+Required when replying` |
| **createShared** | Boolean       | Create new Products tagged "General"<br>`+Required when replying`                                                                           |

Structures of objects of individual collections:

##### Barcodes:
When creating a barcode, you need to describe an object with a field that is a lowercase barcode representation format with the string value of the barcode itself. The names of the fields of a separate object representing a barcode:

| Title       | Description                                                                                            |
| ----------- |--------------------------------------------------------------------------------------------------------|
| **ean13**   | barcode in EAN13 format if you want to generate an EAN13 barcode                                       |
| **ean8**    | barcode in EAN8 format if you want to generate an EAN8 barcode                                         |
| **code128** | barcode in Code128 format, if you want to generate a barcode in Code128 format                         |
| **gtin**    | barcode in GTIN format, if you want to generate a barcode in GTIN format. Validated against GS1 format |
| **upc**     | barcode in UPC format, if you want to generate a barcode in UPC format                                 |

To update the list of barcodes, it is necessary to transfer their complete list, including both old and new values.
Missing barcode values will be removed during the update. When updating the list of barcodes, only new values are validated.

Previously stored barcodes are not validated. That is, if one of the old barcodes does not meet the validation requirements, then there will be no error when updating the list.

If an empty list of barcodes or a list of empty values is passed to the input, then the previously created barcodes will be deleted.

Features of creating a list of barcodes when creating a set:

+ If you pass a list of barcodes to the input, then the received barcode values are saved, and empty values are ignored.
+ If you pass a list of empty barcode values to the input, then no barcodes will be created for the products.
+ If you do not pass the barcodes attribute to the input or pass an empty list in it, then by default one random barcode of the EAN13 type will be created for the product.

About working with Product fields can be read [here](../#kladana-json-api-general-info-additional-fields)

##### An object containing the fields of alcoholic products

| Title        | Type    | Description           |
|--------------|---------|-----------------------|
| **excise**   | Boolean | Contains excise stamp |
| **type**     | Int     | Product type code     |
| **strength** | Float   | Fortress              |
| **volume**   | Float   | Container volume      |

This object does not match the **weighed**, **isSerialTrackable**, **ppeType**, **trackingType** features unless it is marked as BEER_ALCOHOL or NOT_TRACKED.

##### Supplier of the products:

| Title    | Type                                                | Description                                                                  |
|----------|-----------------------------------------------------|------------------------------------------------------------------------------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata)  | Metadata containing a link to the vendor group.<br>`+Required when replying` |

Supplier type - Counterparty. You can see the description of the Counterparty entity [here](../dictionaries/#entities-counterparty)

##### Sales prices

| Title         | Type                                               | Description                                                                                                                           |
|---------------|----------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| **value**     | Float                                              | Price value<br>`+Required when replying`                                                                                              |
| **currency**  | [Meta](../#kladana-json-api-general-info-metadata) | Reference to the currency in the format [Metadata](../#kladana-json-api-general-info-metadata)<br>`+Required when replying` `+Expand` |
| **priceType** | Object                                             | Price type<br>`+Required when replying`                                                                                               |


##### Purchase price

| Title        | Type                                               | Description                                                                                                                           |
|--------------|----------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| **value**    | Float                                              | Price value<br>`+Required when replying`                                                                                              |
| **currency** | [Meta](../#kladana-json-api-general-info-metadata) | Reference to the currency in the format [Metadata](../#kladana-json-api-general-info-metadata)<br>`+Required when replying` `+Expand` |

##### Minimum price

| Title        | Type                                               | Description                                                                                                                           |
|--------------|----------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| **value**    | Float                                              | Price value<br>`+Required when replying`                                                                                              |
| **currency** | [Meta](../#kladana-json-api-general-info-metadata) | Reference to the currency in the format [Metadata](../#kladana-json-api-general-info-metadata)<br>`+Required when replying` `+Expand` |

##### Minimum Stock

Minimum stock is the minimum quantity of goods that must always be on hand at the warehouse. 
The `minimumStock` field is available when using the additional parameter `fields=minimumStock` or when passing the field in a create or update entity request. About working with parameter fields can be read [here](../#kladana-json-api-general-info-what-is-fields) 
Example:

+ `.../product/{product_id}?fields=minimumStock`

##### Minimum Stock type
Values for the type field.

| Value                  | Description                                 |
|------------------------|:--------------------------------------------|
| **ALL_WAREHOUSE_SUM**  | Total across all warehouses                 |
| **ALL_WAREHOUSE_SAME** | The same across all warehouses `+Read Only` |
| **WAREHOUSE_VARIED**   | Set for each warehouse                      |


Examples can be found in the sections on [retrieving](../dictionaries/#entities-product-get-a-list-of-products), [creating](../dictionaries/#entities-product-create-product)
or [updating](../dictionaries/#entities-product-change-product) products.

###### Minimum Stock Attributes with the ALL_WAREHOUSE_SUM type

| Name         | Type   | Description                                        |
|--------------|:-------|:---------------------------------------------------|
| **type**     | String | Type of Minimum Stock                              |
| **quantity** | Double | Total Minimum Stock quantity across all warehouses |


###### Minimum Stock Attributes with the ALL_WAREHOUSE_SAME type

| Name         | Type   | Description                                                            |
|--------------|:-------|:-----------------------------------------------------------------------|
| **type**     | String | Type of Minimum Stock<br> `+Read Only`                                 |
| **quantity** | Double | Minimum Stock quantity is the same for every warehouse<br>`+Read Only` |


###### Minimum Stock Attributes with the WAREHOUSE_VARIED type

| Name              | Type      | Description                                   |
|-------------------|:----------|:----------------------------------------------|
| **type**          | String    | Type of Minimum Stock                         |
| **storebalances** | MetaArray | Minimum Stock quantity set for each warehouse |


Object structure in the **storeBalances** collection:

| Name         | Type                                               | Description                                               |
|--------------|:---------------------------------------------------|:----------------------------------------------------------|
| **meta**     | [Meta](../#kladana-json-api-general-info-metadata) | Metadata for Minimum Stock                                |
| **store**    | [Meta](../#kladana-json-api-general-info-metadata) | Metadata for the warehouse where the Minimum Stock is set |
| **quantity** | Double                                             | Minimum Stock quantity for the warehouse                  |



To [create](../dictionaries/#entities-product-create-product) or [update](../dictionaries/#entities-product-change-product) Minimum Stock for a warehouse (or warehouses), you 
can include the Minimum Stock with the warehouse and quantity details in the request body 
when creating or updating a product. There are also separate resources for managing Minimum Stock by warehouse:

+ Get list (`/entity/product/{product_id}/storebalances`)
+ Get object (`/entity/product/{product_id}/storebalances/{minimumstock_id}`)
+ Create (`/entity/product/{product_id}/storebalances`)
+ Update (`/entity/product/{product_id}/storebalances/{minimumstock_id}`)
+ Delete (`/entity/product/{product_id}/storebalances/{minimumstock_id}`)
+ Bulk deletion (`/entity/product/{product_id}/storebalances/{minimumstock_id}`)

##### Image: structure and loading.
When requesting a Product with images, a json representation of this Product will be displayed containing the **images** field. This field is
an array of elements. Field elements **images** have fields:

| Title         | Type                                               | Description                                             |
|---------------|----------------------------------------------------|---------------------------------------------------------|
| **filename**  | String(255)                                        | File name<br>`+Required when replying`                  |
| **meta**      | [Meta](../#kladana-json-api-general-info-metadata) | Object metadata<br>`+Required when replying`            |
| **miniature** | [Meta](../#kladana-json-api-general-info-metadata) | Image thumbnail metadata<br>`+Required when replying`   |
| **size**      | Int                                                | File size in bytes<br>`+Required when replying`         |
| **tiny**      | [Meta](../#kladana-json-api-general-info-metadata) | Thumbnail metadata<br>`+Required when replying`         |
| **title**     | String(255)                                        | Image Title<br>`+Required when replying`                |
| **updated**   | DateTime                                           | File upload time to server<br>`+Required when replying` |

#### Uploading

To upload images, you need in the body of the request to [create](../dictionaries/#entities-product-create-product) or [update](../dictionaries/#entities-product-change-product) of the product
specify the **images** field with a list of elements that have the following attributes:

| Title        | Description                                          |
|--------------|------------------------------------------------------|
| **filename** | filename with extension . For example - "banana.png" |
| **content**  | Base64 encoded image.                                |

If in the update request **images** contains an empty array of elements, then all Images of the Product will be deleted,
because the server will assume that the user wants to update the list of Product Images.

The API documentation for working with Images can be found in the [Image](../dictionaries/#entities-image) chapter.

##### Item Group

| Title    | Type                                               | Description                                                                   |
|----------|----------------------------------------------------|-------------------------------------------------------------------------------|
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata containing a link to the Product group.<br>`+Required when replying` |

You can see the description of the Group entity [here](../dictionaries/#entities-product-group)
Updating this attribute will also update the **pathName** attribute.

##### Weight item

| Title       | Type    | Description                                                                                                                           |
|-------------|---------|---------------------------------------------------------------------------------------------------------------------------------------|
| **weighed** | Boolean | A field indicating whether the item is a weight item. If its value is false, the field is not displayed.<br>`+Required when replying` |

This mark cannot be combined with the **onTap**, **isSerialTrackable**, **ppeType**, **alcoholic** features. Labeling of weight items is only supported for type **MILK**.

##### Draft products

| Title | Type | Description |
| ---------| ------- |------- |
| **onTap** | Boolean | A field indicating whether the product is draft. If its value is false, the field is not displayed.<br>`+Required when replying` |

This mark cannot be combined with the **weighed**, **isSerialTrackable**, **ppeType** features. Draft labeling is only supported for **MILK**, **PERFUMERY** types.

##### Features of filtering the archived field
If filtering by the **id** and **archived** fields is performed at the same time, then the filtering by the **archived** field is not taken into account.


### Get a list of Products
Request to receive all Products for this account.
Result: JSON object including fields:

| Title | Type | Description |
| ---------| ------- |--------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing Products. |

**Parameters**

| Parameter | Description |
| ---------| ------- |
| **limit** | `number` (optional)lt: 1000** *Example: 1000* The maximum number of entities to extract.` Valid values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get a list of Products

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/product"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Products.
  
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
     "href": "https://api.kladana.com/api/remap/1.2/entity/product/",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
     "type": "product",
     "mediaType": "application/json",
     "size": 5,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/26b36824-2c83-11e6-8a84-bae50000001b",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "id": "26b36824-2c83-11e6-8a84-bae50000001b",
       "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
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
       "updated": "2016-06-07 10:40:48",
       "name": "Pumpkin",
       "description": "Pumpkin, Germany",
       "code": "pumpkin1",
       "externalCode": "456pumpkin",
       "archived": false,
       "pathName": "",
       "vat": 18,
       "vatEnabled": true,
       "useParentVat": false,
       "effectiveVat": 18,
       "effectiveVatEnabled": true,
       "discountProhibited": false,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         }
       },
       "images": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/26b36824-2c83-11e6-8a84-bae50000001b/images",
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
             "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "salePrices": [
         {
           "value": 3353.0,
           "currency": {
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
               "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
               "type": "currency",
               "mediaType": "application/json"
             }
           },
           "priceType": {
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
               "type": "pricetype",
               "mediaType": "application/json"
             },
             "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
             "name": "Sale price",
             "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
           }
         },
         {
           "value": 3253,
           "currency": {
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
               "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
               "type": "currency",
               "mediaType": "application/json"
             }
           },
           "priceType": {
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
               "type": "pricetype",
               "mediaType": "application/json"
             },
             "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
             "name": "Price for friends",
             "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
           }
         }
       ],
       "supplier": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/6313d1e7-2c7f-11e6-8a84-bae500000051",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "attributes": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/0c2e54cd-2c80-11e6-8a84-bae50000009c",
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
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/0c2e5dc5-2c80-11e6-8a84-bae50000009d",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "0c2e5dc5-2c80-11e6-8a84-bae50000009d",
           "name": "Manufacturer",
           "type": "string",
           "value": "farm \"Petrovich\""
         }
       ],
       "buyPrice": {
         "value": 54.0,
         "currency": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "article": "Ar23",
       "weight": 200,
       "volume": 300,
       "variantsCount": 0,
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
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/d950551c-2c7f-11e6-8a84-bae50000000b",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "id": "d950551c-2c7f-11e6-8a84-bae50000000b",
       "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
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
       "updated": "2016-06-07 10:45:16",
       "name": "Bananas",
       "description": "Bananas, Africa",
       "code": "one1",
       "externalCode": "456",
       "archived": false,
       "pathName": "",
       "vat": 18,
       "vatEnabled": true,
       "useParentVat": false,
       "effectiveVat": 18,
       "effectiveVatEnabled": true,
       "discountProhibited": false,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         }
       },
       "images": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/d950551c-2c7f-11e6-8a84-bae50000000b/images",
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
             "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "salePrices": [
         {
           "value": 346347237000.0,
           "currency": {
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
               "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
               "type": "currency",
               "mediaType": "application/json"
             }
           },
           "priceType": {
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
               "type": "pricetype",
               "mediaType": "application/json"
             },
             "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
             "name": "Sale price",
             "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
           }
         },
         {
           "value": 100,
           "currency": {
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
               "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
               "type": "currency",
               "mediaType": "application/json"
             }
           },
           "priceType": {
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
               "type": "pricetype",
               "mediaType": "application/json"
             },
             "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
             "name": "Price for friends",
             "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
           }
         }
       ],
       "supplier": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/6313d1e7-2c7f-11e6-8a84-bae500000051",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "attributes": [
         {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/0c2e54cd-2c80-11e6-8a84-bae50000009c",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "0c2e54cd-2c80-11e6-8a84-bae50000009c",
           "name": "Export",
           "type": "boolean",
           "value": false
         }
       ],
       "buyPrice": {
         "value": 23553000.0,
         "currency": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "article": "Ar23",
       "weight": 200,
       "volume": 300,
       "packs": [
         {
           "id": "c6bdee6f-2c83-11e6-8a84-bae5000000a4",
           "uom": {
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6b91d63-2c83-11e6-8a84-bae5000000a1",
               "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
               "type": "uom",
               "mediaType": "application/json"
             }
           },
           "quantity": 35
         },
         {
           "id": "c6bdf693-2c83-11e6-8a84-bae5000000a5",
           "uom": {
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
               "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
               "type": "uom",
               "mediaType": "application/json"
             }
           },
           "quantity": 2000
         }
       ],
       "variantsCount": 0,
       "isSerialTrackable": true,
       "things": [
         "F564X056",
         "F564X057"
       ],
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
       "trackingType": "NOT_TRACKED",
       "taxSystem": "GENERAL_TAX_SYSTEM"
     },
{
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/26b36824-2c83-11e6-8a84-bae50000031b",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
         "type": "product",
         "mediaType": "application/json"
       },
       "id": "26b36824-2c83-11e6-8a84-bae50000031b",
       "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
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
       "updated": "2016-06-07 10:40:48",
       "name": "Mask",
       "description": "Mask, Hygienic",
       "code": "mask1",
       "externalCode": "mask4433",
       "archived": false,
       "pathName": "",
       "vat": 20,
       "vatEnabled": true,
       "useParentVat": false,
       "effectiveVat": 20,
       "effectiveVatEnabled": true,
       "discountProhibited": false,
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         }
       },
       "salePrices": [
         {
           "value": 2600.0,
           "currency": {
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000255",
               "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
               "type": "currency",
               "mediaType": "application/json"
             }
           },
           "priceType": {
             "meta": {
               "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f23fd",
               "type": "pricetype",
               "mediaType": "application/json"
             },
             "id": "672559f1-cbf3-11e1-9eb9-889ffa6f23fd",
             "name": "Sale price",
             "externalCode": "cbcf493b-55bc-11d9-848a-00113333529a"
           }
         }
       ],
       "buyPrice": {
         "value": 12.0,
         "currency": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500002255",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         }
       },
       "article": "kk212k",
       "weight": 1,
       "volume": 1,
       "variantsCount": 0,
       "barcodes": [
         {
           "ean13": "2000000000000"
         }
       ],
       "ppeType" : "2400001323807"
     }
   ]
}
```

> Get a list of Products with the Minimum Stock displayed

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/product?fields=minimumStock"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the list of Products with the Minimum Stock displayed.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/product/?fields=minimumStock",
    "type": "product",
    "mediaType": "application/json",
    "size": 3,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/15007028-137a-11f0-ac15-001100000008",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#good/edit?id=14ff096e-137a-11f0-ac15-001100000006"
      },
      "id": "15007028-137a-11f0-ac15-001100000008",
      "accountId": "762af84a-0ec6-11f0-ac15-001000000001",
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/762c4293-0ec6-11f0-ac15-001000000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2025-04-07 09:33:42.574",
      "name": "Potato",
      "externalCode": "CKZHMt1FgJgYEoLogvpi40",
      "archived": false,
      "pathName": "",
      "useParentVat": true,
      "images": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/15007028-137a-11f0-ac15-001100000008/images",
          "type": "image",
          "mediaType": "application/json",
          "size": 0,
          "limit": 1000,
          "offset": 0
        }
      },
      "minPrice": {
        "value": 0,
        "currency": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/77a29ae9-0ec6-11f0-ac15-0012000000a4",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#currency/edit?id=77a29ae9-0ec6-11f0-ac15-0012000000a4"
          }
        }
      },
      "salePrices": [
        {
          "value": 0,
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/77a29ae9-0ec6-11f0-ac15-0012000000a4",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json",
              "uuidHref": "https://api.kladana.com/app/#currency/edit?id=77a29ae9-0ec6-11f0-ac15-0012000000a4"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/77f67b4c-0ec6-11f0-ac15-0012000000a5",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "77f67b4c-0ec6-11f0-ac15-0012000000a5",
            "name": "Sale price",
            "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
          }
        }
      ],
      "buyPrice": {
        "value": 0,
        "currency": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/77a29ae9-0ec6-11f0-ac15-0012000000a4",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#currency/edit?id=77a29ae9-0ec6-11f0-ac15-0012000000a4"
          }
        }
      },
      "paymentItemType": "GOOD",
      "discountProhibited": false,
      "weight": 0,
      "volume": 0,
      "minimumBalance": 10,
      "variantsCount": 0,
      "isSerialTrackable": false,
      "trackingType": "NOT_TRACKED",
      "files": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/15007028-137a-11f0-ac15-001100000008/files",
          "type": "files",
          "mediaType": "application/json",
          "size": 0,
          "limit": 1000,
          "offset": 0
        }
      },
      "minimumStock": {
        "type": "ALL_WAREHOUSE_SUM",
        "quantity": 10
      }
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/291872e6-137a-11f0-ac15-00110000000f",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#good/edit?id=29185f80-137a-11f0-ac15-00110000000d"
      },
      "id": "291872e6-137a-11f0-ac15-00110000000f",
      "accountId": "762af84a-0ec6-11f0-ac15-001000000001",
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/762c4293-0ec6-11f0-ac15-001000000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2025-04-07 09:33:04.460",
      "name": "Potato",
      "code": "1",
      "externalCode": "3mFqwJgqhuIuGeP0Vsqzh3",
      "archived": false,
      "pathName": "",
      "useParentVat": true,
      "images": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/291872e6-137a-11f0-ac15-00110000000f/images",
          "type": "image",
          "mediaType": "application/json",
          "size": 0,
          "limit": 1000,
          "offset": 0
        }
      },
      "minPrice": {
        "value": 0,
        "currency": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/77a29ae9-0ec6-11f0-ac15-0012000000a4",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#currency/edit?id=77a29ae9-0ec6-11f0-ac15-0012000000a4"
          }
        }
      },
      "salePrices": [
        {
          "value": 0,
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/77a29ae9-0ec6-11f0-ac15-0012000000a4",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json",
              "uuidHref": "https://api.kladana.com/app/#currency/edit?id=77a29ae9-0ec6-11f0-ac15-0012000000a4"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/77f67b4c-0ec6-11f0-ac15-0012000000a5",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "77f67b4c-0ec6-11f0-ac15-0012000000a5",
            "name": "Sale price",
            "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
          }
        }
      ],
      "buyPrice": {
        "value": 0,
        "currency": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/77a29ae9-0ec6-11f0-ac15-0012000000a4",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#currency/edit?id=77a29ae9-0ec6-11f0-ac15-0012000000a4"
          }
        }
      },
      "paymentItemType": "GOOD",
      "discountProhibited": false,
      "weight": 0,
      "volume": 0,
      "variantsCount": 0,
      "isSerialTrackable": false,
      "trackingType": "NOT_TRACKED",
      "files": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/291872e6-137a-11f0-ac15-00110000000f/files",
          "type": "files",
          "mediaType": "application/json",
          "size": 0,
          "limit": 1000,
          "offset": 0
        }
      },
      "minimumStock": {
        "type": "ALL_WAREHOUSE_SAME",
        "quantity": 5
      }
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/3bdfdb5b-137a-11f0-ac15-001100000018",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#good/edit?id=3bdfb95e-137a-11f0-ac15-001100000016"
      },
      "id": "3bdfdb5b-137a-11f0-ac15-001100000018",
      "accountId": "762af84a-0ec6-11f0-ac15-001000000001",
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/762c4293-0ec6-11f0-ac15-001000000002",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2025-04-07 09:33:35.954",
      "name": "Potato",
      "code": "00005",
      "externalCode": "jIWckEqShIHKVVLBacIy02",
      "archived": false,
      "pathName": "",
      "useParentVat": true,
      "images": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/3bdfdb5b-137a-11f0-ac15-001100000018/images",
          "type": "image",
          "mediaType": "application/json",
          "size": 0,
          "limit": 1000,
          "offset": 0
        }
      },
      "minPrice": {
        "value": 0,
        "currency": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/77a29ae9-0ec6-11f0-ac15-0012000000a4",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#currency/edit?id=77a29ae9-0ec6-11f0-ac15-0012000000a4"
          }
        }
      },
      "salePrices": [
        {
          "value": 0,
          "currency": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/currency/77a29ae9-0ec6-11f0-ac15-0012000000a4",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
              "type": "currency",
              "mediaType": "application/json",
              "uuidHref": "https://api.kladana.com/app/#currency/edit?id=77a29ae9-0ec6-11f0-ac15-0012000000a4"
            }
          },
          "priceType": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/77f67b4c-0ec6-11f0-ac15-0012000000a5",
              "type": "pricetype",
              "mediaType": "application/json"
            },
            "id": "77f67b4c-0ec6-11f0-ac15-0012000000a5",
            "name": "Sale price",
            "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
          }
        }
      ],
      "buyPrice": {
        "value": 0,
        "currency": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/77a29ae9-0ec6-11f0-ac15-0012000000a4",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
            "type": "currency",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#currency/edit?id=77a29ae9-0ec6-11f0-ac15-0012000000a4"
          }
        }
      },
      "paymentItemType": "GOOD",
      "discountProhibited": false,
      "weight": 0,
      "volume": 0,
      "variantsCount": 0,
      "isSerialTrackable": false,
      "trackingType": "NOT_TRACKED",
      "files": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/3bdfdb5b-137a-11f0-ac15-001100000018/files",
          "type": "files",
          "mediaType": "application/json",
          "size": 0,
          "limit": 1000,
          "offset": 0
        }
      },
      "minimumStock": {
        "type": "WAREHOUSE_VARIED",
        "storebalances": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/product/3bdfdb5b-137a-11f0-ac15-001100000018/storebalances",
            "type": "minimumstock",
            "mediaType": "application/json",
            "size": 1,
            "limit": 1000,
            "offset": 0
          }
        }
      }
    }
  ]
}
```
### Create Product
Create a new Product.
#### Description
The product is created based on the passed JSON object,
which contains the introduction of a new Product.
The result is a JSON representation of the created Product. To create a new Product,
it is necessary and sufficient to specify a non-empty `name` field in the passed object.
If you want to create an alcoholic product, then in the request body, you need to pass
an **alcoholic** object that has at least one of the following characteristics:

| Title | Description |
| ------------------------------ | --------------------- |
| **excise** | Contains excise stamp |
| **type** | Product type code |
| **strength** | Fortress |
| **volume** | Tare volume |


Will be passed with a value. Otherwise, when passing an empty **alcoholic** object,
it will be ignored, and the product will be created without the label "Alcoholic products".

When creating a Product with a specified array of barcodes, for each barcode, you must specify what type the barcode belongs to.
For example, to create a barcode of type Code 128, a JSON object with a code128 field with the value of the barcode must be added to the array of barcodes.

> An example of the most complete request in terms of the number of fields.
  
   ```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/product"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "Bananas",
            "code": "one1",
            "externalCode": "456",
            "description": "Bananas, Africa",
            "vat": 18,
            "effectiveVat": 18,
            "discountProhibited": false,
            "uom": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
                    "type": "uom",
                    "mediaType": "application/json"
                }
            },
            "supplier": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/2b5095a4-296b-11e6-8a84-bae500000051",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                    "type": "counterparty",
                    "mediaType": "application/json"
                }
            },
            "minPrice": {
                "value": 500.0,
                "currency": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                        "type": "currency",
                        "mediaType": "application/json"
                    }
                }
            },
            "buyPrice": {
                "value": 23553000.0,
                "currency": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/2b50da23-296b-11e6-8a84-bae500000055",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                        "type": "currency",
                        "mediaType": "application/json"
                    }
                }
            },
            "salePrices": [
                {
                    "value": 346347237000.0,
                    "currency": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/2b50da23-296b-11e6-8a84-bae500000055",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                            "type": "currency",
                            "mediaType": "application/json"
                        }
                    },
                    "priceType": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
                            "type": "pricetype",
                            "mediaType": "application/json"
                        }
                    }
                },
                {
                    "value": 100,
                    "currency": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/2b50da23-296b-11e6-8a84-bae500000055",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                            "type": "currency",
                            "mediaType": "application/json"
                        }
                    },
                    "priceType": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
                            "type": "pricetype",
                            "mediaType": "application/json"
                        }
                    }
                }
            ],
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
            "article": "Ar23",
            "weight": 200,
            "volume": 300,
            "packs": [
                {
                    "uom": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/uom/2ec1170c-3f69-4409-87bb-c68e0011b275",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
                            "type": "uom",
                            "mediaType": "application/json"
                        }
                    },
                    "quantity": 2
                }
            ],
            "isSerialTrackable": false,
            "trackingType": "NOT_TRACKED"
        }'
   ```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Product.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/product/a355f431-29a1-11e6-8a84-bae500000009",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
     "type": "product",
     "mediaType": "application/json"
   },
   "id": "a355f431-29a1-11e6-8a84-bae500000009",
   "accountId": "2aa3f5df-296b-11e6-8a84-bae500000001",
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
   "updated": "2016-06-03 18:41:28",
   "name": "Bananas",
   "description": "Bananas, Africa",
   "code": "one1",
   "externalCode": "456",
   "archived": false,
   "pathName": "",
   "vat": 18,
   "vatEnabled": true,
   "useParentVat": false,
   "effectiveVat": 18,
   "effectiveVatEnabled": true,
   "discountProhibited": false,
   "uom": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
       "type": "uom",
       "mediaType": "application/json"
     }
   },
   "images": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/a355f431-29a1-11e6-8a84-bae500000009/images",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "salePrices": [
     {
       "value": 346347237000.0,
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/2b50da23-296b-11e6-8a84-bae500000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
         "name": "Sale price",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
       }
     },
     {
       "value": 100,
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/2b50da23-296b-11e6-8a84-bae500000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
         "name": "Price for friends",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
       }
     }
   ],
   "supplier": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/2b5095a4-296b-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "buyPrice": {
     "value": 23553000.0,
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/2b50da23-296b-11e6-8a84-bae500000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "article": "Ar23",
   "weight": 200,
   "volume": 300,
   "packs": [
     {
       "id": "a97af44b-8b46-11e8-56c0-00080000000d",
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/2ec1170c-3f69-4409-87bb-c68e0011b275",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         }
       },
       "quantity": 2
     }
   ],
   "isSerialTrackable": false,
   "trackingType": "NOT_TRACKED"
}
```

> An example of a request to create a Product with the only required field.
  
   ```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/product"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "Tangerines"
           }'
   ```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Product.
  
   ```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/product/04996e84-29a1-11e6-8a84-bae500000002",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
     "type": "product",
     "mediaType": "application/json"
   },
   "id": "04996e84-29a1-11e6-8a84-bae500000002",
   "accountId": "2aa3f5df-296b-11e6-8a84-bae500000001",
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
   "images": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/04996e84-29a1-11e6-8a84-bae500000002/images",
       "type": "image",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "salePrices": [
     {
       "value": 346347237000.0,
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/2b50da23-296b-11e6-8a84-bae500000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
         "name": "Sale price",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
       }
     },
     {
       "value": 100,
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/2b50da23-296b-11e6-8a84-bae500000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
         "name": "Price for friends",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
       }
     }
   ],
   "updated": "2016-06-03 18:37:02",
   "name": "Tangerines",
   "code": "00003",
   "externalCode": "Cf0ehavIglre6sMX-J2rR2",
   "archived": false,
   "pathName": "",
   "weight": 0,
   "volume": 0,
   "isSerialTrackable": false,
   "trackingType": "NOT_TRACKED",
   "vatEnabled": false,
   "useParentVat": true
}
```

> An example of a request to create a Product with additional fields.
  
   ```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/product"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "Pumpkin",
            "code": "pumpkin1",
            "externalCode": "456pumpkin",
            "description": "Pumpkin, Germany",
            "vat": 18,
            "effectiveVat": 18,
            "uom": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
                    "type": "uom",
                    "mediaType": "application/json"
                }
            },
            "supplier": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/6313d1e7-2c7f-11e6-8a84-bae500000051",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                    "type": "counterparty",
                    "mediaType": "application/json"
                }
            },
            "minPrice": {
                "value": 500.0,
                "currency": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                        "type": "currency",
                        "mediaType": "application/json"
                    }
                }
            },
            "buyPrice": {
                "value": 54.0,
                "currency": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                        "type": "currency",
                        "mediaType": "application/json"
                    }
                }
            },
            "salePrices": [
                {
                    "value": 3353.0,
                    "currency": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                            "type": "currency",
                            "mediaType": "application/json"
                        }
                    },
                    "priceType": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
                            "type": "pricetype",
                            "mediaType": "application/json"
                        }
                    }
                },
                {
                    "value": 3253,
                    "currency": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                            "type": "currency",
                            "mediaType": "application/json"
                        }
                    },
                    "priceType": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
                            "type": "pricetype",
                            "mediaType": "application/json"
                        }
                    }
                }
            ],
            "article": "Ar23",
            "weight": 200,
            "volume": 300,
            "attributes": [
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/0c2e54cd-2c80-11e6-8a84-bae50000009c",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "name": "Export",
                    "value": true
                },
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/0c2e5dc5-2c80-11e6-8a84-bae50000009d",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "name": "Manufacturer",
                    "value": "farm \"Petrovich\" "
                },
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/0f1e750e-e1b2-11e7-9464-e4de00000003",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "name": "not strange attribute name",
                    "type": "file",
                    "file": {
                        "filename": "filename",
                        "content": "5cYwMpOmNk5kSVr4YgZGKtXJb/7KpHVLDUawyZrD5Nf0WDhB7mS1I77VcAMqYQ8DkP/1wDLhb0X6b2JO4pdpKA=="
                    }
                }
            ]
        }'
   ```
  
> Response 200(application/json)
Successful request. The result is a JSON representation of the created Product.
 
```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/product/26b36824-2c83-11e6-8a84-bae50000001b",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
     "type": "product",
     "mediaType": "application/json"
   },
   "id": "26b36824-2c83-11e6-8a84-bae50000001b",
   "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
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
   "updated": "2016-06-07 10:40:48",
   "name": "Pumpkin",
   "description": "Pumpkin, Germany",
   "code": "pumpkin1",
   "externalCode": "456pumpkin",
   "archived": false,
   "pathName": "",
   "vat": 18,
   "vatEnabled": true,
   "useParentVat": false,
   "effectiveVat": 18,
   "effectiveVatEnabled": true,
   "discountProhibited": false,
   "uom": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
       "type": "uom",
       "mediaType": "application/json"
     }
   },
   "images": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/26b36824-2c83-11e6-8a84-bae50000001b/images",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "salePrices": [
     {
       "value": 3353.0,
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
         "name": "Sale price",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
       }
     },
     {
       "value": 3253,
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
         "name": "Price for friends",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
       }
     }
   ],
   "supplier": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/6313d1e7-2c7f-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/0c2e54cd-2c80-11e6-8a84-bae50000009c",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/0c2e5dc5-2c80-11e6-8a84-bae50000009d",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "0c2e5dc5-2c80-11e6-8a84-bae50000009d",
       "name": "Manufacturer",
       "type": "string",
       "value": "farm \"Petrovich\""
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/0f1e750e-e1b2-11e7-9464-e4de00000003",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "0f1e750e-e1b2-11e7-9464-e4de00000003",
       "name": "not strange attribute name",
       "type": "file",
       "value": "filename",
       "download": {
         "href": "https://api.kladana.com/api/remap/1.2/download/00664f3a-e3da-11e7-9464-e4de00000000",
         "mediaType": "application/octet-stream"
       }
     }
   ],
   "buyPrice": {
     "value": 54.0,
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "article": "Ar23",
   "weight": 200,
   "volume": 300,
   "isSerialTrackable": false,
   "trackingType": "NOT_TRACKED"
}
```

> An example of a request to create a Product with an image upload.
  
  ```shell
  curl -X POST
    "https://api.kladana.com/api/remap/1.2/entity/product"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "name": "testimage",
            "images": [
              {
                "filename": "birdimage.png",
                "content": "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"
              }
            ]
          }'  
  ```
  
> Response 200 (application/json)
Successful request. The result is a JSON representation of the created Product with an image.
  
   ```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
     "type": "product",
     "mediaType": "application/json"
   },
   "id": "bd1c0a3e-95ee-11e6-8a84-bae500000004",
   "accountId": "b8b74698-9128-11e6-8a84-bae500000001",
   "owner": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/b905bfb0-9128-11e6-8a84-bae50000002a",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "shared": true,
   "group": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/group/b8ba0d3f-9128-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2016-10-19 14:25:28",
   "name": "testimage",
   "code": "00006",
   "externalCode": "0bmPIvHxgEDlNIZrZ6GLt2",
   "archived": false,
   "pathName": "",
   "images": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/bd1c0a3e-95ee-11e6-8a84-bae500000004/images",
       "type": "image",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   },
   "minPrice": {
     "value": 500.0,
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "salePrices": [
     {
       "value": 0.0,
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
         "name": "Sale price",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
       }
     }
   ],
   "buyPrice": {
     "value": 0.0
   },
   "weight": 0,
   "volume": 0,
   "barcodes": [
     {
       "ean13": "2000000000107"
     }
   ],
   "variantsCount": 0,
   "isSerialTrackable": false,
   "trackingType": "NOT_TRACKED",
   "vatEnabled": false,
   "useParentVat": true
}
```
> Example of a request to create a Product with the Minimum Stock field populated.

  ```shell
  curl -X POST
    "https://api.kladana.com/api/remap/1.2/entity/product"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "name": "Potato",
            "minimumStock": {
              "type": "ALL_WAREHOUSE_SUM",
              "quantity": 10
            }
          }'  
  ```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the created Product with Minimum Stock.

  ```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/product/15007028-137a-11f0-ac15-001100000008",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
    "type": "product",
    "mediaType": "application/json",
    "uuidHref": "https://api.kladana.com/app/#good/edit?id=14ff096e-137a-11f0-ac15-001100000006"
  },
  "id": "15007028-137a-11f0-ac15-001100000008",
  "accountId": "762af84a-0ec6-11f0-ac15-001000000001",
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/762c4293-0ec6-11f0-ac15-001000000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2025-04-07 09:33:42.574",
  "name": "Potato",
  "externalCode": "CKZHMt1FgJgYEoLogvpi40",
  "archived": false,
  "pathName": "",
  "useParentVat": true,
  "images": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/15007028-137a-11f0-ac15-001100000008/images",
      "type": "image",
      "mediaType": "application/json",
      "size": 0,
      "limit": 1000,
      "offset": 0
    }
  },
  "minPrice": {
    "value": 0,
    "currency": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/77a29ae9-0ec6-11f0-ac15-0012000000a4",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=77a29ae9-0ec6-11f0-ac15-0012000000a4"
      }
    }
  },
  "salePrices": [
    {
      "value": 0,
      "currency": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/currency/77a29ae9-0ec6-11f0-ac15-0012000000a4",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
          "type": "currency",
          "mediaType": "application/json",
          "uuidHref": "https://api.kladana.com/app/#currency/edit?id=77a29ae9-0ec6-11f0-ac15-0012000000a4"
        }
      },
      "priceType": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/77f67b4c-0ec6-11f0-ac15-0012000000a5",
          "type": "pricetype",
          "mediaType": "application/json"
        },
        "id": "77f67b4c-0ec6-11f0-ac15-0012000000a5",
        "name": "Sale price",
        "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
      }
    }
  ],
  "buyPrice": {
    "value": 0,
    "currency": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/77a29ae9-0ec6-11f0-ac15-0012000000a4",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
        "type": "currency",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#currency/edit?id=77a29ae9-0ec6-11f0-ac15-0012000000a4"
      }
    }
  },
  "paymentItemType": "GOOD",
  "discountProhibited": false,
  "weight": 0,
  "volume": 0,
  "minimumBalance": 10,
  "variantsCount": 0,
  "isSerialTrackable": false,
  "trackingType": "NOT_TRACKED",
  "files": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/15007028-137a-11f0-ac15-001100000008/files",
      "type": "files",
      "mediaType": "application/json",
      "size": 0,
      "limit": 1000,
      "offset": 0
    }
  },
  "minimumStock": {
    "type": "ALL_WAREHOUSE_SUM",
    "quantity": 10
  }
}
```

### Products bulk creation and update
[Products bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects).
In the body of the request, you need to pass an array containing the JSON representation of the products that you want to create or update.
Updated products must contain the identifier in the form of metadata.

> Example of creating and updating multiple products
  
```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/product
"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "Tangerines"
             },
             {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/product/26b36824-2c83-11e6-8a84-bae50000001b",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                 "type": "product",
                 "mediaType": "application/json"
               },
               "name": "Rotabaga",
               "description": "Rotabaga, Brussels"
             }
           ]'
   ```

> Response 200(application/json)
Successful request. The result is a JSON array of created and updated product representations.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/04996e84-29a1-11e6-8a84-bae500000002",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
       "type": "product",
       "mediaType": "application/json"
     },
     "id": "04996e84-29a1-11e6-8a84-bae500000002",
     "accountId": "2aa3f5df-296b-11e6-8a84-bae500000001",
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
    
     "salePrices": [
       {
         "value": 3653,
         "currency": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
             "type": "currency",
             "mediaType": "application/json"
           }
         },
         "priceType": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
             "type": "pricetype",
             "mediaType": "application/json"
           },
           "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
           "name": "Price for friends",
           "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
         }
       }
     ],
     "supplier": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/6313f1eb-2c7f-11e6-8a84-bae500000053",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
         "type": "counterparty",
         "mediaType": "application/json"
       }
     },
     "attributes": [
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/0c2e54cd-2c80-11e6-8a84-bae50000009c",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "0c2e54cd-2c80-11e6-8a84-bae50000009c",
         "name": "Export",
         "type": "boolean",
         "value": false
       },
       {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/0c2e5dc5-2c80-11e6-8a84-bae50000009d",
           "type": "attributemetadata",
           "mediaType": "application/json"
         },
         "id": "0c2e5dc5-2c80-11e6-8a84-bae50000009d",
         "name": "Manufacturer",
         "type": "string",
         "value": "Kolkhoz \"Ivanovo\""
       }
     ],
     "country": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/country/0238a888-c602-4e78-a199-d8f49c4d6c18",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type": "country",
         "mediaType": "application/json"
       }
     },
     "buyPrice": {
       "value": 54.0,
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       }
     },
     "article": "Ar23",
     "weight": 100,
     "volume": 400,
     "packs": [
       {
         "id": "354ba98c-2cb9-11e6-8a84-bae5000000e3",
         "uom": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/uom/2d1fdd55-d935-4d55-80d4-f6904b62ff46",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
             "type": "uom",
             "mediaType": "application/json"
           }
         },
         "quantity": 40
       },
       {
         "id": "354ba98c-2cb9-11e6-8a84-bae5000004e3",
         "uom": {
           "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/uom/0dd4fe8b-e59e-486e-bde5-b52fe0e25415",
             "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
             "type": "uom",
             "mediaType": "application/json"
           }
         },
         "quantity": 101
       }
     ],
     "barcodes": [
       {
         "code128": "code128barcode"
       }
     ],
     "alcoholic": {
       "excise": true,
       "type": 3100,
       "strength": 0.6,
       "volume": 1.5
     },
     "isSerialTrackable": false,
     "trackingType": "NOT_TRACKED"
   }
]

```


### Delete Item

**Parameters**

| Parameter | Description |
| ---------| ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product id. |
 
> Request to remove the Product with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of the Product.

### Bulk removal of Products

In the body of the request, you need to pass an array containing the JSON metadata of the Products you want to delete.


> Request for bulk deletion of Products.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/product/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H"Content-Type: application/json"
   -d'[
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b1",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                  "type": "product",
                  "mediaType": "application/json"
              }
          },
          {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b2",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                  "type": "product",
                  "mediaType": "application/json"
              }
          }
      ]'
```

> Successful request. The result is JSON information about the removal of the Products.

```json
[
   {
     "info":"Entity 'product' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'product' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```


### Item Metadata
#### Product Metadata
Request for obtaining metadata of Products, Bundles and Services. The result is a JSON object including:

| Title | Description |
| ---------| ------- |
| **meta** | Metadata |
| **attributes** | Array metadata fields of Products |
| **createShared** | Create new bundles with the "General" lable|

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

> Product Metadata

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/product/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional Product fields.
  
```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/product",
     "mediaType": "application/json"
   },
   "attributes": {
         "meta": {
             "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes",
             "type": "attributemetadata",
             "mediaType": "application/json",
             "size": 2,
             "limit": 1000,
             "offset": 0
         }
     },
   "createShared": true
}
```

### Separate additional field

**Parameters**

| Parameter | Description |
| ---------| ------- |
| **id** | `7944ef04-f831-11e5-7a69-971500188b19` (required, string) - Extra fields ID |

#### Separate additional field
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate additional fields.
  
```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/3cd83619-5585-11e6-8a84-bae500000069",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "customEntityMeta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/customentity/a27aa372-5311-11e6-8a84-bae500000001/metadata",
     "type": "customentitymetadata",
     "mediaType": "application/json"
   },
   "id": "3cd83619-5585-11e6-8a84-bae500000069",
   "name": "Related Entity",
   "type": "customentity",
   "required": false
}
```

### Product
A product that is accessed by its ID value.

### Get Item

**Parameters**

| Parameter | Description |
| ---------| ------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Product id. |

> Request to receive the Products with the specified id.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Product.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/product/d950551c-2c7f-11e6-8a84-bae50000000b",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
     "type": "product",
     "mediaType": "application/json"
   },
   "id": "d950551c-2c7f-11e6-8a84-bae50000000b",
   "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
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
   "updated": "2016-06-07 10:45:16",
   "name": "Bananas",
   "description": "Bananas, Africa",
   "code": "one1",
   "externalCode": "456",
   "archived": false,
   "pathName": "",
   "vat": 18,
   "vatEnabled": true,
   "useParentVat": false,
   "effectiveVat": 18,
   "effectiveVatEnabled": true,
   "discountProhibited": false,
   "uom": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
       "type": "uom",
       "mediaType": "application/json"
     }
   },
   "images": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/d950551c-2c7f-11e6-8a84-bae50000000b/images",
       "type": "image",
       "mediaType": "application/json",
       "size": 0,
       "limit": 1000,
       "offset": 0
     }
   },
   "minPrice": {
     "value": 532000.0,
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "salePrices": [
     {
       "value": 346347237000.0,
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
         "name": "Sale price",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
       }
     },
     {
       "value": 100,
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
         "name": "Price for friends",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
       }
     }
   ],
   "supplier": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/6313d1e7-2c7f-11e6-8a84-bae500000051",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/0c2e54cd-2c80-11e6-8a84-bae50000009c",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "0c2e54cd-2c80-11e6-8a84-bae50000009c",
       "name": "Export",
       "type": "boolean",
       "value": false
     }
   ],
   "buyPrice": {
     "value": 23553000.0,
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "article": "Ar23",
   "weight": 200,
   "volume": 300,
   "packs": [
     {
       "id": "c6bdee6f-2c83-11e6-8a84-bae5000000a4",
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6b91d63-2c83-11e6-8a84-bae5000000a1",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         }
       },
       "quantity": 35
     },
     {
       "id": "c6bdf693-2c83-11e6-8a84-bae5000000a5",
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/c6bc9273-2c83-11e6-8a84-bae5000000a3",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         }
       },
       "quantity": 2000
     }
   ],
   "variantsCount": 0,
   "isSerialTrackable": true,
   "trackingType": "NOT_TRACKED",
   "things": [
     "F564X056",
     "F564X057"
   ],
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
```

### Change Product
Request to update an existing Product.
Price types in sales prices and additional fields are updated as elements of nested collections:

+ If in the current object some of the additional fields / price types no value,
and in the passed collection it is - the value is written to the additional field / price type.
+ If this attribute already has a value, it is overwritten with the one passed.
+ If this attribute has a value in the object, but it is missing
in the collection passed in the body of the request (not passed at all), then the value of the object attribute is not changed.

To update the fields of alcoholic products, the object **alcoholic** must be present in the body of the request to update the product,
with nested fields reflecting the properties of alcoholic products:

| Title | Description |
| ------------------------------ | --------------------- |
| **excise** | Contains excise stamp |
| **type** | Product type code |
| **strength** | Fortress |
| **volume** | Tare volume |

If in a request to update a product that is an alcoholic product, you pass an empty object **alcoholic**, from this object
the mark "Alcoholic products" will be removed. In order to make a product that is not an alcoholic product alcoholic, you need in the request body
pass an **alcoholic** object that has at least one of its properties set to a value.

When updating a Product with a specified array of barcodes, for each barcode, you must specify what type the barcode belongs to.
For example, to create a barcode of type Code 128, a JSON object with a code128 field with the value of the barcode must be added to the array of barcodes.

When the serial accounting of products is enabled in the main interface, it is not possible to pass the true value to the **weighed** field in the update request,
otherwise, an error will occur, because serial accounting of weight products is not possible.

> Example of a request to update a Product
  
```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "Pumpkin",
            "code": "pumpkin1",
            "externalCode": "456pumpkin",
            "description": "Pumpkin, Germany",
            "vat": 3,
            "effectiveVat": 3,
            "uom": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
                    "type": "uom",
                    "mediaType": "application/json"
                }
            },
            "supplier": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/6313f1eb-2c7f-11e6-8a84-bae500000053",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                    "type": "counterparty",
                    "mediaType": "application/json"
                }
            },
            "minPrice": {
                "value": 500.0,
                "currency": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                        "type": "currency",
                        "mediaType": "application/json"
                    }
                }
            },
            "buyPrice": {
                "value": 54.0,
                "currency": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                        "type": "currency",
                        "mediaType": "application/json"
                    }
                }
            },
            "salePrices": [
                {
                    "value": 3753.0,
                    "currency": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                            "type": "currency",
                            "mediaType": "application/json"
                        }
                    },
                    "priceType": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
                            "type": "pricetype",
                            "mediaType": "application/json"
                        }
                    }
                },
                {
                    "value": 3653,
                    "currency": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                            "type": "currency",
                            "mediaType": "application/json"
                        }
                    },
                    "priceType": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
                            "type": "pricetype",
                            "mediaType": "application/json"
                        }
                    }
                }
            ],
            "country": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/country/0238a888-c602-4e78-a199-d8f49c4d6c18",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
                    "type": "country",
                    "mediaType": "application/json"
                }
            },
            "article": "Ar23",
            "weight": 100,
            "volume": 400,
            "packs": [
                {
                    "id": "354ba98c-2cb9-11e6-8a84-bae5000000e3",
                    "uom": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/uom/2d1fdd55-d935-4d55-80d4-f6904b62ff46",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
                            "type": "uom",
                            "mediaType": "application/json"
                        }
                    },
                    "quantity": 40
                },
                {
                    "uom": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/uom/0dd4fe8b-e59e-486e-bde5-b52fe0e25415",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
                            "type": "uom",
                            "mediaType": "application/json"
                        }
                    },
                    "quantity": 101
                }
            ],
            "images": [
                {
                    "filename": "birdimageNew.png",
                    "content": "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAAA3NCSVQICAjb4U/gAAAAEHRFWHRTb2Z0d2FyZQBTaHV0dGVyY4LQCQAAAAxJREFUCNdj+PePAQAE+gH90KA5ZAAAAABJRU5ErkJggg=="
                }
            ],
            "alcoholic": {
                "excise": true,
                "type": 3100,
                "strength": 0.6,
                "volume": 1.5
            },
            "barcodes": [
                {
                    "code128": "code128barcode"
                }
            ]
        }'
```
  
> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Product.
  
```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/product/26b36824-2c83-11e6-8a84-bae50000001b",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
     "type": "product",
     "mediaType": "application/json"
   },
   "id": "26b36824-2c83-11e6-8a84-bae50000001b",
   "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
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
   "updated": "2016-06-07 11:00:37",
   "name": "Pumpkin",
   "description": "Pumpkin, Germany",
   "code": "pumpkin1",
   "externalCode": "456pumpkin",
   "archived": false,
   "pathName": "",
   "vat": 3,
   "vatEnabled": true,
   "useParentVat": false,
   "effectiveVat": 3,
   "effectiveVatEnabled": true,
   "discountProhibited": false,
   "uom": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
       "type": "uom",
       "mediaType": "application/json"
     }
   },
   "images": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/26b36824-2c83-11e6-8a84-bae50000001b/images",
       "type": "image",
       "mediaType": "application/json",
       "size": 1,
       "limit": 1000,
       "offset": 0
     }
   },
   "minPrice": {
     "value": 500.0,
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "salePrices": [
     {
       "value": 3753.0,
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
         "name": "Sale price",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
       }
     },
     {
       "value": 3653,
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
         "name": "Price for friends",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
       }
     }
   ],
   "supplier": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/6313f1eb-2c7f-11e6-8a84-bae500000053",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/0c2e54cd-2c80-11e6-8a84-bae50000009c",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "0c2e54cd-2c80-11e6-8a84-bae50000009c",
       "name": "Export",
       "type": "boolean",
       "value": false
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/0c2e5dc5-2c80-11e6-8a84-bae50000009d",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "0c2e5dc5-2c80-11e6-8a84-bae50000009d",
       "name": "Manufacturer",
       "type": "string",
       "value": "Kolkhoz \"Ivanovo\""
     }
   ],
   "country": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/country/0238a888-c602-4e78-a199-d8f49c4d6c18",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
       "type": "country",
       "mediaType": "application/json"
     }
   },
   "buyPrice": {
     "value": 54.0,
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "article": "Ar23",
   "weight": 100,
   "volume": 400,
   "packs": [
     {
       "id": "354ba98c-2cb9-11e6-8a84-bae5000000e3",
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/2d1fdd55-d935-4d55-80d4-f6904b62ff46",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         }
       },
       "quantity": 40
     },
     {
       "id": "354ba98c-2cb9-11e6-8a84-bae5000004e3",
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/0dd4fe8b-e59e-486e-bde5-b52fe0e25415",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         }
       },
       "quantity": 101
     }
   ],
   "barcodes": [
     {
       "code128": "code128barcode"
     }
   ],
   "alcoholic": {
     "excise": true,
     "type": 3100,
     "strength": 0.6,
     "volume": 1.5
   },
   "isSerialTrackable": false,
   "trackingType": "NOT_TRACKED"
}
```

> An example of a request to change a Product with additional fields.
  
```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "Pumpkin",
            "code": "pumpkin1",
            "externalCode": "456pumpkin",
            "description": "Pumpkin, Germany",
            "vat": 3,
            "effectiveVat": 3,
            "uom": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
                    "type": "uom",
                    "mediaType": "application/json"
                }
            },
            "supplier": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/6313f1eb-2c7f-11e6-8a84-bae500000053",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                    "type": "counterparty",
                    "mediaType": "application/json"
                }
            },
            "minPrice": {
                "value": 500.0,
                "currency": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                        "type": "currency",
                        "mediaType": "application/json"
                    }
                }
            },
            "buyPrice": {
                "value": 54.0,
                "currency": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                        "type": "currency",
                        "mediaType": "application/json"
                    }
                }
            },
            "salePrices": [
                {
                    "value": 3753.0,
                    "currency": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                            "type": "currency",
                            "mediaType": "application/json"
                        }
                    },
                    "priceType": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
                            "type": "pricetype",
                            "mediaType": "application/json"
                        }
                    }
                },
                {
                    "value": 3653,
                    "currency": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                            "type": "currency",
                            "mediaType": "application/json"
                        }
                    },
                    "priceType": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
                            "type": "pricetype",
                            "mediaType": "application/json"
                        }
                    }
                }
            ],
            "article": "Ar23",
            "weight": 100,
            "volume": 400,
            "attributes": [
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/0c2e54cd-2c80-11e6-8a84-bae50000009c",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "name": "Export",
                    "value": false
                },
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/0c2e5dc5-2c80-11e6-8a84-bae50000009d",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "name": "Manufacturer",
                    "value": "Kolkhoz \"Ivanovo\" "
                }
            ]
        }'
```
  
> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Products.
  
   ```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/product/26b36824-2c83-11e6-8a84-bae50000001b",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
     "type": "product",
     "mediaType": "application/json"
   },
   "id": "26b36824-2c83-11e6-8a84-bae50000001b",
   "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
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
   "updated": "2016-06-07 10:52:58",
   "name": "Pumpkin",
   "description": "Pumpkin, Germany",
   "code": "pumpkin1",
   "externalCode": "456pumpkin",
   "archived": false,
   "pathName": "",
   "vat": 3,
   "vatEnabled": true,
   "useParentVat": false,
   "effectiveVat": 3,
   "effectiveVatEnabled": true,
   "discountProhibited": false,
   "uom": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
       "type": "uom",
       "mediaType": "application/json"
     }
   },
   "images": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/26b36824-2c83-11e6-8a84-bae50000001b/images",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "salePrices": [
     {
       "value": 3753.0,
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
         "name": "Sale price",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
       }
     },
     {
       "value": 3653,
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
         "name": "Price for friends",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
       }
     }
   ],
   "supplier": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/6313f1eb-2c7f-11e6-8a84-bae500000053",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/0c2e54cd-2c80-11e6-8a84-bae50000009c",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "0c2e54cd-2c80-11e6-8a84-bae50000009c",
       "name": "Export",
       "type": "boolean",
       "value": false
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/product/metadata/attributes/0c2e5dc5-2c80-11e6-8a84-bae50000009d",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "0c2e5dc5-2c80-11e6-8a84-bae50000009d",
       "name": "Manufacturer",
       "type": "string",
       "value": "Kolkhoz \"Ivanovo\""
     }
   ],
   "buyPrice": {
     "value": 54.0,
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "article": "Ar23",
   "weight": 100,
   "volume": 400,
   "isSerialTrackable": false,
   "trackingType": "NOT_TRACKED"
}
```

> An example of a request to change a Product with packages.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
            "name": "Pumpkin",
            "code": "pumpkin1",
            "externalCode": "456pumpkin",
            "description": "Pumpkin, Germany",
            "vat": 3,
            "effectiveVat": 3,
            "uom": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
                    "type": "uom",
                    "mediaType": "application/json"
                }
            },
            "supplier": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/6313f1eb-2c7f-11e6-8a84-bae500000053",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                    "type": "counterparty",
                    "mediaType": "application/json"
                }
            },
            "minPrice": {
                "value": 500.0,
                "currency": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                        "type": "currency",
                        "mediaType": "application/json"
                    }
                }
            },
            "buyPrice": {
                "value": 54.0,
                "currency": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                        "type": "currency",
                        "mediaType": "application/json"
                    }
                }
            },
            "salePrices": [
                {
                    "value": 3753.0,
                    "currency": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                            "type": "currency",
                            "mediaType": "application/json"
                        }
                    },
                    "priceType": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
                            "type": "pricetype",
                            "mediaType": "application/json"
                        }
                    }
                },
                {
                    "value": 3653,
                    "currency": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                            "type": "currency",
                            "mediaType": "application/json"
                        }
                    },
                    "priceType": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
                            "type": "pricetype",
                            "mediaType": "application/json"
                        }
                    }
                }
            ],
            "article": "Ar23",
            "weight": 100,
            "volume": 400,
            "packs": [
                {
                    "uom": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
                            "type": "uom",
                            "mediaType": "application/json"
                        }
                    },
                    "quantity": 11,
                    "barcodes": [
                        {
                            "code128": "code128barcode"
                        }
                    ]
                }
            ]
        }'
```
        
> Response 200(application/json)
Successful request. The result is a JSON representation ofnew Product.
  
   ```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/product/26b36824-2c83-11e6-8a84-bae50000001b",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
     "type": "product",
     "mediaType": "application/json"
   },
   "id": "26b36824-2c83-11e6-8a84-bae50000001b",
   "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
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
   "updated": "2016-06-07 10:52:58",
   "name": "Pumpkin",
   "description": "Pumpkin, Germany",
   "code": "pumpkin1",
   "externalCode": "456pumpkin",
   "archived": false,
   "pathName": "",
   "vat": 3,
   "vatEnabled": true,
   "useParentVat": false,
   "effectiveVat": 3,
   "effectiveVatEnabled": true,
   "discountProhibited": false,
   "uom": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
       "type": "uom",
       "mediaType": "application/json"
     }
   },
   "images": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/product/26b36824-2c83-11e6-8a84-bae50000001b/images",
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
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/10772c12-36e7-11e7-8a7f-40d000000097",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "salePrices": [
     {
       "value": 3753.0,
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
         "name": "Sale price",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
       }
     },
     {
       "value": 3653,
       "currency": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
           "type": "currency",
           "mediaType": "application/json"
         }
       },
       "priceType": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
           "type": "pricetype",
           "mediaType": "application/json"
         },
         "id": "672559f1-cbf3-11e1-9eb9-889ffa6f2222",
         "name": "Price for friends",
         "externalCode": "cbcf493b-55bc-11d9-848a-00112f432222"
       }
     }
   ],
   "supplier": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/6313f1eb-2c7f-11e6-8a84-bae500000053",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "buyPrice": {
     "value": 54.0,
     "currency": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
         "type": "currency",
         "mediaType": "application/json"
       }
     }
   },
   "packs" : [
     {
       "id": "6314188d-2c7f-11e6-8a84-bae500000055",
       "uom": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/uom/metadata",
           "type": "uom",
           "mediaType": "application/json"
         }
       },
       "quantity": 11,
       "barcodes": [
         {
           "code128": "code128barcode"
         }
       ]
     }
   ],
   "article": "Ar23",
   "weight": 100,
   "volume": 400,
   "isSerialTrackable": false,
   "trackingType": "NOT_TRACKED"
}
```
> Example of a request to update a Product with Minimum Stock.

```shell
  curl -X PUT
    "https://api.kladana.com/api/remap/1.2/entity/product/3bdfdb5b-137a-11f0-ac15-001100000018?expand=minimumStock.storeBalances"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
    -d '
{
  "minimumStock": {
    "type": "WAREHOUSE_VARIED",
    "storebalances": [
      {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/88df2fc1-1065-11f0-ac15-000700000012/storebalances/de922f92-113b-11f0-ac15-001000000009",
          "type": "minimumstock",
          "mediaType": "application/json"
        },
        "quantity": 2.5,
        "store": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/store/da1c5548-0ecf-11f0-ac15-001200000125",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
            "type": "store",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#warehouse/edit?id=da1c5548-0ecf-11f0-ac15-001200000125"
          }
        }
      },
      {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/88df2fc1-1065-11f0-ac15-000700000012/storebalances/de922f92-113b-11f0-ac15-001000000001",
          "type": "minimumstock",
          "mediaType": "application/json"
        },
        "quantity": 1.5,
        "store": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/store/da1c5548-0ecf-11f0-ac15-001200000126",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
            "type": "store",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#warehouse/edit?id=da1c5548-0ecf-11f0-ac15-001200000126"
          }
        }
      }
    ]
  }
}'  
```  
        
> Response 200 (application/json)
Successful request. The result is a JSON representation of the updated Product.
  
  ```json
{
    "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/3bdfdb5b-137a-11f0-ac15-001100000018",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json",
        "uuidHref": "https://api.kladana.com/app/#good/edit?id=3bdfb95e-137a-11f0-ac15-001100000016"
    },
    "id": "3bdfdb5b-137a-11f0-ac15-001100000018",
    "accountId": "762af84a-0ec6-11f0-ac15-001000000001",
    "shared": true,
    "group": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/group/762c4293-0ec6-11f0-ac15-001000000002",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
            "type": "group",
            "mediaType": "application/json"
        }
    },
    "updated": "2025-04-07 09:33:35.954",
    "name": "Potato",
    "code": "00005",
    "externalCode": "jIWckEqShIHKVVLBacIy02",
    "archived": false,
    "pathName": "",
    "useParentVat": true,
    "images": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/product/3bdfdb5b-137a-11f0-ac15-001100000018/images",
            "type": "image",
            "mediaType": "application/json",
            "size": 0,
            "limit": 1000,
            "offset": 0
        }
    },
    "minPrice": {
        "value": 0,
        "currency": {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/currency/77a29ae9-0ec6-11f0-ac15-0012000000a4",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                "type": "currency",
                "mediaType": "application/json",
                "uuidHref": "https://api.kladana.com/app/#currency/edit?id=77a29ae9-0ec6-11f0-ac15-0012000000a4"
            }
        }
    },
    "salePrices": [
        {
            "value": 0,
            "currency": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/currency/77a29ae9-0ec6-11f0-ac15-0012000000a4",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                    "type": "currency",
                    "mediaType": "application/json",
                    "uuidHref": "https://api.kladana.com/app/#currency/edit?id=77a29ae9-0ec6-11f0-ac15-0012000000a4"
                }
            },
            "priceType": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/77f67b4c-0ec6-11f0-ac15-0012000000a5",
                    "type": "pricetype",
                    "mediaType": "application/json"
                },
                "id": "77f67b4c-0ec6-11f0-ac15-0012000000a5",
                "name": "Sale price",
                "externalCode": "cbcf493b-55bc-11d9-848a-00112f43529a"
            }
        }
    ],
    "buyPrice": {
        "value": 0,
        "currency": {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/currency/77a29ae9-0ec6-11f0-ac15-0012000000a4",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/currency/metadata",
                "type": "currency",
                "mediaType": "application/json",
                "uuidHref": "https://api.kladana.com/app/#currency/edit?id=77a29ae9-0ec6-11f0-ac15-0012000000a4"
            }
        }
    },
    "paymentItemType": "GOOD",
    "discountProhibited": false,
    "weight": 0,
    "volume": 0,
    "variantsCount": 0,
    "isSerialTrackable": false,
    "trackingType": "NOT_TRACKED",
    "files": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/product/3bdfdb5b-137a-11f0-ac15-001100000018/files",
            "type": "files",
            "mediaType": "application/json",
            "size": 0,
            "limit": 1000,
            "offset": 0
        }
    },
    "minimumStock": {
        "type": "WAREHOUSE_VARIED",
        "storeBalances": {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/product/88df2fc1-1065-11f0-ac15-000700000012/storebalances",
                "type": "minimumstock",
                "mediaType": "application/json",
                "size": 2,
                "limit": 1000,
                "offset": 0
            },
            "rows": [
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/product/88df2fc1-1065-11f0-ac15-000700000012/storebalances/de922f92-113b-11f0-ac15-001000000009",
                        "type": "minimumstock",
                        "mediaType": "application/json"
                    },
                    "id": "de922f92-113b-11f0-ac15-001000000009",
                    "accountId": "762af84a-0ec6-11f0-ac15-001000000001",
                    "quantity": 2.5,
                    "store": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/store/da1c5548-0ecf-11f0-ac15-001200000125",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                            "type": "store",
                            "mediaType": "application/json",
                            "uuidHref": "https://api.kladana.com/app/#warehouse/edit?id=da1c5548-0ecf-11f0-ac15-001200000125"
                        }
                    }
                },
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/product/88df2fc1-1065-11f0-ac15-000700000012/storebalances/de922f92-113b-11f0-ac15-001000000001",
                        "type": "minimumstock",
                        "mediaType": "application/json"
                    },
                    "id": "de922f92-113b-11f0-ac15-001000000001",
                    "accountId": "762af84a-0ec6-11f0-ac15-001000000001",
                    "quantity": 1.5,
                    "store": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/store/da1c5548-0ecf-11f0-ac15-001200000126",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/store/metadata",
                            "type": "store",
                            "mediaType": "application/json",
                            "uuidHref": "https://api.kladana.com/app/#warehouse/edit?id=da1c5548-0ecf-11f0-ac15-001200000126"
                        }
                    }
                }
            ]
        }
    }
}
```  

> The request for the bulk deletion of Minimum Stock in the product.
```shell
curl -X POST
  "https://api.kladana.com/api/remap/1.2/entity/product/3e1c03bb-684f-11ee-ac12-000c000000b0/storebalances/delete"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
  -H "Content-Type: application/json"
  -d '[
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/product/3e1c03bb-684f-11ee-ac12-000c000000b0/storebalances/7fce2da5-684d-11ee-ac12-000c000000a2",
            "type": "minimumstock",
            "mediaType": "application/json"
          }
        },
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/product/3e1c03bb-684f-11ee-ac12-000c000000b0/storebalances/7fce37a5-684d-11ee-ac12-000c000000a3",
            "type": "minimumstock",
            "mediaType": "application/json"
          }
        }
      ]'  
```

> Response 200 (application/json)
Successful deletion of the Minimum Stock items.
