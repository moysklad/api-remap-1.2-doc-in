## Handling unit

### Handling units

Using JSON API, you can create and update information about Handling units, retrieve lists of Handling units, and retrieve information about individual Handling units. The entity code for a Handling unit in JSON API is **aggregatepack**.

#### Entity attributes

| Title        | Type          | Filtering                  | Description                                                                                                                                                |
|--------------|---------------|----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| accountId    | UUID          | `=` `!=`                   | Account ID<br>`+Required when replying` `+Read Only`                                                                                                       |
| barcodes     | Array(Object) | `=` `!=` `~` `~=` `=~`     | Handling unit barcodes. To filter by this field, specify it in the singular form: **barcode**<br>`+Required when replying` `+Required when creating`       |
| childrenList | Array(Meta)   |                            | Nested handling units metadata<br>The field is available only when using the header `X-Lognex-Remap-Beta-Feature: aggregatePackChildrenList`.<br>`+Expand` |
| group        | Meta          | `=` `!=`                   | Employee department metadata<br>`+Required when replying` `+Expand`                                                                                        |
| id           | UUID          | `=` `!=`                   | Handling unit ID<br>`+Required when replying` `+Read Only`                                                                                                 |
| level        | Int           | `=` `!=` `<` `>` `<=` `>=` | Maximum nesting level of the handling unit<br>`+Required when replying` `+Read Only`                                                                       |
| meta         | Meta          |                            | Handling unit metadata<br>`+Required when replying`                                                                                                        |
| moment       | DateTime      | `=` `!=` `<` `>` `<=` `>=` | Handling unit date<br>`+Required when replying`                                                                                                            |
| owner        | Meta          | `=` `!=`                   | Owner (Employee) metadata<br>`+Expand`                                                                                                                     |
| positions    | MetaArray     |                            | Handling unit items metadata<br>`+Required when replying` `+Expand`                                                                                        |
| shared       | Boolean       | `=` `!=`                   | Sharing                                                                                                                                                    |
| updated      | DateTime      | `=` `!=` `<` `>` `<=` `>=` | The moment when the entity was last updated<br>`+Required when replying` `+Read Only`                                                                      |

#### Nested Handling units

To retrieve and send the **childrenList** field, you must include the `X-Lognex-Remap-Beta-Feature: aggregatePackChildrenList` header.

The **childrenList** field is available as part of beta functionality and may be changed or removed in the future.

If the header is not provided:

+ the **childrenList** field is not returned in the response.
+ the **childrenList** field provided in the request body is not processed.

> Example of creating a Handling unit with a nested Handling unit.

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "X-Lognex-Remap-Beta-Feature: aggregatePackChildrenList" \
    -H "Content-Type: application/json" \
      -d '{
            "barcodes": [
                {
                    "ean8": "00000000"
                }
            ],
            "childrenList": [
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/247d9890-bcd6-11f1-0a83-006800000000",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/metadata",
                        "type": "aggregatepack",
                        "mediaType": "application/json"
                    }
                }
            ]
        }'  
```

> Response 200
Successful request. The result is a JSON representation of the created Handling unit.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/c7ddac29-bcd6-11f1-0a83-00680000000c",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/metadata",
    "type": "aggregatepack",
    "mediaType": "application/json"
  },
  "id": "c7ddac29-bcd6-11f1-0a83-00680000000c",
  "accountId": "04d9a089-bcd6-11f1-0a80-24d80000000c",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/050ee558-bcd6-11f1-0a83-049d000001bf",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=050ee558-bcd6-11f1-0a83-049d000001bf"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/04da0849-bcd6-11f1-0a80-24d80000000d",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2026-09-30 16:56:48.686",
  "moment": "2026-09-30 16:56:00.000",
  "level": 1,
  "barcodes": [
    {
      "ean8": "00000000"
    }
  ],
  "positions": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/c7ddac29-bcd6-11f1-0a83-00680000000c/positions",
      "type": "aggregatepackposition",
      "mediaType": "application/json",
      "size": 0,
      "limit": 1000,
      "offset": 0
    }
  },
  "childrenList": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/247d9890-bcd6-11f1-0a83-006800000000",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/metadata",
        "type": "aggregatepack",
        "mediaType": "application/json"
      }
    }
  ]
}
```


