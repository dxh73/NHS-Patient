---
title: Link Element
keywords: id, patient
tags: [link]
sidebar: profiles_sidebar
permalink: link.html
summary: "low level details for the care connect patient 'link' element"
---

### Use case ###

This specification describes a single use case. .

### Link ###

|Type|name|Data Type|Description|
| ------------- | ------------- | ------------- | ------------- |
|Element| link| BackboneElement | Provides a link to another patient record and the type of record being referenced. |

### Element Usage ###

`link` element provides the ability to link the patient record to another patient record for the same patient. For example a patient may have a historic record that could be linked to from the current record.

`link` is a backbone element. When used it **must** use `other` reference element which **must** reference CareConnect-Patient-1.

The reference value **MUST** follow a format of "Resource/UUID" where the UUID is the profile.id value used by the referenced profile, usually found within a bundle. 

The `type` element **must** have a code from the [LinkType](http://hl7.org/fhir/ValueSet/link-type) valueset. 

{% include important.html content="Required Binding" %}
The language in which the patient wishes to communicate. Only one language can be used captured here.

On the wire XML example

```xml
<link>
	<other>
		<reference value="Patient/f9f24f89-646b-4a19-a6b1-cabfa3b612e1"/>
	</other>
	<type value="refer"/>
</link>
```

```json
{
  "link": {
    "other": {
      "reference": { "-value": "Patient/f9f24f89-646b-4a19-a6b1-cabfa3b612e1" }
    },
    "type": { "-value": "refer" }
  }
}
```

*Error Handling*

The provider system SHALL return an error if:

- The reference is not CareConnect-Patient-1
- The reference UUID does not match the UUID in the referenced patient resource
- The `type` element is not one of replaced-by, replaces, refer or seealso. 

