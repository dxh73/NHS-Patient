---
title: multipleBirth Element
keywords: birth, multiple
tags: [profile,element,id]
sidebar: profiles_sidebar
permalink: multiple_birth.html
summary: "low level details for the care connect patient 'multipleBirth' element"
---
{% include important.html content="The identifier element described is  used to provide a unique method to identify a NHS patient. It is not the identifier for the FHIR message" %}

## Identifier Implementation Guide ##

### Use case ###

This specification describes a single use case. 

### Element Usage ###

`multipleBirth` is a mechanism for recording if the patient is part of a multiple birth i.e twins, triplet, etc.. The element allows this data to be captured as a boolean value or an integer value. 

### Multiple Birth ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
|Choice| multipleBirth| boolean/integer|Indicates if the patient (baby) is part of a multiple birth.|
|Complex| ||| |
|Extension||| |

- `multipleBirth` **must** be either a numeric value or a boolean value.
- Only one instance of a `multipleBirth` is permitted.

On the wire XML example

```xml
<multipleBirthBoolean value="true"/>
```
```xml
<multipleBirthInteger value="2"/>
```

On the wire example in JSON

```json
{
  "multipleBirthBoolean": { "-value": "true" }
}
```
```json
{
  "multipleBirthInteger": { "-value": "2" }
}
```

*Error Handling*

The provider system SHALL return an error if:

- The value is not a boolean or integer







