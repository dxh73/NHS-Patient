---
title: Name Element
keywords: name, patient
tags: [profile,element,name]
sidebar: profiles_sidebar
permalink: name.html
summary: "low level details for the care connect patient 'name' element"
---
## Name Implementation Guide ##

### Use case ###

This specification describes a single use case. 

### Element Usage ###

Care Connect uses the Patient.Name element and creates two independent sliced elements that can capture a patients name as either a usual or other name. Each slice contains child elements that together form the patients name. Names can be a complex subject where different countries may structure the name different depending on various cultures. This guide will initial consist of names used in the UK. 

### Usual Name ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Slice| identifier| Identifier | A unique national and/or local identifier for a patient |
|Complex|name#1 [usual]|HumanName|The usual name that the patient is identified by|
|Child Elements| Use <br/> text <br/> family <br/> given <br/> prefix <br/> suffix <br/> period |

- `name` **MUST** be used present either using `usual` or `other`.
- `usual` **MUST** include the `use` child element which **MUST** have a value of "usual"
- `given` is a recommend value and *may* inlcude middle names.
- `family` child element **MUST** be populated and only using alphabetic characters.
- `prefix` *may* be used.
- Only one instance of `usual` can be used

**Recommendations**

- `family` element should be stored in uppercase letters to help distinguish it from the given names where used.
- `given` element should be stored in title case where used. For example David not DAVID or david.
- Where `given` consists of multiple components, these should be separated by a hyphen or space. e.g. Laura Jane or Mary-Anne. 
- `prefix` element should be stored in title case where used. For example Mrs not MRS.

**PDS and GDSC**

The name element and its child elements are only limited in FHIR by a 1Mb size. It is recommended that an additional limitation of a maximum 40 characters for `name` element and its child elements is defined to fall in line with the requirements defined by the Personal Demographic Service (PDS). 

- `prefix` should have a maximum length of 35 characters
- `family` should have a maximum length of 40 characters.
- `given` should have a maximum length of 40 characters.

Examples of Correct Usage

|Usage| Element| examples| Comments|
|![Tick](images/tick.png)|`family` name| HENDERSON| Patient family name|
|![Tick](images/tick.png)|`given` name| David| Patient given name|
|![Tick](images/tick.png)|`given` name| Laura Jane| Patient given name|
|![Tick](images/tick.png)|`prefix` name| Mr| Patients prefix.|

Examples of Incorrect Usage

|Usage| Element| examples| Comments|
|![Cross](images/cross.png)|`family` name| henderson| Not in uppercase|
|![Cross](images/cross.png)|`given` name| david| Not in title case|
|![Cross](images/cross.png)|`family` name| laura jane| Not in title case. |
|![Cross](images/cross.png)|`family` name| mrs| Does not have title case|

The child element `use` **MUST** use values found in the following valueset:

```http
http://hl7.org/fhir/ValueSet/name-use
```

On the wire XML example

```xml
<name>
	<use value="usual"/>
	<family value="Smith"/>
	<given value="Jim"/>
	<prefix value="Mr"/>
</name>
```

On the wire example in JSON

```json
{
  "name": {
    "use": { "-value": "usual" },
    "family": { "-value": "Smith" },
    "given": { "-value": "Jim" },
    "prefix": { "-value": "Mr" }
  }
}
```

*Error Handling*

The provider system SHALL return an error if:

- Name does not match with the `identifier` value
- `use` does not have a value of "usual"

### Other Name ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Slice| identifier| Identifier | A unique national and/or local identifier for a patient |
|Complex|name#2 [other]|HumanName|Any alternative name that the patient is identified by e.g. nickname or official name|
|Child Elements| Use <br/> text <br/> family <br/> given <br/> prefix <br/> suffix <br/> period |


- `name` **MUST** be used present either using `usual` or `other`.
- `usual` **MUST** include the `use` child element and be populated with a value from NameUse.
- `family` child element **MUST** be populated
- Multiple instances of `other` are permitted

The child element `use` **MUST** use values found in the NameUse valueset. Details can be found here:

```http
http://hl7.org/fhir/ValueSet/name-use
```
The same recommendations apply to `other` as they do to `usual`.

### On the wire XML example ###

```xml
<name>
	<use value="official"/>
	<family value="Smith"/>
	<given value="James"/>
	<prefix value="Mr"/>
</name>
```

On the wire example in JSON

```json
{
  "name": {
    "use": { "-value": "usual" },
    "family": { "-value": "Smith" },
    "given": { "-value": "James" },
    "prefix": { "-value": "Mr" }
  }
}
```

*Error Handling*

The provider system SHALL return an error if:

- Name does not match with the `identifier` value
- `use` is not a valid value from the NameUse valueset

## RESTful Architecture ##

As part of the FHIR RESTful API architecture, `name` may be used as a parameter for record creation, searching and removal when using a server that provides the FHIR RSTFUL functionality. 

**Create record**

The *create* interaction is performed by an HTTP POST of the CareConnect-Patient-1 resource to the designated FHIR endpoint. A create interaction **MAY** include `name` to capture the patients name details. 

Example HTTP POST operation:

```http
POST [base]/Patient
```

A successful POST can return several possible responses to the request:

- HTTP 201-Record Created: The entry has been successfully created and the NRLS returns an HTTP Location header containing the 'server' assigned logical Id of the created resource.
- HTTP 400-Bad Request: Resource could not be parsed or failed basic FHIR validation rules
- HTTP 404-Not Found: Resource type not supported, or not a FHIR end-point
- HTTP 422-Unprocessable Entity: The proposed resource violated applicable FHIR profiles or server business rules.

**Remove Record**

The *conditional delete* interaction is used to remove a CareConnect-Patient-1 record from a FHIR endpoint using the `name` element, which may contain any of the child element values as part of the parameters for removal. It would expected, but not required, to include additional parameters when using `name` to delete a record. 

```http
DELETE [base]/Patient?family="Smith"
```
Example with additional parameters

```http
DELETE [base]/Patient?family="Smith"&given="John"
```

Assuming successful URL submission, there are two possible outcomes to the delete request:

- HTTP 204-No Content: The record either does not exist or has been successfully deleted.
- HTTP 404-No match to delete: The parameters used to identify the record were not met.

**Search for a record**

The *search* interaction uses the HTTP GET command to return a set of results based on the search criteria submitted. The `name` element MAY be used to search for a record on a FHIR endpoint using child element values as part of the search parameters.

```http
GET [base]/Patient?surname="Smith"
```

Common HTTP Status codes returned on FHIR-related errors (in addition to normal HTTP errors related to security, header and content type negotiation issues):

- 400 Bad Request search could not be processed or failed basic FHIR validation rules
- 401 Not Authorized authorization is required for the interaction that was attempted
- 404 Not Found resource type not supported, or not a FHIR end-point


## Code Examples ##

Examples of C# and Java will be provided in a later version of this API guide.

Examples






