package com.apiLibrary;

import java.util.HashMap;
import java.util.Map;

import com.api.commonLibrary.*;
import com.aventstack.extentreports.cucumber.adapter.ExtentCucumberAdapter;
import com.aventstack.extentreports.markuputils.CodeLanguage;
import com.aventstack.extentreports.markuputils.MarkupHelper;

import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class GetRequest {

	private static final String RESPONSE_BODY = "Response Body";
	private static final String REQUEST_HEADER = "Request Header";
	private static final String REQUEST_URL = "Request URL";
	private static final String END_POINT = "endPoint";
	private static final String ENV = "env";
	private static final String ENVIRONMENT = "environment";

	public Response executeGetAPI(Map<String, String> headerMap, HashMap<String, String> configMap,
			HashMap<String, String> queryParamsMap) {

		String env = PropertyFileReader.getPropertyValue(ENVIRONMENT);
		String baseURI = PropertyFileReader.getPropertyValue(configMap.get(ENV).toLowerCase() + "_" + env);

		HashMap<String, String> queryParams = new HashMap<>();

		if (!queryParamsMap.isEmpty()) {
			queryParams.putAll(queryParamsMap);
		}

		RestAssured.baseURI = baseURI;
		RequestSpecification request = RestAssured.given();
		request.queryParams(queryParams);
		request.headers(headerMap);

		ExtentCucumberAdapter.addTestStepLog(REQUEST_URL);
		ExtentCucumberAdapter.getCurrentStep().info(MarkupHelper.createCodeBlock(baseURI + configMap.get(END_POINT)));

		ExtentCucumberAdapter.addTestStepLog(REQUEST_HEADER);
		ExtentCucumberAdapter.getCurrentStep()
				.info(MarkupHelper.createCodeBlock(CommonStep.convertMaptoJsonString(headerMap), CodeLanguage.JSON));

		Response response = request.get(configMap.get(END_POINT));
		ExtentCucumberAdapter.addTestStepLog(RESPONSE_BODY);
		ExtentCucumberAdapter.getCurrentStep()
				.info(MarkupHelper.createCodeBlock(response.asString(), CodeLanguage.JSON));
		return response;
	}

}
