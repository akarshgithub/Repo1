/*
*
*Exteneion for New Opportunity Contact Role UI
*/
global with sharing class NewContactRoleExtension{
  
  private Opportunity opportunity;
 
  public List<OpportunityContactRole> lstContactRole {get;set;}
  Map<Id,OpportunityContactRole> mpRoleContact = new Map<Id,OpportunityContactRole>();
  public map<Id,String> mpContactTitle = new map<Id,String>();
  
  public Map<Id,String> getmpContactTitle() {
        return mpContactTitle;
  }
  // Constructor
  public NewContactRoleExtension(ApexPages.StandardController controller){
    opportunity = (Opportunity)controller.getRecord();
    
    lstContactRole = new List<OpportunityContactRole>();
    lstContactRole = [SELECT Id,isPrimary,Contact.Title, OpportunityId,Contact.ReportsToId,Contact.ReportsTo.Name, ContactId, Role,Contact.Name,Contact.Account.Name,Contact.AccountId,Contact.Email,Contact.Phone                             
                      FROM OpportunityContactRole WHERE OpportunityId = :opportunity.Id ORDER BY Contact.Name];
    
    Set<Id> stExistingContactIds = new Set<Id>();
    for(OpportunityContactRole role : lstContactRole) {
      mpRoleContact.put(role.Id,role);
      stExistingContactIds.add(role.ContactId);
      mpContactTitle.put(role.ContactId,(role.Contact.Title != NULL) ? role.Contact.Title : '');
    }
    for(Contact con : [Select Id,Title From Contact Where AccountId = :opportunity.AccountId AND Id Not IN :stExistingContactIds ORDER BY Name]) {
      lstContactRole.add(new OpportunityContactRole(opportunityId = opportunity.Id,isPrimary = false,ContactId = con.Id));
      mpContactTitle.put(con.Id,(con.Title != NULL) ? con.Title : '');
    }
    for(Integer i = 0;i < 3;i++ ) {
      lstContactRole.add(new OpportunityContactRole(opportunityId = opportunity.Id,isPrimary = false));
    } 
   
  }
  
  // Called from page to save the data
  public PageReference saveOCR() {
    return saveOCRsInternal(); 
  }
  // Called Internally to save OCRs
  private Pagereference saveOCRsInternal() {
    String primaryKey = ApexPages.CurrentPage().getParameters().get('primary');
     system.debug('====primaryKey ====' + primaryKey );
    List<OpportunityContactRole> lstContactRoleToSave = new List<OpportunityContactRole>(); 
    Integer index = -1;
    for(OpportunityContactRole role : lstContactRole) {
      index++;
      if(role.id != null && role.contactId == null) {
        role.contactId = mpRoleContact.get(role.Id).ContactId;
        role.Role = mpRoleContact.get(role.Id).Role;        
      }
      if(role.id == null && (role.contactId == null || role.Role == Null)) {
        continue;
      }
      if(Integer.valueOf(primaryKey) == index) {
        role.isPrimary = true;
      }
      else {
        role.isPrimary = false;
      }
      lstContactRoleToSave.add(role);
      
    }

    if(!lstContactRoleToSave.isEmpty()) {
      try {
          for (OpportunityContactRole lcrs : lstContactRoleToSave){
              if(lcrs.isPrimary = true){
                  opportunity.Description = lcrs.Contact.Description ;
                  update opportunity;
                }
              }
        upsert lstContactRoleToSave;
        
      }
      catch(DMLException de) {
        ApexPages.addMessages(de);
        return null;
      }
    }
    update opportunity;
    return new PageReference('/'+opportunity.Id);
  } 
  
 
}