### Handling unit items

Handling unit Items is a list of products/batches/variants/bundles. The Handling unit item object contains the following fields:

| Title      | Type          | Description                                                                                                 |
|------------|---------------|-------------------------------------------------------------------------------------------------------------|
| accountId  | UUID          | Account ID<br>`+Required when replying` `+Read Only`                                                        |
| assortment | Meta          | Metadata of the Product/Batch/Variant/Bundle represented by the item<br>`+Required when replying` `+Expand` |
| id         | UUID          | Item ID<br>`+Required when replying` `+Read Only`                                                           |
| meta       | Meta          | Item metadata<br>`+Required when replying`                                                                  |
| quantity   | Float         | Quantity of the Product/Batch/Variant/Bundle in the handling unit<br>`+Required when replying`              |
| things     | Array(String) | Serial Numbers                                                                                              |

### Get a list of Handling units

Query all Handling units on this account. Result: JSON object including fields:

| Title   | Type          | Description                                           |
|---------|---------------|-------------------------------------------------------|
| meta    | Meta          | Issuance metadata.                                    |
| context | Meta          | Metadata of the person who made the request.          |
| rows    | Array(Object) | An array of JSON objects representing Handling units. |

#### Parameters

| Parameter  | Description                                                                                                                     |
|------------|:--------------------------------------------------------------------------------------------------------------------------------|
| **limit**  | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve.`Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities.                                         |

> Get the list of Handling units

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/aggregatepack" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the list of user Handling units.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack",
    "type": "aggregatepack",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/a2da962a-bc05-11f1-0a82-14dc0000659f",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/metadata",
        "type": "aggregatepack",
        "mediaType": "application/json"
      },
      "id": "a2da962a-bc05-11f1-0a82-14dc0000659f",
      "accountId": "41af84c3-b8d8-11f1-0a83-128600000017",
      "owner": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/employee/41de4dd4-b8d8-11f1-0a81-12b50000034f",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#employee/edit?id=41de4dd4-b8d8-11f1-0a81-12b50000034f"
        }
      },
      "shared": true,
      "group": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/group/41afe3e0-b8d8-11f1-0a83-128600000018",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type": "group",
          "mediaType": "application/json"
        }
      },
      "updated": "2026-09-29 15:59:41.561",
      "moment": "2026-09-29 15:59:00.000",
      "level": 1,
      "barcodes": [
        {
          "ean8": "00000000"
        },
        {
          "ean13": "2000000000015"
        },
        {
          "code128": "code128 barcode"
        }
      ],
      "positions": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/a2da962a-bc05-11f1-0a82-14dc0000659f/positions",
          "type": "aggregatepackposition",
          "mediaType": "application/json",
          "size": 1,
          "limit": 1000,
          "offset": 0
        }
      }
    }
  ]
}
```

### Create Handling unit

Request to create a new Handling unit. To successfully create a handling unit, the **barcodes** field must be specified.

> Example of creating a new Handling unit with a request body containing only the required fields.

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '{
              "barcodes": [
                  {
                      "ean8": "00000000"
                  },
                  {
                      "ean13": "2000000000015"
                  },
                  {
                      "code128": "code128 barcode"
                  }
              ]
          }'  
```

> Response 200
Successful request. The result is a JSON representation of the created Handling unit.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/91850817-bc06-11f1-0a82-14dc000065ab",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/metadata",
    "type": "aggregatepack",
    "mediaType": "application/json"
  },
  "id": "91850817-bc06-11f1-0a82-14dc000065ab",
  "accountId": "41af84c3-b8d8-11f1-0a83-128600000017",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/41de4dd4-b8d8-11f1-0a81-12b50000034f",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=41de4dd4-b8d8-11f1-0a81-12b50000034f"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/41afe3e0-b8d8-11f1-0a83-128600000018",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2026-09-29 16:06:22.229",
  "moment": "2026-09-29 16:06:00.000",
  "level": 1,
  "barcodes": [
    {
      "ean8": "00000000"
    },
    {
      "ean13": "2000000000015"
    },
    {
      "code128": "code128 barcode"
    }
  ],
  "positions": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/91850817-bc06-11f1-0a82-14dc000065ab/positions",
      "type": "aggregatepackposition",
      "mediaType": "application/json",
      "size": 0,
      "limit": 1000,
      "offset": 0
    }
  }
}
```

