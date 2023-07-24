# Kladana JSON API
## General Info
### Authentication

You can integrate Kladana using the Kladana JSON API. To do this, you first need to log in to Kladan. Kladana supports authentication using the Basic Auth protocol and an access token. 

- When authenticating using the Basic Auth protocol along with a request, the `Authorization` header is passed with the value of the `login:password` pair encoded in the RFC2045-MIME variant of the Base64 standard.

- When authenticating using an access token, the `Authorization` header with a value of `Bearer <Access-Token>` is sent along with the request.
 
Authentication using the Basic Auth protocol with automatic generation of the corresponding header and the ability to specify a header for token authentication is supported in many HTTP clients, such as Postman, curl, etc.

#### Getting a new token

Request for a new token. As in other requests, in the `Authorization` header, the `login:password` pair is indicated encoded in the RFC2045-MIME version of the Base64 standard. When a new access token is generated, the previously generated user tokens are revoked.

- **access_token** — access token

> Example: Request for a new token

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/security/token"
   -H "Authorization: Basic <Credentials>"
```
> Response 200 (application/json): Successful request. The result is a JSON object containing the token.

```json
{
   "access_token": "0cbfc512618efa7d5fa306250bca064c1169b37c"
}
```

### Client Application Development Considerations

When developing a client application, consider the following points:

   + The structure of responses and field types are kept unchanged by us.
   + A new field can be added without disturbing the structure of the response.
   + New resources can be added.


### Restrictions

The Kladana JSON API has the following restrictions: 

- Under 45 requests per 3 seconds for an account.
- Under 5 parallel requests from a user.
- Under 20 parallel requests for an account. 
- Under 8 Kb in the request header (URL, User-Agent, Authorization, etc). 
- Under 20 MB of data in a request sent to the server. 
- Under 4 asynchronous tasks queued for an account. 
- Under 1000 elements of objects (items, materials, products) in one array for a request. If the number of elements exceeds the number allowed, an error with status 413 occurs. If the number of items exceeds the limit, use the resources described separately for each entity.

### Data types

| Name | Description                                                                                                                                                                                        |
| ------ |----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| 
| **Array(Type)** | An array of objects/values. 'Type' is a type of array elements.                                                                                                                                    |
| **Boolean** | Represents a `true` or `false` value.                                                                                                                                                              |
| **DateTime** | Represents a string in the 'yyyy-mm-dd hh-mm-ss' format. Example: `'2016-08-23 15:21:09'`.                                                                                                         |
| **Enum** | Represents a string that takes a constant set of values.                                                                                                                                           |
| **Float** | Represents a fractional numeric value. Example: `200.8`.                                                                                                                                           |
| **int** | Represents an integer numeric value in the range of -2^31 - 2^31. Example: `200`.                                                                                                                  |
| **Long** | Represents an integer numeric value in the range of -2^63 - 2^63. Example: `1613766951558`.                                                                                                        |
| **Meta** | Represents an object in the metadata format.                                                                                                                                                       |
| **MetaArray** | An object with **meta** and **rows** fields, where **rows** is an array of objects. The elements of the **rows** array can be queried using the expand query parameter of the corresponding field. |
| **Object** | Represents an entity with nested fields.                                                                                                                                                           |
| **String(MaxLength)** | Represents text data as a sequence of UTF-8 characters. 'MaxLength' is maximum string length for a particular field. Example: `'Moscow'`.                                                          |
| **URL** | An FRC 3986 and RFC 3987 compliant URI string. Example: `'https://app.kladana.in/api/remap/1.2/entity/counterparty'`.                                                                              |
| **UUID** | Represents a string in UUID format. Example': `'12a8b923-692c-11e6-8a84-bae500000053'`.                                                                                                            |


### Metadata

There are several kinds of Metadata in JSON. One of them is the **meta** field, which appears in most
JSON representations of objects, and contains information about the object or issue, and can also be used as a link
to another object. The **meta** field is an object with the following attributes:

| Title | Type | Description |
| ----- | ---- | -------------|
| **href** | URL | Link to object |
| **metadataHref** | URL | Link to entity metadata (Another kind of metadata. Not present in all entities) |
| **type** | String(255) | Object type |
| **mediaType** | String(255) | The type of data that comes in response from the service, or is sent in the request body. Within this API is always equal to `application/json` |
| **uuidHref** | URL | Reference to an object on the UI. Not present in all entities. Can be used to get uuid |
| **downloadHref** | URL | Link to download Images and thumbnail images. This parameter is indicated only in **meta** for the Image of the Product or Bundle, as well as in the *miniature* field wherever images are used. If the thumbnail has not been created, then the value of this field is `null`. To create a thumbnail, you need to follow the link specified in `href` in the thumbnail. |

###### Extended meta object attributes

The following attributes of the **meta** object appear, as a rule, in the methods for returning a list of entities/rows of a report.
They contain information about the issuance that came in response. In **meta** objects containing
data about only one object (for example, the **meta** field in the **context** object) the attributes listed below do not appear.

| Title | Type | Description |
| ---------- | ---- | ---------- |
| **size** | int | Size of the returned list |
| **limit** | int | The maximum number of elements in the returned list. The maximum number of elements in the list is 1000. |
| **offset** | int | Indent in the given list |

###### Entity metadata

Another kind of Metadata. Represents a separate resource containing information about all entity objects of a given type.
**Not available for every entity.** Present only for those entities for which this documentation describes the resource "Metadata <entity_name>".
As a rule, it contains information about nested entities, collections, and additional fields.

The JSON API allows you to get the metadata of all entities using the `/entity/metadata` method. You can also limit
selection by specifying only the necessary entities in the **type** filter.

> Example of a request to get metadata using GET:

```shell
curl -X GET
  "https://app.kladana.in/api/remap/1.2/entity/metadata?filter=type=product;type=service;type=demand"
  -H "Authorization: Bearer <Access-Token>"
