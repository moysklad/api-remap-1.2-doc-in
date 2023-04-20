## Employee
### Employees
Using the JSON API, you can request lists of Employees and information on individual Employees. The entity code for an Employee in the JSON API is the **employee** keyword. 
Learn more about [Employees](https://kladana.zendesk.com/hc/en-us/articles/7583130803857-Manage-user-access-).
This entity can be contextually searched using the special `search` parameter. More details can be found at [link](../#mojsklad-json-api-obschie-swedeniq-kontextnyj-poisk).

The search among employee objects for matching the search string will be carried out using the following fields:

+ By employee name **name**
+ By e-mail address **email**
+ By phone number **phone**

#### Entity attributes

| Title | Type | Filtration | Description |
| ------- | -------- |---------- | --------- |
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **archived** | Boolean | `=` `!=` | Whether the Employee was added to the archive<br>`+Required when replying` |
| **attributes** | Array(Object) | [Operators add. fields](../#mojsklad-json-api-obschie-swedeniq-fil-traciq-wyborki-s-pomosch-u-parametra-filter-fil-traciq-po-dopolnitel-nym-polqm) | Additional fields Employee |
| **code** | String(255) | `=` `!=` `~` `~=` `=~` | Employee Code |
| **created** | datetime | | Employee Creation Time<br>`+Required for response` `+Read Only` |
| **description** | String(4096) | `=` `!=` `~` `~=` `=~` | Comment to Employee |
| **email** | String(255) | `=` `!=` `~` `~=` `=~` | Employee Email |
| **externalCode** | String(255) | `=` `!=` `~` `~=` `=~` | Employee's external code<br>`+Required when replying` |
| **firstName** | String(255) | `=` `!=` `~` `~=` `=~`| Name |
| **fullName** | String(255) | | First name Middle name Last name<br>`+Read only` |
| **group** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | `=` `!=` | Employee's department<br>`+Required when replying` `+Expand` |
| **id** | UUID | `=` `!=` | Employee ID<br>`+Required when replying` `+Read Only` |
| **images** | object | | Photo of an employee. [More here](../dictionaries/#suschnosti-sotrudnik-sotrudniki-atributy-wlozhennyh-suschnostej-fotografiq-sotrudnika-struktura-i-zagruzka) |
| **inn** | String(255) | | TIN of the employee (in the format of the TIN of an individual) |
| **lastName** | String(255) | `=` `!=` `~` `~=` `=~` | Surname<br>`+Required when replying` `+Required when creating` |
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | | Employee Metadata<br>`+Required when responding` |
| **middleName** | String(255) | `=` `!=` `~` `~=` `=~` | Middle name |
| **name** | String(255) | `=` `!=` `~` `~=` `=~` | Employee Name<br>`+Required when responding` `+Read Only` |
| **owner** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | `=` `!=` | Owner (Employee)<br>`+Required when replying` `+Expand` |
| **phone** | String(255) | `=` `!=` `~` `~=` `=~` | Employee phone |
| **position** | String(255) | | Employee position |
| **shared** | Boolean| `=` `!=` | Sharing<br>`+Required when replying` |
| **shortFio** | String(255) | | Short Name<br>`+Read Only` |
| **id** | String(255) | `=` `!=` `~` `~=` `=~` | Employee Login<br>`+Read Only` |
| **updated** | datetime | `=` `!=` `<` `>` `<=` `>=` | The moment when the Employee was last updated<br>`+Required when replying` `+Read Only` |

The **owner**, **group** and **archived** fields can only be modified by an administrator. The **email** field can be changed by the administrator and the employee himself.

#### Nested entity attributes

##### Employee photo: structure and loading.
The structure of the **image** field that you will receive when requesting an employee with a photo:

| Title | Type | Description |
| ------- | -------- |---------- |
| **filename** | String(255) | File name<br>`+Required when replying` |
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Object metadata<br>`+Required when replying` |
| **miniature** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Image thumbnail metadata<br>`+Required when replying` |
| **size** | int | File size in bytes<br>`+Required when replying` |
| **tiny** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Thumbnail metadata<br>`+Required when replying` |
| **title** | String(255) | Image Title<br>`+Required when replying` |
| **updated** | datetime | Last modified time<br>`+Required when replying` |

#### Loading
To upload a photo of an employee, you need to create a request for [update](../dictionaries/#suschnosti-sotrudnik-izmenit-sotrudnika) employee (PUT) and in the request body
specify the **image** field with the following attributes:

| Title | Description |
| ------- | -------- |
| **filename** | filename with extension . For example - "admin.png" |
| **content** | Base64 encoded image |

If there are no **filename** and **content** fields in the update request, then the entire **image** object, if it is present in the Body,
will be ignored because the server will consider that its update is not required.

About working with Employee fields can be read [here](../#mojsklad-json-api-obschie-swedeniq-rabota-s-dopolnitel-nymi-polqmi)

### Get Employees
Request to get a list of all employees for this account.
Result: JSON object including fields:

| Title | Type | Description |
| ------- | -------- | ----------- |
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Issuance metadata, |
| **context** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the Employee. |

**Parameters**

| Parameter | Description|
| ------- | -------- |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

> Get Employees

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/employee"
   -H "Authorization: Basic <Credentials>"
```
 
> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Employees.

```json
{
   context: {
     "employee": {
       "href": "https://app.kladana.in/api/remap/1.2/context/employee",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/employee/",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
     "type": "employee",
     "mediaType": "application/json",
     size: 2
     limit: 1000
     offset: 0
   },
   rows: [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/84f88b2f-f504-11e5-8a84-bae500000138",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       },
       "id": "84f88b2f-f504-11e5-8a84-bae500000138",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "updated": "2016-03-28 19:45:46",
       "name": "Administrator",
       "externalCode": "4A039QXHgbZdAHdXbcUI71",
       archived: false
       "uid": "admin@reqwy1",
       "email": "asdad@sfasf.erq",
       "lastName": "Administrator",
       "fullName": "Administrator",
       "shortFio": "Administrator",
       "retail store": {
         "meta": {
           "href": "https://app.kladana.in/api/remap/1.2/entity/retailstore/851f8576-f504-11e5-8a84-bae50000016c",
           "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/retailstore/metadata",
           "type": "retailstore",
           "mediaType": "application/json"
         }
       },
       "inn": "222490425273",
       "position": "Director"
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/9e00ad58-0302-11e6-9464-e4de00000076",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       },
       "id": "9e00ad58-0302-11e6-9464-e4de00000076",
       "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
       "updated": "2016-04-15 15:07:25",
       "name": "Druganov L. A.",
       "externalCode": "4pGL0jazh3dGTpJfdcP1a1",
       archived: false
       "uid": "employee@company",
       "email": "company@company.ru",
       "phone": "8 800 250-04-32",
       "firstName": "Leonid",
       "middleName": "Andreevich",
       "lastName": "Druganov",
       "fullName": "Leonid Andreevich Druganov",
       "shortFio": "Druganov L.A.",
       "attributes": [
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
             "type": "attributemetadata",
             "mediaType": "application/json"
           },
           "id": "d49d59bd-12dc-11e6-9464-e4de0000006b",
           "name": "AttributeName1",
           "type": "long",
           value: 200
         }
       ]
     }
   ]
}

```

### Bulk update of Employees
[Bulk update](../#mojsklad-json-api-obschie-swedeniq-sozdanie-i-obnowlenie-neskol-kih-ob-ektow) of Employees.
In the body of the request, you need to pass an array containing the JSON representation of the Employees you want to update.
Updated Employees must contain the identifier in the form of metadata.

> Example of updating multiple Employees

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/employee"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/employee/7944ef04-f831-11e5-7a69-971500188b19",
                 "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
                 "type": "employee",
                 "mediaType": "application/json"
               },
               "firstName": "Peter",
               "middleName": "Ivanovich",
               "lastName": "Moyskladkin",
               "inn": "222490425273",
               "position": "Director"
             },
             {
               "firstName": "Ivan",
               "middleName": "Petrovich",
               "lastName": "Moyskladkin"
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the updated Employees.

```json
[
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/7944ef04-f831-11e5-7a69-971500188b19",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     },
     "id": "7944ef04-f831-11e5-7a69-971500188b19",
     "accountId": "ef07c35a-d1f6-11e8-7a33-904100000002",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/7944ef04-f831-11e5-7a69-971500188b19",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     shared: true
     group: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/ef0887b1-d1f6-11e8-7a33-904100000003",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2018-10-17 14:51:30",
     "name": "Moyskladkin P.I.",
     "externalCode": "wNxghfHlg5n2rJGO9Lpud0",
     archived: false
     "created": "2018-10-17 13:25:14",
     "uid": "admin@company",
     "email": "company@mail.ru",
     "firstName": "Peter",
     "middleName": "Ivanovich",
     "lastName": "Moyskladkin",
     "fullName": "Pyotr Ivanovich Moiskkin",
     "shortFio": "Moyskladkin P.I.",
     "inn": "222490425273",
     "position": "Director"
   },
   {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/fc86b89c-d202-11e8-7a33-90410000004a",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     },
     "id": "fc86b89c-d202-11e8-7a33-90410000004a",
     "accountId": "ef07c35a-d1f6-11e8-7a33-904100000002",
     "owner": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/7944ef04-f831-11e5-7a69-971500188b19",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     },
     shared: true
     group: {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/ef0887b1-d1f6-11e8-7a33-904100000003",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       }
     },
     "updated": "2018-10-17 14:51:30",
     "name": "Moyskladkin I.P.",
     "externalCode": "0freFxtniG9a1MNZ7ADin2",
     archived: false
     "created": "2018-10-17 14:51:30",
     "firstName": "Ivan",
     "middleName": "Petrovich",
     "lastName": "Moyskladkin",
     "fullName": "Ivan Petrovich Moyskladkin",
     "shortFio": "Moyskladkin I.P."
   }
]
```

### Delete Employee

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Employee id. |

> Request to delete an Employee with the specified id.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/employee/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful removal of the Employee.

### Bulk removal of Employees

In the body of the request, you need to pass an array containing the JSON metadata of the Employees that you want to remove.

> Request for bulk deletion of Employees.

```shell
curl -X POST
   "https://app.kladana.in/api/remap/1.2/entity/employee/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
   -d'[
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/employee/7944ef04-f831-11e5-7a69-971500188b1","metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
             "type": "employee",
             "mediaType": "application/json"
         },
         {
           "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/employee/7944ef04-f831-11e5-7a69-971500188b2",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
             "type": "employee",
             "mediaType": "application/json"
         }
       ]'
```

> Successful request. The result is JSON information about the removal of Employees.

```json
[
   {
     "info":"Entity 'employee' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'employee' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 was deleted successfully"
   }
]
```

### Employee metadata
#### Employee Metadata

Request to get employee metadata. The result is a JSON object including:

| Title | Type | Description |
| ------- | -------- | -------- |
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Link to employee metadata |
| **attributes** | Array(Object) | Array of objects add. Employee fields in the [Metadata](../#mojsklad-json-api-obschie-swedeniq-metadannye) format |
| **createShared** | Boolean | Create new Employees labeled "General" |

The structure of a separate object representing the add. the field is described in detail in the section [Working with additional fields](../#mojsklad-json-api-obschie-swedeniq-rabota-s-dopolnitel-nymi-polqmi).

> Employee Metadata

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/employee/metadata"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the add. employee fields.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
     "mediaType": "application/json"
   },
   "attributes": [
     {
       "id": "5290a290-0313-11e6-9464-e4de00000020",
       "name": "AttributeName1",
       "type": "boolean",
       "required": false
     }
   ],
   "createShared": true
}
```

### Separate additional field

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 5290a290-0313-11e6-9464-e4de00000020* id fields. |

#### Separate add. field
> Request for information on a separate additional field.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/employee/metadata/attributes/5290a290-0313-11e6-9464-e4de00000020"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a separate add. fields.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata/attributes/5290a290-0313-11e6-9464-e4de00000020",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "5290a290-0313-11e6-9464-e4de00000020",
   "name": "AttributeName1",
   "type": "boolean",
   "required": false
}
```

### Employee

### Get Employee
 
**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Employee id. |

> Request to get an individual employee with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/employee/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the Employee.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/employee/84f88b2f-f504-11e5-8a84-bae500000138",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
     "type": "employee",
     "mediaType": "application/json"
   },
   "id": "84f88b2f-f504-11e5-8a84-bae500000138",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "updated": "2016-03-28 19:45:46",
   "name": "Administrator",
   "externalCode": "4A039QXHgbZdAHdXbcUI71",
   archived: false
   "uid": "admin@reqwy1",
   "email": "asdad@sfasf.erq",
   "lastName": "Administrator",
   "fullName": "Administrator",
   "shortFio": "Administrator",
     {
       "meta": {
         "href": "http://app.kladana.in/api/remap/1.2/entity/retailstore/53302317-df24-11e7-9464-e4de00000001/admins/58dfeb3e-df24-11e7-9464-e4de00000004",
         "type": "admin",
         "mediaType": "application/json"
       }
     }
   ],
   "retail store": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/retailstore/851f8576-f504-11e5-8a84-bae50000016c",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/retailstore/metadata",
       "type": "retailstore",
       "mediaType": "application/json"
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "d49d59bd-12dc-11e6-9464-e4de0000006b",
       "name": "AttributeName1",
       "type": "long",
       value: 200
     }
   ],
   "inn": "222490425273",
   "position": "Director"
}
```

