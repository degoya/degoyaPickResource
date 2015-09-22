# MODX Extra: degoyaPickResource #

Version: 1.1.0rc1

Released: 2015-09-22

Based on: PickResource (http://modx.com/extras/package/pickresource2) by Mike Barton <mike@mjb123.uk> 

Author: Alexander Herling / DEGOYA medienkommunikation oHG <a.herling@degoya.de>

License: GNU GPLv2 (or later at your option)


## About ##

A resource selection custom template variable field type for MODX Revolution (2.3+).
Use as an alternative to the 'Resource List'  TV field type, especially useful for large websites with lots of internal links.
WARNING - Only use degoyaPickResource when creating a new TV, if you replace an existing TV with a field type of 'Resource List' then you will need to reset all the links that have been defined with that TV.


## Features ##

This MODX Revolution custom TV displays a text field (readonly) with the selected resource 'Name (id)' together with options to either 'Delete' or 'Choose' a resource.
Use 'Delete' to clear any previously selected resource.
Use 'Choose' to open a pop-up dialog which lists the site resources (matching defined criteria) in a treelist for selection.
The treelist nodes expand on demand and list sub-resources (subject to any defined exclusions).


## Installation ##

Install via MODX Package Management.
Following installation, simply create a new TV with the input type & output type set to degoyaPickResource. Define any required input options / filters and then use in any resource template or part of a MIGX TV.


## Input Options ##

The following input options could be set in template variable settings.

Default Value - The default value this TV will have if none is specified. e.g. Home (1). The default value must be the resource 'Name (Id)'.

Root - the ID of the root element

Exclude Ids - A comma seperated list of IDs to exclude from treelist.

Templates - A comma seperated list of Template-IDs

Expanded - Select yes to expand all folders as default

Root Visible - select if root element is visible or not

Only Published - select to show only published resources

Limit to Context - Limit resources to context (if selected define roots for all context)

Context Root - enter element roots for all contexts in the format: web==1||de==2


## Output Options ##

If you use the included output format then just the resource id is returned rather than resource 'Name (Id)'.
