#!/bin/bash

myAlias=$1

for row in $(sfdx force:data:soql:query -q "SELECT Id FROM TraceFlag" --usetoolingapi --resultformat "json" | jq -r '.result.records | .[].Id' ) 
    do  
        echo sfdx force:data:record:delete --sobjecttype TraceFlag --sobjectid ${row} --targetusername ${myAlias}
        sfdx force:data:record:delete --usetoolingapi --sobjecttype TraceFlag --sobjectid ${row} --targetusername ${myAlias}
    done