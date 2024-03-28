package com.api.commonLibrary;

import java.io.IOException;
import java.util.Map;
import java.util.Random;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class CommonStep {

	private static final String ALPHANUMERIC_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

	/**
	 * 
	 * @param length
	 * @return
	 */
	public static String generateCode(int length) {
		Random random = new Random();
		StringBuilder code = new StringBuilder();
		for (int i = 0; i < length; i++) {
			int randomIndex = random.nextInt(ALPHANUMERIC_CHARS.length());
			char randomChar = ALPHANUMERIC_CHARS.charAt(randomIndex);
			code.append(randomChar);
		}

		return code.toString();
	}
	public static String generateRandomNumber(int length) {
		Random random = new Random();
		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < length; i++) {
			int digit = random.nextInt(10);
			sb.append(digit);
		}

		return sb.toString();
	}

	public static String convertMaptoJsonString(Map<String, String> headerMap) {


		ObjectMapper objectMapper = new ObjectMapper();
		String headerJson = null;

		try {
			headerJson = objectMapper.writeValueAsString(headerMap);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return headerJson;
	}


	public static String convertIntoString(String jsonFilePath) {
		FileHelper fileHelper = new FileHelper();
		String requestBody = null;
		try {
			requestBody = fileHelper.readFileAsString(jsonFilePath);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return requestBody;

	}
}

