@isTest
public with sharing class ContactDuplicateControllerTest {
    
    @isTest
    static void getDuplicateContactsTest() {
        List<Contact> contacts = new List<Contact>();
        contacts.add(new Contact(FirstName = 'Test1', LastName = 'Contact', Email = 'test@test.com', Phone = '0987654321'));
        contacts.add(new Contact(FirstName = 'Test2', LastName = 'Contact', Email = 'test2@test.com', Phone = '1234567890'));
        contacts.add(new Contact(FirstName = 'Test3', LastName = 'Contact', Email = 'test3@test.com', Phone = '0987654321'));
        contacts.add(new Contact(FirstName = 'Test4', LastName = 'Contact'));
        insert contacts;
        Test.startTest();
        List<Contact> duplicateContacts = ContactDuplicateController.getDuplicateContacts(contacts[0].Id);
        Test.stopTest();
        System.assertEquals(1, duplicateContacts.size());
        System.assertEquals(contacts[2].Id, duplicateContacts[0].Id);
    }

    @isTest
    static void getNormalisedPhoneTest() {
        System.assertEquals('0987654321', ContactDuplicateController.getNormalisedPhone('098-765-4321'));
        System.assertEquals('2697654321', ContactDuplicateController.getNormalisedPhone('+(269)7654321'));
        System.assertEquals(null, ContactDuplicateController.getNormalisedPhone(null));
    }

    @isTest
    static void getNormalisedEmailTest() {
        System.assertEquals('test@test.com', ContactDuplicateController.getNormalisedEmail('test@test.com'));
        System.assertEquals('test@test.com', ContactDuplicateController.getNormalisedEmail('TEST@TEST.COM'));
        System.assertEquals(null, ContactDuplicateController.getNormalisedEmail(null));
    }
}