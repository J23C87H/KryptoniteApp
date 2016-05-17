global class ProdUnivParse implements database.AllowsCallouts {
	global void parseJSONResponse() {        
    	Http httpProtocol = new Http();
    	// Create HTTP request to send.
    	HttpRequest request = new HttpRequest();
    	// Set the endpoint URL.
    	String endpoint = 'https://superman-caves.herokuapp.com/db';
    	request.setEndPoint(endpoint);
   		// Set the HTTP verb to GET.
    	request.setMethod('GET');
    	// Send the HTTP request and get the response.
    	// The response is in JSON format.
    	HttpResponse response = httpProtocol.send(request);
    	System.debug(response.getBody());

		// Parse JSON response
    	JSONParser parser = JSON.createParser(response.getBody());
        
        //Create a map to store fields into an object
        Map<String, SobjectField> fieldMap = new Map<String, SobjectField> {
        	'amount' => Opportunities__c.Amount__c, //Assign amount in JSON to Amount__c
    		'created_at' => Opportunities__c.created_at__c, //Assign created_at in JSON to created_at__c
    		'description' => Opportunities__c.description__c, //Assign description in JSON to description__c
    		'expectedrevenue' => Opportunities__c.expectedrevenue__c, //Assign expectedrevenue in JSON to expectedrevenue__c
    		'forecastcategoryname' => Opportunities__c.forecastcategoryname__c, //Assign forecastcategoryname in JSON to forecastcategoryname__c
    		'id' => Opportunities__c.ID__c, // Assign id in JSON to ID__c
    		'leadsource' => Opportunities__c.leadsource__c, // Assign leadsource in JSON to leadsource__c
    		'name' => Opportunities__c.Name__c, //Assign name in JSON to Name__c
    		'nextstep' => Opportunities__c.nextstep__c, //Assign nextstep in JSON to nextstep__c
    		'probabliity' => Opportunities__c.probability__c,  //Assign probabliity in JSON to probability__c
    		'quote' => Opportunities__c.quote__c, //Assign quote in JSON to quote__c
    		'stagename' => Opportunities__c.stagename__c, //Assign stagename in JSON to stagename__c
    		'type' => Opportunities__c.type_Z__c, //Assign type in JSON to type_Z__c
    		'updated_at' => Opportunities__c.updated_at__c //Assign updated_at in JSON to updated_at__c
        };
        
        //creating a tempOpportunity to save each Opportunity and creating the fieldName variable.
		Opportunities__c tempOpportunity;
		Opportunities__c[] opportunityList = new Opportunities__c[0];
		String fieldName;

		while(parser.nextToken() != null) {
    	// Save field name, next round we'll get the value
    	if(parser.getCurrentToken() == JsonToken.FIELD_NAME) {
        	fieldName = parser.getText();
        	continue;
    	}
            
    	// Special case-- if the field name isn't null, we know a value is here
    	if(fieldName != null && fieldMap.containsKey(fieldName)) {
        	tempOpportunity.put(fieldMap.get(fieldName), parser.getText());
        	fieldName = null;
        	continue;
    	}
            
   		// We check for a new object later, because it's a rarer event.
    	if(parser.getCurrentToken() == JsonToken.START_OBJECT) {
    	    tempOpportunity = new Opportunities__c();
    	    continue;
    	}
            
    	// Once we know end of object, we can start a new record.
    	if(parser.getCurrentToken() == JsonToken.END_OBJECT) {
        	opportunityList.add(tempOpportunity);
        	tempOpportunity = null;
        	continue;
    	}
            
    	//Insert leads from list.
        if(opportunityList !=null && opportunityList.size()>0){
        	System.debug('Lead List: ' + opportunityList);
            insert opportunityList;
        }
        }
}
}