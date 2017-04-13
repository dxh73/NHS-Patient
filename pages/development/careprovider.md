---
title: Care Provider Element
keywords: care, provider
tags: [care]
sidebar: profiles_sidebar
permalink: care_provider.html
summary: "low level details for the care connect patient 'id' element"
---
{% include important.html content="The identifier element described is  used to provide a unique method to identify a NHS patient. It is not the identifier for the FHIR message" %}

### Use case ###

This specification describes a single use case. 

### Care Provider ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Reference| careProvider| Reference | A reference to another profile within the API|


### Element Usage ###

careProvider creates a reference to two existing Care Connect profiles; CareConnect-Organization-1 and CareConnect-Practitioner-1.

This profile **MUST** only use one of these profiles, which captures details about the patients organization, such as GP Practice or the patients practitioner, such as a consultant.

Element is a reference only and does not contain any organization or practitioner information.

The reference value **MUST** follow a format of "Resource/UUID" where the UUID is the profile.id value used by the referenced profile, usually found within a bundle. The display value is optional, but recommended.

```xml
<careProvider>
		<reference value="Organization/f9f24f89-646b-4a19-a6b1-cabfa3b612e1"/>
		<display value="MGP Medical Centre"/>
</careProvider>

Organization XML would have the following :
<id value="f9f24f89-646b-4a19-a6b1-cabfa3b612e1"/>
```

On the wire example in JSON

```json
{
  "careProvider": {
    "reference": { "-value": "Organization/f9f24f89-646b-4a19-a6b1-cabfa3b612e1" },
    "display": { "-value": "MGP Medical Centre" }
  }
}

Organization XML would have the following :

{
  "id": { "-value": "f9f24f89-646b-4a19-a6b1-cabfa3b612e1" }
}
```

*Error Handling*

The provider system SHALL return an error if:







