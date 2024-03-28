package com.api.businessLibrary;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.api.digitalPaymentPojo.CreateMandatePojo;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class CreateMandateDPS {

	private static final String NAME = "name";
	private static final String BUSINESS_REF = "businessRef";
	private static final String GLOBAL = "global";
	private static final String PIR = "pir";
	private static final String CHANNEL = "channel";

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
	public static String prepareCreateManadateRequest(Map<String, String> valueMap, ObjectMapper objectMapper,
			String requestPayload, HashMap<String, String> globalValuesMap)
			throws JsonParseException, JsonMappingException, IOException {
		CreateMandatePojo createMandatePojo = objectMapper.readValue(requestPayload, CreateMandatePojo.class);
		for (String key : valueMap.keySet()) {

			if (key.equalsIgnoreCase(CHANNEL)) {

				createMandatePojo.setChannel(valueMap.get(key));
			} else if (key.equalsIgnoreCase(PIR)) {
				if (valueMap.get(key).contains(GLOBAL)) {
					createMandatePojo.setPir(globalValuesMap.get(key));
				} else {
					createMandatePojo.setPir(valueMap.get(key));
				}
			} else if (key.equalsIgnoreCase(BUSINESS_REF)) {

				if (valueMap.get(key).contains(GLOBAL)) {

					createMandatePojo.setBusinessRef(globalValuesMap.get(NAME));
				} else {
					createMandatePojo.setBusinessRef(valueMap.get(key));
				}
			}
		}
		return objectMapper.writeValueAsString(createMandatePojo);
	}

}
