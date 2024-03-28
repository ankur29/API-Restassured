package com.api.commonLibrary;

import org.apache.commons.configuration.PropertiesConfiguration;

public class PropertyFileReader {

//	/**
//	 * 
//	 * @throws ConfigurationException
//	 */
//	public void setPropertyValue() throws ConfigurationException {
//
//		PropertiesConfiguration confg = new PropertiesConfiguration(
//				System.getProperty("user.dir") + "src/test/resources/config.properties");
//
//	}

	private static final String USER_DIR = "user.dir";

	/**
	 * 
	 * @param key
	 * @return
	 */
	public static String getPropertyValue(String key) {
		try {
			PropertiesConfiguration conf = new PropertiesConfiguration(
					//					System.getProperty("user.dir") + "/config.properties");
					"config.properties");
			return (String) conf.getProperty(key);
		} catch (Exception e) {
			System.out.println("Error in reading data from property file for key " + key + " from file "
					+ System.getProperty(USER_DIR) + "config.properties" + " Exception: " + e.getMessage());
			return null;
		}
	}

	/**
	 * 
	 * @param key
	 * @param path
	 * @return
	 */
	public static String getPropertyValues(String key, String path) {
		try {
			PropertiesConfiguration conf = new PropertiesConfiguration(System.getProperty(USER_DIR) + path);
			return (String) conf.getProperty(key);
		} catch (Exception e) {
			System.out.println("Error in reading data from property file for key " + key + " from file "
					+ System.getProperty(USER_DIR) + path + " Exception: " + e.getMessage());
			return null;
		}

	}
}
