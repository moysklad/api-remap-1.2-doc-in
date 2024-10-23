# Changelog

The section lists changes to existing endpoints and new endpoints that allow you to interact with the Kladana API more effectively.
 
See Kladana API 1.2 changelog on [github](https://github.com/moysklad/api-remap-1.2-doc-in/blob/master/CHANGELOG.md).

Learn more about working with the Kladana API in [Workbook](../workbook/#workbook).

### 03-09-2024
#### Added
- "Material warehouse" field (materialStore) in [Bills of Materials](../dictionaries/#suschnosti-tehkarta)
- "Material warehouse" field  (materialStore) in [Production Operation](../documents/#dokumenty-proizwodstwennoe-zadanie-proizwodstwennye-atapy)

### 28-08-2024
#### Added
- Filter parameter `productionTask` in the list request of [Process Tracking](../documents/#dokumenty-vypolnenie-atapa-proizwodstwa-poluchit-spisok-vypolnenij-atapow-proizwodstwa)

### 26-08-2024
#### Added
- Filter parameter `moment` in the query of the list of [Process Tracking](../documents/#dokumenty-vypolnenie-atapa-proizwodstwa-poluchit-spisok-vypolnenij-atapow-proizwodstwa)
- Filter parameters `moment`, `organization`, `deliveryPlannedMoment` in the query of the list of [Production Orders](../documents/#dokumenty-proizwodstwennoe-zadanie)

### 22-08-2024
#### Added
- Flag "Without closing documents" for [Outgoing payment](../documents/#dokumenty-ishodqschij-platezh)
- Flag "Without closing documents" for [Outgoing Cash Payment](../documents/#dokumenty-rashodnyj-order)

### 22-07-2024
#### Added
- Ability to specify multiple warehouses in the [Stock Movement Report](../reports/#otchety-otchet-oboroty)

### 16-07-2024
#### Added
- Added description of getting a link to [image](../dictionaries/#suschnosti-izobrazhenie-poluchit-ssylku-na-izobrazhenie-towara-ili-komplekta-ili-modifikacii)

### 12-07-2024
#### Added
- New [Report based on transaction nomenclature](../reports/#otchety-otchet-po-dokumentam-nomenklatury)

### 1-07-2024
#### Changed
- Added viewProductCostAndProfit permission to the list of [employee request context] permissions (../#mojsklad-json-api-obschie-swedeniq-kontext-zaprosa-sotrudnika)

### 26-06-2024
#### Added
- Condition for automatically disabling JSON API for a user in [Limitations](../#kladana-json-api-general-info-restrictions).
- Condition for automatically disabling a webhook in [Limitations](../#kladana-json-api-general-info-restrictions).

### 24-06-2024
#### Added
- Error [17023](../#kladana-json-api-errors-error-codes-for-documents)

### 22-07-2024
#### Added
- The ability to specify multiple warehouses in the [Stock Movement Report](../reports/#reports-stock-movement-report)

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
