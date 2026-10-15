# Entities

## Alternatives

The JSON API allows you to retrieve and update the list of alternatives for Products, Services, Bundles, and Product variants.
The maximum number of alternatives per object is 10.

### Object attributes

| Title            | Type                         | Filtration | Description |
| ---------------- | :--------------------------- | :--------- | :---------- |
| **assortment**   | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=`   | Assortment metadata.<br>`+Expand` `+Required when answering` |
| **alternatives** | Array(Object)                |            | A list of alternatives for the Assortment.<br>`+Required when answering` |

Each item in the **alternatives** array contains the following attributes:

| Title          | Type                         | Description |
| -------------- | :--------------------------- | :---------- |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Assortment item specified as an alternative.<br>`+Expand` `+Required when answering` |

The links between an Assortment item and its alternatives work both ways: if item B appears in item A's **alternatives** list, item A appears in item B's list. To create such a link, you only need to specify the alternative for one of the items.

#### Filtering behavior

Without a filter, only Assortment items that have alternatives are returned.

- The filter applies to Assortment items and does not restrict the contents of their **alternatives** arrays.
- Using `assortment=` returns the specified items whether or not they have alternatives. For items without alternatives, the **alternatives** array is empty.
- Using `assortment!=` returns items with alternatives, excluding those specified in the filter. An item excluded by the filter may still appear in the response as an alternative.

### Get alternatives

The result is a JSON object containing the following fields:

| Title       | Type                         | Description |
| ----------- | :--------------------------- | :---------- |
| **meta**    | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the result set. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the employee who made the request. |
| **rows**    | Array(Object)                | An array of JSON objects representing Assortment with alternatives. |

**Parameters**

| Parameter  | Description |
| ---------- | :---------- |
| **limit**  | `number` (optional) **Default: 1000** *Example: 100* The maximum number of Assortment items in the response. Allowed values: `1–1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* The offset in the list of Assortment items. |

These apply to Assortment items. Each item's alternatives list is returned in full.

> Get alternatives

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/assortment/alternatives" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json). Successful request. The result is a JSON representation of Assortment items with alternatives.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/assortment/alternatives",
    "type": "assortmentalternatives",
    "mediaType": "application/json",
    "size": 2,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "assortment": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/35427052-36e7-11e7-8a7f-40d0000000d7",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json"
        }
      },
      "alternatives": [
        {
          "assortment": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/product/437f2d67-36e7-11e7-8a7f-40d0000000df",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
              "type": "product",
              "mediaType": "application/json"
            }
          }
        }
      ]
    },
    {
      "assortment": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/437f2d67-36e7-11e7-8a7f-40d0000000df",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json"
        }
      },
      "alternatives": [
        {
          "assortment": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/product/35427052-36e7-11e7-8a7f-40d0000000d7",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
              "type": "product",
              "mediaType": "application/json"
            }
          }
        }
      ]
    }
  ]
}
```

> Get alternatives for a single Product

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/assortment/alternatives?filter=assortment=https://api.kladana.com/api/remap/1.2/entity/product/35427052-36e7-11e7-8a7f-40d0000000d7" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json). Successful request. The result is a JSON representation of a Product with its list of alternatives.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/assortment/alternatives?filter=assortment=https://api.kladana.com/api/remap/1.2/entity/product/35427052-36e7-11e7-8a7f-40d0000000d7",
    "type": "assortmentalternatives",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "assortment": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/35427052-36e7-11e7-8a7f-40d0000000d7",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json"
        }
      },
      "alternatives": [
        {
          "assortment": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/product/437f2d67-36e7-11e7-8a7f-40d0000000df",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
              "type": "product",
              "mediaType": "application/json"
            }
          }
        }
      ]
    }
  ]
}
```