### Create Employee
Request to create an employee. Mandatory fields to create:

| Title | Description |
| ------- | -------- |
| **lastName** | Surname |
 
> An example of a request to create an Employee.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/employee/"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "firstName": "Peter",
             "middleName": "Ivanovich",
             "lastName": "Moyskladkin",
             "inn": "222490425273",
             "position": "Director",
             "phone": "+7(999)888-7766",
             "description": "Description",
             "attributes": [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata/attributes/ed14b498-cae3-11e8-9dd2-f3a300000044",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "String extra field"
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Employee.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/employee/bc962452-cd64-11e8-ac12-000800000000",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
     "type": "employee",
     "mediaType": "application/json"
   },
   "id": "bc962452-cd64-11e8-ac12-000800000000",
   "accountId": "ffb8f6b1-cd3a-11e8-ac12-000700000001",
   "owner": {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/employee/00f76fbb-cd3b-11e8-ac12-00080000002d",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   },
   shared: true
   group: {
     "meta": {
       "href": "https://app.kladana.in/api/remap/1.2/entity/group/ffbc0889-cd3a-11e8-ac12-000700000002",
       "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
       "type": "group",
       "mediaType": "application/json"
     }
   },
   "updated": "2018-10-11 17:48:37",
   "name": "Moyskladkin P.I.",
   "description": "Description",
   "externalCode": "tJfzU8g2hVgXFOiFGTMIe3",
   archived: false
   "created": "2018-10-11 17:48:37",
   "phone": "+7(999)888-7766",
   "firstName": "Peter",
   "middleName": "Ivanovich",
   "lastName": "Moyskladkin",
   "fullName": "Pyotr Ivanovich Moiskkin",
   "shortFio": "Moyskladkin P.I.",
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata/attributes/ed14b498-cae3-11e8-9dd2-f3a300000044",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "ed14b498-cae3-11e8-9dd2-f3a300000044",
       "name": "AttributeName1",
       "type": "string",
       "value": "String extra field"
     }
   ],
   "inn": "222490425273",
   "position": "Director"
}
```

### Change Employee
Request to update an existing Employee. The **lastName** field must be specified in the request body.

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Employee id. |

> An example of a request to update an Employee.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/employee/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "firstName": "Peter",
             "middleName": "Ivanovich",
             "lastName": "Moyskladkin",
             "inn": "222490425273",
             "position": "Director",
             "phone": "+7(999)888-7766",
             "description": "Description",
             "attributes": [
               {
                 "meta": {
                   "href": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata/attributes/ed14b498-cae3-11e8-9dd2-f3a300000044",
                   "type": "attributemetadata",
                   "mediaType": "application/json"
                 },
                 "value": "String extra field"
               }
             ]
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the updated Employee.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/employee/7944ef04-f831-11e5-7a69-971500188b19",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata",
     "type": "employee",
     "mediaType": "application/json"
   },
   "id": "7944ef04-f831-11e5-7a69-971500188b19",
   "accountId": "84e60e93-f504-11e5-8a84-bae500000008",
   "updated": "2016-03-28 19:45:46",
   "name": "Moyskladkin P.I.",
   "description": "Description",
   "externalCode": "4A039QXHgbZdAHdXbcUI71",
   archived: false
   "phone": "+7(999)888-7766",
   "uid": "admin@reqwy1",
   "email": "asdad@sfasf.erq",
   "firstName": "Peter",
   "middleName": "Ivanovich",
   "lastName": "Moyskladkin",
   "fullName": "Pyotr Ivanovich Moiskkin",
   "shortFio": "Moyskladkin P.I.",
     "retail store": {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/retailstore/851f8576-f504-11e5-8a84-bae50000016c",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/retailstore/metadata",
         "type": "retailstore",
         "mediaType": "application/json"
       }
     }
   },
   "attributes": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata/attributes/0cd74e1e-2e59-11e6-8a84-bae50000008a",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "d49d59bd-12dc-11e6-9464-e4de0000006b",
       "name": "AttributeName1",
       "type": "long",
       value: 200
     },
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/employee/metadata/attributes/ed14b498-cae3-11e8-9dd2-f3a300000044",
         "type": "attributemetadata",
         "mediaType": "application/json"
       },
       "id": "ed14b498-cae3-11e8-9dd2-f3a300000044",
       "name": "AttributeName2",
       "type": "string",
       "value": "String extra field"
     }
   ],
   "inn": "222490425273",
   "position": "Director"
}
```

