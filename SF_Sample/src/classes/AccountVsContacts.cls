public class AccountVsContacts {

    public Opportunity opp{get;set;}
    public  List<Contact> conList{get;set;}  
    
    public AccountVsContacts(ApexPages.StandardController controller) {
        opp = new Opportunity();
        conList = new List<Contact>();
    }
    public void search(){
       conList = [select id,name,firstname,lastname from Contact where AccountId =:opp.Accountid];
    }

}