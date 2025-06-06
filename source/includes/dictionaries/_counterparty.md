## Counterparty
### Counterparties

Using the JSON API, you can create and update information about Counterparties, request lists of Counterparties and information on individual Counterparties. Accounts of the Counterparty and its contact persons can be managed both as part of a separate Counterparty, and separately - using special resources for managing accounts and contact persons of the Counterparty. The entity code for the Counterparty in the JSON API is the keyword **counterparty**. Learn more about [Counterparties](https://kladana.zendesk.com/hc/en-us/articles/6507246022045-Create-counterparty).

The entity can be contextually searched using the special `search` parameter. [Learn more](../#kladana-json-api-general-info-context-search).

The search among the objects of the Counterparty is carried out according to several conditions. If the values of the counterparty fields satisfy at least one of the conditions, then the counterparty will be found.

First search term:

+ By the name of the Counterparty **name**
+ By Counterparty code **code**
+ By the full name of the Counterparty **legalTitle**
+ According to the number of the Counterparty's discount card **discountCardNumber**
+ By e-mail address **email**

Second search term:

+ By landline phone number **phone**

The third search condition for the fields of all contact persons of the counterparty company (contactpersons):

+ By name of the contact person **name**
+ By mail of the contact person **email**

The fourth search condition for the fields of all contact persons of the counterparty firm (contactpersons):

+ By phone number of the contact person **phone**

#### Entity attributes

| Title                  | Type                                               | Filtration | Description |
|------------------------|----------------------------------------------------| -------- | -------- |
| **accountId**          | UUID                                               | `=` `!=` | Account ID<br>`+Required when answering` `+Read Only` |
| **accounts**           | MetaArray                                          | | Array of Counterparty accounts. [Learn more](../dictionaries/#entities-counterparty-counterparties-attributes-of-entity-address-accounts-of-counterparties)<br>`+Required when answering` `+Expand` |
| **actualAddress**      | String(255)                                        | `=` `!=` `~` `~=` `=~` | Actual address of the Counterparty |
| **actualAddressFull**  | Object                                             | | The actual address of the Counterparty with details on individual fields. [Learn more](../dictionaries/#entities-counterparty-counterparties-attributes-of-entity-address) |
| **archived**           | Boolean                                            | `=` `!=` | Has the Counterparty been added to the archive<br>`+Required when answering` |
| **attributes**         | Array(Object)                                      | [Operators of additional fields](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter-filtering-by-additional-fields) | Additional metadata array fields |
| **bonusPoints**        | Int                                                | | Bonus points for an active bonus program<br>`+Read Only` |
| **bonusProgram**       | [Meta](../#kladana-json-api-general-info-metadata) | | Metadata of the active Bonus Program<br>`+Expand` |
| **code**               | String(255)                                        | `=` `!=` `~` `~=` `=~` | Counterparty Code |
| **companyType**        | Enum                                               | `=` `!=` | Counterparty type. Depending on the value of this field, the set of displayed details of the counterparty may change. [Learn more](../dictionaries/#entities-counterparty-counterparties-counterparty-type)<br>`+Required when replying` |
| **contactpersons**     | MetaArray                                          | | An array of contact persons of the Counterparty's firm. [Learn more](../dictionaries/#entities-counterparty-counterparties-attributes-of-entity-address-contact-persons-of-counterparties)<br>`+Expand`|
| **created**            | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | Creation time<br>`+Required when answering` |
| **description**        | String(4096)                                       | `=` `!=` `~` `~=` `=~` | Comment to the Counterparty |
| **discountCardNumber** | String(255)                                        | `=` `!=` `~` `~=` `=~` | Number of the discount card of the Counterparty |
| **discounts**          | Array(Object)                                      || Array of Counterparty discounts. The array can contain personal and cumulative discounts. A personal discount is displayed if the **discount percentage** for the counterparty has changed at least once, the value will be indicated in the **personalDiscount** |
| **email**              | String(255)                                        | `=` `!=` `~` `~=` `=~` | Email address |
| **externalCode**       | String(255)                                        | `=` `!=` `~` `~=` `=~` | Counterparty external code<br>`+Required when answering` |
| **fax**                | String(255)                                        | `=` `!=` `~` `~=` `=~` | Fax number |
| **files**              | MetaArray                                          | | [Files](../dictionaries/#entities-files) array metadata (Maximum number of files - 100)<br>`+Required when answering` `+Expand` |
| **group**              | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Employee's department<br>`+Required when answering` `+Expand` |
| **id**                 | UUID                                               | `=` `!=` | Account ID<br>`+Required when answering` `+Read only` |
| **meta**               | [Meta](../#kladana-json-api-general-info-metadata) | | Metadata of the Counterparty<br>`+Required when answering` |
| **name**               | String(255)                                        | `=` `!=` `~` `~=` `=~` | Counterparty name<br>`+Required when answering` `+Required when creating` |
| **notes**              | MetaArray                                          | | Array of Counterparty incidents. [Learn more](../dictionaries/#entities-counterparty-counterparties-attributes-of-entity-address-account-incidents)<br>`+Expand` |
| **owner**              | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Owner (Employee)<br>`+Expand` |
| **phone**              | String(255)                                        | `=` `!=` `~` `~=` `=~` | City phone number |
| **priceType**          | Object                                             | `=` `!=` | Counterparty price type. [Learn more](../dictionaries/#entities-price-type-price-types) |
| **salesAmount**        | Int                                                | | Amount of sales<br>`+Required when answering` `+Read only` |
| **shared**             | Boolean                                            | `=` `!=` | Sharing<br>`+Required when answering` |
| **state**              | [Meta](../#kladana-json-api-general-info-metadata) | `=` `!=` | Counterparty Status Metadata<br>`+Expand` |
| **syncId**             | UUID                                               | `=` `!=` | Synchronization ID<br>`+Cannot be changed after filling` |
| **tags**               | Array(String)                                      | `=` `!=` | Account groups |
| **updated**            | DateTime                                           | `=` `!=` `<` `>` `<=` `>=` | The moment of the last update of the Counterparty<br>`+Required when answering` `+Read-only` |

##### Detail fields

| Title                                  | Type         | Filtration | Description                                                                                                   |
|----------------------------------------|--------------| ------ |---------------------------------------------------------------------------------------------------------------|
| **mod\_\_requisites\_\_in**            | Object       | | Requisites for the Counterparty of the type `[Legal entity. India]` with details on individual fields         |
| **mod\_\_requisites\_\_international** | Object       | | Requisites for the Counterparty of the type `[Legal entity. International]` with details on individual fields |
| **legalAddress**                       | String(255)  | `=` `!=` `~` `~=` `=~` | Legal address of the Counterparty                                                                             |
| **legalAddressFull**                   | Object       | | Legal address of the Counterparty with details on individual fields                                           |
| **legalTitle**                         | String(4096) | `=` `!=` `~` `~=` `=~` | Full name for the Counterparty                                                                                |


A cumulative discount is displayed if a **correction of the amount of savings at a discount** has been set at least once for the counterparty, the value will be indicated in the **demandSumCorrection** field
or if the accumulative discount conditions **Percentage of discounts for a certain amount of sales** are met, the actual value will be displayed in the **accumulationDiscount** field.
You can see the format for displaying discounts in the [Discounts](../dictionaries/#entities-discounts) section.

#### Nested entity attributes
#### Attributes of entity Address

| Title | Type | Description |
| -------| ------- | ----- |
| **addInfo** | String(255) | Other |
| **apartment** | String(30) | Apartment |
| **city** | String(255) | City |
| **comment** | String(255) | Comment |
| **country** | [Meta](../#kladana-json-api-general-info-metadata) | Country metadata |
| **house** | String(30) | House |
| **postalCode** | String(6) | Postcode |
| **region** | [Meta](../#kladana-json-api-general-info-metadata) | Region metadata |
| **street** | String(255) | Street |

The address string is the concatenation of the structured address fields in the following order: postalCode -> country -> region -> city -> street -> house -> apartment -> addInfo, using a comma as separator.
When passing entities with an address to Kladana, use either a string address or a structured address.
When passing both addresses, the string will be ignored.
When passing only a string, it will be reflected both in the string field and in the addInfo of the structured address.
[`null` value](../#kladana-json-api-general-info-null-support) is not supported for address. Passing `null` to this attribute will not remove it.
To delete an address, you need to pass an empty string `""` to the string field `actualAddress`.

##### Requisites of Counterparties
| Title   | Type | Description |
|---------| ------- |-------------|
| **pan** | String(255) | PAN         |
Only for counterparty with type `Legal entity. India`.

| Title         | Type | Description    |
|---------------| ------- |----------------|
| **taxNumber** | String(255) | Tax Number     |
| **gstNumber** | String(255) | GST/VAT Number |
| **country** | [Meta](../#kladana-json-api-general-info-metadata) | Country metadata |
Only for counterparty with type `Legal entity. International`.

##### Accounts of Counterparties

| Title | Type                                               | Description |
| ------|----------------------------------------------------| ------- |
| **accountId** | UUID                                               | Account ID<br>`+Required when answering` `+Read Only` |
| **accountNumber** | String(255)                                        | Account number<br>`+Required when answering` `+Required when creating` |
| **bankLocation** | String(255)                                        | Bank address |
| **bankName** | String(255)                                        | Bank name |
| **bic** | String(255)                                        | BIC |
| **correspondentAccount** | String(255)                                        | Corr account |
| **id** | UUID                                               | Account ID<br>`+Required when replying` `+Read only` |
| **isDefault** | Boolean                                            | Is the account the main account of the Counterparty<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Counterparty Account Metadata<br>`+Required when replying` |
| **updated** | DateTime                                           | The moment of the last update of the Counterparty<br>`+Required when replying` `+Read-only` |

##### Contact persons of Counterparties

| Title | Type                                               | Description |
| ------ |----------------------------------------------------| ------- |
| **accountId** | UUID                                               | Account ID<br>`+Required when answering` `+Read Only` |
| **agent** | [Meta](../#kladana-json-api-general-info-metadata) | Counterparty metadata<br>`+Required when answering` `+Expand` |
| **description** | String(4096)                                       | Description of the contact person |
| **email** | String(255)                                        | Email address of the contact person |
| **externalCode** | String(255)                                        | External contact code |
| **id** | UUID                                               | Contact ID<br>`+Required when answering` `+Read only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Contact person of the Counterparty<br>`+Required when answering` |
| **name** | String(255)                                        | Name of the contact person<br>`+Required when answering` `+Required when creating` |
| **phone** | String(255)                                        | Phone number of the contact person |
| **position** | String(255)                                        | Item of contact person |
| **updated** | DateTime                                           | Moment of last update<br>`+Required when answering` `+Read Only` |

##### Account incidents

| Title | Type                                               | Description |
| ------ |----------------------------------------------------| ----- |
| **accountId** | UUID                                               | Account ID<br>`+Required when replying` `+Read Only` |
| **agent** | [Meta](../#kladana-json-api-general-info-metadata) | Counterparty metadata<br>`+Required when replying` `+Read-only` `+Expand` |
| **author** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Employee - the creator of the incident (account administrator, if the author is an application)<br>`+Required when replying` `+Read-only` |
| **authorApplication** | [Meta](../#kladana-json-api-general-info-metadata) | incident Creator Application Metadata<br>`+Read Only` |
| **created** | DateTime                                           | The moment when the Account incident was created<br>`+Required when replying` `+Read-only` |
| **description** | String(4096)                                       | Counterparty incident text<br>`+Required when replying` `+Required when creating` |
| **id** | UUID                                               | incident ID<br>`+Required when replying` `+Read only` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Account incident metadata<br>`+Required when replying` |

#### Counterparty type
Depending on the counterparty type **companyType**, its object will display different sets of details.
Counterparty types and corresponding values that can be passed in this field:

| CompanyType field value | Region               | Counterparty type   |
|-------------------------|----------------------|---------------------|
| **legalIN**             | India                | Legal entity. India |
| **legalINTERNATIONAL**  | International        | Legal entity. International      |

If the counterparty type is `Legal entity. India`, the following fields of details will be displayed:

| Title                             | Description                       |
|-----------------------------------|-----------------------------------|
| **mod\_\_requisites\_\_in.pan**   | PAN                               |
| **legalAddress**                  | Legal address of the Counterparty |
| **legalTitle**                    | Full name of the Counterparty     |
| **tags**                          | Groups (array)                    |

If the counterparty type is `Legal entity. International`, the following fields of details will be displayed:

| Title                                            | Description                       |
|--------------------------------------------------|-----------------------------------|
| **mod\_\_requisites\_\_international.taxNumber** | Tax Number                        |
| **mod\_\_requisites\_\_international.gstNumber** | GST/VAT Number                    |
| **mod\_\_requisites\_\_international.country**   | Country of the Counterparty       |
| **legalAddress**                                 | Legal address of the Counterparty |
| **legalTitle**                                   | Full name of the Counterparty     |
| **tags**                                         | Groups (array)                    |

About working with Counterparty fields can be read [here](../#kladana-json-api-general-info-additional-fields)


### Get a list of Counterparties

> Request for a list of Counterparties

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/counterparty"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the list of Counterparties.
 
 ```json
{  
  "context": {  
    "employee": {  
      "meta": {  
        "href":"https://api.kladana.com/api/remap/1.2/context/employee",
        "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
        "type":"employee",
        "mediaType":"application/json"
      }
    }
  },
  "meta": {  
    "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty",
    "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
    "type":"counterparty",
    "mediaType":"application/json",
    "size":4,
    "limit":1000,
    "offset":0
  },
  "rows": [  
    {  
      "meta": {  
        "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/12a8b923-692c-11e6-8a84-bae500000053",
        "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
        "type":"counterparty",
        "mediaType":"application/json"
      },
      "id":"12a8b923-692c-11e6-8a84-bae500000053",
      "accountId":"1185513e-692c-11e6-8a84-bae500000001",
      "owner": {  
        "meta": {  
          "href":"https://api.kladana.com/api/remap/1.2/entity/employee/12747f9e-692c-11e6-8a84-bae50000002a",
          "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
          "type":"employee",
          "mediaType":"application/json"
        }
      },
      "shared": false,
      "group": {  
        "meta": {  
          "href":"https://api.kladana.com/api/remap/1.2/entity/group/11883c67-692c-11e6-8a84-bae500000002",
          "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/group/metadata",
          "type":"group",
          "mediaType":"application/json"
        }
      },
      "updated":"2016-08-23 15:21:09",
       "name":"LLC \"Supplier\"",
       "externalCode":"aZBfWOKzj-lcq7c7IWZON3",
       "archived": false,
       "created":"2007-02-07 17:16:41",
       "companyType":"legalIN",
       "legalTitle":"Limited Liability Company \"Supplier\"",
       "legalAddress":"125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
      "legalAddressFull": {  
        "postalCode":"125009",
        "country": {  
          "meta":{  
            "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
            "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
            "type":"country",
            "mediaType":"application/json"
          }
        },
        "region":{  
          "meta":{  
            "href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
            "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
            "type":"region",
            "mediaType":"application/json"
          }
        },
       "city":"Moscow",
         "street": "Tverskaya street",
         "house":"1",
         "apartment":"123",
         "addInfo":"addinfo",
         "comment":"some words about address"
       },
       "actualAddress":"125009, Russia, Moscow, Moscow, Tverskaya st., 1, 111, addInfo",
      "actualAddressFull":{  
        "postalCode":"125009",
        "country":{  
          "meta":{  
            "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
            "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
            "type":"country",
            "mediaType":"application/json"
          }
        },
        "region":{  
          "meta":{  
            "href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
            "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
            "type":"region",
            "mediaType":"application/json"
          }
        },
      "city":"Moscow",
         "street": "Tverskaya street",
         "house":"1",
         "apartment":"111",
         "addInfo":"addinfo",
         "comment":"some words about address"
      },
      "mod__requisites__in":{
        "pan": "7736570901"
      },
      "accounts":{  
        "meta":{  
          "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/12a8b923-692c-11e6-8a84-bae500000053/accounts",
          "type":"account",
          "mediaType":"application/json",
          "size":0,
          "limit":1000,
          "offset":0
        }
      },
      "tags":[  

      ],
      "contactpersons":{  
        "meta":{  
          "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/12a8b923-692c-11e6-8a84-bae500000053/contactpersons",
          "type":"contactperson",
          "mediaType":"application/json",
          "size":0,
          "limit":1000,
          "offset":0
        }
      },
      "notes":{  
        "meta":{  
          "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/12a8b923-692c-11e6-8a84-bae500000053/notes",
          "type":"note",
          "mediaType":"application/json",
          "size":0,
          "limit":1000,
          "offset":0
        }
      },
      "state":{  
        "meta":{  
          "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
          "type":"state",
          "mediaType":"application/json"
        }
      },
      "salesAmount":0,
      "priceType":{  
        "meta":{  
          "href":"https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
          "type":"pricetype",
          "mediaType":"application/json"
        },
        "id":"672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
        "name":"Sale price",
        "externalCode":"cbcf493b-55bc-11d9-848a-00112f43529a"
      },
      "bonusProgram": {
        "meta": {
          "href": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/129626ee-ac91-11e9-ac12-000d00000009",
          "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/metadata",
          "type": "bonusprogram",
          "mediaType": "application/json",
          "uuidHref": "https://app.kladana.com/app/#discount/edit?id=129626ee-ac91-11e9-ac12-000d00000009"
        }
      },
      "bonusPoints": 0
    },
     {
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/12c9ebcf-692c-11e6-8a84-bae50000005d",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
         "type":"counterparty",
         "mediaType":"application/json"
       },
       "id":"12c9ebcf-692c-11e6-8a84-bae50000005d",
       "accountId":"1185513e-692c-11e6-8a84-bae500000001",
       "owner":{
         "meta":{
           "href":"https://api.kladana.com/api/remap/1.2/entity/employee/12747f9e-692c-11e6-8a84-bae50000002a",
           "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
           "type":"employee",
           "mediaType":"application/json"
         }
       },
       "shared": false,
       "group":{
         "meta":{
           "href":"https://api.kladana.com/api/remap/1.2/entity/group/11883c67-692c-11e6-8a84-bae500000002",
           "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/group/metadata",
           "type":"group",
           "mediaType":"application/json"
         }
       },
       "updated":"2016-08-23 15:21:09",
       "name":"Retail customer",
       "externalCode":"lBvYwLWMiBsct7sVRrFnJ2",
       "archived": false,
       "created":"2007-02-07 17:16:41",
       "companyType":"legalIN",
       "legalAddress":"125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
       "legalAddressFull":{
         "postalCode":"125009",
         "country":{
           "meta":{
             "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
             "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
             "type":"country",
             "mediaType":"application/json"
           }
         },
         "region":{
           "meta":{
             "href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
             "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
             "type":"region",
             "mediaType":"application/json"
           }
         },
         "city":"Moscow",
         "street": "Tverskaya street",
         "house":"1",
         "apartment":"123",
         "addInfo":"addinfo",
         "comment":"some words about address"
       },
       "actualAddress":"125009, Russia, Moscow, Moscow, Tverskaya st., 1, 111, addInfo",
       "actualAddressFull":{
         "postalCode":"125009",
         "country":{
           "meta":{
             "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
             "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
             "type":"country",
             "mediaType":"application/json"
           }
         },
         "region":{
           "meta":{
             "href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
             "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
             "type":"region",
             "mediaType":"application/json"
           }
         },
         "city":"Moscow",
         "street": "Tverskaya street",
         "house":"1",
         "apartment":"111",
         "addInfo":"addinfo",
         "comment":"some words about address"
       },
       "accounts":{
         "meta":{
           "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/12c9ebcf-692c-11e6-8a84-bae50000005d/accounts",
           "type":"account",
           "mediaType":"application/json",
           "size":0,
           "limit":1000,
           "offset":0
         }
       },
       "tags":[

       ],
       "contactpersons":{
         "meta":{
           "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/12c9ebcf-692c-11e6-8a84-bae50000005d/contactpersons",
           "type":"contactperson",
           "mediaType":"application/json",
           "size":0,
           "limit":1000,
           "offset":0
         }
       },
       "notes":{
         "meta":{
           "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/12c9ebcf-692c-11e6-8a84-bae50000005d/notes",
           "type":"note",
           "mediaType":"application/json",
           "size":0,
           "limit":1000,
           "offset":0
         }
       },
       "salesAmount":0
     },
     {
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/df2fdd2d-6934-11e6-8a84-bae500000049",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
         "type":"counterparty",
         "mediaType":"application/json"
       },
       "id":"df2fdd2d-6934-11e6-8a84-bae500000049",
       "accountId":"1185513e-692c-11e6-8a84-bae500000001",
       "owner":{
         "meta":{
           "href":"https://api.kladana.com/api/remap/1.2/entity/employee/12747f9e-692c-11e6-8a84-bae50000002a",
           "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
           "type":"employee",
           "mediaType":"application/json"
         }
       },
       "shared": false,
       "group":{
         "meta":{
           "href":"https://api.kladana.com/api/remap/1.2/entity/group/11883c67-692c-11e6-8a84-bae500000002",
           "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/group/metadata",
           "type":"group",
           "mediaType":"application/json"
         }
       },
       "updated":"2016-08-23 16:24:08",
       "name":"trtr",
       "externalCode":"rRlzrdZmjql9r9dveXPE43",
       "archived": false,
       "created":"2007-02-07 17:16:41",
       "companyType":"legalINTERNATIONAL",
       "legalAddress":"125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
       "legalAddressFull":{
         "postalCode":"125009",
         "country":{
           "meta":{
             "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
             "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
             "type":"country",
             "mediaType":"application/json"
           }
         },
         "region":{
           "meta":{
             "href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
             "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
             "type":"region",
             "mediaType":"application/json"
           }
         },
         "city":"Moscow",
         "street": "Tverskaya street",
         "house":"1",
         "apartment":"123",
         "addInfo":"addinfo",
         "comment":"some words about address"
       },
       "actualAddress":"125009, Russia, Moscow, Moscow, Tverskaya st., 1, 111, addInfo",
       "actualAddressFull":{
         "postalCode":"125009",
         "country":{
           "meta":{
             "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
             "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
             "type":"country",
             "mediaType":"application/json"
           }
         },
         "region":{
           "meta":{
             "href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
             "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
             "type":"region",
             "mediaType":"application/json"
           }
         },
         "city":"Moscow",
         "street": "Tverskaya street",
         "house":"1",
         "apartment":"111",
         "addInfo":"addinfo",
         "comment":"some words about address"
       },
       "mod__requisites__international":{
         "taxNumber": "7736570901",
         "gstNumber": "ABCD-123456",
         "country":{
           "meta":{
             "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
             "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
             "type":"country",
             "mediaType":"application/json"
           }
         }
       },
       "accounts":{
         "meta":{
           "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/df2fdd2d-6934-11e6-8a84-bae500000049/accounts",
           "type":"account",
           "mediaType":"application/json",
           "size":0,
           "limit":1000,
           "offset":0
         }
       },
       "tags":[

       ],
       "contactpersons":{
         "meta":{
           "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/df2fdd2d-6934-11e6-8a84-bae500000049/contactpersons",
           "type":"contactperson",
           "mediaType":"application/json",
           "size":0,
           "limit":1000,
           "offset":0
         }
       },
       "notes":{
         "meta":{
           "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/df2fdd2d-6934-11e6-8a84-bae500000049/notes",
           "type":"note",
           "mediaType":"application/json",
           "size":0,
           "limit":1000,
           "offset":0
         }
       },
       "state":{
         "meta":{
           "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
           "type":"state",
           "mediaType":"application/json"
         }
       },
       "salesAmount":0
     }
   ]
}
```

Get a list of all Counterparties.
Result: JSON object including fields:

| Title | Type | Description |
| -----| ----- | ------ |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Issuance metadata. |
| **context** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the person who made the request. |
| **rows** | Array(Object) | An array of JSON objects representing counterparties. |

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **limit** | `number` (optional) **Defaul:** 1000 *Example: 1000*. The maximum number of entities to retrieve. `Allowed values are 1 - 1000` |
| **offset** | `number` (optional) **Defaul:** 0 *Example: 40*. Indentation in the output list of entities |
| **tags** | `string`(optional) *Example: workers*. For more information about this parameter, see the [Filtering the selection using the filter parameter](../#kladana-json-api-general-info-filtering-the-selection-using-the-filter-parameter) section. String format : `string` |

### Create Account
Mandatory fields to create:

| Title | Description |
| ------------------------------ | :--------------------------- |
| **name** | Name of the Counterparty |


##### Description

The counterparty is created based on the passed JSON object,
which contains the representation of the new Counterparty.

> Example 1

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/counterparty"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d '{
    "name": "OOO Rainbow",
    "description": "Building materials chain Raduga EXPO",
    "code": "rainbowCode",
    "externalCode": "extRainbw",
    "email": "raduga@stroi.ru",
    "phone": "+7 495 331 22 33",
    "fax": "1257752",
    "actualAddress": "Moscow, Academician Mil street, 15/21",
    "legalTitle": "Limited Liability Company \"Rainbow\"",
    "legalAddress": "Moscow, Aviastroiteley street 93/12",
    "mod__requisites__in":{
      "pan": "125152124152"
    },
    "tags": [
        "Builders",
        "Rainbow",
        "Repair"
    ],
    "state": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
            "type": "state",
            "mediaType": "application/json"
        }
    },
    "priceType": {
        "meta": {
            "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
            "type": "pricetype",
            "mediaType": "application/json"
        }
    }
}'
```

> Response 200. Successful request. The result is a JSON representation of the created Counterparty.

```json
{  
  "meta":{  
    "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000",
    "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
    "type":"counterparty",
    "mediaType":"application/json"
  },
  "id":"b80ea81b-7058-11e6-8a84-bae500000000",
  "accountId":"1185513e-692c-11e6-8a84-bae500000001",
  "owner":{  
    "meta":{  
      "href":"https://api.kladana.com/api/remap/1.2/entity/employee/12747f9e-692c-11e6-8a84-bae50000002a",
      "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type":"employee",
      "mediaType":"application/json"
    }
  },
  "shared": false,
  "group":{  
    "meta":{  
      "href":"https://api.kladana.com/api/remap/1.2/entity/group/11883c67-692c-11e6-8a84-bae500000002",
      "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type":"group",
      "mediaType":"application/json"
    }
  },
  "updated":"2016-09-01 18:28:22",
  "name":"Company LLC",
  "externalCode":"o7732zkki541HDkZZD1Yt3",
  "archived": false,
  "companyType":"legalIN",
  "accounts":{  
    "meta":{  
      "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000/accounts",
      "type":"account",
      "mediaType":"application/json",
      "size":0,
      "limit":1000,
      "offset":0
    }
  },
  "mod__requisites__in":{
    "pan": "125152124152"
  },
  "tags":[  

  ],
  "contactpersons":{  
    "meta":{  
      "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000/contactpersons",
      "type":"contactperson",
      "mediaType":"application/json",
      "size":0,
      "limit":1000,
      "offset":0
    }
  },
  "notes":{  
    "meta":{  
      "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000/notes",
      "type":"note",
      "mediaType":"application/json",
      "size":0,
      "limit":1000,
      "offset":0
    }
  },
  "state":{  
    "meta":{  
      "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
      "type":"state",
      "mediaType":"application/json"
    }
  },
  "priceType":{  
    "meta":{  
      "href":"https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
      "type":"pricetype",
      "mediaType":"application/json"
    }
  }
}
```

> Example 2

```shell
curl -X POST
  "https://api.kladana.com/api/remap/1.2/entity/counterparty"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
  -H "Content-Type: application/json"
  -d '{
        "name": "ООО Радуга"
      }'
```

> Response 200. Successful request. The result is a JSON representation of the created Counterparty.

```json
{  
  "meta":{  
    "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000",
    "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
    "type":"counterparty",
    "mediaType":"application/json"
  },
  "id":"b80ea81b-7058-11e6-8a84-bae500000000",
  "accountId":"1185513e-692c-11e6-8a84-bae500000001",
  "owner":{  
    "meta":{  
      "href":"https://api.kladana.com/api/remap/1.2/entity/employee/12747f9e-692c-11e6-8a84-bae50000002a",
      "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type":"employee",
      "mediaType":"application/json"
    }
  },
  "shared": false,
  "group":{  
    "meta":{  
      "href":"https://api.kladana.com/api/remap/1.2/entity/group/11883c67-692c-11e6-8a84-bae500000002",
      "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type":"group",
      "mediaType":"application/json"
    }
  },
  "updated":"2016-09-01 18:28:22",
  "name":"Company LLC",
  "externalCode":"o7732zkki541HDkZZD1Yt3",
  "archived": false,
  "created":"2007-02-07 17:16:41",
  "companyType":"legalIN",
  "accounts":{  
    "meta":{  
      "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000/accounts",
      "type":"account",
      "mediaType":"application/json",
      "size":0,
      "limit":1000,
      "offset":0
    }
  },
  "tags":[],
  "contactpersons":{  
    "meta":{  
      "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000/contactpersons",
      "type":"contactperson",
      "mediaType":"application/json",
      "size":0,
      "limit":1000,
      "offset":0
    }
  },
  "notes":{  
    "meta":{  
      "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000/notes",
      "type":"note",
      "mediaType":"application/json",
      "size":0,
      "limit":1000,
      "offset":0
    }
  },
  "state":{  
    "meta":{  
      "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
      "type":"state",
      "mediaType":"application/json"
    }
  }
}
```

> Example 3

```shell
curl -X POST
  "https://api.kladana.com/api/remap/1.2/entity/counterparty"
  -H "Authorization: Basic <Credentials>"
  -H "Content-Type: application/json"
  -d ' {
        "name": "Johnson",
        "companyType": "legalINTERNATIONAL",
        "mod__requisites__international":{
          "taxNumber": "7736570901",
          "gstNumber": "ABCD-123456",
          "country":{
            "meta":{
              "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
              "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
              "type":"country",
              "mediaType":"application/json"
            }
          }
        }
       }'
```
> Response 200. Successful request. Result is JSON representation of the created Counterparty.

```json
{
  "meta": {
    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/23f049f3-3ad1-11ee-ac13-000c00000000",
    "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
    "type": "counterparty",
    "mediaType": "application/json",
    "uuidHref": "https://app.kladana.com/app/#company/edit?id=23f049f3-3ad1-11ee-ac13-000c00000000"
  },
  "id": "23f049f3-3ad1-11ee-ac13-000c00000000",
  "accountId": "00081cde-3ad1-11ee-ac13-000d00000001",
  "owner": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/employee/00f97251-3ad1-11ee-ac13-000e0000004c",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
      "type": "employee",
      "mediaType": "application/json",
      "uuidHref": "https://app.kladana.com/app/#employee/edit?id=00f97251-3ad1-11ee-ac13-000e0000004c"
    }
  },
  "shared": false,
  "group": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/group/0009beb8-3ad1-11ee-ac13-000d00000002",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/group/metadata",
      "type": "group",
      "mediaType": "application/json"
    }
  },
  "updated": "2023-08-14 21:34:00.817",
  "name": "Johnson",
  "externalCode": "mm62KDCZjOpCCNqvW3DtK1",
  "archived": false,
  "created": "2023-08-14 21:34:00.817",
  "companyType": "legalINTERNATIONAL",
  "accounts": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/23f049f3-3ad1-11ee-ac13-000c00000000/accounts",
      "type": "account",
      "mediaType": "application/json",
      "size": 0,
      "limit": 1000,
      "offset": 0
    }
  },
  "tags": [],
  "mod__requisites__international":{
    "taxNumber": "7736570901",
    "gstNumber": "ABCD-123456",
    "country":{
      "meta":{
        "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
        "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
        "type":"country",
        "mediaType":"application/json"
      }
    }
  },
  "contactpersons": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/23f049f3-3ad1-11ee-ac13-000c00000000/contactpersons",
      "type": "contactperson",
      "mediaType": "application/json",
      "size": 0,
      "limit": 1000,
      "offset": 0
    }
  },
  "notes": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/23f049f3-3ad1-11ee-ac13-000c00000000/notes",
      "type": "note",
      "mediaType": "application/json",
      "size": 0,
      "limit": 1000,
      "offset": 0
    }
  },
  "state": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/02b158a9-3ad1-11ee-ac13-000e000000b5",
      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
      "type": "state",
      "mediaType": "application/json"
    }
  },
  "salesAmount": 0.0,
  "files": {
    "meta": {
      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/23f049f3-3ad1-11ee-ac13-000c00000000/files",
      "type": "files",
      "mediaType": "application/json",
      "size": 0,
      "limit": 1000,
      "offset": 0
    }
  }
}
```

> Example with additional fields

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/counterparty"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d '{
          "name": "Vegetable Express LLC",
          "description": "Vegetable Delivery Network",
          "code": "ovoshexpressCode",
          "companyType": "legalIN",
          "externalCode": "extVagetable",
          "email": "ovosh@delivery.ru",
          "phone": "+7 495 662 12 23",
          "fax": "1052034",
          "legalTitle": "Limited Liability Company \"Vegetable Express\"",
          "legalAddressFull": {
              "postalCode": "125009",
              "country": {
                  "meta": {
                      "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
                      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
                      "type": "country",
                      "mediaType": "application/json"
                  }
              },
              "region": {
                  "meta": {
                      "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
                      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
                      "type": "region",
                      "mediaType": "application/json"
                  }
              },
              "city": "Moscow",
              "street": "Tverskaya street",
              "house": "1",
              "apartment": "123",
              "addInfo": "addinfo",
              "comment": "some words about address"
          },
          "actualAddressFull": {
              "postalCode": "125009",
              "country": {
                  "meta": {
                      "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
                      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
                      "type": "country",
                      "mediaType": "application/json"
                  }
              },
              "region": {
                  "meta": {
                      "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
                      "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
                      "type": "region",
                      "mediaType": "application/json"
                  }
              },
              "city": "Moscow",
              "street": "Tverskaya street",
              "house": "1",
              "apartment": "111",
              "addInfo": "addinfo",
              "comment": "some words about address"
          },
          "mod__requisites__in":{
            "pan": "87654321"
          },
          "tags": [
              "Vegetables",
              "Food",
              "Delivery"
          ],
          "attributes": [
              {
                  "meta": {
                      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/attributes/0d129ff5-2c8c-11e6-8a84-bae5000000f3",
                      "type": "attributemetadata",
                      "mediaType": "application/json"
                  },
                  "name": "AttributeName1",
                  "type": "double",
                  "value": 0.75
              },
              {
                  "meta": {
                      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/attributes/0d12a9a5-2c8c-11e6-8a84-bae5000000f4",
                      "type": "attributemetadata",
                      "mediaType": "application/json"
                  },
                  "name": "AttributeName2",
                  "type": "time",
                  "value": "2016-06-07 12:52:33"
              },
              {
                  "meta": {
                      "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/attributes/0d12b1e7-2c8c-11e6-8a84-bae5000000f5",
                      "type": "attributemetadata",
                      "mediaType": "application/json"
                  },
                  "name": "AttributeName3",
                  "type": "boolean",
                  "value": false
              }
          ],
          "state": {
              "meta": {
                  "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
                  "type": "state",
                  "mediaType": "application/json"
              }
          }
      }'
```

> Response 200. Successful request. The result is a JSON representation of the created Counterparty.

```json
{
   "meta":{
     "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/88fc07ac-2c8d-11e6-8a84-bae500000050",
     "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
     "type":"counterparty",
     "mediaType":"application/json"
   },
   "id":"88fc07ac-2c8d-11e6-8a84-bae500000050",
   "accountId":"6270cd18-2c7f-11e6-8a84-bae500000001",
   "owner":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type":"employee",
       "mediaType":"application/json"
     }
   },
   "shared": false,
   "group":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type":"group",
       "mediaType":"application/json"
     }
   },
   "updated":"2016-06-07 11:55:08",
   "name":"Vegetable Express LLC",
   "description":"Vegetable Delivery Network",
   "code":"ovoshexpressCode",
   "externalCode":"extVagetable",
   "companyType": "legalIN",
   "archived": false,
   "created":"2007-02-07 17:16:41",
   "legalTitle":"Limited Liability Company \"Vegetable Express\"",
   "legalAddress":"125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
   "legalAddressFull":{
     "postalCode":"125009",
     "country":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type":"country",
         "mediaType":"application/json"
       }
     },
     "region":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type":"region",
         "mediaType":"application/json"
       }
     },
     "city":"Moscow",
     "street": "Tverskaya street",
     "house":"1",
     "apartment":"123",
     "addInfo":"addinfo",
     "comment":"some words about address"
   },
   "actualAddress":"125009, Russia, Moscow, Moscow, Tverskaya st., 1, 111, addInfo",
   "actualAddressFull":{
     "postalCode":"125009",
     "country":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type":"country",
         "mediaType":"application/json"
       }
     },
     "region":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type":"region",
         "mediaType":"application/json"
       }
     },
     "city":"Moscow",
     "street": "Tverskaya street",
     "house":"1",
     "apartment":"111",
     "addInfo":"addinfo",
     "comment":"some words about address"
   },
   "mod__requisites__in":{
     "pan": "87654321"
   },
   "email":"ovosh@delivery.ru",
   "phone":"+7 495 662 12 23",
   "fax":"1052034",
   "attributes":[
     {
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/attributes/0d129ff5-2c8c-11e6-8a84-bae5000000f3",
         "type":"attributemetadata",
         "mediaType":"application/json"
       },
       "id":"0d129ff5-2c8c-11e6-8a84-bae5000000f3",
       "name":"AttributeName1",
       "type":"double",
       "value":0.75
     },
     {
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/attributes/0d12a9a5-2c8c-11e6-8a84-bae5000000f4",
         "type":"attributemetadata",
         "mediaType":"application/json"
       },
       "id":"0d12a9a5-2c8c-11e6-8a84-bae5000000f4",
       "name":"AttributeName2",
       "type":"time",
       "value":"2016-06-07 12:52:33"
     },
     {
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/attributes/0d12b1e7-2c8c-11e6-8a84-bae5000000f5",
         "type":"attributemetadata",
         "mediaType":"application/json"
       },
       "id":"0d12b1e7-2c8c-11e6-8a84-bae5000000f5",
       "name":"AttributeName3",
       "type":"boolean",
       "value": false
     }
   ],
   "accounts":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/88fc07ac-2c8d-11e6-8a84-bae500000050/accounts",
       "type":"account",
       "mediaType":"application/json",
       "size":0,
       "limit":1000,
       "offset":0
     }
   },
   "tags":[
     "delivery",
     "food",
     "vegetables"
   ],
   "contactpersons":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/88fc07ac-2c8d-11e6-8a84-bae500000050/contactpersons",
       "type":"contactperson",
       "mediaType":"application/json",
       "size":0,
       "limit":1000,
       "offset":0
     }
   },
   "notes":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/88fc07ac-2c8d-11e6-8a84-bae500000050/notes",
       "type":"note",
       "mediaType":"application/json",
       "size":0,
       "limit":1000,
       "offset":0
     }
   },
   "state":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
       "type":"state",
       "mediaType":"application/json"
     }
   }
}
```

### Bulk creation and update of Counterparties

> Bulk creation and update of Counterparties

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/counterparty"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
        {
            "name": "OOO Rainbow",
            "description": "Building materials chain Raduga EXPO",
            "code": "rainbowCode",
            "externalCode": "extRainbw",
            "companyType": "legalIN",
            "email": "raduga@stroi.ru",
            "phone": "+7 495 331 22 33",
            "fax": "1257752",
            "actualAddress": "Moscow, Academician Mil street, 15/21",
            "legalTitle": "Limited Liability Company \"Rainbow\"",
            "legalAddress": "Moscow, Aviastroiteley street 93/12",
            "mod__requisites__in":{
              "pan": "125152124152"
            },
            "tags": [
                "Builders",
                "Rainbow",
                "Repair"
            ],
            "state": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
                    "type": "state",
                    "mediaType": "application/json"
                }
            },
            "priceType": {
                "meta": {
                    "href": "https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
                    "type": "pricetype",
                    "mediaType": "application/json"
                }
            }
        },
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/6a9c3857-2c8b-11e6-8a84-bae500000047",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                "type": "counterparty",
                "mediaType": "application/json"
            },
            "name": "Raduga EXPO LLC",
            "description": "Network of building materials markets Raduga EXPO",
            "code": "rainbow",
            "externalCode": "extRainbow",
            "companyType": "legalIN",
            "email": "raduga@retail.ru",
            "phone": "+7 495 162 32 23",
            "fax": "1052054",
            "actualAddress": "Moscow, Stroiteley st. 331",
            "legalTitle": "Limited Liability Company \"Rainbow EXPO\"",
            "legalAddress": "Moscow, Chernorabochego street 93/12",
            "mod__requisites__in":{
              "pan": "87654321"
            },
            "tags": [
                "Builders",
                "Repair",
                "Rainbow",
                "Concrete",
                "BURN"
            ]
        }
      ]'
```

