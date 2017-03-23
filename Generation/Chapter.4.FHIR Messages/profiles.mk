// chapter 6

select profileintro.*.md >> markdown >> stash $intro
select profile.*.xml >> profiletable >> template $intro profileintro.$2 >> template $template >> save profile.$2.html

select structureintro.*.md >> markdown >> stash $intro
select profile.*.xml >> structure >> template $intro structureintro.$2 >> template $template >> save

select profile.*.xml >> dict >> template $template >> save

select valuesetintro.*.md >> markdown >> stash $intro
select valueset.*.xml >> valueset >> template $intro valuesetintro.$2 >> template $template >> save