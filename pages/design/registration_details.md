---
title: Registration Details Complex Extension
keywords: registration, extension
tags: [profile,element,id]
sidebar: profiles_sidebar
permalink: registration_details.html
summary: "low level details for the care connect patient 'registrationDetails' extension"
---
## Identifier Implementation Guide ##

### Use case ###

This specification describes a single use case. 

### Regsitration Details ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Complex Extension|registrationDetails| complex extension|


### Extension Usage ###

- 'nhsNumber' **MUST** be used where available. This is the primary identifier for a patient registered with a GP practice geographically 


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






