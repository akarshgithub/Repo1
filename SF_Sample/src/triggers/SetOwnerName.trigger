trigger SetOwnerName on Contact (after insert, after update) {
    Set<id> accids = new Set<id>();
    map<id,id> mp = new map<id,id>();
    List<Contact> contactforupdate = new List<Contact>();
    if (!RecursiveTriggerHelper.isAlreadyModified()) {
        //setting already run value to true
        RecursiveTriggerHelper.setAlreadyModified();
    
    for(Contact c:Trigger.new)
    {
        accids.add(c.accountid); 
    }
    system.debug('-----------'+accids);
    List<Account> acc = new List<Account>();
    acc = [select id,name,ownerid from Account where id in: accids];
     for(Account a:acc){
        mp.put(a.id,a.ownerid);
        system.debug('------------'+mp);
    }
    
  
    List<Contact> con = new List<Contact>();
   con = [select id,name,ownerid,accountid from Contact where id in: trigger.newMap.keyset()];
    for(Contact c:con)
    {
        c.ownerid = mp.get(c.accountid);
        contactforupdate.add(c);
        system.debug('&&&&&&&&&&&&&&&&&&&&&&&&'+contactforupdate);
    }
    if(contactforupdate != null && contactforupdate.size()>0)
        update contactforupdate;
        
     }
}