> Example of creating a new Handling Unit with a more detailed request body.

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '{
            "barcodes": [
                {
                    "ean8": "00000000"
                },
                {
                    "ean13": "2000000000015"
                },
                {
                    "code128": "code128 barcode"
                }
            ],
            "group": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/group/41afe3e0-b8d8-11f1-0a83-128600000018",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
                    "type": "group",
                    "mediaType": "application/json"
                }
            },
            "moment": "2026-09-29 16:06:00.000",
            "owner": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/employee/41de4dd4-b8d8-11f1-0a81-12b50000034f",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                    "type": "employee",
                    "mediaType": "application/json"
                }
            },
            "shared": true,
            "positions": [
                {
                    "assortment": {
                        "meta": {
                            "href": "https://api.kladana.com/api/remap/1.2/entity/product/001e6a8f-b8dc-11f1-0a82-14dc00003d64",
                            "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                            "type": "product",
                            "mediaType": "application/json"
                        }
                    },
                    "quantity": 1.0
                }
            ]
        }'  
```

> Response 200
Successful request. The result is a JSON representation of the created Handling unit.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/91850817-bc06-11f1-0a82-14dc000065ab",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/metadata",
    "type": "aggregatepack",
    "mediaType": "application/json"
  },
  "id": "91850817-bc06-11f1-0a82-14dc000065ab",
  "accountId": "41af84c3-b8d8-11f1-0a83-128600000017",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/41de4dd4-b8d8-11f1-0a81-12b50000034f",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=41de4dd4-b8d8-11f1-0a81-12b50000034f"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/41afe3e0-b8d8-11f1-0a83-128600000018",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2026-09-29 16:06:22.229",
  "moment": "2026-09-29 16:06:00.000",
  "level": 1,
  "barcodes": [
    {
      "ean8": "00000000"
    },
    {
      "ean13": "2000000000015"
    },
    {
      "code128": "code128 barcode"
    }
  ],
  "positions": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/91850817-bc06-11f1-0a82-14dc000065ab/positions",
      "type": "aggregatepackposition",
      "mediaType": "application/json",
      "size": 1,
      "limit": 1000,
      "offset": 0
    }
  }
}
```

### Bulk creating and update of Handling units

[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Handling units. In the request body, pass an array containing the JSON representation of the Handling units you want to create or update. Updated Handling units must contain the identifier in the form of metadata.

> Example of creating and updating multiple Handling units

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/aggregatepack" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '[
            {
                "barcodes": [
                    {
                        "ean8": "20000011"
                    }
                ],
                "moment": "2026-09-29 16:00:00.000",
                "group": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/group/41afe3e0-b8d8-11f1-0a83-128600000018",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
                        "type": "group",
                        "mediaType": "application/json"
                    }
                },
                "owner": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/41de4dd4-b8d8-11f1-0a81-12b50000034f",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                        "type": "employee",
                        "mediaType": "application/json"
                    }
                }
            },
            {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/91850817-bc06-11f1-0a82-14dc000065ab",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/metadata",
                    "type": "aggregatepack",
                    "mediaType": "application/json"
                },
                "barcodes": [
                    {
                        "ean8": "00000000"
                    }
                ],
                "moment": "2026-09-29 16:06:00.000"
            }
        ]'  
