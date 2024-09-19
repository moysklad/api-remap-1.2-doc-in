# Audit
## Audit

The Kladana app collects information about all events in the system. This part of the service is called an audit, and the accumulated information is called audit events.
Changes to a specific entity are available to users if they have view rights.

The main entities in JSON API auditing are contexts and events.
Events contain detailed information about the changes that occurred to a particular entity or operation, for example, a change in the value of a field.
A context is one or more related events, such as a bulk product update.
Events reflect specific changes that have occurred associated with one entity, while the context contains only general information about events related to it.

The user can get detailed information about changes in the system through the JSON API in two ways:

+ **View the overall audit feed**

To view the general audit feed via the JSON API, the user can [request a list of contexts](../audit/#audit-audit-get-contexts), which will contain general information
about the changes that have occurred in the system, as well as a link to related events.
To view detailed information on a particular context, you need to [request events for a specific context](../audit/#audit-audit-get-events-by-context).
The response to the user will contain detailed information about the entity changes that occurred as part of this update in the system, in [special 'diff' format](../audit/#audit-audit-events-39-diff-39-field-format)

+ **View events for a single entity**

In order to get events associated with a particular entity, you need to use the [entity event query](../audit/#audit-audit-get-events-by-context).
The response will contain a list of events related to this entity or operation, where the [special diff field](../audit/#audit-audit-events-39-diff-39-field-format) will reflect detailed changes to the fields of the entity or operation.

### Contexts

In auditing, context refers to one or more related events, such as a bulk product update.
Events reflect specific changes that have occurred, such as changing the value of a field.
The context contains only general information about the events related to it.

##### Entity attributes

| Title | Type | Description |
| ----------------- | ------- |-------------- |
| **entityType** | Enum | Entity name (the field is present only if it is the same for all Events within this Context)<br>`+Required for response` `+Read Only` |
| **eventType** | Enum | Event Action (the field is present only if it is the same for all Events within the given Context)<br>`+Required for response` `+Read Only` |
| **events** | Array(Object) | List of Method Audit Events<br>`+Required for response` `+Read Only` |
| **id** | UUID | Context ID<br>`+Required for response` `+Read Only` |
| **info** | String(255) | Short Description<br>`+Read Only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Context entity metadata<br>`+Required for response` `+Read-only` |
| **moment** | DateTime | Modified date<br>`+Required when replying` `+Read only` |
| **objectCount** | Int | number of objects changed<br>`+Required for response` `+Read only` |
| **objectType** | Enum | The type of entities this change is associated with. This field is only present for `entityType` = `entitysettings` or `statesettings` or `templatesettings`<br>`+Required when replying` |
| **source** | Enum | Type of change<br>`+Required for response` `+Read only` |
| **supportAccess** | Boolean | Whether the access was made by support on behalf of the user. The flag is omitted if the value is false<br>`+Required on response` `+Read-Only` |
| **id** | String(255) | Employee Login<br>`+Required when replying` `+Read Only` |

Possible values for the `source` parameter are listed below:

| The value of the source parameter | Description |
| --------------------------------- |------------ |
| **registration** | Account registration |
| **clearrecyclebin** | Automatic emptying of the basket |
| **combine** | Association |
| **connectors** | Synchronization with MI |
| **copy** | Copy |
| **emailsend** | Sending a message |
| **evotor** | Synchronization with Evotor |
| **export** | Export |
| **exportediclient1c** | Export to 1C Client EDO |
| **import** | Import|
| **import1c** | Import from 1C |
| **importAlfabank** | Import from Alfa-Bank |
| **importModulebank** | Import from Modulbank |
| **importTinkoffbank** | Import from Tinkoff Bank |
| **importTochkabank** | Import from Tochka Bank |
| **importediclient1c** | Import to 1C Client EDO |
| **loginlogout** | Entering or exiting MyWarehouse |
| **phone-1.0** | Phone API |
| **posapi** | POS API |
| **remap-1.0** | JSON API 1.0 |
| **remap-1.1** | JSON API 1.1 |
| **remap-1.2** | JSON API 1.2 |
| **restapi** | REST API |
| **retail** | Point of sale |
| **app** | All actions |

Possible values of the `eventType` and `entityType` parameters are given in the [Filters](../audit/#audit-audit-get-filters) section.

### Get Contexts

Request all changes.
Result: JSON object including fields:

| Title | Type | Description|
| ----------- | ------| ------------ |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing the changes. |

**Parameters**

| Parameter | Description |
| ----------|-------------------- |
| **limit** | `number` (optional) **Default: 25** *Example: 25* Maximum number of entities to retrieve. `Allowed values are 1 - 100`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |
| **filter** | `string` (optional) *Example: source=jsonapi* Detailed description of the parameter in the section [Filtering the selection using the filter parameter](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter) Filtering attributes for Audit Contexts are presented in the [Filters](../audit/#audit-audit-filters) section |

> Get Contexts

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/audit"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Changes.

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
    "href": "https://api.kladana.com/api/remap/1.2/audit/",
    "type": "audit",
    "mediaType": "application/json",
    "size": 1,
    "limit": 25,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/audit/b912e9d1-3fbe-11e7-8a7f-40d000000000",
        "type": "audit",
        "mediaType": "application/json"
      },
      "id": "b912e9d1-3fbe-11e7-8a7f-40d000000000",
      "uid": "admin@1",
      "source": "loginlogout",
      "moment": "2017-05-23 16:50:03",
      "info": "Login to Kladana (127.0.0.1, Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:50.0) Gecko/20100101 Firefox/50.0)"
    }
  ]
}

```

### Get Filtered Contexts

**Parameters**

| Parameter | Description |
| --------- | ----------|
| **filter** | `string` (optional) *Example: filter=entityType=customerorder* filter by entity type |

Example of a query with context filtering by "customerorder" type
https://api.kladana.com/api/remap/1.2/audit?filter=entityType=customerorder

> Get Contexts with filtering

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/audit?filter=entityType=customerorder"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of audit events.

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
    "href": "https://api.kladana.com/api/remap/1.2/audit?filter=entityType=customerorder",
    "type": "audit",
    "mediaType": "application/json",
    "size": 1,
    "limit": 25,
    "offset": 0
  },
  "rows": [
    {
      "meta": {
        "href": "https://api.kladana.com/api/remap/1.2/audit/83732f4b-792a-11e7-9464-d04800000005",
        "type": "audit",
        "mediaType": "application/json"
      },
      "id": "83732f4b-792a-11e7-9464-d04800000005",
      "uid": "admin@11",
      "source": "app",
      "moment": "2017-08-04 18:35:15",
      "objectCount": 1,
      "eventType": "create",
      "entityType": "customerorder",
      "events": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/audit/83732f4b-792a-11e7-9464-d04800000005/events",
          "type": "auditevent",
          "mediaType": "application/json",
          "size": 1,
          "limit": 25,
          "offset": 0
        }
      }
    }
  ]
}
```

### Events
Audit events contain detailed information about the changes that have occurred, such as changing the value of a field.

#### Event Types
Events are divided into several types, ranging from entity creation audit to print audit,
and consist of information about the time of the event and the changes that occurred during this event. Different types of events differ from each other ['diff' field format](../audit/#audit-audit-events-39-diff-39-field-format),
more about which below.

+ Account registration
+ Create entity or document
+ Update entity or document
+ Deleting an entity or document
+ Add to cart
+ Restore from trash
+ Archiving
+ Restore from archive
+ Publication of documents
+ Sending emails
+ Token change

#### Entity attributes

| Title | Type | Description                                                                                                                                                                                                   |
| ----------| -----|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **additionalInfo** | String(4096) | Additional Event Information<br>`+Read Only`                                                                                                                                                                  |
| **audit** | Enum | Context metadata<br>`+Required for response` `+Read-only`                                                                                                                                                     |
| **diff** | object | Changes occurred in the Event, in the special 'diff' format described in the ['diff' field format](../audit/#audit-audit-events-39-diff-39-field-format) section<br>`+Required for response` `+Only for reading` |
| **entities** | [Meta](../#kladana-json-api-general-info-metadata) | Entity metadata. Will not be displayed only for products, services, product variants, bundles deleted before 20.08.2017<br>`+Read only`                                                                             |
| **entityType** | Enum | Entity name<br>`+Required for response` `+Read only`                                                                                                                                                          |
| **eventType** | Enum | Event Action<br>`+Required on response` `+Read-only`                                                                                                                                                          |
| **moment** | DateTime | Event creation time<br>`+Required for response` `+Read-only`                                                                                                                                                  |
| **name** | String(255) | Entity name<br>`+Required for response` `+Read-only`                                                                                                                                                          |
| **objectCount** | Int | number of objects changed<br>`+Required for response` `+Read only`                                                                                                                                            |
| **objectType** | Enum | The type of entities this change is associated with. This field is only present for `entityType` = `entitysettings` or `statesettings` or `templatesettings`<br>`+Required when replying`                     |
| **source** | Enum | Type of change<br>`+Required for response` `+Read only`                                                                                                                                                       |
| **supportAccess** | Boolean | Whether the access was made by support on behalf of the user. The flag is omitted if the value is false<br>`+Required on response` `+Read-Only`                                                               |
| **id** | String(255) | Employee Login<br>`+Required when replying` `+Read Only`                                                                                                                                                      |

#### 'Diff' field format
This field displays the changes in the fields of the entity that occurred in the Event.

Information about changes in entity fields is displayed for all fields, including those that are not accessible through the JSON API.
For fields used in the JSON API for entities and documents, the name of the entity attribute will be the same as the name of the corresponding field,
described in the section for a given entity or document.

Below are the possible formats for the ``diff`` field for different [Event types](../audit/#audit-audit-events-event-types).
For entity creation events, the ``diff`` field will be absent.

#### Registration event

| Title | Type | Description |
|-------|------|-----------|
| **account** | String(255) | Account name<br>`+Required when replying` `+Read only` |
| **country** | String(255) | Account Configuration (Country)<br>`+Required when replying` `+Read Only` |

#### Document publishing events

| Title | Type | Description|
| -------------------- | ---------- | ---------------|
| **templateName** | String(255) | Template name<br>`+Required when replying` `+Read only` |
| **publicationHref** | URL | Post link<br>`+Required when replying` `+Read only` |

#### Email sending events

| Title | Type | Description |
| ---------------- | ---------- | ---------------- |
| **senderEmail** | String(255) | Sender's mailbox<br>`+Required when replying` `+Read only` |
| **targetEmail** | String(255) | Recipient's mailbox<br>`+Required when replying` `+Read only` |
| **subjectEmail** | String(255) | Email subject<br>`+Required when replying` `+Read only` |
| **text** | String(255) | Message body<br>`+Required when replying` `+Read-only` |

#### Entity deletion events

| Title | Type | Description |
| ----------------- | ---------- | -----------------|
| **attributeName** | String(255) | Entity attribute name<br>`+Required for response` `+Read-only` |
| **oldValue** | Boolean | Attribute value before deletion<br>`+Required for response` `+Read only` |

#### Events for updating entities, moving/restoring from trash, moving/restoring from archive

| Title | Type | Description |
| ------| -----| ------------|
| **attributeName** | String(255) | Entity attribute name<br>`+Required for response` `+Read-only` |
| **oldValue** | Boolean | Attribute value before deletion<br>`+Required for response` `+Read only` |
| **newValue** | Boolean | Attribute value after update<br>`+Required for response` `+Read-only` |

### Get Events by Context
Request to receive Context events with the specified ID. Result: JSON object including fields:

| Title | Type | Description |
| ------| -----|----------- |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing events. |

**Parameters**

| Parameter | Description |
| ------- | --------------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* Context id. |

> Get Events by Context

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/audit/7944ef04-f831-11e5-7a69-971500188b19/events"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of events.

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
    "href": "https://api.kladana.com/api/remap/1.2/audit/c107864f-3f88-11e7-8a7f-40d000000041/events",
    "type": "auditevent",
    "mediaType": "application/json",
    "size": 1,
    "limit": 25,
    "offset": 0
  },
  "rows": [
    {
      "source": "app",
      "eventType": "update",
      "entityType": "product",
      "uid": "admin@1",
      "moment": "2017-05-30 18:47:49",
      "diff": {
        "weighed": {
          "oldValue": false,
          "newValue": true
        }
      },
      "name": "some product",
      "audit": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/audit/7944ef04-f831-11e5-7a69-971500188b19",
          "type": "audit",
          "mediaType": "application/json"
        }
      },
      "entity": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#good/edit?id=7944ef04-f831-11e5-7a69-971500188b19"
        }
      }
    }
  ]
}
```

### Get Events by Entity
Request to receive events by the entity with the specified ID. Result: JSON object including fields:

| Title | Type | Description |
| ----------- | ------ | ------------ |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata about the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing events. |

**Parameters**

| Parameter | Description |
| ------- | ------------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* entity id. |
| **type** | `string` (required) *Example: product* entity type. |

> Get Events by Entity

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/audit"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of a list of events.

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
    "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19/audit",
    "type": "auditevent",
    "mediaType": "application/json",
    "size": 1,
    "limit": 25,
    "offset": 0
  },
  "rows": [
    {
      "source": "app",
      "eventType": "update",
      "entityType": "product",
      "uid": "admin@1",
      "moment": "2017-05-30 18:47:49",
      "diff": {
        "weighed": {
          "oldValue": false,
          "newValue": true
        }
      },
      "name": "some product",
      "audit": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/audit/7944ef04-f831-11e5-7a69-971500188b19",
          "type": "audit",
          "mediaType": "application/json"
        }
      },
      "entity": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/product/7944ef04-f831-11e5-7a69-971500188b19",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/product/metadata",
          "type": "product",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#good/edit?id=7944ef04-f831-11e5-7a69-971500188b19"
        }
      }
    }
  ]
}
```

### Filters

The JSON API of the Kladana provides the ability to filter [Audit contexts](../audit/#audit-audit-contexts) using the ``filter`` url parameter.
More details about this parameter can be found in the section [Filtering the selection using the filter parameter](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter)
Filtering can be done by the fields described below.

##### Entity attributes

+ **moment**-
   String type parameter. The value must be a string in the format
   date + time accurate to seconds.

   Valid operators for filtering on the ``moment`` attribute: ``['>=', '<=']``

    String format : `YYYY-MM-DD HH:MM:SS[.mmm]`, Time zone: `MSK` (Moscow time)

+ **employee**-
   String type parameter. The ``href`` of the employee entity must be passed as the value.
   The filtered selection will include all audit entities whose changes were made by this user.

    Line format : `href`

+ **eventType** -
   String type parameter. The [Event type](../audit/#audit-audit-events-event-types) should be passed as a value, according to which
   audit entities should be filtered. List of possible parameter values:

| The value of the eventType parameter | Description |
| --------------------------------- | ----------- |
| **registration** | Registration |
| **bulkoperation** | Bulk operation |
| **closepublication** | Deleting a post |
| **create** | Creation of entities |
| **delete** | Deleting entities |
| **openpublication** | Create a post |
| **print** | Document printing |
| **puttoarchive** | Placement in the archive |
| **puttorecyclebin** | Placement in the basket |
| **replacetoken** | Change of token for Point of sale |
| **restorefromarchive** | Extract from the archive |
| **restorefromrecyclebin** | Retrieve from cart |
| **sendmailfromentity** | Sending a letter |
| **update** | Changing entities |

+ **source** - 
  String type parameter. The value must be the type of action by which
   audit entities should be filtered. List of possible parameter values:

| The value of the source parameter | Description |
| ------------------------------ | ---------------|
| **registration** | Account registration |
| **clearrecyclebin** | Automatic emptying of the basket |
| **combine** | Association |
| **connectors** | Synchronization with MI |
| **copy** | Copy |
| **emailsend** | Sending a message |
| **evotor** | Synchronization with Evotor |
| **export** | Export |
| **exportediclient1c** | Export to 1C Client EDO |
| **import** | Import |
| **importediclient1c** | Import to 1C Client EDO |
| **jsonapi** | JSON API |
| **loginlogout** | Entering or exiting MyWarehouse |
| **phone-1.0** | Phone API |
| **posapi** | POS API |
| **restapi** | REST API |
| **retail** | Point of sale |
| **scriptor** | Working with scripts |

+ **uid**-
   String type parameter. The value must be the username of the employee who
   audit events must be filtered out.
+ **entityType** -
   String type parameter. The value must be the name of the entity by which
   audit entities should be filtered. The name from the JSON API of the entity/document can be passed as a parameter (move, enter, customerorder, etc.) or one of the values from the following list:

| The value of the entityType | Description |
| ---------------------- | ----------|
| **accountrole** | Role |
| **amiroconnectorsettings** | Synchronization setup (Amiro) |
| **cmlconnectorsettings** | Synchronization Setup (CML) |
| **crptcancellation** | Writing off marking codes |
| **crptdemand** | Shipment of marked products |
| **crptpackagecreation** | Formation of packaging |
| **crptpackagedisaggregation** | Unpacking |
| **crptpackageitemremoval** | Unpacking |
| **ecwidconnectorsettings** | Setting up synchronization (Ecwid) |
| **entitysettings** | Entity settings |
| **evotorsetting** | Setting up an exchange with Evotor |
| **processingplanfolder** | Dashboard group |
| **scripttemplate** | Scenario |
| **smartwebconnectorsettings** | Setting up synchronization (SmartWeb) |
| **statesettings** | Status settings |
| **templatesettings** | Template settings |
| **user** | User |
| **usersettings** | User settings |
| **vkconnectorsettings** | Setting up synchronization (Vkontakte) |
| **yandexconnectorsettings** | Setting up synchronization (Yandex.Market) |
| **ymlconnectorsettings** | Synchronization setup (YML) |

You can also filter audit contexts by custom lookup. To do this, you must pass the href of the custom directory as the **entityType** parameter.
Example: https://api.kladana.com/api/remap/1.2/entity/customentity/eaacabaf-2655-11e6-8a84-bae500000045

### Get Filters

Query all audit filters available to the user.
Result: JSON object including fields:

| Title | Description |
| ------| ------------|
| **eventType** | actions by which audit entities can be filtered |
| **source** | types of actions by which audit entities can be filtered |
| **entityType** | names of entities by which audit entities can be filtered |

> Get Filters

```shell
curl -X GET
  "https://api.kladana.com/api/remap/1.2/audit/metadata/filters"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Audit Filters.

