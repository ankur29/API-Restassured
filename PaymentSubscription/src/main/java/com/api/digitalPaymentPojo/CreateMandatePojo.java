package com.api.digitalPaymentPojo;
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
	"channel",
	"pir",
	"businessRef"
})
public class CreateMandatePojo {

	@JsonProperty("channel")
	private String channel;
	@JsonProperty("pir")
	private String pir;
	@JsonProperty("businessRef")
	private String businessRef;
	@JsonIgnore
	private Map<String, Object> additionalProperties = new LinkedHashMap<String, Object>();

	@JsonProperty("channel")
	public String getChannel() {
		return channel;
	}

	@JsonProperty("channel")
	public void setChannel(String channel) {
		this.channel = channel;
	}

	@JsonProperty("pir")
	public String getPir() {
		return pir;
	}

	@JsonProperty("pir")
	public void setPir(String pir) {
		this.pir = pir;
	}

	@JsonProperty("businessRef")
	public String getBusinessRef() {
		return businessRef;
	}

	@JsonProperty("businessRef")
	public void setBusinessRef(String businessRef) {
		this.businessRef = businessRef;
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
