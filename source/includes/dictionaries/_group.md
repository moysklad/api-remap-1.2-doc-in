## Department
### Departments
Using the JSON API, you can request and modify lists of Departments and information on individual Departments. The entity code for the Department as part of the JSON API is the **group** keyword.

The entity can be contextually searched using the special `search` parameter. [Learn more](../#mojsklad-json-api-obschie-swedeniq-kontextnyj-poisk). The search with the search parameter differs from others in that the search is not prefixed, without tokenization, and only goes through one field at a time. Searches for strings that include the value of the search string.

Search among objects of departments to match the search string will be carried out using the following fields:

+ by Department name **name**

#### Entity attributes

| Title| Type | Filtration | Description |
| --------| ----| ------- |------------ |
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only` |
| **id** | UUID | `=` `!=` | Department ID<br>`+Required when replying` `+Read Only` |
| **index** | int | | Ordinal number in the list of departments |
| **meta** | [Meta](../#mojsklad-json-api-obschie-swedeniq-metadannye) | | Department Metadata<br>`+Required when replying` |
| **name** | String(255) | | Department Name<br>`+Required when answering` |

### Get Departments

**Parameters**

| Parameter | Description |
| ------------| ------------ |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
 
> Request to get all departments on this account.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/group"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of departments.

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
     "href": "https://app.kladana.in/api/remap/1.2/entity/group",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
     "type": "group",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type": "group",
         "mediaType": "application/json"
       },
       "id" : "f97aa1fb-2e58-11e6-8a84-bae500000002",
       "accountId" : "2aa3f5df-296b-11e6-8a84-bae500000001",
       "name": "Main",
       "index" : 0
     },
     {
       "meta" : {
         "href" : "https://app.kladana.in/api/remap/1.2/entity/group/a4047c9a-0fca-11eb-ac13-000700000003",
         "metadataHref" : "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
         "type" : "group",
         "mediaType" : "application/json"
       },
       "id" : "a4047c9a-0fca-11eb-ac13-000700000003",
       "accountId" : "2aa3f5df-296b-11e6-8a84-bae500000001",
       "name" : "New department",
       "index" : 1
     }
   ]
}
```

**Parameters**

| Parameter | Description |
| ------- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* department id. |
 
> Request to get a separate department with the specified id.

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of an individual department.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
     "type": "group",
     "mediaType": "application/json"
   },
   "id" : "f97aa1fb-2e58-11e6-8a84-bae500000002",
   "accountId" : "2aa3f5df-296b-11e6-8a84-bae500000001",
   "name": "Main",
   "index" : 0
}
```
### Create Department

The department is created based on the passed JSON object,
which contains the representation of the new Department.
The result is a JSON representation of the created Department. To create a new department,
it is necessary and sufficient to specify a non-empty `name` field in the passed object. The new department will be added to the end of the list.
If you need to put a new department at the top of the list, just pass 0 in the `index` field
 
> An example of adding a department.
  
   ```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/group"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "New department",
           }'
   ```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Department.

```json
{
   "meta" : {
     "href" : "https://app.kladana.in/api/remap/1.2/entity/group/a4047c9a-0fca-11eb-ac13-000700000003",
     "metadataHref" : "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
     "type" : "group",
     "mediaType" : "application/json"
   },
   "id" : "a4047c9a-0fca-11eb-ac13-000700000003",
   "accountId" : "2aa3f5df-296b-11e6-8a84-bae500000001",
   "name" : "New department",
   "index" : 1
}
```
 
> An example of inserting a Department at the top of the list.
  
   ```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/group"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "New department",
             "index" : 0
           }'
   ```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Department.

```json
{
   "meta" : {
     "href" : "https://app.kladana.in/api/remap/1.2/entity/group/a4047c9a-0fca-11eb-ac13-000700000003",
     "metadataHref" : "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
     "type" : "group",
     "mediaType" : "application/json"
   },
   "id" : "a4047c9a-0fca-11eb-ac13-000700000003",
   "accountId" : "2aa3f5df-296b-11e6-8a84-bae500000001",
   "name" : "New department",
   "index" : 0
}
```

### Change Department

Request to update the name and/or serial number of the Department.

> An example of changing the name of the Department.
  
   ```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/group/a4047c9a-0fca-11eb-ac13-000700000003"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "New department name",
           }'
   ```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Product.

```json
{
   "meta" : {
     "href" : "https://app.kladana.in/api/remap/1.2/entity/group/a4047c9a-0fca-11eb-ac13-000700000003",
     "metadataHref" : "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
     "type" : "group",
     "mediaType" : "application/json"
   },
   "id" : "a4047c9a-0fca-11eb-ac13-000700000003",
   "accountId" : "2aa3f5df-296b-11e6-8a84-bae500000001",
   "name" : "New department name",
   "index" : 1
}
```
 
> An example of moving a Department to the top of the list.
  
   ```shell
   curl -X PUT
     "https://app.kladana.in/api/remap/1.2/entity/group/a4047c9a-0fca-11eb-ac13-000700000003"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "index": 0
           }'
   ```

> Response 200(application/json)
Successful request. The result is a JSON representation of the created Department.

```json
{
   "meta" : {
     "href" : "https://app.kladana.in/api/remap/1.2/entity/group/a4047c9a-0fca-11eb-ac13-000700000003",
     "metadataHref" : "https://app.kladana.in/api/remap/1.2/entity/group/metadata",
     "type" : "group",
     "mediaType" : "application/json"
   },
   "id" : "a4047c9a-0fca-11eb-ac13-000700000003",
   "accountId" : "2aa3f5df-296b-11e6-8a84-bae500000001",
   "name" : "New department",
   "index" : 0
}
```

### Delete Department

**Parameters**

| Parameter | Description |
| ------- | -------- |
| **id** | `string` (required) *Example: a4047c9a-0fca-11eb-ac13-000700000003* department id. |
 
> Request to delete the Department with the specified id.

```shell
curl -X DELETE
   "https://app.kladana.in/api/remap/1.2/entity/group/a4047c9a-0fca-11eb-ac13-000700000003"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful deletion of the Department.
