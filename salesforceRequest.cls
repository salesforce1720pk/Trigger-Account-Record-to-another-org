public class salesforceRequest {
    
    @Future(Callout = true)
    public static void accountCreate(String name, String type, String rating, String phone){

        Map<String, String> accMap = new Map<String, String>();
        accMap.put('accName',name);
        accMap.put('accType',type);
        accMap.put('accRating',rating);
        accMap.put('accPhone',phone);
        
        String jsonBody = JSON.serialize(accMap);
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:salesforce_Connection_Named_Cred/services/apexrest/Account/AccountServices');
        request.setMethod('POST');
    	request.setHeader('Content-Type','application/json');
    	request.setBody(jsonBody);

    	HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 201){
                System.debug('Account Inserted Successfully');
            }
         else{
                System.debug('Error: ' + response.getStatusCode() + ' - ' + response.getBody());
            } 
	}
}