```

> Example of the request body:

```json
{
  "service": {
    "meta": {
      "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
      "mediaType": "application/json"
    }
  },
  "product": {
    "meta": {
      "href": "https://app.kladana.in/api/remap/1.2/entity/product/metadata",
      "mediaType": "application/json"
    }
  },
  "demand": {
    "meta": {
      "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
      "mediaType": "application/json"
    }
  }
}
```

###### Meta of Collection

**meta** of collections contains all the same attributes as **meta** of entities, however, if more appear in the list
items than fit on one page (size > limit) the following are added to the **meta** object. fields:

| Title | Type | Description |
| ------| ---- | -------------|
| **nextHref** | URL | Link to the next page of entities. |
| **previousHref** | URL | Link to the previous entity page. |

**meta** with such fields can be encountered when executing requests to get all objects of a certain type
  on an account (for example, requesting all shipments), as well as when requesting all items of a single document.

### Error processing

#### Error structure

An error in the Kladana API is an 'Error' array containing 'Error' objects. Each object describes a single error.

#### Structure of the 'Error' object

| Name | Type | Description |
|------|------|-------------|
| **error** | String(255) | Error name<br>`+Required for response` |
| **parameter** | String(255) | The parameter on which the error occurred |
| **code** | int | Error code. If the field contains nothing, see HTTP status code |
| **error_message** | String(255) | Message attached to the error |
| **moreInfo** | link | Link to the error received documentation |
| **line** | int | The JSON string where the error occurred |
| **column** | int | The coordinate of the element in the `line` string where the error occurred |
| **dependencies** | Array Meta | Metadata list of dependent entities or documents. It is displayed when it is impossible to delete an entity or a document. If there are dependencies on the entity, the document is deleted |
| **meta** | meta | Metadata of the entity on which the error occurred |

#### Returned HTTP error statuses and their description

| HTTP status code | Description |
| -----------------| ----------- |
| **301** | The requested resource has another URL |
| **303** | The requested resource has another URL. Use GET request to find it |
| **400** | The transmitted request has a JSON structure error |
| **401** | Incorrect username or password, or the user or account has been blocked |
| **403** | No permission to view the object |
| **404** | The requested resource does not exist |
| **405** | HTTP method specified incorrectly for the requested resource|
| **409** | The specified object is in use and cannot be deleted |
| **410** | API version no longer supported |
| **412** | A required query string parameter or JSON structure field was not specified |
| **413** | The size of the request or the number of elements in the request exceeds the limit. For instance, the number of items passed in the **positions** array exceeds 1000 |
| **429** | Request limit was exceeded |
| **500** | An unexpected error occurred while processing the request |
| **502** | Service temporarily unavailable |
| **503** | Service temporarily disabled |
| **504** | Service timeout exceeded Please try again later |

Along with the error response body, you may receive the following headers:

- X-Lognex-Auth — Extended authentication error code.
- X-Lognex-Auth-Message — Error message.
- X-Lognex-API-Version-Deprecated — The date the requested API version was disabled.
- Location — The requested resource's current URL (if you receive 301 or 303 code as a response).

Use the following headers to learn the limits of the remaining requests:

- X-RateLimit-Limit — The number of requests that can be made before the 429 error occurs.
- X-Lognex-Retry-TimeInterval — Interval in milliseconds during which these requests can be made.
- X-RateLimit-Remaining — The number of requests that can be sent before 429 error receiving.
- X-Lognex-Reset — Time before limit reset in milliseconds. Equal to zero if the limit is not set.
- X-Lognex-Retry-After — Time before the restriction reset in milliseconds.

### Additional fields

Additional fields allow you to extend the set of properties of some entities by adding your own typed fields.
The JSON API allows you to create, update, and delete additional fields and their values.

List of entities with additional fields:

+ [Contract](dictionaries/#suschnosti-dogowor)
+ [Counterparty](dictionaries/#suschnosti-kontragent)
+ [Legal entity](dictionaries/#suschnosti-jurlico)
+ [Project](dictionaries/#suschnosti-proekt)
+ [Warehouse](dictionaries/#suschnosti-sklad)
+ [Employee](dictionaries/#suschnosti-sotrudnik)
+ [Product](dictionaries/#suschnosti-towar)
+ [Service](dictionaries/#suschnosti-usluga) (located in the Product metadata)
+ [Bundle](dictionaries/#suschnosti-komplekt) (located in the Product metadata)
+ [Series](dictionaries/#suschnosti-seriq)
+ All transactions:
  - [Sales Returns](documents/#dokumenty-vozwrat-pokupatelq)
  - [Purchase Returns](documents/#dokumenty-vozwrat-postawschiku)
  - [Incoming Payment](documents/#dokumenty-vhodqschij-platezh)
  - [Sales Order](documents/#dokumenty-zakaz-pokupatelq)
  - [Purchase Order](documents/#dokumenty-zakaz-postawschiku)
  - [Outgoing Payment](documents/#dokumenty-ishodqschij-platezh)
  - [Stock Adjustment](documents/#dokumenty-oprihodowanie)
  - [Shipment](documents/#dokumenty-otgruzka)
  - [Transfer](documents/#dokumenty-peremeschenie)
  - [Receiving](documents/#dokumenty-priemka)
  - [Incoming Cash Payment](documents/#dokumenty-prihodnyj-order)
  - [Outgoing Cash Payment](documents/#dokumenty-rashodnyj-order)
  - [Write-off](documents/#dokumenty-spisanie)
  - [Inventory Count](documents/#dokumenty-inwentarizaciq)
  - [Sales Invoice](documents/#dokumenty-schet-pokupatelu)
  - [Supplier Invoice](documents/#dokumenty-schet-postawschika)
  - [Internal Order](documents/#dokumenty-vnutrennij-zakaz)
  - [Production Order](documents/#dokumenty-zakaz-na-proizwodstwo)

You can view all the additional fields that have been created using a request to get entity metadata.
The response contains a description of the additional fields in the form of an **attributes** collection if the specified entity works with additional fields.

#### Description attributes of additional fields

| Title | Type | Description |
| ----- | -----| ----------- |
| **description** | String(4096) | Description of additional fields |
| **id** | UUID | Additional fields ID<br>`+Required for response` `+Read only` |
| **meta** | [Meta](#mojsklad-json-api-obschie-swedeniq-metadannye) | Link to metadata fields<br>`+Required when replying` |
| **name** | String(255) | Name of additional fields<br>`+Required when replying` `+Required when creating` |
| **required** | Boolean | Is the additional field required<br>`+Required when replying` |
| **show** | Boolean | Whether to show additional field on UI. Cannot be hidden and required at the same time. Operations only<br>`+Required when replying` |
| **type** | Enum | Add-on type fields<br>`+Required when replying` `+Required when creating` `+After filling, unavailable for editing` |

Additional fields of a particular entity is an internal collection of **attributes**. The collection is represented as an array of additional field objects with values.

#### Attributes of additional fields with the value

| Title | Type | Description |
| --------- |-------- | ------------------ |
| **id** | UUID | ID of the corresponding additional fields |
| **meta** | [Meta](#mojsklad-json-api-obschie-swedeniq-metadannye) | Link to metadata fields |
| **name** | String(255) | Name of additional fields |
| **value** | Depends on type, see below | The value specified in the additional field |

Possible values of the type of additional fields (field **type**) and their corresponding type values in JSON, as well as
**value** attribute types in the JSON object of the additional field with the corresponding type:

| Attribute type | The value of the type field in JSON | JSON value field type |
| -------------------- | ---------------------- | --------------------- |
| Date | time | string |
| Directory | {entityType} | object** |
| Link | link | string |
| String | string | string |
| Text | text | string |
| File | file | string |
| Checkbox | boolean | boolean |
| Fractional number | double | number |
| Number integer | long | number |

Additional fields of the File and Checkbox types cannot be required (the **required** field cannot be `true`).

When passing a `null` value in the **value** field, the value of the corresponding additional fields is reset.

#### Additional fields of the 'list' type

The **type** value in view object of the additional field differs depending on which the list of entities was
selected when creating an additional field.

#### Examples of the **type** value for an additional field of the 'list' type

| Reference entity type | The value of the type field in JSON (entityType) |
| ---------------------------------- | ---------------------------------- |
| [Contract] | contract |
| [Account] | counterparty |
| [Project] | project |
| [Warehouse] | store |
| [Employee] | employee |
| [Product] | product |
| User directory_name | customization |

If as a type of additional field is selected [Entities](dictionaries/#suschnosti-pol-zowatel-skij-sprawochnik), then as part of the object of this
additional field, a new attribute **customEntityMeta** will appear, which is a link to the metadata of this list.
The full set of attributes fields will look like this:

| Title | Type | Description |
| -------------------- |--------------------- |------------------- |
| **customEntityMeta** | [Meta](#mojsklad-json-api-obschie-swedeniq-metadannye) | Link to user directory metadata |
| **description** | String(4096) | Description of additional fields |
| **id** | UUID | ID additional fields |
| **meta** | [Meta](#mojsklad-json-api-obschie-swedeniq-metadannye) | Link to metadata fields |
| **name** | String(255) | Name of additional fields |
| **required** | Boolean | Is the additional field required |
| **show** | Boolean | Whether to show additional field on UI. Cannot be hidden and required at the same time. Operations only |
| **type** | Enum | Add-on type fields |

With the selected type of the 'list' field, the **value** attribute will be an object with the following properties:

| Title | Type | Description |
| -------- | ---- | --------------- |
| **meta** | [Meta](#mojsklad-json-api-obschie-swedeniq-metadannye) | Metadata of the entity of the corresponding directory |
| **name** | String(255) | Name of the corresponding entity |

Resetting extra. field type "reference" occurs in the same way as when working with other additional fields.
In the update request, in the **attributes** collection, you must specify the object with the **id** of this field, and pass `null` as **value**.

A collection of fields can only work in the context of a single entity. Additional fields and their values
can be passed in the **attributes** collection in the request body for both creating and updating an entity.
As an indication, for additional fields you need to use the **meta** field.
In the passed array of objects, you can specify not all the extras. fields - only the specified ones will be initialized/updated.

#### Additional fields of file type

To load the value for additional fields of the file type, you need to specify an object of the following structure in JSON when creating or updating the field value:

| Title | Type | Description |
| ----- |---- | ---------- |
| **filename** | String(255) | File name<br>`+Required when replying` `+Required when creating` |
| **content** | string | File bytes encoded in base64<br>`+Required when responding` `+Required when creating` |

An example of specifying a value for additional file type fields are in the [product creation] section (dictionaries/#suschnosti-towar-sozdat-towar)

### Additional entity fields
Request for additional entity fields.
The list of available entity types is listed [here](#mojsklad-json-api-obschie-swedeniq-rabota-s-dopolnitel-nymi-polqmi).

The structure of the object additional fields are described in detail in the section [Working with additional fields](#mojsklad-json-api-obschie-swedeniq-rabota-s-dopolnitel-nymi-polqmi).

**Parameters**

| Parameter | Description |
| ----------| ------------|
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **entityType** | `string` *Example: demand* type of entities for which additional control is carried out. fields. |

#### Get all additional fields for the specified type
Request for all additional fields for the passed entity type.
Result: JSON object including fields:

| Title | Type | Description |
| ------| ------|------------- |
| **meta** | [Meta](#mojsklad-json-api-obschie-swedeniq-metadannye) | Issuance metadata |
| **rows** | Array(Object) | An array of JSON objects representing the additional fields. |

> Get additional shipping fields

```shell
curl -X GET
  "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes"
  -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of addotional shipping fields.

```json
{
  "meta": {
      "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes",
      "mediaType": "application/json"
  },
  "rows": [
    {
      "meta": {
          "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/9862d46e-6500-11e8-9464-e4de00000045",
          "type": "attributemetadata",
          "mediaType": "application/json"
      },
      "id": "9862d46e-6500-11e8-9464-e4de00000045",
      "name": "String",
      "type": "string",
      "required": false,
      "show": true,
      "description": "Field-string"
    },
    {
      "meta": {
          "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/98630aee-6500-11e8-9464-e4de00000046",
          "type": "attributemetadata",
          "mediaType": "application/json"
      },
      "id": "98630aee-6500-11e8-9464-e4de00000046",
      "name": "Integer",
      "type": "long",
      "required": true,
      "show": true
    },
    {
      "meta": {
          "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/98630f62-6500-11e8-9464-e4de00000047",
          "type": "attributemetadata",
          "mediaType": "application/json"
      },
      "id": "98630f62-6500-11e8-9464-e4de00000047",
      "name": "Field-date",
      "type": "time",
      "required": false,
      "show": true
    },
    {
      "meta": {
          "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/986314b4-6500-11e8-9464-e4de00000048",
          "type": "attributemetadata",
          "mediaType": "application/json"
      },
      "id": "986314b4-6500-11e8-9464-e4de00000048",
      "name": "List-prodict",
      "type": "productfolder",
      "required": true,
      "show": true
    },
    {
      "meta": {
          "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/986318cd-6500-11e8-9464-e4de00000049",
          "type": "attributemetadata",
          "mediaType": "application/json"
      },
      "id": "986318cd-6500-11e8-9464-e4de00000049",
      "name": "File",
      "type": "file",
      "required": false,
      "show": true
    },
    {
      "meta": {
          "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/98631cbf-6500-11e8-9464-e4de0000004a",
          "type": "attributemetadata",
          "mediaType": "application/json"
      },
      "id": "98631cbf-6500-11e8-9464-e4de0000004a",
      "name": "Fractional number",
      "type": "double",
      "required": true,
      "show": true,
      "description": "Field--fractional"
    },
    {
      "meta": {
          "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/986320d6-6500-11e8-9464-e4de0000004b",
          "type": "attributemetadata",
          "mediaType": "application/json"
      },
      "id": "986320d6-6500-11e8-9464-e4de0000004b",
      "name": "Boolean",
      "type": "boolean",
      "required": false,
      "show": true
    },
    {
      "meta": {
          "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/98632583-6500-11e8-9464-e4de0000004c",
          "type": "attributemetadata",
          "mediaType": "application/json"
      },
      "id": "98632583-6500-11e8-9464-e4de0000004c",
      "name": "Text",
      "type": "text",
      "required": true,
      "show": true
    },
    {
      "meta": {
          "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/98632a03-6500-11e8-9464-e4de0000004d",
          "type": "attributemetadata",
          "mediaType": "application/json"
      },
      "id": "98632a03-6500-11e8-9464-e4de0000004d",
      "name": "Link",
      "type": "link",
      "required": false,
      "show": true
    }
  ]
}
```

