public without sharing class PrintableViewController {
    
    public String recordId; 
    public String sObjName;
    public Id defaultRecordTypeId;
    
    public sObject record{get;set;}
    public List<String>fieldAPIName{get;set;}
    public Map<String,List<String>> mapRelatedListFields{get;set;}
    public Map<String,List<sObject>> relatedListRecordsMap{get;set;}
    public Map<String,Map<String,String>> mapMapFieldAPILabel{get;set;}
    public List<String> listRelatedListsDisplay{get;set;}
    public Map<String,String> mapRelatedListAPILabel{get;set;}
  
    public PrintableViewController(){
    
        fieldAPIName = new List<String>();
        mapRelatedListFields = new  Map<String, List<String>>();
        mapMapFieldAPILabel = new  Map<String, Map<String, String>>();
        relatedListRecordsMap = new  Map<String, List<sObject>>();
        mapRelatedListAPILabel = new Map<String,String>();
        
        recordId = System.currentPageReference().getParameters().get('id');
        //System.Debug('Testing current page id:' + recordId);
        sObjName = Id.valueOf(recordId).getSObjectType().getDescribe().getName();
        
        List<Schema.RecordTypeInfo> infos = Id.valueOf(recordId).getSObjectType().getDescribe().RecordTypeInfos;

        //check each one
        for (Schema.RecordTypeInfo info : infos) {
          if (info.DefaultRecordTypeMapping) {
            defaultRecordTypeId = info.RecordTypeId;
          }
        }
        
        //here is the default Opportunity RecordType Id for the current user
        System.debug('defaultRecordTypeId===='+defaultRecordTypeId);
        
        
        
    }
    
    public void callPrintView(){ 
        printView();
    }
        
    public HttpResponse printView(){   
        
        Http http = new  Http();
        HttpRequest httpReq = new  HttpRequest();
        HttpResponse httpRes = new  HttpResponse();
        httpReq.setMethod('GET');
        httpReq.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        
        /* -------- calling the DESCRIBE LAYOUT Api --------*/
        httpReq.setEndpoint(System.URL.getSalesforceBaseURL().toExternalForm() + '/services/data/v37.0/sobjects/' + sObjName + '/describe/layouts/'+defaultRecordTypeId+'/');
        httpRes = http.send(httpReq);
        System.debug('httpRes===='+httpRes.getBody());
        
        /* ----------  getting the sObject dynamically ---------- */
        String SobjectApiName = sObjName;
   
        /* ----------  mapping done to parse the json retrieved  ---------- */
        Map<String, object> deseralizedJsonResult = (Map<String, object>)JSON.deserializeUntyped(httpRes.getBody());
        
        String commaSepratedFields = '';
            

        /* ----------  getting the detailLayoutsSection from layout  in the json ---------- */
        list<object> detailLayoutSections = (list<object>)deseralizedJsonResult.get('detailLayoutSections');
       
        for(object allDetailLayoutSections: detailLayoutSections){
        
            Map<String, object> j = (Map<String, object>)allDetailLayoutSections;
            list<object> layoutRows = (list<object>)j.get('layoutRows');
         
            for(object allLayoutRows: layoutRows){
            
                Map<String, object> k = (Map<String, object>)allLayoutRows;
                list<object> layoutItems = (list<object>)k.get('layoutItems');
               
                for(object allLayoutItems: layoutItems){
                
                    Map<String, object> l = (Map<String, object>)allLayoutItems;
                    String label = (String)l.get('label');
                   
                    list<object> layoutComponents = (list<object>)l.get('layoutComponents');
                    
                    for(object allLayoutComponents: layoutComponents){
                    
                        Map<String, object> m = (Map<String, object>)allLayoutComponents;
                        if(((String)m.get('type')) == 'Field'){
                        
                            if(m.containsKey('components')){

                                list<object> componenets = (list<object>)m.get('components');
                         
                                for(object allComponents: componenets){
                                
                                    Map<String, object> n = (Map<String, object>)allComponents;
                                    String value = (String)n.get('value');
                      
                                    if(commaSepratedFields == null || commaSepratedFields == ''){
                                    
                                        commaSepratedFields = value;
                                    }
                                    else{
                                    
                                        commaSepratedFields = commaSepratedFields + ',' + value;
                                    }
                                }
                            }
                            else{
                            
                                /* ----------  getting the layout component values in the json ---------- */
                                String value = (String)m.get('value');
                             
                                if(commaSepratedFields == null || commaSepratedFields == ''){
                                
                                    commaSepratedFields = value;
                                }
                                else{
                                
                                    commaSepratedFields = commaSepratedFields + ',' + value;
                                }
                            }
                        }
                    }
                }
            }
        }
        
        system.debug('the commaSepratedFields values are :-' + commaSepratedFields);
        fieldAPIName = commaSepratedFields.split(',');
        
        // Related List 
        List<object> relatedLists = (List<object>)deseralizedJsonResult.get('relatedLists');
            
        /* Iterating Columns of Related List */
        for(object allRelatedLists: relatedLists){
        
            Map<String, object> j = (Map<String, object>)allRelatedLists;

            /* getting sObject type */
            String relatedList = (String)j.get('name');

            
            String relatedListLabel = (String)j.get('label');
            
            mapRelatedListAPILabel.put(relatedList,relatedListLabel);
                
            List<object> listOfColumns = (List<object>)j.get('columns');


            Map<String,String> mapAPILabel = new  Map<String, String>();
            
            for(object o: listOfColumns){
            
                Map<String, object> mapOfColumns = (Map<String, object>)o;
                String relatedFieldAPI = (String)mapOfColumns.get('name');
              
                
                if(relatedFieldAPI.contains('toLabel')){
                    relatedFieldAPI = relatedFieldAPI.remove('toLabel').remove('(').remove(')');
                }

                if(mapRelatedListFields.containsKey(relatedList)){
                
                    mapRelatedListFields.get(relatedList).add(relatedFieldAPI);
                }
                else{
                
                    mapRelatedListFields.put(relatedList, new  List<String>());
                    mapRelatedListFields.get(relatedList).add(relatedFieldAPI);
                }

                String relatedFieldLabel = (String)mapOfColumns.get('label');      
                mapAPILabel.put(relatedFieldAPI, relatedFieldLabel);
            }
            mapMapFieldAPILabel.put(relatedList, mapAPILabel);
        }
      
        List<String> listRelatedLists = new List<String>();
        
        for(String s: mapRelatedListFields.keySet()){
        
            String relatedFields = String.ValueOf(mapRelatedListFields.get(s)).removeStart('(').removeEnd(')');   
            commaSepratedFields = commaSepratedFields + ', (select  ' + relatedFields + ' from ' + s + ' )';
            listRelatedLists.add(s);
        }
        
        /* -----------  making the query to execute ---------- */
        String query = 'select ' + commaSepratedFields + ' from ' + SobjectApiName + ' Where ID = \'' + String.escapeSingleQuotes(recordId) + '\'';
        record = Database.query(query);
        listRelatedListsDisplay = new List<String>();
        for(String str: listRelatedLists){
        
            //System.debug('record.getSObjects(str)====' + record.getSObjects(str));
            if(record.getSObjects(str) != null){
                
                listRelatedListsDisplay.add(str);
                for(sObject ss: record.getSObjects(str)){
         
                    if(relatedListRecordsMap.containsKey(str)){
                        relatedListRecordsMap.get(str).add(ss);
                    }
                    else{
                        relatedListRecordsMap.put(str, new List<sObject>{ss});
                    }
                }
               
                
            }
        } 
        
        return httpRes;
    }
    
}