---
title: Ethnic Category Extension
keywords: ethnic, extension
tags: [ethnic,extension]
sidebar: profiles_sidebar
permalink: ethnic_category.html
summary: "low level details for the care connect patient 'ethnicCategory' extension"
---

## Ethnic Category Implementation Guide ##

### Use case ###

This specification describes a single use case. 

### Ethnic Category ###

This optional extension allows the implementation of a ethnicity element to capture the patients designated ethnic category e.g English, Scottish, etc

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Extension| ethnicCategory| CodeableConcept |Optional data to capture the patients ethnicity|

### Element Usage ###

`ethnicCategory` is a codeableConcept data type which captures the patients chosen ethnic cateorgy using a code and display pairing. The extension has a url of http://hl7.org.uk/CareConnect-EthnicCategory-1-Extension.structuredefinition.xml. 

The codes are available from the pre-defined valueset [CareConnect-EthnicCategory-1](http://www.interopen.org/candidate-profiles/care-connect/CareConnect-EthnicCategory-1.valueset.html).

The valueset *may* have a coding.system but **MUST** have a value of http://hl7.org.uk/CareConnect-EthnicCategory-1-Extension.structuredefinition.xml when used.

The coding.code value *may* be used but **must** be a code in the valueset and have a max of 2 characters when in use. A null value is not permitted.

The coding.display *may* be used but **must** have a value that matches the coding.code when used.

**Examples**

```xml
<extension url="http://hl7.org.uk/fhir/CareConnect-EthnicCategory-1-Extension">
	<valueCodeableConcept>
		<coding>
			<system value="http://hl7.org.uk/fhir/CareConnect-EthnicCategory-1"/>
			<code value="A"/>
			<display value="British, Mixed British"/>
		</coding>
	</valueCodeableConcept>
</extension>
```

On the wire example in JSON

```json
{
  "extension": {
    "-url": "http://hl7.org.uk/fhir/CareConnect-EthnicCategory-1-Extension",
    "valueCodeableConcept": {
      "coding": {
        "system": { "-value": "http://hl7.org.uk/fhir/CareConnect-EthnicCategory-1" },
        "code": { "-value": "A" },
        "display": { "-value": "British, Mixed British" }
      }
    }
  }
}
```

*Error Handling*

The provider system SHALL return an error if:

- The coding system is not http://hl7.org.uk/fhir/CareConnect-EthnicCategory-1
- The code value is not found within the CareConnect-EthnicCategory-1 valueset
- The display value does not match the code value
- An invalid display value is used








