---
title: NHS Communication Complex Extension
keywords: communication, extension
tags: [communication]
sidebar: profiles_sidebar
permalink: nhs_comms.html
summary: "low level details for the care connect patient 'nhsCommunication' extension"
---
### Use case ###

This specification describes a single use case. 

### NHS Communication Details ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Complex Extension|nhsCommunication| complex extension|NHS Communication extension |
|Simple Extension|language|CodeableConcept|Languages which may be used for communication|
|Simple Extension|preferred|boolean|Language preference indicator|
|Simple Extension|modeOfCommunication|CodeableConcept|Mode of communucation for the selected language| 
|Simple Extension|communicationProficiency|CodeableConcept|A extension to describe the level of proficiency in communicating a language.| 
|Simple Extension|interpreterRequired|boolean|Patients current registration status e.g Active| 

### Extension Usage ###

This complex extension consists of 3 simple extensions to capture patient registration information. 

**language**

The language in which the patient wishes to communicate. Only one language can be used captured here.

The extension has a url `language`

The codes are available from the pre-defined valueset [ CareConnect-HumanLanguage-1](http://www.interopen.org/candidate-profiles/care-connect/CareConnect-HumanLanguage-1.valueset.html).

The valueset *may* have a coding.system but **MUST** have a value of http://www.interopen.org/candidate-profiles/care-connect/CareConnect-HumanLanguage-1.valueset.html when used.

The coding.code value *may* be used but **must** be a code in the valueset and have a max of 2 character s when in use. A null value is not permitted. 

The code for English is `en` and relates to any English speaking language such as American.

The coding.display *may* be used but **must** have a value that matches the coding.code when used.


**preferred**

Extension uses a boolean value of true or false to indicate if this is the preferred language of the patient. 

The extension has a url `preferred`

**modeOfCommunication**

Extension uses codeableConcept CareConnect-LanguageAbilityMode-1 to capture the mode of communication the patient has requested. 

The codes are available from the pre-defined valueset [CareConnect-LanguageAbilityMode-1](http://www.interopen.org/candidate-profiles/care-connect/CareConnect-LanguageAbilityMode-1.valueset.html).

|Code|	Display|
|ESGN|Expressed signed
|ESP|Expressed spoken
|EWR|Expressed written
|RSGN|Received signed
|RSP|Received spoken
|RWR|Received written

The valueset *may* have a coding.system but **MUST** have a value of http://www.interopen.org/candidate-profiles/care-connect/CareConnect-LanguageAbilityMode-1.valueset.html when used.

The coding.code value *may* be used but **must** be a code in the valueset and have a max of 1 character when in use. A null value is not permitted.

The coding.display *may* be used but **must** have a value that matches the coding.code when used.

The extension has a url `modeOfCommunication`

**communicationProficiency**

Extension uses codeableConcept CareConnect-LanguageAbilityMode-1 to capture the mode of communication the patient has requested. 

The codes are available from the pre-defined valueset [CareConnect-LanguageAbilityProficiency-1](http://hl7.org.uk/CareConnect-LanguageAbilityProficiency-1.valueset.xml).

|Code|Display	|
|E	|Excellent	|
|F|	Fair|	
|G|	Good|	
|P|	Poor|

The valueset *may* have a coding.system but **MUST** have a value of http://hl7.org.uk/CareConnect-LanguageAbilityProficiency-1.valueset.xml when used.

The coding.code value *may* be used but **must** be a code in the valueset and have a max of 1 character when in use. A null value is not permitted.

The coding.display *may* be used but **must** have a value that matches the coding.code when used.

The extension has a url `communicationProficiency`

**interpreterRequired**


Extension uses a boolean value of true or false to indicate if an interpreter is required for the patient. 

The extension has a url `interpreterRequired`

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