#### Create additional fields
The action is only available to a user with administrative rights.<br>
Request to create a new fields for the specified entity type.

> Creation of two new additional shipping fields.

```shell
curl -X POST
  "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes"
  -H "Authorization: Basic <Credentials>"
  -H 'Content-Type: application/json' \
  -d '[
        {
          "name": "String",
          "type": "string",
          "required": false,
          "description": "Field-string"
        },
        {
          "name": "Integer",
          "type": "long",
          "required": true
        }
      ]'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created additional fields.

```json
[
  {
    "meta": {
      "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/7bc578d8-6501-11e8-9464-e4de00000004",
      "type": "attributemetadata",
      "mediaType": "application/json"
    },
    "id": "7bc578d8-6501-11e8-9464-e4de00000004",
    "name": "String",
    "type": "string",
    "required": false,
    "show": true,
    "description": "Field-string"
  },
  {
    "meta": {
      "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/7bd3d688-6501-11e8-9464-e4de00000005",
      "type": "attributemetadata",
      "mediaType": "application/json"
    },
    "id": "7bd3d688-6501-11e8-9464-e4de00000005",
    "name": "Integer",
    "type": "long",
    "required": true,
    "show": true
  }
]
```
> An example of creating a new additional fields of Shipments and updates of the existing one request.

```shell
curl -X POST
  "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes"
  -H "Authorization: Basic <Credentials>"
  -H 'Content-Type: application/json' \
  -d '[
        {
          "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/7bc578d8-6501-11e8-9464-e4de00000004",
            "type": "attributemetadata",
            "mediaType": "application/json"
          },
        "name": "String field",
           "required": true
           "description": "Field-string"
         },
         {
           "name": "Integer2",
          "type": "long",
          "required": true
        }
      ]'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created and updated addon. fields.

```json
[
  {
    "meta": {
      "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/7bc578d8-6501-11e8-9464-e4de00000004",
      "type": "attributemetadata",
      "mediaType": "application/json"
    },
    "id": "7bc578d8-6501-11e8-9464-e4de00000004",
  "name": "String field",
     "type": "string",
     "required": true
     "show": true
     "description": "Field-string"
  },
  {
    "meta": {
      "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/c66edb30-6501-11e8-9464-e4de00000008",
      "type": "attributemetadata",
      "mediaType": "application/json"
    },
    "id": "c66edb30-6501-11e8-9464-e4de00000008",
    "name": "Integer2",
    "type": "long",
    "required": true,
    "show": true
  }
]
```

> An example of creating an additional field of the user directory type.

```shell
curl -X POST
  "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes"
  -H "Authorization: Basic <Credentials>"
  -H 'Content-Type: application/json' \
  -d '{
        "customEntityMeta": {
          "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/metadata/customEntities/0347beb0-a785-11e9-ac12-000800000003",
          "type": "customentitymetadata",
          "mediaType": "application/json"
        },
        "name": "Additional field of the user directory type",
        "type": "customentity",
        "required": false
      }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated addon. fields.

```json
{
  "meta": {
    "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/53eb36a5-a78a-11e9-ac12-000c00000000",
    "type": "attributemetadata",
    "mediaType": "application/json"
  },
  "customEntityMeta": {
    "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/metadata/customEntities/0347beb0-a785-11e9-ac12-000800000003",
    "type": "customentitymetadata",
    "mediaType": "application/json"
  },
  "id": "53eb36a5-a78a-11e9-ac12-000c00000000",
  "name": "Additional field of the user directory type",
  "type": "customentity",
  "required": false,
  "show": true
}
```
#### Remove additional fields
The action is only available to a user with administrative rights.<br>
Request to remove multiple additional shipping fields.

> Removing two extra fields in one request

```shell
curl -X POST
  "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/delete"
  -H "Authorization: Basic <Credentials>"
  -H 'Content-Type: application/json' \
  -d '[
        {
          "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/986318cd-6500-11e8-9464-e4de00000049",
            "type": "attributemetadata",
            "mediaType": "application/json"
          }
        },
        {
          "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/98631cbf-6500-11e8-9464-e4de0000004a",
            "type": "attributemetadata",
            "mediaType": "application/json"
          }
        }
      ]'
```

> Response 200(application/json)
Successful removal of fields.

### Additional field
**Parameters**

| Parameter | Description |
| ----------- | -------- |
| **id** | `string` (required) *Example: 7bc578d8-6501-11e8-9464-e4de00000004* Additional field ID |

#### Get an additional field

Request for a separate additional shipment fields with the specified id.


> Request for a separate additional shipping fields

```shell
curl -X GET
  "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/7bc578d8-6501-11e8-9464-e4de00000004"
  -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional shipping fields.

```json
{
  "meta": {
    "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/7bc578d8-6501-11e8-9464-e4de00000004",
    "type": "attributemetadata",
    "mediaType": "application/json"
  },
   "id": "7bc578d8-6501-11e8-9464-e4de00000004",
   "name": "String field",
   "type": "string",
   "required": true
   "show": true
   "description": "Field-string"
}
```

#### Change additional field
The action is only available to a user with administrative rights.<br>
Request to update a separate additional fields for the passed entity type.

> Request to update additional shipping fields

```shell
curl -X PUT
  "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/7bc578d8-6501-11e8-9464-e4de00000004"
  -H "Authorization: Basic <Credentials>"
  -H 'Content-Type: application/json' \
  -d '{
        "name": "updated String field",
         "required": false
         "description": "Updated field-string"
      }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the additional shipping fields.

```json
{
  "meta": {
    "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/7bc578d8-6501-11e8-9464-e4de00000004",
    "type": "attributemetadata",
    "mediaType": "application/json"
  },
  "id": "7bc578d8-6501-11e8-9464-e4de00000004",
   "name": "updated String field",
   "type": "string",
   "required": false
   "show": true
"description": "Updated field-string"
}
```
#### Delete additional field
The action is only available to a user with administrative rights.<br>
Request for deletion shipment fields with the specified id.

> Request to remove additional shipping fields

```shell
curl -X DELETE
  "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/7bc578d8-6501-11e8-9464-e4de00000004"
  -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful removal of fields.

### Update the values of additional fields
Request to update collection fields of a particular entity.

> Request to update additional shipping fields

```shell
curl -X PUT
  "https://app.kladana.in/api/remap/1.2/entity/demand/7bc578d8-6501-11e8-9464-e4de00000001"
  -H "Authorization: Basic <Credentials>"
  -H 'Content-Type: application/json' \
  -d '{
        "attributes": [
          {
            "meta": {
              "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/986314b4-6500-11e8-9464-e4de00000048",
              "type": "attributemetadata",
              "mediaType": "application/json"
            },
            "value": "new string"
          }
        ]
      }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the shipment with updated extras. fields.

```json
{
...
  "attributes": [
    {
      "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/attributes/986314b4-6500-11e8-9464-e4de00000048",
        "type": "attributemetadata",
        "mediaType": "application/json"
      },
      "id": "986314b4-6500-11e8-9464-e4de00000048",
      "name": "String field",
      "typ  e": "string",
      "value": "new string"
    }
  ]
...
}
```
### Working with transaction items

The Kladana API allows you to operate with the following transactions: 

- [Shipment](documents/#dokumenty-otgruzka), 
- [Sales order](documents/#dokumenty-zakaz-pokupatelq), 
- [Sales invoice](documents/#dokumenty-schet-pokupatelu), 
- [Stock Adjustment](documents/#dokumenty-oprihodowanie),
- [Internal order](documents/#dokumenty-vnutrennij-zakaz), 
- [Inventory](documents/#dokumenty-inwentarizaciq), 
- [Write-off](documents/#dokumenty-spisanie), 
- [Transfer](documents/#dokumenty-peremeschenie), 
- [Production order](documents/#dokumenty-zakaz-na-proizwodstwo), 
- [Purchase Return](documents/#dokumenty-vozwrat-postawschiku), 
- [Purchase Order](documents/#dokumenty-zakaz-postawschiku), 
- [Sales Return](documents/#dokumenty-vozwrat-pokupatelq), 
- [Receiving](documents/#dokumenty-priemka), 
- [Supplier Invoice](documents/#documenty-schet-postawschika). 

The transactions contain items that can be worked with both as part of a separate transaction, and with the help of special resources for managing transaction items.

###### Working with items within a separate document

When working with items within a separate document, they can be passed as the **positions** field, which is an array of document items, as part of the object used
in a request to modify or create a document. In this case, the array of items is perceived as a set of all items of the document
and completely replaces (in the case of an update request) all already existing items in the document. In the case of an update request, all items that previously existed in the document are
but were not passed in the body of the update request will be deleted, all existing items whose id matches the id of the transmitted items in the request body will be updated,
and new items that were not previously among the existing items of the document will be added to the list of items.

###### Working with document items using special resources

The JSON API provides special resources for managing document items. These resources are usually available at the following URI and you can use them to remove items from the document by making a request with the DELETE method to the URL of the corresponding resource with the item id:

+ `/{document entity code, as part of the JSON API}/{id of a single document}/positions/{id of a single position}`

> Sample URL for delete request with DELETE:

```shell
curl -X DELETE 
  "https://app.kladana.in/api/remap/1.2/{document entity code, as part of the JSON API}/{id of a separate document}/positions/179dd832-960c-11e6-8a84-bae5000000dc
  -H "Authorization: Bearer <Access-Token>"
```


When working with special resources, you can request a list of all document items, create new items, and update existing ones. When creating new items using these resources, you can bypass the limit of 1000 items per document. Also, using this resource, you can manage the bulk update of items. To change information on line items, you must use the document line item management resources that are available by URI:

+ `/{document entity code, as part of the JSON API}/{id of a single document}/positions/{id of a single position}`

Both ways of working with items are also described in the documentation for each of the documents.

It is also possible to bulk delete document items using the POST method to the URL of the corresponding resource. In the body of the request, you must specify an array of items to be deleted, specifying the meta field for each of the items.

> An example URL for a request to bulk delete items using POST:

```shell
curl -X POST
  "https://app.kladana.in/api/remap/1.2/{document entity code, as part of the JSON API}/{id of a separate document}/positions/delete
  -H "Authorization: Bearer <Access-Token>"
