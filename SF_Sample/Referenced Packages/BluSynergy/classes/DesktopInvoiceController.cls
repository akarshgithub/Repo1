/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DesktopInvoiceController {
    global Account acc {
        get;
        set;
    }
    global String appendedUrlForDefault {
        get;
        set;
    }
    global String appendedUrlForUserType {
        get;
        set;
    }
    global Contact con {
        get;
        set;
    }
    global blusyn__Blusynergy__c conf {
        get;
        set;
    }
    global String currentUserAccountType {
        get;
        set;
    }
    global String fullName {
        get;
        set;
    }
    global String idOfInv {
        get;
        set;
    }
    global blusyn__Invoice__c inv {
        get;
        set;
    }
    global List<blusyn__Invoice__c> invList {
        get;
        set;
    }
    global List<blusyn__Invoice_Line_Item__c> InvoiceList {
        get;
        set;
    }
    global List<blusyn__InvoicePayment__c> ipList {
        get;
        set;
    }
    global String l1s {
        get;
        set;
    }
    global String l2s {
        get;
        set;
    }
    global Set<Decimal> level1 {
        get;
        set;
    }
    global String level1f1 {
        get;
        set;
    }
    global String level1f10 {
        get;
        set;
    }
    global String level1f11 {
        get;
        set;
    }
    global String level1f12 {
        get;
        set;
    }
    global String level1f13 {
        get;
        set;
    }
    global String level1f14 {
        get;
        set;
    }
    global String level1f15 {
        get;
        set;
    }
    global String level1f2 {
        get;
        set;
    }
    global String level1f3 {
        get;
        set;
    }
    global String level1f4 {
        get;
        set;
    }
    global String level1f5 {
        get;
        set;
    }
    global String level1f6 {
        get;
        set;
    }
    global String level1f7 {
        get;
        set;
    }
    global String level1f8 {
        get;
        set;
    }
    global String level1f9 {
        get;
        set;
    }
    global String level1h1 {
        get;
        set;
    }
    global String level1h2 {
        get;
        set;
    }
    global String level1h3 {
        get;
        set;
    }
    global String level1h4 {
        get;
        set;
    }
    global String level1h5 {
        get;
        set;
    }
    global String level1h6 {
        get;
        set;
    }
    global String level1h7 {
        get;
        set;
    }
    global Set<Decimal> level2 {
        get;
        set;
    }
    global String level2f1 {
        get;
        set;
    }
    global String level2f10 {
        get;
        set;
    }
    global String level2f11 {
        get;
        set;
    }
    global String level2f12 {
        get;
        set;
    }
    global String level2f13 {
        get;
        set;
    }
    global String level2f14 {
        get;
        set;
    }
    global String level2f15 {
        get;
        set;
    }
    global String level2f2 {
        get;
        set;
    }
    global String level2f3 {
        get;
        set;
    }
    global String level2f4 {
        get;
        set;
    }
    global String level2f5 {
        get;
        set;
    }
    global String level2f6 {
        get;
        set;
    }
    global String level2f7 {
        get;
        set;
    }
    global String level2f8 {
        get;
        set;
    }
    global String level2f9 {
        get;
        set;
    }
    global String level2h1 {
        get;
        set;
    }
    global String level2h10 {
        get;
        set;
    }
    global String level2h11 {
        get;
        set;
    }
    global String level2h12 {
        get;
        set;
    }
    global String level2h13 {
        get;
        set;
    }
    global String level2h14 {
        get;
        set;
    }
    global String level2h15 {
        get;
        set;
    }
    global String level2h2 {
        get;
        set;
    }
    global String level2h3 {
        get;
        set;
    }
    global String level2h4 {
        get;
        set;
    }
    global String level2h5 {
        get;
        set;
    }
    global String level2h6 {
        get;
        set;
    }
    global String level2h7 {
        get;
        set;
    }
    global String level2h8 {
        get;
        set;
    }
    global String level2h9 {
        get;
        set;
    }
    global String level3f1 {
        get;
        set;
    }
    global String level3f2 {
        get;
        set;
    }
    global String level3f3 {
        get;
        set;
    }
    global String level3f4 {
        get;
        set;
    }
    global String level3f5 {
        get;
        set;
    }
    global String level3f6 {
        get;
        set;
    }
    global String level3f7 {
        get;
        set;
    }
    global String level3h1 {
        get;
        set;
    }
    global String level3h2 {
        get;
        set;
    }
    global String level3h3 {
        get;
        set;
    }
    global String level3h4 {
        get;
        set;
    }
    global String level3h5 {
        get;
        set;
    }
    global String level3h6 {
        get;
        set;
    }
    global String level3h7 {
        get;
        set;
    }
    global List<blusyn__Invoice_Line_Item__c> lineItemLevel1 {
        get;
        set;
    }
    global Map<blusyn__Invoice_Line_Item__c,Map<blusyn__Invoice_Line_Item__c,List<blusyn__Invoice_Line_Item__c>>> lineItemMap {
        get;
        set;
    }
    global Integer outStandingCount {
        get;
        set;
    }
    global Map<Decimal,List<blusyn__Invoice_Line_Item__c>> ParentPositionAndListMap;
    global Map<Decimal,List<blusyn__Invoice_Line_Item__c>> positionAndChildMap1 {
        get;
        set;
    }
    global Map<Decimal,List<blusyn__Invoice_Line_Item__c>> positionAndChildMap2 {
        get;
        set;
    }
    global List<List<List<List<blusyn__Invoice_Line_Item__c>>>> showList {
        get;
        set;
    }
    global List<blusyn.DesktopInvoiceController.InvLIWrp> wrpList {
        get;
        set;
    }
    global DesktopInvoiceController() {

    }
    global DesktopInvoiceController(ApexPages.StandardController controller) {

    }
    global System.PageReference back() {
        return null;
    }
global class InvLIWrp {
    global blusyn__Invoice_Line_Item__c ili {
        get;
        set;
    }
    global String tab {
        get;
        set;
    }
    global InvLIWrp(String t, blusyn__Invoice_Line_Item__c li) {

    }
}
}
