public class ContactAndLeadSearch {
    
    public static List<List< SObject>> searchContactsAndLeads(String a)    
    {
        List<List< SObject>> s = [FIND :a IN ALL FIELDS RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
        return s;
    }

}