```

> Sample request body:

```json
[
  {
    "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/demand/405f69c0-019e-11e6-9464-e4de00000085/positions/727cf336-0310-11e6-9464-e4de00000013",
        "type": "demandposition",
        "mediaType": "application/json"
    }
  },
  {
    "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/demand/405f69c0-019e-11e6-9464-e4de00000085/positions/727cfce0-0310-11e6-9464-e4de00000014",
        "type": "demandposition",
        "mediaType": "application/json"
    }
  },
  {
    "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/demand/405f69c0-019e-11e6-9464-e4de00000085/positions/727d057f-0310-11e6-9464-e4de00000015",
        "type": "demandposition",
        "mediaType": "application/json"
    }
  }
]
```

### Balances and cost in document items

> Representation of balances and cost as part of an item

```json
stock: {
     cost: 5000
     "quantity": 999,
     "reserve": 90
     "in transit": 9,
     available: 918
}
```

When requesting and updating transactions, it is possible to receive the balances and cost of the items of the transactions. To get stock and cost in transaction items, you need to pass an additional parameter `fields=stock` in the request. For example,

+ `/customerorder/{document id}?fields=stock&expand=positions`

Stock and cost can be obtained from the following transactions: `[Shipment, Sales Order, Sales Invoice, Purchase Order, Purchase Invoice, Receiving, Purchase Return, Sales Return]`

Balances and cost price for transactions **Shipment**, **Receiving**, **Purchase Return**, **Sales Return** are calculated at the time of the field **moment** in the transactions. For **Sales Order**, **Sales Invoice**, **Purchase Order**, **Purchase Invoice** are calculated at the current time.

You can get balances with cost for the following queries:

+ Getting a list of operations
+ Getting a single operation
+ Getting operation items
+ Retrieve a line item of an operation
+ Update operation
+ Item update

When compiling a request to get a list of operations, you must additionally pass the `limit` parameter with a value not exceeding 100.
For example,

+ `/customerorder?fields=stock&expand=positions&limit=100`

For Sales Returns without reason and retail returns without reason, the `cost` field will be absent in the `stock` composition.


### Purpose of the syncId field

Entities that have the **syncId** field among their attributes need it so that in case of a failure
when re-sending a request to create a new entity, there was no duplication of objects. If in the request body
specify the syncId generated on the client to create an entity, then when you resend the same request (with the same syncId), instead of creating
entities with identical fields, a previously created entity will be returned.
Entities that support the **syncId** field can be deleted using a url like `/entity/{type}/syncid/{id}`.

### Create and update an object

When creating an object, it is enough to fill in only the fields marked `Required`. These fields are only used when creating, they are not required when updating.
Fields marked `Read Only` are ignored when creating/updating the object.

### Create and update multiple objects

When using the POST method, you can specify in the request body instead of one -
entity array. To do this, you need to pass an array (start the request body with `[` and end with `]`) that will contain the JSON representation
objects you want to create or update. Updated entities must contain the identifier in the form of metadata.
If the entity is not found during the update, it will be created.

It is also possible to bulk delete entities if you specify a url like `/entity/{type}/delete` when using the POST method.

The limit for creating, updating and deleting objects in a list is 1000.

### Null support

Within the JSON API, you can remove a value from a field of type object (if this field is optional, or if this field is in
the main interface may contain an empty value). For example: the Contract field (**contract**) in any of the documents. This can be done by passing
request to update the entity in the given null field. For example: `{ "contract": null }`.
Removing the currency from documents (`{rate: null}`) is equivalent to changing the currency of the document to the default currency. As a result, all
prices and amounts will be recalculated. Overhead costs will also be recalculated if they have not been explicitly stated.

Exceptions:

+ Structured address
   [Contractor](dictionaries/#suschnosti-kontragent-kontragenty-attributy-suschnosti-adres),
   [Legal entity](dictionaries/#suschnosti-jurlico-jurlica-attributy-suschnosti-adres),
   [Points of sale](dictionaries/#suschnosti-tochka-prodazh-tochki-prodazh-atributy-suschnosti-attributy-suschnosti-status-attributy-suschnosti-adres),
   [Warehouse](dictionaries/#suschnosti-sklad-sklady-attributy-suschnosti-adres),
   [Sales Order](documents/#dokumenty-zakaz-pokupatelq-zakazy-pokupatelej-attributy-suschnosti-adres-dostawki),
   [Shipments](documents/#dokumenty-otgruzka-otgruzki-attributy-suschnosti-adres-dostawki) does not support deletions by passing `null`.
To delete an address, pass an empty string `""` to the string field. Specific string fields are given in the relevant sections, the transition to which is carried out via the links above.

### Empty fields

If any of the fields of the entity was not filled in and, at the same time, it is not required, it will not be returned in the JSON representation of this entity.

### Date and time format

In the JSON API, fields of type date-time (point in time) are a string in the format:

+ No milliseconds: `YYYY-MM-DD HH:mm:ss`
+ With milliseconds: `YYYY-MM-DD HH:mm:ss.mmm` This format returns date-time fields in query responses.
+ Without seconds: `YYYY-MM-DD HH:mm` Only for filtering parameters.

Minimum value: `1970-01-01 03:00:00`

The following fields are set and output to the JSON API with minute precision, namely seconds and milliseconds set to `00`:

+ **incomingDate**
+ **commissionPeriodStart**
+ **commissionPeriodEnd**
+ **certificateDate**
+ **moment**
+ **deliveryPlannedMoment**
+ **paymentPlannedMoment**
+ **firstDemandDate**
+ **lastDemandDate**
+ additional field with type **Date**

### Sorting objects

You can use the url parameter `order` to sort the list of objects.
The value of this parameter is an **urlencoded** string with sorting conditions listed with `;`. (All examples below are unurlencoded for better readability)
Each sort condition is a combination of a field name, a comma (optional if sort direction is specified), a sort direction (optional; can take the values `asc` and `desc`. The default value is `asc`).

Sorting is supported for the following field types: numeric, string, datetime, boolean, and uuid.

Examples of queries with sorting:

+ https://app.kladana.in/api/remap/1.2/entity/supply?order=name
+ https://app.kladana.in/api/remap/1.2/entity/product?order=code,desc
+ https://app.kladana.in/api/remap/1.2/entity/product?order=name;code,desc
+ https://app.kladana.in/api/remap/1.2/entity/product?order=name,desc;code,asc

### Filtering the selection using the filter parameter

To filter the selection by several fields, you can use the `filter` url parameter.
The value of this parameter is an **urlencoded** string with search terms separated by `;`. To use the `;` character itself
text filters require two `\;` characters.
(All examples below are unurlencoded for better readability)
Each search condition is a combination of a field name, an operator, and a constant.
You can filter by all fields whose values are primitive types. Those. it is impossible to filter fields-objects and fields-arrays,
all other fields can be used in the `filter` parameter.

+ Valid operators: `['=', '>', '<', '>=', '<=', '!=', '~', '~=', '=~']`

If a search query contains an "equality" condition `=` applied to the same field several times,
then such a condition is interpreted as a set of conditions separated by a logical `OR` operator.

+ For example, the condition `filter=sum=100;sum=150` will be interpreted as `sum=100 OR sum=150`
or `sum in (100, 150)`

If there are several conditions of the form "not equal" `!=` imposed on the same variable, then they are interpreted as a collection
conditions separated by the logical operator `AND`.

+ For example, the condition `filter=name!=0001;name!=0002` will be equivalent to the following (mutually equivalent) conditions :
`name != 0001 AND name != 0002` or `name not in (0001, 0002)`

If a constraint of type "equality" is imposed on one of the fields, and then a constraint of type inequality is imposed on it, then an error will occur.

+ For example, the condition `filter=sum=100;sum>99` will cause an error.

It is allowed to use several identical comparison operators `['>', '<', '>=', '<=']` simultaneously for one field. In this case, only the first value will be used.

+ For example, the condition `filter=sum>99;sum>100` will be similar to the condition `filter=sum>99`.
In future versions, this condition will raise an error.

Filters applied to different fields are combined via logical `AND`, i.e. in a query like:

+ `filter=sum=100;moment>201 -10-11 12:00:00` the selection will be filtered by both sum and date. 

###### Check for an empty value

If you specify a construction of the form: `<field_name>=;` in the filtering line, then only objects where
this field is null (i.e., there is no value), and if the field type is string, then it will also check for an empty string, i.e. field=''.
The `<field_name>!=;` construct will check for the presence of a value. Using this construct, you can check for the presence of a value in a reference field.

#### Document filtering

You can use the **isDeleted** parameter to filter a selection of **documents**. Accepts the values `true` and `false`.

+ If set to `true`, all documents of this type that are in the trash will be returned.
+ If set to `false`, only undeleted documents will be returned.
+ You can display all documents: both deleted and not, specifying both values of this parameter in the request: `filter=isDeleted=true;isDeleted=false`.

The **printed** parameter is used to filter the selection of printed **documents**. Accepts the values `true` and `false`.

The **published** parameter is used to filter the selection of submitted **documents**. Accepts the values `true` and `false`.


#### Entity filtering

To filter a selection of **entities**, use the **archived** parameter. This parameter takes the values `true` and `false`.

+ If set to `true`, all entities of the given type that are in the archive will be returned.
+ If set to `false`, only non-archival entities will be returned.
+ You can display all entities: both archived and not, specifying both values of this parameter in the request: `filter=archived=true;archived=false`.
You can filter by the archived parameter only for those entities that have this parameter in the list of fields.

#### Filtering reference fields

With filter you can filter reference fields. If the entity has a reference field in the form of metadata,
you can use the following construction to filter the selection by this field:

+ `filter=<field_name>=<reference>`

Link example:

+ `http://app.kladana.in/api/remap/1.2/entity/<type>/<id>`

Here are some examples:

