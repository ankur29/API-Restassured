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
	"glCode",
	"taxCode"
})
public class WholeSale {

	@JsonProperty("glCode")
	private String glCode;
	@JsonProperty("taxCode")
	private String taxCode;
	@JsonIgnore
	private Map<String, Object> additionalProperties = new LinkedHashMap<String, Object>();

	@JsonProperty("glCode")
	public String getGlCode() {
		return glCode;
	}

	@JsonProperty("glCode")
	public void setGlCode(String glCode) {
		this.glCode = glCode;
	}

	@JsonProperty("taxCode")
	public String getTaxCode() {
		return taxCode;
	}

	@JsonProperty("taxCode")
	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
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
