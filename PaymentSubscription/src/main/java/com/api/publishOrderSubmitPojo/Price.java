package com.api.publishOrderSubmitPojo;

import java.util.LinkedHashMap;
import java.util.Map;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
"retailCost",
"wholesaleCost",
"currency",
"start",
"end"
})
public class Price {

@JsonProperty("retailCost")
private String retailCost;
@JsonProperty("wholesaleCost")
private String wholesaleCost;
@JsonProperty("currency")
private String currency;
@JsonProperty("start")
private String start;
@JsonProperty("end")
private String end;
@JsonIgnore
private Map<String, Object> additionalProperties = new LinkedHashMap<String, Object>();

@JsonProperty("retailCost")
public String getRetailCost() {
return retailCost;
}

@JsonProperty("retailCost")
public Price setRetailCost(String retailCost) {
this.retailCost = retailCost;
return null;
}

@JsonProperty("wholesaleCost")
public String getWholesaleCost() {
return wholesaleCost;
}

@JsonProperty("wholesaleCost")
public void setWholesaleCost(String wholesaleCost) {
this.wholesaleCost = wholesaleCost;
}

@JsonProperty("currency")
public String getCurrency() {
return currency;
}

@JsonProperty("currency")
public void setCurrency(String currency) {
this.currency = currency;
}

@JsonProperty("start")
public String getStart() {
return start;
}

@JsonProperty("start")
public void setStart(String start) {
this.start = start;
}

@JsonProperty("end")
public String getEnd() {
return end;
}

@JsonProperty("end")
public void setEnd(String end) {
this.end = end;
}

@JsonAnyGetter
public Map<String, Object> getAdditionalProperties() {
return this.additionalProperties;
}

@JsonAnySetter
public void setAdditionalProperty(String name, Object value) {
this.additionalProperties.put(name, value);
}

}