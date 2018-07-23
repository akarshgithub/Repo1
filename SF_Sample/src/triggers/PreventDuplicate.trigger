trigger PreventDuplicate on Contact (before insert, before update) {
    
    if(Trigger.isUpdate){
        
        for(contact c: Trigger.new){
            System.debug('newValue===');
     //       System.debug('oldValue==='+trigger.oldMap.get(c.Id).LastName);
     //       System.debug('newValue==='+c.LastName);
            
        }
        
    } 
    
    /* 
Set<String> emails = new Set<String>();
for(Contact c: trigger.new){
emails.add(c.email); 
}
system.debug('emails++' +emails);

list<Contact> conlist = [Select id,name,email from contact where email=:emails];
system.debug('conlist++' +conlist);

Set<String> presentEmails = new Set<String>();
for(contact c: conlist){
presentEmails.add(c.email);
}


for(contact c: Trigger.new){
if(c.email!=null) { 
if(presentEmails.contains(c.email)) {

c.addError('Record already exist with same Email');
}
}


}
*/
}