### Work with Employee rights

This section provides examples of requests to obtain and change employee rights. Only the
employee with `System Administrator` rights.

#### Entity attributes

| Title | Type | Description |
| ----- | -------- | ----------- |
| **authorizedHosts** | Array(String) | List of ipv4 addresses from which account access is allowed |
| **authorizedIpNetmask** | String(255) | Subnet mask with account access rights |
| **authorizedIpNetwork** | String(255) | Ipv4 address identifying the corresponding subnet, with the right to access the account |
| **email** | String(255) | Employee mail |
| **group** | object | Metadata of the Group, as well as its ID and name<br>`+Required when replying` |
| **isActive** | Boolean | Access to Kladana<br>`+Required when replying` |
| **login** | String(255) | Employee login to enter Kladana |
| **role** | object | Information about the role of the Employee |

#### Nested entity attributes
##### Role

There are four types of roles: `System Administrator`, `User Role` and `Individualrole`. Use
`Individual role` (with non-default permissions) and `User role` is possible only on `Professional` tariffs
or `Corporate`. For an `Individual role`, you can customize the list of permissions by filling in the `permissions` field.
If not all permissions are specified in the `permissions` field, then those not transferred will be turned off.
Default values are set if the user, without specifying individual permissions, sets an individual role for an employee,
for which no individual permissions were previously set.

