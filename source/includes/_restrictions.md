## Limitations

### Limitations

Access to the JSON API is granted via:

- a username and password (Basic Auth)
- a user token (Bearer token)
- an application token (Bearer token)

Request limits per 3 seconds depend on the authentication method used ([more details in this section](#kladana-json-api-limitations-request-limit-per-3-second-period)).

There are also restrictions that are independent of the authentication method:

- no more than 5 parallel requests per user or application
- no more than 20 parallel requests per account
- the request header (including URL, User-Agent, Authorization, etc.) must not exceed 8 KB
- the data sent in a single request must not exceed 20 MB
- no more than 4 [asynchronous tasks](#kladana-json-api-asynchronous-exchange) can be queued per account
- content [compression for responses](#kladana-json-api-general-info-response-content-compression) is mandatory

### Request limit per 3 seconds

As March 20, 2026, the request limit will no longer apply to the entire account and will be calculated separately 
for each user and each application. This means multiple users or applications within the same account will no longer compete for the same limit.

Actual limit consumption depends on the request weight — the number of limit units deducted per HTTP request. 
The higher the request weight, the faster the limit is depleted.

A request weight of 5 units (regardless of the authentication method) applies to the following endpoints:

- `GET /api/remap/1.2/report/stock/all`
- `GET /api/remap/1.2/report/stock/bystore`

For all other endpoints:

- When authenticating with a public or private application token, the request weight remains standard and the limit is 45 requests per 3 seconds.
- When authenticating with an application token in the `Draft` or `Under Moderation` status starting **April 13, 2026**, the request weight will be 4 units → **11 requests per 3 seconds** (rounded down).
- For integrations that use a username and password or a user token, the request weight will increase in stages:
  - From **May 12, 2026**: 1 request = 2 units → **22 requests per 3 seconds**
  - From **September 1, 2026**: 1 request = 3 units → **15 requests per 3 seconds**
  - From **December 1, 2026**: 1 request = 4 units → **11 requests per 3 seconds**

**Example of request weight calculation**

If you use a username/password or a user token for authorization, then 2, 3, or 4 requests will be deducted from the "bucket" of 45 requests allocated every 3 seconds, rather than 1 (see the schedule above).
For example, on May 21, 2026, an integration using the username and password made 7 requests within a three-second period—7 × 2 = 14 requests were deducted from the "bucket".

### Data size limits

Additionally, there's a limit on the maximum number of objects (positions, materials, products) that can be sent in a single array within a request — no more than 1,000 items. If the limit is exceeded, 413 Status Error occurs. 

To add more items, you need to work with a specialized resource, which is described in the documentation for the specific entity.

### Subscription plan limitations

JSON API has price restrictions. The user has access to the functionality in accordance with the current subscription plan.

These rules may be updated or changed without prior notice. Please refer to this documentation for the latest information.