+ `filter=agent=http://app.kladana.in/api/remap/1.2/entity/counterparty/<id>`
+ `filter=ownAgent=http://app.kladana.in/api/remap/1.2/entity/organization/<id>`

Reference fields available for filtering:

+ agent
+ ownAgent
+ owner
+ group
+ parent
+ contract
+ project
+ organization
+ store
+ agentStore
+ supplier

For retail transactions ("Retail shift", "Retail sale", "Retail return", "Deposit money", "Pay out money"), filtering by:

+ retail store

Examples of requests for filtering:

+ `https://app.kladana.in/api/remap/1.2/entity/demand?filter=moment>2016-10-11 12:00:00;moment<2016-10-11 13:00:00;sum=100;name=0010;name=0011`
+ `https://app.kladana.in/api/remap/1.2/entity/counterparty?filter=name=Иван;phone=89269269222;email=vanyan@mail.krut`

#### Filtering by ID type fields

With filter, you can filter fields of type ID.

+ `filter=<field_name>=<ID>`

ID example:

+`94975104-3cad-11e8-1e44-bd4d00000084`

For example:

+ `filter=productid=94975104-3cad-11e8-1e44-bd4d00000084`

#### Filtering by additional fields

Using the filter parameter, you can filter by additional fields by adding a link to additional fields. field and filtering value. The filter value can be a string, a number, a date, or a url, depending on the addon type. fields.
Example: `filter=<reference to additional field>=<value>`

##### Available operators for filtering additional fields

| Title | JSON value field type | Value of type field in JSON |Description |
| ------| --------------------- | --------------------------- | -----------|
| **Date** | string | time | `=val`, `=`, `!=val`, `!=`, `=val;=val2`, `!=val;!=val2`, `=val;=`, `!=val; !=`, `&lt;val`, `>val`, `>=val`, `<=val`, `>=val;<=val2` |
| **Handbook** | object | {entityType} | `=val`, `=`, `!=val`, `!=`, `=val;=val2`, `!=val;!=val2`, `=val;=`, `!=val; !=` |
| **Link** | string | link | `=val`, `=`, `!=val`, `!=`, `=val;=val2`, `!=val;!=val2`, `=val;=`, `!=val; !=`, `~val`, `!~val`, `~=val`, `=~val` |
| **String** | string | string | `=val`, `=`, `!=val`, `!=`, `=val;=val2`, `!=val;!=val2`, `=val;=`, `!=val; !=`, `~val`, `!~val`, `~=val`, `=~val` |
| **Text** | string | text | `=val`, `=`, `!=val`, `!=`, `=val;=val2`, `!=val;!=val2`, `=val;=`, `!=val; !=`, `~val`, `!~val`, `~=val`, `=~val` |
| **File** | string | file | Filtering not supported |
| **Checkbox** | boolean | boolean | `=true`, `=false` |
| **The number is fractional**| number | double | `=val`, `=`, `!=val`, `!=`, `=val;=val2`, `!=val;!=val2`, `=val;=`, `!=val; !=`, `&lt;val`, `>val`, `>=val`, `<=val`, `>=val;<=val2` |
| **Integer number** | number | long | `=val`, `=`, `!=val`, `!=`, `=val;=val2`, `!=val;!=val2`, `=val;=`, `!=val; !=`, `&lt;val`, `>val`, `>=val`, `<=val`, `>=val;<=val2` |

`=val` - filter by value <br>
`=` - filter by empty value <br>
`~` - partial match <br>
`!~` - partial match is not displayed <br>
`~=` - complete match at the beginning of <br> value
`=~` - full match at the end of <br> value
`>` - more <br>
`<` - less than <br>
`>=` - greater than or equal <br>
`<=` - less than or equal <br>

Filtering examples:

- `filter=https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/b83c12e7-42bf-11ec-0a80-08bb00000161=color`
- `filter=https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/83386e05-51c0-11ec-0a83-0640000001bb>=2021-11-30 12:39:00`
- `filter=https://app.kladana.in/api/remap/1.2/entity/product/metadata/attributes/c06ac4a0-e27a-11ec-0a80-0ad600000393=https://app.kladana.in/api/remap/1.2/entity/employee/13268984-e24d-11ec-0a80-0ad600000367`


#### Additional filters

With filter=state.name=<StatusName> you can filter documents by state name.
state.name String type parameter. The filtered selection will include all documents of this type that have a status with the specified name.

An example request using the state.name filter:

`https://app.kladana.in/api/remap/1.2/entity/customerOrder?filter=state.name=Новый;state.name=Принят`

The filter=assortment=<href of an entity> filter allows you to filter documents by the presence of items with the specified assortment entities.
assortment - a parameter that accepts the href of an assortment or group of products. Allowed entity types: Product, Service, Modification, Bundle, Product group.
The selection will include those documents that contain the specified entities in the number of items, or, in the case of specifying Product Groups, one of the entities from the specified Product Groups.

An example query using the assortment filter:

`https://app.kladana.in/api/remap/1.2/entity/demand?filter=assortment=https://app.kladana.in/api/remap/1.2/entity/product/166909e6-4a99-11e6-8a84-bae500000089`

Using filter=accounts.accountnumber=<AccountNumber> you can filter counterparties by account number.
accounts.accountnumber String type parameter. The filtered selection will include all counterparties that have an account with the specified number.

An example query using the accounts.accountnumber filter:

`https://app.kladana.in/api/remap/1.2/entity/counterparty?filter=accounts.accountnumber=123456;accounts.accountnumber=654321`

### Filtering by entities that do not have view permission

When filtering by an entity for which the current user does not have view rights, an empty list will be returned in the response.
For example, when filtering tasks (**task**) by author (**author**), which is an employee who cannot be viewed by the current user,
an empty list of tasks will be returned in response.

### Context search

The JSON API allows you to contextually search a list of entities of a particular type by their string fields. For this
used URI filter parameter **search**

+ **search**
   A filtering option that can be used to search the list of entities. The search takes place on the main string fields of the entities of the given
     type. The search result will be a list of entities of this type, sorted by relevance, that have been filtered by the passed search string. Unlike selection filtering
     using the **filter** parameter, in which the values are checked for an exact match to the specified ones, with contextual search, the match check is not strict.
     Thus, if you filter like `../entity/<entity_type>?filter=name=120`, only those entities with the **name** field will get into the filtered selection
     which have the value `120` and no others. In a contextual search like `../entity/<entity_type>?search=120` will be displayed as entities with **name** equal to
     `120`, and entities, in the name (or in another string field) of which `120` is the beginning of some word, for example `12003`, `children's puzzle 1200 pieces`, etc.
     Moreover, if you enter several words `../entity/<entity_type>?search=120 return` and the search goes through the fields **name** and **description**, then they will be displayed as entities with **name** equal to `1200` and with **description**
     equal to `return due to defect`, and the entity named `777` with description `retail return on 120th Anniversary Street`.

  + Examples of contextual search queries (values must be urlencoded):
    - `https://app.kladana.in/api/remap/1.2/entity/project?search=реструктуризация`
    - `https://app.kladana.in/api/remap/1.2/entity/move?search=ул.Вавилова`
    - `https://app.kladana.in/api/remap/1.2/entity/counterparty?search=петров`



### Filter operator "similarity"

The JSON API has a special filter operator "similarity" for <u>string</u> fields.
image
+ `~` is the usual similarity. Searches for any occurrence of the substring following the operator in the field value. For example, `?filter=code~ms` will find all entities that have the substring "ms" in their code.
+ `~=` left similarity. Looks for a match by value prefix. For example `?filter=code~=ms` will find all entities whose code starts with "ms".
+ `=~` right similarity. Looks for a postfix match. For example `?filter=code=~ms` will find all entities whose code ends in "ms".

Similarity operators operate exclusively on fields of string type and are not case sensitive. They are not applicable to fields of type uuid and datetime.

### Apply saved filter

