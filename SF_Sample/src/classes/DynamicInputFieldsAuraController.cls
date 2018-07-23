public class DynamicInputFieldsAuraController {
    
    @AuraEnabled
    public static String taskFields(){
        return 'task.Subject';
    }
}