> Response 200. Successful request. The result is a JSON array of representations of created and updated Accounts.

```json
[
   {
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000",
       "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type":"counterparty",
       "mediaType":"application/json"
     },
     "id":"b80ea81b-7058-11e6-8a84-bae500000000",
     "accountId":"1185513e-692c-11e6-8a84-bae500000001",
     "owner":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/employee/12747f9e-692c-11e6-8a84-bae50000002a",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
         "type":"employee",
         "mediaType":"application/json"
       }
     },
     "shared": false,
     "group":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/group/11883c67-692c-11e6-8a84-bae500000002",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/group/metadata",
         "type":"group",
         "mediaType":"application/json"
       }
     },
     "updated":"2016-09-01 18:28:22",
     "name":"OOO Rainbow",
     "externalCode":"o7732zkki541HDkZZD1Yt3",
     "archived": false,
     "companyType":"legalIN",
     "accounts":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000/accounts",
         "type":"account",
         "mediaType":"application/json",
         "size":0,
         "limit":1000,
         "offset":0
       }
     },
     "tags":[

     ],
     "contactpersons":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000/contactpersons",
         "type":"contactperson",
         "mediaType":"application/json",
         "size":0,
         "limit":1000,
         "offset":0
       }
     },
     "notes":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000/notes",
         "type":"note",
         "mediaType":"application/json",
         "size":0,
         "limit":1000,
         "offset":0
       }
     },
     "state":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
         "type":"state",
         "mediaType":"application/json"
       }
     },
     "priceType":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
         "type":"pricetype",
         "mediaType":"application/json"
       }
     }
   },
   {
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/6a9c3857-2c8b-11e6-8a84-bae500000047",
       "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type":"counterparty",
       "mediaType":"application/json"
     },
     "id":"6a9c3857-2c8b-11e6-8a84-bae500000047",
     "accountId":"6270cd18-2c7f-11e6-8a84-bae500000001",
     "owner":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
         "type":"employee",
         "mediaType":"application/json"
       }
     },
     "shared": false,
     "group":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/group/metadata",
         "type":"group",
         "mediaType":"application/json"
       }
     },
     "updated":"2016-06-07 12:13:31",
     "name":"Raduga EXPO LLC",
     "description":"Network of building materials markets Raduga EXPO",
     "code":"rainbow",
     "externalCode":"extRainbow",
     "companyType": "legalIN",
     "archived": false,
     "created":"2007-02-07 17:16:41",
     "legalTitle":"Limited Liability Company \"Rainbow EXPO\"",
     "legalAddress": "Moscow, Chernorabochego street 93/12",
     "actualAddress": "Moscow, Stroiteley st. 331",
     "mod__requisites__in":{
       "pan": "87654321"
     },
     "email": "raduga@retail.ru",
     "phone":"+7 495 162 32 23",
     "fax":"1052054",
     "accounts":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/6a9c3857-2c8b-11e6-8a84-bae500000047/accounts",
         "type":"account",
         "mediaType":"application/json",
         "size":0,
         "limit":1000,
         "offset":0
       }
     },
     "tags":[
       "burning",
       "builders",
       "concrete",
       "repair",
       "rainbow"
     ],
     "contactpersons":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/6a9c3857-2c8b-11e6-8a84-bae500000047/contactpersons",
         "type":"contactperson",
         "mediaType":"application/json",
         "size":0,
         "limit":1000,
         "offset":0
       }
     },
     "notes":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/6a9c3857-2c8b-11e6-8a84-bae500000047/notes",
         "type":"note",
         "mediaType":"application/json",
         "size":0,
         "limit":1000,
         "offset":0
       }
     }
   }
]
```

