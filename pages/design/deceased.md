---
title: deceased Element
keywords: deceased
tags: [deceased, ]
sidebar: profiles_sidebar
permalink: deceased.html
summary: "low level details for the care connect patient 'id' element"
---
## Identifier Implementation Guide ##

### Use case ###

This specification describes a single use case. 

### Element Usage ###

The deceased element provides an implementer a choice of data types to represent whether the patient is deceased. Only one of the two choices can be used to make this representation.

### Deceased ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Choice| deceased| boolean or dateTime | Element used to determine if the patient is deceased using a true/false value or a date and time value.|

- Boolean or dateTime value **MUST** be used with this element
- A time and timezone value *may* be used as part of the value

```xml
<deceasedBoolean value="false"/>
```
```xml
<deceasedDateTime value="1973-12-10"/>
```

On the wire example in JSON

```json
{
  "deceasedBoolean": { "value": "true" }
}
```
```json
{
  "deceasedDateTime": { "value": "1957-01-01" }
}
```

*Error Handling*

The provider system SHALL return an error if:

- The dateTime value is not a valid format
- The boolean value is not true or false or is missing. 







