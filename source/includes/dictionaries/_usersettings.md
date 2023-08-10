## User Settings

Using the JSON API, you can get and edit user settings.

#### User Settings
#### Entity attributes

| Title | Type                                               | Description |
| ---------|----------------------------------------------------|----------|
| **autoShowReports** | Boolean                                            | Whether to build reports automatically when switching to a tab with a report<br>`+Required when replying` |
| **defaultCompany** | [Meta](../#kladana-json-api-general-info-metadata) | Organization metadata to be used by default in documents<br>`+Required when replying` |
| **defaultCustomerCounterparty** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Buyer, which will be used by default in the documents of the "Sales" section<br>`+Required when replying` |
| **defaultPlace** | [Meta](../#kladana-json-api-general-info-metadata) | Warehouse metadata that will be used by default in documents<br>`+Required when replying` |
| **defaultProject** | [Meta](../#kladana-json-api-general-info-metadata) | Project metadata to be used by default in documents<br>`+Required when replying` |
| **defaultPurchaseCounterparty** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Supplier, which will be used by default in the documents of the "Purchasing" section<br>`+Required when replying` |
| **defaultscreen** | Enum                                               | [The page that opens when the user logs in](./#suschnosti-nastrojki-pol-zowatelq-startowyj-akran)<br>`+Required when replying` |
| **fieldsPerRow** | Int                                                | The number of columns in which additional fields will be placed in documents<br>`+Required when answering` |
| **locale** | Enum                                               | System language. Valid values are "ru_RU" and "en_US"<br>`+Required when replying` |
| **mailFooter** | Boolean                                            | Substituted in the signature in letters sent from MS<br>`+Required when replying` |
| **meta** | [Meta](../#kladana-json-api-general-info-metadata) | Settings metadata<br>`+Required when replying` |
| **printFormat** | Enum                                               | [Document Printing Rules](./#suschnosti-nastrojki-pol-zowatelq-prawila-pechati-dokumentow)<br>`+Required when replying` |

#### Rules for printing documents

Valid print rules:

| Document Printing Rules | The value of the printFormat field |
| ------------------------------------ | --------------------- |
| Download PDF | pdf |
| Download in Excel format | xls |
| Download in Open Office Calc format | ods |
| Offer a choice | "" (empty string) |
| Open in browser | individual |

#### Start screen

Valid start screen values:

| Start screen | The value of the defaultScreen |
| ------------ | ------------------------------ |
| Audit | audit |
| Currencies | currency |
| Introduction of marking codes into circulation | enroll order |
| Mutual settlements | customerbalancelist |
| Applications | retail drawer cashin |
| Internal orders | internal order |
| Return to circulation | enrollreturn |
| Returns | retail sales return |
| Sales returns | sales return |
| Purchase returns | purchase return |
| Sales funnel | purchasefunnel |
| Write-off from circulation | retire order |
| Payouts | retail drawer cashout |
| Cash flow | cashflow |
| Contracts| contract |
| Documents | operation |
| Units of measure | wom |
| Log of requests in IS MP | crpt log |
| Log of requests to the loyalty system | loyaltylog |
| Tasks | purpose |
| Order marking codes | crptdemand |
| Production orders | processing order |
| Sales orders | customer order |
| Orders to suppliers | purchase order |
| Requests | evotorrequest |
| Calls | phonecall |
| Unpacking | crptpackageitemremoval |
| Import | import |
| Import from Excel | import goods |
| Receiving Import | imported |
| Directory import | import custom |
| Inventory | inventory |
| Contractors | company |
| Cart | recyclebin |
| Adjustments | adjustment |
| Bulk edit | bulkEdit |
| Settings | company settings |
| News | feed |
| Stock Movement | turnover |
| Operations with points | bonus transaction |
| Description of residues | remains order |
| Posting | enter |
| Remains | stock report |
| Shipments | demand |
| Agent Reports | commission report |
| Queue of cloud receipts | fiscalevent |
| Queue of cloud receipts | fiscal queue |
| Relabeling | remarking order |
| Travel | move |
| Payments | finance |
| Subscription | payments |
| Indicators | dashboard |
| Profits and Losses | pnl3 |
| Profitability | pnl |
| Receivings | supplies |
| Applications | apps |
| Applications | embed apps |
| Checking the contents | checkequipment |
| Sales | retail demand |
| Projects | project |
| Viewing information about a KM or TU | trackingidentify |
| Unpacking | crptpackagedisaggregation |
| Order picking | order assembly |
| Serial numbers | serial numbers |
| Synchronization | connectorsettings |
| Discounts | discount |
| Warehouses | warehouse |
| Exchange events with Evotor | evotorevent |
| Employees | employee |
| Special offers | special offers |
| Writing off marking codes | crptcancellation |
| Write-offs | loss |
| Countries | country |
| Scenarios | scripttemplate |
| Invoices for buyers | invoiceout |
| Supplier invoices | invoicein |
| Bills of Materials | processing plan |
| Routing | processing |
| Products and services | good|
| Goods for sale | commissiongoods |
| Notifications | notifications |
| Purchasing management | purchasecontrol |
| Account | account |
| Formation of packaging | crptpackagecreation |
| Feature | feature |
| Export | export |
| Legal entities | mycompany |

### Get User Settings

> Request for User Settings:

```shell
curl -X GET
   "https://app.kladana.in/api/remap/1.2/context/usersettings"
   -H "Authorization: Basic <Credentials>"
```

> Response 200(application/json)
Successful request. The result is a JSON representation of Company Settings:

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/context/usersettings",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/context/usersettings/metadata",
     "type": "usersettings",
     "mediaType": "application/json"
   },
   "defaultCompany": {
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
     "type": "organization",
     "mediaType": "application/json"
   },
   "defaultCustomerCounterparty": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/5f13f655-a419-11ea-ac12-000a00000073",
     "type": "counterparty",
     "mediaType": "application/json"
   },
   "defaultPurchaseCounterparty": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/5f13f655-a419-11ea-ac12-000a00000074",
     "type": "counterparty",
     "mediaType": "application/json"
   },
   "defaultProject": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/project/59e1cf55-a70f-11ea-ac12-000d00000001",
     "type": "project",
     "mediaType": "application/json"
   },
   "defaultPlace": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/store/5f13ac1b-a419-11ea-ac12-000a00000072",
     "type": "store",
     "mediaType": "application/json"
   },
   "locale": "ru_RU",
   "mailFooter": "mail signature",
   "fieldsPerRow": 3,
   "defaultScreen": "importcustom",
   "printFormat": "pdf",
   "autoShowReports": false
}
```

### Change User Settings

You can edit the following user settings:

| Title | Type                                               | Description |
| ------|----------------------------------------------------|-------------|
| **autoShowReports** | Boolean                                            | Whether to build reports automatically when switching to a tab with a report |
| **defaultCompany** | [Meta](../#kladana-json-api-general-info-metadata) | Organization metadata to be used by default in documents |
| **defaultCustomerCounterparty** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Buyer, which will be used by default in the documents of the "Sales" section |
| **defaultPlace** | [Meta](../#kladana-json-api-general-info-metadata) | Warehouse metadata to be used by default in documents |
| **defaultProject** | [Meta](../#kladana-json-api-general-info-metadata) | Project metadata to be used by default in documents |
| **defaultPurchaseCounterparty** | [Meta](../#kladana-json-api-general-info-metadata) | Metadata of the Supplier, which will be used by default in the documents of the "Purchasing" section |
| **defaultscreen** | Enum                                               | [The page that opens when the user logs in](./#suschnosti-nastrojki-pol-zowatelq-startowyj-akran) |
| **fieldsPerRow** | Int                                                | The number of columns in which additional fields will be located in documents |
| **locale** | Enum                                               | System language. Valid values "ru_RU" and "en_US" |
| **mailFooter** | Boolean                                            | Substituted in the signature in letters sent from MS |
| **printFormat** | Enum                                               | [Document printing rules](./#suschnosti-nastrojki-pol-zowatelq-prawila-pechati-dokumentow) |

Partial editing is allowed - only the fields present in the request will be edited.

> Request to change user settings:

```shell
curl -X PUT
   "https://app.kladana.in/api/remap/1.2/context/usersettings"
   -H "Authorization: Basic <Credentials>"
   -H "Content-Type: application/json"
       -d '{
   "defaultCompany": {
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
     "type": "organization",
     "mediaType": "application/json"
   },
   "defaultCustomerCounterparty": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/5f13f655-a419-11ea-ac12-000a00000073",
     "type": "counterparty",
     "mediaType": "application/json"
   },
   "defaultPurchaseCounterparty": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/5f13f655-a419-11ea-ac12-000a00000074",
     "type": "counterparty",
     "mediaType": "application/json"
   },
   "defaultProject": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/project/59e1cf55-a70f-11ea-ac12-000d00000001",
     "type": "project",
     "mediaType": "application/json"
   },
   "defaultPlace": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/store/5f13ac1b-a419-11ea-ac12-000a00000072",
     "type": "store",
     "mediaType": "application/json"
   },
   "locale": "ru_RU",
   "mailFooter": "mail signature",
   "fieldsPerRow": 3,
   "defaultScreen": "importcustom",
   "printFormat": "pdf",
   "autoShowReports": false
}'
```

> Response 200(application/json)
Successful request. The result is a JSON representation of the User Settings.

```json
{
   "meta": {
     "href": "https://app.kladana.in/api/remap/1.2/context/usersettings",
     "metadataHref": "https://app.kladana.in/api/remap/1.2/context/usersettings/metadata",
     "type": "usersettings",
     "mediaType": "application/json"
   },
   "defaultCompany": {
     "metadataHref": "https://app.kladana.in/api/remap/1.2/entity/organization/metadata",
     "type": "organization",
     "mediaType": "application/json"
   },
   "defaultCustomerCounterparty": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/5f13f655-a419-11ea-ac12-000a00000073",
     "type": "counterparty",
     "mediaType": "application/json"
   },
   "defaultPurchaseCounterparty": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/counterparty/5f13f655-a419-11ea-ac12-000a00000074",
     "type": "counterparty",
     "mediaType": "application/json"
   },
   "defaultProject": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/project/59e1cf55-a70f-11ea-ac12-000d00000001",
     "type": "project",
     "mediaType": "application/json"
   },
   "defaultPlace": {
     "href": "https://app.kladana.in/api/remap/1.2/entity/store/5f13ac1b-a419-11ea-ac12-000a00000072",
     "type": "store",
     "mediaType": "application/json"
   },
   "locale": "ru_RU",
   "mailFooter": "mail signature",
   "fieldsPerRow": 3,
   "defaultScreen": "importcustom",
   "printFormat": "pdf",
   "autoShowReports": false
}
```
