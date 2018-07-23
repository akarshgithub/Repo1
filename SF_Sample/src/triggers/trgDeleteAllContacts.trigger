trigger trgDeleteAllContacts on Account (before update) {
    
    set<string> ids = new set<string>();
    List<Contact> contactsToDelete = new List<Contact>();
    
    for(Account a:trigger.new){
        ids.add(a.id);
    }
    
    system.debug('------'+ids);
    contactsToDelete = [select id,name from contact where Accountid in: ids];
    
    system.debug('------contactsToDelete'+contactsToDelete);
    
    if(contactsToDelete.size()>0 )
        delete contactsToDelete; 
    
}