```json
{
  "source": [
    "copy",
    "combine",
    "import",
    "restapi",
    "jsonapi",
    "posapi",
    "retail",
    "connectors",
    "evotor",
    "clearrecyclebin",
    "loginlogout",
    "emailsend",
    "export",
    "phone-1.0",
    "scriptor",
    "exportediclient1c",
    "importediclient1c",
    "registration"
  ],
  "entitytype": [
    "organization",
    "employee",
    "store",
    "retaildemand",
    "retailsalesreturn",
    "purchaseorder",
    "invoicein",
    "supply",
    "purchasereturn",
    "customerorder",
    "invoiceout",
    "demand",
    "salesreturn",
    "loss",
    "enter",
    "move",
    "inventory",
    "processing",
    "processingplan",
    "processingplanfolder",
    "processingorder",
    "internalorder",
    "cashin",
    "paymentin",
    "cashout",
    "paymentout",
    "service",
    "product",
    "bundle",
    "productfolder",
    "variant",
    "counterparty",
    "currency",
    "project",
    "contract",
    "amiroconnectorsettings",
    "cmlconnectorsettings",
    "ecwidconnectorsettings",
    "smartwebconnectorsettings",
    "ymlconnectorsettings",
    "vkconnectorsettings",
    "yandexconnectorsettings",
    "usersettings",
    "group",
    "user",
    "accountrole",
    "specialpricediscount",
    "personaldiscount",
    "accumulationdiscount",
    "roundoffdiscount",
    "bonusprogram",
    "loyaltydiscount",
    "bonustransaction",
    "country",
    "uom",
    "purpose",
    "notificationsubscription",
    "entitysettings",
    "statesettings",
    "templatesettings",
    "phonecall",
    "receipttemplate",
    "enrollorder",
    "retireorder",
    "remarkingorder",
    "emissionorder",
    "crptdemand",
    "scripttemplate",
    "cashboxadjustment",
    "accountadjustment",
    "counterpartyadjustment",
    "crptcancellation",
    "crptpackagecreation",
    "crptpackageitemremoval",
    "crptpackagedisaggregation",
    "evotorsetting",
    "https://api.kladana.com/api/remap/1.2/entity/customentity/eaacabaf-2655-11e6-8a84-bae500000045"
  ],
  "eventtype": [
    "create",
    "update",
    "delete",
    "puttorecyclebin",
    "restorefromrecyclebin",
    "puttoarchive",
    "restorefromarchive",
    "print",
    "openpublication",
    "closepublication",
    "sendemailfromentity",
    "bulkoperation",
    "replacetoken",
    "registration"
  ]
}
```
