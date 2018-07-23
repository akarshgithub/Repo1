({
	callImportWizard : function(component, event, helper) {
        
		var action = component.get("c.goToImport");
        
        action.setCallback(this, function(response){
           var state = response.getState();
            
           if (state === "SUCCESS") {
          	  
           }
        
    });
                           
    $A.enqueueAction(action);   
    },
    
    goToImportWizard: function(component, event){
        
       var action1 = component.get("c.getURLString"); 
       action1.setCallback(this, function(response){
           var state = response.getState();
           if (state === "SUCCESS") { 
               sforce.navigateToURL(response.getReturnValue());    
           }
       });
	   $A.enqueueAction(action1);
   },
    
    navigate : function(component, event, helper) {

	    //Find the text value of the component with aura:id set to "address"
	    var address = '/ui/setup/dataimporter/DataImporterAdminLandingPage';
	    var urlEvent = $A.get("e.force:navigateToURL");
	    urlEvent.setParams({
	      "url": address,
	      "isredirect" :false
	    });
	    urlEvent.fire();
	}
})