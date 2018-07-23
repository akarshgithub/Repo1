/*
*
*
*/
public with sharing class ContactRoleRelatedListExtension {
  
  private Opportunity opportunity;
  public List<OpportunityContactRole> lstContactRole {get;set;}
  
  public ContactRoleRelatedListExtension(ApexPages.StandardController controller){
    opportunity = (Opportunity)controller.getRecord();
    lstContactRole = new List<OpportunityContactRole>();
    
    lstContactRole = [SELECT Id,isPrimary,Contact.Title, OpportunityId,Contact.ReportsToId,Contact.ReportsTo.Name, ContactId, Role,Contact.Name,Contact.Account.Name,Contact.AccountId,Contact.Email,Contact.Phone                             
                      FROM OpportunityContactRole WHERE OpportunityId = :opportunity.Id ORDER BY Contact.Name];
  } 
}