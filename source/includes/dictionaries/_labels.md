## Print labels and price tags
### Print labels and price tags
Using the JSON API, you can request the printing of labels and price tags using printable templates.
When requesting the formation of a printed form, the server (when labels and price tags are ready, correct
printed form and the correct request format) responds with an empty response body with a 303 http code.
The Location header of the response contains the address of the temporary location of the printed form that is ready to be loaded.
The file in the temporary location is available for download for 5 minutes.

The server MAY return a 202 response and a Location header with an address to poll for the printable to be ready for download.
This option will be implemented later.

Printing labels and price tags is available for products, services, kits and modifications.

### Request to print labels and price tags

Request for printing labels and price tags according to the template of the printed form.

#### Request attributes

| Title| Type                                               | Description|
| ---------|----------------------------------------------------| ----------|
| **organization** | [Meta](../#kladana-json-api-general-info-metadata) | Legal entity metadata<br>`+Required when replying` |
| **count** | Int                                                | Number of price tags / thermal labels. Maximum number - `1000`<br>`+Required when replying` |
| **salePrice** | Object                                             | Selling price. [More details here](../dictionaries/#entities-print-labels-and-price-tags-request-to-print-labels-and-price-tags-selling-price)<br>`+Required when answering` |
| **template** | [Meta](../#kladana-json-api-general-info-metadata) | Print Template Metadata<br>`+Required in response` `+Expand` |

#### Selling price
Nested entity attributes

| Title| Type| Description|
| ---------| -----| ----------|
| **priceType** | [Meta](../#kladana-json-api-general-info-metadata) | Price type metadata<br>`+Required when replying` |


**Parameters**

| Parameter | Description|
| ---------| ---------|
| **id** | `string` (required) *Example: a86708d2-f8d3-4e67-8f04-6101158da808* id of the entity for which printing is requested. |
| **type** | `string` (required) *Example: product* the type of the entity for which printing is requested. |

> An example of a request to print labels and price tags based on a template for a printed form for products.

```shell
  curl -X POST
    "https://app.kladana.in/api/remap/1.2/entity/product/a86708d2-f8d3-4e67-8f04-6101158da808/export/"
    -H "Authorization: Basic <Credentials>"
    -H "Content-Type: application/json"
      -d '{
              "organization": {
                  "meta": {
                      "href": "https://app.kladana.in/api/remap/1.2/entity/organization/107430bc-36e7-11e7-8a7f-40d000000090",
                      "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
                      "type": "organization",
                      "mediaType": "application/json",
                      "uuidHref": "https://app.kladana.in/app/#mycompany/edit?id=107430bc-36e7-11e7-8a7f-40d000000090"
                  }
              },
              "count": 10,
              "salePrice": {
                  "priceType": {
                      "meta": {
                          "href": "https://app.kladana.in/api/remap/1.2/context/companysettings/pricetype/672559f1-cbf3-11e1-9eb9-889ffa6f49fd",
                          "type": "pricetype",
                          "mediaType": "application/json"
                      }
                  }
              },
              "template": {
                  "meta": {
                      "href": "https://app.kladana.in/api/remap/1.2/entity/assortment/metadata/embeddedtemplate/f8e295eb-15c6-3184-b934-14fe90b3ea81",
                      "type": "embeddedtemplate",
                      "mediaType": "application/json"
                  }
              }
          }'  
```

> Response 202 Headers

```json
  Location: link to print status,
  Content-Type: application/json
```

> Response 303 headers

```json
  Location: file link,
  Content-Type: application/json
```
