## Printing of transaction documents

Using the JSON API, you can request printing of documents using [printable form templates](../dictionaries/#entities-print-templates).
When requesting the formation of a printed form, the server (when the document is ready, the correct
printed form and the correct request format) responds with an empty response body with a 303 http code.
The Location header of the response contains the address of the temporary location of the printed form that is ready to be loaded.
The file in the temporary location is available for download for 5 minutes.

The server MAY return a 202 Response and a 'Location' header with an address to poll for the readiness of the printable to be loaded. This option will be implemented later.

### Print request

**Options**

| Parameter | Description |
| ------------ | ---------- |
| **id** | `string` (required) *Example: a86708d2-f8d3-4e67-8f04-6101158da808* id of the entity for which printing is requested. |
| **type** | `string` (required) *Example: demand* the type of the entity for which printing is requested. |

Request to print a single document based on a printable template.
#### Request attributes

| Title | Type | Description |
| ------------ | ---------- | --------------- |
| **template** | [Meta](../#kladana-json-api-general-info-metadata) | Print Template metadata<br>`+Required when replying` |
| **extension** | String(4) | The extension in which to print the form. You can specify `xls, pdf, html, ods`<br>`+Required when replying` |

You can also print a set of documents. To do this, instead of the **template** field, you need to specify the **templates** field, which is an array of objects with the following fields:

| Title | Type | Description |
| ------------ | ---------- | --------------- |
| **template** | [Meta](../#kladana-json-api-general-info-metadata) | Print Template metadata<br>`+Required when replying` |
| **count** | int | The number of copies of the printed form. From 1 to 10.<br>`+Required when answering` |

If the request contains both a **templates** field and a **template** field (outside the **templates** array element), an error will occur. Only 1 of these fields is allowed in a request.
When printing kits <u>you don't need</u> to specify the **extension** field - all kits are printed in *pdf*.

When printing a set, for certain entities, you can use templates to print related documents.
So, for example, for shipment (demand) you can use templates:

+ Sales Invoice
+ Sales Invoice with stamp and signature
+ Sales Order
+ Any custom template for the above entities.

for Sales Order:

+ Any standard (embeddedtemplate) template for shipping.
+ Sales Invoice
+ Sales Invoice with stamp and signature
+ Any custom template for the above entities.

for Sales Invoice:

+ Any standard (embeddedtemplate) template for shipping.
+ Sales Order
+ Any custom template for the above entities.

> An example of a request to print a separate document based on a printable template.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/demand/a86708d2-f8d3-4e67-8f04-6101158da808/export/"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "template": {
               "meta": {
                 "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/customtemplate/daca545a-1a35-11e7-8a84-bae500000001",
                 "type": "customtemplate",
                 "mediaType": "application/json"
               }
             },
             "extension": "xls"
           }'
```

> Response 202 Headers

```json

   Location: link to print status
   Content-Type: application/json

```

> Response 303 headers

```json

   Location: file link
   Content-Type: application/json

```

> An example of a request to print a set of documents. As a result of the request, a set of 6 printed forms will be printed.

```shell
   curl -X POST
     "https://app.kladana.in/api/remap/1.2/entity/demand/a86708d2-f8d3-4e67-8f04-6101158da808/export/"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
            "templates": [
                {
                    "template": {
                        "meta": {
                            "href": "https://app.kladana.in/api/remap/1.2/entity/demand/metadata/customtemplate/daca545a-1a35-11e7-8a84-bae500000001",
                            "type": "customtemplate",
                            "mediaType": "application/json"
                        }
                    },
                    "count": 2
                },
                {
                    "template": {
                        "meta": {
                            "href": "https://app.kladana.in/api/remap/1.2/entity/factureout/metadata/embeddedtemplate/3d2685b4-cf64-4fd1-87c8-e109966b364b",
                            "type": "embeddedtemplate",
                            "mediaType": "application/json"
                        }
                    },
                    "count": 3
                },
                {
                    "template": {
                        "meta": {
                            "href": "https://app.kladana.in/api/remap/1.2/entity/invoiceout/metadata/embeddedtemplate/6f3c9a47-6772-4944-9723-92d0d7be2a9c",
                            "type": "embeddedtemplate",
                            "mediaType": "application/json"
                        }
                    },
                    "count": 1
                }
            ]
        }'
```

> Response 202 Headers

```json

  Location: link to print status
  Content-Type: application/json

```

> Response 303 headers

```json

  Location: file link
  Content-Type: application/json

```
