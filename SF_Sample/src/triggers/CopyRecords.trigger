trigger CopyRecords on Opportunity (before delete, after insert) {

List<COpportunity__c> co = new List<COpportunity__C>();
    if(trigger.isdelete)
    {
        for(Opportunity opp:trigger.old)
        {
            COpportunity__C o = new COpportunity__C();
            o.Name = opp.Name; 
            o.AccountName__C = opp.Accountid; 
            o.Stage__c = opp.StageName;
        
            co.add(o);
        }
    }
    
     if(trigger.isinsert)
     {
         for(Opportunity opp:trigger.new)
         {
            COpportunity__C o = new COpportunity__C();
            o.Name = opp.Name; 
            o.AccountName__C = opp.Accountid; 
            o.Stage__c = opp.StageName;
        
            co.add(o);
        
         }
         
    }
insert co;

}