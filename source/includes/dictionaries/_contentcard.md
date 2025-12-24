## Content Card

### Content Cards
Using the JSON API, you can view information about Content Cards, request lists of Content Cards, and get information on individual Content Cards. The entity code for a Content Card in the JSON API is the keyword contentcard.

#### Entity attributes
| Title            | Type                            | Filtration             | Description                                                                                                                                                                                                                 |
|---------------------|:-------------------------------|:-----------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **accountId**       | UUID                           | `=` `!=`               | Account ID<br>`+Required in response` `+Read-only`                                                                                                                                                                          |
| **assortment**      | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`               | Assortment metadata<br>`+Expand` `+Required in response`                                                                                                                                                                    |
| **cardContentName** | String(255)                    |  | How the content card is displayed in the UI list                                                                                                                                                                            |
| **description**     | String(10000)                  |  | Description of the product or service                                                                                                                                                                                       |
| **group**           | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`               | Employee department metadata<br>`+Required in response` `+Expand`                                                                                                                                                           |
| **id**              | UUID                           | `=` `!=`               | Content Card ID<br>`+Required in response` `+Read-only`                                                                                                                                                                     |
| **meta**            | [Meta](../#kladana-json-api-general-info-metadata) |                        | Content Card metadata<br>`+Required in response`                                                                                                                                                                            |
| **name**            | String(255)                    |  | Name of the product or service<br>`+Required in response`                                                                                                                                                                   |
| **owner**           | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`               | Owner (Employee) metadata<br>`+Expand`                                                                                                                                                                                      |
| **shared**          | Boolean                        |                | Shared access<br>`+Required in response` `+Read-only`                                                                                                                                                                       |
| **salePlatform**    | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`               | Sale Platform metadata. More details here.<br>`+Expand` `+Required in response`                                                                                                                                             |
| **salesChannels**   | Array(Object) | `=` | Array of links to related sales channels in the Metadata format. More details here. Maximum number is 1000. To filter by this field, you must use its singular form: **salesChannel**.<br>`+Expand` `+Required in response` |


#### Attributes available for filtering
| Value              | Description              |
|-----------------------|:-------------------------|
| **accountId**         | Account ID               |
| **assortment**         | Content card assortment  |
| **group**             | Employee department       |
| **id**                | Content Card ID   |
| **owner**             | Owner (Employee)  |
| **salePlatform** | Sale Platform     |
| **salesChannel**             | Sales channel             |


### Get Content Cards
Request to get a list of all content cards in the current account.
Result: a JSON object that includes the following fields:

| Title    | Type                                                       | Description                                                            |
| ----------- | :-------------------------------------------------------- |:-----------------------------------------------------------------------|
| **meta**    | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the result set                                          |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the employee who executed the request.                          |
| **rows**    | Array(Object)                                             | An array of JSON objects representing content cards.          |

**Parameters**

| Parameter                       | Description                                                                                                                               |
| ------------------------------ | :------------------------------------------------------------------------------------------------------------------------------------- |
| **limit**                      | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to retrieve.`Допустимые значения 1 - 1000`. |
| **offset**                     | `number` (optional) **Default: 0** *Example: 40* Offset in the returned list of entities.                                                 |


> Get Entities

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/contentcard" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the list of content cards.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/contentcard",
    "type": "contentcard",
    "mediaType": "application/json",
    "size": 2,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/contentcard/529eb5b6-d726-11f0-0a80-073800000329",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contentcard/metadata",
        "type": "contentcard",
        "mediaType": "application/json"
      },
      "id": "529eb5b6-d726-11f0-0a80-073800000329",
      "accountId": "e008259e-d666-11f0-0a83-14a000000002",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/e0b3018f-d666-11f0-0a80-073800000055",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://online.moysklad.ru//app/#employee/edit?id=e0b3018f-d666-11f0-0a80-073800000055"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/e00acc42-d666-11f0-0a83-14a000000003",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "name": "product",
      "description": "Description",
      "cardContentName": "title",
      "assortment": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/013c258e-d667-11f0-0a80-073800000148",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json",
          "uuidHref": "https://online.moysklad.ru//app/#good/edit?id=013b7724-d667-11f0-0a80-073800000146"
        }
      },
      "salePlatform": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/saleplatform/0f9b8b4c-4597-4772-b896-c8aff047a117",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/saleplatform/metadata",
          "type": "saleplatform",
          "mediaType": "application/json"
        }
      },
      "salesChannels": [
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/f26b01a3-dbdb-11f0-f406-77170000015d",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/metadata",
            "type": "saleschannel",
            "mediaType": "application/json",
            "uuidHref": "https://api.kladana.com/app/#saleschannel/edit?id=f26b01a3-dbdb-11f0-f406-77170000015d"
          }
        }
      ]
    },
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/contentcard/dfbef48e-d67d-11f0-0a80-0738000002d8",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contentcard/metadata",
        "type": "contentcard",
        "mediaType": "application/json"
      },
      "id": "dfbef48e-d67d-11f0-0a80-0738000002d8",
      "accountId": "e008259e-d666-11f0-0a83-14a000000002",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/e0b3018f-d666-11f0-0a80-073800000055",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://online.moysklad.ru/app/#employee/edit?id=e0b3018f-d666-11f0-0a80-073800000055"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/e00acc42-d666-11f0-0a83-14a000000003",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "name": "product",
      "description": "Description",
      "cardContentName": "name",
      "assortment": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/013c258e-d667-11f0-0a80-073800000148",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json",
          "uuidHref": "https://online.moysklad.ru/app/#good/edit?id=013b7724-d667-11f0-0a80-073800000146"
        }
      },
      "salePlatform": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/saleplatform/0f9b8b4c-4597-4772-b896-c8aff047a119",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/saleplatform/metadata",
          "type": "saleplatform",
          "mediaType": "application/json"
        }
      },
      "salesChannels": [
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/31e8ce0f-c99f-4824-a930-83fe7de68cd6",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/metadata",
            "type": "saleschannel",
            "mediaType": "application/json",
            "uuidHref": "https://online.moysklad.ru/app/#saleschannel/edit?id=31e8ce0f-c99f-4824-a930-83fe7de68cd6"
          }
        }
      ]
    }
  ]
}
```

### Requests — Content Card

**Parameters**

| Parameter | Description                                                                                  |
| :------- |:------------------------------------------------------------------------------------------|
| **id**   | `string` (required) *Example: 39aaefe6-0304-4b85-ad3c-e8b93549f426* Content Card id. |

### Get a Content Card
> Request to get an individual content card with the specified id.

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/contentcard/529eb5b6-d726-11f0-0a80-073800000329" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the content card.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/contentcard/529eb5b6-d726-11f0-0a80-073800000329",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contentcard/metadata",
    "type": "contentcard",
    "mediaType": "application/json"
  },
  "id": "529eb5b6-d726-11f0-0a80-073800000329",
  "accountId": "e008259e-d666-11f0-0a83-14a000000002",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/e0b3018f-d666-11f0-0a80-073800000055",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://online.moysklad.ru//app/#employee/edit?id=e0b3018f-d666-11f0-0a80-073800000055"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/e00acc42-d666-11f0-0a83-14a000000003",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "name": "product",
  "description": "Description",
  "cardContentName": "name",
  "assortment": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/013c258e-d667-11f0-0a80-073800000148",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json",
      "uuidHref": "https://online.moysklad.ru//app/#good/edit?id=013b7724-d667-11f0-0a80-073800000146"
    }
  },
  "salePlatform": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/saleplatform/0f9b8b4c-4597-4772-b896-c8aff047a117",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/saleplatform/metadata",
      "type": "saleplatform",
      "mediaType": "application/json"
    }
  },
  "salesChannels": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/31e8ce0f-c99f-4824-a930-83fe7de68cd6",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/saleschannel/metadata",
        "type": "saleschannel",
        "mediaType": "application/json",
        "uuidHref": "https://online.moysklad.ru/app/#saleschannel/edit?id=31e8ce0f-c99f-4824-a930-83fe7de68cd6"
      }
    }
  ]
}
```
