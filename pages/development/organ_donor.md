---
title: Organ Donor Extension
keywords: Organ, donor
tags: [organ,donor]
sidebar: profiles_sidebar
permalink: organ_donor.html
summary: "low level details for the care connect patient 'organDonor' extension"
---
## Organ Donor Implementation Guide ##

### Use case ###

This specification describes a single use case. 

### Organ Donor ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Extension| organDonor| boolean | A true or false flag to indicate if the patient is on the Organ Donor register|

### Element Usage ###

An extension has been provided to indicate if the patient has agreed to be an Organ Donor. 

{% include important.html content="Patient must be on the organ donor register if this value is set to true" %}

The extension has a url of http://hl7.org.uk/CareConnect-OrganDonor-1-Extension.structuredefinition.xml

On the wire XML example

```xml
<extension url="http://hl7.org.uk/fhir/CareConnect-OrganDonor-1-Extension">
		<valueBoolean value="true"/>
</extension>
```

On the wire example in JSON

```json
{
  "extension": {
    "-url": "http://hl7.org.uk/fhir/CareConnect-OrganDonor-1-Extension",
    "valueBoolean": { "-value": "true" }
  }
}
```

*Error Handling*

The provider system SHALL return an error if:

- The value is not set to true or false










