public class displyafielddyanmaicallybyquery{

    public list<string>fieldapiname{get;set;}
    public contact con{get;set;}
    public contact cc;
    public Set<string> flds;
    
    public displyafielddyanmaicallybyquery(ApexPages.StandardController controller) {
        
        this.cc = (Contact)controller.getRecord();
        
        flds=new set<string>();
        fieldapiname=new list<string>();
        con=[Select FirstName, LastName, isDeleted,MasterRecordId,AccountId,Salutation from Contact where id =: cc.id];
        
        Map<string,Schema.SObjectField> mpConField=Contact.getSObjectType().getDescribe().fields.getMap();
        flds=mpConField.keySet();
        
        for(String name : flds){
            Schema.DescribeFieldResult fldResult=mpConField.get(name).getDescribe();
            if(string.valueof(fldResult.getName())!='Jigsaw' || string.valueof(fldResult.getName())!='JigsawContactId' )
            fieldapiname.add(string.valueof(fldResult.getName()));
        }

    }
   
}