| Title | Type | Description |
| ------| ------ | ------- |
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | Role metadata<br>`+Required when replying` |
| **permissions** | Array(Object) | Permission list |

###### List of user permissions

| Title | Possible values | Default value | Description |
|-------| ------ | ------ | --------- |
| **apiRequest** | Boolean | true | API access |
| **deleteFromRecycleBin** | Boolean | true | Empty cart |
| **editCurrencyRateOfDocument** | Boolean | true | Edit document currency rate |
| **editDocumentTemplates** | Boolean | true | Edit document and report templates |
| **editDocumentsOfRestrictedPeriod** | Boolean | false | Edit closed period transactions |
| **exportData** | Boolean | true | Export data |
| **importdata** | Boolean | true | Import data |
| **listenCalls** | Boolean | true | Listening to calls |
| **onlineShops** | Boolean | true | Internet shops |
| **purchaseControl** | Boolean | true | Purchasing management |
| **restoreFromRecycleBin** | Boolean | true | Restore transactions|
| **sendEmail** | Boolean | true | Send mail |
| **subscriptionControl** | Boolean | false | Subscription Management |
| **viewAudit** | Boolean | false | View audit |
| **viewCashFlow** | Boolean | true | View cash flow |
| **viewCommissionGoods** | Boolean | true | View items for sale |
| **viewCompanyCRM** | Boolean | true | View metrics |
| **viewCustomerBalanceList** | Boolean | true | View settlements |
| **viewDashboard** | Boolean | true | View metrics |
| **viewMoneyDashboard** | Boolean | false | See money balances |
| **viewProductCostAndProfit** | Boolean | true | See the cost price, purchase price and profit of goods |
| **viewProfitAndLoss** | Boolean | true | View profit and loss |
| **viewPurchaseFunnel** | Boolean | true | View the sales funnel |
| **viewRecycleBin** | Boolean | true | View Cart |
| **viewSaleProfit** | Boolean | true | View profitability |
| **viewSerialNumbers** | Boolean |true | View serial numbers |
| **viewStockReport** | Boolean | true | View balances by product |
| **viewTurnover** | Boolean | true | View turnovers |

