package com.api.commonLibrary;

import io.restassured.response.Response;

public class ConvertResponseToPojo {

	public Object getAPIResponseAsPOJO(Class<?> type, Response apiResponse) throws Exception {
		if (apiResponse == null) {
			throw new Exception("Can't convert NULL API response To pojo");
		} else {
			JSONSerializer objJsonSerializer = new JSONSerializer();
			return objJsonSerializer.stringToPOJO(apiResponse.asString(), type);
		}

	}
}