[Bulk creation and update](../#kladana-json-api-general-info-create-and-update-multiple-objects) of Counterparties.
In the body of the request, you need to pass an array containing the JSON representation of the Accounts that you want to create or update.
Updated Counterparties must contain the identifier in the form of metadata.

### Delete Counterparty

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b1*. Counterparty ID |

> Request to delete the Counterparty with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200. Successful deletion of the Account.

### Bulk deletion of Counterparties

In the body of the request, you need to pass an array containing JSON metadata of the Counterparties that you want to delete.


> Request for bulk deletion of Counterparties.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/delete"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d'[
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b1",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                "type": "counterparty",
                "mediaType": "application/json"
            }
        },
        {
            "meta": {
                "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b2",
                "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
                "type": "counterparty",
                "mediaType": "application/json"
            }
        }
      ]'
```

> Successful request. Result - JSON information about deleting Counterparties.

```json
[
   {
     "info":"Entity 'counterparty' with UUID: 7944ef04-f831-11e5-7a69-971500188b1 successfully deleted"
   },
   {
     "info":"Entity 'counterparty' with UUID: 7944ef04-f831-11e5-7a69-971500188b2 successfully deleted"
   }
]
```

### Metadata of Counterparties
#### Metadata of Counterparties

> Request for obtaining metadata of Counterparties.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Successful request. The result is a JSON representation of the additional Counterparty fields.

```json
{
   "meta":{
     "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
     "mediaType":"application/json"
   },
   "attributes":[
     {
       "id":"5290a290-0313-11e6-9464-e4de00000020",
       "name":"AttributeName1",
       "type":"boolean",
       "required": false
     }
   ],
   "state":[
     {
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
         "type":"state",
         "mediaType":"application/json"
       },
       "id":"fb56c504-2e58-11e6-8a84-bae500000069",
       "accountId":"f976ed28-2e58-11e6-8a84-bae500000001",
       "name":"New",
       "color":15106326,
       "stateType":"Regular",
       "entityType":"counterparty"
     },
     {
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/fb56cae3-2e58-11e6-8a84-bae50000006a",
         "type":"state",
         "mediaType":"application/json"
       },
       "id":"fb56cae3-2e58-11e6-8a84-bae50000006a",
       "accountId":"f976ed28-2e58-11e6-8a84-bae500000001",
       "name":"Confirmed",
       "color":40931,
       "stateType":"Regular",
       "entityType":"counterparty"
     }
   ],
   "tags":[
     "Suppliers",
     "Buyers"
   ],
   "createShared": false
}
```

Request for obtaining metadata of Counterparties. The result is a JSON object including:

| Parameter | Description |
| ----- | ------ |
| **meta** | Link to metadata of Counterparties |
| **attributes** | Array of objects additional fields of Accounts in the format [Metadata](../#kladana-json-api-general-info-metadata) |
| **states** | Array of Counterparties statuses |
| **createShared** | create new Counterparties with the label "General" |

The structure of a separate object representing the additional the field is described in detail in the section [Working with additional fields](../#kladana-json-api-general-info-additional-fields).

### Separate additional field
 

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **id** | `string` (required) *Example: 5290a290-0313-11e6-9464-e4de00000020* - Fields ID. |

> Request for information on a separate additional field.

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/attributes/5290a290-0313-11e6-9464-e4de00000020"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

>Response 200(application/json). Successful request. The result is a JSON representation of a separate additional fields.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/attributes/5290a290-0313-11e6-9464-e4de00000020",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "5290a290-0313-11e6-9464-e4de00000020",
   "name": "AttributeName1",
   "type": "boolean",
   "required": false
}
```

