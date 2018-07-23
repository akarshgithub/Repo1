@isTest
public class TestRestrictContactByName {
    @isTest
    public static void TestRestrictContactByInvalidName()
    {
        Contact con = new Contact(LastName = 'INVALIDNAME');
        insert con;
    }

}