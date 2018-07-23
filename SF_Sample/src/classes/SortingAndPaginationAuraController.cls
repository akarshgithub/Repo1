public class SortingAndPaginationAuraController {
    
    @AuraEnabled 
    public static Account[] getAccounts() {
        return [SELECT Name, Industry, AnnualRevenue FROM Account LIMIT 1000];
    }
    
}