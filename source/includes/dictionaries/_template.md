## Print templates
Using the JSON API, you can request lists of printable templates for entities. Hidden printables will not be included in the query result. The entity code for basic templates in the JSON API is the **embeddedtemplate** keyword, and for custom templates, **customtemplate**.

#### Basic print templates
#### Entity attributes

| Title | Type | Description |
| ------- | ---------- |------ |
| **content** | URL | Download link<br>`+Required when replying` |
| **id** | UUID | Template ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Basic Template<br>`+Required when replying` |
| **name** | String(255) | Template name<br>`+Required when replying` |
| **type** | String(255) | Template type (entity - document)<br>`+Required for response` |

### List of basic print templates

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **type** | `string` (required) *Example: demand* the type of the entity for which the basic templates are requested. |
 
> Request for information about basic printable templates for the specified entity type.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/demand/metadata/embeddedtemplate/"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of basic templates for the given entity type.

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
     "href": "https://api.kladana.in/api/remap/1.2/entity/demand/metadata/embeddedtemplate",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/demand/metadata",
     "type": "embeddedtemplate",
     "mediaType": "application/json",
     "size": 6,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/demand/metadata/embeddedtemplate/c2645cf0-43f0-3379-adff-99929da86d5e",
         "type": "embeddedtemplate",
         "mediaType": "application/json"
       },
       "id": "c2645cf0-43f0-3379-adff-99929da86d5e",
       "name": "Consignment note",
       "type": "entity",
       "content": "https://api.kladana.in/api/remap/1.2/download-template/ttn.xls"
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/demand/metadata/embeddedtemplate/c5d5e3f2-6541-3ae3-9b7c-5da3665ab33e",
         "type": "embeddedtemplate",
         "mediaType": "application/json"
       },
       "id": "c5d5e3f2-6541-3ae3-9b7c-5da3665ab33e",
       "name": "Invoice",
       "type": "entity",
       "content": "https://api.kladana.in/api/remap/1.2/download-template/rashod.xls"
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/demand/metadata/embeddedtemplate/8a5bdbc2-ddb6-34f1-b359-05219426b979",
         "type": "embeddedtemplate",
         "mediaType": "application/json"
       },
       "id": "8a5bdbc2-ddb6-34f1-b359-05219426b979",
       "name": "TORG-12",
       "type": "entity",
       "content": "https://api.kladana.in/api/remap/1.2/download-template/tov_nakl.xls"
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/demand/metadata/embeddedtemplate/18386557-0c3d-30bc-9b76-fe30c9893f84",
         "type": "embeddedtemplate",
         "mediaType": "application/json"
       },
       "id": "18386557-0c3d-30bc-9b76-fe30c9893f84",
       "name": "sales receipt",
       "type": "entity",
       "content": "https://api.kladana.in/api/remap/1.2/download-template/demand_check.xls"
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/demand/metadata/embeddedtemplate/1aaef672-69a5-3e35-a849-71c2cd338ac0",
         "type": "embeddedtemplate",
         "mediaType": "application/json"
       },
       "id": "1aaef672-69a5-3e35-a849-71c2cd338ac0",
       "name": "Act",
       "type": "entity",
       "content": "https://api.kladana.in/api/remap/1.2/download-template/act.xls"
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/demand/metadata/embeddedtemplate/4fdd996f-d2fd-4500-baf2-fea33b6db077",
         "type": "embeddedtemplate",
         "mediaType": "application/json"
       },
       "id": "4fdd996f-d2fd-4500-baf2-fea33b6db077",
       "name": "Universal Transfer Document (old)",
       "type": "entity",
       "content": "https://api.kladana.in/api/remap/1.2/download-template/upd.xls"
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/demand/metadata/embeddedtemplate/4fdd996f-d2fd-4500-baf2-fea33b6db078",
         "type": "embeddedtemplate",
         "mediaType": "application/json"
       },
       "id": "4fdd996f-d2fd-4500-baf2-fea33b6db078",
       "name": "Universal transfer document",
       "type": "entity",
       "content": "https://api.kladana.in/api/remap/1.2/download-template/upd_new.xls"
     }
   ]
}
```

### Separate basic print template

#### Separate basic print template

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id of a single template. |
| **type** | `string` (required) *Example: demand* the type of the entity for which the basic templates are requested. |
 
> Request to get information about a separate basic printable template for the specified entity type by its id.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/demand/metadata/embeddedtemplate/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the default template for the given entity type.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/demand/metadata/embeddedtemplate/c2645cf0-43f0-3379-adff-99929da86d5e",
     "type": "embeddedtemplate",
     "mediaType": "application/json"
   },
   "id": "c2645cf0-43f0-3379-adff-99929da86d5e",
   "name": "Consignment note",
   "type": "entity",
   "content": "https://api.kladana.in/api/remap/1.2/download-template/ttn.xls"
}
```

