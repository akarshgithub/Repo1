public class Map_Practice {
    
    public static void practice(){
    /*
     // Map(ID,Account)
       Map<ID,Account> accMap = new Map<ID,Account>();
        List<Account> acclist = new List<Account>();
        acclist = [Select id,Name from Account limit 10];
        Set<ID> ids = new Set<ID>();
        for(Account acc : acclist){
            ids.add(acc.id);
            accMap.put(acc.id,acc);
        }
        System.debug(ids);
        System.debug(accMap);
*/
        
         /*
     // Map(ID,List<Contact>)
      Map<ID,List<Contact>> accconMap = new Map<ID,List<Contact>>();
List<Account> acclist = new List<Account>();
acclist = [Select id,Name from Account limit 10];
Set<ID> ids = new Set<ID>();
for(Account acc : acclist){
    ids.add(acc.id);
    accconMap.put(acc.id,[Select id,name from Contact where AccountId =: acc.id]);
}
System.debug(ids);
System.debug(accconMap);
*/
    }
}