---
title: Implementers guide to Care Connect Patient Profile within Data Diagnostic Services
keywords: homepage
tags: [fhir patient]
sidebar: overview_sidebar
permalink: index.html
toc: true
summary: An introduction to Care Connect and the use of Patient Profile.
---

{% include important.html content="This site is under active development by the interoperability messaging team and is intended to provide all the technical resources you need to successfully deploy a Care Connect Profile. Some areas are being formulated and iterative updates to content will be added on a regular basis." %}

{% include warning.html content="This site is provided for information only and is intended for those engaged with NHS Digital in First of Type activities, other parties are advised not to develop against these specifications until a formal announcement has been made." %}

# Using this site #

The aim of this web site is to provide DDS implementers the knowledge they require in order to successfully implement a care connect patient profile into a FHIR based solution that may be used within their organization.

Our goal is to provide user friendly documentation that can be used to fully understand how to correctly use a care connect patient profile, identifying which elements are required with DDS, how to populate these, how (and how not) to use these and supply examples for reference purposes.

# Data Diagnostic Services Overview#

The National Information Board (NIB)'s roadmap published in September 2015 Work_Stream_2.1_Final.pdf cited the National Laboratory Medicine Catalogue (NLMC) as one of the highest priority national information standards to complete and use within the next 1-3 years. The NLMC is thus planned to replace the current primary care pathology data standard, the Pathology Bounded Code List (PBCL). PBCL is a subset within the Read V2 terminology, and Read V2 is being nationally withdrawn in 2017. The NLMC will also address current gap areas in PBCL, including setting data standards for use across all care settings, for all pathology disciplines (e.g. including microbiology, histopathology, cytology, genetics and blood transfusion), for reporting, and including fully-approved standard units of measure per quantitative test. The NLMC is currently planned to adopt international technical standards wherever fit for purpose, including SNOMED CT, LOINC and UCUM.

The move to adopting the NLMC as a single set of pathology data standards for use across all care settings, addressing current content gaps and standardising pathology data across care settings requires the current national primary care pathology report message (profiled in EDIFACT) to be replaced to facilitate this change.
Example external link to [Google](http://www.google.com).
