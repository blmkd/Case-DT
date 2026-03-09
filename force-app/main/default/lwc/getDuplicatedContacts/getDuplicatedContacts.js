import { LightningElement, api, wire, track } from 'lwc';
import getDuplicateContactsFromController from '@salesforce/apex/ContactDuplicateController.getDuplicateContacts';

export default class GetDuplicatedContacts extends LightningElement {

    @api recordId;
    @track duplicateContacts = [];
    @track error = null;
    @track showTable = false;
    @track cardTitle = 'Duplicate Contacts';

    @wire(getDuplicateContactsFromController, { recordId: '$recordId' })
    wiredContacts({ error, data }) {
        if (data) {
            this.duplicateContacts = data.map(contact => {
                return {
                    ...contact,
                    contactUrl: '/' + contact.Id 
                };
            });
            if (this.duplicateContacts.length > 0) {
                this.showTable = true;
                this.cardTitle = this.cardTitle + ' (' + this.duplicateContacts.length + ')';
            }
        } else if (error) {
            this.error = error;
            console.log("Error", JSON.stringify(error));
        }
    }

    columns = [
        {
            label: 'Name',
            fieldName: 'contactUrl',
            type: 'url',
            typeAttributes: {
                label: { fieldName: 'Name' },
                target: '_blank'
            }
        },
        { label: 'Email', fieldName: 'Email' },
        { label: 'Phone', fieldName: 'Phone' }
    ];
}