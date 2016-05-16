@isTest
private class JSON2ApexTest {
	
	// This test method should give 100% coverage
	static testMethod void validateParse() {
		String json = '{'+
		'  \"opportunities\": ['+
		'    {'+
		'      \"amount\": 9719437418,'+
		'      \"created_at\": \"2016-04-06 18:24:12.69409\",'+
		'      \"description\": \"Odio fugiat quia unde quia nesciunt dolor consequuntur. Et ad temporibus. Molestiae sed vel distinctio facere dolores.\",'+
		'      \"expectedrevenue\": 8316657792,'+
		'      \"forecastcategoryname\": \"Pipeline\",'+
		'      \"id\": 3,'+
		'      \"leadsource\": \"Web\",'+
		'      \"name\": \"Kovacek Inc\",'+
		'      \"nextstep\": \"Seamless multimedia array\",'+
		'      \"probabliity\": 73,'+
		'      \"quote\": 76446,'+
		'      \"stagename\": \"Needs Analysis\",'+
		'      \"type\": \"New Customer\",'+
		'      \"updated_at\": \"2016-04-06 18:24:12.694091\"'+
		'    },'+
		'    {'+
		'      \"amount\": 8377807456,'+
		'      \"created_at\": \"2016-04-06 18:24:12.697731\",'+
		'      \"description\": \"Voluptatem numquam harum omnis libero eius. Omnis distinctio ullam et illo optio quia et. Perferendis ab ea impedit est. Libero nesciunt facilis eum illum neque sed rerum.\",'+
		'      \"expectedrevenue\": 5095214310,'+
		'      \"forecastcategoryname\": \"Pipeline\",'+
		'      \"id\": 14,'+
		'      \"leadsource\": \"Phone Inquiry\",'+
		'      \"name\": \"Yundt, Robel and Beier\",'+
		'      \"nextstep\": \"Intuitive content-based secured line\",'+
		'      \"probabliity\": 41,'+
		'      \"quote\": 21860,'+
		'      \"stagename\": \"Qualification\",'+
		'      \"type\": \"New Customer\",'+
		'      \"updated_at\": \"2016-04-06 18:24:12.697733\"'+
		'    }'+
		']'+
		'}';
		JSON2Apex r = JSON2Apex.parse(json);
		System.assert(r != null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		JSON2Apex objRoot = new JSON2Apex(System.JSON.createParser(json));
		System.assert(objRoot != null);
		System.assert(objRoot.opportunities == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		JSON2Apex.Opportunities objOpportunities = new JSON2Apex.Opportunities(System.JSON.createParser(json));
		System.assert(objOpportunities != null);
		System.assert(objOpportunities.amount == null);
		System.assert(objOpportunities.created_at == null);
		System.assert(objOpportunities.description == null);
		System.assert(objOpportunities.expectedrevenue == null);
		System.assert(objOpportunities.forecastcategoryname == null);
		System.assert(objOpportunities.id == null);
		System.assert(objOpportunities.leadsource == null);
		System.assert(objOpportunities.name == null);
		System.assert(objOpportunities.nextstep == null);
		System.assert(objOpportunities.probabliity == null);
		System.assert(objOpportunities.quote == null);
		System.assert(objOpportunities.stagename == null);
		System.assert(objOpportunities.type_Z == null);
		System.assert(objOpportunities.updated_at == null);
	}
}