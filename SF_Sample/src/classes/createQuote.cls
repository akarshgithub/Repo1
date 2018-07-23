global class createQuote{
    webservice static string createRecord(string s){
    
        CQuote__c c = new Cquote__c();
        c.Opportunity__c = s;
        
        insert c;
        System.debug('CQuote==='+c);
        
        List<OpportunityLineItem> listOL = [Select Name from OpportunityLineItem where OpportunityID =:s];
        
        if(listOL.size()>0){
            List<CQuoteLineItem__c> listQLCreate = new List<CQuoteLineItem__c>();
            for(OpportunityLineItem o:listOL){
                CQuoteLineItem__c cql = new CQuoteLineItem__c();
                cql.CQuote__c = c.id;
                cql.Name = o.name;
                
                listQLCreate.add(cql);
                
            }
            
            System.debug('listQLCreate==='+listQLCreate);
            insert listQLCreate;
            
        }
        
        return c.id;
    }
  
}