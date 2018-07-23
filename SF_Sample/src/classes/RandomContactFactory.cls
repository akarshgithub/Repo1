public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer n, String s)
    {
        List<Contact> conList = new List<Contact>();
        for(Integer i=0;i<n;i++)
        {
            Contact con = new Contact(FirstName = 'Test' +i, LastName = s);
            conList.add(con);
        }
        return(conList);
    }
}