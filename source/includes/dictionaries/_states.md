## Transaction statuses

The entity code for Transaction statuses in the JSON API is the **state** keyword.

Statuses can be added, changed and deleted through the API only with administrator rights.

### Statuses
#### Entity attributes

| Title         | Type                                               | Description                                                                                              |
|---------------|----------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Read Only`                                                     |
| **color**     | Int                                                | Status Color<br>`+Required when replying` `+Required when creating`                                      |
| **entityType**| String(255)                                        | Entity type to which Status refers (keyword within the JSON API)<br>`+Required when replying` `+Read-only`|
| **id**        | UUID                                               | Status ID<br>`+Required when replying` `+Read Only`                                                      |
| **meta**      | [Meta](../#kladana-json-api-general-info-metadata) | Status Metadata<br>`+Required when replying` `+Read Only`                                                |
| **name**      | String(255)                                        | Status Name<br>`+Required when replying` `+Required when creating`                                       |
| **stateType** | Enum                                               | Status Type<br>`+Required when replying` `+Required when creating`                                       |

##### Status type

| Title        | Description     |
|--------------|-----------------|
| regular      | Normal (default)|
| successful   | Final positive  |
| Unsuccessful | Final negative  |

The **color** field is passed to the API as an integer consisting of 4 bytes.
Because color is transmitted in the ARGB color space, each byte is responsible for its own
color respectively: 1 - for transparency, 2 - for red, 3 - for green,
4 - for blue. Each byte takes values from 0 to 255 as well as the color in each of
color space channels. The result of 4 consecutive bytes written
the number converted to 10 is the representation of the status color in the JSON API.

Example: the color `rgb(162, 198, 23)` will match the following value of the `"color" field: 10667543`.

You can view lists of existing statuses in the context of transaction metadata, for example by making a GET request to the URL https://api.kladana.com/api/remap/1.2/entity/demand/metadata
The list of statuses for the `demand` transaction is displayed in the states collection.

### Get metadata

**Parameters**

| Parameter | Description |
| ----------| ----------|
| **entityType** | `string` (required) *Example: counterparty* entity type. |

> Get metadata including statuses

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty",
     "mediaType": "application/json"
   },
   "states": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/4f70c518-60a1-11e7-6adb-ede500000003",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "4f70c518-60a1-11e7-6adb-ede500000003",
       "accountId": "0af94520-54f7-11e7-6adb-ede500000001",
       "name": "New",
       "color": 15106326,
       "stateType": "Regular",
       "entityType": "counterparty"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/3b6eb61a-60c5-11e7-6adb-ede500000001",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "3b6eb61a-60c5-11e7-6adb-ede500000001",
       "accountId": "0af94520-54f7-11e7-6adb-ede500000001",
       "name": "Agreement signed",
       "color": 10667543,
       "stateType": "Successful",
       "entityType": "counterparty"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/3b6fd06a-60c5-11e7-6adb-ede500000002",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
         "type": "state",
         "mediaType": "application/json"
       },
       "id": "3b6fd06a-60c5-11e7-6adb-ede500000002",
       "accountId": "0af94520-54f7-11e7-6adb-ede500000001",
       "name": "Rejected",
       "color": 10774205,
       "stateType": "Unsuccessful",
       "entityType": "counterparty"
     }
   ],
   "createShared": false
}
```

### Create status

Create a new status.

#### Description
The status is created based on the passed JSON object,
which contains a representation of the new Status.
The result is a JSON representation of the generated Status. To create a new Status,
it is necessary and sufficient to specify non-empty fields `name`, `color`, `stateType` in the passed object.

**Parameters**

| Parameter | Description |
| --------- | ------- |
| **entityType** | `string` (required) *Example: counterparty* entity type. |

> Create one status.

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "Approved",
             "color": 69446,
             "stateType": "Regular"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Status.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/6262b270-60c3-11e7-6adb-ede50000000d",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
     "type": "state",
     "mediaType": "application/json"
   },
   "id": "6262b270-60c3-11e7-6adb-ede50000000d",
   "accountId": "0af94520-54f7-11e7-6adb-ede500000001",
   "name": "Approved",
   "color": 69446,
   "stateType": "Regular",
   "entityType": "counterparty"
}
```

### Change status
Change an existing status.

#### Description
The status changes based on the passed JSON object.
The result is a JSON representation of the updated or created Status.
To update the Status, you must specify in the passed object
one or more fields with new values: `name`, `color`, `stateType`.

**Parameters**

| Parameter | Description |
| ----------| ------- |
| **entityType** | `string` (required) *Example: counterparty* entity type. |
| **id** | `string` (required) *Example: 4dcb3f23-60c4-11e7-6adb-ede500000019* Status id. |

> Status change.

```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/4dcb3f23-60c4-11e7-6adb-ede500000019"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             color: 255
             "stateType": "Regular"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the changed Status.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/6262b270-60c3-11e7-6adb-ede50000000d",
     "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
     "type": "state",
     "mediaType": "application/json"
   },
   "id": "6262b270-60c3-11e7-6adb-ede50000000d",
   "accountId": "0af94520-54f7-11e7-6adb-ede500000001",
   "name": "Approved",
   "color": 255,
   "stateType": "Regular",
   "entityType": "counterparty"
}
```

### Bulk creation and updating of Statuses
[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) Statuses.
In the body of the request, you need to pass an array containing the JSON representation of the Statuses that you want to create or update.
Updated Statuses must contain the identifier in the form of metadata.

> Example of creating and updating multiple Statuses

```shell
   curl -X POST
     "https://api.kladana.com/api/remap/1.2/entity/metadata/states"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "Pending",
               "color": 8767198,
               "stateType": "Regular"
             },
             {
               "meta": {
                 "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/b56215dc-60c3-11e7-6adb-ede500000013",
                 "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                 "type": "state",
                 "mediaType": "application/json"
               },
               "name": "On signing",
               "color": 34617,
               "stateType": "Regular"
             }
           ]'
```

> Response 200(application/json)
Successful requestWith. The result is a JSON array of representations of the created and updated Statuses.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/b55d2ddf-60c3-11e7-6adb-ede500000010",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "state",
       "mediaType": "application/json"
     },
     "id": "b55d2ddf-60c3-11e7-6adb-ede500000010",
     "accountId": "0af94520-54f7-11e7-6adb-ede500000001",
     "name": "Pending",
     "color": 8767198,
     "stateType": "Regular",
     "entityType": "counterparty"
   },
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/b56215dc-60c3-11e7-6adb-ede500000013",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "state",
       "mediaType": "application/json"
     },
     "id": "b56215dc-60c3-11e7-6adb-ede500000013",
     "accountId": "0af94520-54f7-11e7-6adb-ede500000001",
     "name": "On signing",
     "color": 34617,
     "stateType": "Regular",
     "entityType": "counterparty"
   }
]
```

### Delete Status

**Parameters**

| Parameter | Description |
| ------- | --------- |
| **entityType** | `string` (required) *Example: counterparty* entity type. |
| **id** | `string` (required) *Example: 4dcb3f23-60c4-11e7-6adb-ede500000019* Status id. |

> Request to delete the Status with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/4dcb3f23-60c4-11e7-6adb-ede500000019"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful deletion of the Status.
