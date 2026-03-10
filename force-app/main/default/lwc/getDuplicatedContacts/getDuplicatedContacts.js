import { LightningElement, api, wire, track } from 'lwc';
import getDuplicateContactsFromController from '@salesforce/apex/ContactDuplicateController.getDuplicateContacts';

const PAGE_SIZE = 5;

export default class GetDuplicatedContacts extends LightningElement {

    @api recordId;
    @track duplicateContacts = [];
    @track error = null;
    @track showTable = false;
    @track cardTitle = 'Duplicate Contacts';
    @track currentPage = 1;

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

    get pageSize() {
        return PAGE_SIZE;
    }

    get totalRecords() {
        return this.duplicateContacts.length;
    }

    get totalPages() {
        return Math.ceil(this.totalRecords / this.pageSize) || 1;
    }

    get paginatedContacts() {
        const start = (this.currentPage - 1) * this.pageSize;
        return this.duplicateContacts.slice(start, start + this.pageSize);
    }

    get isFirstPage() {
        return this.currentPage <= 1;
    }

    get isLastPage() {
        return this.currentPage >= this.totalPages;
    }

    get pageInfo() {
        const start = (this.currentPage - 1) * this.pageSize + 1;
        const end = Math.min(this.currentPage * this.pageSize, this.totalRecords);
        return `${start}-${end} of ${this.totalRecords}`;
    }

    @wire(getDuplicateContactsFromController, { recordId: '$recordId' })
    wiredContacts({ error, data }) {
        if (data) {
            this.duplicateContacts = data.map(contact => {
                return {
                    ...contact,
                    contactUrl: '/' + contact.Id 
                };
            });
            this.currentPage = 1;
            if (this.duplicateContacts.length > 0) {
                this.showTable = true;
                this.cardTitle = 'Duplicate Contacts (' + this.duplicateContacts.length + ')';
            }
        } else if (error) {
            this.error = error;
            console.log("Error", JSON.stringify(error));
        }
    }

    handlePrevious() {
        if (!this.isFirstPage) {
            this.currentPage -= 1;
        }
    }

    handleNext() {
        if (!this.isLastPage) {
            this.currentPage += 1;
        }
    }

}