### Counterparty
### Get Counterparty

The counterparty, which is accessed by the value of its id.

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - Counterparty id. |

> Example 1

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json). The result is a JSON representation of the Counterparty with the specified id.

```json
{
   "meta":{
     "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000",
     "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
     "type":"counterparty",
     "mediaType":"application/json"
   },
   "id":"b80ea81b-7058-11e6-8a84-bae500000000",
   "accountId":"1185513e-692c-11e6-8a84-bae500000001",
   "owner":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/employee/12747f9e-692c-11e6-8a84-bae50000002a",
       "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type":"employee",
       "mediaType":"application/json"
     }
   },
   "shared": false,
   "group":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/group/11883c67-692c-11e6-8a84-bae500000002",
       "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type":"group",
       "mediaType":"application/json"
     }
   },
   "updated":"2016-09-01 18:28:22",
   "name":"OOO Rainbow",
   "externalCode":"o7732zkki541HDkZZD1Yt3",
   "archived": false,
   "created":"2007-02-07 17:16:41",
   "companyType":"legalIN",
   "accounts":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000/accounts",
       "type":"account",
       "mediaType":"application/json",
       "size":0,
       "limit":1000,
       "offset":0
     }
   },
   "tags":[

   ],
   "contactpersons":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000/contactpersons",
       "type":"contactperson",
       "mediaType":"application/json",
       "size":0,
       "limit":1000,
       "offset":0
     }
   },
   "notes":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000/notes",
       "type":"note",
       "mediaType":"application/json",
       "size":0,
       "limit":1000,
       "offset":0
     }
   },
   "state":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/states/fb56c504-2e58-11e6-8a84-bae500000069",
       "type":"state",
       "mediaType":"application/json"
     }
   },
   "salesAmount":0,
   "priceType":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f2222",
       "type":"pricetype",
       "mediaType":"application/json"
     },
     "id":"672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
     "name":"Sale price",
     "externalCode":"cbcf493b-55bc-11d9-848a-00112f43529a"
   },
   "legalAddress":"125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
   "legalAddressFull":{
     "postalCode":"125009",
     "country":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type":"country",
         "mediaType":"application/json"
       }
     },
     "region":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type":"region",
         "mediaType":"application/json"
       }
     },
     "city":"Moscow",
     "street": "Tverskaya street",
     "house":"1",
     "apartment":"123",
     "addInfo":"addinfo",
     "comment":"some words about address"
   },
   "actualAddress":"125009, Russia, Moscow, Moscow, Tverskaya st., 1, 111, addInfo",
   "actualAddressFull":{
     "postalCode":"125009",
     "country":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type":"country",
         "mediaType":"application/json"
       }
     },
     "region":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type":"region",
         "mediaType":"application/json"
       }
     },
     "city":"Moscow",
     "street": "Tverskaya street",
     "house":"1",
     "apartment":"111",
     "addInfo":"addinfo",
     "comment":"some words about address"
   },
   "bonusProgram": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/129626ee-ac91-11e9-ac12-000d00000009",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/bonusprogram/metadata",
       "type": "bonusprogram",
       "mediaType": "application/json",
       "uuidHref": "https://app.kladana.com/app/#discount/edit?id=129626ee-ac91-11e9-ac12-000d00000009"
     }
   },
   "bonusPoints": 0
}
```


