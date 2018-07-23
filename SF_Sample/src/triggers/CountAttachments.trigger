//Trigger to Count the Number of Attachments on the Test Object

trigger CountAttachments on Attachment (after insert, after update, after delete, after undelete) {
  Map<Id,List<Attachment>> parent = new Map<Id,List<Attachment>>();
  set<id> attids = new set<id>();
     
   if(Trigger.new<>null){
       for(Attachment c:Trigger.new){
           Test__c t;
           if(c.ParentId != null)
               attids.add(c.parentid);
       }
           
   }else if(Trigger.old != null){
       for(Attachment c:Trigger.old){
           if(c.ParentId<>null)      
               attids.add(Trigger.oldMap.get(c.id).parentid);
       }
   }
   if(attids.size()>0){
       try{
           List<Attachment> a = new List<Attachment>();
           Map<id,Test__c> testmap = new Map<id,Test__c>([select id,CountAttachment__c from Test__c where id IN: attids]);
           a = [select id,parentid from Attachment where parentid IN:attids];
           
           for(Attachment at: a){
               List<Attachment> tlist = new List<Attachment>();
               if(parent.get(at.parentid) == null){
                   tlist = new List<Attachment>();
                   tlist.add(at);
                   parent.put(at.parentid,tlist);
               } else if(parent.get(at.parentid) != null){
                   tlist = new List<Attachment>();
                   tlist = parent.get(at.parentid);
                   tlist.add(at);
                   parent.put(at.parentid,tlist);
               }
           }
           
           for(Id i: attids){
               if(testmap.get(i) != null && parent.get(i) != null){
                  testmap.get(i).CountAttachment__c = parent.get(i).size(); 
               
               }else if(testmap.get(i) != null && parent.get(i) == null){
                  testmap.get(i).CountAttachment__c = 0; 
               }
           }
       
           update testmap.values();
           System.Debug(testmap.values());
       }catch(Exception e){}
    }
}