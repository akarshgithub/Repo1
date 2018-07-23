public class ImportWizardButtonCtrl {
 
   @AuraEnabled
    public static String getURLString() {
        String baseURL = URL.getSalesforceBaseUrl().toExternalForm(); 
         String pageURL = '/ui/setup/dataimporter/DataImporterAdminLandingPage';
         return (baseURL + pageURL);
	}
}