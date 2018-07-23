({
    doInit : function(component, event) {
        var action = component.get("c.getContactList");
        action.setCallback(this, function(a) {
            component.set("v.contacts", a.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})