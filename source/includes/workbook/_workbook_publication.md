## Publication of Transactions

Kladana allows you to print transactions. You can generate files in _pdf_ or _xls_ format using special templates called printable templates. Most transactions have print templates.

Learn more about [print templates managing](https://kladana.zendesk.com/hc/en-us/articles/360017534337-Print-documents). If you need to add a new print form or customize Kladana print form, you can [send a request](https://kladana.zendesk.com/hc/en-us/articles/6506155548829-How-to-request-custom-print-template).

A publication is a link to a transaction printed form. It can be sent by email. When publishing, files are generated only in
_pdf_ format. Publication is available for the following transactions:

+ Sales order
+ Sales invoice
+ Shipment
+ Purchase order
+ Purchase invoice
+ Receiving
+ Incoming payment
+ Incoming Cash Payment
+ Outgoing payment
+ Outgoing Cash Payment
+ Transfer
+ Stock Adjustment
+ Write-off
+ Invoice issued
+ Invoice received
+ Purchase return
+ Sales return
+ Payout
+ Depositing money
+ Contract
+ Internal Order

## Print templates

In the JSON API, it is possible to request lists of built-in and custom print templates in order to use them for printing and publication.

> Request built-in Sales order templates:

``` shell
curl
     -X GET
     -u login:password
     -H "Lognex-Pretty-Print-JSON: true"
     "https://api.kladana.in/api/remap/1.2/entity/customerorder/metadata/embeddedtemplate/"
```

> Response 

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
      "href": "https://api.kladana.in/api/remap/1.2/entity/customerorder/metadata/embeddedtemplate/",
      "type": "embeddedtemplate",
      "mediaType": "application/json",
      "size": 1,
      "limit": 100,
      "offset": 0
    },
    "rows": [
      {
        "meta": {
          "href": "https://api.kladana.in/api/remap/1.2/entity/customerorder/metadata/embeddedtemplate/6ffea5e5-1b69-4a88-be59-4856281d439c",
          "type": "embeddedtemplate",
          "mediaType": "application/json"
        },
        "id": "6ffea5e5-1b69-4a88-be59-4856281d439c",
        "name": "Order",
        "type": "entity",
        "content": "https://api.kladana.in/api/remap/1.2/download-template/order.xls"
      }
    ]
  }
```

> Request Custom Sales order Templates:

``` shell
curl
     -X GET
     -u login:password
     -H "Lognex-Pretty-Print-JSON: true"
     "https://api.kladana.in/api/remap/1.2/entity/customerorder/metadata/customtemplate/"
```

> Response 

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
             "type": "customtemplate",
             "mediaType": "application/json",
             "size": 1,
             "limit": 100,
             "offset": 0
         },
         "rows": [
             {
                 "meta": {
                     "href": "https://api.kladana.in/api/remap/1.2/entity/customerorder/metadata/customtemplate/13b49a38-0b64-4129-9fb8-0f9f936fa575",
                     "type": "customtemplate",
                     "mediaType": "application/json"
                 },
                 "id": "13b49a38-0b64-4129-9fb8-0f9f936fa575",
                 "name": "order_upakovka.xls",
                 "type": "entity",
                 "content": "https://api.kladana.in/api/remap/1.2/download/13b49a38-0b64-4129-9fb8-0f9f936fa575"
             }
     ]
}
```

You can download the template itself from the link in the **content** field.

Changing or deleting printable templates via the JSON API is not allowed.

## Creat publications in the Kladana JSON API

Publications can be created using the Kladana JSON API. To create a publication, you need a transaction, for example, a Sales order, and a print template, built-in or custom.

Create a publication for a Sales order

> Request

``` shell
curl
     -X POST
     -u login:password
     -H "Content-Type: application/json"
     -H "Lognex-Pretty-Print-JSON: true"
     "https://api.kladana.in/api/remap/1.2/entity/customerorder/53e988fd-c7c9-11e8-9dd2-f3a3000000cd/publication"
     -d '{
           template: {
             "meta": {
               "href": "https://api.kladana.in/api/remap/1.2/entity/customerorder/metadata/embeddedtemplate/6ffea5e5-1b69-4a88-be59-4856281d439c",
               "type": "embeddedtemplate",
               "mediaType": "application/json"
             }
           }
         }'
```

The response is a JSON representation of the publication. If such a publication already existed, the response code is 200. If the publication was created - 201.

> Response

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/customerorder/53e988fd-c7c9-11e8-9dd2-f3a3000000cd/publication/aec51463-bbd2-11e6-8a84-bae500000003",
     "type": "operationpublication",
     "mediaType": "application/json"
   },
   "template": {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/customerorder/metadata/embeddedtemplate/6ffea5e5-1b69-4a88-be59-4856281d439c",
       "type": "embeddedtemplate",
       "mediaType": "application/json"
     }
   },
   "href": "https://mskld.ru/QS6YOArOjJ"
}
```

### List of all publications

You can also request a list of all publications of a transaction.

> Request

``` shell
curl
     -X GET
     -u login:password
     -H "Lognex-Pretty-Print-JSON: true"
     "https://api.kladana.in/api/remap/1.2/entity/customerorder/53e988fd-c7c9-11e8-9dd2-f3a3000000cd/publication"
```

> Response:

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
         "href": "https://api.kladana.in/api/remap/1.2/entity/customerorder/53e988fd-c7c9-11e8-9dd2-f3a3000000cd/publication",
         "type": "customerorder",
         "mediaType": "application/json",
         "size": 1,
         "limit": 100,
         "offset": 0
     },
     "rows": [
         {
             "meta": {
                 "href": "https://api.kladana.in/api/remap/1.2/entity/customerorder/53e988fd-c7c9-11e8-9dd2-f3a3000000cd/publication/aec51463-bbd2-11e6-8a84-bae500000003",
                 "type": "operationpublication",
                 "mediaType": "application/json"
             },
             "template": {
                 "meta": {
                     "href": "https://api.kladana.in/api/remap/1.2/entity/customerorder/metadata/embeddedtemplate/6ffea5e5-1b69-4a88-be59-4856281d439c",
                     "type": "embeddedtemplate",
                     "mediaType": "application/json"
                 }
             },
             "href": "https://mskld.ru/fhzHJPqIM7"
         }
     ]
}
```

### Deleting posts

Through the JSON API, you can delete a publication:

> Request

``` shell
curl
     -X DELETE
     -u login:password
     -H "Content-Type: application/json"
     -H "Lognex-Pretty-Print-JSON: true"
     "https://api.kladana.in/api/remap/1.2/entity/customerorder/53e988fd-c7c9-11e8-9dd2-f3a3000000cd/publication/aec51463-bbd2-11e6-8a84-bae500000003"
```


## Publication links

The publication link (for example, https://kldna.in/7sDZyGqk5M) opens a page from which you can download a pdf file.
 
The link will make the latest version of the transaction available, even if you make changes to the transaction after it has been published.

The link will remain available until the post is removed.