The JSON API has the ability to apply saved filters. A detailed description is available in the [relevant section](dictionaries/#suschnosti-sohranennye-fil-try).

### Links to files

In the JSON API for downloading a file, a redirect is generated to a temporary file URL. For correct operation, it is necessary to support the processing of redirects.
A request for a temporary URL does not require authorization.
By default, the temporary URL lifetime is one minute.
    
The `X-Lognex-Download-Expiration-Seconds` header can be used to change the URL lifetime in seconds.
The current maximum possible value is 86400 seconds (24 hours).
Long-lived links are for export. The use of these links on publicly accessible web pages is prohibited.

### Replacing links with objects using expand

In the JSON API, as part of entities, you can find references to related objects.
Links are displayed in the [Metadata](#mojsklad-json-api-obschie-swedeniq-metadannye) format. To get related objects instead of links,
it is not necessary to make separate requests for each of them. Instead, along with the request to get the entity, you need to pass the **expand** parameter.
As the value of this parameter, you need to list all the necessary reference fields, separated by commas,
where you would like to see related objects.
As a result of a request with this parameter, in the response you will receive an object with expanded nested objects instead of links.
For example, in documents containing the **agent** field, instead of referring to
counterparty, an object with all fields of the "Accountant" entity described [here](dictionaries/#suschnosti-kontragent) will be displayed.
Maximum nesting level **expand** : 3.
Expand is allowed only on a sample size of 100 or less. If a larger limit is specified, but expand is specified, then this parameter will be ignored.

You can also use **expand** on the results of create and update operations.

+ Below are examples of using **expand** on [Sales Returns](documents/#dokumenty-vozwrat-pokupatelq). The examples show only the **meta** and **demand** fields.

### Return without expand

> Example of return request without expand

```shell
curl -X GET
  "https://app.kladana.in/api/remap/1.2/entity/salesreturn/166909e6-4a99-11e6-8a84-bae500000089"
  -H "Authorization: Basic <Credentials>"
```

> Sales Return object in its normal view, with a link to the shipment

```json
{
  "meta": {
    "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/166909e6-4a99-11e6-8a84-bae500000089",
    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
    "type": "salesreturn",
    "mediaType": "application/json"
  },
  ...
  "demand": {
    "meta": {
      "href": "https://app.kladana.in/api/remap/1.2/entity/demand/f99544d7-4a98-11e6-8a84-bae50000007f",
      "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
      "type": "demand",
      "mediaType": "application/json"
    }
  }
}
```

### Return from expand shipment

We pass the parameter **expand**=demand.

> Sample return request with expand shipment

```shell
curl -X GET
  "https://app.kladana.in/api/remap/1.2/entity/salesreturn/166909e6-4a99-11e6-8a84-bae500000089?expand=demand"
  -H "Authorization: Basic <Credentials>"
```

> In response, the return of the buyer will come, which, instead of a reference to the shipment for which the return is made, will have an attached object with all the fields of this shipment.

```json
{
  "meta": {
    "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/166909e6-4a99-11e6-8a84-bae500000089?expand=demand",
    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
    "type": "salesreturn",
    "mediaType": "application/json"
  },
  ...
  "demand": {
    "meta": {
      "href": "https://app.kladana.in/api/remap/1.2/entity/demand/f99544d7-4a98-11e6-8a84-bae50000007f",
      "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
      "type": "demand",
      "mediaType": "application/json"
    },
    "id": "f99544d7-4a98-11e6-8a84-bae50000007f",
    "accountId": "f976ed28-2e58-11e6-8a84-bae500000001",
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
    ...
    "positions": {
      "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/demand/f99544d7-4a98-11e6-8a84-bae50000007f/positions",
        "type": "demandposition",
        "mediaType": "application/json",
        "size": 2,
        "limit": 1000,
        "offset": 0
      }
    },
    "vatEnabled": true,
    "vatIncluded": true,
    "payedSum": 0,
    "returns": [
      {
        "meta": {
          "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/166909e6-4a99-11e6-8a84-bae500000089",
          "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
          "type": "salesreturn",
          "mediaType": "application/json"
        }
      }
    ]
  }
}
```

### Expand with depth 2

Now let's expand the **agent** field of the shipment (**demand**) enclosed in the return.
In response, the buyer will return with a detailed shipment (**demand**), inside which
there will be a deployed counterparty object (**agent**).

This query demonstrates the level of nesting
parameter **expand** equal to two.

> Example c expand return request with depth 2

```shell
curl -X GET
  "https://app.kladana.in/api/remap/1.2/entity/salesreturn/166909e6-4a99-11e6-8a84-bae500000089?expand=demand.agent"
  -H "Authorization: Basic <Credentials>"
```

> Response with expanded Demand and Demand.Agent

```json
{
  "meta": {
    "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/166909e6-4a99-11e6-8a84-bae500000089?expand=demand.agent",
    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
    "type": "salesreturn",
    "mediaType": "application/json"
  },
  ...
  "demand": {
    "meta": {
      "href": "https://app.kladana.in/api/remap/1.2/entity/demand/f99544d7-4a98-11e6-8a84-bae50000007f?expand=agent",
      "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
      "type": "demand",
      "mediaType": "application/json"
    },
    ...
    "agent": {
      "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/147c1f1b-32ca-11e6-8a84-bae500000004",
        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
        "type": "counterparty",
        "mediaType": "application/json"
      },
      ...
      "name": "Agent1",
      "code": "УТ0003074",
      "externalCode": "kAgs4Xbhiz2Sp5oP2OCaB2",
      "archived": false,
      "legalTitle": "Agent1 Limited Liability Company",
      "legalAddress": "107023, Moscow, Barabanny lane, house number 42, building 2",
      "inn": "7719864242",
      "kpp": "771901001",
      ...
    },
    ...
    "positions": {
      "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/demand/f99544d7-4a98-11e6-8a84-bae50000007f/positions",
        "type": "demandposition",
        "mediaType": "application/json",
        "size": 2,
        "limit": 1000,
        "offset": 0
      }
    },
    "vatEnabled": true,
    "vatIncluded": true,
    "payedSum": 0,
    "returns": [
      {
        "meta": {
          "href": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/166909e6-4a99-11e6-8a84-bae500000089",
          "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/salesreturn/metadata",
          "type": "salesreturn",
          "mediaType": "application/json"
        }
      }
    ]
  }
  ...
}
```

### Create a shipment with expand

> Expand the **agent** field of the shipment being created.

```shell
curl -X POST
  "https://app.kladana.in/api/remap/1.2/entity/demand?expand=agent"
  -H "Authorization: Basic <Credentials>"
  -H 'Content-Type: application/json' \
  -d '{
  "name": "0001",
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
      "type": "counterparty",
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
}'
```

> In response, the created shipment will come with the deployed object of the counterparty (**agent**).

```json
{
    "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/demand/1c3f30d2-88b9-11e7-9464-e4de00000000",
        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
        "type": "demand",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.in/app/#demand/edit?id=1c3f30d2-88b9-11e7-9464-e4de00000000"
    },
    "id": "1c3f30d2-88b9-11e7-9464-e4de00000000",
    "accountId": "d8a2e973-6703-11e7-9464-e4de00000001",
    "owner": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/employee/d9335bf2-6703-11e7-9464-e4de0000002a",
            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
            "type": "employee",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.in/app/#employee/edit?id=d9335bf2-6703-11e7-9464-e4de0000002a"
        }
    },
    "shared": false,
    "group": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/group/d8a5d385-6703-11e7-9464-e4de00000002",
            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
            "type": "group",
            "mediaType": "application/json"
        }
    },
    "updated": "2017-08-24 13:43:47",
    "name": "0001",
    "externalCode": "UoaXR1oZhS9LOHzdUi42R1",
    "moment": "2017-08-24 13:43:00",
    "applicable": true,
    "rate": {
        "currency": {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/currency/d959dce8-6703-11e7-9464-e4de00000058",
                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                "type": "currency",
                "mediaType": "application/json",
                "uuidHref": "https://app.kladana.in/app/#currency/edit?id=d959dce8-6703-11e7-9464-e4de00000058"
            }
        }
    },
    "sum": 0,
    "store": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/store/d95915ff-6703-11e7-9464-e4de00000053",
            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
            "type": "store",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.in/app/#warehouse/edit?id=d95915ff-6703-11e7-9464-e4de00000053"
        }
    },
    "agent": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/d9593e70-6703-11e7-9464-e4de00000054",
            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
            "type": "counterparty",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.in/app/#company/edit?id=d9593e70-6703-11e7-9464-e4de00000054"
        },
        "id": "d9593e70-6703-11e7-9464-e4de00000054",
        "accountId": "d8a2e973-6703-11e7-9464-e4de00000001",
        "owner": {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/employee/d9335bf2-6703-11e7-9464-e4de0000002a",
                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
                "type": "employee",
                "mediaType": "application/json",
                "uuidHref": "https://app.kladana.in/app/#employee/edit?id=d9335bf2-6703-11e7-9464-e4de0000002a"
            }
        },
        "shared": false,
        "group": {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/group/d8a5d385-6703-11e7-9464-e4de00000002",
                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
                "type": "group",
                "mediaType": "application/json"
            }
        },
        "updated": "2017-08-18 17:49:23",
        "name": "LLC \"Supplier\"",
         "externalCode": "YWKWXePEi9jBAmxriBpc93",
         archived: false
         "created": "2017-07-12 16:13:08",
         "companyType": "legal",
         "legalTitle": "Limited Liability Company \"Supplier\"",
         "legalAddress": "Moscow, Stroiteley st., 12",
         "inn": "7736570901",
         "kpp": "773601001",
        "accounts": {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/d9593e70-6703-11e7-9464-e4de00000054/accounts",
                "type": "account",
                "mediaType": "application/json",
                "size": 0,
                "limit": 1000,
                "offset": 0
            }
        },
        "tags": [
            "bbbvcc",
            "ss"
        ],
        "contactpersons": {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/d9593e70-6703-11e7-9464-e4de00000054/contactpersons",
                "type": "contactperson",
                "mediaType": "application/json",
                "size": 0,
                "limit": 1000,
                "offset": 0
            }
        },
        "notes": {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/d9593e70-6703-11e7-9464-e4de00000054/notes",
                "type": "note",
                "mediaType": "application/json",
                "size": 0,
                "limit": 1000,
                "offset": 0
            }
        },
        "state": {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata/states/d9efdc3b-6703-11e7-9464-e4de00000066",
                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                "type": "state",
                "mediaType": "application/json"
            }
        },
        "salesAmount": 4500
    },
    "organization": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/organization/d955aa70-6703-11e7-9464-e4de00000051",
            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
            "type": "organization",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.in/app/#mycompany/edit?id=d955aa70-6703-11e7-9464-e4de00000051"
        }
    },
    "created": "2017-08-24 13:43:48",
    "positions": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/demand/1c3f30d2-88b9-11e7-9464-e4de00000000/positions",
            "type": "demandposition",
            "mediaType": "application/json",
            "size": 0,
            "limit": 1000,
            "offset": 0
        }
    },
    "vatEnabled": true,
    "vatIncluded": true,
    "vatSum": 0,
    "payedSum": 0
}
```

### Edit shipment with expand

> Now let's update this shipment and expand its **agent** and **organization** fields.
The response will be a modified shipment with expanded counterparty object (**agent**) and expanded legal entity object (**organization**).

```shell
curl -X PUT
  "https://app.kladana.in/api/remap/1.2/entity/demand/1c3f30d2-88b9-11e7-9464-e4de00000000?expand=agent,organization"
  -H "Authorization: Basic <Credentials>"
  -H 'Content-Type: application/json' \
  -d '{
  "name": "3738"
}`
```

> Response 200 (application/json)

```json
{
    "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/demand/1c3f30d2-88b9-11e7-9464-e4de00000000?expand=agent,organization",
        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata",
        "type": "demand",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.in/app/#demand/edit?id=1c3f30d2-88b9-11e7-9464-e4de00000000"
    },
    "id": "1c3f30d2-88b9-11e7-9464-e4de00000000",
    "accountId": "d8a2e973-6703-11e7-9464-e4de00000001",
    "owner": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/employee/d9335bf2-6703-11e7-9464-e4de0000002a",
            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
            "type": "employee",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.in/app/#employee/edit?id=d9335bf2-6703-11e7-9464-e4de0000002a"
        }
    },
    "shared": false,
    "group": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/group/d8a5d385-6703-11e7-9464-e4de00000002",
            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
            "type": "group",
            "mediaType": "application/json"
        }
    },
    "updated": "2017-08-24 13:53:07",
    "name": "3738",
    "externalCode": "UoaXR1oZhS9LOHzdUi42R1",
    "moment": "2017-08-24 13:43:00",
    "applicable": true,
    "rate": {
        "currency": {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/currency/d959dce8-6703-11e7-9464-e4de00000058",
                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/currency/metadata",
                "type": "currency",
                "mediaType": "application/json",
                "uuidHref": "https://app.kladana.in/app/#currency/edit?id=d959dce8-6703-11e7-9464-e4de00000058"
            }
        }
    },
    "sum": 0,
    "store": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/store/d95915ff-6703-11e7-9464-e4de00000053",
            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/store/metadata",
            "type": "store",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.in/app/#warehouse/edit?id=d95915ff-6703-11e7-9464-e4de00000053"
        }
    },
    "agent": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/d9593e70-6703-11e7-9464-e4de00000054",
            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
            "type": "counterparty",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.in/app/#company/edit?id=d9593e70-6703-11e7-9464-e4de00000054"
        },
        "id": "d9593e70-6703-11e7-9464-e4de00000054",
        "accountId": "d8a2e973-6703-11e7-9464-e4de00000001",
        "owner": {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/employee/d9335bf2-6703-11e7-9464-e4de0000002a",
                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
                "type": "employee",
                "mediaType": "application/json",
                "uuidHref": "https://app.kladana.in/app/#employee/edit?id=d9335bf2-6703-11e7-9464-e4de0000002a"
            }
        },
        "shared": false,
        "group": {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/group/d8a5d385-6703-11e7-9464-e4de00000002",
                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
                "type": "group",
                "mediaType": "application/json"
            }
        },
        "updated": "2017-08-18 17:49:23",
         "name": "LLC \"Supplier\"",
         "externalCode": "YWKWXePEi9jBAmxriBpc93",
         archived: false
         "created": "2017-07-12 16:13:08",
         "companyType": "legal",
         "legalTitle": "Limited Liability Company \"Supplier\"",
         "legalAddress": "Moscow, Stroiteley st., 12",
        "inn": "7736570901",
        "kpp": "773601001",
        "accounts": {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/d9593e70-6703-11e7-9464-e4de00000054/accounts",
                "type": "account",
                "mediaType": "application/json",
                "size": 0,
                "limit": 1000,
                "offset": 0
            }
        },
        "tags": [
            "bbbvcc",
            "ss"
        ],
        "contactpersons": {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/d9593e70-6703-11e7-9464-e4de00000054/contactpersons",
                "type": "contactperson",
                "mediaType": "application/json",
                "size": 0,
                "limit": 1000,
                "offset": 0
            }
        },
        "notes": {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/d9593e70-6703-11e7-9464-e4de00000054/notes",
                "type": "note",
                "mediaType": "application/json",
                "size": 0,
                "limit": 1000,
                "offset": 0
            }
        },
        "state": {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata/states/d9efdc3b-6703-11e7-9464-e4de00000066",
                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/counterparty/metadata",
                "type": "state",
                "mediaType": "application/json"
            }
        },
        "salesAmount": 4500
    },
    "organization": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/organization/d955aa70-6703-11e7-9464-e4de00000051",
            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
            "type": "organization",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.in/app/#mycompany/edit?id=d955aa70-6703-11e7-9464-e4de00000051"
        },
        "id": "d955aa70-6703-11e7-9464-e4de00000051",
        "accountId": "d8a2e973-6703-11e7-9464-e4de00000001",
        "owner": {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/employee/d9335bf2-6703-11e7-9464-e4de0000002a",
                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
                "type": "employee",
                "mediaType": "application/json",
                "uuidHref": "https://app.kladana.in/app/#employee/edit?id=d9335bf2-6703-11e7-9464-e4de0000002a"
            }
        },
        "shared": true,
        "group": {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/group/d8a5d385-6703-11e7-9464-e4de00000002",
                "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
                "type": "group",
                "mediaType": "application/json"
            }
        },
        "updated": "2017-07-12 16:13:09",
        "name": "reqwy",
        "externalCode": "PRLKDfmQgwj7TGtiYWrrZ3",
        "archived": false,
        "created": "2017-07-12 16:13:08",
        "companyType": "legal",
        "legalTitle": "reqwy",
        "email": "erqw@ss.ru",
        "accounts": {
            "meta": {
                "href": "https://app.kladana.in/api/remap/1.2/entity/organization/d955aa70-6703-11e7-9464-e4de00000051/accounts",
                "type": "account",
                "mediaType": "application/json",
                "size": 0,
                "limit": 1000,
                "offset": 0
            }
        },
        "isEgaisEnable": false,
        "payerVat": true,
        "director": "Administrator",
         "chiefAccountant": "Administrator"
    },
    "created": "2017-08-24 13:43:48",
    "positions": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/demand/1c3f30d2-88b9-11e7-9464-e4de00000000/positions",
            "type": "demandposition",
            "mediaType": "application/json",
            "size": 0,
            "limit": 1000,
            "offset": 0
        }
    },
    "vatEnabled": true,
    "vatIncluded": true,
    "vatSum": 0,
    "payedSum": 0
}
```

### Employee request context

Returns data about the employee on whose behalf the request is made. The entity is accessed via the endpoint `/context/employee`

#### Entity attributes

| Title | Type | Description |
| ------ | -----| ---------- |
| **accountId** | UUID | Account ID<br>`+Required when replying` `+Read Only` |
| **archived** | Boolean | Whether the Employee was added to the archive<br>`+Required when replying` `+Read Only` |
| **attributes** | Array(Object) | Additional Employee fields<br>`+Read-only` |
| **code** | String(255) | Employee Code<br>`+Read Only` |
| **created** | datetime | Employee Creation Time<br>`+Required for response` `+Read Only` |
| **description** | String(4096) | Employee Comment<br>`+Read Only` |
| **email** | String(255) | Employee Email<br>`+Read Only` |
| **externalCode** | String(255) | Employee External ID<br>`+Required for response` `+Read Only` |
| **firstName** | String(255) | Name<br>`+Read Only` |
| **fullName** | String(255) | First name Middle name Last name<br>`+Read only` |
| **group** | [Meta](#mojsklad-json-api-obschie-swedeniq-metadannye) | Employee department<br>`+Required when replying` `+Read-only` |
| **id** | UUID | Employee ID<br>`+Required when replying` `+Read Only` |
| **images** | object | Photo of an employee. [More here](dictionaries/#suschnosti-sotrudnik-sotrudniki-atributy-wlozhennyh-suschnostej-fotografiq-sotrudnika-struktura-i-zagruzka)<br>`+Read only` |
| **inn** | String(255) | TIN of the employee (in the format of the TIN of an individual)<br>`+Read-only`|
| **lastName** | String(255) | Last name<br>`+Required when replying` `+Read only` |
| **meta** | [Meta](#mojsklad-json-api-obschie-swedeniq-metadannye) | Employee Metadata<br>`+Required when responding` `+Read Only` |
| **middleName** | String(255) | Middle name<br>`+Read only` |
| **name** | String(255) | Employee Name<br>`+Required when responding` `+Read Only` |
| **owner** | [Meta](#mojsklad-json-api-obschie-swedeniq-metadannye) | Owner (Employee)<br>`+Required when replying` `+Read Only` |
| **permissions** | object | Enumeration of employee's permissions. [More details here](#mojsklad-json-api-obschie-swedeniq-kontext-zaprosa-sotrudnika-atributy-wlozhennyh-suschnostej-permissii-sotrudnika)<br>`+Required when replying` `+Read only` |
| **phone** | String(255) | Employee phone<br>`+Read-only` |
| **position** | String(255) | Job Title<br>`+Read Only` |
| **shared** | Boolean | Sharing<br>`+Required when replying` `+Read Only` |
| **shortFio** | String(255) | Short Name<br>`+Read Only` |
| **id** | String(255) | Employee Login<br>`+Read Only` |
| **updated** | datetime | The moment when the Employee was last updated<br>`+Required when replying` `+Read Only` |

#### Nested entity attributes

Many attributes presented in this request, with the exception of the `permissions` field, repeat the attributes of the [Employee] request (dictionaries/#suschnosti-sotrudnik-sotrudniki), a detailed description of which can be found in the corresponding section.

##### Employee Permissions

The employee's permissions object includes entity permissions, part of tariff and user permissions.
The fields of an object represent a single permission, where the name indicates the type of the permission, and the value is an object with permission values in the format <permission type>: <value>.

###### User and tariff permissions

| Title | Description |
| ------| ------------|
| **admin** | Is the employee an admin |
| **audit_dashboard** | View audit |
| **company_crm** | View metrics |
| **customAttributes** | Work with additional fields |
| **dashboard** | View metrics |
| **dashboardmoney** | See money balances |
| **viewCashFlow** | See cash flow |
| **pnl** | View profitability |
| **stock** | View inventory by item|
| **tariff_crm** | Is there a CRM option on the account |

If there is a corresponding permission, the object contains a **VIEW** field with a value of `ALL`

###### List of entity permissions

There are three possible types of entity permission values: `OPERATION`, `DICTIONARY`, `BASE`.
These types have the following fields:

| entity permission value types | view | create | update | delete | print | approve |
|-------|-------|------|--------- |--------|------|------- |
| OPERATION | + | + | + | + | + | + |
| DICTIONARY | + | + | + | + | + | - |
| base | + | + | + | + | - | - |

###### Description of entity permissions

| Title | Description |
| -------| ------------------- |
| **view** | Watch |
| **create** | Create |
| **update** | Edit |
| **delete** | Delete |
| **print** | Print |
| **approve** | Conduct |

###### Possible values of `view`, `create`, `update`, `delete`, `approve`, `print` fields

| Title | To whom does |
| ------| ------------|
| **OWN** | Only their |
| **OWN_SHARED** | Own and common |
| **OWN_GROUP** | Own and department |
| **OWN_GROUP_SHARED** | Own, department and general |
| **ALL** | All |
| Missing | To no one |

###### Permissions of entities and documents that are present in the request

| Title | Possible values | Description |
|-------| ---------- |-------------------|
| **accountAdjustment** | DICTIONARY | Adjustment of account balances |
| **bonustransaction** | OPERATION | Bonus points |
| **cashIn** | OPERATION | Receipt order |
| **cashOut** | OPERATION | Disbursement order |
| **cashboxAdjustment** | DICTIONARY | Adjustment of cash balances |
| **company** | DICTIONARY | Contractors |
| **contract** | DICTIONARY | Contracts |
| **counterpartyAdjustment** | DICTIONARY | Counterparty balance adjustment |
| **country** | base | Countries |
| **currency** | base | Currencies |
| **customEntity** | base | Elements of user directories |
| **customerOrder** | OPERATION | Order to buyers |
| **demand** | OPERATION | Shipment |
| **employees** | base | Employees |
| **enter** | OPERATION | Posting |
| **factoryIn** | OPERATION | Invoices received |
| **facture** | OPERATION | Invoices issued |
| **good** | DICTIONARY | Goods and Services |
| **internalOrder** | OPERATION | Internal orders |
| **inventory** | DICTIONARY | Inventory |
| **invoiceIn** | OPERATION | Supplier invoice |
| **invoiceOut** | OPERATION | Account for buyers |
| **loss** | OPERATION | Write-off |
| **move** | OPERATION | Moving |
| **myCompany** | base | Jur. Faces |
| **paymentIn** | OPERATION | Incoming payment |
| **paymentOut** | OPERATION | Outgoing payment |
| **processingOrder** | OPERATION | Production order |
| **processingPlan** | base| Those. Maps |
| **processingStage** | base | Stages of production |
| **processingProcess** | base | Those. processes |
| **project** | base | Projects |
| **purchaseOrder** | OPERATION | Order to suppliers |
| **purchaseReturn** | OPERATION | Return to supplier |
| **retailDemand** | OPERATION | Sales |
| **salesReturn** | OPERATION | Sales Return |
| **supply** | OPERATION | Receivings |
| **task** | [Special](#mojsklad-json-api-obschie-swedeniq-kontext-zaprosa-sotrudnika-atributy-wlozhennyh-suschnostej-permissii-sotrudnika-permissii-dlq-zadach) | Tasks |
| **wom** | base | Units of measure |
| **warehouse** | base | Warehouses |
| **webhook** | DICTIONARY | Webhooks |

###### Permissions for tasks

`script` permissions for tasks have the following fields:

| Title | Description | Possible values |
| ---------|------------|------- |
| **view** | Watch | None, AUTHOR_OR_ASSIGNEE, ALL |
| **create** | Create | None, ALL |
| **update** | Edit | None, AUTHOR, AUTHOR_OR_ASSIGNEE, ALL |
| **delete** | Delete | None, AUTHOR, AUTHOR_OR_ASSIGNEE, ALL |
| **done** | Execute | None, ASSIGNEE, AUTHOR_OR_ASSIGNEE, ALL |

###### Possible values of the `view`, `create`, `update`, `delete`, `done` fields for tasks

| Title | What tasks is covered by |
| ------| -------------- |
| **AUTHOR_OR_ASSIGNEE** | Created by the user and assigned to him |
| **ASSIGNEE** | Appointed |
| **AUTHOR** | Created by user |
| **ALL** | The ability to perform an action on any tasks |
| Missing | No permissions for any tasks |

#### Get employee context

Request to get the context of the Employee's request.

> An example of a request to get the context of an Employee's request.

```shell
  curl -X GET
    "https://app.kladana.in/api/remap/1.2/context/employee/"
    -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of information about the Employee's request context.

