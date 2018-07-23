({
   onclick1: function(cmp){
     
       var nm = cmp.find("nameOutput").get("v.value");
        alert(nm);
       var action =cmp.get("c.ettasks");
       action.setParams({
           "getvalue": nm
       })
       action.setCallback(this, function(response){
           var state = response.getState();
           if (state === "SUCCESS") {
               
               cmp.set("v.tasks", response.getReturnValue());
           }
       });
$A.enqueueAction(action);
   }
})