

# Installation 

I. Clone the project

II. Open the Project with VS Code

III. Authorise your Salesforce org on SFDX

IV. Deploy the following files in this order :
    1. object/Contact/HasOptoutOfPhone__c.field-meta.xml
    2. object/Contact/Contactability_status__c.field-meta.xml
    3. ContactDuplicateController Apex class
    4. ContactDuplicateControllerTest Apex class
    5. getDuplicatedContacts LWC
    6. The contact layouts
    7. The Contact flexipage (Optional since it requires to activate it)
    8. The Permission Set Allow_Contact_Contactability_Access

V. On your Salesforce org, assign the permission set to your user OR add it to the Permission Set Group of your choice that is linked to your user.# Case-DT
