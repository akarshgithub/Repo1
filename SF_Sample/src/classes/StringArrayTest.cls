public class StringArrayTest {

    	public static List<String> generateStringArray(integer n)
        {
            List<String> test = new List<String>();
            integer i=0;
            for(i=0;i<n;i++)
            {
                test.add('Test '+i);
            }
            System.debug(test); 
            return(test);
        }
}