package com.api.commonLibrary;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;

import org.testng.util.Strings;

@SuppressWarnings("serial")
public class JSONSerializer
implements Serializable
{

public JSONSerializer()
{
}

public Object stringToPOJO(String json, Class<?> type)
    throws Exception
{
    if(Strings.isNullOrEmpty(json))
        throw new Exception("Input json is empty or null");
    else
        return jsonMapper.readValue(json, type);
}
static ObjectMapper jsonMapper = new ObjectMapper();

}