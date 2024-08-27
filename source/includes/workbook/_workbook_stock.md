## Working with the stock

The JSON API allows you to get information about the stock in different ways, depending on the task.

### Products and the product stock full synchronization

You can perform full synchronization with Kladana to download all information about products (barcode, prices, descriptions, images) and their stock. To do this, you can use [Extended balance report](../reports/#reports-balance-report-extended-balance-report) or [Stock report by warehouses](../reports/#reports-balance-report-stock-balances). It is also possible to perform full synchronization via the [assortment](../dictionaries/#entities-assortment) query.
 
Also, full synchronization can be carried out periodically during the operation, for example, once a day. However, this is a rather long and heavy request, and it is often not recommended to use it.

### Stock data update

If you need to update the stock data regularly, use the [Brief Stock report](../reports/#reports-balance-report-summary-of-balances). The report contains only the product ID and its quantity in stock at the time of the request. Use the report to track the stock for a large number of products. The report can be requested every few minutes.
 
To reduce the amount of data transferred, when requesting the report, use the `changedSince` parameter. This parameter allows you to obtain stock data only for the products whose stock has changed over the period from `changedSince` to the moment of the request, significantly reducing the processing time of the request.
 
If Sales orders, Receiving, Shipments and other transactions are created irregularly, subscribe to the [Webhooks for changing stocks](../dictionaries/#entities-webhook-to-change-balances) for products and warehouses. A webhook allows you to be notified about changes and request stock data only when changes occur. When you receive a notification, request data using the link provided in the webhook.

### Regular product data update

If information about products often changes and you need to monitor these changes, subscribe to [webhooks](#workbook-webhooks-webhook) for creating, changing, deleting of products, services, product variants, and bundles.
