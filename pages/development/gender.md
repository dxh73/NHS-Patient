---
title: Gender Element
keywords: gender
tags: [gender]
sidebar: profiles_sidebar
permalink: gender.html
summary: "low level details for the care connect patient 'gender' element"
---
## Identifier Implementation Guide ##

### Use case ###

This specification describes a single use case. 

### Element Usage ###

Gender element provides an code to indicate the sex or gender of the patient to which the record belongs.

### Enter element here!!! ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Primitive| gender| code | Patients gender used for administration purposes |


- 'gender' **MUST** be populated using one of the codes within the CareConnect-AdministrativeGender-1 valueset.
- Additional codes are not permitted.


Gender uses the INTEROpen valueset CareConnect-AdministrativeGender-1 which **MUST** be used to identify the patients gender. No other codes are valid.

Example of Correct Usage

|Usage| Element| examples| Comments|
|![Tick](images/tick.png)|`gender`|male|Gender stored using correct code|
|![Tick](images/tick.png)| | female||
|![Tick](images/tick.png)||other||

Example of Incorrect Usage

|Usage| Element| examples| Comments|
|![Tick](images/tick.png)|`gender`|Male|Gender stored using incorrect code|
|![Tick](images/tick.png)| |Female||
|![Tick](images/tick.png)||O||

```http
http://hl7.org.uk/CareConnect-AdministrativeGender-1.valueset.xml
```

|Code|Display|Definition|
|male|Male|Male|
|female|Female|Female|
|other|Other|Other|
|unknown|Unknown|Unknown|


On the wire XML example

```xml
<gender value="male"/>
```

On the wire example in JSON

```json
{
  "gender": { "-value": "male" }
}
```

*Error Handling*

The provider system SHALL return an error if:

- The value of `gender` is omitted
- The value does not match one from the CareConnect-AdministrativeGender-1 valueset






