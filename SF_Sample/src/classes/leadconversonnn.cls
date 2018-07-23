public with sharing class leadconversonnn {

     @AuraEnabled
    public Lead leadvarwrap ;

    @AuraEnabled
    public boolean checkkvarlid ;
    
    @AuraEnabled
    public string valuetoapendoppname ;
      

    public leadconversonnn(Lead leadvarwrap){
        checkkvarlid = false;
        this.leadvarwrap = leadvarwrap;
        this.valuetoapendoppname='';
     
    }
}