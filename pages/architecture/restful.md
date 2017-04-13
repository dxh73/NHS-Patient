---
title: RESTful API 
keywords: RESTful
tags: [RESTful]
sidebar: overview_sidebar
permalink: restful.html
summary: Details about how to use the Care Connect Patient API using the RESTful API architecture.
---

## RESTful Architecture ##

As part of the FHIR RESTful API architecture, Patient elements may be used as parameters for record creation, searching and removal when using a server that provides the FHIR RSTFUL functionality. 

**Create record**

The *create* interaction is performed by an HTTP POST of the CareConnect-Patient-1 resource to the designated FHIR endpoint. A create interaction *may* use elements to capture patient details, including 'nhsNumber' , `name` and `address`. 

Example HTTP POST operation:

```http
POST [base]/Patient
```

A successful POST can return several possible responses to the request:

- HTTP 201-Record Created: The entry has been successfully created and the NRLS returns an HTTP Location header containing the 'server' assigned logical Id of the created resource.
- HTTP 400-Bad Request: Resource could not be parsed or failed basic FHIR validation rules
- HTTP 404-Not Found: Resource type not supported, or not a FHIR end-point
- HTTP 422-Unprocessable Entity: The proposed resource violated applicable FHIR profiles or server business rules.

**Remove Record**

The *conditional delete* interaction is used to remove a CareConnect-Patient-1 record from a FHIR endpoint using the `identifier` element, which may contain an `nhsNumber` or `other` value as the parameter for removal.

```http
DELETE [base]/Patient?identifier=4021341152
```

Assuming successful URL submission, there are two possible outcomes to the delete request:

- HTTP 204-No Content: The record either does not exist or has been successfully deleted.
- HTTP 404-No match to delete: The parameters used to identify the record were not met.

**Search for a record**

The *search* interaction uses the HTTP GET command to return a set of results based on the search criteria submitted. The `identifer` element MAY be used to search for a record on a FHIR endpoint using `nhsNumber`, `other` or both values as search parameters.

```http
GET [base]/Patient?identifier=4021341152
```

Common HTTP Status codes returned on FHIR-related errors (in addition to normal HTTP errors related to security, header and content type negotiation issues):

- 400 Bad Request search could not be processed or failed basic FHIR validation rules
- 401 Not Authorized authorization is required for the interaction that was attempted
- 404 Not Found resource type not supported, or not a FHIR end-point


## Code Examples ##

Examples of C# and Java will be provided in a later version of this API guide.