###### List of entity permissions

There are three possible types of entity permission values: `OPERATION`, `DICTIONARY`, `BASE`.
These types have the following fields:

| entity permission value types | view | create | update | delete | print | approve |
| ---------| --------- | ---------- | ------------ | --------- | --------- | --------- |
| OPERATION | + | + | + | + | + | + |
| DICTIONARY | + | + | + | + | + | - |
| base | + | + | + | + | - | - |


| Title | Description | Restrictions |
| ------- | -------- | -------- |
| **view** | Watch | no |
| **create** | Create | matches view or missing |
| **update** | Edit | not wider than view or missing |
| **delete** | Delete | matches update or missing |
| **print** | Print | matches view or missing |
| **approve** | Conduct | matches view or missing |

Possible values of the fields `view`, `create`, `update`, `delete`, `approve`, `print`:

| Title | To whom does |
| ------- | -------- |
| **NO** | To no one |
| **OWN** | Only their |
| **OWN_SHARED** | Own and common |
| **OWN_GROUP** | Own and department |
| **OWN_GROUP_SHARED** | Own, department and general |
| **ALL** | All |

Values in order of their scope expansion: `NO` &#8594; `OWN` &#8594; `OWN_SHARED` &#8594; `OWN_GROUP_SHARED` &#8594; `ALL` and
`NO` &#8594; `OWN` &#8594; `OWN_GROUP` &#8594; `OWN_GROUP_SHARED` &#8594; `ALL`
  If one of the fields is not specified, then this action will be prohibited for this employee.
 
  Entity Permission List
 

