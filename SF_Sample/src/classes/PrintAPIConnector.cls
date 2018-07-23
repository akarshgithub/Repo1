public class PrintAPIConnector{

    public static string runPrint(){
    
        Http http = new Http();
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();
        httpReq.setMethod('GET');
        httpReq.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        httpReq.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm()+ '/services/data/v37.0/sobjects/Contact/describe/layouts/');
        httpRes = http.send(httpReq);
        System.debug('Body==='+httpRes.getBody());
        return httpRes.getBody();
    }
}