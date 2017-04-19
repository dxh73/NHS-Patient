---
title: Treatment Category Extension
keywords: treatment
tags: [treatment]
sidebar: profiles_sidebar
permalink: treatment_category.html
summary: "low level details for the care connect patient 'treatmentCategory' extension"
---
## Treatment Category Implementation Guide ##

### Use case ###

This specification describes a single use case. 

### Element Usage ###

TODO

### Enter element here!!! ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Extension| treatmentCategory| CodeableConcept | Code to capture charging information for overseas patients|

### Element Usage ###

`treatmentCategory` is a codeableConcept data type which captures the patients chosen ethnic cateorgy using a code and display pairing. The extension has a url of hhttp://hl7.org.uk/CareConnect-TreatmentCategory-1-Extension.structuredefinition.xml.

The codes are available from the pre-defined valueset [CareConnect-TreatmentCategory-1](http://www.interopen.org/candidate-profiles/care-connect/CareConnect-TreatmentCategory-1.valueset.html).

Valueset

|Code|Display|Definition
|1|Exempt from payment - subject to reciprocal health agreement||
|2|Exempt from payment - other||
|3|To pay hotel fees only||
|4|To pay all fees||
|9|Charging rate not known||
|8|Not applicable|Not an Overseas Visitor


The valueset *may* have a valeuCodeableConcept.coding.system, but **MUST** have a value of http://hl7.org.uk/CareConnect-TreatmentCategory-1.valueset.xml when used.

The coding.code value *may* be used but **must** be a code in the valueset and have a max of 1 character when in use. A null value is not permitted.

The coding.display *may* be used but **must** have a value that matches the coding.code when used.


On the wire XML example

```xml
<extension url="http://hl7.org.uk/fhir/CareConnect-TreatmentCategory-1-Extension">
	<valueCodeableConcept>
		<coding>
			<system value="http://hl7.org.uk/fhir/ValueSet/CareConnect-TreatmentCategory"/>
			<code value="8"/>
			<display value="Not applicable"/>
		</coding>
	</valueCodeableConcept>
</extension>
```

On the wire example in JSON

```json
{
  "extension": {
    "-url": "http://hl7.org.uk/fhir/CareConnect-TreatmentCategory-1-Extension",
    "valueCodeableConcept": {
      "coding": {
        "system": { "-value": "http://hl7.org.uk/fhir/ValueSet/CareConnect-TreatmentCategory" },
        "code": { "-value": "8" },
        "display": { "-value": "Not applicable" }
      }
    }
  }
}
```

*Error Handling*

The provider system SHALL return an error if:

- The value is not one defined within the valueset





