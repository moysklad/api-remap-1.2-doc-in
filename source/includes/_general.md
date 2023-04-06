# Kladana JSON API

## Authentication

You can integrate Kladana using the Kladana JSON API. To do this, you first need to log in to Kladan. Kladana supports authentication using the Basic Auth protocol and an access token. 

- When authenticating using the Basic Auth protocol along with a request, the `Authorization` header is passed with the value of the `login:password` pair encoded in the RFC2045-MIME variant of the Base64 standard.

- When authenticating using an access token, the `Authorization` header with a value of `Bearer <Access-Token>` is sent along with the request.
 
Authentication using the Basic Auth protocol with automatic generation of the corresponding header and the ability to specify a header for token authentication is supported in many HTTP clients, such as Postman, curl, etc.

### Getting a new token

Request for a new token. As in other requests, in the `Authorization` header, the `login:password` pair is indicated encoded in the RFC2045-MIME version of the Base64 standard. When a new access token is generated, the previously generated user tokens are revoked.

- **access_token** — access token

> Example: Request for a new token

```shell
curl -X POST
   "https://dev.kladana.in/api/remap/1.2/security/token"
   -H "Authorization: Basic <Credentials>"
```
> Response 200 (application/json): Successful request. The result is a JSON object containing the token.

```json
{
   "access_token": "0cbfc512618efa7d5fa306250bca064c1169b37c"
}
```

## Restrictions

The Kladana JSON API has the following restrictions: 

- Under 45 requests per 3 seconds for an account.
- Under 5 parallel requests from a user.
- Under 20 parallel requests for an account. 
- Under 8 Kb in the request header (URL, User-Agent, Authorization, etc). 
- Under 20 MB of data in a request sent to the server. 
- Under 4 asynchronous tasks queued for an account. 
- Under 1000 elements of objects (positions, materials, products) in one array for a request. If the number of elements exceeds the number allowed, an error with status 413 occurs. If the number of positions exceeds the limit, use the resources described separately for each entity.

## Data types

| Title | Description |
| ------ | ---------- | 
| **Array(Type)** | An array of objects/values. 'Type' is a type of array elements. |
| **Boolean** | Represents a `true` or `false` value. |
| **DateTime** | Represents a string in the 'yyyy-mm-dd hh-mm-ss' format. Example: `'2016-08-23 15:21:09'`.|
| **Enum** | Represents a string that takes a constant set of values. |
| **Float** | Represents a fractional numeric value. Example: `200.8`. |
| **int** | Represents an integer numeric value in the range of -2^31 - 2^31. Example: `200`. |
| **Long** | Represents an integer numeric value in the range of -2^63 - 2^63. Example: `1613766951558`. |
| **Meta** | Represents an object in the metadata format. |
| **MetaArray** | An object with **meta** and **rows** fields, where **rows** is an array of objects. The elements of the **rows** array can be queried using the expand query parameter of the corresponding field. |
| **Object** | Represents an entity with nested fields. |
| **String(MaxLength)** | Represents text data as a sequence of UTF-8 characters. 'MaxLength' is maximum string length for a particular field. Example: `'Moscow'`. |
| **URL** | An FRC 3986 and RFC 3987 compliant URI string. Example: `'https://dev.kladana.in/api/remap/1.2/entity/counterparty'`. |
| **UUID** | Represents a string in UUID format. Example': `'12a8b923-692c-11e6-8a84-bae500000053'`. |

## Error processing

### Error structure

An error in the Kladana API is an 'Error' array containing 'Error' objects. Each object describes a single error.

### Structure of the 'Error' object

| Title | Type | Description |
|------|------|-------------|
| **error** | String(255) | Error title<br>`+Required for response` |
| **parameter** | String(255) | The parameter on which the error occurred |
| **code** | int | Error code. If the field contains nothing, see HTTP status code |
| **error_message** | String(255) | Message attached to the error |
| **moreInfo** | link | Link to the error received documentation |
| **line** | int | The JSON string where the error occurred |
| **column** | int | The coordinate of the element in the `line` string where the error occurred |
| **dependencies** | Array Meta | Metadata list of dependent entities or documents. It is displayed when it is impossible to delete an entity or a document. If there are dependencies on the entity, the document is deleted |
| **meta** | meta | Metadata of the entity on which the error occurred |

### Returned HTTP error statuses and their description

| HTTP status code | Description |
| -----------------| ----------- |
| **301** | The requested resource has another URL |
| **303** | The requested resource has another URL. Use GET request to find it |
| **400** | The transmitted request has a JSON structure error |
| **401** | Incorrect username or password, or the user or account has been blocked |
| **403** | No permission to view the object |
| **404** | The requested resource does not exist |
| **405** | HTTP method specified incorrectly for the requested resource|
| **409** | The specified object is in use and cannot be deleted |
| **410** | API version no longer supported |
| **412** | A required query string parameter or JSON structure field was not specified |
| **413** | The size of the request or the number of elements in the request exceeds the limit. For instance, the number of positions passed in the **positions** array exceeds 1000 |
| **429** | Request limit was exceeded |
| **500** | An unexpected error occurred while processing the request |
| **502** | Service temporarily unavailable |
| **503** | Service temporarily disabled |
| **504** | Service timeout exceededю Please try again later |

Along with the error response body, you may receive the following headers:

- X-Lognex-Auth — Extended authentication error code.
- X-Lognex-Auth-Message — Error message.
- X-Lognex-API-Version-Deprecated — The date the requested API version was disabled.
- Location — The requested resource's current URL (if you receive 301 or 303 code as a response).

Use the following headers to learn the limits of the remaining requests:

- X-RateLimit-Limit — The number of requests that can be made before the 429 error occurs.
- X-Lognex-Retry-TimeInterval — Interval in milliseconds during which these requests can be made.
- X-RateLimit-Remaining — The number of requests that can be sent before 429 error receiving.
- X-Lognex-Reset — Time before limit reset in milliseconds. Equal to zero if the limit is not set.
- X-Lognex-Retry-After — Time before the restriction reset in milliseconds.


