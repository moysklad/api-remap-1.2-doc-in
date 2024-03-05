### List of entities

List of entities for which it is possible to create additional. fields, you can look in [documentation](../#kladana-json-api-general-info-additional-fields)

### Working with additional fields in the JSON API

As part of the JSON API, you can create additional fields and edit existing ones. This is described in detail in the article [Working with additional fields via API.](../workbook/#workbook-working-with-additional-fields-via-json-api)

### Getting additional fields

Additional the fields are located in the metadata of the required entity.
An example of getting additional product fields:

> Request

```shell
curl
     -X GET
     -u login:password
     -H "Lognex-Pretty-Print-JSON: true"
     "https://api.kladana.in/api/remap/1.2/entity/product/metadata/attributes"
```

> Result:

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/product/metadata/attributes",
     "type": "attributemetadata",
     "mediaType": "application/json",
     "size": 3,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/metadata/attributes/839ca663-75f7-11e8-9107-5048001126a2",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "839ca663-75f7-11e8-9107-5048001126a2",
       "name": "Battery life",
       "type": "double",
       "required": false
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/metadata/attributes/7385ab6e-ad06-11e8-9ff4-34e80004fb35",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "7385ab6e-ad06-11e8-9ff4-34e80004fb35",
       "name": "Link to online store",
       "type": "link",
       "required": false
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/product/metadata/attributes/52ae09f9-8fe7-11ed-0a80-07ae000000ef",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "52ae09f9-8fe7-11ed-0a80-07ae000000ef",
       "name": "Keyboard highlight",
       "type": "boolean",
       "required": false
     }
   ]
}
```

### Setting values for additional fields via JSON API

You can set the value of an additional field both when creating an object and when updating it.

The identifiers of additional product fields obtained in the previous example can be used when creating new products.
The additional field "Keyboard highlight" is optional (**required=false**) and is not passed in the example below.

> Request

```shell
curl
     -X POST
     -u login:password
     -H 'Accept: application/json'
     -H 'Content-Type: application/json'
     "https://api.kladana.in/api/remap/1.2/entity/product"
     -d '{
                 "name": "Notebook",
                 "vat": 18,
                 "effectiveVat": 18,
                 "uom": {
                   "meta": {
                     "href": "https://api.kladana.in/api/remap/1.2/entity/uom/19f1edc0-fc42-4001-94cb-c9ec9c62ec10",
                     "type": "uom"
                   }
                 },
                 "minPrice": 50000.0,
                 "buyPrice": {
                   "value": 50000.0,
                   "currency": {
                     "meta": {
                       "href": "https://api.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                       "type": "currency"
                     }
                   }
                 },
                 "salePrices": [
                   {
                     "value": 100000.0,
                     "currency": {
                       "meta": {
                         "href": "https://api.kladana.in/api/remap/1.2/entity/currency/6314188d-2c7f-11e6-8a84-bae500000055",
                         "type": "currency"
                       }
                     },
                     "priceType": "Sell Price"
                   }
                 ],
                 "attributes": [
                     {
                       "meta": {
                         "href": "https://api.kladana.in/api/remap/1.2/entity/product/metadata/attributes/839ca663-75f7-11e8-9107-5048001126a2",
                         "type": "attributemetadata"
                       },
                       "value": 9.6
                     },
                     {
                       "meta": {
                         "href": "https://api.kladana.in/api/remap/1.2/entity/product/metadata/attributes/7385ab6e-ad06-11e8-9ff4-34e80004fb35",
                         "type": "attributemetadata"
                       },
                       "id": "7385ab6e-ad06-11e8-9ff4-34e80004fb35",
                       "name": "Link to online store",
                       "value": "https://example.com"
                     }
                 ]
        }'
