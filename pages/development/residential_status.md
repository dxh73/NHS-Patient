---
title: Residential Status Extension
keywords: id, patient
tags: [profile,element,id]
sidebar: profiles_sidebar
permalink: residential_status.html
summary: "low level details for the care connect patient 'residentialStatus' element"
---
## Residential Status Implementation Guide ##

### Use case ###

This specification describes a single use case. 

### Residential Status ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Extension| residentialStatus| CodeableConcept |Extension provides an coded value to indcate if the patient is a UK or overseas resident.|

### Element Usage ###

The optional extension uses a code to indicate if the patient is a UK resident or an overseas resident.  

`organDonor` is a codeableConcept data type which captures the patients residential status using a code and display pairing.  The extension has a url of http://hl7.org.uk/CareConnect-ResidentialStatus-1-Extension.structuredefinition.xml

Valueset

The extensions uses the [CareConnect-ResidentialStatus-1](http://www.interopen.org/candidate-profiles/care-connect/CareConnect-ResidentialStatus-1.valueset.html) valueset to define the residency codes. These are shown below:

|Code|Display|
|H|UK Resident|
|O|Overseas Resident|

The valueset *may* have a coding.system but **MUST** have a value of http://hl7.org.uk/CareConnect-ResidentialStatus-1-Extension.structuredefinition.xml when used.

The coding.code value *may* be used but **must** be a code in the valueset and have a max of 1 character when in use. A null value is not permitted.

The coding.display *may* be used but **must** have a value that matches the coding.code when used.

On the wire XML example

```xml
<extension url="http://hl7.org.uk/fhir/CareConnect-ResidentialStatus-1-Extension">
		<valueCodeableConcept>
			<coding>
				<system value="http://hl7.org.uk/fhir/ValueSet/CareConnect-ResidentialStatus"/>
				<code value="H"/>
				<display value="UK Resident"/>
			</coding>
		</valueCodeableConcept>
	</extension>
```

On the wire example in JSON

```json
{
  "extension": {
    "-url": "http://hl7.org.uk/fhir/CareConnect-ResidentialStatus-1-Extension",
    "valueCodeableConcept": {
      "coding": {
        "system": { "-value": "http://hl7.org.uk/fhir/ValueSet/CareConnect-ResidentialStatus" },
        "code": { "-value": "H" },
        "display": { "-value": "UK Resident" }
      }
    }
  }
}
```

*Error Handling*

The provider system SHALL return an error if:

- The extension does not have a value of H or O






