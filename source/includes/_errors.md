## Errors

This section lists the JSON API error codes and their descriptions.

| Error code | Message | Description   |
| ---------- | ------- | ------------- |
| <a name="error_1000">1000</a> | The URI element is not an identifier | Most likely you are trying to access a non-existent resource. Check the URI you specified, check if you specified the entity keyword correctly and if you copied the entire ID. |
| <a name="error_1001">1001</a> | Metadata identifier not specified | When accessing a custom directory, the URI must contain the correct {id} metadata of this directory. It can be refined by querying the company settings metadata `companysettings/metadata` in the customEntities array.   |
| <a name="error_1002">1002</a> | Unidentified path: {path} | Could not determine the resource on which the request was made. Check the URI on which the request is made.  |
| <a name="error_1003">1003</a> | Missing metadata for type {type} | Metadata cannot be retrieved for this resource. Check the documentation for the entity type again and make sure that the resource "Metadata <entity_name>" |
| <a name="error_1004">1004</a> | Error while generating result: {error text} | An error occurred while parsing the passed object. Check the correctness of the transmitted data.   |
| <a name="error_1005">1005</a> | Unknown type: {type} | The entity type specified in the URI could not be found. Check if the keyword is correct. |
| <a name="error_1006">1006</a> | Creation of objects with the specified identifier is prohibited | When creating an entity, you do not need to specify the entity id in the request URI. The create request must be made at the same URI as the request to get the list of entities of the given type.  |
| <a name="error_1007">1007</a> | Unknown field: {field name} | When updating the entity, the specified field was not found. Check the spelling of the field name, and also make sure that this field is present among the attributes of entities of this type.  |
| <a name="error_1008">1008</a> | Error loading object with type '{type}' and id '{id}' | Failed to load entity with given id. Check if the id is correct. Make sure that the entity with the given id is present in the list of entities of the given type (perhaps the entity with the given id has been deleted).  |
| <a name="error_1009">1009</a> | Editing objects of type '{type}' is not supported | The entity you are trying to update is read-only. Its attributes cannot be changed.  |
| <a name="error_1010">1010</a> | Deleting objects of type '{type}' is not supported | You cannot delete an entity of this type. Check if there is a delete operation among the operations of this entity type. |
| <a name="error_1011">1011</a> | Creation of objects of type '{type}' is not supported | You cannot create an entity of this type. Check if there is a create operation among the operations of this entity type.  |
| <a name="error_1012">1012</a> | Object identifier not specified | For update and delete operations, you must specify the id of the entity on which the operation is performed.  |
| <a name="error_1013">1013</a> | Removing nested objects is not supported | It is not possible to delete nested entities such as account accounts. If you want to nullify the value of a field: try passing null as the value of the given field in the non-update query. In the case of transaction items, you can pass an empty array. This will be equivalent to deleting all items from the document at once. |
| <a name="error_1014">1014</a> | Invalid value '{value}' of filter parameter '{parameter name}' | You specified a value of an unsupported type for the given parameter (for example, you passed an int instead of a boolean). There may be an error in the wrong date and time format.  |
| <a name="error_1015">1015</a> | Wrong version specified in url: {url} | Check the required API version in the url you are making the request to. `api.kladana.com/api/1.x/...` API versions differ from each other in the number of available resources, as well as in the way data is processed, and that is why they are an important element in identifying a particular resource.                          |
| <a name="error_1016">1016</a> | Access Denied: You do not have permission to view this item | Your account administrator has restricted your rights to view entities of this type. Contact him for details.  |
| <a name="error_1017">1017</a> | Access denied: You do not have permission to edit this object | Your account administrator has restricted your rights to edit entities of this type. Contact him for details.    |
| <a name="error_1018">1018</a> | Access Denied: You do not have permission to delete this item | Your account administrator has restricted your rights to delete entities of this type. Contact him for details.  |
| <a name="error_1019">1019</a> | Reading field '{field name}' is not supported | Unable to read field of this type. |
| <a name="error_1020">1020</a> | Parent object with type '{type}' and id '{id}' does not exist| Invalid parent entity id.  |
| <a name="error_1021">1021</a> | Object with type '{type}' and id '{id}' not found | Failed to load entity of given type with given id. Check if the id is correct. Make sure that the entity with the given id is present in the list of entities of the given type (perhaps the entity with the given id has been deleted). |
| <a name="error_1022">1022</a> | Error creating object | An error occurred while creating an entity of this type.  |
| <a name="error_1023">1023</a> | Error saving object: child object with type '{type}' and id '{id}' is already in use and cannot be deleted | It is not possible to delete an object in a nested collection. it's already in use somewhere. For example, it may occur when deleting a item from a document for which there is a return in which this item is present. |
| <a name="error_1024">1024</a> | Object save error: Standard objects cannot be modified | You are trying to change the entity that is created by default in the Kladana service immediately after registering an account. It is forbidden to do this. (For example, changing default countries and units). |
| <a name="error_1025">1025</a> | Object deletion error: Standard objects cannot be deleted | Removing standard objects such as standard units of measurement, currencies, countries, etc. not supported.  |
| <a name="error_1026">1026</a> | Updating objects of type '{type}' is not supported | Updating objects of the specified type is not supported in the JSON API.  |
| <a name="error_1027">1027</a> | Request contains no objects | The body of create/update requests must be in the form of an object or a JSON array. |
| <a name="error_1028">1028</a> | The object is already in use and cannot be deleted | The entity is used in the entities and documents listed in the error, so it cannot be deleted. For example, you cannot delete an item that is used as an item in a document.  |
| <a name="error_1029">1029</a> | Templates for type '{type}' are not supported | Cannot create a prepopulated entity of this type.   |
| <a name="error_1030">1030</a> | Filter field '{field name}' can only be specified once | Make sure that each field is used only once in the filtering options.   |
| <a name="error_1031">1031</a> | Template generation error: Unable to create object template based on specified fields | It is not possible to create a prepopulated entity of this type based on another.  |
| <a name="error_1032">1032</a> | Filtering error: feature '{feature name/id}' does not exist | This product variant does not have a characteristic with the specified id. Check the correctness of the entered id and the list of characteristics for the product variant.  |
| <a name="error_1034">1034</a> | Filtering error: {error text} | An error occurred while processing filters. Check the passed filters for validity. You can read more about filtering options in the corresponding section of the documentation or in the documentation for the entity you are trying to apply filters to.  |
| <a name="error_1035">1035</a> | Filtering Error: Wrong date format of the filter parameter | Check the date and time value. It must follow the format `yyyy-MM-dd HH:mm:ss`. |
| <a name="error_1036">1036</a> | Error while generating metadata | Description Internal service error. Try to repeat the request.   |
| <a name="error_1037">1037</a> | Wrong Content-Type of the request | Description The resource you are accessing may require form-data instead of JSON (or vice versa). |
| <a name="error_1038">1038</a> | Error in request address | Description Check if you are providing a valid request address.   |
| <a name="error_1039">1039</a> | Operation {HTTP method} is not supported for this resource | Description Check the method with which you are accessing the resource. Make sure the resource's documentation describes this method so that it can be applied.  |
| <a name="error_1040">1040</a> | Invalid request parameters | Description One or more query parameters were specified incorrectly. Check the parameter format according to the documentation.   |
| <a name="error_1041">1041</a> | Invalid value '{value}' of filtering parameter '{parameter name}', valid values: '{list of valid values}' | The parameter value must be in the list of valid values.  |
| <a name="error_1042">1042</a> | Invalid value '{value}' for sort parameter '{parameter name}', valid values: '{list of valid values}' | The parameter value must be in the list of valid values. |
| <a name="error_1043">1043</a> | Your tariff plan does not allow you to work with CRM | Your tariff is not suitable for working with CRM.  |
| <a name="error_1044">1044</a> | Maximum request size exceeded | The maximum request size is 10 MB.    |
| <a name="error_1045">1045</a> | Access Denied: You do not have permission to create this object | Your account administrator has restricted your rights to create entities of this type. Contact him for details.  |
| <a name="error_1046">1046</a> | A child entity cannot change its parent entity | You may have tried to substitute item(s) from one document to another (Try removing meta, id, accountId from document and item(s)).  |
| <a name="error_1047">1047</a> | You cannot update the syncId field in an entity update request | The syncId field can only be specified when the entity is created. It cannot be changed in an update request. |
| <a name="error_1048">1048</a> | The limit on the number of attempts to verify the username and password has been exceeded | Exceeded the number of authentication attempts with invalid data. Please try again later with the correct username and password or token.  |
| <a name="error_1052">1052</a> | Invalid UUID format | Check your generated UUIDs for correctness.  |
| <a name="error_1056">1056</a> | Authentication error: {authentication error text} | Check the credentials provided for authentication. This resource may require a different kind of authentication. |
| <a name="error_1058">1058</a> | Failed to decode request parameters from URL | Check the request. There are probably parameters in the string that have not been urlencoded.  |
| <a name="error_1059">1059</a> | Incorrect server in object id: '{id}'| The object identifier contains a server other than api.kladana.com.   |
| <a name="error_1060">1060</a> | Incorrect data type in meta entity, field type | The data type specified in the type field of the entity's metadata does not match the expected type.   |
| <a name="error_1061">1061</a> | No API access for this user | There is no API access for this user - contact your account administrator.   |
| <a name="error_1062">1062</a> | Invalid 'Accept' header value. Only 'application/json;charset=utf-8' | The 'Accept' header value can only be application/json;charset=utf-8.   |
| <a name="error_1063">1063</a> | Sort error: unknown field '{field name}' or sorting is not supported for this field | Sorting is not supported for this field. The field may not be in the list of supported fields.  |
| <a name="error_1064">1064</a> | Access Denied: You do not have permission to print these objects | Your account administrator has restricted your rights to print this type of entity. Contact him for details. |
| <a name="error_1065">1065</a> | Error saving object: object already changed/deleted in parallel query | The error occurs when trying to modify an object from multiple concurrent API requests. |
| <a name="error_1066">1066</a> | Object deletion error: object cannot be moved to trash | Deletion to the trash is possible only for documents. Check if the object being deleted is a document.  |
| <a name="error_1067">1067</a> | Object deletion error: Recycle bin disabled | Disabled the option to delete documents in the trash - contact your account administrator. |
| <a name="error_1068">1068</a> | The point of sale is disabled. Contact your account administrator | Make sure your plan supports POS. |
| <a name="error_1069">1069</a> | Request failed: incompatible request parameters: '{incompatible parameters}' | Not all query parameters can be applied at the same time, they are listed in the error text: '{inconsistentstim parameters}'. Parameters should be excluded from the request, considering compatibility.  |
| <a name="error_1070">1070</a> | Error: your tariff plan does not allow you to work with this resource | On your tariff plan, work with the specified resource is not available.  |
| <a name="error_1071">1071</a> | Exceeded the limit on the number of registration attempts | You have tried to register too many times.  |
| <a name="error_1072">1072</a> | The limit on the number of registrations from the specified address has been exceeded | You have tried to register too many times.  |
| <a name="error_1073">1073</a> | Concurrent request limit exceeded | You are receiving too many concurrent requests per unit of time.  |
| <a name="error_1074">1074</a> | The service is temporarily unavailable, technical work is underway | The server is undergoing technical work. |
| <a name="error_1075">1075</a> | Access denied: You do not have permission to edit field {field name} | You tried to edit a field that requires a higher level of access. |
| <a name="error_1076">1076</a> | Error while working with files: file has no name | The filename field of the File must be filled in. |
| <a name="error_1077">1077</a> | Error while working with files: file has no content | The content field of the File must be filled. |
| <a name="error_1078">1078</a> | Error while working with files: cannot convert field content to image | An error occurred while converting a base64 jpg or png file to an image. |
| <a name="error_1079">1079</a> | Error when working with files: the file size exceeds the maximum allowed (10 mb) | The maximum file size cannot exceed 10 MB.  |
| <a name="error_1080">1080</a> | Error while working with files: the number of files cannot be more than 100 | The maximum number of files uploaded for one object cannot exceed 100 pieces. |
| <a name="error_1081">1081</a> | Error while working with files: insufficient storage space | The storage space allocated for your account has run out.  |
| <a name="error_1082">1082</a> | File handling error: Can't upload more than 10 files at once | The maximum number of files uploaded by one request cannot exceed 10 pieces.  |
| <a name="error_1083">1083</a> | Error while generating result: {error text} | An error occurred on the server side while generating the response. Try to repeat the request again. |
| <a name="error_1084">1084</a> | Invalid value '{value}' of query parameter '{parameter}', valid values: '{list of valid values}' | You specified an invalid value for this parameter. Check that the passed value is valid. |
| <a name="error_1085">1085</a> | The type of authorization used does not contain information about the user | You need a different authorization method that contains information about the user. For example, [basic or token](#kladana-json-api-general-info-authentication). |
| <a name="error_1088">1088</a> | Maximum request response time exceeded | The request for bulk create/update/delete exceeded the maximum allowed. |
| <a name="error_1089">1089</a> | Expand field {path and field name} is not supported | Expand of the requested field is not allowed in the used endpoint |
| <a name="error_1090">1090</a> | Additional directory {name of directory} is used in: {document names} and cannot be deleted | The additional directory is used as an additional field in the documents listed in the error.  |
| <a name="error_1091">1091</a> | Invalid values ​​{query value} for query parameter {parameter name} | The parameter can only accept values ​​from a limited list. The values ​​passed are not in this list. |
| <a name="error_1092">1092</a> | Access denied: you do not have permission to hold the {object type} object | The parameter can only accept values ​​from a limited list. The values ​​passed are not in this list. |
| <a name="error_1093">1093</a> | Missing mandatory header {header name} | Mandatory request header not specified. |
| <a name="error_1999">1999</a> | Unknown error | An unexpected error has occurred. Please contact Kladana technical support and provide details about the conditions under which the error occurred. |

### Format errors

| Error code | Message | Description |
| ---------- | ------- | ----------- |
| <a name="error_2000">2000</a> | Format error: Missing start of object | The beginning of the object was expected at this location. Check the request body. |
| <a name="error_2001">2001</a> | Format Error: Incoming request does not match JSON format | The data must be sent in JSON format. If so, and the error still occurs, try adding a Header `Content-Type` with a value of `application/json`. |
| <a name="error_2002">2002</a> | Format error: unnamed array internal field | Check if you have specified the field name of the array type. Perhaps there are extra opening/closing brackets in the request body. |
| <a name="error_2003">2003</a> | Format error: unnamed internal field of type object | Check if you specified the name of the field of type "object". Perhaps there are extra opening/closing brackets in the request body. |
| <a name="error_2004">2004</a> | Format error: nested arrays are not allowed | The JSON API does not handle arrays of arrays. Check the request body for correctness. |
| <a name="error_2005">2005</a> | Format Error: Incoming JSON must start with either an object or an array | Missing opening curly/square bracket at the start of the request body. |
| <a name="error_2006">2006</a> | Format Error: Too many objects nested | The maximum nesting depth in the JSON API is 10. Adjust the request body to make sure this limit is not violated. |
| <a name="error_2007">2007</a> | Format Error: Too many nested objects | In the JSON API, an array can contain no more than 1000 objects. |
| <a name="error_2008">2008</a> | Format error: template request must not contain an array | Only 1 template can be created using a query on the `{entity_name}/new` resource. Passing an array of values is not supported. |
| <a name="error_2009">2009</a> | Format error: single entity create/update request must not contain an array | When updating a single entity, it is assumed that its new representation (one) will be transmitted in the request body. There must be one root object in the request body. |
| <a name="error_2010">2010</a> | Format error: missing href for meta field '{ext. message}' | The passed metadata object is missing the href field. Check the request body. |
| <a name="error_2011">2011</a> | Format error: missing type for meta field '{ext. message}' | The passed metadata object is missing a type field. Check the request body. |
| <a name="error_2012">2012</a> | Format error: unknown type for meta field '{ext. message}' | In the passed objectThose metadata specified an unknown type. Check the request body. Perhaps you are specifying the wrong keyword for the entity. Check the documentation for this entity and make sure the type passed is correct. |
| <a name="error_2013">2013</a> | Format error: invalid href value for meta field '{ext. message}' | The passed href points to a non-existent object. Make sure the link is correct. The error can be in the API version, resource type (entity/pos/report), entity/(report) keyword, entity id. |
| <a name="error_2014">2014</a> | Format error: missing meta for field '{field name}' | Metadata type fields (links to other related objects) require a value in the form of an object containing meta. |
| <a name="error_2015">2015</a> | Format error: missing ID for field '{field name}' | When passing nested entities as fields, you must specify the ID of these entities. |
| <a name="error_2016">2016</a> | Format error: field value '{field name}' does not match type {field type} | A value of the wrong type was passed for the specified field. Correct the request body. |
| <a name="error_2017">2017</a> | Format error: unknown error | Failed to unambiguously classify the error. Make sure that the format of the data you are transferring matches the required one. See the documentation for the entity you are using for sample queries. |
| <a name="error_2018">2018</a> | Format error: missing field `<field>` for meta `<type>` | You didn't specify a required field in the meta object. |
| <a name="error_2021">2021</a> | Format error: in objects of type '<type>', field '<field name>' cannot be assigned an object of type <object type> | For entities of this type, the specified field cannot have the specified value. For example, you cannot set the agent field of a shipment to a value of type employee, while the same field of an incoming payment can be set to a value of type employee. |
| <a name="error_2022">2022</a> | Format Error: Too many subcollection items | A nested collection can have a maximum of 1000 items. |
| <a name="error_2024">2024</a> | Format error: href points to an entity of the wrong type '<type>', '<type>' is required | The href passed is pointing to an entity of the wrong type. |
| <a name="error_2026">2026</a> | Format error: request must not contain an array | The passed object is an array. Arrays are not supported for this request. |
| <a name="error_2027">2027</a> | Format error: href points to entity of invalid type '<type>', valid values: '<valid types>' | The href passed is pointing to an entity of the wrong type. |
| <a name="error_2028">2028</a> | Format error: Add field '{name of additional fields}' of the entity with ID '{id}' contains a non-numeric value | The received object contains an additional field with an incorrect value |
| <a name="error_2029">2029</a> | Format error: invalid value '{value}' for field '{field name}'. Valid values: {value set} | The retrieved object contains a field that is not in the valid value set. |

### Common validation errors

| Error code                    | Message                                                                                                                                                     | Description                                                                                                                                                                                                                          |
|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <a name="error_3000">3000</a> | Error saving object: field '{field name}' cannot be empty or absent                                                                                         | The required field cannot be empty or missing. You can find all the required fields in the documentation for the entity you are working with, under the heading "Entity Attributes". Such fields are marked as `Required`.           |
| <a name="error_3001">3001</a> | Error saving object: field '{field name}' cannot be modified                                                                                                | You are trying to modify a field that is read-only. All read-only fields can be found in the documentation for the entity you are working with, under the heading "Entity Attributes". Such fields are marked as `Read Only`.        |
| <a name="error_3002">3002</a> | Error saving object: field '{field name}' cannot have a negative value                                                                                      | This field accepts only numeric values greater than or equal to zero.                                                                                                                                                                |
| <a name="error_3003">3003</a> | Error saving object: field '{field name}' must be greater than zero                                                                                         | This field accepts only numeric values greater than zero. This error is also returned when specifying values that, when rounded to the 4th decimal place, will be zero (i.e., for values < 0.00005).                                 |
| <a name="error_3004">3004</a> | Error saving object: field '{field name}' does not match field in related object                                                                            | The return field does not match the field in the base document. It is not possible to change the values of the `agent, currency, vatIncluded` fields in the returns to not match the values of the same fields in the base document. |
| <a name="error_3005">3005</a> | Error saving object: invalid value '{value}' of field '{field name}'. Valid values: {list of values}                                                        | You are trying to assign a non-existent value to a field of type "enumeration" (enum). You can check all possible values of this field in the documentation for this entity in the "Entity Attributes" section.                      |
| <a name="error_3006">3006</a> | Error saving object: unique constraint violated for parameter '{parameter name}'                                                                            | The specified field/parameter must have a unique value in the system. For example, if checking for unique operation numbers is enabled, `name` cannot be the same for different documents.                                           |
| <a name="error_3007">3007</a> | Saved object validation failed: '{object}'                                                                                                                  | Exchange error. Check if the object you are transferring complies with all the conditions.                                                                                                                                           |
| <a name="error_3008">3008</a> | Error saving object: value of field '{field name}' exceeds maximum allowed value                                                                            | The value of a numeric field exceeds the maximum allowed value: 9,999,999,999.                                                                                                                                                       |
| <a name="error_3009">3009</a> | Validation error: field '{field name}' cannot be empty or absent                                                                                            | The required field cannot be empty or missing.                                                                                                                                                                                       |
| <a name="error_3010">3010</a> | Validation error: you can't link a document from the shopping cart to a payment                                                                             | A document from the shopping cart cannot be linked to a payment.                                                                                                                                                                     |
| <a name="error_3011">3011</a> | Barcode validation error: Unable to add a barcode longer than 255 characters to an entity                                                                   | Correct the barcode length and try again.                                                                                                                                                                                            |
| <a name="error_3012">3012</a> | Validation error: for the field '{field name}', the element array must not contain an atomic type or null                                                   | You cannot pass an atomic type or null as part of an array.                                                                                                                                                                          |
| <a name="error_3013">3013</a> | Validation error: for the field '{field name}', the array of elements must not contain entities with the same identifiers                                   | You cannot pass entities with the same identifiers as part of an array.                                                                                                                                                              |
| <a name="error_3014">3014</a> | Barcode validation error: invalid GTIN format: <error text>                                                                                                 | GTIN type barcode validation error. Error texts: <ul><li>GTIN must contain only digits</li> <li>GTIN barcode must contain 14, 13, 12 or 8 digits</li> <li>Checksum does not match                                                    |
| <a name="error_3015">3015</a> | Validation error: Validation error: invalid email address E-mail: '{e-mail address}'                                                                        | Email field validation error. A valid email must be submitted at the entrance                                                                                                                                                        |
| <a name="error_3016">3016</a> | Validation error: Field '{field name}' must match the format '{expected field format}'                                                                      | Field validation error. The input field must match the expected format                                                                                                                                                               |
| <a name="error_3017">3017</a> | Validation error: Savings amount must be greater than the previous one                                                                                      | Levels field validation error. In cumulative discounts, the amount of each accumulation must be greater than the previous ones                                                                                                       |
| <a name="error_3018">3018</a> | Validation error: Discount must be greater than the previous one                                                                                            | Levels field validation error. In cumulative discounts, the value of the discount must be greater than the previous ones                                                                                                             |
| <a name="error_3019">3019</a> | Validation error: Amounts must differ                                                                                                                       | Levels field validation error. In cumulative discounts, the value of the discount must differ from the previous ones                                                                                                                 |
| <a name="error_3020">3020</a> | Validation error: Another bonus program is already active'                                                                                                  | An error occurred while activating the bonus program. It is impossible to activate a bonus program if another one is already active                                                                                                  |
| <a name="error_3021">3021</a> | Validation error: If the discount says to use a special price, then you must fill in the specialPrice field. Otherwise, you must fill in the discount field. | Error validating special prices. This discount must contain the specialPrice or discount fields if the corresponding flag is specified                                                                                               |
| <a name="error_3022">3022</a> | Validation error: Discount limit exceeded                                                                                                                   | Error activating discount. There can't be more than 10 active discounts in the system at the same time                                                                                                                               |
| <a name="error_3023">3023</a> | Validation error: Validation error: Requirement not fillednative field '{field name}' of object '{object name}'                                             | Object has no required field in json                                                                                                                                                                                                 |
| <a name="error_3024">3024</a> | Validation error: Validation error: invalid value '{field value}' of field '{field name}' for {object name}. Valid values: {list_of_values}                 | The field has an invalid value                                                                                                                                                                                                       |
| <a name="error_3025">3025</a> | Validation error: Discount '{discount type}' with name '{discount name}' is not applicable for groups of this account                                       | The counterparty is not included in the groups specified in this discount                                                                                                                                                            |
| <a name="error_3026">3026</a> | Validation error: Discount '{discount type}' with name '{discount name}' was specified more than once                                                       | Discount with the same type passed in json more than once                                                                                                                                                                            |
| <a name="error_3027">3027</a> | Validation error: Invalid header value {header}. The value '{value}' was passed. Valid values: '{values}'                                                   | An invalid value of the header specified in the error text was passed                                                                                                                                                                |
| <a name="error_3028">3028</a> | Validation error: Field value '{first field}' conflicts with field value '{second field}'. {description of conflict} required                               | Incompatible values of the fields specified in the error text were passed. The description of the error indicates what caused the conflict                                                                                           |
| <a name="error_3030">3030</a> | Error validating header '{header name}': {error description}                                                                                                | An invalid value was passed in the header                                                                                                                                                                                            |
| <a name="error_3031">3031</a> | Validation error: Cannot bind '{document type}' to ID 'document id', it is bound to another 'document type'                                                 | You cannot link a document that is already linked and has a limit of 1 link                                                                                                                                                          |
| <a name="error_3033">3033</a> | Validation error: The child entity with id = '{id}' being deleted belongs to a different parent entity                                                      | You cannot delete a child entity that does not belong to the current parent entity                                                                                                                                                   |
| <a name="error_3034">3034</a> | Validation error: The field '{field name}' cannot be assigned the value '{passed value}' because '{reason that caused the error}'                           | A value was passed that could not be assigned to the field                                                                                                                                                                           |
| <a name="error_3035">3035</a> | Save error: quantity %s cannot be less than %s                                                                                                              | The value passed was too small                                                                                                                                                                                                       |
| <a name="error_3036">3036</a> | Save error: quantity %s cannot be greater than %s                                                                                                           | The value passed was too large                                                                                                                                                                                                       |
| <a name="error_3037">3037</a> | Unable to send account deletion request. The account owner email address is missing or invalid. Contact the account owner                                   | The specified account owner has an empty or invalid email address.                                                                                                                                                                   |
| <a name="error_3038">3038</a> | Save error: Unable to delete the link between documents '{document type}' and '{document type}'                                                             | The link between the specified documents cannot be broken.                                                                                                                                                                           |
| <a name="error_3039">3039</a> | Validation error: cannot change items with serial numbers to items without serial numbers                                                                   | Cannot change items with serial numbers in a line item to items without serial numbers                                                                                                                                               |
| <a name="error_3040">3040</a> | Validation error: The field '{field name}' cannot be more than '{character limit}' characters.                                                              | Please adjust the length of the field and try the request again.                                                                                                                                                                     |
| <a name="error_3041">3041</a> | Save error: The field '{field name}' cannot be modified when the value of the field '{field name}' is '{field value}'.                                      | The ability to edit the field depends on a specific value set in another field.                                                                                                                                                      |
| <a name="error_3042">3042</a> | Validation error: only one field is allowed in a request                                                                                                    | You cannot specify the same values in fields                                                                                                                                                                                         |
| <a name="error_3043">3043</a> | Validation error: invalid values for parameter 'fields': {field values}                                                                                     | Invalid values are used for the 'fields' parameter                                                                                                                                                                                   |

### Error codes for POSs

| Error code | Message | Description |
| ---------- | ------- | ----------- |
| <a name="error_4000">4000</a> | Specified point of sale is not active | To perform the operation, you must activate the point of sale. |
| <a name="error_4001">4001</a> | Error saving the object: the allowed limit of active points of sale for your tariff has been exceeded | The number of active points of sale, taking into account the saved ones, exceeds the tariff limit. |
| <a name="error_4002">4002</a> | Error saving point of sale: for type 'minionToMasterType' = CHOSEN, list 'masterRetailStores' must contain at least one point of sale | If the link (the `minionToMasterType` field) between the cloud cash desk and the cash register that fiscalizes checks is `CHOSEN`, then at least one point of sale must be present in the `masterRetailStores` list. |

### Error codes for Agent Reports

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_5000">5000</a> | Wrong contract type for commission agent report. Only contracts of type 'Commission Agreement' can be used. | When creating/updating a commission agent's report, it is mandatory to specify an agreement that belongs to the specified counterparty and has the 'Commission agreement' type. |
| <a name="error_5001">5001</a> | The commission agent's report period is incorrect: the end of the period cannot be earlier than the beginning. | Please check the indicated dates. The date in the commissionPeriodStart field must be before the date in the commissionPeriodEnd field. |
| <a name="error_5002">5002</a> | The specified contract was concluded with a counterparty other than that specified in the agent | When creating/updating a commission agent's report, it is mandatory to specify an agreement that belongs to the specified counterparty and has the 'Commission agreement' type. |
| <a name="error_5003">5003</a> | The specified contract is concluded with a legal entity other than that specified in the organization | The organization must correspond to the organization specified in the contract. |
| <a name="error_5004">5004</a> | The quantity ({Quantity to return}) of the product '{Product name}' declared for return exceeds the sold quantity ({Sold quantity}) | Check the total quantity of the product for all items in sold by the commission agent and the total quantity of the same product in the items returned to the commission agent's warehouse. |

### Error Codes for Product Variant Features

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_10000">10000</a> | Error of saving product variant characteristic: fields 'id' and 'name' cannot be empty | When updating the characteristics of a product variant, the above fields must be specified. Correct the request body. |
| <a name="error_10001">10001</a> | Error of saving product variant characteristic: 'id' field refers to non-existent characteristic | It was not possible to find the corresponding characteristic by the passed id. Make sure the ID is correct and retry the request. |
| <a name="error_10002">10002</a> | Error of saving product variant characteristics: characteristics with the specified fields 'name' already exist | The feature names specified in the query already exist. Check the spelling of the 'name' fields or query for existing characteristics. |

### Error codes for Statuses

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_11000">11000</a> | Status initialization error: parent entity information missing | The document to which this status should be linked could not be found. Check the ID of the document, and also, in case of an update, make sure that the document with the given ID has not been deleted. |
| <a name="error_11001">11001</a> | Status initialization error: status with name '{Status Name}' not found | Check in the metadata of entities of this type that the status with the passed name exists, and correct the request. |
| <a name="error_11002">11002</a> | Status initialization error: status with id = '{status id}' does not belong to this document type | The passed status does not belong to this document type |

### Error codes for the Stock Report

| Error code | Message | Description |
| ---------- | ------- | ----------- |
| <a name="error_13000">13000</a> | Empty operation identifier | You requested the Stock Report without specifying the operation ID. Make sure the ID is passed as a parameter. |
| <a name="error_13001">13001</a> | Operation with the specified identifier was not found | The operation with the specified <i>operation.id</i> could not be found. Check the ID you are passing, and also make sure that the operation with the ID has not been deleted. |
| <a name="error_13002">13002</a> | The operation could not be performed on the specified document type '{document type}' | The Stock Report is only available for operations of the type `Shipment, Retail, Sales order`. |
| <a name="error_13003">13003</a> | No access to the Stock Report | The user does not have access to the Stock Report. |
| <a name="error_13004">13004</a> | The Current Stock Report is only available to the administrator | Only the administrator has access to the Current Stock Report. |

### Error codes for the additional field

| Error code | Message | Description |
| ---------- | ------- | ----------- |
| <a name="error_14000">14000</a> | Error saving additional field: field '{field name}' does not belong to registry '{entity type}' | You are trying to use additional fields of a different entity type in your query. Make a metadata request for this entity type and use the additional fields that come in response. |
| <a name="error_14001">14001</a> | Additional field saving error: updating additional fields of type 'File' is not supported | The file type field cannot be updated. |
| <a name="error_14002">14002</a> | Error saving custom field: Parent entity does not support custom fields | Entities of this type cannot have additional fields. You can specify the list of entity types that can have additional fields in the section [Working with additional fields](#kladana-json-api-general-info-additional-fields) |
| <a name="error_14003">14003</a> | Error saving extra field: metadata identifier points to a non-existent object | Could not find an additional field with the specified id. Check the list of additional fields and their ID using the entity metadata resource. |
| <a name="error_14004">14004</a> | Error saving additional field: for an object of type 'user reference', the meta or name field must be specified | At least one of the above fields must not be empty. |
| <a name="error_14005">14005</a> | Error saving an additional field of the 'File' type: the file size exceeds the maximum allowed (10 mb) | It is not possible to upload a file larger than 10 MB as an additional field value. |
| <a name="error_14006">14006</a> | Error saving additional field of type 'File': missing file name | The filename field of the value of the additional field of the File type must be filled in. |
| <a name="error_14007">14007</a> | Error saving additional field of type 'File': field content is missing | The content field of the value of the additional field of the File type must be filled in. |
| <a name="error_14008">14008</a> | Error saving additional field of type 'File': not enough storage space to save the file | The storage space allocated for your account has run out. |
| <a name="error_14009">14009</a> | Error saving additional field of type '{name of field type}': field value is missing | The value field of the value of the additional field of type '{field type name}' must be filled in. |
| <a name="error_14010">14010</a> | Access denied: only a user with administrative rights can create, modify, or delete additional fields | Only a user with administrator rights can create, modify and delete additional fields. |
| <a name="error_14011">14011</a> | Error deleting additional field: invalid meta format of additional field being removed | The passed meta could not identify an additional field to remove. |
| <a name="error_14012">14012</a> | Error saving custom field: Cannot make required field that is cleared by script | An optional field in a scenario with a Clear field value cannot be made required. If you want to assign mandatory - you need to change the action in the script. |

### Error Codes for Product Variants

| Error code | Message | Description |
| ---------- | ------- | ----------- |
| <a name="error_15000">15000</a> | Error of product variant saving: product variant with the given set of characteristics already exists for this product | It is impossible to have two variants of a product with the same characteristics. Make sure this condition is not violated. Otherwise use the existing product variant. |
| <a name="error_15001">15001</a> | Error of product variant saving: characteristics must be specified | When creating or updating a product variant, the passed array of characteristics cannot be missing or empty. |
| <a name="error_15002">15002</a> | Error of product variant saving: product variant service cannot be created | Only product variants are supported. Make sure the URI on which the request is made is correct. |
| <a name="error_15003">15003</a> | Product variant saving error: Product variant of alcoholic beverages cannot be created| Only product variants of regular products are supported. Make sure the URI on which the request is made is correct. |
| <a name="error_15004">15004</a> | Error of product variant saving: attribute names must not be repeated | You cannot create a product variant with the same characteristics |

### Error Codes for Products

| Error code                      | Message                                                                                                                                                         | Description                                                                                                                 |
|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| <a name="error_16000">16000</a> | Product saving error: properties of alcoholic products cannot be negative                                                                                       | Alcoholic fields "code of alcoholic products", "strength" and "volume" must take a value strictly greater than 0.           |
| <a name="error_16001">16001</a> | Product saving error: item by weight cannot use serial number accounting                                                                                        | A product cannot be weighted and use accounting by serial numbers at the same time. These are mutually exclusive features.  |
| <a name="error_16002">16002</a> | Product saving error: serial accounting cannot be disabled                                                                                                      | Once serial accounting is enabled, it can no longer be disabled. Otherwise, you can create a new item.                      |
| <a name="error_16008">16008</a> | Product saving error: to use packages, you need to specify the unit of measure of the product                                                                   | To use packages, the unit of measure of the product must be specified                                                       |
| <a name="error_16009">16009</a> | Product saving error: ppeType field value not found in catalog                                                                                                  | The specified PPE product code was not found in the directory                                                               |
| <a name="error_16010">16010</a> | Product saving error: if it is indicated that the product is taxable, then the vat field must be filled in. Otherwise, vatEnabled for the product must be false | When passing the `vatEnabled` = true field, the VAT value must also be specified for the product.                           |
| <a name="error_16011">16011</a> | Product saving error: Draft products cannot be accounted for by serial numbers.                                                                                 | Goods cannot be on tap and accounted for by serial numbers at the same time.                                                |
| <a name="error_16012">16012</a> | Product saving error: products cannot be both bulk and weighed.                                                                                                 | Products cannot be bulk and weighed at the same time.                                                                       |
| <a name="error_16013">16013</a> | Product saving error: a weighted product cannot have the attribute of personal protective equipment.                                                            | Products cannot be on tap and have the sign of personal protective equipment at the same time.                              |
| <a name="error_16014">16014</a> | Product save error: bulk product cannot have a personal protective equipment attribute.                                                                         | Bulk products cannot have the sign of personal protective equipment.                                                        |
| <a name="error_16016">16016</a> | Product saving error: A product with a minimum balance by warehouse must contain at least one warehouse.                                                        | When the Minimum Balance Type is set to Warehouse (WAREHOUSE_VARIED), at least one warehouse must have a specified balance. | 
| <a name="error_16017">16017</a> | Error: Endpoint is available only with type: WAREHOUSE_VARIED.                                                                                                  | The endpoint is only available if the Minimum Balance Type is defined as Warehouse Minimum Balance (WAREHOUSE_VARIED).      | 
| <a name="error_16018">16018</a> | Product saving error: You cannot add archived warehouses to the storeBalances field.                                                                            | An archived warehouse has been provided for the Warehouse Minimum Balance.                                                  | 
| <a name="error_16019">16019</a> | Product saving error: A product with a minimum balance by warehouse must contain unique warehouse values.                                                       | A warehouse for the Warehouse Minimum Balance has been provided that already has a set minimum balance.                     | 
| <a name="error_16020">16020</a> | Error with warehouse minimum balance: The number of items cannot exceed 1000.                                                                                   | The maximum allowed number of warehouses for defining warehouse minimum balances is 1000.                                   |

### Error Codes for Documents

| Error code   | Message   | Description   |
| ------------ | --------- | ------------- |
| <a name="error_17000">17000</a> | Document saving error: Organization account does not belong to the specified organization   | Make sure you enter the correct account. If you update the organization field, the organizationAccount field must also be updated along with it.  |
| <a name="error_17001">17001</a> | Document saving error: the account of the counterparty does not belong to the specified counterparty   | Make sure you enter the correct account. If you update the agent field, the agentAccount field must also be updated along with it.   |
| <a name="error_17002">17002</a> | Error saving document item: serial number cannot be empty   | The serial number cannot be an empty string.  |
| <a name="error_17003">17003</a> | Error saving document item: quantity of reserved items cannot exceed total quantity                                                                             | The quantity of the reserved item of the document item cannot exceed the total quantity of the item in the document.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| <a name="error_17004">17004</a> | Error saving document item: number of pending items cannot exceed total quantity                                                                                | The quantity of the expected item of the document item cannot exceed the total quantity of the item in the document.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| <a name="error_17005">17005</a> | Error saving linked document: No link to base document                                                                                                          | When you save a linked document, you need a reference to the underlying document (for example, when you save a return, you need a reference to the sales).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| <a name="error_17006">17006</a> | Error saving linked document: incompatible document types - '<type1>' and '<type2>'                                                                             | You specified a document of the wrong type as a link.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| <a name="error_17007">17007</a> | Error saving document item: VAT cannot be more than 100                                                                                                         | VAT percentage can take values from 0 to 100.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| <a name="error_17008">17008</a> | Error saving document item: discount cannot be more than 100                                                                                                    | Discount percentage can take values from 0 to 100.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| <a name="error_17009">17009</a> | Error saving document: date '{document type}' does not fall within editable period                                                                              | This document belongs to the closed period. The document cannot be edited.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| <a name="error_17010">17010</a> | Document saving error: You cannot post documents to a receiving warehouse from another department                                                               | It is not allowed to post documents with a receiving warehouse from another department in the document metadata.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| <a name="error_17011">17011</a> | Document saving error: You cannot post documents to a source warehouse from another department                                                                  | It is not allowed to post documents with a source warehouse from another department in the document metadata.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| <a name="error_17012">17012</a> | Document saving error: You cannot save documents with destination warehouse from another department                                                             | It is not allowed to save documents with a destination warehouse from another department in the document metadata.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| <a name="error_17013">17013</a> | Document saving error: You cannot save documents with source warehouse from another department                                                                  | It is not allowed to save documents with a source warehouse from another department in the document metadata.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| <a name="error_17014">17014</a> | Error saving document: you cannot unpost a document of type <type> that was checked in  | You cannot cancel posting from this document, because a return has already been posted for it.    |
| <a name="error_17016">17016</a> | Error saving document: set cannot be part of item of document of type {document_type}  | A bundle cannot be an item in the following documents:  Purchase Order, Supplier Invoices, Receiving, Purchase Return, Write-off, Stock Adjustments, Transfer, Inventory Counts, BilL of Materials, Internal order.   |
| <a name="error_17018">17018</a> | Error saving document: Number of bundles must be an integer  | The number of bundles in a item must be an integer  |
| <a name="error_17020">17020</a> | Error saving document item: item of packaging and item of item differ  | For a given document item, the goods from the package and the specified goods differ. |
| <a name="error_17021">17021</a> | Error saving document item: if it is indicated that the item is taxable, then the vat field must be filled in. Otherwise, vatEnabled for the item must be false | When passing the field `vatEnabled` = true, the value of VAT must also be specified in the item  |
| <a name="error_17022">17022</a> | Error saving document: {variety type} cannot be part of a item of a document of type {document_type}   | Assortment type to be added cannot be an item in this document type   |
| <a name="error_17023">17023</a> | Error saving document position: there is no permission {type of permission} to change field {field name}   | The field value cannot be changed due to lack of appropriate permission   |
| <a name="error_17101">17101</a> | Document saving error: item {name of item} has no labeled product attribute. Change the product to save the marking codes                                       | Set the labeled product attribute 'trackingType' of the corresponding category for the product   |
| <a name="error_17102">17102</a> | Error saving document: incorrect marking code format <value KM / KM TU / KM PU>                                                                                 | The marking code for all categories of marked products must follow the format: <ul><li>01+GTIN+21+SERIAL. GTIN - product identifier of 14 digits, SERIAL - serial number of 13 characters. Example: <b><font color='green'>01</font>04630037590265<font color='green'>21</font>K6UT)6\"pIG-<</b></li></ul>Exceptions:<ul></li>Tobacco products, pack: GTIN+SERIAL GTIN - product identifier of 14 digits, SERIAL - serial number of 7 characters</li><li>Tobacco products, unit (package): 01+GTIN+21+SERIAL GTIN is a 14-digit item ID, SERIAL is a 7-character serial number Example: <b>01</b>04630034070029<b>21</b>tXXXu%d</li><li>Cameras and flash lamps: 01+GTIN+21+SERIAL GTIN is a 14-digit product identifier, SERIAL is a 20-character serial number</li><li>The shipping packaging marking code of the product must contain 18 numbers - GS1 format</li></ul> |
| <a name="error_17103">17103</a> | Error saving the document: there are several identical codes in the document <value KM / KM TU / KM PU>                                                         | Among the marking codes there are duplicates. Remove duplicate marking codes to save item  |
| <a name="error_17104">17104</a> | Document saving error: marking code <КМ> cannot contain nested codes    | It is allowed to save a list of marking codes <b>trackingcode</b>, a list of consumer packages <b>consumerpack</b>, a list of transport packages <b>transportpack</b>, a list of marking codes <b>trackingcode</b> nested into <b>transportpack</b> transport packages or <b>consumerpack</b> consumer packages, list of <b>consumerpack</b> consumer packages nested in <b>transportpack</b> transport packages. Saving other nested structures is not supported  |
| <a name="error_17105">17105</a> | Document saving error: shipping package marking code <КМ ТY> cannot contain nested shipping package codes                                                       | It is acceptable to save a list of <b>trackingcode</b> marking codes or a list of <b>consumerpack</b> consumer packages nested in <b>transportpack</b> transport packages. Shipping packages nested in shipping packages not supported    |
| <a name="error_17106">17106</a> | Document saving error: Consumer packaging label code cannot contain nested codes    | It is allowed to save a list of <b>trackingcode</b> marking codes nested in <b>transportpack</b> transport packages. Save codes not supportedmarking <b>trackingcode</b> enclosed in consumer packages <b>consumerpack</b>   |
| <a name="error_17107">17107</a> | Document saving error: shipping package marking code <КМ ТУ> cannot contain nested codes of goods and consumer packages at the same time                        | It is acceptable to save a list of <b>trackingcode</b> marking codes or a list of <b>consumerpack</b> consumer packages nested in <b>transportpack</b> transport packages. It is not supported to store them at the same time for the same shipping package   |
| <a name="error_17108">17108</a> | Document item of type <type> cannot contain marking codes    | Document items of the specified type cannot have marking codes  |

### Error Codes for Sales and Shipments

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_18000">18000</a> | Sale saving error: amount 'cashSum', 'noCashSum', 'qrSum', 'prepaymentCashSum', 'prepaymentNoCashSum' and 'prepaymentQrSum' does not match the document amount | The sum of the fields cashSum, noCashSum, qrSum, prepaymentCashSum and prepaymentNoCashSum, prepaymentQrSum must be equal to the value of the sum field or differ by less than 10 units. In the case of creating a document and specifying the above fields in the request body, the responsibility for calculating sum lies with the user. sum is calculated as the total sum of all items in the document. |
| <a name="error_18005">18005</a> | If the 'qrSum' field is filled in, the 'cashSum', 'noCashSum', 'prepaymentCashSum' and 'prepaymentNoCashSum' fields must be empty | Mixed payment with QR code and card or QR code and cash is not allowed. |
| <a name="error_18006">18006</a> | If the 'prepaymentQrSum' field is filled in, the 'cashSum', 'noCashSum', 'prepaymentCashSum' and 'prepaymentNoCashSum' fields must be empty | In case of prepayment by QR code, payment is possible only by QR code. |

### Error Codes for Returns

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_19000">19000</a> | Save Refund Error: Retail Shift Already Closed | You cannot save a return to a closed retail shift. Make sure you are using the active shift ID. |
| <a name="error_19001">19001</a> | Error saving retail refund: fields 'cashSum' and 'noCashSum' are required for returns without reason | The fields 'cashSum' and 'noCashSum' are required to be returned without a reason. Make sure they are filled out. |
| <a name="error_19002">19002</a> | Error saving retail refund: amount of 'cashSum', 'noCashSum' and 'qrSum' does not match document amount | The sum of the fields cashSum, noCashSum and qrSum must be equal to the value of the sum field or differ by less than 10 units. In the case of creating a document and specifying the above fields in the request body, the responsibility for calculating sum lies with the user. sum is calculated as the total sum of all items in the document. |
| <a name="error_19003">19003</a> | Error saving retail return: return is possible only by QR code | Occurs if the sale was made using a QR code, and the return is made in cash or by card. When creating such a return, the 'cashSum' and 'noCashSum' fields must be absent. |
| <a name="error_19004">19004</a> | Error saving retail refund: QR code refund is only supported for transactions paid by QR code | Occurs if the sale was made for cash or by card, and the return is made using a QR code. When creating such a return, the 'qrSum' field must be absent. |

### Error codes for Receivings

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_20000">20000</a> | Receiving Saving Error: Cannot specify Write-offs with commission agreement | If an agreement of the "Commission agreement" type is attached to the Receiving, then you cannot specify any value in the overhead expenses field. |

### Error codes for Transfers

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_21000">21000</a> | Error saving transfer: cannot transfer from warehouse to the same warehouse | Make sure you specify warehouses with different IDs in the sourceStore and targetStore fields. |
| <a name="error_21001">21001</a> | Error saving move: cannot move to the same bin | Make sure that in the transfer document from the same warehouse, in the sourceSlot and targetSlot fields in the items, specify bins with different identifiers. |

### Error codes for Payments

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_22000">22000</a> | Error saving payment: allocated amount exceeds payment amount | The amount specified in linkedSum is greater than the sum of the payment. |
| <a name="error_22001">22001</a> | Error saving payment: payment contains duplicate linked documents | You are trying to link a payment to a document more than once. |
| <a name="error_22002">22002</a> | Error saving payment: invalid expense item: '{expense category}' | This expense item cannot be assigned to a payment. |

### Error codes for Product groups

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_23000">23000</a> | Group saving error: You cannot specify the group itself as a parent group | A group cannot refer to itself as a parent. |
| <a name="error_23001">23001</a> | Group saving error: You cannot specify a nested group as a parent group | A group cannot refer as a parent group to a group that is its child group. |

### Error codes for Inventory Counts

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_24001">24001</a> | Error creating posting template: physical inventory does not require posting | The physical inventory does not contain a surplus, or all required capitalizations have already been created. |
| <a name="error_24002">24002</a> | Error creating receipt template: inventory does not require receipt | Inventory Count does not contain excess, or all necessary receipts have already been created.|
| <a name="error_24003">24003</a> | Inventory save error: Service cannot be an inventory item | A service cannot be an inventory item. |
| <a name="error_24004">24004</a> | Error saving inventory: inventory cannot contain duplicate items | A product, product variant, service, batches or bundle can only be added to the inventory once. |

### Error codes for Production Operations

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_25003">25003</a> | Saving error: the production operation must contain a product or Bill of Materials | When creating a production operation or deleting a product, the production operation must have at least one product item. |

### Error codes for Routings

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_25030">25030</a> | Save error: number of production operations in a Routing cannot be greater than '100' | The maximum number of production operations in one Routing is 100. |
| <a name="error_25031">25031</a> | Save error: Routing cannot contain duplicate production operations | Each production operation can only appear once in a Routing. |
| <a name="error_25032">25032</a> | Error deleting object: main Routing cannot be deleted | Deletion is only possible for custom Routings. |
| <a name="error_25033">25033</a> | Save error: last added production operation cannot contain the following items | The last item must not have the following production operations. |
| <a name="error_25034">25034</a> | Save error: Routing structure is corrupted | Routing has more than one final production operation or Routing is in a loop. |
| <a name="error_25035">25035</a> | Save error: cannot simultaneously pass a filled list of employees and the allperformers=true flag | Check that you are not simultaneously passing a list of specific employees and the flag indicating that any employee can be assigned to a production operation. |

### Error codes for Bills of Materials

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_25060">25060</a> | Save error: array element '{type}' can only contain an item from the Routing specified in the Bill of Materials in the processingProcess field | Check that the specified Routing items belong to the Routing of the Bill of Materials. |
| <a name="error_25061">25061</a> | Save error: You cannot specify production cost in both the Bill of Materials and the production operations of Bill of Materials. | Check that you are not passing the production cost (cost field) in both the Bill of Materials and the items of the production operation. |
| <a name="error_25062">25062</a> | Save error: When specifying a Bill of Material for a raw material, it must contain this material as a product | Check that the operation does not result in incorrect Bills of Materials. |
| <a name="error_25063">25063</a> | Save error: Cannot enable calculation via standard hours and change the labour cost | Check the status of the standard hour accounting flag for the Operation of Bill of Materials (enableHourAccounting). When standard hour accounting is enabled, the labor cost value (laborUnitCost field) will be reset and calculated automatically. If you want to send a new labor cost value, first change the calculation type to fixed (enableHourAccounting flag == false). |

### Error codes for Production Orders

| Error code | Message | Description |
| ---------- | ------- | ----------- |
| <a name="error_26101">26101</a> | Error saving production order: the number of items cannot exceed {maximum quantity} | A production order can contain up to 200 items |
| <a name="error_26102">26102</a> | Error saving production order: you cannot start executing an unposted production order | |
| <a name="error_26103">26103</a> | Error saving production order: you cannot remove the production start date from a started production order | Before canceling the start of production, you must cancel the execution of all operations |
| <a name="error_26104">26104</a> | Error updating production order item: Replacing the Bill of Materials is not supported | The Bill of Materials of a production order item cannot be changed |
| <a name="error_26105">26105</a> | Error updating production order item: You cannot change an item that has completed or partially completed operations | You can only change a production order item before it has started executing |
| <a name="error_26106">26106</a> | Error saving item of Production Order: cannot change or delete products when the final operation of the item has started | Products of Production Order can be changed until its completion |
| <a name="error_26107">26107</a> | Error saving: Production Order item {identifier} does not belong to the Production Order {identifier} | The request specifies an item from another Production Order |
| <a name="error_26108">26108</a> | Error deleting Production Order item: cannot delete an item that has completed operations | A Production Order item can be deleted before it has started |
| <a name="error_26109">26109</a> | Error updating production operation: cannot change a started production operation | A production operation can be changed until it has started |
| <a name="error_26110">26110</a> | Error deleting: last material cannot be deleted when 'reserve' flag is active | At least one material is required when reserving materials |
| <a name="error_26111">26111</a> | Error deleting: last product cannot be deleted when 'awaiting' flag is active | At least one product is required when 'awaiting' is set |
| <a name="error_26112">26112</a> | Error updating Production Order: field {date field} cannot be assigned a value after {date} | The field has limitations and dependencies. A date before the specified one must be passed |
| <a name="error_26113">26113</a> | Error updating: quantity of goods taken into account by serial numbers cannot be fractional | When using a material or product taken into account by serial numbers, it is necessary to specify its quantity in integer form |
| <a name="error_26114">26114</a> | Error updating Production Operation: Cannot enable calculation via standard hours and change the labour cost | Check the status of the standard hour accounting flag for the Production Operation (enableHourAccounting). When standard hour accounting is enabled, the labor cost value (laborUnitCost field) will be reset and calculated automatically. If you want to send a new labor cost value, first change the calculation type to fixed (enableHourAccounting flag == false). |

### Error codes for Operation Reports

| Error code                      | Message | Description |
|---------------------------------| ------- | ----------- |
| <a name="error_26200">26200</a> | Error saving Operation Report: production has not started, production must be started | Production must be started before starting the production operations |
| <a name="error_26201">26201</a> | Error saving Operation Report: only product series in the assortment field can be changed | Series can be changed, but products or product variants cannot be changed|
| <a name="error_26202">26202</a> | Error saving Operation Report: inactive user cannot be specified as a performer | Only active users can perform Production orders|
| <a name="error_26203">26203</a> | Error saving Operation Report: Previous operations must be completed to create a completed operation | Previous operations must be started before starting the final operation |
| <a name="error_26204">26204</a> | Error saving Operation Report: The production volume within the execution of the production operation cannot exceed the production volume according to the data of the Production Order item ({maximum allowed quantity}) | The maximum production volume is limited with production order item |
| <a name="error_26205">26205</a> | Error saving Operation Report: The total production volume of the stage cannot exceed the production volume of the previous production operations | The previous operations must be completed in sufficient volumes before the execution of the final operation can begin |
| <a name="error_26206">26206</a> | Error deleting Operation Report: It is impossible to delete the completed operation because the total production volume of the intermediate operation cannot be less than the production volume of the final operation | It is impossible to reduce the production volume of the operation if this would result in overproduction of the final operation |
| <a name="error_26207">26207</a> | Error saving Operation Report: Serial numbers must be specified for serialized items | Serial numbers must be specified for all materials and products with serial numbers |
| <a name="error_26208">26208</a> | Error saving Operation Report: {Quantity field} value must match the number of serial numbers in the things field | Serial numbers must be updated when consumedQuantity or producedQuantity changes |
| <a name="error_26209">26209</a> | Error saving Stage execution: Cannot enable calculation via standard hours and change the labour cost | Check the status of the standard hour accounting flag (enableHourAccounting). When standard hour accounting is enabled, the labor cost value (laborUnitCost field) will be reset and calculated automatically. If you want to send a new labor cost value, first change the calculation type to fixed (enableHourAccounting flag == false). |
| <a name="error_26210">26210</a> | Error saving Stage execution:The transaction was created with a fixed calculation, the calculation type cannot be changed. | Check the status of the standard hour accounting flag (enableHourAccounting) for the Production Operation of the Production Order. For a transaction with an initially fixed type calculation (enableHourAccounting flag == false), switching to standard hour accounting calculation is not allow. |
| <a name="error_26211">26211</a> | Error saving Operation Reports: the volume of scarp cannot be equal to the entire available volume of the operation | It is impossible to write off the entire available volume of production at an operation as a scarp, because further production will become unavailable and this will not allow the cost of the scarp to be attributed to finished products. |
| <a name="error_26212">26212</a> | Error saving Operation Reports: You cannot create a scrap as a completion of production | Ensure you do not create a situation where an existing or created scrap includes the remaining production volume or the final completion date. This will prevent the cost of the scrap from being allocated to finished goods. |
| <a name="error_26213">26213</a> | Error saving Operation Reports: cannot change the defect attribute | Ensure you are not changing the value of the defect flag. The indication of the Operation Report's association with scrap can only be specified during the document creation. |

### Error codes for Counterparties

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_28000">28000</a> | Error saving account: unknown price type: '<Price type>' | Unknown price type. The list of valid items can be requested in the product metadata. |

### Error codes for Bundles

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_29000">29000</a> | Error of bundle saving: incorrect number of components | Supports from one to fifty components in a bundle. |
| <a name="error_29001">29001</a> | Error of bundle saving: additional costs and components cannot be changed because the bundle is already in use | Remove dependent sets from documents. |
| <a name="error_29002">29002</a> | Error of bundle saving: the bundle contains duplicate components | Check the composition of the bundle components and try again. |
| <a name="error_29003">29003</a> | Bundle saving error: bundle component cannot be a bundle, batches, alcoholic beverages, or serially registered product | Check the composition of the bundle components and try again. |

### Error codes for Webhooks

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_30000">30000</a> | Error saving webhook: unsupported entity type '{type}' | Webhooks can use any entity types available through the Remap API, except for nested ones. For example, product or demand. |
| <a name="error_30001">30001</a> | Error saving webhook: unknown HTTP method '{method}'. Valid: POST | Webhooks can only specify supported HTTP methods. Valid now is POST. |
| <a name="error_30002">30002</a> | Failed to save webhook: unknown action '{action}'. Valid: CREATE, UPDATE, DELETE | Webhooks can only specify available actions: CREATE, UPDATE, DELETE. |
| <a name="error_30003">30003</a> | Error saving webhook: webhook with given set of parameters already exists | In webhooks, only one webhook can be set per triple (entity, action, address). |
| <a name="error_30004">30004</a> | Administrator rights are required to work with webhook | Webhook management is available only to users with administrative rights. |
| <a name="error_30005">30005</a> | Error saving webhook: url field value is not a valid request address | The value of the url field is not a valid request address. Check the request address for compliance with the http, https format of the request address. |
| <a name="error_30006">30006</a> | Your plan does not allow you to create or update webhooks | Creating and updating webhooks is available on all plans except the free one. |
| <a name="error_30007">30007</a> | Cannot create more than '5' webhooks of the same type per entity | You cannot create new webhooks for this entity type and actions beyond this limit. Remove old webhooks or reconfigure to new urls. |
| <a name="error_30008">30008</a> | Error saving webhook: entity type '{type}' does not support action '{action}'. Valid: {actions} | For this type of entity, a non-standard set of actions is defined, so this type does not support some actions |
| <a name="error_30009">30009</a> | "Webhook save failed: Specifying field value 'diffType' is not supported for action '{action}'. Valid: {actions} | Specifying change listing type 'diffType' is available for certain action types. If action is not supported, then field 'diffType ' do not need to be specified |
| <a name="error_30010">30010</a> | Error saving webhook: url length is more than 255 characters | The number of characters in the url must be less than 256. |

### Error codes for Currencies

| error code | message | description |
| ------------| ----------| ---------|
| <a name="error_31000">31000</a> | Accounting currency cannot be deleted | The accounting currency cannot be deleted. |

### Error codes for Contracts

| Error code                      | Message                                                                                                                                                             | Description                                                                                        |
|---------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| <a name="error_32001">32001</a> | Error saving contract: it is not possible to change the type of contract to commission. Under this contract, there is a sales invoice, which includes a bundle.     | Check that there are no sales invoices with bundles under this contract and try again.             |
| <a name="error_32002">32002</a> | Error saving contract: cannot change the type of contract to commission. Contract used in transactions with bundle components cannot be commission                  | Check that there are no transactions with the bundle components under this contract and try again. |

### Error codes for Printed forms

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_33000">33000</a> | Printable form generation error: printable template not found | The template specified when generating the printable does not exist. Check that the specified print template is correct. |
| <a name="error_33001">33001</a> | Form generation error: unknown format | Check that the specified format is included in the list of listed: xls, pdf, html, ods. |
| <a name="error_33002">33002</a> | Printable form generation error: '<error text>' | The error text indicates problems that occurred while printing the document. |
| <a name="error_33003">33003</a> | Print form generation error: no link to print template | In order to generate a printed form, you need to send a template. |
| <a name="error_33004">33004</a> | Printable form generation error: missing count field for printable template | When printing sets, you must specify the count field - the number of copies of the printed form in the set. |
| <a name="error_33005">33005</a> | Print form generation error: both fields for template references are specified: template and templates. | It is possible to specify only one of the request fields template or templates. |
| <a name="error_33006">33006</a> | Error generating a printable: the count field for a printable template can only take integer values in the range from 1 to 10 | The count field must be in the range [1, 10]. |
| <a name="error_33007">33007</a> | Print form generation error: no link to legal entity | In order to generate a printable for a product, you need to send a link to a legal entity. |
| <a name="error_33008">33008</a> | Print form generation error: number of price tags/thermal labels missing | In order to generate a printable for a product, you need to send a quantity. |
| <a name="error_33009">33009</a> | Print form generation error: price type missing | In order to generate a printable for a product, you need to send a price type. |
| <a name="error_33010">33010</a> | Document set printable generation error: No suitable printable templates were passed for the specified entity. | To print a set of documents, you need to transfer at least 1 printable template suitable for this entity. |
| <a name="error_33011">33011</a> | Error generating the print form of a set of documents: the entity for printing the set must be a document | You cannot print a document set for an entity that is not a document. |
| <a name="error_33012">33012</a> | Printing for type '{type}' is not supported | Printing is not supported for this type. |

### Error codes for Publications

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_34000">34000</a> | Posts for type '{type}' are not supported | Postings are only available for the following types: Purchase Order, Purchase Invoice, Shipment, Sales Order, Sales Invoice, Receiving, Incoming Payment, Outgoing Payment, Internal Order, Transfer, Stock Adjustment, Write-off, Incoming Cash Payment, Outgoing Cash Payment, Purchase Return, Sales Return, Contract, Production Order, Inventory Count. |
| <a name="error_34001">34001</a> | Failed to create publication. Check if the template is correct. | An error occurred while generating the document. Check the correctness of the passed template.|
| <a name="error_34002">34002</a> | Error creating a document publication: Your tariff does not allow creating a document publication based on a custom printable template | Your subscription plan does not allow you to use custom templates when publishing documents. |
| <a name="error_34003">34003</a> | Error: You cannot work with the publication of the entity because there is no access to it on '<read, write>'. | User work with document publications is possible if there is a read right and a print right for an entity of this type. |


### Error codes for Templates

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_36000">36000</a> | Scaffolding Error: More than 1 base document passed for scaffolding | Failed to generate prepopulated entity due to more than 1 base document passed. |
| <a name="error_36001">36001</a> | Template generation error: 'error description' | Failed to generate prepopulated entity due to invalid data. |

### Error codes for Tasks

| Error Code | Message| Description|
| ------------| ----------| ---------|
| <a name="error_37000">37000</a> | Error: You cannot work with tasks because your plan does not have the CRM option | You cannot create, edit and delete tasks without the CRM tariff option. |
| <a name="error_37001">37001</a> | Error: You cannot edit or delete a task created by another employee | A user who is not an administrator can only modify or delete tasks that he himself created, or change the readiness status of a task for which he is assigned responsibility. |
| <a name="error_38000">38000</a> | Requires administrator rights to work with audit | Viewing changes is available only to users with administrative rights. |

### Error codes for Metrics 

| Error Code | Message | Description |
| ---------- | ------- | ----------- |
| <a name="error_39000">39000</a> | Error: mandatory parameter for metrics request is not specified: {parameter} | Parameters momentFrom, momentTo, interval are mandatory. |
| <a name="error_39001">39001</a> | Error: metrics broken down by {interval} for a period greater than {limit} are not supported. | Values ​​of the 'interval' parameters and their corresponding limit: hour - 30 days, day - 10 years, month - 100 years. |
| <a name="error_39002">39002</a> | Incorrect value of the 'interval' filtering parameter. Valid values: 'hour', 'day', 'month'. | The value of the 'interval' parameter must be in the list of valid values. |

### Error codes for Lists

| Error Code | Message| Description|
| ------------| ----------| ---------|
| <a name="error_41000">41000</a> | Error: user directory with ID '{identifier}' not found | User directory with the specified identifier was not found |
| <a name="error_41001">41001</a> | Error: your tariff does not allow you to work with user directories | For "Free", "Free 2014" and "Individual" tariffs, work with user directories is not supported. |

### Error codes for Price types

| Error Code | Message| Description|
| ------------| ----------| ---------|
| <a name="error_42000">42000</a> | Validation error: maximum number of price types exceeded | The maximum number of price types (100) has been exceeded. |
| <a name="error_42001">42001</a> | Save error: Can't delete all price types | When editing a price type list, you must specify at least one. |

### Error codes for Employees

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_43001">43001</a> | Employee Save Error: Image has no content | When uploading an image in an employee change request, you must specify the content |
| <a name="error_43002">43002</a> | Employee save error: Cannot convert content field to image | The content of the content field must be an image encoded in base64 format with a jpg or png extension. |
| <a name="error_43003">43003</a> | Employee save error: Insufficient storage space. | The storage space allocated for your account has run out. |
| <a name="error_43004">43004</a> | Error saving employee: image size exceeds the maximum allowed (3 mb) | Try reducing the image size. |
| <a name="error_43005">43005</a> | Employee Save Error: Image is missing a filename | When uploading an image, you must specify a non-empty filename in the filename field. |
| <a name="error_43006">43006</a> | Error saving employee: invalid TIN format | Check that the TIN format matches the individual's TIN format. |
| <a name="error_43007">43007</a> | Error updating employee rights: you cannot change the rights of an employee who does not have access to the service | You cannot change the rights of an employee who does not have access to the service. |
| <a name="error_43008">43008</a> | Error updating employee rights: cannot change employee login | When changing rights, you cannot change the employee's access login to the Kladana |
| <a name="error_43009">43009</a> | Error updating employee rights: user login must end with '{login format}' | Incorrect login format for an employee's access to the Kladana service |
| <a name="error_43010">43010</a> | Error updating employee rights: You cannot specify user rights for this role | You can only set permissions for a custom role. |
| <a name="error_43011">43011</a> | Error updating employee rights: Permission {permission type} has a child value of permission {permission name}, but no parent value of permission {permission name} | You cannot set a permission value without specifying a value for the parent permission. |
| <a name="error_43012">43012</a> | Error updating employee rights: Permission {permission type} for {permission name} is set to {permission value}, which is wider than {permission value} for {permission name} | Specified notcompatible types for child and parent permissions. |
| <a name="error_43013">43013</a> | Error updating employee rights: role cannot be changed, account must have at least one administrator | You must always have at least one employee with the 'Account Administrator' role on your account |
| <a name="error_43014">43014</a> | Error updating employee rights: Your tariff plan does not allow you to configure access rights for employees | You can set rights for individual roles or create custom roles only on certain tariffs |
| <a name="error_43015">43015</a> | Error updating employee rights: no role found with ID {role id} | The custom role with the specified ID was not found. |
| <a name="error_43016">43016</a> | Employee password reset error: user has no email or invalid email | The employee for whom the password reset was requested does not have a valid email address. |
| <a name="error_43017">43017</a> | Employee password reset error: employee does not have access rights to the service | You cannot reset the password for an inactive user. |
| <a name="error_43018">43018</a> | Employee password reset failed: {reason name} | If it was not possible to send the password by mail, then a message is displayed about the reason |
| <a name="error_43019">43019</a> | Error deactivating employee access: this employee does not have access to the service | You cannot deactivate an employee who has never been active. |
| <a name="error_43020">43020</a> | Employee Access Deactivation Error: You cannot deactivate your account | You cannot deactivate your account. |
| <a name="error_43021">43021</a> | Error activating employee access: the user has not specified or incorrect email | The employee does not have or has an incorrect email address. |
| <a name="error_43022">43022</a> | Error activating employee access: login '{user login}' is already in use | When an employee is activated, a login is specified that is already used by another employee. |
| <a name="error_43023">43023</a> | Error activating employee access: the employee has no login set | No username was set to activate a user that was not previously active. |
| <a name="error_43024">43024</a> | Employee access activation error: on aaccount reached the maximum number of active employees | The tariff already has the maximum number of active employees. |
| <a name="error_43025">43025</a> | Employee access activation error: this employee already has access to the service | You cannot activate an active employee. |
| <a name="error_43026">43026</a> | Error changing employee access: only the administrator can activate, deactivate the employee's access to the service or reset the password | Only the administrator can change the activity. |
| <a name="error_43027">43027</a> | Employee rights validation error: Permission {permission type} must be set to {permission value} for {permission name} | For the specified types of permissions, permissions with specific types must be defined. |
| <a name="error_43028">43028</a> | Error updating employee rights: for {permission type} permission for {permission name}, the value must be the same as the value for {parent permission name} ({parent permission value}) or set to NO | Incompatible types specified for child and parent permissions. |
| <a name="error_43029">43029</a> | Error updating employee rights: Permission {permission type} for {permission name} ({permission value}) has a value that is incompatible with {parent permission name} ({parent permission value}) | Incompatible types specified for child and parent permissions. For example, the values OWN_SHARED and OWN_GROUP cannot be specified simultaneously within the same entity. |
| <a name="error_43030">43030</a> | Error saving employee: to use the system role 'Production Employee', the 'Production Management' option must be active | An employee with the 'Production Employee' role cannot be saved if the 'Production Management' option is not enabled on the account |

### Error codes for Image downloads

| Error Code | Message| Description|
| ------------| ----------| ---------|
| <a name="error_44000">44000</a> | POST method is not supported for URL `<url>` | The HTTP POST method is not supported for an image download request. |
| <a name="error_44001">44001</a> | PUT method not supported for URL `<url>` | The HTTP PUT method is not supported for an image download request. |
| <a name="error_44002">44002</a> | DELETE method not supported for URL `<url>` | The DELETE HTTP method is not supported for an image download request. |

### Error codes for Tariff limits

| Error Code | Message| Description|
| ------------| ----------| ---------|
| <a name="error_47000">47000</a> | Tariff limit: {limit description} | The tariff restriction for the current tariff has been triggered. |

### Error codes for Images

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_51001">51001</a> | Image error: Image has no content | When transferring an image as part of a product in the request to create a product, you must specify the content |
| <a name="error_51002">51002</a> | Image error: Cannot convert content field to image | The content of the "content" field must be an image encoded in base64 format with a jpg or png extension. |
| <a name="error_51003">51003</a> | Error while working with image: Insufficient storage space. | The storage space allocated for your account has run out. |
| <a name="error_51004">51004</a> | Error while working with the image: the image size exceeds the maximum allowed (3 mb) | Try reducing the image size. |
| <a name="error_51005">51005</a> | Error while working with image: image has no file name | When uploading an image, you must specify a non-empty filename in the filename field. |
| <a name="error_51006">51006</a> | Error when working with an image: the number of images for a product cannot be more than 10 | A product cannot have more than 10 images. |
| <a name="error_51007">51007</a> | Error while working with image: file storage is not available. | Internal error on the server. Please try again later. |

### Error codes for Server apps

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_55000">55000</a> | Viewing notifications is not supported by applications | Working with notifications is possible only when authorized on behalf of the user |
| <a name="error_55001">55001</a> | Application editing of notifications is not supported | Working with notifications is possible only when authorized on behalf of the user |
| <a name="error_55002">55002</a> | Deleting notifications by applications is not supported | Working with notifications is possible only when authorized on behalf of the user |
| <a name="error_55003">55003</a> | Viewing notification subscriptions is not supported by applications | Working with notifications is possible only when authorized on behalf of the user |
| <a name="error_55004">55004</a> | Creating and editing notification subscriptions is not supported by apps | Working with notifications is possible only when authorized on behalf of the user |
| <a name="error_55005">55005</a> | Access to the application context is not possible for this authorization entity | You are requesting the `/context/application` endpoint on behalf of the user |
| <a name="error_55006">55006</a> | Access to the user context is not possible for this authorization entity | You are requesting the `/context/employee` endpoint on behalf of the application |

### Error codes for autocomplete

| Error Code | Message| Description|
| ------------| ----------| ---------|
| <a name="error_56000">56000</a> | Template filling error: When specifying query parameter '{parameter}' with value '{passed value}', field value '{field name}' must be specified | Check that the specified field is filled in. For autofill, you need to specify the values of some fields: if the value is `fill` = `discount, price`, the **agent** field is required, if the value is `fill` = `vat` - **organization**. |

### Error codes for departments

| Error Code | Message| Description|
| ------------| ----------| ---------|
| <a name="error_60000">60000</a> | Access Denied: only a user with administrative rights can create, modify or delete departments |
| <a name="error_60001">60001</a> | Error saving department: department with the same name already exists | each department must have a unique name |
| <a name="error_60002">60002</a> | Department save error: index out of range | index must not be greater than the number of departments or less than 0 |
| <a name="error_60003">60003</a> | Error deleting department: cannot delete all departments | at least one department must remain after deletion |

### Error codes for asynchronous exchange

| Error Code | Message| Description|
| ------------| ----------| ---------|
| <a name="error_61000">61000</a> | Error creating asynchronous task: endpoint does not support asynchronous communication | The request does not support asynchronous execution. The list of available requests can be specified in the [Asynchronous Exchange](#kladana-json-api-asynchronous-exchange) |
| <a name="error_61001">61001</a> | Error creating asynchronous task: 'offset' and 'limit' parameters cannot be specified for asynchronous request | If you want to make an asynchronous request, don't specify the 'offset' and 'limit' parameters |
| <a name="error_61002">61002</a> | Error creating an asynchronous task: The limit on the number of concurrently executing asynchronous operations has been exceeded | Wait for one of the queued tasks to complete |
| <a name="error_61003">61003</a> | Error while requesting the result of an asynchronous task: The result of the task has been deleted | After the date specified in the **deletionDate** field, the result becomes unavailable. Need to create a new task |
| <a name="error_61004">61004</a> | Error while requesting the result of an asynchronous task: task failed | The task was not submitted for processing as a result of an internal error and has an `ERROR` status. Try creating the task again. If the error persists, contact support |
| <a name="error_61005">61005</a> | Error while requesting the result of an asynchronous task: The task was canceled | The task has been canceled and has a status of `CANCEL`. Need to create a new task |
| <a name="error_61006">61006</a> | Error while requesting the result of an asynchronous task: result not yet ready | The task is being processed and has the status `PROCESSING`. Wait for an asynchronous task to complete |
| <a name="error_61007">61007</a> | Error when canceling an asynchronous task: task already completed | Can only cancel tasks with statuses `PENDING` and `PROCESSING` |

### Error codes for Extended Bonus Program

| Error Code | Message| Description|
| ------------| ----------| ---------|
| <a name="error_62000">62000</a> | Error: you cannot create bonus operations with deferred accrual, because your tariff plan does not have the extended bonus program option | To create pending bonus transactions, you need the "Extended bonus program" |
| <a name="error_62001">62001</a> | Error: you cannot edit the date of accrual of the bonus transaction, because your tariff plan does not have the extended bonus program option | To change the date of accrual of the bonus operation, the "Extended bonus program" option must be enabled || <a name="error_62002">62002</a> | Validation error: field '{parameter}' cannot be specified for bonus write-off operation | The passed parameter is available for editing only for bonus accrual operations |
| <a name="error_62003">62003</a> | Validation error: field '{parameter}' can only be changed for pending bonus operation | The passed parameter is available for editing only for pending bonus operations |

### Error codes for Saved filter

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_63000">63000</a> | Saved filter applied error: Saved filter is incompatible with filter, search and order query parameters | A filter, search, and order parameter was passed, or multiple saved filters were applied |
| <a name="error_63001">63001</a> | Error applying saved filter: The specified saved filter is not compatible with the current endpoint | A saved filter has been applied that cannot be obtained on the current Angpoint along the path `/entity/[entityType]/namedfilter` |
| <a name="error_63002">63002</a> | Saved filter application error: Invalid saved filter reference format | The correct link format should be of type [URL](#kladana-json-api-general-info-data-types) |
| <a name="error_63003">63003</a> | Error applying saved filter: The specified saved filter reference contains an incompatible filter and endpoint | The passed link contains a filter ID that cannot be obtained on the endpoint passed in the link |
| <a name="error_63004">63004</a> | Error getting saved filters: invalid value '{value}' for query parameter 'owner' | Query parameter value 'owner' does not conform to href format |
| <a name="error_63005">63005</a> | Error getting saved filters: Applications can only get saved filters with the specified query parameter 'owner' | Applications can receive other users' saved filters, so you need to specify the 'owner' parameter |

### Error codes for Sales channels

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_64000">64000</a> | Sales Channel Update Error: You cannot change the type for an Automatically Created Sales Channel | Sales channel created automatically has a read-only immutable type |

### Error codes for Bins and Warehouse Locations

| Error code | Message | Description |
| ------------| ----------| ---------|
| <a name="error_67000">67000</a> |A bin with identifier '{parameter}' does not belong to the specified warehouse '{parameter}'" | You cannot specify a bin from another warehouse |
| <a name="error_67001">67001</a> | Cannot specify bin for '{parameter}' | You cannot specify a bin for document items of type Bundle or Service |
| <a name="error_67002">67002</a> | The specified location '{parameter}' is not a warehouse location '{parameter}' of the bin | It is not allowed to assign another warehouse location to a bin |
| <a name="error_67003">67003</a> | Exceeded the maximum number of locations at the warehouse | The limit on the number of locations on an account has been violated |
| <a name="error_67004">67004</a> | Warehouse location '{parameter}' is not a warehouse location '{parameter}' | You cannot change the location of another warehouse for a given warehouse |
| <a name="error_67005">67005</a> | Bin '{parameter}' is not a warehouse bin '{parameter}' | For a given warehouse, you cannot change the bin of another warehouse |
| <a name="error_67006">67006</a> | Barcode already specified in another bin | Cannot duplicate a bin barcode within a warehouse |

### Error Codes for Event Feed

| Error Code | Message | Description |
| ---------- | ------- | ----------- |
| <a name="error_70000">70000</a> | You cannot create more than {limit} events within a single transaction | The event limit has been reached for the specified transaction. |


### Error codes for Series

| Error code                      | Message                                            | Description                                       |
|---------------------------------|----------------------------------------------------|---------------------------------------------------|
| <a name="error_71000">71000</a> | Series saving error: assortment cannot be a series | Check the assortment of the series and try again. |
