## Working with stats in Mods

Suppose there is a shop selling lots of goods. You need to describe the assortment. First, you can subdivide the goods by type: t-shirts, jeans, dresses etc. But there are many different T-shirts, jeans and trousers. They
have different parameters: size, color, etc. They need to be somehow distinguished in the system in order to sell them as
individual goods. Mods can solve this problem.

In fact, a product variant is a product with specific characteristics, such as color, weight, size, and so on. More
you can read about working with product variants [here](../dictionaries/#entities-product-variant-create-product-variant).

Before adding new or using old characteristics of the product variant, you need to understand which ones are already
have been created and used.

> Request for the characteristics of product variants

```shell
curl -X GET
   "https://api.kladana.in/api/remap/1.2/entity/variant/metadata"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the product variant's metadata with characteristics.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/variant/metadata",
     "mediaType": "application/json"
   },
   "characteristics": [
     {
       "id": "fd68704f-f67d-11e5-8a84-bae50000006b",
       "name": "feature",
       "type": "string",
       "required": false
     },
     {
       "id": "66bcdde0-f7d2-11e5-8a84-bae500000072",
       "name": "Weight",
       "type": "string",
       "required": false
     },
     {
       "id": "66be57d2-f7d2-11e5-8a84-bae500000073",
       "name": "Size",
       "type": "string",
       "required": false
     },
     {
       "id": "daec003b-fa34-11e5-9464-e4de0000006c",
       "name": "fashion",
       "type": "string",
       "required": false
     }
   ]
}
```

After it became clear that some characteristics are missing to describe the product, the JSON API has the ability to
  add missing features. This can be done through a separate endpoint for working with characteristics.

> Creation of one characteristic.

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/variant/metadata/characteristics"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d '{
             "name": "Size"
           }'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the generated Feature.

```json
{
   "meta": {
     "href": "https://api.kladana.in/api/remap/1.2/entity/variant/metadata/characteristics/6262b270-60c3-11e7-6adb-ede50000000d",
     "type": "attributemetadata",
     "mediaType": "application/json"
   },
   "id": "6262b270-60c3-11e7-6adb-ede50000000d",
   "name": "Size",
   "type": "string",
   "required": false
}
```

> Example of creating multiple Characteristics

```shell
   curl -X POST
     "https://api.kladana.in/api/remap/1.2/entity/variant/metadata/characteristics"
     -H "Authorization: Basic <Credentials>"
     -H "Content-Type: application/json"
       -d'[
             {
               "name": "Size"
             },
             {
               "name": "Color"
             }
           ]'
```

> Response 200(application/json)
Successful request. The result is a JSON array of representations of the generated Features.

```json
[
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/variant/metadata/characteristics/b55d2ddf-60c3-11e7-6adb-ede500000010",
       "type": "attributemetadata",
       "mediaType": "application/json"
     },
     "id": "b55d2ddf-60c3-11e7-6adb-ede500000010",
     "name": "Size",
     "type": "string",
     "required": false
   },
   {
     "meta": {
       "href": "https://api.kladana.in/api/remap/1.2/entity/variant/metadata/characteristics/b56215dc-60c3-11e7-6adb-ede500000013",
       "type": "attributemetadata",
       "mediaType": "application/json"
     },
     "id": "b56215dc-60c3-11e7-6adb-ede500000013",
     "name": "Color",
     "type": "string",
     "required": false
   }
]
```

After the desired characteristics have been created, you can create product variants with these characteristics.
