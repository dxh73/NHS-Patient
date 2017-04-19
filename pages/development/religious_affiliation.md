---
title: Religious Affiliation Extension
keywords: religios, extension
tags: [religious,affiliation]
sidebar: profiles_sidebar
permalink: religious_affiliation.html
summary: "low level details for the care connect patient 'religiousAffiliation' extension"
---

## Religious Affiliation Implementation Guide ##

### Use case ###

This specification describes a single use case. 

### Religious Affiliation Extension ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Slice| identifier| Identifier | A unique national and/or local identifier for a patient |
|Complex| ||| |
|Extension||| |

### Element Usage ###

`religiousAffiliation` is a codeableConcept data type which captures the patients chosen religious affiliation using a code and display pairing. The codes are available from the pre-defined valueset CareConnect-ReligiousAffiliation-1.

The extensions uses the following valueset:

```http

```
Links to valuesets here!!

Valueset table here if viable!!

On the wire XML example

```xml
<extension url="http://hl7.org.uk/fhir/CareConnect-ReligiousAffiliation-1-Extension">
	<valueCodeableConcept>
		<coding>
			<system value="http://snomed.info/sct"/>
			<code value="160542002"/>
			<display value="Atheist (person)"/>
		</coding>
	</valueCodeableConcept>
</extension>
```

On the wire example in JSON

```json
{
  "extension": {
    "-url": "http://hl7.org.uk/fhir/CareConnect-ReligiousAffiliation-1-Extension",
    "valueCodeableConcept": {
      "coding": {
        "system": { "-value": "http://snomed.info/sct" },
        "code": { "-value": "160542002" },
        "display": { "-value": "Atheist (person)" }
      }
    }
  }
}
```

*Error Handling*

The provider system SHALL return an error if:

error here!!

## RESTful Usage ##


Examples






