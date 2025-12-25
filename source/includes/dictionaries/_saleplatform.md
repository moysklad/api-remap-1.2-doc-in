## Sale Platform

### Sale Platforms
Using the JSON API, you can view information about Sale Platforms, request lists of Sale Platforms, and get information on individual Sale Platforms. The entity code for a Sale Platform in the JSON API is the keyword saleplatform.

Searching among sale platform objects for a match to a search string is performed by the following fields:

+ by Sale Platform ID **id**
+ by Sale Platform group **salePlatformGroup**

#### Entity attributes
| Title         | Type                                                       | Filtration                  | Description                                                     |
| ---------------- | :-------------------------------------------------------- | :-------------------------- |:----------------------------------------------------------------|
| **id**           | UUID                                                      | `=` `!=`                    | Sale Platform ID<br>`+Required when answering` `+Read Only`     |
| **meta**         | [Meta](../#kladana-json-api-general-info-metadata) |                             | Sale Platform metadata<br>`+Required when answering`            |
| **name**         | String(255)                                               |      | Sale Platform name<br>`+Required when answering`                |
| **salePlatformGroup**         | Enum                                                      | `=` `!=`                    | Sale platform group. [Learn more](../dictionaries/#entities-sale-platform-sale-platforms-sale-platform-group)<br>`+Required when answering` |

#### Sale platform group
List of values representing the Sale Platform group:

| Title                       | Description          |
| ------------------------------ |:------------------|
| **MARKETPLACES**                | Marketplaces      |
| **MESSENGERS**                  | Messengers       |
| **OFFLINE_STORES**             | Offline stores  |
| **ONLINE_STORES**                  | Online stores |
| **SOCIAL_NETWORKS**             | Social networks  |

#### Attributes available for filtering
| Value                       | Description                   |
| ------------------------------ |:---------------------------|
| **id**                         | Sale Platform ID     |
| **salePlatformGroup**                         | Sale platform group |

### Get Sale Platforms
Request to get a list of all sale platforms in the current account.
Result: a JSON object that includes the following fields:

| Title    | Type                                                       | Description                                                              |
| ----------- | :-------------------------------------------------------- |:----------------------------------------------------------------------|
| **meta**    | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the result set                                         |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the employee who executed the request.                        |
| **rows**    | Array(Object)                                             | An array of JSON objects representing sale platforms.       |

**Parameters**

| Parameter                       | Description                                                                                                                  |
| ------------------------------ |:-----------------------------------------------------------------------------------------------------------------------------|
| **limit**                      | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to retrieve.`Allowed values: 1–1000`. |
| **offset**                     | `number` (optional) **Default: 0** *Example: 40* Offset in the returned list of entities.                                      |


> Get Entities

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/saleplatform" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the sale platforms.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/saleplatform",
    "type": "saleplatform",
    "mediaType": "application/json",
    "size": 2,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/saleplatform/0f9b8b4c-4597-4772-b896-c8aff047a110",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/saleplatform/metadata",
        "type": "saleplatform",
        "mediaType": "application/json"
      },
      "id": "39aaefe6-0304-4b85-ad3c-e8b93549f426",
      "name": "Telegram",
      "salePlatformGroup": "MESSENGERS"
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/saleplatform/0f9b8b4c-4597-4772-b896-c8aff047a111",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/saleplatform/metadata",
        "type": "saleplatform",
        "mediaType": "application/json"
      },
      "id": "59e5ed71-f3ac-4346-86e5-e23e3769a2fe",
      "name": "Whatsapp",
      "salePlatformGroup": "MESSENGERS"
    }
  ]
}
```

### Requests — Sale Platform

**Parameters**

| Parameter | Description                                                                                    |
| :------- |:--------------------------------------------------------------------------------------------|
| **id**   | `string` (required) *Example: 39aaefe6-0304-4b85-ad3c-e8b93549f426* Sale Platform id. |

### Get a Sale Platform
> Request to get an individual sale platform with the specified id.

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/saleplatform/39aaefe6-0304-4b85-ad3c-e8b93549f426" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the sale platform.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/saleplatform/39aaefe6-0304-4b85-ad3c-e8b93549f426",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/saleplatform/metadata",
    "type": "saleplatform",
    "mediaType": "application/json"
  },
  "id": "39aaefe6-0304-4b85-ad3c-e8b93549f426",
  "name": "Telegram",
  "salePlatformGroup": "MESSENGERS"
}
```
