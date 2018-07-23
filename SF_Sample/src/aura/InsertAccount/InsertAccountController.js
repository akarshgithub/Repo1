({
     doInit : function(component, event, helper) {
		var action = component.get("c.initList");
        action.setCallback(this, function(response){
           var state = response.getState();
           if (state === "SUCCESS") { 

               component.set("v.accs", response.getReturnValue());
           }
       });
	   $A.enqueueAction(action);
   },
    createAccount : function(component, event, helper) {
        var newAcc = component.get("v.acc");
        var action = component.get("c.saveAcc");
        action.setParams({ 
            "a": newAcc
        });
        action.setCallback(this, function(res){
           var state = res.getState();
           if (state === "SUCCESS") { 
               var nm = res.getReturnValue();
                window.location.reload();
           }
       });
       $A.enqueueAction(action);
	},
   showAccList: function(component, event){
       var key = component.find("search").get("v.value");
       var num = component.find("ListSize").get("v.value");
      
       var action1 = component.get("c.showList");
       action1.setParams({ 
            "str": key,
              "n":num
        });
       action1.setCallback(this, function(response){
           var state = response.getState();
           if (state === "SUCCESS") { 

               component.set("v.accs", response.getReturnValue());
               
           }
       });
	   $A.enqueueAction(action1);
   },
     openModal : function(component, event, helper) {
        
         var j$=jQuery.noConflict();
         j$("#modal").show(); 
  
   },
    closeModal : function(component, event, helper) {
  
        var j$=jQuery.noConflict();
        j$("#modal").hide(); 
        
        component.find("subject").set("v.value",'');
        component.find("body").set("v.value",'');
       
   },
    sendMail: function(component, event, helper) {
        var wraapobj = component.get("v.accs");
         var trueAcc=new Array();
       
           for(var i = 0; i < wraapobj.length; i++){
             if(wraapobj[i].check==true){  
              trueAcc.push(wraapobj[i].acc);
           }  
               
       }
       var sub = component.find("subject").get("v.value");
       var emailbody = component.find("body").get("v.value"); 
         
       var action = component.get("c.sendEmail");
       action.setParams({
           "accList":trueAcc,
           "subject":sub,
           "body":emailbody
        }) ;
        
        action.setCallback(this, function(response){
           var state = response.getState();
           if (state === "SUCCESS") {
          window.location.reload();
           }
	});
        $A.enqueueAction(action);
    },
    delAccount: function(component, event, helper) {
        
        var wraapobj = component.get("v.accs");
         var trueAcc=new Array();
       
           for(var i = 0; i < wraapobj.length; i++){
             if(wraapobj[i].check==true){  
              trueAcc.push(wraapobj[i].acc);
           }  
               
       }
      
       var action = component.get("c.delAcc");
       action.setParams({
           "accList":trueAcc
        }) ;
        
        action.setCallback(this, function(response){
           var state = response.getState();
           if (state === "SUCCESS") {
          window.location.reload();
           }
	});
        $A.enqueueAction(action);
    },
    cancel : function(component, event, helper) {
         
        window.location.reload();
  
   },
})