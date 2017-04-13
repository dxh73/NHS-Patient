---
title: Address Element
keywords: id, patient
tags: [address,postcode]
sidebar: profiles_sidebar
permalink: address.html
summary: "low level details for the care connect patient 'address' element"
---
## Identifier Implementation Guide ##

### Use case ###

This specification describes a single use case. 

The address element is used to capture the patients demographic information. 

### Address ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Data Type| address| address | Parent element for an address. Additional child elements are used to form the full address. |

### Element Usage ###

**Post Code**

Where the postalCode element is used, it must conform to the following conventions:

POst code format **MUST** be one of:

AN NAA
ANN NAA
AAN NAA
AANN NAA
ANA NAA
AANA NAA

where A is an alphabetic character and N is a numeric character.

As part of this convention the following rules apply:

- The letters Q, V and X are not used in the fist position
- The letters I, J and Z are not used in the second position.
- The only letters to appear in the third position are A,B,C,D,E,F,G,H,J,K,S,T,U and W.
- The second half of the post code is always consistent numeric, alpha, alpha format and the letters C, I,K,M,O and V are never used.
- Post code should be in block capitals and a space **MUST** be between the two parts of the code.
 
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
<address>
	<use value="home"/>
	<line value="21, Grove Street"/>
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
    "line": { "-value": "21, Grove Street" },
    "city": { "-value": "Overtown" },
    "district": { "-value": "Leeds" },
    "postalCode": { "-value": "LS21 1PF" }
  }
}
```

*Error Handling*

The provider system SHALL return an error if:

error here!!

## RESTful Usage ##


Examples






