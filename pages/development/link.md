---
title: Link Element
keywords: id, patient
tags: [link]
sidebar: profiles_sidebar
permalink: link.html
summary: "low level details for the care connect patient 'link' element"
---
{% include important.html content="The identifier element described is  used to provide a unique method to identify a NHS patient. It is not the identifier for the FHIR message" %}

## Identifier Implementation Guide ##

### Use case ###

This specification describes a single use case. .

### Link ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
|Element| link| BackboneElement | Provides a link to another patient record and the type of record being referenced. |

### Element Usage ###

Care Connect uses the Patient.Identifier element and creates two independent sliced elements that can capture a patients identifier as either a national identifier (NHS Number) or an alternative local identifier.

This valueset comprises of codes from the NHS data Dictionary: NHS Number Status Indicator Code which can be viewed at [NHS Number Status Indicator Code](http://www.datadictionary.nhs.uk/data_dictionary/data_field_notes/n/nhs/nhs_number_status_indicator_code_de.asp?shownav=0 "NHS Number Status Indicator Code")


On the wire XML example

```xml

```

```json

```

*Error Handling*

The provider system SHALL return an error if:








