@isTest 
public class leadmanagementcontrollerTest {
    
    static testMethod void testMethod1() {
        
        List<lead> leadlist = new List<lead>();
        
        List<lead> leadlist2 = new List<lead>();
        
        lead ld = new lead();
        ld.lastname = 'test';
        ld.company='test2';
        ld.email = 'test5@gmail.com'; 
        ld.Status ='Open - Not Contacted' ;
        insert ld;
        
        System.assertNotEquals(ld.id, null);
        
        leadlist.add(ld);
        
        lead ld1 = new lead();
        ld1.lastname = 'test1';
        ld1.company='test21';
        ld1.Status ='Open - Not Contacted' ;
        ld1.email = 'test23@gmail.com'; 
        insert ld1;
        
        System.assertNotEquals(ld1.id, null);
        
        leadlist2.add(ld1);
        
        Task u = new Task();
        u.whoId = ld.Id; 
        u.Subject = 'Run Test Trigger';
        u.Status = 'Not Started';
        u.Priority = 'Normal';
        insert u;
        
        System.assertNotEquals(u.id, null);
        
        Event evt = new Event();
        evt.whoId = ld.Id; 
        evt.Subject = 'test';
        evt.StartDateTime = system.today();
        evt.EndDateTime = system.today();
        insert evt;
        
        System.assertNotEquals(evt.id, null);
        
        
        Lead_history__c ldhistry = new Lead_history__c();
        ldhistry.name = 'test';
        ldhistry.Email__c = 'test@gmail.com';
        ldhistry.Phone__c = '123456';
        insert ldhistry;
        
        System.assertNotEquals(ldhistry.id, null);
        
        
        leadmanagementcontroller.selectleadrecord();
        leadmanagementcontroller.previouscont(20);
        leadmanagementcontroller.nextcont(10);
        leadmanagementcontroller.leaddetaidonclickk(ld.id);
        leadmanagementcontroller.histaskdetilscontroller(u.id);
        leadmanagementcontroller.hiseventtdetilscontroller(evt.id);
        leadmanagementcontroller.history();
        leadmanagementcontroller.getacivty(evt.id);
        leadmanagementcontroller.getaskrecord(u.id);
        leadmanagementcontroller.eventhistryy(evt.id);
        leadmanagementcontroller.taskhistryy(u.id);
        leadmanagementcontroller.searchemailhistory('test');
        leadmanagementcontroller.searchldrececord('test');
        leadmanagementcontroller.recordleadconvrson(leadlist);
        leadmanagementcontroller.convertleadToOpportunity(leadlist,leadlist2);
        leadmanagementcontroller.tosendmail(leadlist,'test', 'test2');
        leadmanagementcontroller.deleteleadrecord(leadlist);
        
    }
 
}