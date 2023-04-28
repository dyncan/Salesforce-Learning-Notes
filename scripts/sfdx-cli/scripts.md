1. Get sObject Fields to be use in query format

   ```bash
      # example for Account
      sfdx sobject describe --sobject Account | jq --raw-output '.fields|map(.name)|join(",")'
   ```

2. Export SetupAuditTrail to CSV
   
   ```bash
      sfdx data query --query "SELECT Id,Action,Section,CreatedDate,CreatedBy.Name,Display FROM SetupAuditTrail ORDER BY CreatedDate DESC" --resultformat csv > _SetupAuditTrail.csv
   ```

3. Mass Delete all ApexLog
   
   ```bash
      ./scripts/sh/deleteApexLog.sh

      -----
      sfdx force:data:soql:query -q "SELECT Id FROM ApexLog" -r "csv" > outApexLog.csv
      sfdx force:data:bulk:delete -s ApexLog -f outApexLog.csv
      rm outApexLog.csv
   ```

4. Switch LWC DebugMode in one click

   ```java
      sfdx force apex execute --file scripts/apex/switchDebugMode.apex

      ---
      Boolean current = [SELECT UserPreferencesUserDebugModePref FROM USER WHERE Id =: UserInfo.getUserId() ].UserPreferencesUserDebugModePref ; 
      update new User(Id = UserInfo.getUserId(), UserPreferencesUserDebugModePref= !current);
   ```