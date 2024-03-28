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
	"renewalCount",
	"renewalTerm",
})

public class PaymentCycle {

	@JsonProperty("renewalCount")
	private Integer renewalCount;
	@JsonProperty("renewalTerm")
	private String renewalTerm;
	@JsonProperty("renewalRules")
	private RenewalRules renewalRules;
	@JsonIgnore
	private Map<String, Object> additionalProperties = new LinkedHashMap<String, Object>();

	@JsonProperty("renewalCount")
	public Integer getRenewalCount() {
		return renewalCount;
	}

	@JsonProperty("renewalCount")
	public void setRenewalCount(Integer renewalCount) {
		this.renewalCount = renewalCount;
	}

	@JsonProperty("renewalTerm")
	public String getRenewalTerm() {
		return renewalTerm;
	}

	@JsonProperty("renewalTerm")
	public void setRenewalTerm(String renewalTerm) {
		this.renewalTerm = renewalTerm;
	}

	@JsonProperty("renewalRules")
	public void setrenewalRules(RenewalRules renewalRules) {
		this.renewalRules = renewalRules;
	}

	@JsonProperty("renewalRules")
	public RenewalRules getRenewalRules() {
		return renewalRules;
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
