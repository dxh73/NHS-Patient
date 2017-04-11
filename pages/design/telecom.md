---
title: Telecom Element
keywords: id, patient
tags: [profile,element,id]
sidebar: profiles_sidebar
permalink: telecom.html
summary: "low level details for the care connect patient 'telecom' element"
---
## Identifier Implementation Guide ##

### Use case ###

This specification describes a single use case. 

### Element Usage ###

The Telecom element provides a method of contact for a patient. FHIR provides a pre-define set of contact methods and usages. Telecom is not used exclusively for recording a patients telephone number (landline or mobile).

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Primitive| telecom| ContactPoint |A contact method and suitable value for the patient|

- 'telecom' **MAY** be used to capture the patients contact details using a predefine contact type.
- Where `telecom` is used, the telecom.system **MUST** use the HL7 FHIR ContactPointSystem valueset
- Where `telecom` is used, the telecom.use **MUST** use the HL7 FHIR ContactPointUse valueset.
 

```http
Enter valuesets here!!
```
Links to valuesets here!!

Valueset table here if viable!!


### Telecom Values ###

Telecom element is a string data type, therefore does not enforce any formats. Best practice should be followed when using the telecom element and adhere to the following structures for each system defined in the ContactPointSystem:

**Phone, fax and pager**

**email**

An email address **MUST** consist of name and domain parts to form the address

Example

John.Smith@nhs.net

**other**


 

On the wire XML example

```xml
xml example here!!
```

On the wire example in JSON

```json
JSON example here!!
```

*Error Handling*

The provider system SHALL return an error if:

error here!!

## RESTful Usage ##


Examples






