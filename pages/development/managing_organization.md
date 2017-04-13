---
title: Managing Organization Element
keywords: organization, provider
tags: [organization]
sidebar: profiles_sidebar
permalink: managing_organization.html
summary: "low level details for the care connect patient 'managingOrganization' element"
---
### Use case ###

This specification describes a single use case. 

### Care Provider ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
| Reference| managingOrganiation| Reference | A reference to another profile within the API|


### Element Usage ###

`ManagingOrganization` creates a reference to CareConnect-Organization-1, an existing profile used within Care Connect.

This is the only profile that can be referenced and captures details about the patients organization, such as GP Practice.

Element is a reference only and does not contain any organization.

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







