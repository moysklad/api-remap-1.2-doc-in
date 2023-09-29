## Working with additional fields via JSON API

To set additional properties of an object in Kladana, it is possible to work with additional fields (attributes).
They are properties of an entity (object or document) that are formed by the user and can be used for more
a detailed description of the object or filtering by the values of these fields. You can read more about the types and properties of additional fields
in [documentation](../#kladana-json-api-general-info-additional-fields).

In this article, we will use the example of a laptop store to view, create, edit, and delete additional fields using the JSON API.

The values of additional fields can be changed by referring to a specific object (document). This is detailed in
article [Additional fields](../#kladana-json-api-general-info-additional-fields).

Suppose we need to select and sort laptops by some characteristics that are not in the product properties by default.
For example, the case material, the presence of a CD/DVD-Rom, the presence of a Type-C connector, etc. You need the ability to create, edit and delete product properties.
Assign the values of these properties to specific products, as well as filter by them. Filtering by the values of additional fields in
JSON API is described in the article [Additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields).
To create these characteristics, we will use additional fields (attributes) of the product.

In the web application, object attributes are assigned on the object list page by clicking the gear button on the right.
A window for editing the properties of objects opens, where the last item is "Additional fields". Here you can view, create, editing and deleting object attributes. All this functionality is available through the JSON API.

### Additional fields for Services, Modifications and Kits
Additional fields for Goods, Services, Modifications and Kits are common and are located in the Goods metadata.

### Creating a new additional field via the JSON API
Consider the task of adding new attributes to an entity (product). Suppose we want for existing and purchased in the future laptops
indicate the body material. To specify it, we will use an additional field of the string type. This example is discussed in
screenshots of the web application above. Now let's try to do the same through the JSON API.

Let's execute a POST request, in the body of which we indicate the name and type of the additional field (attribute). To do this, it is enough to specify in the body of the request
required fields "name" and "type". In this case, let's add a string field that describes the material of the laptop case.

In addition to the name and type, the attribute being created has the following fields:

* *meta* - metadata set, filled in automatically upon creation,
* *id* - attribute id, filled in automatically upon creation,
* *required* - the attribute's mandatory flag, if true - the attribute's value must be filled in when creating or modifying the entity. (Default is false. For attributes of type Checkbox cannot be changed)

Creating two additional fields with the same name is not allowed.

> Request

```shell
curl -X POST
   -u login:password
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
   "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes"
   -d '{
       "name": "Hull Material",
       "type": "string"
     }'
```

> Result:

```json
{
     "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/acd884ce-b44f-11e9-7ae5-884b00009002",
         "type": "attributemetadata",
         "mediaType": "application/json"
     },
     "id": "acd884ce-b44f-11e9-7ae5-884b00009002",
     "name": "Hull Material",
     "type": "string",
     "required": false
}
```

An additional field (attribute) has been created, it is automatically assigned an id. The value of the required property is set by default
to false, which makes the created attribute optional when creating a product.

### Creating a new additional field of the Reference type via the JSON API
It is worth paying attention to the creation of an attribute with the Directory type. This type allows an attribute to take other objects as its value,
including custom ones.

Description of Handbook type attributes in [documentation](../workbook/#workbook-working-with-additional-fields-via-json-api)

Let's assume that our store also has laptop cases. Let's create a Catalog attribute of the Product type. Now there is an opportunity for
for each laptop, specify the appropriate case for itl as one of the properties of the laptop.

To create an attribute of the Catalog type product, you need to specify the value "product" in the "type" field. In the "name" field, specify "Cover".

> Request

```shell
curl -X POST
   -u login:password
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
   "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes"
   -d '{
       "name": "Case",
       "type": "product"
     }'
```

> Result:

```json
{
     "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/cc8ff599-c5c0-11e9-0a80-06b000000000",
         "type": "attributemetadata",
         "mediaType": "application/json"
     },
     "id": "cc8ff599-c5c0-11e9-0a80-06b000000000",
     "name": "Case",
     "type": "productfolder",
     "required": false
}
```

An attribute has been created, in the value of which for each product you can write another product. Now you can, for example, offer to immediately purchase
case for the laptop selected by the buyer.

### Bulk creation and update of additional fields via JSON API

With the advent of new models of laptops in the store, it may be necessary to create new attributes. For example, the type of connectors on laptops
some manufacturers change with such frequency that it is impossible to predict their type and availability in advance. In this case, you may need
adding new and editing existing attributes.

The JSON API allows bulk creation of additional fields. To do this, you need to pass in the body of the POST request an array with the properties of each of the created attributes.
The array must contain data for each created field, separated by commas and enclosed in curly braces. Mandatory to transfer
properties are the name and type of the field. If you add "meta" of an existing additional field to them, then it will be changed.

Let's form the request body from 3 elements. For the "Hull material" field, specify its "meta", change the "name" property to "Hull material (addition)".
The new value of the "name" property must not match the existing ones. The "type" property cannot be changed. The other two array elements will be created, they will automatically be assigned metadata.

> Request

```shell
curl -X POST
   -u login:password
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
   "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes"
   -d'[
         {
             "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/acd884ce-b44f-11e9-7ae5-884b00009002",
                 "type": "attributemetadata",
                 "mediaType": "application/json"
             },
             "name": "Hull material (add-on)",
             "type": "string"
         },
         {
             "name": "CD-Rom available",
             "type": "boolean"
         },
         {
             "name": "Presence of type-C connector",
             "type": "boolean"
         }
       ]'
```

> Result:

```json
[
     {
         "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/acd884ce-b44f-11e9-7ae5-884b00009002",
             "type": "attributemetadata",
             "mediaType": "application/json"
         },
         "id": "acd884ce-b44f-11e9-7ae5-884b00009002",
         "name": "Hull material (add-on)",
         "type": "string",
         "required": false
     },
     {
         "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/33b2fe47-b465-11e9-7ae5-884b0001562f",
             "type": "attributemetadata",
             "mediaType": "application/json"
         },
         "id": "33b2fe47-b465-11e9-7ae5-884b0001562f",
         "name": "CD-Rom available",
         "type": "boolean",
         "required": false
     },
     {
         "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/33b30b2e-b465-11e9-7ae5-884b00015630",
             "type": "attributemetadata",
             "mediaType": "application/json"
         },
         "id": "33b30b2e-b465-11e9-7ae5-884b00015630",
         "name": "Presence of type-C connector",
         "type": "boolean",
         "required": false
     }
]
```

After executing this query, the "Body Material" field will be updated to "Body Material (Additional)". New fields "Presence of CD-Rom" and
"Presence of a type-C connector" with a type checkbox.

### Display additional fields via JSON API

To display a list of attributes of an entity (in this case, a product), you need to execute a GET request

> Request

```shell
curl
     -X GET
     -u login:password
     -H "Lognex-Pretty-Print-JSON: true"
     "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes"
```

> In response, we get a list of created attributes


```json
{
  "meta": {
    "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes",
    "type": "attributemetadata",
    "mediaType": "application/json",
    "size": 3,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/acd884ce-b44f-11e9-7ae5-884b00009002",
        "type": "attributemetadata",
        "mediaType": "application/json"
      },
      "id": "acd884ce-b44f-11e9-7ae5-884b00009002",
      "name": "Hull material (add-on)",
      "type": "string",
      "required": false
    },
    {
      "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/33b2fe47-b465-11e9-7ae5-884b0001562f",
        "type": "attributemetadata",
        "mediaType": "application/json"
      },
      "id": "33b2fe47-b465-11e9-7ae5-884b0001562f",
      "name": "CD-Rom available",
      "type": "boolean",
      "required": false
    },
    {
      "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/33b30b2e-b465-11e9-7ae5-884b00015630",
        "type": "attributemetadata",
        "mediaType": "application/json"
      },
      "id": "33b30b2e-b465-11e9-7ae5-884b00015630",
      "name": "Presence of type-C connector",
      "type": "boolean",
      "required": false
    }
  ]
}

```

If you specify the id of a specific attribute in the request, then we will get only it.

> Request

```shell
curl
     -X GET
     -u login:password
     -H "Lognex-Pretty-Print-JSON: true"
     "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/acd884ce-b44f-11e9-7ae5-884b00009002"
```

> Result

```json
       {
         "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/acd884ce-b44f-11e9-7ae5-884b00009002",
             "type": "attributemetadata",
             "mediaType": "application/json"
         },
         "id": "acd884ce-b44f-11e9-7ae5-884b00009002",
         "name": "Hull material (add-on)",
         "type": "string",
         "required": false
       }
```

### Editing additional fields via JSON API

If you need to change one additional field without affecting the existing ones, it is convenient to use the following query. For example, you need to change
attribute name to make it more complete. Let's change the name of the attribute "Presence of CD-Rom" to "Presence of CD/DVD-Rom".

To change the properties of an existing additional field, you must execute a PUT request containing its id, and pass the changeable values in the request body.
properties. Note that the "type" property cannot be changed. Change the name of the attribute "Presence of CD-Rom":

> Request

```shell
curl -X PUT
   -u login:password
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
   "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/33b2fe47-b465-11e9-7ae5-884b0001562f"
   -d '{
         "name":"CD/DVD-Rom available"
       }'
```

> Result:

```json
{
     "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/33b2fe47-b465-11e9-7ae5-884b0001562f",
         "type": "attributemetadata",
         "mediaType": "application/json"
     },
     "id": "9e9baa04-b455-11e9-7ae5-884b0000c7d9",
     "name": "Presence of CD/DVD-Rom",
     "type": "boolean",
     "required": false
}
```
The field "Presence of CD-Rom" is changed to "Presence of CD/DVD-Rom". Unspecified properties will remain unchanged.

### Removing an additional field via JSON API

Some attributes may become irrelevant. For example, such a useful thing as a DVD drive is becoming increasingly difficult to find. Such additional fields
can be deleted even if they have been made mandatory and have been completed.
To remove an additional field via the JSON API, you must execute a DELETE request containing the field id.

> Request

```shell
curl -X DELETE
   -u login:password
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
   "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/33b2fe47-b465-11e9-7ae5-884b0001562f"
```

We will receive an empty response with a status of 200. The attribute with the specified id will be removed.

### Bulk removal of additional fields via JSON API
To delete several attributes at once, you need to execute the following POST request, specifying the meta data of the fields to be deleted in the body:

> Request

```shell
curl -X POST
   -u login:password
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
   "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/delete"
   -d'[
          {
              "meta": {
                  "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/acd884ce-b44f-11e9-7ae5-884b00009002",
                  "type": "attributemetadata",
                  "mediaType": "application/json"
              }
          },
          {
              "meta": {
                  "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/33b30b2e-b465-11e9-7ae5-884b00015630",
                  "type": "attributemetadata",
                  "mediaType": "application/json"
              }
          }
        ]'
```

We will also receive an empty response with a status of 200. As a result, the specified attributes have been removed. If you specify the meta of a non-existent attribute in the body of such a request, then the entire request will not be executed, even if it contains existing meta.
