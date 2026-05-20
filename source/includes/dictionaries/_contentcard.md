## Content Card

### Content Cards
Using the JSON API, you can create, update, delete, and view Content Cards, request lists of Content Cards, and get information about individual Content Cards. The entity code for a Content Card in the JSON API is the **contentcard** keyword.

#### Entity attributes
| Title | Type | Filtration | Description                                                                                                                                                                                                                                                                        |
| ------ | :------ | :------ |:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **accountId** | UUID | `=` `!=` | Account ID<br>`+Required when replying` `+Read Only`                                                                                                                                                                                                                               |
| **assortment** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Assortment metadata<br>`+Expand` `+Required when replying` `+Required when creating` `+Cannot be changed after filling`                                                                                                                                                            |
| **cardContentName** | String(255) | | How the Content Card is displayed in the UI list<br>`+Required when replying` `+Required when creating`                                                                                                                                                                            |
| **description** | String(10000) | | Product or service description<br>`+Required when replying` `+Required when creating`                                                                                                                                                                                              |
| **group** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee department metadata<br>`+Required when replying` `+Expand` `+Read Only`                                                                                                                                                                                                   |
| **id** | UUID | `=` `!=` | Content Card ID<br>`+Required when replying` `+Read Only`                                                                                                                                                                                                                          |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | | Content Card metadata<br>`+Required when replying`                                                                                                                                                                                                                                 |
| **name** | String(255) | | Product or service name<br>`+Required when replying` `+Required when creating`                                                                                                                                                                                                     |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee) metadata<br>`+Expand` `+Read Only`                                                                                                                                                                                                                                |
| **shared** | Boolean | | Shared access<br>`+Required when replying` `+Read Only`                                                                                                                                                                                                                            |
| **salePlatform** | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Sale Platform metadata. [Learn more](../dictionaries/#entities-sale-platform).<br>`+Expand` `+Required when replying` `+Required when creating`                                                                                                                                    |
| **salesChannels** | Array(Object) | `=` | Array of links to related Sales Channels in the Metadata format. [Learn more](../dictionaries/#entities-sales-channel). Maximum number is 1000. To filter by this field, use its singular form: **salesChannel**.<br>`+Expand` `+Required when replying` `+Required when creating` |

#### Attributes available for filtering
| Value | Description |
| ------ | :------ |
| **accountId** | Account ID |
| **assortment** | Content Card assortment |
| **group** | Employee department |
| **id** | Content Card ID |
| **owner** | Owner (Employee) |
| **salePlatform** | Sale Platform |
| **salesChannel** | Sales Channel |

### Get Content Cards
Request to get a list of all Content Cards in the current account.
Result: a JSON object that includes the following fields:

| Title | Type | Description |
| ------ | :------ | :------ |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the result set |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the employee who executed the request. |
| **rows** | Array(Object) | An array of JSON objects representing Content Cards. |

**Parameters**

| Parameter | Description |
| ------ | :------ |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Offset in the returned list of entities. |

> Get Entities

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/contentcard" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the list of Content Cards.

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
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=e0b3018f-d666-11f0-0a80-073800000055"
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
      "cardContentName": "Name",
      "assortment": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/013c258e-d667-11f0-0a80-073800000148",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#good/edit?id=013b7724-d667-11f0-0a80-073800000146"
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
            "uuidHref": "https://app.kladana.com/app/#saleschannel/edit?id=f26b01a3-dbdb-11f0-f406-77170000015d"
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
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=e0b3018f-d666-11f0-0a80-073800000055"
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
      "description": "description",
      "cardContentName": "name",
      "assortment": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/013c258e-d667-11f0-0a80-073800000148",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#good/edit?id=013b7724-d667-11f0-0a80-073800000146"
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
            "uuidHref": "https://app.kladana.com/app/#saleschannel/edit?id=31e8ce0f-c99f-4824-a930-83fe7de68cd6"
          }
        }
      ]
    }
  ]
}
```

### Requests - Content Card

**Parameters**

| Parameter | Description |
| :------ | :------ |
| **id** | `string` (required) *Example: 529eb5b6-d726-11f0-0a80-073800000329* Content Card ID. |

### Get a Content Card
> Request to get an individual Content Card with the specified id.

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/contentcard/529eb5b6-d726-11f0-0a80-073800000329" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the Content Card.

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
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=e0b3018f-d666-11f0-0a80-073800000055"
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
  "cardContentName": "Name",
  "assortment": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/013c258e-d667-11f0-0a80-073800000148",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#good/edit?id=013b7724-d667-11f0-0a80-073800000146"
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
        "uuidHref": "https://app.kladana.com/app/#saleschannel/edit?id=31e8ce0f-c99f-4824-a930-83fe7de68cd6"
      }
    }
  ]
}
```

### Create Content Card
Request to create a new Content Card.

> Example request to create a new Content Card.

