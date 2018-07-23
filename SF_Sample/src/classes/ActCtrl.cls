public class ActCtrl {

    public Account acct;
    
    public ActCtrl(ApexPages.StandardController stdController) {
        this.acct = (Account)stdController.getRecord();
    }

}