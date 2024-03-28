package com.api.businessLibrary;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.api.parentSubscriptionCreatedPojo.*;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class PartnerSusbcriptionCreated {

	private static final String ACTIVATION_URL = "activationUrl";
	private static final String CREATED_DATE = "createdDate";
	private static final String ID = "id";
	private static final String PRODUCTID = "productid";
	private static final String MARKETPLACE_SUBSCRIPTION_ID = "marketplaceSubscriptionId";
	private static final String GLOBAL = "global";
	private static final String NULL = "null";

	/**
	 * 
	 * @param valueMap
	 * @param objectMapper
	 * @param requestPayload
	 * @param globalValuesMap
	 * @return
	 * @throws JsonParseException
	 * @throws JsonMappingException
	 * @throws IOException
	 */

	public static String preparePartnerSubscriptionCreatedRequest(Map<String, String> valueMap, ObjectMapper objectMapper,
			String requestPayload, HashMap<String, String> globalValuesMap)
					throws JsonParseException, JsonMappingException, IOException {
		ParentSubscriptionCreatedPojo parentsubscriptioncreatedpojo = objectMapper.readValue(requestPayload, ParentSubscriptionCreatedPojo.class);
		for (String key : valueMap.keySet()) {

			if (key.equalsIgnoreCase(ID)) {
				if (valueMap.get(key).contains(GLOBAL)) {
					parentsubscriptioncreatedpojo.setId(globalValuesMap.get(PRODUCTID));
				}else if(valueMap.get(key).contains(NULL)) {
					parentsubscriptioncreatedpojo.setId(null);
				}else{
					parentsubscriptioncreatedpojo.setId(valueMap.get(key));
				}
			}else if(key.equalsIgnoreCase(MARKETPLACE_SUBSCRIPTION_ID)) {
				if (valueMap.get(key).contains(GLOBAL)) {
					parentsubscriptioncreatedpojo.setMarketplaceSubscriptionId(globalValuesMap.get(ID));
				}else if(valueMap.get(key).contains(NULL)) {
					parentsubscriptioncreatedpojo.setMarketplaceSubscriptionId(null);
				}else{
					parentsubscriptioncreatedpojo.setMarketplaceSubscriptionId(valueMap.get(key));
				}

			}else if(key.equalsIgnoreCase(ACTIVATION_URL)) {
				if (valueMap.get(key).contains(NULL)) {
					parentsubscriptioncreatedpojo.setActivationUrl(null);
				} else {
					parentsubscriptioncreatedpojo.setActivationUrl(valueMap.get(key));
				}
			}
			else if(key.equalsIgnoreCase(CREATED_DATE)) {
				if (valueMap.get(key).contains(NULL)) {
					parentsubscriptioncreatedpojo.setCreatedDate(null);;
				} else {
					parentsubscriptioncreatedpojo.setCreatedDate(valueMap.get(key));
				}
			}

		}
		return objectMapper.writeValueAsString(parentsubscriptioncreatedpojo);
	}

}
