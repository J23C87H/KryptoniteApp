public class JSON2Apex {
  public static void consumeObject(JSONParser parser) {
    Integer depth = 0;
    do {
      JSONToken curr = parser.getCurrentToken();
      if (curr == JSONToken.START_OBJECT || 
        curr == JSONToken.START_ARRAY) {
        depth++;
      } else if (curr == JSONToken.END_OBJECT ||
        curr == JSONToken.END_ARRAY) {
        depth--;
      }
    } while (depth > 0 && parser.nextToken() != null);
  }

  public List<Opportunities> opportunities {get;set;} 

  public JSON2Apex(JSONParser parser) {
    while (parser.nextToken() != JSONToken.END_OBJECT) {
      if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
        String text = parser.getText();
        if (parser.nextToken() != JSONToken.VALUE_NULL) {
          if (text == 'opportunities') {
            opportunities = new List<Opportunities>();
            while (parser.nextToken() != JSONToken.END_ARRAY) {
              opportunities.add(new Opportunities(parser));
            }
          } else {
            System.debug(LoggingLevel.WARN, 'Root consuming unrecognized property: '+text);
            consumeObject(parser);
          }
        }
      }
    }
  }
  
  public class Opportunities {
    public Long amount {get;set;} 
    public String created_at {get;set;} 
    public String description {get;set;} 
    public Long expectedrevenue {get;set;} 
    public String forecastcategoryname {get;set;} 
    public Integer id {get;set;} 
    public String leadsource {get;set;} 
    public String name {get;set;} 
    public String nextstep {get;set;} 
    public Integer probabliity {get;set;} 
    public Integer quote {get;set;} 
    public String stagename {get;set;} 
    public String type_Z {get;set;} // in json: type
    public String updated_at {get;set;} 

    public Opportunities(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'amount') {
              amount = parser.getLongValue();
            } else if (text == 'created_at') {
              created_at = parser.getText();
            } else if (text == 'description') {
              description = parser.getText();
            } else if (text == 'expectedrevenue') {
              expectedrevenue = parser.getLongValue();
            } else if (text == 'forecastcategoryname') {
              forecastcategoryname = parser.getText();
            } else if (text == 'id') {
              id = parser.getIntegerValue();
            } else if (text == 'leadsource') {
              leadsource = parser.getText();
            } else if (text == 'name') {
              name = parser.getText();
            } else if (text == 'nextstep') {
              nextstep = parser.getText();
            } else if (text == 'probabliity') {
              probabliity = parser.getIntegerValue();
            } else if (text == 'quote') {
              quote = parser.getIntegerValue();
            } else if (text == 'stagename') {
              stagename = parser.getText();
            } else if (text == 'type') {
              type_Z = parser.getText();
            } else if (text == 'updated_at') {
              updated_at = parser.getText();
            } else {
              System.debug(LoggingLevel.WARN, 'Opportunities consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }
  
  
  public static JSON2Apex parse(String json) {
    //return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
    return new JSON2Apex(System.JSON.createParser(json));
  }
}