```json
{
    "meta": {
        "href": "https://app.kladana.in/api/remap/1.2/entity/employee/5bf6430e-204c-11ec-c0a8-300d00000042?expand=cashier.retailStore",
        "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.in/app/#employee/edit?id=5bf6430e-204c-11ec-c0a8-300d00000042"
    },
    "id": "5bf6430e-204c-11ec-c0a8-300d00000042",
    "accountId": "59de7a4b-204c-11ec-c0a8-300e00000002",
    "owner": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/employee/5bf6430e-204c-11ec-c0a8-300d00000042",
            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
            "type": "employee",
            "mediaType": "application/json",
            "uuidHref": "https://app.kladana.in/app/#employee/edit?id=5bf6430e-204c-11ec-c0a8-300d00000042"
        }
    },
    "shared": true,
    "group": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/group/59e4a97a-204c-11ec-c0a8-300e00000003",
            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
            "type": "group",
            "mediaType": "application/json"
        }
    },
    "updated": "2021-09-28 14:08:07.359",
    "name": "Administrator",
    "externalCode": "YuqqVXgviyQsimcElBCDl0",
    "archived": false,
    "created": "2021-09-28 14:08:07.359",
    "uid": "admin@f1",
    "email": "f@f.ru",
    "lastName": "Administrator",
    "fullName": "Administrator",
    "shortFio": "Administrator",
    "permissions": {
        "currency": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL"
        },
        "uom": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL"
        },
        "productfolder": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "print": "ALL"
        },
        "product": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "print": "ALL"
        },
        "bundle": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "print": "ALL"
        },
        "service": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "print": "ALL"
        },
        "variant": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "print": "ALL"
        },
        "store": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL"
        },
        "counterparty": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "print": "ALL"
        },
        "organization": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL"
        },
        "employee": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL"
        },
        "settings": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "print": "ALL"
        },
        "contract": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "print": "ALL"
        },
        "project": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL"
        },
        "country": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL"
        },
        "customentity": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL"
        },
        "demand": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "customerorder": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "internalorder": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "invoiceout": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "invoicein": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "paymentin": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "paymentout": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "cashin": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "cashout": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "supply": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "salesreturn": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "purchasereturn": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "receipttemplate": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL"
        },
        "retaildemand": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "retailsalesreturn": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "purchaseorder": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "move": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "enter": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "loss": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "processingplanfolder": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL"
        },
        "processingplan": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL"
        },
        "processingstage": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL"
        },
        "processing": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "processingorder": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "processingprocess": {
          "view": "ALL",
          "create": "ALL",
          "update": "ALL",
          "delete": "ALL"
        },
        "counterpartyadjustment": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "print": "ALL"
        },
        "assortment": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "print": "ALL"
        },
        "inventory": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "print": "ALL"
        },
        "bonustransaction": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "approve": "ALL",
            "print": "ALL"
        },
        "crptorder": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "print": "ALL"
        },
        "webhook": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL"
        },
        "task": {
            "view": "ALL",
            "create": "ALL",
            "update": "ALL",
            "delete": "ALL",
            "done": "ALL"
 v         },
        "dashboard": {
            "view": "ALL"
        },
        "stock": {
            "view": "ALL"
        },
        "customAttributes": {
            "view": "ALL"
        },
        "pnl": {
            "view": "ALL"
        },
        "company_crm": {
            "view": "ALL"
        },
        "tariff_crm": {
            "view": "ALL"
        },
        "audit_dashboard": {
            "view": "ALL"
        },
        "admin": {
            "view": "ALL"
        },
        "dashboardMoney": {
            "view": "ALL"
        }
    }
}
```

