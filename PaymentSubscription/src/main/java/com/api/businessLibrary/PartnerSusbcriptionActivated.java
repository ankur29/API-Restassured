package com.api.businessLibrary;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.api.parentSubscriptionActivatedPojo.*;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class PartnerSusbcriptionActivated {

	private static final String ACTIVATED_DATE = "activatedDate";
	private static final String STATUS = "status";
	private static final String PRODUCTID = "productid";
	private static final String MARKETPLACE_SUBSCRIPTION_ID = "marketplaceSubscriptionId";
	private static final String GLOBAL = "global";
	private static final String ID = "id";
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

	public static String preparePartnerSubscriptionActivatedRequest(Map<String, String> valueMap, ObjectMapper objectMapper,
			String requestPayload, HashMap<String, String> globalValuesMap)
					throws JsonParseException, JsonMappingException, IOException {
		ParentSubscriptionActivatedPojo parentsubscriptionactivatedpojo = objectMapper.readValue(requestPayload, ParentSubscriptionActivatedPojo.class);
		for (String key : valueMap.keySet()) {

			if (key.equalsIgnoreCase(ID)) {
				if (valueMap.get(key).contains(GLOBAL)) {
					parentsubscriptionactivatedpojo.setId(globalValuesMap.get(PRODUCTID));
				} else if (valueMap.get(key).contains(NULL)) {
					parentsubscriptionactivatedpojo.setId(null);
				} else {
					parentsubscriptionactivatedpojo.setId(valueMap.get(key));
				}
			}else if(key.equalsIgnoreCase(MARKETPLACE_SUBSCRIPTION_ID)) {
				if (valueMap.get(key).contains(GLOBAL)) {
					parentsubscriptionactivatedpojo.setMarketplaceSubscriptionId(globalValuesMap.get(ID));
				}else if (valueMap.get(key).contains(NULL)) {
					parentsubscriptionactivatedpojo.setMarketplaceSubscriptionId(null);;
				} else {
					parentsubscriptionactivatedpojo.setMarketplaceSubscriptionId(valueMap.get(key));
				}
			}
			else if(key.equalsIgnoreCase(STATUS)) {
				if (valueMap.get(key).contains(NULL)) {
					parentsubscriptionactivatedpojo.setStatus(null);;
				} else {
					parentsubscriptionactivatedpojo.setStatus(valueMap.get(key));
				}
			}
			else if(key.equalsIgnoreCase(ACTIVATED_DATE)) {
				if (valueMap.get(key).contains(NULL)) {
					parentsubscriptionactivatedpojo.setActivatedDate(null);;
				} else {
					parentsubscriptionactivatedpojo.setActivatedDate(valueMap.get(key));
				}
			}
		}
		return objectMapper.writeValueAsString(parentsubscriptionactivatedpojo);
	}

}
