public class InsertAccountCtrl {
    
    @AuraEnabled
    public static Account saveAcc(Account a) {
        upsert a;
        return a;
	}
    @AuraEnabled
    public static List<WrapperClass> initList() {
        List<WrapperClass> wcList = new List<WrapperClass>(); 
        List<Account> accList = [Select Name from Account ORDER BY CreatedDate DESC LIMIT 5];
        
        if(accList.size() > 0){
            for(Account acct : accList){
                
                wcList.add(new WrapperClass(acct));
                
            }
        }
         
        return wcList;
    }
    
    @AuraEnabled
    public static List<WrapperClass> showList(String str, Integer n) {
      	
        List<WrapperClass> wcList = new List<WrapperClass>(); 
        List<Account> accList = new List<Account>();
        if(string.isBlank(str)){
            accList = [Select Name from Account ORDER BY CreatedDate DESC LIMIT :n];
        }
        else{
            String s = '%'+str+'%';
            accList = [Select Name from Account where name Like :s ORDER BY CreatedDate DESC LIMIT :n]; 
        }
        if(accList.size() > 0){
            for(Account acct : accList){
                
                wcList.add(new WrapperClass(acct));
                
            }
        }
         
        return wcList;
    }
    
    @AuraEnabled
    public static List<Account> sendEmail(List<Account> accList, String subject, String body) {
        Set<Id> setAccID = new set<ID>();
        List<String> emailList = new List<String>();
        List<Contact> conList = new List<Contact>();
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        
        for(Account a:accList){
            setAccID.add(a.id);   
        }
        
        conList = [Select FirstName,Email from Contact where AccountID in:setAccID Limit 5];
        
        for(Contact c:conList){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
            List<String> sendTo = new List<String>();
            sendTo.add(c.Email);
            mail.setToAddresses(sendTo);
    
            mail.setSenderDisplayName('Test User');
            
            mail.setSubject(subject);
            String mailBody = 'Dear ' + c.FirstName + ',';
            mailBody += body;
            mailBody += 'Thanks';    
            mail.setHtmlBody(mailBody);
            
            mails.add(mail);
            
        }

        Messaging.sendEmail(mails);
        return accList;   
    }

    @AuraEnabled
    public static List<Account> delAcc(List<Account> accList) {
        delete accList;
        return accList;
	}

}