#### Basic print templates for price tags and labels
#### Entity attributes

| Title | Type | Description |
| ------- | ---------- |-------- |
| **content** | URL | Download link<br>`+Required when replying` |
| **id** | UUID | Template ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Basic Template<br>`+Required when replying` |
| **name** | String(255) | Template name<br>`+Required when replying` |
| **type** | String(255) | Template type (mxtemplate - new template type for price tags and labels)<br>`+Required when replying` |

### List of basic price tags and labels
> Request for information on basic printable templates for products, modifications, services and kits.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/assortment/metadata/embeddedtemplate/"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of basic templates for products, modifications, services and kits.

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
     "href": "https://api.kladana.in/api/remap/1.2/entity/assortment/metadata/embeddedtemplate",
     "type": "embeddedtemplate",
     "mediaType": "application/json",
     "size": 2,
     "limit": 100,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/assortment/metadata/embeddedtemplate/a8218d14-6017-3ba4-85c4-254fff93bbc8",
         "type": "embeddedtemplate",
         "mediaType": "application/json"
       },
       "id": "a8218d14-6017-3ba4-85c4-254fff93bbc8",
       "name": "Thermal label (58x40mm)",
       "type": "mxtemplate",
       "content": "https://api.kladana.in/api/remap/1.2/download-template/termo_58x40.xml"
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/assortment/metadata/embeddedtemplate/2746190f-cf7c-3a0b-922d-e75f44e88cce",
         "type": "embeddedtemplate",
         "mediaType": "application/json"
       },
       "id": "2746190f-cf7c-3a0b-922d-e75f44e88cce",
       "name": "Price tag (70x49.5mm)",
       "type": "mxtemplate",
       "content": "https://api.kladana.in/api/remap/1.2/download-template/price_tag_70x49.5.xml"
     }
   ]
}
```

### Separate basic template for price tags and labels

#### Separate basic price tag or label

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id of a single template. |
 
> Request for information about a separate basic printable template for goods, modifications, services and kits by its id.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/assortment/metadata/embeddedtemplate/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a basic template for products, modifications, services and kits.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/assortment/metadata/embeddedtemplate/a8218d14-6017-3ba4-85c4-254fff93bbc8",
     "type": "embeddedtemplate",
     "mediaType": "application/json"
   },
   "id": "a8218d14-6017-3ba4-85c4-254fff93bbc8",
   "name": "Thermal label (58x40mm)",
   "type": "mxtemplate",
   "content": "https://api.kladana.in/api/remap/1.2/download-template/termo_58x40.xml"
}
```

#### Custom print templates
#### Entity attributes

| Title | Type | Description |
| ------- | ---------- |------- |
| **content** | URL | Download link<br>`+Required when replying` |
| **id** | UUID | Template ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Custom template metadata<br>`+Required when replying` |
| **name** | String(255) | Template name<br>`+Required when replying` |
| **type** | String(255) | Template type (entity - document)<br>`+Required for response` |

### List of custom print templates
 
**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **type** | `string` (required) *Example: customerorder* the type of the entity for which custom templates are requested. |

