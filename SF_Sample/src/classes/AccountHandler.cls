public class AccountHandler {

    	public static Account insertNewAccount(String ac)
        {
            try
            {
            	Account acct = new Account(Name = ac);
            	insert acct;
            
            	return(acct);
            }
            catch (DmlException e) 
            {
    			System.debug('A DML exception has occurred: ' +
                e.getMessage());
                return(null);
			}
        }
}