### Change Account
#### Description


The view of the Account with the specified ID is updated.
In the request body, you can specify only those fields that need to be changed for the Counterparty, except for those that
are marked `Read only` in the description of [Account attributes](../dictionaries/#entities-counterparty).
Fields that were not specified in the request JSON are not changed.
The **account** and **contactpersons** fields are updated as members of nested collections. When updating,
the passed data elements of the collections are treated as "All elements of this collection" and completely replace
elements previously present in it.

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - Counterparty ID. |

> Example

```shell
curl -X PUT
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
     -d '{
            "name": "Raduga EXPO LLC",
            "description": "Network of building materials markets Raduga EXPO",
            "code": "rainbow",
            "externalCode": "extRainbow",
            "email": "raduga@retail.ru",
            "phone": "+7 495 162 32 23",
            "fax": "1052054",
            "legalTitle": "Limited Liability Company \"Rainbow EXPO\"",
            "legalAddressFull": {
                "postalCode": "125009",
                "country": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
                        "type": "country",
                        "mediaType": "application/json"
                    }
                },
                "region": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
                        "type": "region",
                        "mediaType": "application/json"
                    }
                },
                "city": "Moscow",
                "street": "Tverskaya street",
                "house": "1",
                "apartment": "123",
                "addInfo": "addinfo",
                "comment": "some words about address"
            },
            "actualAddressFull": {
                "postalCode": "125009",
                "country": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/country/metadata",
                        "type": "country",
                        "mediaType": "application/json"
                    }
                },
                "region": {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
                        "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/region/metadata",
                        "type": "region",
                        "mediaType": "application/json"
                    }
                },
                "city": "Moscow",
                "street": "Tverskaya street",
                "house": "1",
                "apartment": "111",
                "addInfo": "addinfo",
                "comment": "some words about address"
            },
            "mod__requisites__in":{
              "pan": "1251581244152"
            },
            "tags": [
                "Builders",
                "Repair",
                "Rainbow",
                "Concrete",
                "BURN"
            ]
        }'
```

> Response 200 (application/json) Successful update. The result is a JSON representation of the updated Counterparty.

```json
{
   "meta":{
     "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/6a9c3857-2c8b-11e6-8a84-bae500000047",
     "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
     "type":"counterparty",
     "mediaType":"application/json"
   },
   "id":"6a9c3857-2c8b-11e6-8a84-bae500000047",
   "accountId":"6270cd18-2c7f-11e6-8a84-bae500000001",
   "owner":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type":"employee",
       "mediaType":"application/json"
     }
   },
   "shared": false,
   "group":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type":"group",
       "mediaType":"application/json"
     }
   },
   "updated":"2016-06-07 12:13:31",
   "name":"Raduga EXPO LLC",
   "description":"Network of building materials markets Raduga EXPO",
   "code":"rainbow",
   "externalCode":"extRainbow",
   "archived": false,
   "created":"2007-02-07 17:16:41",
   "legalTitle":"Limited Liability Company \"Rainbow EXPO\"",
   "legalAddress":"125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
   "legalAddressFull":{
     "postalCode":"125009",
     "country":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type":"country",
         "mediaType":"application/json"
       }
     },
     "region":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type":"region",
         "mediaType":"application/json"
       }
     },
     "city":"Moscow",
     "street": "Tverskaya street",
     "house":"1",
     "apartment":"123",
     "addInfo":"addinfo",
     "comment":"some words about address"
   },
   "actualAddress":"125009, Russia, Moscow, Moscow, Tverskaya st., 1, 111, addInfo",
   "actualAddressFull":{
     "postalCode":"125009",
     "country":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type":"country",
         "mediaType":"application/json"
       }
     },
     "region":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type":"region",
         "mediaType":"application/json"
       }
     },
     "city":"Moscow",
     "street": "Tverskaya street",
     "house":"1",
     "apartment":"111",
     "addInfo":"addinfo",
     "comment":"some words about address"
   },
   "mod__requisites__in":{
     "pan": "1251581244152"
   },
   "email": "raduga@retail.ru",
   "phone":"+7 495 162 32 23",
   "fax":"1052054",
   "accounts":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/6a9c3857-2c8b-11e6-8a84-bae500000047/accounts",
       "type":"account",
       "mediaType":"application/json",
       "size":0,
       "limit":1000,
       "offset":0
     }
   },
   "tags":[
     "burning",
     "builders",
     "concrete",
     "repair",
     "rainbow"
   ],
   "contactpersons":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/6a9c3857-2c8b-11e6-8a84-bae500000047/contactpersons",
       "type":"contactperson",
       "mediaType":"application/json",
       "size":0,
       "limit":1000,
       "offset":0
     }
   },
   "notes":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/6a9c3857-2c8b-11e6-8a84-bae500000047/notes",
       "type":"note",
       "mediaType":"application/json",
       "size":0,
       "limit":1000,
       "offset":0
     }
   }
}
```

> Example with additional fields

```shell
curl -X PUT
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
     -d'{
            "name": "Vegetable Express LLC",
            "description": "Vegetable express delivery network",
            "code": "ovoshexpresscode",
            "externalCode": "externalVagetable",
            "email": "ovoshi@delivery.ru",
            "phone": "+7 495 162 12 23",
            "fax": "1052014",
            "legalTitle": "Limited Liability Company \"Vegetable Express\"",
            "mod__requisites__in":{
              "pan": "1251581244152"
            },
            "tags": [
                "Vegetables",
                "Food",
                "Delivery",
                "Express",
                "Edovozy"
            ],
            "contactpersons": [
                {
                    "name": "Vasya",
                    "description": "Vegetable cutter Vasya",
                    "position": "Vegetable cutter"
                },
                {
                    "name": "Petya",
                    "position": "Vegetable carrier"
                }
            ],
            "accounts": [
                {
                    "isDefault": true,
                    "accountNumber": "12512568161257981",
                    "bankName": "JSC Sberbank",
                    "bankLocation": "Moscow, Vavilova 19",
                    "correspondentAccount": "375632785587",
                    "bic": "1234532"
                },
                {
                    "accountNumber": "12512568161257982",
                    "bankName": "VTB",
                    "bic": "7654352"
                }
            ],
            "attributes": [
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/attributes/0d129ff5-2c8c-11e6-8a84-bae5000000f3",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "name": "AttributeName1",
                    "type": "double",
                    "value": 0.35
                },
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/attributes/0d12a9a5-2c8c-11e6-8a84-bae5000000f4",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "name": "AttributeName2",
                    "type": "time",
                    "value": "2016-06-07 10:52:33"
                },
                {
                    "meta": {
                        "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/attributes/0d12b1e7-2c8c-11e6-8a84-bae5000000f5",
                        "type": "attributemetadata",
                        "mediaType": "application/json"
                    },
                    "name": "AttributeName3",
                    "type": "boolean",
                    "value": true
                }
            ]
        }'
```

> Response 200(application/json). Successful update. The result is a JSON representation of the updated Counterparty.

```json
{
   "meta":{
     "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/88fc07ac-2c8d-11e6-8a84-bae500000050",
     "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
     "type":"counterparty",
     "mediaType":"application/json"
   },
   "id":"88fc07ac-2c8d-11e6-8a84-bae500000050",
   "accountId":"6270cd18-2c7f-11e6-8a84-bae500000001",
   "owner":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/employee/faba7f37-2e58-11e6-8a84-bae500000028",
       "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type":"employee",
       "mediaType":"application/json"
     }
   },
   "shared": false,
   "group":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/group/f97aa1fb-2e58-11e6-8a84-bae500000002",
       "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/group/metadata",
       "type":"group",
       "mediaType":"application/json"
     }
   },
   "updated":"2016-06-07 12:08:25",
   "name":"Vegetable Express LLC",
   "description":"Vegetable express delivery network",
   "code":"ovoshexpresscode",
   "externalCode":"externalVagetable",
   "archived": false,
   "created":"2007-02-07 17:16:41",
   "legalTitle":"Limited Liability Company \"Vegetable Express\"",
   "legalAddress":"125009, Russia, Moscow, Moscow, Tverskaya st., 1, 123, addInfo",
   "legalAddressFull":{
     "postalCode":"125009",
     "country":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type":"country",
         "mediaType":"application/json"
       }
     },
     "region":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type":"region",
         "mediaType":"application/json"
       }
     },
     "city":"Moscow",
     "street": "Tverskaya street",
     "house":"1",
     "apartment":"123",
     "addInfo":"addinfo",
     "comment":"some words about address"
   },
   "actualAddress":"125009, Russia, Moscow, Moscow, Tverskaya st., 1, 111, addInfo",
   "actualAddressFull":{
     "postalCode":"125009",
     "country":{
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/country/9df7c2c3-7782-4c5c-a8ed-1102af611608",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/country/metadata",
         "type":"country",
         "mediaType":"application/json"
       }
     },
     "region":{
       "meta":{"href":"https://api.kladana.com/api/remap/1.2/entity/region/00000000-0000-0000-0000-000000000077",
         "metadataHref":"https://api.kladana.com/api/remap/1.2/entity/region/metadata",
         "type":"region",
         "mediaType":"application/json"
       }
     },
     "city":"Moscow",
     "street": "Tverskaya street",
     "house":"1",
     "apartment":"111",
     "addInfo":"addinfo",
     "comment":"some words about address"
   },
   "mod__requisites__in":{
     "pan": "1251581244152"
   },
   "email": "ovoshi@delivery.ru",
   "phone":"+7 495 162 12 23",
   "fax":"1052014",
   "attributes":[
     {
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/attributes/0d129ff5-2c8c-11e6-8a84-bae5000000f3",
         "type":"attributemetadata",
         "mediaType":"application/json"
       },
       "id":"0d129ff5-2c8c-11e6-8a84-bae5000000f3",
       "name":"AttributeName1",
       "type":"double",
       "value":0.35
     },
     {
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/attributes/0d12a9a5-2c8c-11e6-8a84-bae5000000f4",
         "type":"attributemetadata",
         "mediaType":"application/json"
       },
       "id":"0d12a9a5-2c8c-11e6-8a84-bae5000000f4",
       "name":"AttributeName2",
       "type":"time",
       "value":"2016-06-07 10:52:33"
     },
     {
       "meta":{
         "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata/attributes/0d12b1e7-2c8c-11e6-8a84-bae5000000f5",
         "type":"attributemetadata",
         "mediaType":"application/json"
       },
       "id":"0d12b1e7-2c8c-11e6-8a84-bae5000000f5",
       "name":"AttributeName3",
       "type":"boolean",
       "value": true
     }
   ],
   "accounts":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/88fc07ac-2c8d-11e6-8a84-bae500000050/accounts",
       "type":"account",
       "mediaType":"application/json",
       "size":2,
       "limit":1000,
       "offset":0
     }
   },
   "tags":[
     "vegetables",
     "delivery",
     "food",
     "food carriers",
     "express"
   ],
   "contactpersons":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/ee15550e-2c9e-11e6-8a84-bae500000003/contactpersons",
       "type":"contactperson",
       "mediaType":"application/json",
       "size":2,
       "limit":1000,
       "offset":0
     }
   },
   "notes":{
     "meta":{
       "href":"https://api.kladana.com/api/remap/1.2/entity/counterparty/ee15550e-2c9e-11e6-8a84-bae500000003/notes",
       "type":"note",
       "mediaType":"application/json",
       "size":0,
       "limit":1000,
       "offset":0
     }
   }
}
```

### Counterparty Accounts
### Get Counterparty Accounts

List of accounts of the Counterparty with the specified ID.

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - Counterparty ID. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* - The maximum number of entities to retrieve. `Allowed values are 1 - 1000` |
| **offset** | `number` (optional) **Default: 0** *Example: 40* - Indent in the output list of entities. |

> Get Counterparty invoices

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b19/accounts"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json). Returns an array of JSON representations of accounts of the Counterparty.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/6a9c3857-2c8b-11e6-8a84-bae500000047/accounts",
     "type": "account",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/6a9c3857-2c8b-11e6-8a84-bae500000047/accounts/04c5d0dc-2c92-11e6-8a84-bae5000000f6",
         "type": "account",
         "mediaType": "application/json"
       },
       "id": "04c5d0dc-2c92-11e6-8a84-bae5000000f6",
       "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
       "updated": "2016-06-07 12:27:13",
       "isDefault": false,
       "accountNumber": "125917666032321985647",
       "bankName": "VTB",
       "bankLocation": "Sakharovsky street 153",
       "correspondentAccount": "12512578256712",
       "bic": "1258617"
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/6a9c3857-2c8b-11e6-8a84-bae500000047/accounts/6a9c43ce-2c8b-11e6-8a84-bae500000048",
         "type": "account",
         "mediaType": "application/json"
       },
       "id": "6a9c43ce-2c8b-11e6-8a84-bae500000048",
       "accountId": "6270cd18-2c7f-11e6-8a84-bae500000001",
       "updated": "2016-06-07 11:39:58",
       "isDefault": true,
       "accountNumber": "236174374372272747234743274",
       "bankName": "JSC Sberbank",
       "bankLocation": "Vaivlov street 19",
       "correspondentAccount": "251632427568",
       "bic": "125125125"
     }
   ]
}
```

### Counterparty Account

**Parameters**

| Parameter | Description |
| --------- | ----------- |
| **accountId** | `string` (required) (required) *Example: 7944ef04-f831-11e5-7a69-971500188b18* - Account ID. |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - Counterparty ID. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to retrieve. `Possible values ​​are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indentation in the returned list of entities. |