> Request for information about custom printable templates for the specified entity type.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/customerorder/metadata/customtemplate/"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of basic templates for the given entity type.

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
     "href": "https://api.kladana.in/api/remap/1.2/entity/customerorder/metadata/customtemplate/",
     "metadataHref": "https://api.kladana.in/api/remap/1.2/entity/customerorder/metadata",
     "type": "customtemplate",
     "mediaType": "application/json",
     "size": 1,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/customerorder/metadata/customtemplate/38d1c843-1601-11e7-8af5-581e00000009",
         "type": "customtemplate",
         "mediaType": "application/json"
       },
       "id": "38d1c843-1601-11e7-8af5-581e00000009",
       "name": "tratata",
       "type": "entity",
       "content": "https://api.kladana.in/api/remap/1.2/download/38d1c843-1601-11e7-8af5-581e00000009"
     }
   ]
}
```

### Separate custom print template

#### Separate custom print template

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id of a single template. |
| **type** | `string` (required) *Example: customerorder* the type of the entity for which the basic template is requested. |
 
> Request to get information about a separate custom printable template for the specified entity type by its id.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/customerorder/metadata/customtemplate/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the custom template for the given entity type.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/customerorder/metadata/customtemplate/38d1c843-1601-11e7-8af5-581e00000009",
     "type": "customtemplate",
     "mediaType": "application/json"
   },
   "id": "38d1c843-1601-11e7-8af5-581e00000009",
   "name": "enough_nonstandard_pattern",
   "type": "entity",
   "content": "https://api.kladana.in/api/remap/1.2/download/38d1c843-1601-11e7-8af5-581e00000009"
}
```

#### User templates for price tags and labels
#### Entity attributes

| Title | Type | Description |
| ------- | ---------- |------ |
| **content** | URL | Download link<br>`+Required when replying` |
| **id** | UUID | Template ID<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Custom template metadata<br>`+Required when replying` |
| **name** | String(255) | Template name<br>`+Required when replying` |
| **type** | String(255) | Template type (mxtemplate - new template type for price tags and labels)<br>`+Required when replying` |

### List of custom price tags and labels
> Request for information about custom printable templates for products, modifications, services and kits.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/assortment/metadata/customtemplate/"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of custom templates for products, modifications, services and kits.

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
     "href": "https://api.kladana.in/api/remap/1.2/entity/assortment/metadata/embeddedtemplate",
     "type": "embeddedtemplate",
     "mediaType": "application/json",
     "size": 2,
     "limit": 100,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/assortment/metadata/embeddedtemplate/a8218d14-6017-3ba4-85c4-254fff93bbc8",
         "type": "embeddedtemplate",
         "mediaType": "application/json"
       },
       "id": "a8218d14-6017-3ba4-85c4-254fff93bbc8",
       "name": "Thermal label (58x40mm)",
       "type": "mxtemplate",
       "content": "https://api.kladana.in/api/remap/1.2/download-template/termo_58x40.xml"
     },
     {
       "meta": {
         "href": "https://api.kladana.in/api/remap/1.2/entity/assortment/metadata/embeddedtemplate/2746190f-cf7c-3a0b-922d-e75f44e88cce",
         "type": "embeddedtemplate",
         "mediaType": "application/json"
       },
       "id": "2746190f-cf7c-3a0b-922d-e75f44e88cce",
       "name": "Price tag (70x49.5mm)",
       "type": "mxtemplate",
       "content": "https://api.kladana.in/api/remap/1.2/download-template/price_tag_70x49.5.xml"
     }
   ]
}
```

### Separate user template for price tags and labels

#### Separate custom price tag or label

**Parameters**

| Parameter | Description |
| ------- | ---------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* id of a single template. |

> Request for information about a separate custom printable template for goods, modifications, services and kits by its id.

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/assortment/metadata/customtemplate/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a custom template for products, modifications, services and kits.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/assortment/metadata/customtemplate/a4d36b88-d329-4b73-966a-b66b6a1b1b9a",
     "type": "customtemplate",
     "mediaType": "application/json"
   },
   "id": "a4d36b88-d329-4b73-966a-b66b6a1b1b9a",
   "name": "NewCustomTemplate",
   "type": "mxtemplate",
   "content": "https://api.kladana.in/api/remap/1.2/download/a4d36b88-d329-4b73-966a-b66b6a1b1b9a"
}
```