```

For the new product "Laptop" we specified the values of two additional fields: `Battery life` and `Link to online store`.

When updating a product, we can both update the existing values of additional fields and set new ones.

> Request

```shell
curl
     -X PUT
     -u login:password
     -H 'Accept: application/json'
     -H 'Content-Type: application/json'
     "https://api.kladana.in/api/remap/1.2/entity/product/630c578a-cb05-11e8-9109-f8fc0037889a"
     -d '{
           "name": "Notebook updated",
           "attributes": [
             {
               "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/product/metadata/attributes/839ca663-75f7-11e8-9107-5048001126a2",
                 "type": "attributemetadata"
               },
               "value": 10.6
             },
             {
               "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/product/metadata/attributes/52ae09f9-8fe7-11ed-0a80-07ae000000ef",
                 "type": "attributemetadata"
               },
               "value": "true"
             }
           ]
        }'
        ```
In the example, we updated the value of the `Battery life` field, set when creating the product, and also set the value of the `Keyboard backlight` field - we left it empty when creating the product.

Also for optional fields it is possible to reset the field value. To do this, you must pass the value **null** in the **value** field.

If in the body of the request to update/create an entity in an array of additional fields:

+ No id of any additional fields specified - additional fields will not be updated.
+ The id of additional fields are indicated, which in this entity has not yet been assigned a value - the corresponding additional fields will be assigned the transferred values.
+ The ids of additional fields are specified, which have already been assigned a value in this entity - the corresponding additional fields will be assigned new values.
+ A non-existent id is specified, which is not in the entity's metadata, an error occurs.

### Possible types of additional fields

You can find the possible types of additional fields in [documentation](../#kladana-json-api-general-info-additional-fields).

### Additional field of type File

To load the value of an additional field of the file type, you need to specify an object of the following structure in the **value** field:

+ filename - Filename `Required`
+ content - Base64 encoded bytes of the file `Required`

An example of creating a product with an additional field of the File type is shown below. An incomplete value of the contents of the file is given.

> Request

```shell
curl
     -X POST
     -u login:password
     -H 'Accept: application/json'
     -H 'Content-Type: application/json'
     "https://api.kladana.in/api/remap/1.2/entity/product"
     -d '{
             "name": "Notebook",
             "attributes": [
                 {
                   "id": "839ca663-75f7-11e8-9107-5048001126a3",
                   "name": "Specification",
                   "type": "file",
                   "file": {
                     "filename": "filename",
                     "content": "5cYwMpOmNk5kSVr4YgZGKtXJb/7KpHVLDUawyZrD5Nf0WDhB7mS1I77VcAMqYQ8DkP/1wDLhb0X6b2JO4pdpKA=="
                   }
                 }
             ]
        }'
```

### Additional field of the List type

An additional field of the List type refers to an object of a specific list. It can be one of the built-in lists (Products, Counterparties, Contracts, Employees, Projects, Warehouses), or a list created by the user.

Let's consider an example of working with additional fields of the list type using the example of counterparties.
In the example, two additional fields are set for them:
built-in list Project and user list Region:

> Request

```shell
curl
     -X GET
     -u login:password
     -H "Lognex-Pretty-Print-JSON: true"
     "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata"
```

> Result:

```json
{
     "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
         "mediaType": "application/json"
     },
     "attributes": [
         {
             "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata/attributes/cf486cca-d383-11e8-ac12-000a000000d4",
                 "type": "attributemetadata",
                 "mediaType": "application/json"
             },
             "id": "cf486cca-d383-11e8-ac12-000a000000d4",
             "name": "Project Megalodon",
             "type": "project",
             "required": false
         },
         {
             "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata/attributes/cf489b7c-d383-11e8-ac12-000a000000d5",
                 "type": "attributemetadata",
                 "mediaType": "application/json"
             },
             "customEntityMeta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/companysettings/metadata/customEntities/ac120c44-d383-11e8-ac12-000a000000c4",
                 "type": "customentitymetadata",
                 "mediaType": "application/json"
             },
             "id": "cf489b7c-d383-11e8-ac12-000a000000d5",
             "name": "Region 43",
             "type": "customentity",
             "required": false
         }
     ],
     "states": [
         {
             "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata/states/5b77c63b-d047-11e8-ac12-000b0000006b",
                 "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                 "type": "state",
                 "mediaType": "application/json"
             },
             "id": "5b77c63b-d047-11e8-ac12-000b0000006b",
             "accountId": "5a0480c9-d047-11e8-ac12-000900000000",
             "name": "New",
             "color": 15106326,
             "stateType": "Regular",
             "entityType": "counterparty"
         },
         {
             "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata/states/5b77ddd8-d047-11e8-ac12-000b0000006c",
                 "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                 "type": "state",
                 "mediaType": "application/json"
             },
             "id": "5b77ddd8-d047-11e8-ac12-000b0000006c",
             "accountId": "5a0480c9-d047-11e8-ac12-000900000000",
             "name": "Offer sent",
             "color": 10774205,
             "stateType": "Regular",
             "entityType": "counterparty"
         },
         {
             "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata/states/5b77eb48-d047-11e8-ac12-000b0000006d",
                 "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                 "type": "state",
                 "mediaType": "application/json"
             },
             "id": "5b77eb48-d047-11e8-ac12-000b0000006d",
             "accountId": "5a0480c9-d047-11e8-ac12-000900000000",
             "name": "Negotiations",
             "color": 40931,
             "stateType": "Regular",
             "entityType": "counterparty"
         },
         {
             "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata/states/5b77f0c9-d047-11e8-ac12-000b0000006e",
                 "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                 "type": "state",
                 "mediaType": "application/json"
             },
             "id": "5b77f0c9-d047-11e8-ac12-000b0000006e",
             "accountId": "5a0480c9-d047-11e8-ac12-000900000000",
             "name": "Deal Closed",
             "color": 8825440,
             "stateType": "Successful",
             "entityType": "counterparty"
         },
         {
             "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata/states/5b77f469-d047-11e8-ac12-000b0000006f",
                 "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                 "type": "state",
                 "mediaType": "application/json"
             },
             "id": "5b77f469-d047-11e8-ac12-000b0000006f",
             "accountId": "5a0480c9-d047-11e8-ac12-000900000000",
             "name": "Deal not closed",
             "color": 15280409,
             "stateType": "Unsuccessful",
             "entityType": "counterparty"
         }
     ],
     "createShared": false
}
```

To set the value of an additional field of the list type
in the **value** field, you need to pass an object containing the **meta** field
with the metadata of the object, which will be the value of the additional field.
Let's create a counterparty with these additional fields:

> Request

```shell
curl
     -X POST
     -u login:password
     -H 'Accept: application/json'
     -H 'Content-Type: application/json'
     "https://api.kladana.in/api/remap/1.2/entity/counterparty"
     -d '{
             "name": "OOO Vostok",
             "attributes": [
                 {
                     "id": "cf486cca-d383-11e8-ac12-000a000000d4",
                     "name": "Aurora",
                     "type": "project",
                     "value": {
                         "meta": {
                             "href": "https://api.kladana.in/api/remap/1.2/entity/project/c5ed49c2-d384-11e8-ac12-000a000000d8",
                             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/project/metadata",
                             "type": "project",
                             "mediaType": "application/json",
                             "uuidHref": "https://app.kladana.in/app/#project/edit?id=c5ed49c2-d384-11e8-ac12-000a000000d8"
                         }
                     }
                 },
                 {
                     "id": "cf489b7c-d383-11e8-ac12-000a000000d5",
                     "name": "Region 13",
                     "type": "customentity",
                     "value": {
                         "meta": {
                             "href": "https://api.kladana.in/api/remap/1.2/entity/customentity/ac120c44-d383-11e8-ac12-000a000000c4/b971966b-d383-11e8-ac12-000a000000ce",
                             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/companysettings/metadata/customEntities/ac120c44-d383-11e8-ac12-000a000000c4",
                             "type": "customentity",
                             "mediaType": "application/json",
                             "uuidHref": "https://app.kladana.in/app/#custom_ac120c44-d383-11e8-ac12-000a000000c4/edit?id=b971966b-d383-11e8-ac12-000a000000ce"
                             }
                         }
                 }
             ]
        }'
