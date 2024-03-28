package com.api.commonLibrary;

public class ConvertRequestToPojo {
	
	
	 public Object getAPIRequestAsPOJO(Class<?> type,String apiRequest)
		        throws Exception
		    {
		        if(apiRequest == null)
		        {
		            throw new Exception("Can't convert NULL API response To pojo");
		        } else
		        {
		            JSONSerializer objJsonSerializer = new JSONSerializer();
		            return objJsonSerializer.stringToPOJO(apiRequest, type);
		    }
		    }
}
