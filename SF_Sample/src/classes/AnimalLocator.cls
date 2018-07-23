public class AnimalLocator {
    public static String getAnimalNameById(Integer id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String str = response.getBody();
        str = str.substringBetween('name', ',').replace('\"','').replace(':','');
        System.debug(str);
        return(str);
    }
}