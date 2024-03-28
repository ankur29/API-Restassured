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

public class PostRequest {

	private static final String RESPONSE_BODY = "Response Body";
	private static final String END_POINT = "endPoint";
	private static final String REQUEST_BODY = "Request Body";
	private static final String REQUEST_HEADER = "Request Header";
	private static final String REQUEST_URL = "Request URL";
	private static final String ENV = "env";
	private static final String ENVIRONMENT = "environment";

	public Response executePostWithHeader(String modifiedJson, Map<String, String> headerMap,
			HashMap<String, String> configMap, HashMap<String, String> globalValuesMap) {

		String env = PropertyFileReader.getPropertyValue(ENVIRONMENT);
		String baseURI = PropertyFileReader.getPropertyValue(configMap.get(ENV).toLowerCase() + "_" + env);

		RestAssured.baseURI = baseURI;
		RequestSpecification request = RestAssured.given();
		request.headers(headerMap);
		request.body(modifiedJson);

		String endPoint=setEndPointValues(configMap.get(END_POINT), globalValuesMap);

		ExtentCucumberAdapter.addTestStepLog(REQUEST_URL);
		ExtentCucumberAdapter.getCurrentStep().info(MarkupHelper.createCodeBlock(baseURI + endPoint));

		ExtentCucumberAdapter.addTestStepLog(REQUEST_HEADER);
		ExtentCucumberAdapter.getCurrentStep()
		.info(MarkupHelper.createCodeBlock(CommonStep.convertMaptoJsonString(headerMap), CodeLanguage.JSON));

		ExtentCucumberAdapter.addTestStepLog(REQUEST_BODY);
		ExtentCucumberAdapter.getCurrentStep().info(MarkupHelper.createCodeBlock(modifiedJson, CodeLanguage.JSON));

		Response response = request.post(endPoint);

		ExtentCucumberAdapter.addTestStepLog(RESPONSE_BODY);
		ExtentCucumberAdapter.getCurrentStep()
		.info(MarkupHelper.createCodeBlock(response.asString(), CodeLanguage.JSON));
		return response;

	}
	
	public Response executePostWithoutBody(Map<String, String> headerMap,
			HashMap<String, String> configMap, HashMap<String, String> globalValuesMap) {

		String env = PropertyFileReader.getPropertyValue(ENVIRONMENT);
		String baseURI = PropertyFileReader.getPropertyValue(configMap.get(ENV).toLowerCase() + "_" + env);

		RestAssured.baseURI = baseURI;
		RequestSpecification request = RestAssured.given();
		request.headers(headerMap);

		String endPoint=setEndPointValues(configMap.get(END_POINT), globalValuesMap);

		ExtentCucumberAdapter.addTestStepLog(REQUEST_URL);
		ExtentCucumberAdapter.getCurrentStep().info(MarkupHelper.createCodeBlock(baseURI + endPoint));

		ExtentCucumberAdapter.addTestStepLog(REQUEST_HEADER);
		ExtentCucumberAdapter.getCurrentStep()
		.info(MarkupHelper.createCodeBlock(CommonStep.convertMaptoJsonString(headerMap), CodeLanguage.JSON));

		Response response = request.post(endPoint);

		return response;

	}

	public String setEndPointValues(String endPointUrl, HashMap<String, String> globalValuesMap) {
		String finalEndPoint = null;
		HashMap<String, String> hm = new HashMap<>();
		hm = generateEndPointDynamicValues(endPointUrl, globalValuesMap);
		if (endPointUrl.contains("${")) {

			for (Map.Entry<String, String> entry : hm.entrySet()) {
				if (endPointUrl.contains(entry.getKey())) {
					finalEndPoint = endPointUrl.replace(entry.getKey(), entry.getValue());
				}
			}
		} else {
			finalEndPoint = endPointUrl;
		}
		return finalEndPoint;

	}

	private HashMap<String, String> generateEndPointDynamicValues(String endPointUrl,
			HashMap<String, String> globalValuesMap) {
		HashMap<String, String> dynamicValuesMap = new HashMap<>();

		for (int i = 0; i < endPointUrl.split("/").length; i++) {

			System.out.println("1" +endPointUrl.split("/").length);
			if (endPointUrl.contains("${")) {
				String dynamicValue = endPointUrl.split("/")[i].replace("${", "").replace("}", "").toLowerCase();
				if (dynamicValue.contains("global")) {
					dynamicValue = dynamicValue.split("_")[0];
					dynamicValuesMap.put("${" + dynamicValue + "_global}", globalValuesMap.get(dynamicValue));
				}
				if (dynamicValue.contains("config")) {
					dynamicValue = dynamicValue.split("_")[0];
					dynamicValuesMap.put("${" + dynamicValue + "_config}",PropertyFileReader.getPropertyValue(dynamicValue));
				}
			}
		}
		return dynamicValuesMap;
	}

}
