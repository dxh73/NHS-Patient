---
title: Identifier Element
keywords: id, patient
tags: [profile,element,id]
sidebar: profiles_sidebar
permalink: organization.html
summary: "low level details for the care connect patient 'id' element"
---
{% include important.html content="The identifier element described is  used to provide a unique method to identify a NHS patient. It is not the identifier for the FHIR message" %}

## Identifier Implementation Guide ##

### Use case ###

This specification describes a single use case. 

### Element Usage ###

TODO

### Enter element here!!! ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Slice| identifier| Identifier | A unique national and/or local identifier for a patient |
|Complex| ||| |
|Extension||| |

- 'nhsNumber' **MUST** be used where available. This is the primary identifier for a patient registered with a GP practice geographically 
- a
- a


### Enter extensions here!! ###



```http
enter extensions url here!!
```

Consumers SHALL use the NHS Number Verification Status where `nhsNumber` is used as the primary patient identifier.

The extensions uses the following valueset:

```http
Enter valuesets here!!
```
Links to valuesets here!!

Valueset table here if viable!!

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






