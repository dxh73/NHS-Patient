---
title: Marital Status Element
keywords: marital status
tags: [marital statyus]
sidebar: profiles_sidebar
permalink: marital_status.html
summary: "low level details for the care connect patient 'maritalStatus' element"
---
## Marital Status Implementation Guide ##

### Use case ###

This specification describes a single use case. 

### Element Usage ###

maritalStatus is used to determine the current marital status of the patient by using a pre-defined set of codes using the valueset CareConnect-MaritalStatus-1. This valueset has a `required` binding.

### Marital Status ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
|Parent Data Type| maritalStatus| CodeableConcept | Marital status of the patient. Has child elements. |

- `maritalStatus` *may* be used but **must** include a code from the CareConnect-MaritalStatus-1 valueset
- Element **must** include the child elements:

	- system **must** have a url of http://hl7.org.uk/CareConnect-MaritalStatus-1.valueset.xml
	- code **must** be a code included the CareConnect-MaritalStatus-1 valueset
	- display **must** match up with its relevant code

- UNK code **must not** be used

```http
http://hl7.org.uk/CareConnect-MaritalStatus-1.valueset.xml
```
Codes from the inline code system [http://hl7.org/fhir/marital-status:](http://hl7.org/fhir/marital-status)

|Code|Display|Defintion|
|U|Unmarried|The person is not presently married. The marital history is not known or stated.|

Codes from the external code system [http://hl7.org.uk/CareConnect-MaritalStatus:](http://hl7.org.uk/CareConnect-MaritalStatus)

|Code|Display|Defintion|
|D|Divorced|
|L|Legally Separated|
|M|Married|
|S|Never Married|
|W|Widowed|

{% include warning.html content="CareConnect-MaritalStatus-1 valueset has a code of UNK from the external code system [http://hl7.org/fhir/v3/NullFlavor:](http://hl7.org/fhir/v3/NullFlavor:). This **MUST NOT** be used in any implementation." %}

**Example of Correct Usage**

|Usage| Element| examples| Comments|
|![Tick](images/tick.png)|`maritalStatus`|Code=D; Display=Divorced|Value of D indicates Divorced and is valid.|
|![Tick](images/tick.png)||Code=S; Display=Never Married|Value of S indicates patient has never been married.|

**Example of Incorrect Usage**

|Usage| Element| examples| Comments|
|![Cross](images/cross.png)|`maritalStatus`|Code=S; Display=Single|Although S is a valid code, the display value should be Never Married not Single.|
|![Cross](images/cross.png)||Code=UNK; Display=unknown |The code UNK should not be used, despite being valid.|
|![Cross](images/cross.png)||Code=A|The code is not found within the maritalStatus valuesets.|

### On the wire XML example ###

```xml
<maritalStatus>
	<coding>
		<system value="http://hl7.org/fhir/marital-status"/>
		<code value="M"/>
		<display value="Married"/>
	</coding>
</maritalStatus>
```

### On the wire example in JSON ###

```json
{
  "maritalStatus": {
    "coding": {
      "system": { "-value": "http://hl7.org/fhir/marital-status" },
      "code": { "-value": "M" },
      "display": { "-value": "Married" }
    }
  }
}
```

*Error Handling*

The provider system SHALL return an error if:

- An invalid marital code is used
- The system url is not http://hl7.org.uk/CareConnect-MaritalStatus-1.valueset.xml
- UNK code is used
- The display value is incorrect








