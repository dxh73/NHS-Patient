---
title: Identifier Element
keywords: id, patient
tags: [profile,element,id]
sidebar: profiles_sidebar
permalink: link.html
summary: "low level details for the care connect patient 'id' element"
---
{% include important.html content="The identifier element described is  used to provide a unique method to identify a NHS patient. It is not the identifier for the FHIR message" %}

## Identifier Implementation Guide ##

### Use case ###

This specification describes a single use case. .

### Element Usage ###

Care Connect uses the Patient.Identifier element and creates two independent sliced elements that can capture a patients identifier as either a national identifier (NHS Number) or an alternative local identifier.

### NHS Number Identifier ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Slice| identifier| Identifier | A unique national and/or local identifier for a patient |
|Complex| identifier#1 [nhsNumber]|Identifier| The patient NHS Number.|
|Extension|nhsNumberVerificationStatus|CodeableConcept| An extension with a required valueset that determines the status of the NHS number allocated to the patient.|

- 'nhsNumber' **MUST** be used where available. This is the primary identifier for a patient registered with a GP practice geographically located in England, Wales or Northern Ireland.
- The NHS number **MUST** consist of a 10 digit numeric value.
- The namespace for the `nhsNumber` MUST be defined as http://fhir.nhs.net/Id/nhs-number
- The `nhsNumber` MUST be stored as a string value
- - A local identifier **MAY** be used in addition to the NHS number.

### NHS Number Verification Status ###

CareConnect NhsNumberVerificationStatus extension profile:

```http
http://hl7.org.uk/CareConnect-NhsNumberVerificatnStatus-1-Extension.structuredefinition.xml
```

Consumers SHALL use the NHS Number Verification Status where `nhsNumber` is used as the primary patient identifier.

The extensions uses the following valueset:

```http
http://hl7.org.uk/CareConnect-NhsNumberVerificationStatus-1.valueset.xml
```
This valueset comprises of codes from the NHS data Dictionary: NHS Number Status Indicator Code which can be viewed at [NHS Number Status Indicator Code](http://www.datadictionary.nhs.uk/data_dictionary/data_field_notes/n/nhs/nhs_number_status_indicator_code_de.asp?shownav=0 "NHS Number Status Indicator Code")

NHS Status Indicator Codes

|Code|Display|
|----|-------|
|01|Number present and verified|
|02|Number present but not traced	|
|03|Trace required|
|04|Trace attempted - No match or multiple match found|
|05|Trace needs to be resolved - (NHS number or patient detail conflict)|
|06|Trace in progress|
|07|Number not present and trace not required|
|08|Trace postponed (baby under six weeks old)|

On the wire XML example

```xml
<identifier>
	<extension url="http://hl7.org.uk/fhir/CareConnect-NhsNumberVerificationStatus-1-Extension">
		<valueCodeableConcept>
			<coding>
			 <system value="http://hl7.org.uk/fhir/ValueSet/CareConnect-NhsNumberVerificationStatus"/>
			 <code value="01"/>
			 <display value="Number present and verified"/>
			</coding>
		</valueCodeableConcept>
	</extension>
	<system value="https://fhir.nhs.uk/Id/nhs-number"/>
		<value value="1352465790"/>
</identifier>
```

On the wire example in JSON

```json
{
  "identifier": {
    "extension": {
      "-url": "http://hl7.org.uk/fhir/CareConnect-NhsNumberVerificationStatus-1-Extension",
      "valueCodeableConcept": {
        "coding": {
          "system": { "-value": "http://hl7.org.uk/fhir/ValueSet/CareConnect-NhsNumberVerificationStatus" },
          "code": { "-value": "01" },
          "display": { "-value": "Number present and verified" }
        }
      }
    },
    "system": { "-value": "https://fhir.nhs.uk/Id/nhs-number" },
    "value": { "-value": "1352465790" }
  }
}
```

*Error Handling*

The provider system SHALL return an error if:

- the `nhsNumber` is invalid (i.e. fails NHS Number format and check digit tests).
- the `nhsNumber` is not associated with a NHS Number Status Indicator Code

### Other Identifiers ###

Provider systems MAY use alternative patient identifiers in addition to the `nhsNumber` sliced element. 

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Slice| identifier| Identifier | A unique national and/or local identifier for a patient |
|Complex| identifier#2 [other]|Identifier| Alternative identifers for a NHS patient.|


- `other` **MUST NOT** be used in place of an NHS Number
- Providers **MAY** uses multiple local identifiers where it is appropreiate
- Providers **MAY** use `other` in addition to nhsNumber`
- The namespace for the `other` MUST be populated when identifier is used
- The `other` MUST be a populated string value

On the wire XML example

```xml
<identifier>
	<system value="http://fhir.nhs.uk/Id/local-identifier"/>
		<value value="MRT12345"/>
</identifier>
```

```json
{
  "identifier": {
    "system": { "-value": "http://fhir.nhs.uk/Id/local-identifier" },
    "value": { "-value": "MRT12345" }
  }
}
```

*Error Handling*

The provider system SHALL return an error if:

TODO

## RESTful Usage ##


Examples






