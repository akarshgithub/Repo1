public class POC_PrintableViewController {

    
   public sObject recDetail{get;set;}
   public String query{get;set;}
   public String resString{get;set;}
   public String commaSepratedFields{get;set;}
   public list<string>fieldapiname{get;set;}

    public POC_PrintableViewController() {
    
       string obj = System.currentPageReference().getParameters().get('id');
       System.Debug('Testing current page id:' + obj);

       String sObjName = Id.valueOf(obj).getSObjectType().getDescribe().getName();
       
       Http http = new Http();
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();
        httpReq.setMethod('GET');
        httpReq.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId()); 
        httpReq.setEndpoint(System.URL.getSalesforceBaseURL().toExternalForm()+ '/services/data/v37.0/sobjects/' + sObjName + '/describe/layouts/');
        httpRes = http.send(httpReq);
        System.debug('Body==='+httpRes.getBody());
    
       
       String SobjectApiName = sObjName;
       Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
       Map<String, Schema.SObjectField> fieldMap = schemaMap.get(SobjectApiName).getDescribe().fields.getMap();

       commaSepratedFields = '';
       fieldapiname=new list<string>();
       for(String fieldName : fieldMap.keyset()){
           if(commaSepratedFields == null || commaSepratedFields == ''){
               commaSepratedFields = fieldName;
           }else{
               commaSepratedFields = commaSepratedFields + ', ' + fieldName;
           }
           fieldapiname.add(fieldName);
       }

       
       query = 'select ' + commaSepratedFields + ' from ' + SobjectApiName + ' Where ID = \''+ String.escapeSingleQuotes(obj)+'\'';   
       System.debug(query);

       recDetail = Database.query(query);

    }

  
}