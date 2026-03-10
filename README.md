# Installation

## I. Clone the project
git clone https://github.com/blmkd/Case-DT.git

## II. Open the project with VS Code

## III. Authorise your Salesforce org on SFDX

## IV. Deploy the following files in this order

1. object/Contact/HasOptoutOfPhone__c.field-meta.xml  
2. object/Contact/Contactability_status__c.field-meta.xml
3. object/Contact/Normalised_Phone__c.field-meta.xml
4. object/Contact/Normalised_Email__c.field-meta.xml
3. ContactDuplicateController Apex class  
4. ContactDuplicateControllerTest Apex class  
5. getDuplicatedContacts LWC  
6. The Contact layouts  
7. The Contact flexipage (optional since it requires activation)  
8. The Permission Set `Allow_Contact_Contactability_Access`

## V. Assign Permission Set

On your Salesforce org, assign the permission set 'Allow_Contact_Contactability_Access' to your user,  
or add it to a Permission Set Group linked to your user.

---

## Feature preview

<img width="1202" height="242" alt="Screenshot 2026-03-09 at 22 00 38" src="https://github.com/user-attachments/assets/51d8973c-1b7f-4590-a28d-3cd4943e9a20" />
