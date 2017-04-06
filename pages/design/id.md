---
title: id Element
keywords: id, patient
tags: [profile,element,id]
sidebar: elements_sidebar
permalink: id.html
summary: "low level details for the care connect patient 'id' element"
---
{% include important.html content="The id element described is not the id that identifies a patient. It is the id for the FHIR message" %}

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Primitive| id| Id | String value, alphanumeric |


#Artefact Guidance#

**Usage**

The logical ID element MUST be used to uniquely identify an instance of a DDS patient artefact.

**Cardinality**

**Flag**

No flag is used with this element.

**Valueset**

No valueset is used with this element.

**Populating**

Id MUST be populated with a unique 128-bit integer number known as a UUID or GUID.

**Example**

<id **value**="31686b67-9f20-4644-9a54-193d2f91de57"/">


