public class ShowContactListCtrl {
    
    @AuraEnabled
    public static List<Contact> getContactList(){
        return [SELECT ID,Name,Phone FROM Contact Limit 50];  
    }

}