({
    loadContactList: function(component, event, helper) {
       // By Default make sort field is 'FirstName' of contact object
       // call the helper function with pass sortField Name
       helper.onLoad(component, event, 'FirstName');
    },
 
    sortFirstName: function(component, event, helper) {
       // set current selected header field on selectedTabsoft attribute.     
       component.set("v.selectedTabsoft", 'firstName');
       // call the helper function with pass sortField Name   
       helper.sortHelper(component, event, 'FirstName');
    },
 
    sortLastName: function(component, event, helper) {
       // set current selected header field on selectedTabsoft attribute.    
       component.set("v.selectedTabsoft", 'lastName');
       // call the helper function with pass sortField Name  
       helper.sortHelper(component, event, 'LastName');
    },
 
    sortDepartment: function(component, event, helper) {
       // set current selected header field on selectedTabsoft attribute.        
       component.set("v.selectedTabsoft", 'Department');
       // call the helper function with pass sortField Name      
       helper.sortHelper(component, event, 'Department');
    },
 })