| Title | Possible values | Default value | Description |
| ------- | -------- | ------- | -------- |
| **GTINList** | view, create, delete | All NO | GTIN List |
| **accountAdjustment** | DICTIONARY | All ALL | Adjustment of account balances |
| **bonustransaction** | OPERATION | All ALL | Bonus points |
| **cashIn** | OPERATION | All ALL | Receipt order |
| **cashOut** | OPERATION | All ALL | Disbursement order |
| **cashboxAdjustment** | DICTIONARY | All ALL | Adjustment of cash balances |
| **company** | DICTIONARY | All ALL | Contractors |
| **contract** | DICTIONARY | All ALL | Contracts |
| **counterpartyAdjustment** | DICTIONARY | All ALL | Counterparty balance adjustment |
| **country** | base | All ALL | Countries |
| **crptCancellation** | DICTIONARY | All NO | Writing off marking codes |
| **crptPackageCreation** | DICTIONARY | All NO | Formation of packaging |
| **crptPackageDisaggregation** | DICTIONARY | All NO | Unpacking |
| **crptPackageItemRemoval** | DICTIONARY | All NO | Unpacking |
| **currency** | base| All ALL | Currencies |
| **customEntity** | base | All ALL | Elements of user directories |
| **customerOrder** | OPERATION | All ALL | Order to buyers |
| **demand** | OPERATION | All ALL | Shipment |
| **emissionOrder** | DICTIONARY | All NO | Order marking codes |
| **utilizationReport** | DICTIONARY | All NO | Usage Report |
| **atkAggregation** | DICTIONARY | All NO | Formation of ATK |
| **retireOrderOSU** | DICTIONARY | All NO | Withdrawal from circulation OSU |
| **employees** | base | All ALL | Employees |
| **enrollOrder** | DICTIONARY | All NO | Introduction of marking codes into circulation |
| **enter** | OPERATION | All ALL | Posting |
| **good** | DICTIONARY | All ALL | Goods and Services |
| **internalOrder** | OPERATION | All ALL | Domestic orders |
| **inventory** | DICTIONARY | All ALL | Inventory |
| **invoiceIn** | OPERATION | All ALL | Supplier invoice |
| **invoiceOut** | OPERATION | All ALL | Account for buyers |
| **loss** | OPERATION | All ALL | Write-off |
| **move** | OPERATION | All ALL | Moving |
| **myCompany** | base | view: ALL, create: NO, edit: NO, delete: NO | Jur. Faces |
| **paymentIn** | OPERATION | All ALL | Incoming payment |
| **paymentOut** | OPERATION | All ALL | Outgoing payment |
| **prepayment** | OPERATION | All ALL | Prepayments |
| **prepaymentReturn** | OPERATION | All ALL | Return of prepayment |
| **processing** | base | All ALL | Those. operations |
| **processingOrder** | OPERATION | All ALL | Production order |
| **processingPlan** | base | All ALL | Those. Maps |
| **processingStage** | base | All ALL | Stages of production |
| **processingProcess** | base | All ALL | Those. processes |
| **project** | base | All ALL | Projects |
| **purchaseOrder** | OPERATION | All ALL | Order to suppliers |
| **purchaseReturn** | OPERATION | All ALL | Return to supplier |
| **remainsOrder** | DICTIONARY | All NO | Description of residues |
| **remarkingOrder** | DICTIONARY | All NO | Relabeling |
| **retailDemand** | OPERATION | All ALL | Sales |
| **retailDrawerCashIn** | OPERATION | All ALL | Applications || **retailDrawerCashOut** | OPERATION | All ALL | Payouts |
| **retailSalesReturn** | OPERATION | All ALL | Returns |
| **retireOrder** | DICTIONARY | All NO | Withdrawal from circulation |
| **salesReturn** | OPERATION | All ALL | Buyer Return |
| **supply** | OPERATION | All ALL | Acceptances |
| **trackingCodeList** | view, print | All NO | Marking codes |
| **wom** | base | All ALL | Units of measure |
| **warehouse** | base | All ALL | Warehouses |

For `currency`, `country`, `uom` permissions, the value of `view` is immutable and equals `ALL`. When trying to change the value of `view`
  for these permissions, an error will be returned.
 
For `GTINList`, `trackingCodeList` permissions, the possible field values are `ALL` or `NO`.

###### Permissions for tasks

`script` permissions for tasks have the following fields:

| Title | Description | Restrictions | Possible values |
| ------- | -------- | ------- | -------- |
| **view** | Watch | no | NO, AUTHOR_OR_ASSIGNEE, ALL |
| **create** | Create | not wider than view or missing | NO, ALL |
| **update** | Edit | not wider than view or missing | NO, AUTHOR, AUTHOR_OR_ASSIGNEE, ALL |
| **delete** | Delete | not wider than the value of the update field or missing | NO, AUTHOR, AUTHOR_OR_ASSIGNEE, ALL |
| **done** | Execute | not wider than view or missing | NO, ASSIGNEE, AUTHOR_OR_ASSIGNEE, ALL |

The value `NO` is valid for `view` and `done` only if all other values are `NO`.
If the value of the `view` field is different from `NO`, then the `done` field must be passed and the value must match,
with the value of the `view` field.

Possible values of the fields `view`, `create`, `update`, `delete`, `done`:

| Title | What tasks is covered by |
| ------- | -------- |
| **NO** | No permissions for any tasks |
| **AUTHOR_OR_ASSIGNEE** | Created by the user and assigned to him |
| **ASSIGNEE** | Appointed |
| **AUTHOR** | Created by user |
| **ALL** | The ability to perform an action on any tasks |

### Get information about the Employee's rights

Request for information about the rights of the Employee.

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Employee id. |

> An example of a request for information about the rights of an Employee.