```

> Response 200 (application/json)
Successful request. The result is an array of JSON representations of the created and updated Handling units.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/f5598694-bc07-11f1-0a82-14dc000065b2",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/metadata",
      "type": "aggregatepack",
      "mediaType": "application/json"
    },
    "id": "f5598694-bc07-11f1-0a82-14dc000065b2",
    "accountId": "41af84c3-b8d8-11f1-0a83-128600000017",
    "owner": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/41de4dd4-b8d8-11f1-0a81-12b50000034f",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=41de4dd4-b8d8-11f1-0a81-12b50000034f"
      }
    },
    "shared": true,
    "group": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/group/41afe3e0-b8d8-11f1-0a83-128600000018",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
        "type": "group",
        "mediaType": "application/json"
      }
    },
    "updated": "2026-09-29 16:16:19.144",
    "moment": "2026-09-29 16:00:00.000",
    "level": 1,
    "barcodes": [
      {
        "ean8": "20000011"
      }
    ],
    "positions": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/f5598694-bc07-11f1-0a82-14dc000065b2/positions",
        "type": "aggregatepackposition",
        "mediaType": "application/json",
        "size": 0,
        "limit": 1000,
        "offset": 0
      }
    }
  },
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/91850817-bc06-11f1-0a82-14dc000065ab",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/metadata",
      "type": "aggregatepack",
      "mediaType": "application/json"
    },
    "id": "91850817-bc06-11f1-0a82-14dc000065ab",
    "accountId": "41af84c3-b8d8-11f1-0a83-128600000017",
    "owner": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/employee/41de4dd4-b8d8-11f1-0a81-12b50000034f",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#employee/edit?id=41de4dd4-b8d8-11f1-0a81-12b50000034f"
      }
    },
    "shared": true,
    "group": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/group/41afe3e0-b8d8-11f1-0a83-128600000018",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
        "type": "group",
        "mediaType": "application/json"
      }
    },
    "updated": "2026-09-29 16:06:22.229",
    "moment": "2026-09-29 16:06:00.000",
    "level": 1,
    "barcodes": [
      {
        "ean8": "00000000"
      }
    ],
    "positions": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/91850817-bc06-11f1-0a82-14dc000065ab/positions",
        "type": "aggregatepackposition",
        "mediaType": "application/json",
        "size": 0,
        "limit": 1000,
        "offset": 0
      }
    }
  }
]
```

### Delete Handling unit

**Parameters**

| Parameter | Description                                                                           |
|:----------|:--------------------------------------------------------------------------------------|
| **id**    | `string` (required) *Example: 9497f3a3-bc09-11f1-0a82-14dc000065bb* Handling unit id. |

> Delete a Handling unit

```shell
curl --compressed -X DELETE \
  "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request.

### Bulk deletion of Handling units

In the body of the request, you need to pass an array containing the JSON metadata of the Handling units you want to remove.

> Request to delete multiple Handling units.

```shell
curl --compressed -X POST \
  "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/delete" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip" \
  -H "Content-Type: application/json" \
  -d '[
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/91850817-bc06-11f1-0a82-14dc000065ab",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/metadata",
                "type": "aggregatepack",
                "mediaType": "application/json"
            }
        },
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/f5598694-bc07-11f1-0a82-14dc000065b2",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/metadata",
                "type": "aggregatepack",
                "mediaType": "application/json"
            }
        }
    ]'
```        

> Successful request. The result is JSON information about the deleted Handling units.

```json
[
  {
    "info": "Entity 'aggregatepack' with UUID: 91850817-bc06-11f1-0a82-14dc000065ab successfully deleted"
  },
  {
    "info": "Entity 'aggregatepack' with UUID: f5598694-bc07-11f1-0a82-14dc000065b2 successfully deleted"
  }
]
```

### Get Handling unit

**Parameters**

| Parameter | Description                                                                           |
|:----------|:--------------------------------------------------------------------------------------|
| **id**    | `string` (required) *Example: 9497f3a3-bc09-11f1-0a82-14dc000065bb* Handling unit id. |

> Request to get a Handling unit.

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the Handling unit.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/metadata",
    "type": "aggregatepack",
    "mediaType": "application/json"
  },
  "id": "9497f3a3-bc09-11f1-0a82-14dc000065bb",
  "accountId": "41af84c3-b8d8-11f1-0a83-128600000017",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/41de4dd4-b8d8-11f1-0a81-12b50000034f",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=41de4dd4-b8d8-11f1-0a81-12b50000034f"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/41afe3e0-b8d8-11f1-0a83-128600000018",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2026-09-29 16:27:55.852",
  "moment": "2026-09-29 16:00:00.000",
  "level": 1,
  "barcodes": [
    {
      "ean8": "00000000"
    }
  ],
  "positions": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions",
      "type": "aggregatepackposition",
      "mediaType": "application/json",
      "size": 0,
      "limit": 1000,
      "offset": 0
    }
  }
}
```

### Change Handling unit

**Parameters**

