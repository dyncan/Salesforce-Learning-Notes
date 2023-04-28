sfdx force:data:soql:query -q "SELECT Id FROM ApexLog" -r "csv" > outApexLog.csv
sfdx force:data:bulk:delete -s ApexLog -f outApexLog.csv
rm outApexLog.csv