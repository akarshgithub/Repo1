public class printableViewTestController {
    public List<SObject> accList{get;set;}
    public Account acc{get;set;}
    public String query{get;set;}
    public Set<string> flds;
    public list<string>fieldapiname{get;set;}
    
    public printableViewTestController(){
        acc = new Account();
        fieldapiname=new list<string>();
    }
    
    public PageReference fetch(){
        String SobjectApiName = 'Account';
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Map<String, Schema.SObjectField> fieldMap = schemaMap.get(SobjectApiName).getDescribe().fields.getMap();
 
        String commaSepratedFields = '';
        for(String fieldName : fieldMap.keyset()){
            if(commaSepratedFields == null || commaSepratedFields == ''){
                commaSepratedFields = fieldName;
            }else{
                commaSepratedFields = commaSepratedFields + ', ' + fieldName;
            }
        }
 
        query = 'select ' + commaSepratedFields + ' from ' + SobjectApiName + ' Limit 1';
 
        accList = Database.query(query);
        acc = Database.query(query);
        
         Map<string,Schema.SObjectField> mpConField = Account.getSObjectType().getDescribe().fields.getMap();
       flds=mpConField.keySet();
       for(String name : flds)
        {
            Schema.DescribeFieldResult fldResult=mpConField.get(name).getDescribe();
            if(string.valueof(fldResult.getName())!='Jigsaw' || string.valueof(fldResult.getName())!='JigsawContactId' )
            fieldapiname.add(string.valueof(fldResult.getName()));
        }
 
        return null;
    }
}