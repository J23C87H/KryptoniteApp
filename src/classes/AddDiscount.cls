public class AddDiscount {
    public static void applyDiscount(Opportunities__c[] opp) {
       for (Opportunities__c o :opp){
          o.Discounted_Quote__c = o.quote__c * 0.8;
       }
    }

}