trigger AddDiscountTrigger on Opportunities__c (before insert) {

   Opportunities__c[] opp = Trigger.new;

   AddDiscount.applyDiscount(opp);
}