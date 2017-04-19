---
title: birthDate Element
keywords: id, patient
tags: [profile,element,id]
sidebar: profiles_sidebar
permalink: birth_date.html
summary: "low level details for the care connect patient 'birthDate' element"
---

## Birth Date Implementation Guide ##

### Use case ###

This specification describes a single use case. 

### Element Usage ###

birthDate is used to capture a patients known date of birth. The format DD-MM-CCCC **MUST** be used.. Where a full date of birth is not known, the format *shall* include a locally agreed day and month, typically 1st January, to construct a complete date.

### birthDate ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Primitive| birthDate| date | Patients registered date of birth |


- 'birthDate' **MUST** be used. 
- A time value is not required as part of the date of birth
- Timezone should not be used as part of the date of birth.
- The date value must be valid e.g only 30th September but not 31st September

**Example of Correct Usage**

|Usage| Element| examples| Comments|
|![Tick](images/tick.png)|`birthDate`| 1957-01-01|Correct format for a date of birth|

**Example of Incorrect Usage**

|Usage| Element| examples| Comments|
|![Cross](images/cross.png)||1973-04|A missing day is not permitted and may cause clinical safety issues in addition to data quality.|
|![Cross](images/cross.png)||1997|A missing day and month is permitted and may cause clinical safety issues in addition to data quality.|

On the wire XML example

```xml
<birthDate value="1957-01-01"/>
```

On the wire example in JSON

```json
{
  "birthDate": { "-value": "1957-01-01" }
}
```

*Error Handling*

The provider system SHALL return an error if:

- The `birthDate` value does not comply with the aforementioned format.
- The `birthDate` value is omitted.
- The `birthDate` value is an invalid date.






