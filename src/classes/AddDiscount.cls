public class AddDiscount {
    public static void applyDiscount(Opportunities__c[] opp) {
       for (Opportunities__c o :opp){
       Integer i;
       i=integer.valueof(o.quote__c);
          o.Discounted_Quote__c = i * 0.8;
       }
    }

}