| Parameter | Description                                                                           |
|:----------|:--------------------------------------------------------------------------------------|
| **id**    | `string` (required) *Example: 9497f3a3-bc09-11f1-0a82-14dc000065bb* Handling unit id. |

Handling units update request. You can only update fields that are not marked `Read Only`.

> Example request to update a Handling unit

 ```shell
   curl --compressed -X PUT \
     "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb" \
     -H "Authorization: Basic <Credentials>" \
     -H "Accept-Encoding: gzip" \
     -H "Content-Type: application/json" \
     -d '{
          "barcodes": [
              {
                  "ean8": "00000000"
              }
          ],
          "shared": true,
          "moment": "2026-09-29 16:00:00.000",
          "group": {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/group/41afe3e0-b8d8-11f1-0a83-128600000018",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
                  "type": "group",
                  "mediaType": "application/json"
              }
          },
          "owner": {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/employee/41de4dd4-b8d8-11f1-0a81-12b50000034f",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
                  "type": "employee",
                  "mediaType": "application/json"
              }
          }
      }'  
 ```
> Response 200 (application/json)
Successful request. The result is a JSON representation of the Handling unit.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/metadata",
    "type": "aggregatepack",
    "mediaType": "application/json"
  },
  "id": "9497f3a3-bc09-11f1-0a82-14dc000065bb",
  "accountId": "41af84c3-b8d8-11f1-0a83-128600000017",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/41de4dd4-b8d8-11f1-0a81-12b50000034f",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=41de4dd4-b8d8-11f1-0a81-12b50000034f"
    }
  },
  "shared": true,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/41afe3e0-b8d8-11f1-0a83-128600000018",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2026-09-29 16:27:55.852",
  "moment": "2026-09-29 16:00:00.000",
  "level": 1,
  "barcodes": [
    {
      "ean8": "00000000"
    }
  ],
  "positions": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions",
      "type": "aggregatepackposition",
      "mediaType": "application/json",
      "size": 0,
      "limit": 1000,
      "offset": 0
    }
  }
}
```

### Handling unit Items

A separate resource for managing Handling unit positions.

### Get Handling unit Items

Request to get a list of all items of this Handling unit.

| Title   | Type          | Description                                                    |
|---------|---------------|----------------------------------------------------------------|
| meta    | Meta          | Issuance metadata.                                             |
| context | Meta          | Metadata of the person who made the request.                   |
| rows    | Array(Object) | An array of JSON objects representing the Handling unit items. |

**Parameters**

| Parameter  | Description                                                                                                                     |
|------------|:--------------------------------------------------------------------------------------------------------------------------------|
| **id**     | `string` (required) *Example: 9497f3a3-bc09-11f1-0a82-14dc000065bb* Handling unit id.                                           |
| **limit**  | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve.`Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities.                                         |

