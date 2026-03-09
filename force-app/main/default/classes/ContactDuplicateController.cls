public with sharing class ContactDuplicateController {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getDuplicateContacts(Id recordId) {
        Contact contact = [SELECT Id, Email, Phone FROM Contact WHERE Id = :recordId WITH SECURITY_ENFORCED];
        List<Contact> contacts = new List<Contact>();
        if (contact.Email != null && contact.Phone != null) {
            contacts = [SELECT Id, Email, Phone, Name FROM Contact WHERE (Email != null OR Phone != null) AND (Email = :contact.Email OR Phone = :contact.Phone) AND Id != :recordId WITH SECURITY_ENFORCED ORDER BY CreatedDate DESC  LIMIT 5];
        }
        return contacts;
    }

    public static String getNormalisedPhone(String phone) {
        if (phone == null) {
            return null;
        } else {
            phone = phone.replaceAll('[^0-9]', '');
            return phone;
        }
    }

    public static String getNormalisedEmail(String email) {
        if (email == null) {
            return null;
        }
        email = email.toLowerCase();
        return email;
    }

}