```shell
   curl -X GET
     "https://app.kladana.in/api/remap/1.2/entity/employee/7944ef04-f831-11e5-7a69-971500188b19/security"
     -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of information about the rights of an Employee with a custom role.

```json
{
    "isActive": true,
    "login": "example@lognex",
    "email": "example@example.ru",
    "group": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/group/f4b74c5e-443a-11eb-ac12-001000000002",
            "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
            "type": "group",
            "mediaType": "application/json"
        },
        "id": "f4b74c5e-443a-11eb-ac12-001000000002",
        "name": "Main"
    },
    "authorizedHosts": [
        "1.15.15.5"
    ],
    "authorizedIpNetwork": "80.8.8.8",
    "authorizedIpNetmask": "1.8.8.8",
    "role": {
        "meta": {
            "href": "https://app.kladana.in/api/remap/1.2/entity/role/individual",
            "type": "individualrole",
            "mediaType": "application/json"
        },
        "permissions": {
            "importData": true,
            "exportData": true,
            "onlineShops": true,
            "apiRequest": true,
            "sendEmail": true,
            "viewProductCostAndProfit": true,
            "viewDashboard": true,
            "viewRecycleBin": true,
            "viewAudit": false,
            "viewSaleProfit": true,
            "viewCommissionGoods": true,
            "viewPurchaseFunnel": true,
            "viewStockReport": true,
            "viewTurnover": true,
            "viewSerialNumbers": true,
            "viewCashFlow": true,
            "viewCustomerBalanceList": true,
            "viewProfitAndLoss": true,
            "viewCompanyCRM": true,
            "viewMoneyDashboard": false,
            "restoreFromRecycleBin": true,
            "deleteFromRecycleBin": true,
            "editDocumentsOfRestrictedPeriod": false,
            "editDocumentTemplates": true,
            "editCurrencyRateOfDocument": true,
            "subscriptionControl": false,
            "purchaseControl": true,
            "listenCalls": true,
            "remarkingOrder": {
                "view": "NO",
                "print": "NO",
                "create": "NO",
                "update": "NO",
                "delete": "NO"
            },
            "invoiceIn": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "contract": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL"
            },
            "prepayment": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "good": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL"
            },
            "prepaymentReturn": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "cashboxAdjustment": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL"
            },
            "enter": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "bonusTransaction": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "emissionOrder": {
                "view": "NO",
                "print": "NO",
                "create": "NO",
                "update": "NO",
                "delete": "NO"
            },
            "utilizationReport": {
              "view": "NO",
              "print": "NO",
              "create": "NO",
              "update": "NO",
              "delete": "NO"
            },
            "atkAggregation": {
              "view": "NO",
              "print": "NO",
              "create": "NO",
              "update": "NO",
              "delete": "NO"
            },
            "retireOrderOSU": {
              "view": "NO",
              "print": "NO",
              "create": "NO",
              "update": "NO",
              "delete": "NO"
            },
            "myCompany": {
                "view": "ALL",
                "create": "NO",
                "update": "NO",
                "delete": "NO"
            },
            "customerOrder": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
           
            "warehouse": {
                "view": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL"
            },
            "purchaseOrder": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
        
            "retailDrawerCashIn": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "counterpartyAdjustment": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL"
            },
            "cashOut": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "salesReturn": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "cashIn": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "enrollOrder": {
                "view": "NO",
                "print": "NO",
                "create": "NO",
                "update": "NO",
                "delete": "NO"
            },
            "crptPackageItemRemoval": {
                "view": "NO",
                "print": "NO",
                "create": "NO",
                "update": "NO",
                "delete": "NO"
            },
            "employee": {
                "view": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL"
            },
            "supply": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "processing": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "retailSalesReturn": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "demand": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "retailDemand": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "retailDrawerCashOut": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "internalOrder": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "remainsOrder": {
                "view": "NO",
                "print": "NO",
                "create": "NO",
                "update": "NO",
                "delete": "NO"
            },
            "customEntity": {
                "view": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL"
            },
            "purchaseReturn": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "project": {
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
            "inventory": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL"
            },
            "trackingCodeList": {
                "view": "NO",
                "print": "NO"
            },
            "crptPackageCreation": {
                "view": "NO",
                "print": "NO",
                "create": "NO",
                "update": "NO",
                "delete": "NO"
            },
            "retireOrder": {
                "view": "NO",
                "print": "NO",
                "create": "NO",
                "update": "NO",
                "delete": "NO"
            },
            "GTINList": {
                "view": "NO",
                "create": "NO",
                "delete": "NO"
            },
            "move": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "currency": {
                "view": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL"
            },
            "enrollReturn": {
                "view": "NO",
                "print": "NO",
                "create": "NO",
                "update": "NO",
                "delete": "NO"
            },
            "processingOrder": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "processingprocess": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "processingstage" : {
                "view" : "ALL",
                "create" : "ALL",
                "update" : "ALL",
                "delete" : "ALL"
            },
            "country": {
                "view": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL"
            },
            "invoiceOut": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "company": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL"
            },
            "crptCancellation": {
                "view": "NO",
                "print": "NO",
                "create": "NO",
                "update": "NO",
                "delete": "NO"
            },
            "retailStore": {
                "view": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL"
            },
            "accountAdjustment": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL"
            },
            "loss": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "crptPackageDisaggregation": {
                "view": "NO",
                "print": "NO",
                "create": "NO",
                "update": "NO",
                "delete": "NO"
            },
            "processingPlan": {
                "view": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL"
            },
            "paymentIn": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "paymentOut": {
                "view": "ALL",
                "print": "ALL",
                "create": "ALL",
                "update": "ALL",
                "delete": "ALL",
                "approve": "ALL"
            },
            "script": {
                "view": "AUTHOR_OR_ASSIGNEE",
                "create": "ALL",
                "done": "AUTHOR_OR_ASSIGNEE",
                "update": "AUTHOR",
                "delete": "AUTHOR"
            }
        }
    }
}
```

### Change information about Employee's rights

Request to change information about the rights of the Employee.

If the user has the ability to set up permissions for an individual role,
then when installing an individual role, the permissions will be set in accordance with those that were passed in the `permissions` field, the rest of the permissions
will be set to `NO`, except for `view` being `ALL` for `currency`, `country` and `uom`. If there is no `permissions` field
the values of the permissions that the employee had before the role change will be set (by default, if they were not).

If the tariff does not allow changing permissions and the transferred or previously issued permissions differ from the default values, then an error will be returned without changing the role.

**Parameters**

| Parameter | Description |
| ------- | -------------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Employee id. |

> An example of a request to change information about the rights of an Employee.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/employee/7944ef04-f831-11e5-7a69-971500188b19/security"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             group: {
                 "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/group/f4b74c5e-443a-11eb-ac12-001000000003",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
                     "type": "group",
                     "mediaType": "application/json"
                 }
             },
             "authorizedHosts": [
                 "20.20.15.5"
             ],
             role: {
                 "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/role/admin",
                     "type": "system role",
                     "mediaType": "application/json"
                 }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of updated information about the rights of an Employee with an administrator role.

```json
{
     "isActive": true
     "login": "example@lognex",
     "email": "example@example.ru",
     group: {
         "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/group/f4b74c5e-443a-11eb-ac12-001000000003",
             "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
             "type": "group",
             "mediaType": "application/json"
         },
         "id": "f4b74c5e-443a-11eb-ac12-001000000003",
         "name": "New group"
     },
     "authorizedHosts": [
         "20.20.15.5"
     ],
     "authorizedIpNetwork": "80.8.8.8",
     "authorizedIpNetmask": "1.8.8.8",
     role: {
         "meta": {
             "href": "https://app.kladana.in/api/remap/1.2/entity/role/admin",
             "type": "system role",
             "mediaType": "application/json"
         }
     }
}
```

### Employee Activation

Request to activate an Employee in Kladana.

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Employee id. |

If the user was not previously active, then the `login` field must be specified when prompted. The field format is similar to the format in Kladana. A successful result of the request will be json containing the `mailActivationRequired` field with the value
true. This means that an email was sent to the email specified by the employee with a link to the employee's login.

If the user was previously active, then the `login` field does not need to be specified during activation.
A successful result of the request will be a json containing a `mailActivationRequired` field with a value of false. In this
In this case, you can use the previously set password for this user.

> An example of an Employee activation request.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/employee/7944ef04-f831-11e5-7a69-971500188b19/access/activate"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "login": "newmanager@lognex",
             group: {
                 "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/group/f4b74c5e-443a-11eb-ac12-001000000003",
                     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
                     "type": "group",
                     "mediaType": "application/json"
                 }
             },
             role: {
                 "meta": {
                     "href": "https://app.kladana.in/api/remap/1.2/entity/role/manager",
                     "type": "system role",
                     "mediaType": "application/json"
                 }
             }
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of updated information about the activated Employee with the manager role.

```json
{
     "mailActivationRequired": true
}
```

### Employee deactivation

Request to deactivate an Employee in Kladana.

**Parameters**

| Parameter | Description |
| ------ | -------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Employee id. |

> An example of a request to deactivate an Employee.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/employee/7944ef04-f831-11e5-7a69-971500188b19/access/deactivate"
     -H "Authorization: Basic <Credentials>"
```

> Response 204

### Reset employee password

Password Reset Request for Employee in Kladana. A new password will be sent to the email specified by this employee.

**Parameters**

| Parameter | Description |
| ------- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Employee id. |

> An example of a request to reset an Employee's password.

```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/employee/7944ef04-f831-11e5-7a69-971500188b19/access/resetpassword"
     -H "Authorization: Basic <Credentials>"
```

> Response 204


### Admin role request

> An example of a request for an admin role.

```shell
   curl -X GET
     "https://app.kladana.in/api/remap/1.2/entity/role/admin"
     -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of information about the admin role.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/role/admin",
     "type": "system role",
     "mediaType": "application/json"
   }
}
```

### Request for an individual role

> An example of a request for an individual role.

```shell
   curl -X GET
     "https://app.kladana.in/api/remap/1.2/entity/role/individual"
     -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the individual role information.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/role/individual",
     "type": "individual role",
     "mediaType": "application/json"
   }
}
```
