## Limitations

The following limitations apply to the JSON API:

- No more than 45 requests per 3-second period per account.
- No more than 5 parallel requests from a single user.
- No more than 20 parallel requests per account.
- The request header (including URL, User-Agent, Authorization, etc.) must not exceed 8 KB.
- The data sent in a single request must not exceed 20 MB.
- No more than 4 asynchronous tasks can be queued per account.
- Content compression for responses is mandatory.

Additionally, there's a limit on the maximum number of objects (positions, materials, products) that can be sent in a single array within a request — no more than 1,000 items. If the limit is exceeded, 413 Status Error occurs. 

To add more items, you need to work with a specialized resource, which is described in the documentation for the specific entity.

Kladana automatically disables:

- API access for a user if they make more than 200 identical requests per minute that result in an error within the last hour.
- API access for a user if they make more than 200 requests per minute that result in an Error 429 within the last hour.
- Webhooks if the service receiving them has responded with error codes or been unavailable for more than seven out of the last ten days, and has not successfully processed any webhooks in the last ten days.

Notifications about webhook or API access deactivation are sent to the email of the employee specified as the account owner.

If your API or webhooks are disabled:

- Resolve the issue.
- Contact Kladana technical support to restore API access.
- Reactivate webhooks yourself (no technical support contact required).

JSON API has price restrictions. The user has access to the functionality in accordance with the current subscription plan.

These rules may be updated or changed without prior notice. Please refer to this documentation for the latest information.
