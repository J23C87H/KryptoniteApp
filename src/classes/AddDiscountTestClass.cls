@isTest 
private class AddDiscountTestClass {
   static testMethod void validateAddDiscount() {
   //creating and mock inserting false account to test 
        Accounts__c  a = new Accounts__c  (Name= 'test');
            insert a;
        //creating test opp and inserting
        Opportunities__c o = new Opportunities__c(Name__c=a.Id , quote__c = '100' );
        System.debug('Price before inserting new opportunity: ' + o.quote__c);
        insert o;

        //Retrieve the new Opportunity
        o = [SELECT Discounted_Quote__c FROM Opportunities__c WHERE ID = : o.ID];
        System.debug('Price after trigger fired: ' + o.Discounted_Quote__c);

        //Test that the trigger correctly updated the price
        System.assertEquals(80, o.Discounted_Quote__c);
    }
}