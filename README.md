# Case-DT

A Salesforce project to display contact duplicates on contact records.

# Installation

## I. Clone the project

```bash
git clone https://github.com/blmkd/Case-DT.git
```

## II. Open the project with VS Code

## III. Authorise your Salesforce org on SFDX

## IV. Deploy the following files in this order

1. object/Contact/HasOptoutOfPhone__c.field-meta.xml
2. object/Contact/Contactability_status__c.field-meta.xml
3. object/Contact/Normalised_Phone__c.field-meta.xml
4. object/Contact/Normalised_Email__c.field-meta.xml
5. ContactDuplicateController Apex class
6. ContactDuplicateControllerTest Apex class
7. getDuplicatedContacts LWC
8. The Contact layouts
9. The Contact flexipage (optional since it requires activation)
10. The Permission Set Allow_Contact_Contactability_Access

You can use the following SFDX command to automate the deployment:

Make sure SFDX is up to date. Run the following command to update it:
```bash
sf update
```

```bash
sf project deploy start \
--source-dir force-app/main/default/objects/Contact/fields/HasOptedOutOfPhone__c.field-meta.xml \
--source-dir force-app/main/default/objects/Contact/fields/Contactability_status__c.field-meta.xml \
--source-dir force-app/main/default/objects/Contact/fields/Normalised_Phone__c.field-meta.xml \
--source-dir force-app/main/default/objects/Contact/fields/Normalised_Email__c.field-meta.xml \
--source-dir force-app/main/default/classes/ContactDuplicateController.cls \
--source-dir force-app/main/default/classes/ContactDuplicateController.cls-meta.xml \
--source-dir force-app/main/default/classes/ContactDuplicateControllerTest.cls \
--source-dir force-app/main/default/classes/ContactDuplicateControllerTest.cls-meta.xml \
--source-dir force-app/main/default/lwc/getDuplicatedContacts \
--source-dir "force-app/main/default/layouts/Contact-Contact Layout.layout-meta.xml" \
--source-dir "force-app/main/default/layouts/Contact-Contact %28Support%29 Layout.layout-meta.xml" \
--source-dir "force-app/main/default/layouts/Contact-Contact %28Sales%29 Layout.layout-meta.xml" \
--source-dir "force-app/main/default/layouts/Contact-Contact %28Marketing%29 Layout.layout-meta.xml" \
--source-dir force-app/main/default/permissionsets/Allow_Contact_Contactability_Access.permissionset-meta.xml
```

## V. Assign Permission Set

On your Salesforce org, assign the permission set 'Allow_Contact_Contactability_Access' to your user,
or add it to a Permission Set Group linked to your user.

## Feature preview

<img width="1202" height="242" alt="Screenshot 2026-03-09 at 22 00 38" src="https://github.com/user-attachments/assets/51d8973c-1b7f-4590-a28d-3cd4943e9a20" />
