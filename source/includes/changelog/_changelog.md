# Changelog

The section lists changes to existing endpoints and new endpoints that allow you to interact with the Kladana API more effectively.
 
See Kladana API 1.2 changelog on [github](https://github.com/moysklad/api-remap-1.2-doc-in/blob/master/CHANGELOG.md).

Learn more about working with the Kladana API in [Workbook](../workbook/#workbook).

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

### 10-02-2025
#### Changed
- Field `companyType` in [Counterparty](../dictionaries/#entities-counterparty-counterparties)
- Field `companyType` in [Legal entity](../dictionaries/#entities-entity-legal-entity)
#### Added
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
