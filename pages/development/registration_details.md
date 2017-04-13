---
title: Registration Details Complex Extension
keywords: registration, extension
tags: [profile,element,id]
sidebar: profiles_sidebar
permalink: registration_details.html
summary: "low level details for the care connect patient 'registrationDetails' extension"
---
### Use case ###

This specification describes a single use case. 

### Registration Details ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Complex Extension|registrationDetails| complex extension|
|Simple Extension|registrationPeriod|Period|The time period in which the registration applies|
|Simple Extension|registrationType|CodeableConcept|Code to define the registration type e.g Emergency|
|Simple Extension|registrationStatus|CodeableConcept|Patients current registration status e.g Active| 


### Extension Usage ###

This complex extension consists of 3 simple extensions to capture patient registration information. 

**registrationPeriod**

The period of time that the registration occurred is captured using a dateTime format. When used, this extension **MUST** include either a start and/or end period. The extension has a url `registrationPeriod`

- Date **MUST** be used and in format DD-MM-CCC
- Time *may* be used and in a 24 hour format and includes seconds. 24:00 is not valid. Timezone is optional.


**registrationType**

Extension uses codeableConcept CareConnect-RegistrationType-1 to capture the type of registration the patient has. The extension has a url `registrationType`

The codes are available from the pre-defined valueset [ CareConnect-RegistrationType-1](http://www.interopen.org/candidate-profiles/care-connect/CareConnect-RegistrationType-1.valueset.html).

|Code|Display|
|R|Regular|
|E|Emergency|
|IN|Immediately necessary|	
|T|Temporary|
|P|Private|
|O|Other|
|S|Synthetic Record	|

The valueset *may* have a coding.system but **MUST** have a value of http://www.interopen.org/candidate-profiles/care-connect/CareConnect-RegistrationType-1.valueset.html when used.

The coding.code value *may* be used but **must** be a code in the valueset and have a max of 1 character when in use. A null value is not permitted.

The coding.display *may* be used but **must** have a value that matches the coding.code when used.


**registrationStatus**


Extension uses codeableConcept CareConnect-RegistrationStatus-1 to capture the type of registration the patient has. The extension has a url `registrationStatus`

The codes are available from the pre-defined valueset [ CareConnect-RegistrationStatus-1](http://www.interopen.org/candidate-profiles/care-connect/CareConnect-RegistrationStatus-1.valueset.html).


|Code|Display|	
|A|	Active	|
|D|	Deduction Pending	|
|I|	Inactive	|
|R|	Registration Pending|

The valueset *may* have a coding.system but **MUST** have a value of http://www.interopen.org/candidate-profiles/care-connect/CareConnect-RegistrationStatus-1.valueset.html when used.

The coding.code value *may* be used but **must** be a code in the valueset and have a max of 1 character when in use. A null value is not permitted.

The coding.display *may* be used but **must** have a value that matches the coding.code when used.

```xml
  <extension url="http://hl7.org.uk/CareConnect-RegistrationDetails-1-Extension.xml" >
    <extension url="registrationPeriod" >
      <valuePeriod>
        <start value="2012-01-05" />
        <end value="2012-01-05" />
      </valuePeriod>
    </extension>
    <extension url="registrationType" >
      <valueCodeableConcept>
		   <coding>
			   <system value="http://hl7.org.uk/CareConnect-RegistrationType-1.xml"/>
			   <code value="R"/>
			   <display value="Regular"/>
		   </coding>
      </valueCodeableConcept>
    </extension>
  <extension url="registrationStatus" >
      <valueCodeableConcept>
		   <coding>
			   <system value="http://hl7.org.uk/CareConnect-RegistrationStatus-1.xml"/>
			   <code value="A"/>
			   <display value="Active"/>
		   </coding>
      </valueCodeableConcept>
    </extension>
  </extension>	
```

On the wire example in JSON

```json
{
  "extension": {
    "-url": "http://hl7.org.uk/CareConnect-RegistrationDetails-1-Extension.xml",
    "extension": [
      {
        "-url": "registrationPeriod",
        "valuePeriod": {
          "start": { "-value": "2012-01-05" },
          "end": { "-value": "2012-01-05" }
        }
      },
      {
        "-url": "registrationType",
        "valueCodeableConcept": {
          "coding": {
            "system": { "-value": "http://hl7.org.uk/CareConnect-RegistrationType-1.xml" },
            "code": { "-value": "R" },
            "display": { "-value": "Regular" }
          }
        }
      },
      {
        "-url": "registrationStatus",
        "valueCodeableConcept": {
          "coding": {
            "system": { "-value": "http://hl7.org.uk/CareConnect-RegistrationStatus-1.xml" },
            "code": { "-value": "A" },
            "display": { "-value": "Active" }
          }
        }
      }
    ]
  }
}
```

*Error Handling*

The provider system SHALL return an error if:

- The `registrationPeriod` does not have a valid start date
- The `registrationPeriod` does not have a valid end date
- The `registrationType` extension does not have a value that represents a valid code in the CareConnect-RegistrationType-1 valueset
- The `registrationStatus` extension does not have a value that represents a valid code in the CareConnect-RegistrationStatus-1 valueset




