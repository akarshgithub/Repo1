trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    List<Task> tasklist = new List<Task>();
    for(Opportunity opp: Trigger.new)
    {
        if(opp.StageName == 'Closed Won')
        {
            Task t = new Task();
            t.subject = 'Follow Up Test Task';
            t.WhatId = opp.id;
            tasklist.add(t);
        }
    }
    if(tasklist.size() > 0)
    {
        insert tasklist;
    }
}