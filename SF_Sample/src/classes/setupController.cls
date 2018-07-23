public class setupController {

    public Id Accid;
    public List<Contact> Conlist{get; set;}
    public List<contactwrapper> ConlistW{get; set;}
    
    public setupController(ApexPages.StandardController controller) {
        Accid=ApexPages.currentPage().getParameters().get('Accid');
        contact temp = (contact)controller.getRecord();
        temp.Accountid= Accid;
    }
    
    public void getConlist(){
        Conlist = new list<contact>();
        ConlistW = new list<contactwrapper>();
        Conlist = [select id,lastname from contact where accountId =: Accid];
        if(Conlist  != null && Conlist.size()>0){
            for(contact Con: Conlist){
                ConlistW.add(new contactwrapper(Con));
            }
        }
    }
    
    public class contactwrapper{
        public boolean isselected{get; set;}
        public contact con{get; set;}
        public contactwrapper(Contact C){
            con=c;
            isselected =false;
        }
    }
}