### Get Counterparty Account

> Get an account Counterparty

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b19/accounts/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json). Returns a JSON representation of the Counterparty's account.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/ee15550e-2c9e-11e6-8a84-bae500000003/accounts/a6aa5466-2ca2-11e6-8a84-bae500000017",
     "type": "account",
     "mediaType": "application/json"
   },
   "id": "a6aa5466-2ca2-11e6-8a84-bae500000017",
   "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
   "updated": "2016-06-07 14:26:17",
   "isDefault": false,
   "accountNumber": "12512568161257982",
   "bankName": "VTB",
   "bic": "7654352"
}
```

### Create Counterparty Account

Create a Counterparty account with the specified ID.

**Parameters**

| Parameter | Description |
| --------- | ------------- |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - Counterparty ID. |

> Example of a request to create a Counterparty account.

```shell
curl -X POST
  "https://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b19/accounts"
  -H "Authorization: Basic <Credentials>"
  -H "Accept-Encoding: gzip"
  -H "Content-Type: application/json"
    -d '{
          "accountNumber": "86686868768768757656876876"
        }'  
```

> Response 200 (application/json). Successful creation.

```json
[
  {
    "meta": {
      "href": "http://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b19/accounts/7944ef04-f831-11e5-7a69-971500188b18",
      "type": "account",
      "mediaType": "application/json"
    },
    "id": "7944ef04-f831-11e5-7a69-971500188b18",
    "accountId": "4615c8f6-0e7b-11e2-06e0-3c4a92f3a0a7",
    "updated": "2024-01-22 17:57:54.558",
    "isDefault": false,
    "accountNumber": "86686868768768757656876876"
  }
]
```

### Change Counterparty account

**Parameters**

| Parameter | Description |
|---------- | ----------- |
| **accountId** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b18* - Account ID. |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - Counterparty ID. |

#### Description

Update the Counterparty account with the specified ID. Fields that were not specified in the JSON request are not changed.

> Example of a request to update a Counterparty account.

  ```shell
  curl -X PUT
    "https://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b19/accounts/7944ef04-f831-11e5-7a69-971500188b18"
    -H "Authorization: Basic <Credentials>"
    -H "Accept-Encoding: gzip"
    -H "Content-Type: application/json"
      -d '{
            "accountNumber": "86686868768768757656876876",
            "isDefault": false,
            "bankLocation": "Moscow",
            "bankName": "Bank",
            "bic": "1005002good",
            "correspondentAccount": "good200"
        }'  
  ```

> Response 200 (application/json). Successful update.

```json
{
  "meta": {
    "href": "http://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b19/accounts/7944ef04-f831-11e5-7a69-971500188b18",
    "type": "account",
    "mediaType": "application/json"
  },
  "id": "7944ef04-f831-11e5-7a69-971500188b18",
  "accountId": "4615c8f6-0e7b-11e2-06e0-3c4a92f3a0a7",
  "updated": "2024-01-22 17:57:54.558",
  "isDefault": false,
  "accountNumber": "86686868768768757656876876",
  "bankName": "Bank",
  "bankLocation": "Moscow",
  "correspondentAccount": "good200",
  "bic": "1005002good"
}
```

### Counterparty Contact persons

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - Counterparty ID. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

### List of contact persons

> List of contact persons

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b19/contactpersons"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json). Returns an array of JSON representations of the contact persons of the Counterparty.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000/contactpersons",
     "type": "contactperson",
     "mediaType": "application/json",
     "size": 3,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000/contactpersons/43e39375-7059-11e6-8a84-bae5000000cb",
         "type": "contactperson",
         "mediaType": "application/json"
       },
       "id": "43e39375-7059-11e6-8a84-bae5000000cb",
       "accountId": "1185513e-692c-11e6-8a84-bae500000001",
       "updated": "2016-09-01 18:32:17",
       "name": "Lawyers PetrSergeevich",
       "description": "Lawyer",
       "externalCode": "asI0ncJch5jkgxxlCQKiH1",
       "email": "advopetr@mail.ru",
       "phone": "87127418",
       "position": "Lawyer",
       "agent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000/contactpersons/308142fc-7059-11e6-8a84-bae5000000c6",
         "type": "contactperson",
         "mediaType": "application/json"
       },
       "id": "308142fc-7059-11e6-8a84-bae5000000c6",
       "accountId": "1185513e-692c-11e6-8a84-bae500000001",
       "updated": "2016-09-01 18:31:44",
       "name": "Travolta Jehn",
       "description": "Travolta in touch",
       "externalCode": "9QZNh3dbiLu1-V9bmmLKu0",
       "email": "travolta@mail.ru",
       "phone": "125815120",
       "position": "Secretary",
       "agent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000/contactpersons/13af74bf-7059-11e6-8a84-bae5000000c3",
         "type": "contactperson",
         "mediaType": "application/json"
       },
       "id": "13af74bf-7059-11e6-8a84-bae5000000c3",
       "accountId": "1185513e-692c-11e6-8a84-bae500000001",
       "updated": "2016-09-01 18:30:56",
       "name": "Panin Alexey Olegovich",
       "description": "Accounting",
       "externalCode": "Gaizui5siLqoUbZ3jpE2I2",
       "email": "mail@mail.rq",
       "phone": "12412512512",
       "position": "Accountant",
       "agent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/b80ea81b-7058-11e6-8a84-bae500000000",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       }
     }
   ]
}
```

