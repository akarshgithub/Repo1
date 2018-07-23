//writter by sakshi on 2nd jan
trigger CountContact on Contact (After insert) {
    Set<id> accids= new set<id>();
      for(Contact c: Trigger.new){
          accids.add(c.Accountid);
      }
      system.debug(accids);
      list<Contact> con= new list<contact>();
      con=[select id from contact where Account.id in:accids];
      Account  Acclist=[select id,count__c from account where id in:accids limit 1];
      Acclist.Count__c=con.size();
      update Acclist;
}