### Server applications
To access the API, a token issued to the Vendor during the installation of the Server Application by the user of MySklad can be used.

#### Get application context
Returns the parameters of the application within which the request is made (similar to the context of the Employee).

> Application Context Request Example

```shell
curl -X GET
  "https://app.kladana.in/api/remap/1.2/context/application"
  -H "Authorization: Bearer <Access-Token>"
``` 

> Response 200 (application/json) Successful request. Result JSON object containing application data

```json
{
  "meta": {
    "href": "https://app.kladana.in/api/remap/1.2/entity/application/b58a6312-f958-11e9-ac12-000a00000020",
    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/application/metadata",
    "type": "application",
    "mediaType": "application/json"
  },
  "appUid": "test.moysklad@reqwy1",
  "id": "b58a6312-f958-11e9-ac12-000a00000020"
}
```

#### Getting the entity of the installed application
Returns the parameters of the installed application by the id of the application installed on the account.

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: b58a6312-f958-11e9-ac12-000a00000020* id of the application installed on the account |

> Sample request to get the entity of an installed application

```shell
curl -X GET
  "https://app.kladana.in/api/remap/1.2/entity/application/b58a6312-f958-11e9-ac12-000a00000020"
  -H "Authorization: Bearer <Access-Token>"
``` 

> Response 200 (application/json) Successful request. Result JSON object containing application data

```json
{
  "meta": {
    "href": "https://app.kladana.in/api/remap/1.2/entity/application/b58a6312-f958-11e9-ac12-000a00000020",
    "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/application/metadata",
    "type": "application",
    "mediaType": "application/json"
  },
  "appUid": "test.moysklad@reqwy1",
  "id": "b58a6312-f958-11e9-ac12-000a00000020"
}
```

#### Filtering the selection using the filter=updatedBy parameter
To filter entity selections by application, specify the _uid_ of the application that modified them.

Application uid must be specified in the form:
`<Application-Alias>.<Vendor-Alias>@<Account-Name>`

An example of a request to receive a list of incoming payments:
`https://app.kladana.in/api/remap/1.2/entity/paymentin?filter=updatedBy=test.moysklad@reqwy1` 

#### Filtering audit records using the filter=uid parameter
To filter the audit by application, specify the _uid_ of the application that modified the entities.

Application uid must be specified in the form:
`<Application-Alias>.<Vendor-Alias>@<Account-Name>`

An example of a request to get a list of records:
`https://app.kladana.in/api/remap/1.2/audit?filter=uid=test.moysklad@reqwy1` 

#### Filtering audit entries with the filter=application parameter
To filter the audit by application, specify the _href_ of the application that modified the entities.

Application href must be specified in the form:
`https://app.kladana.in/api/remap/1.2/entity/application/{id}`, 
where _id_ is the UUID of the application installed on the account

An example of a request to get a list of records:
`https://app.kladana.in/api/remap/1.2/audit?filter=application=https://app.kladana.in/api/remap/1.2/entity/application/46ea8005-2965-11e9-9ff4-34e80009ac49` 