### Create a contact person
Create a contact person of the Counterparty with the specified id.

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - Counterparty id. |

> An example of a request to create a contact person for the Counterparty.

```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b19/contactpersons"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
     -d '{
           "name": "Peter",
           "code": "Petya the deliverer",
           "externalCode": "-odJxBw7i06O0GhSc28S90",
           "email": "petr@ovoshy.com",
           "phone": "+777 666 228",
           "position": "vegetable vendor"
         }'
```
> Response 200(application/json). Successful creation.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b19/contactpersons/ceba215c-d5cb-11e7-0532-9eed00000005",
       "type": "contactperson",
       "mediaType": "application/json"
     },
     "id": "ceba215c-d5cb-11e7-0532-9eed00000005",
     "accountId": "eb9ac8c0-d511-11e7-0532-9eed00000001",
     "updated": "2017-11-30 15:41:38",
     "name": "Peter",
     "code": "Petya the deliverer",
     "externalCode": "-odJxBw7i06O0GhSc28S90",
     "email": "petr@ovoshy.com",
     "phone": "+777 666 228",
     "position": "vegetable supplier",
     "agent": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b19",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
         "type": "counterparty",
         "mediaType": "application/json",
         "uuidHref": "https://app.kladana.com/app/#company/edit?id=7944ef04-f831-11e5-7a69-971500188b19"
       }
     }
   }
]
```

### The contact person

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **contactpersonId** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - ID of the contact person. |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - Counterparty id. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* The maximum number of entities to retrieve. `Allowed values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

### Get a contact person

