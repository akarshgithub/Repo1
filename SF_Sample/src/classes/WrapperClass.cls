public class WrapperClass{
    
    
    @AuraEnabled
    public boolean check;
     
    @AuraEnabled
    public Account acc;
    
    public WrapperClass(Account acc){
        check = false;
        this.acc = acc;
        
    }
     
}