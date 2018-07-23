@isTest
public class AnimalLocatorTest {
    @isTest public static void testAnimalsLocatorTest(){
     Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
     AnimalLocator.getAnimalNameById(1);
    }
}