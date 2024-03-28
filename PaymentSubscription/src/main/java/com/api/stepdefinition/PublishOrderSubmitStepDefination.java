package com.api.stepdefinition;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import io.cucumber.datatable.DataTable;
import org.junit.Assert;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import io.restassured.response.Response;

import com.api.businessLibrary.*;
import com.api.commonLibrary.CommonStep;
import com.apiLibrary.*;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class PublishOrderSubmitStepDefination {


	//Intialize Objects/variables
	String modifiedJson;
	Response response;
	Map<String, String> headerMap = new HashMap<>();
	HashMap<String, String> globalValuesMap = new HashMap<>();
	PublishOrderSubmit publishOrderSubmit = new PublishOrderSubmit();
	CreateMandateDPS createMandateDPS = new CreateMandateDPS();

	@Given("I Prepare the request Body with {string} with given values:")
	public void prepareRequestBodyWithObjects(String requestFilePath, DataTable dataTable)
			throws JsonParseException, JsonMappingException, IOException, InterruptedException {
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		Map<String, String> valueMap = new HashMap<>();
		valueMap = data.get(0);
		ObjectMapper objectMapper = new ObjectMapper();
		String requestPayload = CommonStep.convertIntoString(requestFilePath);

		if(requestFilePath.contains("listenerService/publishOrderSubmit.json")) {

			modifiedJson = publishOrderSubmit.preparePublishOrderSubmitRequest(valueMap, objectMapper, requestPayload, globalValuesMap);
		}

		if(requestFilePath.contains("digitalPaymentService/createMandate.json")) {
			modifiedJson =CreateMandateDPS.prepareCreateManadateRequest(valueMap, objectMapper, requestPayload, globalValuesMap);
		}
		if(requestFilePath.contains("listenerService/partnerSubscriptionCreated.json")) {
			modifiedJson =PartnerSusbcriptionCreated.preparePartnerSubscriptionCreatedRequest(valueMap, objectMapper, requestPayload, globalValuesMap);
		}
		if(requestFilePath.contains("listenerService/partnerSubscriptionActivated.json")) {
			modifiedJson =PartnerSusbcriptionActivated.preparePartnerSubscriptionActivatedRequest(valueMap, objectMapper, requestPayload, globalValuesMap);
		}
		Thread.sleep(3000);
		System.out.println("Request Body for "+requestFilePath+""+modifiedJson);
	}

	@When("I prepare the headers with given values:")
	public void prepareHeaders(DataTable dataTable) {
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		headerMap = data.get(0);
//		System.out.println("Headers: \n"+headerMap);
	}

	@And("Set the value of {string}")
	public void setTheValueInGlobalMap(String values) {
		String[] valueSplit = values.split(",");

		for(int i=0; i<valueSplit.length;i++) {
			globalValuesMap.put(valueSplit[i], response.jsonPath().getString(valueSplit[i]));
		}


	}
	@Then("I execute the POST request service {string} with endpoint {string}")
	public void createPostRequest(String env, String endPoint) throws InterruptedException {
		HashMap<String, String> hashMap = new HashMap<>();
		hashMap.put("env", env);
		hashMap.put("endPoint", endPoint);
		PostRequest postRequest = new PostRequest();
		if(env.contains("httpservice_activatesubscription")) {
			response = postRequest.executePostWithoutBody(headerMap, hashMap,globalValuesMap);
		}else {
			response = postRequest.executePostWithHeader(modifiedJson, headerMap, hashMap,globalValuesMap);
		}
		System.out.println(response.asString());	
		Thread.sleep(3000);
	}

	@And("Verify Response code should be {int}")
	public void verifyStatusCode(int expectedStatusCode) {
		int actualstatusCode = response.getStatusCode();
		// Verify the status code
		Assert.assertEquals(expectedStatusCode, actualstatusCode);
	}
	@And("Verify Response should be {string}")
	public void verifyTheResponseString(String expectedResponse) {
		if(expectedResponse.contains("=")) {
			Assert.assertEquals(expectedResponse.trim().split("=")[1], response.jsonPath().getString(expectedResponse.trim().split("=")[0]));
		}else {
			Assert.assertTrue(response.asString().trim().contains(expectedResponse.trim()));	
		}	
	}

	@And("Verify that Response should not be empty")
	public void verifyResponseNotEmpty() {
		String responseBody = response.getBody().asString();
		// verify the response body shouldn't be empty
		Assert.assertNotNull(response.getBody());
		Assert.assertNotNull(response.jsonPath());
		//		Assert.assertNotEquals("", responseBody);
		Assert.assertNotNull(responseBody);
		System.out.println(response.jsonPath());
		//	    Assert.assertNotNull(response.jsonPath().getList("data"));
		//	    Assert.assertNotNull(response.jsonPath().getList("data").isEmpty());
		//	    JSONObject responseJson = new JSONObject(responseBody);
		//	    Assert.assertFalse(responseJson.getJSONObject("data").isEmpty());
	}

	@Given("I execute the GET request service {string} with endpoint {string} and {string} as query parameter")
	public void createGetRequest(String env, String endPoint, String queryParameter) throws InterruptedException {
		HashMap<String, String> envConfigMap = new HashMap<>();
		envConfigMap.put("env", env);
		envConfigMap.put("endPoint", endPoint);

		HashMap<String, String> queryParamsMap = new HashMap<>();
		String[] queryParamSplit = queryParameter.split(",");

		for (int i = 0; i < queryParamSplit.length; i++) {

			for (Map.Entry<String, String> entry : globalValuesMap.entrySet()) {
				System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
				if (entry.getKey().toString().equalsIgnoreCase(queryParamSplit[i].split("=")[1])) {
					queryParamsMap.put(queryParamSplit[i].split("=")[0], entry.getValue());
					break;
				} else {
					queryParamsMap.put(queryParamSplit[i].split("=")[0], queryParamSplit[i].split("=")[1]);
				}
			}

		}
		GetRequest getRequest = new GetRequest();
		response = getRequest.executeGetAPI(headerMap, envConfigMap, queryParamsMap);
		Thread.sleep(3000);
	}

	@And("Get the following values {string}")
	public void verifyAndGetValues(String valuesToBeVerified) {
		String[] responseData = valuesToBeVerified.split(",");
		String data;
		for (int i = 0; i < responseData.length; i++) {
			String[] responseDataSplit = responseData[i].replace(".", ",").split(",");
			data = response.jsonPath().getString(responseData[i]);
			globalValuesMap.put(responseDataSplit[responseDataSplit.length - 1],
					data.replace("[", "").replace("]", ""));
		}
	}

	@And("Verify the {string} value in response")
	public void verifySubscriptionsResponse(String toBeValidated) {

		//Validate MPRN value from create mandate with subscription API
		Assert.assertEquals(globalValuesMap.get(toBeValidated.split(",")[0]), response.jsonPath().getString(toBeValidated.replace(".", ",").split(",")[1]));
	}
	@And("Verify the response data with below expected result:")
	public void verifyResponseData(DataTable dataTable) {

		// Process the data table
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);

		int count = 0;

		for (Map<String, String> row : data) {
			String status = row.get("Status");
			String orderNumber = row.get("OrderNumber");
			String subscriptionId = row.get("SubscriptionId");
			String[] reason = row.get("Reason").split(",");

			Assert.assertTrue(response.jsonPath().getString("subscriptionStatuses[" + count + "].status").contains(status));
			Thread.sleep(4000);
			if (count < 12) {
				Assert.assertTrue(response.jsonPath().getString("subscriptionStatuses[" + count + "].subscriptionId")
						.contains(globalValuesMap.get(subscriptionId)));
			} else {
				Assert.assertTrue(response.jsonPath().getString("subscriptionStatuses[" + count + "].subscriptionId")
						.contains(globalValuesMap.get(subscriptionId)));
			}
			Assert.assertTrue(response.jsonPath().getString("subscriptionStatuses[" + count + "].orderNumber")
					.contains(globalValuesMap.get(orderNumber)));
			for (int i = 0; i < reason.length; i++) {
				Assert.assertTrue(response.jsonPath().getString("subscriptionStatuses[" + count + "].reason")
						.contains(reason[i]));
			}
			count++;   

		}
	}

}
