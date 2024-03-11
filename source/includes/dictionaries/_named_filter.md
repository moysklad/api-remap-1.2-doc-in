## Saved filter
### Saved filters

Using the JSON API, you can get saved filters by ID and as a list.
A saved filter is a set of parameters and their values configured by users,
to filter the list of entities and documents.
An entity is represented as an identifier and a name. Filter options are not returned.

Saved filters can be reapplied to filter the list of entities.

The saved filters are specific to the entity type.
For example, you can get a list of filters for the register of Receiving transactions, Incoming payment transactions, the list of counterparties. Cannot get a general list of saved filters for everyone user entities.
Each entity type will have its own set of filtering options.

#### Entity attributes

| Title | Type                                               | Description|
| ---------|----------------------------------------------------| ----------|
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Read Only` |
| **id** | UUID                                               | Filter ID<br>`+Required for response` `+Read only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Filter metadata<br>`+Required when replying` |
| **name** | String                                             | Filter name<br>`+Required when replying` `+Required when creating` |
| **owner** | [Meta](../#kladana-json-api-general-info-metadata) | Owner (Employee)<br>`+Required when replying` `+Read-only` `+Expand` |

Request example:
Entities and documents - ```/entity/[entityType]/namedfilter```

### Get a list of filters

> Sample request to get a list of filters for products

```shell
  curl -X GET
    "https://api.kladana.in/api/remap/1.2/entity/product/namedfilter"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"  
```

> Response 200 

```json
 {
  "context": {
    "employee": {
      "meta": {
        "href": "https://api.kladana.in/api/remap/1.2/context/employee",
        "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json"
      }
    }
  },
  "meta": {
    "href": "https://api.kladana.in/api/remap/1.2/entity/product/namedfilter",
    "type": "namedfilter",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.in/api/remap/1.2/entity/product/namedfilter/b5863410-ca86-11eb-ac12-000d00000019",
        "type": "namedfilter",
        "mediaType": "application/json"
      },
      "owner": {
        "meta": {
          "href": "https://api.kladana.in/api/remap/1.2/entity/employee/234eee6f-c513-11eb-ac12-000d0000003b",
          "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.in/app/#employee/edit?id=234eee6f-c513-11eb-ac12-000d0000003b"
        }
      },
      "accountId": "22ef0c54-c513-11eb-ac12-000700000002",
      "id": "b5863410-ca86-11eb-ac12-000d00000019",
      "name": "filterName"
    }
  ]
}
```

### Get another user's list of filters

A user with administrator rights or an application has the ability to query the saved filters of other employees on the account.
To do this, you need to specify the `owner={href of the employee}` parameter in the request parameters.

> Sample request to get another user's filter list

```shell
  curl -X GET
    "https://api.kladana.in/api/remap/1.2/entity/product/namedfilter?owner=https://api.kladana.in/api/remap/1.2/entity/employee/25863410-ca86-11eb-ac12-000d00000234"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"  
```

> Response 200

```json
 {
  "context": {
    "employee": {
      "meta": {
        "href": "https://api.kladana.in/api/remap/1.2/context/employee",
        "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
        "type": "employee",
        "mediaType": "application/json"
      }
    }
  },
  "meta": {
    "href": "https://api.kladana.in/api/remap/1.2/entity/product/namedfilter",
    "type": "namedfilter",
    "mediaType": "application/json",
    "size": 1,
    "limit": 1000,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.in/api/remap/1.2/entity/product/namedfilter/b5863410-ca86-11eb-ac12-000d00000019",
        "type": "namedfilter",
        "mediaType": "application/json"
      },
      "owner": {
        "meta": {
          "href": "https://api.kladana.in/api/remap/1.2/entity/employee/25863410-ca86-11eb-ac12-000d00000234",
          "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
          "type": "employee",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.in/app/#employee/edit?id=25863410-ca86-11eb-ac12-000d00000234"
        }
      },
      "accountId": "22ef0c54-c513-11eb-ac12-000700000002",
      "id": "b5863410-ca86-11eb-ac12-000d00000019",
      "name": "filterName"
    }
  ]
}
```

### Get filter by ID

**Parameters**

| Parameter | Description|
| ---------| ---------|
| **id**   | `string` (required) *Example: 736da682-ad8b-11eb-0a80-17ef000000d4* Filter ID. |


> Example of a request to get a filter for a product by ID

```shell
  curl -X GET
    "https://api.kladana.in/api/remap/1.2/entity/product/namedfilter/b5863410-ca86-11eb-ac12-000d00000019"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"  
```

> Response 200 

```json
  {
  "meta": {
    "href": "https://api.kladana.in/api/remap/1.2/entity/product/namedfilter/b5863410-ca86-11eb-ac12-000d00000019",
    "type": "namedfilter",
    "mediaType": "application/json"
  },
  "owner": {
    "meta": {
      "href": "https://api.kladana.in/api/remap/1.2/entity/employee/234eee6f-c513-11eb-ac12-000d0000003b",
      "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.in/app/#employee/edit?id=234eee6f-c513-11eb-ac12-000d0000003b"
    }
  },
  "accountId": "22ef0c54-c513-11eb-ac12-000700000002",
  "id": "b5863410-ca86-11eb-ac12-000d00000019",
  "name": "filterName"
}
```

### Apply saved filter

Using the JSON API, you can apply saved filters to all [Entities](../dictionaries/), except for the Assortment, and [Tranasctions](../documents/).
The filtering result is a list of entities that match the conditions saved in the filter.

To apply filtering, you need to pass a link to the required saved filter in the special query parameter `namedfilter`.

An example URL with a saved filter applied:
`https://api.kladana.in/api/remap/1.2/entity/product?namedfilter=https://api.kladana.in/api/remap/1.2/entity/product/namedFilter/b5863410-ca86-11eb -ac12-000d00000019`

<br>

Restrictions:

- Filters created by other users can only be applied by an administrator user or application.
- Only one saved filter can be applied per query.
- Saved filter is incompatible with `filter`, `search`, `order` query parameters.
- On the endpoint, you can only apply the saved filter that can be obtained through `/entity/[entityType]/namedfilter`.
