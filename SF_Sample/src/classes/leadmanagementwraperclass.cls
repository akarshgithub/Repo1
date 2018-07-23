public with sharing class leadmanagementwraperclass {
@AuraEnabled
    public Lead leadvar ;

    @AuraEnabled
    public boolean checkkvar ;

    public leadmanagementwraperclass(Lead leadvar){
        checkkvar = false;
        this.leadvar = leadvar;
       
     
    }
}