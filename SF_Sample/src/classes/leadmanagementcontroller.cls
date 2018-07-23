public with sharing class leadmanagementcontroller {
    
     @AuraEnabled
        public static list<leadmanagementwraperclass> selectleadrecord(){
            list<Lead> ldd=new  list<Lead>(); 
                if (Schema.sObjectType.Lead.isQueryable() && Schema.sObjectType.Lead.fields.id.isaccessible() && Schema.sObjectType.Lead.fields.Name.isaccessible() && Schema.sObjectType.Lead.fields.Email.isaccessible() && Schema.sObjectType.Lead.fields.phone.isaccessible() && Schema.sObjectType.Lead.fields.company.isaccessible() && Schema.sObjectType.Lead.fields.status.isaccessible() && Schema.sObjectType.Lead.fields.IsConverted.isaccessible() ){ 
                ldd=[SELECT id,Name,Email,phone,company,status FROM Lead WHERE IsConverted=false limit 10];
                }
            list<leadmanagementwraperclass> wrppvar= new list<leadmanagementwraperclass>();
                for(Lead l:ldd){
                    wrppvar.add(new leadmanagementwraperclass(l)) ;   
                }
            return wrppvar;
       }
    
     @AuraEnabled
        public static list<leadmanagementwraperclass> previouscont(integer limitSize){
        integer offset1=integer.valueOf(limitSize);
        list<Lead> lddprev=new  list<Lead>(); 
                if (Schema.sObjectType.Lead.isQueryable() && Schema.sObjectType.Lead.fields.id.isaccessible() && Schema.sObjectType.Lead.fields.Name.isaccessible() && Schema.sObjectType.Lead.fields.Email.isaccessible() && Schema.sObjectType.Lead.fields.phone.isaccessible() && Schema.sObjectType.Lead.fields.company.isaccessible() && Schema.sObjectType.Lead.fields.status.isaccessible() && Schema.sObjectType.Lead.fields.IsConverted.isaccessible() ){ 
                lddprev=[SELECT id,Name,Email,phone,company,status FROM Lead WHERE IsConverted=false limit 10 offset:offset1];
                }
            list<leadmanagementwraperclass> wrppvarprev= new list<leadmanagementwraperclass>();
                for(Lead lnext:lddprev){  wrppvarprev.add(new leadmanagementwraperclass(lnext)) ;   
                }
            return wrppvarprev;
        }
    
    @AuraEnabled
       public static list<leadmanagementwraperclass> nextcont(integer offsetSize1){
       integer offset2=integer.ValueOf(offsetSize1);
       list<Lead> lddnext=new  list<Lead>(); 
                if (Schema.sObjectType.Lead.isQueryable() && Schema.sObjectType.Lead.fields.id.isaccessible() && Schema.sObjectType.Lead.fields.Name.isaccessible() && Schema.sObjectType.Lead.fields.Email.isaccessible() && Schema.sObjectType.Lead.fields.phone.isaccessible() && Schema.sObjectType.Lead.fields.company.isaccessible() && Schema.sObjectType.Lead.fields.status.isaccessible() && Schema.sObjectType.Lead.fields.IsConverted.isaccessible() ){ 
                lddnext=[SELECT id,Name,Email,phone,company,status FROM Lead WHERE IsConverted=false limit 10 offset:offset2];
                }
            list<leadmanagementwraperclass> wrppvarnext= new list<leadmanagementwraperclass>();
                for(Lead lnext:lddnext){ wrppvarnext.add(new leadmanagementwraperclass(lnext)) ;   
                    
                }
            return wrppvarnext;
       }
    
        
      @AuraEnabled
         public static Lead leaddetaidonclickk(String listleadid){
             Lead lidetails=new Lead();
             if (Schema.sObjectType.Lead.isQueryable() && Schema.sObjectType.Lead.fields.id.isaccessible() && Schema.sObjectType.Lead.fields.Name.isaccessible() && Schema.sObjectType.Lead.fields.Email.isaccessible() && Schema.sObjectType.Lead.fields.phone.isaccessible() && Schema.sObjectType.Lead.fields.company.isaccessible() && Schema.sObjectType.Lead.fields.status.isaccessible() && Schema.sObjectType.Lead.fields.Title.isaccessible() && Schema.sObjectType.Lead.fields.LeadSource.isaccessible() && Schema.sObjectType.Lead.fields.Industry.isaccessible() && Schema.sObjectType.Lead.fields.AnnualRevenue.isaccessible() && Schema.sObjectType.Lead.fields.Country.isaccessible() && Schema.sObjectType.Lead.fields.CreatedDate.isaccessible() && Schema.sObjectType.Lead.fields.MobilePhone.isaccessible() && Schema.sObjectType.Lead.fields.Website.isaccessible() && Schema.sObjectType.Lead.fields.Rating.isaccessible() && Schema.sObjectType.Lead.fields.NumberOfEmployees.isaccessible() && Schema.sObjectType.Lead.fields.LastModifiedDate.isaccessible() && Schema.sObjectType.Lead.fields.ownerid.isaccessible() && listleadid !=null && listleadid !='')
             {
             lidetails=[SELECT id, Name, Email, phone, company, status, Title, LeadSource, Industry, AnnualRevenue, Country, CreatedDate, MobilePhone, Website, Rating, NumberOfEmployees, LastModifiedDate, owner.name, ownerid FROM Lead where id=:listleadid];
             }
             return lidetails;
        }
        
   
      @AuraEnabled
         public static Task histaskdetilscontroller(String taskhistyidd){
             
             Task taskdtls=new Task();
              if(Schema.sObjectType.Task.isQueryable() && Schema.sObjectType.Task.fields.id.isaccessible() && Schema.sObjectType.Task.fields.subject.isaccessible() && Schema.sObjectType.Task.fields.ActivityDate.isaccessible() && Schema.sObjectType.Task.fields.Priority.isaccessible() && Schema.sObjectType.Task.fields.Status.isaccessible() && Schema.sObjectType.Lead.fields.Name.isaccessible() && Schema.sObjectType.Task.fields.ownerid.isaccessible() && taskhistyidd !=null && taskhistyidd !='')
              {
                taskdtls=[SELECT id, subject, owner.name, Who.name, ActivityDate, Priority, Status FROM Task where id=:taskhistyidd];
              }
            
             return taskdtls;
        }
        
     
      @AuraEnabled
         public static Event hiseventtdetilscontroller(String eventhistyidd){
             
             Event evevtiddtls=new Event();
              if(Schema.sObjectType.Event.isQueryable() && Schema.sObjectType.Event.fields.id.isaccessible() && Schema.sObjectType.Event.fields.subject.isaccessible() && Schema.sObjectType.Event.fields.ActivityDate.isaccessible() && Schema.sObjectType.Event.fields.StartDateTime.isaccessible() && Schema.sObjectType.Event.fields.EndDateTime.isaccessible() && Schema.sObjectType.Lead.fields.Name.isaccessible() && Schema.sObjectType.Event.fields.ownerid.isaccessible() && eventhistyidd !=null && eventhistyidd !='')
              {
               evevtiddtls=[SELECT id, subject, Who.name, owner.name, StartDateTime, EndDateTime, ActivityDate FROM Event where id=:eventhistyidd];
              }
            return evevtiddtls;
            
        }
        
        
      @AuraEnabled
         public static void tosendmail(list<Lead> truelead,string sub, string bod){
            list<Lead_history__c > leadhistry=new list<Lead_history__c >();
         for(Lead d:truelead){
           string ldEmail = d.Email;
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {ldEmail};
            mail.setToAddresses(toAddresses);
            mail.setReplyTo('support@acme.com');
            mail.setSubject(sub);
            mail.setBccSender(false);
            mail.setUseSignature(false);
            mail.setPlainTextBody( bod);
            Messaging.SendEmailResult[] resultMail = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail }); 
                        
            Lead_history__c lidhistry=new Lead_history__c ();
            lidhistry.Name =d.Name;
            lidhistry.Email__c =d.Email;
            lidhistry.Phone__c =d.Phone;            
            leadhistry.add(lidhistry);            
                        
                }
             
            if(Schema.sObjectType.Lead_history__c.isAccessible() && Schema.sObjectType.Lead_history__c.fields.Name.isCreateable() && Schema.sObjectType.Lead_history__c.fields.Email__c.isCreateable() && Schema.sObjectType.Lead_history__c.fields.Phone__c.isCreateable()){ 
               insert leadhistry;
             }
            
         }  
        
        
        
        @AuraEnabled
            public static void deleteleadrecord(list<Lead> trueleaddel){
             if (Schema.sObjectType.Lead.isAccessible() && Schema.sObjectType.Lead.isDeletable() && Lead.sObjectType.getDescribe().isDeletable()){
              delete trueleaddel;
             }    
            }
    
        
        @AuraEnabled
        public static list<Lead_history__c> history(){
            list<Lead_history__c> ldhstory=new  list<Lead_history__c>(); 
            if(Schema.sObjectType.Lead_history__c.isQueryable() && Schema.sObjectType.Lead_history__c.fields.Name.isaccessible() && Schema.sObjectType.Lead_history__c.fields.Email__c.isaccessible() && Schema.sObjectType.Lead_history__c.fields.Phone__c.isaccessible() ){
                ldhstory=[SELECT Name, Email__c, Phone__c FROM Lead_history__c Limit 10];
            }
            return ldhstory;
            
        }
        
        
        
        @AuraEnabled
        public static list<Event> getacivty(String activtyid){
            
             list<Event> eventacivty=new  list<Event>(); 
            if(Schema.sObjectType.Event.isQueryable() && Schema.sObjectType.Event.fields.id.isaccessible() && Schema.sObjectType.Event.fields.Subject.isaccessible() && Schema.sObjectType.Event.fields.StartDateTime.isaccessible() && Schema.sObjectType.Event.fields.EndDateTime.isaccessible() && activtyid !=null && activtyid !='') {
            eventacivty=[SELECT id, Subject, StartDateTime, EndDateTime FROM Event WHERE WhoId =: activtyid AND StartDateTime > TODAY];
            
             }
           return eventacivty; 
            
        }
        
        
         @AuraEnabled
        public static list<Task> getaskrecord(String activtyid){
            
            list<Task> taskred=new  list<Task>(); 
            if(Schema.sObjectType.Task.isQueryable() && Schema.sObjectType.Task.fields.id.isaccessible() && Schema.sObjectType.Task.fields.Subject.isaccessible() && Schema.sObjectType.Lead.fields.Name.isaccessible() && activtyid !=null && activtyid !=''){
            taskred=[SELECT id, Subject, Who.name FROM Task WHERE WhoId =: activtyid AND Status !='completed'];
            }
           return taskred; 
            
        }
        
         @AuraEnabled
        public static list<Event> eventhistryy(String activtyid){
            
            list<Event> eventhistry=new  list<Event>(); 
            if(Schema.sObjectType.Event.isQueryable() && Schema.sObjectType.Event.fields.id.isaccessible() && Schema.sObjectType.Event.fields.Subject.isaccessible() && Schema.sObjectType.Event.fields.StartDateTime.isaccessible() && Schema.sObjectType.Event.fields.EndDateTime.isaccessible() && activtyid !=null && activtyid !=''){
            eventhistry=[SELECT id, Subject, StartDateTime, EndDateTime FROM Event WHERE WhoId =: activtyid AND StartDateTime <= TODAy];
            }
           return eventhistry; 
            
        }
        
        @AuraEnabled
        public static list<Task> taskhistryy(String activtyid){
           
            list<Task> tashistry=new  list<Task>(); 
            if(Schema.sObjectType.Task.isQueryable() && Schema.sObjectType.Task.fields.id.isaccessible() && Schema.sObjectType.Task.fields.Subject.isaccessible() && Schema.sObjectType.Lead.fields.Name.isaccessible() && Schema.sObjectType.Task.fields.Status.isaccessible() && activtyid !=null && activtyid !=''){
            tashistry=[SELECT id, Subject, Who.name FROM Task WHERE WhoId =: activtyid AND Status ='completed'];
            }
           return tashistry; 
            
        }
        
        
         @AuraEnabled
        public static list<Lead_history__c> searchemailhistory(string searchhist){
            list<Lead_history__c> ldhstoryy=new  list<Lead_history__c>();
            if(Schema.sObjectType.Lead_history__c.isQueryable() && Schema.sObjectType.Lead_history__c.fields.Name.isaccessible() && Schema.sObjectType.Lead_history__c.fields.Email__c.isaccessible() && Schema.sObjectType.Lead_history__c.fields.Phone__c.isaccessible() ){
            ldhstoryy=[SELECT Name, Email__c , Phone__c FROM Lead_history__c WHERE Name LIKE :searchhist+'%'];
            }
            return ldhstoryy;
            
        }
       
    
         @AuraEnabled
        public static list<leadmanagementwraperclass> searchldrececord(string searchrecrd){
            list<lead> ldd=new  list<lead>();
             if (Schema.sObjectType.Lead.isQueryable() && Schema.sObjectType.Lead.fields.id.isaccessible() && Schema.sObjectType.Lead.fields.Name.isaccessible() && Schema.sObjectType.Lead.fields.Email.isaccessible() && Schema.sObjectType.Lead.fields.phone.isaccessible() && Schema.sObjectType.Lead.fields.company.isaccessible() && Schema.sObjectType.Lead.fields.status.isaccessible() && Schema.sObjectType.Lead.fields.IsConverted.isaccessible() ){
            ldd=[SELECT id,Name,Email,phone,company,status FROM Lead WHERE Name LIKE :searchrecrd+'%' AND IsConverted=false limit 10];
            }
            list<leadmanagementwraperclass> wrppvar= new list<leadmanagementwraperclass>();
            for(lead l:ldd){
                wrppvar.add(new leadmanagementwraperclass(l)) ;   
            }
            return wrppvar;
            
        }
        
         @AuraEnabled
        public static list<leadconversonnn> recordleadconvrson(list<Lead> truelead3){
            
            list<leadconversonnn> wrppvarr= new list<leadconversonnn>();
            for(Lead l:truelead3){ wrppvarr.add(new leadconversonnn(l)) ;   
                
            }
            return wrppvarr;
            
        }
        
         
        @AuraEnabled
        public static void convertleadToOpportunity(list<lead> leadlist, list<lead> leadlistt){ 
            
        for(lead k : leadlist){
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(k.id);
        
        lc.setDoNotCreateOpportunity(True);
        
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
         
        lc.setConvertedStatus(convertStatus.MasterLabel);
         
        Database.LeadConvertResult lcr = Database.convertLead(lc);
      
       }    
            
            
          for(lead kk: leadlistt){
        
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(kk.id);
        lc.setopportunityname(kk.Company);
        
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
         
        lc.setConvertedStatus(convertStatus.MasterLabel);
        
       Database.LeadConvertResult lcr = Database.convertLead(lc);
      
       }       
        }
        
}