```shell
curl --compressed -X POST \
  "https://api.kladana.com/api/remap/1.2/entity/contentcard" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip" \
  -H "Content-Type: application/json" \
  -d '{
        "name": "product",
        "description": "Description",
        "cardContentName": "Name",
        "assortment": {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/product/013c258e-d667-11f0-0a80-073800000148",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
            "type": "product",
            "mediaType": "application/json"
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
              "mediaType": "application/json"
            }
          }
        ]
      }'
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the created Content Card.

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
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=e0b3018f-d666-11f0-0a80-073800000055"
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
  "cardContentName": "Name",
  "assortment": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/013c258e-d667-11f0-0a80-073800000148",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#good/edit?id=013b7724-d667-11f0-0a80-073800000146"
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
        "uuidHref": "https://app.kladana.com/app/#saleschannel/edit?id=31e8ce0f-c99f-4824-a930-83fe7de68cd6"
      }
    }
  ]
}
```

### Bulk creation and update of Content Cards
[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Content Cards.
In the request body, pass an array containing JSON representations of the Content Cards you want to create or update.
Updated Content Cards must contain the identifier as metadata.

> Example of creating and updating multiple Content Cards

```shell
curl --compressed -X POST \
  "https://api.kladana.com/api/remap/1.2/entity/contentcard" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip" \
  -H "Content-Type: application/json" \
  -d '[
        {
          "name": "product",
          "description": "Description",
          "cardContentName": "Name",
          "assortment": {
            "meta": {
              "href": "https://api.kladana.com/api/remap/1.2/entity/product/013c258e-d667-11f0-0a80-073800000148",
              "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
              "type": "product",
              "mediaType": "application/json"
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
                "mediaType": "application/json"
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
          "description": "Updated description",
          "cardContentName": "Updated name"
        }
      ]'
```

> Response 200 (application/json)
Successful request. The result is an array of JSON representations of the created and updated Content Cards.

```json
[
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
        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=e0b3018f-d666-11f0-0a80-073800000055"
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
    "cardContentName": "Name",
    "assortment": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/013c258e-d667-11f0-0a80-073800000148",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
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
          "uuidHref": "https://app.kladana.com/app/#saleschannel/edit?id=31e8ce0f-c99f-4824-a930-83fe7de68cd6"
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
        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=e0b3018f-d666-11f0-0a80-073800000055"
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
    "description": "Updated description",
    "cardContentName": "Updated name",
    "assortment": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/013c258e-d667-11f0-0a80-073800000148",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json"
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
          "uuidHref": "https://app.kladana.com/app/#saleschannel/edit?id=31e8ce0f-c99f-4824-a930-83fe7de68cd6"
        }
      }
    ]
  }
]
```

### Change Content Card
Request to update an existing Content Card.

**Parameters**

| Parameter | Description |
| :------ | :------ |
| **id** | `string` (required) *Example: 529eb5b6-d726-11f0-0a80-073800000329* Content Card ID. |

> Example request to update a Content Card.

```shell
curl --compressed -X PUT \
  "https://api.kladana.com/api/remap/1.2/entity/contentcard/529eb5b6-d726-11f0-0a80-073800000329" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip" \
  -H "Content-Type: application/json" \
  -d '{
        "name": "Updated product name",
        "description": "Updated description",
        "cardContentName": "Updated name",
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
              "mediaType": "application/json"
            }
          }
        ]
      }'
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the updated Content Card.

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
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=e0b3018f-d666-11f0-0a80-073800000055"
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
  "name": "Updated product name",
  "description": "Updated description",
  "cardContentName": "Updated name",
  "assortment": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/013c258e-d667-11f0-0a80-073800000148",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#good/edit?id=013b7724-d667-11f0-0a80-073800000146"
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
        "uuidHref": "https://app.kladana.com/app/#saleschannel/edit?id=31e8ce0f-c99f-4824-a930-83fe7de68cd6"
      }
    }
  ]
}
```

### Delete Content Card

**Parameters**

| Parameter | Description |
| :------ | :------ |
| **id** | `string` (required) *Example: 529eb5b6-d726-11f0-0a80-073800000329* Content Card ID. |

> Request to delete the Content Card with the specified id.

```shell
curl --compressed -X DELETE \
  "https://api.kladana.com/api/remap/1.2/entity/contentcard/529eb5b6-d726-11f0-0a80-073800000329" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful deletion of the Content Card.

### Bulk deletion of Content Cards

In the request body, pass an array containing the JSON metadata of the Content Cards you want to delete.

> Request to bulk delete Content Cards.

```shell
curl --compressed -X POST \
  "https://api.kladana.com/api/remap/1.2/entity/contentcard/delete" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip" \
  -H "Content-Type: application/json" \
  -d '[
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/contentcard/529eb5b6-d726-11f0-0a80-073800000329",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contentcard/metadata",
            "type": "contentcard",
            "mediaType": "application/json"
          }
        },
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/contentcard/dfbef48e-d67d-11f0-0a80-0738000002d8",
            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/contentcard/metadata",
            "type": "contentcard",
            "mediaType": "application/json"
          }
        }
      ]'
```

> Successful request. The result is JSON information about deleting Content Cards.

```json
[
  {
    "info": "Entity 'contentcard' with UUID: 529eb5b6-d726-11f0-0a80-073800000329 successfully deleted"
  },
  {
    "info": "Entity 'contentcard' with UUID: dfbef48e-d67d-11f0-0a80-0738000002d8 successfully deleted"
  }
]
```
