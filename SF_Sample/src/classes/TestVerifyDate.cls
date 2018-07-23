@isTest
public class TestVerifyDate {
	@isTest static void testDate ()
    {
        date a = date.newInstance(1990, 11, 2);
        date b = date.newInstance(1990, 11, 21);
        date c = date.newInstance(1990, 12, 21);  
        date d1 = VerifyDate.CheckDates(a,b);
        date d2 = VerifyDate.CheckDates(a,c);          
    }
    	
}