public with sharing class DragNDropSNoCtrl {

    public Account acc{get;set;}
    public List<Contact> conList{get;set;}

    public DragNDropSNoCtrl(ApexPages.StandardController stdController) {
        
        this.acc = (Account)stdController.getRecord();
        conList = [Select id,Name,OrderNo__c,serial_no__c from Contact where AccountID =:acc.id];

    }

}