> Request to get the list of all items of the Handling unit.

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the list of items of the Handling unit.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions",
    "type": "aggregatepackposition",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions/d48cab60-bc0b-11f1-0a82-14dc000065c0",
        "type": "aggregatepackposition",
        "mediaType": "application/json"
      },
      "id": "d48cab60-bc0b-11f1-0a82-14dc000065c0",
      "accountId": "41af84c3-b8d8-11f1-0a83-128600000017",
      "assortment": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/001e6a8f-b8dc-11f1-0a82-14dc00003d64",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#good/edit?id=001e6367-b8dc-11f1-0a82-14dc00003d62"
        }
      },
      "quantity": 1.0
    }
  ]
}
```
### Handling unit Item

### Get item

**Parameters**

| Parameter      | Description                                                                                |
|:---------------|:-------------------------------------------------------------------------------------------|
| **id**         | `string` (required) *Example: 9497f3a3-bc09-11f1-0a82-14dc000065bb* Handling unit id.      |
| **positionID** | `string` (required) *Example: d48cab60-bc0b-11f1-0a82-14dc000065c0* Handling unit item id. |

> Request to get a specific item of the Handling unit by the specified id.

```shell
curl --compressed -X GET \
  "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions/d48cab60-bc0b-11f1-0a82-14dc000065c0" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the Handling unit item.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions/d48cab60-bc0b-11f1-0a82-14dc000065c0",
    "type": "aggregatepackposition",
    "mediaType": "application/json"
  },
  "id": "d48cab60-bc0b-11f1-0a82-14dc000065c0",
  "accountId": "41af84c3-b8d8-11f1-0a83-128600000017",
  "assortment": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/product/001e6a8f-b8dc-11f1-0a82-14dc00003d64",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
      "type": "product",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#good/edit?id=001e6367-b8dc-11f1-0a82-14dc00003d62"
    }
  },
  "quantity": 1.0
}
```

### Create Handling unit Item

Request to create a new item in the Handling unit. For successful creation, the following fields must be specified in the request body:

+ **assortment** - Link to the product/batches/product variant/set that the item represents.
  Learn more about the field in the description of [Handling unit items](../dictionaries/#entities-handling-unit-handling-unit-items).
+ **quantity** - Quantity of the specified item. It must be positive, otherwise an error occurs. You can create one or more Handling unit items at the same time. All items created by the request will be added to the existing ones.

**Parameters**

| Parameter | Description                                                                           |
|:----------|:--------------------------------------------------------------------------------------|
| **id**    | `string` (required) *Example: 9497f3a3-bc09-11f1-0a82-14dc000065bb* Handling unit id. |

> Example of creating a single item in a Handling unit.

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '{
            "assortment": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/product/001e6a8f-b8dc-11f1-0a82-14dc00003d64",
                    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                    "type": "product",
                    "mediaType": "application/json"
                }
            },
            "quantity": 1.0
        }'  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the created Handling unit item.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions/e3a7eea7-bc0c-11f1-0a82-14dc000065c3",
      "type": "aggregatepackposition",
      "mediaType": "application/json"
    },
    "id": "e3a7eea7-bc0c-11f1-0a82-14dc000065c3",
    "accountId": "41af84c3-b8d8-11f1-0a83-128600000017",
    "assortment": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/001e6a8f-b8dc-11f1-0a82-14dc00003d64",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#good/edit?id=001e6367-b8dc-11f1-0a82-14dc00003d62"
      }
    },
    "quantity": 1.0
  }
]
```

> Example of creating multiple items in a Handling unit.

```shell
  curl --compressed -X POST \
    "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '[
            {
                "assortment": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/product/001e6a8f-b8dc-11f1-0a82-14dc00003d64",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
                        "type": "product",
                        "mediaType": "application/json"
                    }
                },
                "quantity": 1.0
            },
            {
                "assortment": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/variant/62d0f26e-bc0d-11f1-0a81-12b500001dc6",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                        "type": "variant",
                        "mediaType": "application/json"
                    }
                },
                "quantity": 2.0
            },
            {
                "assortment": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/variant/62d3eaee-bc0d-11f1-0a81-12b500001dd0",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                        "type": "variant",
                        "mediaType": "application/json"
                    }
                },
                "quantity": 3.0
            }
        ]'  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the list of created Handling unit items.

```json
[
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions/8f3947c7-bc0d-11f1-0a82-14dc000065c6",
      "type": "aggregatepackposition",
      "mediaType": "application/json"
    },
    "id": "8f3947c7-bc0d-11f1-0a82-14dc000065c6",
    "accountId": "41af84c3-b8d8-11f1-0a83-128600000017",
    "assortment": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/product/001e6a8f-b8dc-11f1-0a82-14dc00003d64",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
        "type": "product",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#good/edit?id=001e6367-b8dc-11f1-0a82-14dc00003d62"
      }
    },
    "quantity": 1.0
  },
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions/8f394e25-bc0d-11f1-0a82-14dc000065c7",
      "type": "aggregatepackposition",
      "mediaType": "application/json"
    },
    "id": "8f394e25-bc0d-11f1-0a82-14dc000065c7",
    "accountId": "41af84c3-b8d8-11f1-0a83-128600000017",
    "assortment": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/variant/62d0f26e-bc0d-11f1-0a81-12b500001dc6",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
        "type": "variant",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#feature/edit?id=62d0ea00-bc0d-11f1-0a81-12b500001dc4"
      }
    },
    "quantity": 2.0
  },
  {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions/8f39521b-bc0d-11f1-0a82-14dc000065c8",
      "type": "aggregatepackposition",
      "mediaType": "application/json"
    },
    "id": "8f39521b-bc0d-11f1-0a82-14dc000065c8",
    "accountId": "41af84c3-b8d8-11f1-0a83-128600000017",
    "assortment": {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/entity/variant/62d3eaee-bc0d-11f1-0a81-12b500001dd0",
        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
        "type": "variant",
        "mediaType": "application/json",
        "uuidHref": "https://app.kladana.com/app/#feature/edit?id=62d3e3da-bc0d-11f1-0a81-12b500001dce"
      }
    },
    "quantity": 3.0
  }
]
```

### Change item

Request to update a Handling unit line item. There is no way to update the item required fields in the body of the request. Only the ones you want to update.

**Parameters**

| Parameter      | Description                                                                                |
|:---------------|:-------------------------------------------------------------------------------------------|
| **id**         | `string` (required) *Example: 9497f3a3-bc09-11f1-0a82-14dc000065bb* Handling unit id.      |
| **positionID** | `string` (required) *Example: e3a7eea7-bc0c-11f1-0a82-14dc000065c3* Handling unit item id. |

> Example request to update a specific item in a Handling unit.

```shell
  curl --compressed -X PUT \
    "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions/e3a7eea7-bc0c-11f1-0a82-14dc000065c3" \
    -H "Authorization: Basic <Credentials>" \
    -H "Accept-Encoding: gzip" \
    -H "Content-Type: application/json" \
      -d '{
            "quantity": 2,
            "assortment": {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/variant/62d3eaee-bc0d-11f1-0a81-12b500001dd0",
                  "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
                  "type": "variant",
                  "mediaType": "application/json"
              }
            }
          }'  
