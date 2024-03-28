package com.api.commonLibrary;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
public class FileHelper {

	// Read File and store and return value as String
	public String readFileAsString(String fileName) throws IOException {
		String folderName = fileName.split("/")[0];
		String file = fileName.split("/")[1];
		String filePath = System.getProperty("user.dir") + "/src/test/resources/testData/payload/" + folderName + "/" +PropertyFileReader.getPropertyValue("environment")+ "/" + file;
		
		
		BufferedReader reader = new BufferedReader(new FileReader(filePath));
		StringBuilder stringBuilder = new StringBuilder();
		char[] buffer = new char[10];
		while (reader.read(buffer) != -1) {
			stringBuilder.append(new String(buffer));
			buffer = new char[10];
		}
		reader.close();

		return stringBuilder.toString();

	}

}
