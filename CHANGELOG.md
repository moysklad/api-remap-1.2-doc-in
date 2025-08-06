# JSON API 1.2 Changelog

JSON API 1.2 changes will be added here soon

### 07-08-2025
#### Added
- New notification type added [New event in the event feed](https://dev.kladana.com/doc/api/remap/1.2/notification/#notifications-detailed-description-of-notification-types-new-event-in-the-event-feed)
- New notification group added [Followed events](https://dev.kladana.com/doc/api/remap/1.2/notification/#notifications-notification-settings-change-notification-settings)

### 31-07-2025
#### Added
- link to Production Order in [Sales Order](https://dev.kladana.com/doc/api/remap/1.2/documents/#transactions-sales-order)
- link to Production Order in [Internal Order](https://dev.kladana.com/doc/api/remap/1.2/documents/#transactions-internal-order)
- link to Production Order in [Purchase Order](https://dev.kladana.com/doc/api/remap/1.2/documents/#transactions-purchase-order)
- link to Production Order in [Receiving](https://dev.kladana.com/doc/api/remap/1.2/documents/#transactions-receiving)
- link to Production Order in [Transfer](https://dev.kladana.com/doc/api/remap/1.2/documents/#transactions-transfer)
- Error [17024](https://dev.kladana.com/doc/api/remap/1.2/#kladana-json-api-errors-error-codes-for-documents)

### 24-07-2025
#### Fixed
- Typo in data types corrected from int to float for the volume and weight fields for [bundle](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-bundle)

### 22-07-2025
#### Added
- The minimumStock field in the [Product variant](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-product-variant-product-variants) entity for working with Minimum Stock.

### 17-07-2025
#### Added
- Add new [error 13005](https://dev.kladana.com/doc/api/remap/1.2/#kladana-json-api-errors-error-codes-for-the-stock-report)

### 10-07-2025
#### Added
- Add new [error 33013](https://dev.kladana.com/doc/api/remap/1.2/#kladana-json-api-errors-error-codes-for-printed-forms)

### 09-07-2025
#### Added
- Add new [error 3043](https://dev.kladana.com/doc/api/remap/1.2/#kladana-json-api-errors-common-validation-errors)

### 02-07-2025
#### Fixed
- Actualized [User Settings](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-user-settings)

### 01-07-2025
#### Added
- Field `plannedEndDate` in [Production Operations](https://dev.kladana.com/doc/api/remap/1.2/documents/#transactions-production-order-production-operations)

### 09-06-2025
#### Added
- Description of `fields` parameter [Fields](https://dev.kladana.com/doc/api/remap/1.2/#kladana-json-api-general-info-what-is-fields)
- [Brief Report on Warehouse Bin Balances](https://dev.kladana.com/doc/api/remap/1.2/reports/#reports-stock-report-get-a-brief-report-on-warehouse-bin-balances)

### 03-06-2025
#### Added
- Fields `description`, `defect` in [Operation Report](https://dev.kladana.com/doc/api/remap/1.2/documents/#transactions-operation-report)
- Errors [26211-26213](https://dev.kladana.com/doc/api/remap/1.2/#kladana-json-api-errors-error-codes-for-operation-reports)

### 27-05-2025
#### Added
- New transaction types for [Event Feed](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-event-feed)

### 20-05-2025
#### Added
- Add new [error 3042](https://dev.kladana.com/doc/api/remap/1.2/#kladana-json-api-errors-common-validation-errors)

### 15-05-2025
#### Changed
- Description of `accountCountry` attribute in [Company Settings](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-company-settings)

### 13-05-2025
#### Added
- Description and examples of bulk deletion of minimum stock using the bulk deletion endpoint in the [product](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-product)

### 05-05-2025
#### Changed
- Field `companyType` in [Counterparty](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-counterparty-counterparties)
- Field `companyType` in [Legal entity](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-entity-legal-entity)
- Requisites details in [Counterparty](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-counterparty-counterparties)
- Requisites details in [Legal entity](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-entity-legal-entity)

### 25-04-2025
#### Added
- The minimumStock field in the [product](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-product) entity for working with Minimum Stock.

### 15-04-2025
#### Changed
- Field `companyType` in [Counterparty](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-counterparty-counterparties)
- Field `companyType` in [Legal entity](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-entity-legal-entity)
- Requisites details in [Counterparty](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-counterparty-counterparties)
- Requisites details in [Legal entity](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-entity-legal-entity)

### 10-04-2025
#### Changed
- Description for automatically disabling JSON API for a user in [Limitations](https://dev.kladana.com/doc/api/remap/1.2/#kladana-json-api-limitations)

### 10-03-2025
#### Added
- Bundles are supported in the following transactions containing the Commission Agency Contract:
  - Shipment
  - Sales Order
  - Sales Return
  - Consignee Statement Received

#### Changed
- Description of `32001` [error code](https://dev.kladana.com/doc/api/remap/1.2/index.html#kladana-json-api-errors-error-codes-for-contracts)

#### Removed
- `18002` [error code](https://dev.kladana.com/doc/api/remap/1.2/index.html#kladana-json-api-errors-error-codes-for-sales-and-shipments)

### 05-03-2025
#### Changed
- Set `legalIN` as the only available value for `companyType` for India in [Counterparty](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-counterparty-counterparties-counterparty-type)
- Set `legalIN` as the only available value for `companyType` for India in [Legal entity](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-entity-legal-entity-legal-entity-type)

### 10-02-2025
#### Changed
- Field `companyType` in [Counterparty](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-counterparty-counterparties)
- Field `companyType` in [Legal entity](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-entity-legal-entity)
- Requisites details in [Counterparty](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-counterparty-counterparties)
- Requisites details in [Legal entity](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-entity-legal-entity)

### 02-12-2024
#### Added
- Renamed "User Directory" to "[Custom list](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-custom-list)" to align with the web interface.
- Added metadata output for additional fields in Custom list metadata.
- Added an `ID` field to the metadata of a Custom list.
- Added output of additional fields in Custom list elements.

### 19-11-2024
#### Added
- Field `salesMargin` added in [Profit Report](https://dev.kladana.com/doc/api/remap/1.2/reports/#reports-profit-report)

### 29-10-2024
#### Added
- Error [71000](https://dev.kladana.com/doc/api/remap/1.2/#kladana-json-api-errors-error-codes-for-series)

### 22-07-2024
#### Added
- The ability to specify multiple warehouses in the [turnover report](https://dev.kladana.com/doc/api/remap/1.2/reports/#reports-stock-movement-report)

### 24-06-2024
#### Added
- Error [17023](https://dev.kladana.com/doc/api/remap/1.2/#kladana-json-api-errors-error-codes-for-documents)

### 06-03-2024
#### Added
- Endpoint [Serial numbers](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-serial-number)

### 31-01-2024
#### Added
- Field `state` added in [Task](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-task) - [Task type](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-task-task-type) entity

### 11-01-2024
#### Created
- Add `materialProcessingPlan` for [BoM](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-bills-of-materials), BoM for material

### 25-12-2023
#### Changed
- Changed type of `agent` attribute in [Balance adjustment](https://dev.kladana.com/doc/api/remap/1.2/documents/#transactions-balance-adjustment). Now it can take `employee` value.
- Transaction `Counterparty Balance adjustment` was renamed to `Balance adjustment`
- Changed type of `agent` attribute in [Outgoing Payment](https://dev.kladana.com/doc/api/remap/1.2/documents/#transactions-outgoing-payment). Now it can take `employee` value.

### 27-11-2023
#### Fixed
- Actualized [Contract](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-contract) `Required when creating` fields

### 03-08-2023
#### Fixed
- Links in documentation sections