```

> Result:

```json
{
     "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/5a5597e3-d385-11e8-ac12-000800000000",
         "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
         "type": "counterparty",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.in/app/#company/edit?id=5a5597e3-d385-11e8-ac12-000800000000"
     },
     "id": "5a5597e3-d385-11e8-ac12-000800000000",
     "accountId": "5a0480c9-d047-11e8-ac12-000900000000",
     "owner": {
         "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/employee/5a929317-d047-11e8-ac12-000b0000002e",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
             "type": "employee",
             "mediaType": "application/json",
             "uuidHref": "https://app.kladana.in/app/#employee/edit?id=5a929317-d047-11e8-ac12-000b0000002e"
         }
     },
     "shared": false,
     "group": {
         "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/group/5a05b13e-d047-11e8-ac12-000900000001",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/group/metadata",
             "type": "group",
             "mediaType": "application/json"
         }
     },
     "version": 0,
     "updated": "2018-10-19 12:57:13.000",
     "name": "OOO Vostok",
     "externalCode": "fN3pbKAWhwfAOiz3MFMsA0",
     "archived": false,
     "created": "2018-10-19 12:57:13.000",
     "companyType": "legal",
     "attributes": [
         {
             "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata/attributes/cf486cca-d383-11e8-ac12-000a000000d4",
                 "type": "attributemetadata",
                 "mediaType": "application/json"
             },
             "id": "cf486cca-d383-11e8-ac12-000a000000d4",
             "name": "[Project]",
             "type": "project",
             "value": {
                 "meta": {
                     "href": "https://api.kladana.in/api/remap/1.2/entity/project/c5ed49c2-d384-11e8-ac12-000a000000d8",
                     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/project/metadata",
                     "type": "project",
                     "mediaType": "application/json",
                     "uuidHref": "https://app.kladana.in/app/#project/edit?id=c5ed49c2-d384-11e8-ac12-000a000000d8"
                 },
                 "name": "Project 1"
             }
         },
         {
             "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata/attributes/cf489b7c-d383-11e8-ac12-000a000000d5",
                 "type": "attributemetadata",
                 "mediaType": "application/json"
             },
             "id": "cf489b7c-d383-11e8-ac12-000a000000d5",
             "name": "Region",
             "type": "customentity",
             "value": {
                 "meta": {
                     "href": "https://api.kladana.in/api/remap/1.2/entity/customentity/ac120c44-d383-11e8-ac12-000a000000c4/b971966b-d383-11e8-ac12-000a000000ce",
                     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/companysettings/metadata/customEntities/ac120c44-d383-11e8-ac12-000a000000c4",
                     "type": "customentity",
                     "mediaType": "application/json",
                     "uuidHref": "https://app.kladana.in/app/#custom_ac120c44-d383-11e8-ac12-000a000000c4/edit?id=b971966b-d383-11e8-ac12-000a000000ce"
                 },
                 "name": "Eastern"
             }
         }
     ],
     "accounts": {
         "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/5a5597e3-d385-11e8-ac12-000800000000/accounts",
             "type": "account",
             "mediaType": "application/json",
             "size": 0,
             "limit": 100,
             "offset": 0
         }
     },
     "tags": [],
     "contactpersons": {
         "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/5a5597e3-d385-11e8-ac12-000800000000/contactpersons",
             "type": "contactperson",
             "mediaType": "application/json",
             "size": 0,
             "limit": 100,
             "offset": 0
         }
     },
     "notes": {
         "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/5a5597e3-d385-11e8-ac12-000800000000/notes",
             "type": "note",
             "mediaType": "application/json",
             "size": 0,
             "limit": 100,
             "offset": 0
         }
     },
     "state": {
         "meta": {
             "href": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata/states/5b77c63b-d047-11e8-ac12-000b0000006b",
             "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/counterparty/metadata",
             "type": "state",
             "mediaType": "application/json"
         }
     },
     "salesAmount": 0
}
```
### Filtering by the value of the additional field

The JSON API allows you to filter by value up toadditional field. Using the example of the additional fields above, you can filter out all products whose value of the additional field `Battery life` is greater than or equal to 5:

> Request

```shell
curl
     -X GET
     -u login:password
     -H 'Accept: application/json'
     -H 'Content-Type: application/json'
     "https://api.kladana.in/api/remap/1.2/entity/product?filter=https://api.kladana.in/api/remap/1.2/entity/product/metadata/attributes/630c578a-cb05-11e8-9109-f8fc0037889a%3E%3D5"
```

To do this, we need to specify the href of the additional field for filtering, the comparison sign (in our case `>=`) and the value in the filter parameter. The response will return all entities matching the passed criteria.

### Sorting by additional field

Sorting by additional fields currently is not supported.
