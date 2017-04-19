---
title: Active Element
keywords: patient
tags: [profile,element,active]
sidebar: profiles_sidebar
permalink: active.html
summary: "low level details for the care connect patient 'id' element"
---
## Active Implementation Guide ##

### Use case ###

This specification describes a single use case. 

### Active ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Primitive| active| Boolean | A true or false value that indicates if the patients record is currently in active used. |

### Element Usage ###

Care Connect uses the Patient.Active element as an indicator as to whether the patients record is in active use. The default value is true. 

- 'active' **MAY** be used where available. It is not a mandatory element.
- Default value = true

**Example of Correct Usage**

|Usage| Element| examples| Comments|
|![Tick](images/tick.png)|`active`|true|Correct format for a an active value|

**Example of Incorrect Usage**

|Usage| Element| examples| Comments|
|![Cross](images/cross.png)|`active`|True|Value is not in title case not the required lowercase|
|![Cross](images/cross.png)||TRUE|Value is in uppercase, not title case.|


On the wire XML example

```xml
<active value="true"/>
```

On the wire example in JSON

```json
{
  "active": { "-value": "true" }
}
```









