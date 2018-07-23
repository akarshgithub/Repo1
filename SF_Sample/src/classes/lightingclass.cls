public class lightingclass {
   
   @AuraEnabled
   public static List<Task> ettasks(string getvalue) {
       list<Task> ts=new  list<Task>();
       if(getvalue=='Today'){
       ts=[SELECT Id,Status FROM Task where createdDate=today];
       }
       if(getvalue=='yesterday'){
       ts=[SELECT Id,Status FROM Task where createdDate!=today];
       }
        if(getvalue=='All'){
       ts=[SELECT Id,Status FROM Task ];
       }
       Return ts;
        
   }
    
}