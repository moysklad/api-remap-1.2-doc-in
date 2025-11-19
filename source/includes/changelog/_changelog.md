# Changelog

The section lists changes to existing endpoints and new endpoints that allow you to interact with the Kladana API more effectively.
 
See Kladana API 1.2 changelog on [github](https://github.com/moysklad/api-remap-1.2-doc-in/blob/master/CHANGELOG.md).

Learn more about working with the Kladana API in [Workbook](../workbook/#workbook).

### 17-10-2025
#### Changed
- The value of the `name` field in the [warehouse](../dictionaries/#entities-warehouse) entity must be unique.

### 13-11-2025
#### Added
- Error [26115](../#kladana-json-api-errors-error-codes-for-production-orders)

### 30-10-2025
#### Added
- Error [19005](https://dev.kladana.com/doc/api/remap/1.2/#kladana-json-api-errors-error-codes-for-returns)

### 25-09-2025
#### Added
- Condition for automatically disabling JSON API for a user in [Limitations](../#kladana-json-api-limitations).

### 22-09-2025
#### Added
- Field `distributionRequired` in [Production Operations](../dictionaries/#entities-production-operations)
#### Changed
- Access to the [Brief Stock Report](../reports/#reports-stock-report-brief-stock-report) has been expanded: in addition to administrators, employees with the Stock permission can now view it.

### 25-08-2025
#### Added
- Field `applicable` in [Operation Report](../documents/#transactions-operation-report)

### 08-08-2025
#### Added
- Information for working with header [Accept-Language](../#kladana-json-api-general-info-accept-language-header)

### 07-08-2025
#### Added
- New notification type added [New event in the event feed](../notification/#notifications-detailed-description-of-notification-types-new-event-in-the-event-feed)
- New notification group added [Followed events](../notification/#notifications-notification-settings-change-notification-settings)

### 31-07-2025
#### Added
- link to Production Order in [Sales Order](../documents/#transactions-sales-order)
- link to Production Order in [Internal Order](../documents/#transactions-internal-order)
- link to Production Order in [Purchase Order](../documents/#transactions-purchase-order)
- link to Production Order in [Receiving](../documents/#transactions-receiving)
- link to Production Order in [Transfer](../documents/#transactions-transfer)
- Error [17024](../#kladana-json-api-errors-error-codes-for-documents)

### 24-07-2025
#### Fixed
- Typo in data types corrected from int to float for the volume and weight fields for [bundle](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-bundle)

### 22-07-2025
#### Added
- The minimumStock field in the [Product variant](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-product-variant-product-variants) entity for working with Minimum Stock.

### 17-07-2025
#### Added
- Add new [error 13005](../#kladana-json-api-errors-error-codes-for-the-stock-report)

### 10-07-2025
#### Added
- Add new [error 33013](../#kladana-json-api-errors-error-codes-for-printed-forms)

### 09-07-2025
#### Added
- Add new [error 3043](..#kladana-json-api-errors-common-validation-errors)

### 02-07-2025
#### Fixed
- Actualized [User Settings](../dictionaries/#entities-user-settings)

### 01-07-2025
#### Added
- Field `plannedEndDate` in [Production Operations](../documents/#transactions-production-order-production-operations)

### 09-06-2025
#### Added
- Description of `fields` parameter [Fields](../#kladana-json-api-general-info-what-is-fields)
- [Brief Report on Warehouse Bin Balances](../reports/#reports-stock-report-get-a-brief-report-on-warehouse-bin-balances)

### 03-06-2025
#### Added
- Fields `description`, `defect` in [Operation Report](../documents/#transactions-operation-report)
- Errors [26211-26213](../#kladana-json-api-errors-error-codes-for-operation-reports)

### 27-05-2025
#### Added
- New transaction types for [Event Feed](../dictionaries/#entities-event-feed)

### 20-05-2025
#### Added
- Add new [error 3042](..#kladana-json-api-errors-common-validation-errors)

### 15-05-2025
#### Changed
- Description of `accountCountry` attribute in [Company Settings](../dictionaries/#entities-company-settings)

### 13-05-2025
#### Added
- Description and examples of bulk deletion of minimum stock using the bulk deletion endpoint in the [product](../dictionaries/#entities-product)

### 05-05-2025
#### Changed
- Field `companyType` in [Counterparty](../dictionaries/#entities-counterparty-counterparties)
- Field `companyType` in [Legal entity](../dictionaries/#entities-entity-legal-entity)
- Requisites details in [Counterparty](../dictionaries/#entities-counterparty-counterparties)
- Requisites details in [Legal entity](../dictionaries/#entities-entity-legal-entity)

### 25-04-2025
#### Added
- The minimumStock field in the [product](../dictionaries/#entities-product) entity for working with Minimum Stock.

### 15-04-2025
#### Changed
- Field `companyType` in [Counterparty](../dictionaries/#entities-counterparty-counterparties)
- Field `companyType` in [Legal entity](../dictionaries/#entities-entity-legal-entity)
- Requisites details in [Counterparty](../dictionaries/#entities-counterparty-counterparties)
- Requisites details in [Legal entity](../dictionaries/#entities-entity-legal-entity)

### 10-04-2025
#### Changed
- Description for automatically disabling JSON API for a user in [Limitations](../#kladana-json-api-limitations)

### 10-03-2025
#### Added
- Bundles are supported in the following transactions containing the Commission Agency Contract:
  - Shipment
  - Sales Order
  - Sales Return
  - Consignee Statement Received

#### Changed
- Description of `32001` [error code](../#kladana-json-api-errors-error-codes-for-contracts)

#### Removed
- `18002` [error code](../#kladana-json-api-errors-error-codes-for-sales-and-shipments)

### 05-03-2025
#### Changed
- Set `legalIN` as the only available value for `companyType` in [Counterparty](../dictionaries/#entities-counterparty-counterparties-counterparty-type)
- Set `legalIN` as the only available value for `companyType` in [Legal entity](../dictionaries/#entities-entity-legal-entity-legal-entity-type)

### 10-02-2025
#### Changed
- Field `companyType` in [Counterparty](../dictionaries/#entities-counterparty-counterparties)
- Field `companyType` in [Legal entity](../dictionaries/#entities-entity-legal-entity)
- Requisites details in [Counterparty](../dictionaries/#entities-counterparty-counterparties)
- Requisites details in [Legal entity](../dictionaries/#entities-entity-legal-entity)


### 02-12-2024
#### Added
- Renamed "User Directory" to "[Custom list](../dictionaries/#entities-custom-list)" to align with the web interface.
- Added metadata output for additional fields in Custom list metadata.
- Added an `ID` field to the metadata of a Custom list.
- Added output of additional fields in Custom list elements.

### 19-11-2024
#### Added
- Field `salesMargin` added in [Profit Report](https://dev.kladana.com/doc/api/remap/1.2/reports/#reports-profit-report)

### 29-10-2024
#### Added
- Error [71000](../#kladana-json-api-errors-error-codes-for-series)

### 22-07-2024
#### Added
- The ability to specify multiple warehouses in the [Stock Movement Report](../reports/#reports-stock-movement-report)

### 16-07-2024
#### Added
- Added description of getting a link to [image](../dictionaries/#entities-image-get-a-link-to-the-image-of-product-product-variant-bundle)

### 12-07-2024
#### Added
- New [Report on product range documents](../reports/#reports-report-on-product-range-documents)

### 01-07-2024
#### Changed
- Added viewProductCostAndProfit permission to the list of [employee request context] permissions (../#mojsklad-json-api-obschie-swedeniq-kontext-zaprosa-sotrudnika)

### 26-06-2024
#### Added
- Condition for automatically disabling JSON API for a user in [Limitations](../#kladana-json-api-limitations).
- Condition for automatically disabling a webhook in [Limitations](../#kladana-json-api-limitations).

### 24-06-2024
#### Added
- Error [17023](../#kladana-json-api-errors-error-codes-for-documents)

### 06-03-2024
#### Added
- Endpoint [Serial numbers](../dictionaries/#entities-serial-number)

### 31-01-2024
#### Added
- Field `state` added in [Task](../dictionaries/#entities-task) - [Task type](../dictionaries/#entities-task-task-type) entity

### 11-01-2024
#### Created
- Add `materialProcessingPlan` for [BoM](../dictionaries/#entities-bills-of-materials), BoM for material

### 25-12-2023
#### Changed
- Changed type of `agent` attribute in [Balance adjustment](../documents/#transactions-balance-adjustment). Now it can take `employee` value.
- Transaction `Counterparty Balance adjustment` was renamed to `Balance adjustment`
- Changed type of `agent` attribute in [Outgoing Payment](../documents/#transactions-outgoing-payment). Now it can take `employee` value.

### 27-11-2023
#### Fixed
- Actualized [Contract](../dictionaries/#entities-contract) `Required when creating` fields

### 03-08-2023
#### Fixed
- Links in documentation sections
