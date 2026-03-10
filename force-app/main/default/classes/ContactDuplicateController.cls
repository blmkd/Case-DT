public with sharing class ContactDuplicateController {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getDuplicateContacts(Id recordId) {
        Contact contact = [SELECT Id, Normalised_Email__c, Normalised_Phone__c FROM Contact WHERE Id = :recordId WITH SECURITY_ENFORCED];
        List<Contact> contacts = new List<Contact>();
        if (contact.Normalised_Email__c != null && contact.Normalised_Phone__c != null) {
            contacts = [SELECT Id, Email, Phone, Name FROM Contact WHERE (Normalised_Email__c != null OR Normalised_Phone__c != null) AND (Normalised_Email__c = :contact.Normalised_Email__c OR Normalised_Phone__c = :contact.Normalised_Phone__c) AND Id != :recordId WITH SECURITY_ENFORCED ORDER BY CreatedDate DESC];
        }
        return contacts;
    }

}