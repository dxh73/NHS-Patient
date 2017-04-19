---
title: Telecom Element
keywords: id, patient
tags: [profile,element,id]
sidebar: profiles_sidebar
permalink: telecom.html
summary: "low level details for the care connect patient 'telecom' element"
---
## Telecom Implementation Guide ##

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


**UK Numbers**

UK numbers, including land line, fax and mobile numbers **MUST** be stored with a leading 0 followed by the remaining part of the area code and then the subscriber number. A Space between area code and subscriber number **MUST** be included.

**Examples of Correct UK Usage**

|Usage| System| examples| Comments|
|![Tick](images/tick.png)|`phone`|0191 1231234 |UK number with a space between area code and subscriber number|
|![Tick](images/tick.png)||07702 123123|UK mobile number with a space between code and subscriber number|

**Examples of Incorrect UK Usage**

|Usage|System|Examples| Comments|
|-----|------|-----------------|----------------------------------------------------------------------------|
|![Cross](images/cross.png)|`phone`| 01911231234|The area code and subscriber numbers are no separated by a space|
|![Cross](images/cross.png)||(0191)1231234|The area code is enclosed using parentheses|
|![Cross](images/cross.png)||1231234|The area code is missing|
|![Cross](images/cross.png)||+44 0191 1231234|The international code is not required for a UK number|
|![Cross](images/cross.png)||+441911231234|This is difficult to read due to the unnecessary international dialing code in addition to the dropped leading zero and no spacing between the components of the number.|

**International Numbers**

International numbers require a international dialling prefix (IDD) which **MUST** be included in addition to the country code and subscriber number. Spaces between the numbers **MUST NOT** be included. UK numbers **MAY** be stored in an international format.

IDD code **MUST** match the country code associated with it. A full list of IDD codes and the associated country code can be found here:

[IDD and Country Codes](http://www.area-codes.org.uk/international/)

**Examples of Correct International Usage**

|Usage| System| examples| Comments|
|![Tick](images/tick.png)|`phone`|44 191 1231234 |UK number with a international dialling code with spaces between each component of the number|
|![Tick](images/tick.png)||44 7702 123123|UK number with a international dialling code with spaces between each component of the number|

**Examples of Incorrect International Usage**

|Usage| System| examples| Comments|
|![Cross](images/cross.png)|`phone`| +4401911231234|The international dialling code has a + symbol, followed by a leading zero and no spaces to separate each component of the number.|
|![Cross](images/cross.png)|| 44 0191 1231234|The leading zero in the area code is not required.|
|![Cross](images/cross.png)||441911231234|There is no spacing between the components of each element|


**Email Addresses**

An email address **MUST** consist of name and domain parts to form the address. Each part must be separated using the @ symbol.

**Examples of Correct Email Usage**

|Usage| System| examples| Comments|
|![Tick](images/tick.png)|`email`|john.smith@nhs.net |Email with given name and family name separated by a '.' with the name and domain separated by a @ symbol|
|![Tick](images/tick.png)||johnsmith@nhs.net |Email with given and family name combined and domain separated by a @ symbol|

**Examples of Incorrect Email Usage**

|Usage| System| examples| Comments|
|![Cross](images/cross.png)|`email`|john.smith.nhs.net |Email address does not separate name and domain with an @ symbol.|
|![Cross](images/cross.png)||john@smith@nhs.net |Email contains two @ symbols|

**URL**

Skype, Twitter, facebook and other online systems that are expressed as a URL **MAY** be used as a contact method. Note that a Skype number will follow the same format as a UK landline subscriber number and **MUST NOT** be used here. 

**Examples of Correct URL Usage**

|Usage| System| examples| Comments|
|![Tick](images/tick.png)|`url`|@johnsmith|A valid twitter address, beginning with an @ symbol|
|![Tick](images/tick.png)||https://www.facebook.com/john.smith|A valid facebook contact addresss.|
|![Tick](images/tick.png)||skype:johnsmith?call|A valid Skype contact addresss.|


**SMS**

Not to be confused with a mobile number, although *may* use the same number for phone system type. This indicates the contact method must be via a SMS text message.

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













