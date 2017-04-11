---
title: Telecom Element
keywords: id, patient
tags: [profile,element,id]
sidebar: profiles_sidebar
permalink: telecom.html
summary: "low level details for the care connect patient 'telecom' element"
---
## Identifier Implementation Guide ##

### Use case ###

This specification describes a single use case. 

### Element Usage ###

The Telecom element provides a method of contact for a patient. FHIR provides a pre-define set of contact methods and usages. Telecom is not used exclusively for recording a patients telephone number (landline or mobile).

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Primitive| telecom| ContactPoint |A contact method and suitable value for the patient|

- 'telecom' **MAY** be used to capture the patients contact details using a predefine contact type.
- Where `telecom` is used, the telecom.system **MUST** use the HL7 FHIR ContactPointSystem valueset
- Where `telecom` is used, the telecom.use **MUST** use the HL7 FHIR ContactPointUse valueset.
- National and International phone numbers **MUST** be supported.
 

### Telecom Values ###

Telecom element is a string data type, therefore does not enforce any formats. Best practice should be followed when using the telecom element and adhere to the following structures for each system defined in the ContactPointSystem:

**Phone, fax, email and pager**

The E.123 and E.164 standards recommended by the International Telecommunications Union (ITU) provides guidelines for the presentation of telephone numbers and email addresses and [E.164](https://www.itu.int/rec/T-REC-E.164/en) provides the international public telecommunication numbering plan. These standards are presentation standards which **MAY** be followed by implementers, however these are not standards for the storing of telecommunication values.

**Recommended strings**

**UK Land Numbers**

UK land numbers, including fax numbers **MUST** be stored with a leading 0 followed by the remaining part of the area code and then the subscriber number. Spaces between numbers **MUST NOT** be included.

**UK Examples**

01911231234
01133973861

**UK Mobile Numbers**

Mobile numbers *may* include the country code as part of subscriber number, with the leading 0 stripped. Spaces **MUST NOT** be included.

**Mobile Examples**

447702341221
07702123456


**International Numbers**

International numbers require a international dialling prefix (IDD) which **MUST** be included in addition to the country code and subscriber number. Spaces between the numbers **MUST NOT** be included. UK numbers **MAY** be stored in an international format.

IDD code **MUST** match the country code associated with it. A full list of IDD codes and the associated country code can be found here:

[IDD and Country Codes](http://www.area-codes.org.uk/international/)

**International Examples**

00441914021212
00441123973861

**Email Addresses**

An email address **MUST** consist of name and domain parts to form the address. Each part must be separated using the @ symbol.

**Email Examples**

John.Smith@nhs.net
johnsmith@nhs.net

**URL**

Skype, Twitter, facebook and other online systems that are expressed as a URL **MAY** be used as a contact method. Note that a Skype number will follow the same format as a UK landline subscriber number and **MUST NOT** be used here. 

**URL examples**

@johnsmith
@NHSDigital
https://www.facebook.com/john.smith
skype:johnsmith?call
skype:johnsmith?chat

**SMS**

Not to be confused with a mobile number, although *may* use the same number for phone system type. This indicates the contact method must be via a SMS text message.

**SMS examples**

447702341221
07702341221

**other**

This system **MAY** be used when none of the alternative systems are available. It **MUST** not replicate a system that is available within the existing valueset.


On the wire XML example

```xml
<telecom>
	<system value="phone"/>
	<value value="44712345678"/>
	<use value="mobile"/>
</telecom>
<telecom>
	<system value="email"/>
	<value value="john.smith@nhs.net"/>
	<use value="home"/>
</telecom>
```

On the wire example in JSON

```json
{
  "telecom": {
    "system": { "-value": "phone" },
    "value": { "-value": "0712345678" },
    "use": { "-value": "mobile" }
  }
}
{
  "telecom": {
    "system": { "-value": "email" },
    "value": { "-value": "john.smith@nhs.net" },
    "use": { "-value": "home" }
  }
}
```

*Error Handling*

The provider system SHALL return an error if:

- None numeric characters are included in a telecom value
- More than 15 characters are included in a telecom value
- Less than 11 characters are inluced in a telecome value
- Email does not contain an @ symbol within its value.
- URL does not confomrm to the url format for the given url source e.g. Skype address does not begin Skype:
- Other contains a value that could be stored using one of the alternative values found in the ContactPointSystem valueset.