> Get a contact person

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b19/contactpersons/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json). Returns a JSON representation of an individual contact person of the Account.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/ee15550e-2c9e-11e6-8a84-bae500000003/contactpersons/94433ed3-2c9f-11e6-8a84-bae500000010",
     "type": "contactperson",
     "mediaType": "application/json"
   },
   "id": "94433ed3-2c9f-11e6-8a84-bae500000010",
   "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
   "updated": "2016-06-07 14:04:17",
   "name": "Peter",
   "code": "Petya the deliverer",
   "externalCode": "-odJxBw7i06O0GhSc28S90",
   "email": "petr@ovoshy.com",
   "phone": "+777 666 228",
   "position": "vegetable supplier",
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/ee15550e-2c9e-11e6-8a84-bae500000003",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   }
}
```

### Change contact person

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **contactpersonId** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - contact id. |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - Counterparty id. |

#### Description

Update the contact person of the Counterparty with the specified id.
All fields specified in the request JSON object are updated, except for
marked `Read only` in the description of [attributes of the Counterparty's contact persons](../dictionaries/#entities-counterparty-counterparties-attributes-of-entity-address-contact-persons-of-counterparties).
Fields that were not specified in the request JSON are not changed.

> An example of a request to update the contact person of the Counterparty.
  
   ```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b19/contactpersons/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "name": "Peter",
             "code": "Petya the deliverer",
             "email": "petr@ovoshy.com",
             "phone": "+777 666 228",
             "position": "vegetable vendor"
           }'
   ```

> Response 200(application/json). Successful update.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/ee15550e-2c9e-11e6-8a84-bae500000003/contactpersons/94433ed3-2c9f-11e6-8a84-bae500000010",
     "type": "contactperson",
     "mediaType": "application/json"
   },
   "id": "94433ed3-2c9f-11e6-8a84-bae500000010",
   "accountId": "da7d9bbe-2c97-11e6-8a84-bae500000001",
   "updated": "2016-06-07 14:04:17",
   "name": "Peter",
   "code": "Petya the deliverer",
   "externalCode": "-odJxBw7i06O0GhSc28S90",
   "email": "petr@ovoshy.com",
   "phone": "+777 666 228",
   "position": "vegetable supplier",
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/ee15550e-2c9e-11e6-8a84-bae500000003",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   }
}
```

### Account incidents

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **id** | `string` (required) *Example: 67e5a691-3c9c-11e7-8af5-581e00000056* - Counterparty id. |
| **limit** | `number` (optional) **Default: 1000** *Example: 1000* Maximum number of entities to fetchii.` Valid values are 1 - 1000`. |
| **offset** | `number` (optional) **Default: 0** *Example: 40* Indent in the output list of entities. |

### List of incidents

> List of incidents

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/67e5a691-3c9c-11e7-8af5-581e00000056/notes"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json). Successful request.

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
     "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/67e5a691-3c9c-11e7-8af5-581e00000056/notes",
     "type": "note",
     "mediaType": "application/json",
     "size": 2,
     "limit": 1000,
     "offset": 0
   },
   "rows": [
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/67e5a691-3c9c-11e7-8af5-581e00000056/notes/7e391b16-3efd-11e7-8af5-581e0000009d",
         "type": "note",
         "mediaType": "application/json"
       },
       "id": "7e391b16-3efd-11e7-8af5-581e0000009d",
       "accountId": "b127966a-3efa-11e7-8af5-581e00000001",
       "created": "2017-05-22 17:46:52",
       "description": "second incident",
       "agent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/67e5a691-3c9c-11e7-8af5-581e00000056",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "author": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/employee/b1876a85-3efa-11e7-8af5-581e0000002a",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       }
     },
     {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/67e5a691-3c9c-11e7-8af5-581e00000056/notes/7b919056-3efd-11e7-8af5-581e0000009a",
         "type": "note",
         "mediaType": "application/json"
       },
       "id": "7b919056-3efd-11e7-8af5-581e0000009a",
       "accountId": "b127966a-3efa-11e7-8af5-581e00000001",
       "created": "2017-05-22 17:46:47",
       "description": "first incident",
       "agent": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/67e5a691-3c9c-11e7-8af5-581e00000056",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
           "type": "counterparty",
           "mediaType": "application/json"
         }
       },
       "author": {
         "meta": {
           "href": "https://api.kladana.com/api/remap/1.2/entity/employee/b1876a85-3efa-11e7-8af5-581e0000002a",
           "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
           "type": "employee",
           "mediaType": "application/json"
         }
       }
     }
   ]
}
```
### Add incident

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **id** | `string` (required) *Example: 67e5a691-3c9c-11e7-8af5-581e00000056* - Counterparty id. |

> Request to add a new incident.
  
```shell
curl -X POST
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/67e5a691-3c9c-11e7-8af5-581e00000056/notes"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
     -d '{
           "description": "text"
         }'
```

> Response 200(application/json). Successful request. The result is a JSON representation of the added incident.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/67e5a691-3c9c-11e7-8af5-581e00000056/notes/50b318cb-3cb0-11e7-8af5-581e00000007",
       "type": "note",
       "mediaType": "application/json"
     },
     "id": "50b318cb-3cb0-11e7-8af5-581e00000007",
     "accountId": "674f0d4f-3c9c-11e7-8af5-581e00000001",
     "created": "2017-05-19 19:29:22",
     "description": "text",
     "agent": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/67e5a691-3c9c-11e7-8af5-581e00000056",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
         "type": "counterparty",
         "mediaType": "application/json"
       }
     },
     "author": {
       "meta": {
         "href": "https://api.kladana.com/api/remap/1.2/entity/employee/67b86071-3c9c-11e7-8af5-581e0000002a",
         "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
         "type": "employee",
         "mediaType": "application/json"
       }
     }
   }
]
```

### Incident

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - Counterparty id. |
| **noteId** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - incident id. |

### Get an incident

> Get incident

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b19/notes/7944ef04-f831-11e5-7a69-971500188b19"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json). Returns a JSON representation of a single Account incident.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/67e5a691-3c9c-11e7-8af5-581e00000056/notes/50b318cb-3cb0-11e7-8af5-581e00000007",
     "type": "note",
     "mediaType": "application/json"
   },
   "id": "50b318cb-3cb0-11e7-8af5-581e00000007",
   "accountId": "674f0d4f-3c9c-11e7-8af5-581e00000001",
   "created": "2017-05-19 19:29:22",
   "description": "text",
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/67e5a691-3c9c-11e7-8af5-581e00000056",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "author": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/67b86071-3c9c-11e7-8af5-581e0000002a",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   }
}
```

### Edit incident
#### Description

Update the incident of the Account with the specified id.
All fields specified in the request JSON object are updated, except for
marked `Read-only` in the description of ['s incident attributes](../dictionaries/#entities-counterparty-counterparties-attributes-of-entity-address-account-incidents).
Fields that were not specified in the request JSON are not changed.

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - Counterparty id. |
| **noteId** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - incident id. |

> An example of a request to update an Account incident.

   ```shell
   curl -X PUT
     "https://api.kladana.com/api/remap/1.2/entity/counterparty/7944ef04-f831-11e5-7a69-971500188b19/notes/7944ef04-f831-11e5-7a69-971500188b19"
     -H "Authorization: Basic <Credentials>"
     -H "Accept-Encoding: gzip"
     -H "Content-Type: application/json"
       -d '{
             "description": "changed text"
           }'
   ```

> Response 200(application/json). Successful update.

```json
{
   "meta": {
     "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/67e5a691-3c9c-11e7-8af5-581e00000056/notes/50b318cb-3cb0-11e7-8af5-581e00000007",
     "type": "note",
     "mediaType": "application/json"
   },
   "id": "50b318cb-3cb0-11e7-8af5-581e00000007",
   "accountId": "674f0d4f-3c9c-11e7-8af5-581e00000001",
   "created": "2017-05-19 19:29:22",
   "description": "changed text",
   "agent": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/counterparty/67e5a691-3c9c-11e7-8af5-581e00000056",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/counterparty/metadata",
       "type": "counterparty",
       "mediaType": "application/json"
     }
   },
   "author": {
     "meta": {
       "href": "https://api.kladana.com/api/remap/1.2/entity/employee/67b86071-3c9c-11e7-8af5-581e0000002a",
       "metadataHref": "https://api.kladana.com/api/remap/1.2/entity/employee/metadata",
       "type": "employee",
       "mediaType": "application/json"
     }
   }
}
```

### Delete incident

**Parameters**

| Parameter | Description |
| ----- | ------ |
| **id** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - Counterparty id. |
| **noteId** | `string` (required) *Example: 7944ef04-f831-11e5-7a69-971500188b19* - incident id. |

> Request to delete an incident with the specified id.

```shell
curl -X DELETE
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/67e5a691-3c9c-11e7-8af5-581e00000056/notes/50b318cb-3cb0-11e7-8af5-581e00000007"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json). Successful deletion of the incidentincident.

### Counterparty directory settings

Using the JSON API, you can manage the settings of the counterparty directory.

#### Attributes of the counterparties directory settings

| Title | Type | Description |
| ----- | ------  | ------ |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Counterparties directory settings<br>`+Required when answering` |
| **uniqueCodeRules** | Object | Counterparty codes settings<br>`+Required when answering` |
| **createShared** | Boolean | Create new transactions with the label "General"<br>`+Required when answering` |

#### Counterparty code settings

| Title | Type | Description |
| ----- | ------ | ------ |
| **checkUniqueCode** | Boolean | Checking the uniqueness of the reference code<br>`+Required when answering` |
| **fillUniqueCode** | Boolean | Set unique code<br>`+Required when answering` |

### Get Counterparty directory settings

> Request to receive the settings of the counterparty directory

```shell
curl -X GET
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/settings"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the counterparties directory settings.

```json
{
   "meta" : {
     "href" : "https://api.kladana.com/api/remap/1.2/entity/counterparty/settings",
     "type" : "counterpartysettings",
     "mediaType" : "application/json"
   },
   "unique Code Rules" : {
     "checkUniqueCode" : true,
     "fillUniqueCode" : true
   },
   "createShared" : true
}
```

### Change the settings of the counterparty directory

In the request body, you need to pass an object containing a new JSON of the counterparties directory settings.
You can partially change the settings, for this you need to add only those fields that need to be updated to the request body, the rest of the fields will remain the same. Each field is optional.
The response will return the full entity, even if the update was partial.

> Request to change the counterparties directory metadata.

```shell
curl -X PUT
   "https://api.kladana.com/api/remap/1.2/entity/counterparty/settings"
   -H "Authorization: Basic <Credentials>"
   -H "Accept-Encoding: gzip"
   -H "Content-Type: application/json"
   -d '{
   "uniqueCodeRules": {
     "checkUniqueCode": true,
     "fillUniqueCode": true
   },
   "createShared": false
}'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the counterparties directory settings.

```json
{
   "meta" : {
     "href" : "https://api.kladana.com/api/remap/1.2/entity/counterparty/settings",
     "type" : "counterpartysettings",
     "mediaType" : "application/json"
   },
   "uniqueCodeRules": {
     "checkUniqueCode": true,
     "fillUniqueCode": true
   },
   "createShared": false
}
```
