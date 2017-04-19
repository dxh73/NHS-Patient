---
title: Contact Element
keywords: contact, relationship, name, telecom
tags: [conact]
sidebar: profiles_sidebar
permalink: contact.html
summary: "low level details for the care connect patient 'id' element"
---
{% include important.html content="The identifier element described is  used to provide a unique method to identify a NHS patient. It is not the identifier for the FHIR message" %}

## Contact Implementation Guide ##

### Use case ###

This specification describes a single use case. 

### Element Usage ###

The `contact` element is a backbone for additional elements that may contain their own child elements. Contact is used to capture the details for a patients preferred contact such as wife, husband or a friend. 

### Contact ###

|Name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| contact| BackboneElement |Contact is an element that contains additional elements already included in the profile e.g address|
|Elements|
|relationship|CodeableConcept|The relationship the person has to the patient|
|name|HumanName|The contacts name|
|telecom|ContactPoint|A contact method and details for the person|
|address|Address|An address for the contact person|
|gender|code|Contacts gender|
|organization|Reference|If the contact is an organization, a reference to that organization. The details will be captured in a different profile.|


### Valuesets ##

`contact` data types uses two INTEROpen valuesets. These are:

[CareConnect-PersonRelationshipType-1](http://www.interopen.org/candidate-profiles/care-connect/CareConnect-PersonRelationshipType-1.valueset.html)

The `relationship` data type uses this valueset to describe the relationship between the person and the patient. This is a required valueset and one of the codes **must** be used when this element is populated.
The valueset contains a set of 51 codes with a related display and definition. 

CareConnect-AdministrativeGender-1

This valueset is the same as that used by Patient.gender. See this element for more details.


- If contact is used then as a minimum the `name` element **must** be populated. The same guidelines apply to this element as that used by `Patient.Name` element.
- Where the contact is an organization, the `name` element **must** contain a contact at that organization. 


On the wire XML example

```xml
<contact>
	<relationship>
		<coding>
			<system value="http://hl7.org.uk/fhir/ValueSet/CareConnect-PersonRelationshipType"/>
			<code value="01"/>
			<display value="Spouse"/>
		</coding>
	</relationship>
	<name>
		<use value="usual"/>
		<family value="Smith"/>
		<given value="Joy"/>
		<prefix value="Mrs"/>
	</name>
	<telecom>
		<system value="phone"/>
		<value value="0712345678"/>
		<use value="mobile"/>
	</telecom>
	<telecom>
		<system value="email"/>
		<value value="mrssmith@mymail.com"/>
	</telecom>
	<gender value="female"/>
</contact>
```

On the wire example in JSON

```json
{
  "contact": {
    "relationship": {
      "coding": {
        "system": { "-value": "http://hl7.org.uk/fhir/ValueSet/CareConnect-PersonRelationshipType" },
        "code": { "-value": "01" },
        "display": { "-value": "Spouse" }
      }
    },
    "name": {
      "use": { "-value": "usual" },
      "family": { "-value": "Smith" },
      "given": { "-value": "Joy" },
      "prefix": { "-value": "Mrs" }
    },
    "telecom": [
      {
        "system": { "-value": "phone" },
        "value": { "-value": "0712345678" },
        "use": { "-value": "mobile" }
      },
      {
        "system": { "-value": "email" },
        "value": { "-value": "mrssmith@mymail.com" }
      }
    ],
    "gender": { "-value": "female" }
  }
}
```

*Error Handling*

The provider system SHALL return an error if:

TODO - Further thoughts need on this. Look at bus acks ??







