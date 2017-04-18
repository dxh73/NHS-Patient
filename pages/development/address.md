---
title: Address Element
keywords: id, patient
tags: [address,postcode]
sidebar: profiles_sidebar
permalink: address.html
summary: "low level details for the care connect patient 'address' element"
---
## Address Implementation Guide ##

{% include warning.html content="These baselines were approved by the ISB but the concept of a baseline is not included in the SCCI Development Framework. The information about each baseline is current at 31 December 2014 but should be checked for accuracy prior to reliance on this information." %}

### Use case ###

This specification describes a single use case. 

The address element is used to capture the patients demographic information. 

### Address ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Data Type| address| address | Parent element for an address. Additional child elements are used to form the full address. |

### Element Usage ###

Where `address` and any of the child elements are used, an addressing standard **must** be followed to promote data quality, enable consistency between applications and increase patient safety.

`address` element is able to support both structured and unstructured address formats.

**Structured Address**

A structured address consists of:

|Address Component|address child element|length|Comments|
|Line 1|line|50|PAF allows building name of up to 50 characters therefore `line` must support this max|
|Line 2|line|50|As above|
|Line 3|line|50|As above|
|Town|city|30|Required as part of all UK addresses|
|County|district|18|The longest UK county name is 18 chars|
|Country|country|3|Recommend a ISO 3166 3 letter code|
|Postcode|postalCode|PAF supports 7. Some clinical systems use space therefore 8 is permitted|

{% include important.html content="County is no longer used by the Post Office and is not part of the Post Office Address file (PAF). There is no requirement to use this" %}

|Usage| Element| examples| Comments|
|![Tick](images/tick.png)|`line`| Floor 9|Identify location in a building |
|![Tick](images/tick.png)|`line`| Durham House|Building name in title case|
|![Tick](images/tick.png)|`city`| Washington|Town in title case|
|![Tick](images/tick.png)|`postalcode`|NE38 7SF| Post code, uppercase with space|

Examples of Incorrect Usage

|Usage| Element| examples| Comments|
|![Cross](images/cross.png)|`line`|Floor 9, Durham House|Partially unstructured. Should split this onto different lines|
|![Cross](images/cross.png)|`city`||Missing the town. This should be present.|
|![Cross](images/cross.png)|`postalcode`|ne387sf|Not in uppercase and has no spacing between outward code and inward code|

**Unstructured Address**

It is not recommended to use an unstructured address due to the risk to data quality. This is due to unstructured addresses not being validated because an unstructured address does not have its address components segregated, for example, the town.

**Post Code**

Where the postalCode element is used, it must conform to the following conventions:

Post code format **MUST** be one of:

- AN NAA
- ANN NAA
- AAN NAA
- AANN NAA
- ANA NAA
- AANA NAA

where A is an alphabetic character and N is a numeric character.

As part of this convention the following rules apply:

- The letters Q, V and X are not used in the fist position
- The letters I, J and Z are not used in the second position.
- The only letters to appear in the third position are A,B,C,D,E,F,G,H,J,K,S,T,U and W.
- The second half of the post code is always consistent numeric, alpha, alpha format and the letters C, I,K,M,O and V are never used.
- Post code should be in block capitals and a space **MUST** be between the two parts of the code.

**Country Code**

It is recommended to implement the ISO 3166 country codes into a structured address.

A full list of codes can be found here [ISO 3166](https://www.iso.org/obp/ui/#search/code/)

When used with a UK address the code **MUST** be GBR.

On the wire XML example

```xml
<address>
	<use value="home"/>
	<line value="21"/>
	<line value="Grove Street"/>
	<city value="Overtown"/>
	<district value="Leeds"/>
	<postalCode value="LS21 1PF"/>
</address>
```

On the wire example in JSON

```json
{
  "address": {
    "use": { "-value": "home" },
    "line": { "-value": "21" },
	"line": { "-value": "Grove Street" },
    "city": { "-value": "Overtown" },
    "district": { "-value": "Leeds" },
    "postalCode": { "-value": "LS21 1PF" }
  }
}
```

*Error Handling*

The provider system SHALL return an error if:

- Post code does not match PAF file







