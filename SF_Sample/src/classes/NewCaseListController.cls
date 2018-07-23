public class NewCaseListController {
    
    public List<Case> getNewCases()
    {
        List<Case> caseList = [SELECT ID,CaseNumber FROM CASE WHERE Status='New'];
        return(caseList);
    }

}