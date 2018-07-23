trigger AccountAddressTrigger on Account (before insert, before update) {
    
    if(Trigger.isbefore)
    {
        for(Account acc: Trigger.new)
        {
            if((acc.BillingPostalCode != null && acc.BillingPostalCode != '' ) && (acc.Match_Billing_Address__c == true))
            {
                acc.ShippingPostalCode = acc.BillingPostalCode;
             
            }
            
        }
    }

}