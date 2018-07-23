public class ContactSearch {

    	public static List<Contact> searchForContacts(String a, String b)
        {
            List<Contact> con = [SELECT ID, NAME from Contact where LastName =: a AND MailingPostalCode =: b];
            return(con);
        }
}