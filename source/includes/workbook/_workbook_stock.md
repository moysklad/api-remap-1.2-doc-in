## Working with the stock

The JSON API allows you to get information about the balances in different ways, depending on the task.

### Full synchronization for goods and balances

You can perform full synchronization with MySklad to download all information about products (barcode, prices, descriptions, images) and their balances. To do this, you can use [Extended balance report](../reports/#reports-balance-report-rasshirennyj-otchet-ob-ostatkah) or [Report on balances by warehouses](../reports/#reports-balance-report-ostatki-po-skladam). It is also possible to perform full synchronization via the [assortment](../dictionaries/#entities-assortment) query.
 
Also, full synchronization can be carried out periodically during operation, for example, once a day. However, this is a rather long and heavy request, and it is often not recommended to use it.

### Update information on balances

If in the course of work you need to regularly update information only on balances, use the [Brief report on balances](../reports/#reports-balance-report-summary-of-balances). The report contains only the product ID and its quantity in stock at the time of the request. Use the report to keep track of the balance of a large number of products. The report can be requested every few minutes.
 
To reduce the amount of data transferred, when requesting a Summary of Balances use the `changedSince` parameter. The parameter allows you to get data on the balances only for those products whose balances have changed over the period from `changedSince` to the current moment. This significantly reduces the time it takes to process a request.
 
If Orders, Receiving, Shipments and other transactions are created irregularly, subscribe to [Webhooks for changing stocks](../dictionaries/#entities-vebhuk-na-change-ostatkow) for goods or warehouses. Webhooks allow you to be notified of changes and request the stock only when there are changes. When you receive a notification, request data using the link in the webhook.

### Regular product data update

If information about products changes in the course of work and you need to regularly monitor these changes, subscribe to [webhooks](#workbook-webhooks-webhook) for creating, changing, deleting of products, services, product variants, and bundles.
