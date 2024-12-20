# Changelog

The section lists changes to existing endpoints and new endpoints that allow you to interact with the Kladana API more effectively.
 
See Kladana API 1.2 changelog on [github](https://github.com/moysklad/api-remap-1.2-doc-in/blob/master/CHANGELOG.md).

Learn more about working with the Kladana API in [Workbook](../workbook/#workbook).

### 02-12-2024
#### Added
- Renamed "User Directory" to "[Custom list](../dictionaries/#entities-custom-list)" to align with the web interface.
- Added metadata output for additional fields in Custom list metadata.
- Added an `ID` field to the metadata of a Custom list.
- Added output of additional fields in Custom list elements.

### 19-11-2024
#### Added
- Field `salesMargin` added in [Profitability report](https://dev.kladana.com/doc/api/remap/1.2/reports/#reports-profitability-report)

### 29-10-2024
#### Added
- Error [71000](../#kladana-json-api-errors-error-codes-for-series)

### 22-07-2024
#### Added
- The ability to specify multiple warehouses in the [turnover report](../reports/#reports-stock-movement-report)

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
