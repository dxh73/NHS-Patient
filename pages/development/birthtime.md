---
title: Birth Time Extension
keywords: birth, time
tags: [birth,extension]
sidebar: profiles_sidebar
permalink: birthtime.html
summary: "low level details for the care connect patient 'birthTime' extension"
---

## Identifier Implementation Guide ##

### Use case ###

This specification describes a single use case. 



### birthTime ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Extension| birthTime| dateTime |The time of day that the patient was born. This includes the date to ensure that the time zone information can be communicated effectively.|

An optional extension that *may* be used to capture to time of a patients birth. 

### Extension Usage ###

The data type of dateTime requires the implantation to follow the following guidelines:

- Time **must** contain a date in addition to the time.
- The time **must** use a 24hr format 
- The time **must** be present, with seconds being optional. The time 24:00 is not valid.
- A timezone **must** be used. 

The extension url is:

```http
http://hl7.org/fhir/StructureDefinition/patient-birthTime
```

{% include important.html content="The extension is not an extension of birthDate, but an extension of the CareConnect-Patient-1 profile. Its location in the XML structure must be correct" %}

On the wire XML example

```xml
<extension url="http://hl7.org/fhir/StructureDefinition/patient-birthTime">
	<valueDateTime value="2016-01-02T08:39:16+00:00"/>
</extension>
```

On the wire example in JSON

```json
{
  "extension": {
    "-url": "http://hl7.org/fhir/StructureDefinition/patient-birthTime",
    "valueDateTime": { "-value": "2016-01-02T08:39:16+00:00" }
  }
}
```

*Error Handling*

The provider system SHALL return an error if:

- `birthTime` is missing a time
- `birthTime` is missing a timezone
- `birthTime` date part does not match with the value in `birthDate`