```

> Response 200 (application/json)
Successful request. The result is a JSON representation of the updated Handling unit item.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions/e3a7eea7-bc0c-11f1-0a82-14dc000065c3",
    "type": "aggregatepackposition",
    "mediaType": "application/json"
  },
  "id": "e3a7eea7-bc0c-11f1-0a82-14dc000065c3",
  "accountId": "41af84c3-b8d8-11f1-0a83-128600000017",
  "assortment": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/variant/62d3eaee-bc0d-11f1-0a81-12b500001dd0",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/variant/metadata",
      "type": "variant",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#feature/edit?id=62d3e3da-bc0d-11f1-0a81-12b500001dce"
    }
  },
  "quantity": 2.0
}
```

### Delete item

**Parameters**

| Parameter      | Description                                                                                |
|:---------------|:-------------------------------------------------------------------------------------------|
| **id**         | `string` (required) *Example: 9497f3a3-bc09-11f1-0a82-14dc000065bb* Handling unit id.      |
| **positionID** | `string` (required) *Example: e3a7eea7-bc0c-11f1-0a82-14dc000065c3* Handling unit item id. |

> Request to delete a Handling unit item with the specified id.

```shell
curl --compressed -X DELETE \
  "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions/e3a7eea7-bc0c-11f1-0a82-14dc000065c3" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip"
```

> Response 200 (application/json) The Handling unit item was deleted successfully.
```json
<Response body is empty>
```

### Bulk deletion of items

**Parameters**

| Parameter | Description                                                                           |
|:----------|:--------------------------------------------------------------------------------------|
| **id**    | `string` (required) *Example: 9497f3a3-bc09-11f1-0a82-14dc000065bb* Handling unit id. |

> Request to delete multiple Handling unit items.

```shell
curl --compressed -X POST \
  "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions/delete" \
  -H "Authorization: Basic <Credentials>" \
  -H "Accept-Encoding: gzip" \
  -H "Content-Type: application/json" \
  -d '[
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions/e3a7eea7-bc0c-11f1-0a82-14dc000065c3",
            "type": "aggregatepackposition",
            "mediaType": "application/json"
          }
        },
        {
          "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/aggregatepack/9497f3a3-bc09-11f1-0a82-14dc000065bb/positions/8f394e25-bc0d-11f1-0a82-14dc000065c7",
            "type": "aggregatepackposition",
            "mediaType": "application/json"
          }
        }
      ]'  
```

> Response 200 (application/json) The Handling unit items were deleted successfully.
```json
<Response body is empty>
```
