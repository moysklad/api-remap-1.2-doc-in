# JSON API 1.2 Changelog

JSON API 1.2 changes will be added here soon

## 26-03-2025
### Added
- Field `currency` added in [Legal entity accounts](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-entity-legal-entity)

## 10-03-2025
### Added
- Bundles are supported in the following transactions containing the Commission Agency Contract:
  - Shipment
  - Sales Order
  - Sales Return
  - Consignee Statement Received

### Changed
- Description of `32001` [error code](https://dev.kladana.com/doc/api/remap/1.2/index.html#kladana-json-api-errors-error-codes-for-contracts)

### Removed
- `18002` [error code](https://dev.kladana.com/doc/api/remap/1.2/index.html#kladana-json-api-errors-error-codes-for-sales-and-shipments)

## 05-03-2025
### Changed
- Set `legalIN` as the only available value for `companyType` for India in [Counterparty](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-counterparty-counterparties-counterparty-type)
- Set `legalIN` as the only available value for `companyType` for India in [Legal entity](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-entity-legal-entity-legal-entity-type)

## 10-02-2025
### Changed
- Field `companyType` in [Counterparty](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-counterparty-counterparties)
- Field `companyType` in [Legal entity](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-entity-legal-entity)
### Added
- Requisites details in [Counterparty](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-counterparty-counterparties)
- Requisites details in [Legal entity](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-entity-legal-entity)

## 02-12-2024
### Added
- Renamed "User Directory" to "[Custom list](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-custom-list)" to align with the web interface.
- Added metadata output for additional fields in Custom list metadata.
- Added an `ID` field to the metadata of a Custom list.
- Added output of additional fields in Custom list elements.

## 19-11-2024
### Added
- Field `salesMargin` added in [Profit Report](https://dev.kladana.com/doc/api/remap/1.2/reports/#reports-profit-report)

## 29-10-2024
### Added
- Error [71000](https://dev.kladana.com/doc/api/remap/1.2/#kladana-json-api-errors-error-codes-for-series)

## 22-07-2024
### Added
- The ability to specify multiple warehouses in the [turnover report](https://dev.kladana.com/doc/api/remap/1.2/reports/#reports-stock-movement-report)

## 24-06-2024
### Added
- Error [17023](https://dev.kladana.com/doc/api/remap/1.2/#kladana-json-api-errors-error-codes-for-documents)

## 06-03-2024
### Added
- Endpoint [Serial numbers](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-serial-number)

## 31-01-2024
### Added
- Field `state` added in [Task](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-task) - [Task type](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-task-task-type) entity

## 11-01-2024
### Created
- Add `materialProcessingPlan` for [BoM](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-bills-of-materials), BoM for material

## 25-12-2023
### Changed
- Changed type of `agent` attribute in [Balance adjustment](https://dev.kladana.com/doc/api/remap/1.2/documents/#transactions-balance-adjustment). Now it can take `employee` value.
- Transaction `Counterparty Balance adjustment` was renamed to `Balance adjustment`
- Changed type of `agent` attribute in [Outgoing Payment](https://dev.kladana.com/doc/api/remap/1.2/documents/#transactions-outgoing-payment). Now it can take `employee` value.

## 27-11-2023
### Fixed
- Actualized [Contract](https://dev.kladana.com/doc/api/remap/1.2/dictionaries/#entities-contract) `Required when creating` fields

## 03-08-2023
### Fixed
- Links in documentation sections
