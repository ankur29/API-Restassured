package com.api.parentSubscriptionCreatedPojo;

import java.util.LinkedHashMap;
import java.util.Map;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({"id","status","activationUrl","externalCustomerId","partnerCustomerId","createdDate","marketplaceSubscriptionId"})
public class ParentSubscriptionCreatedPojo {

@JsonProperty("id")
private String id;
@JsonProperty("status")
private String status;
@JsonProperty("activationUrl")
private String activationUrl;
@JsonProperty("externalCustomerId")
private String externalCustomerId;
@JsonProperty("partnerCustomerId")
private String partnerCustomerId;
@JsonProperty("createdDate")
private String createdDate;
@JsonProperty("marketplaceSubscriptionId")
private String marketplaceSubscriptionId;
@JsonIgnore
private Map<String, Object> additionalProperties = new LinkedHashMap<String, Object>();

@JsonProperty("id")
public String getId() {
return id;
}

@JsonProperty("id")
public void setId(String id) {
this.id = id;
}

@JsonProperty("status")
public String getStatus() {
return status;
}

@JsonProperty("status")
public void setStatus(String status) {
this.status = status;
}

@JsonProperty("activationUrl")
public String getActivationUrl() {
return activationUrl;
}

@JsonProperty("activationUrl")
public void setActivationUrl(String activationUrl) {
this.activationUrl = activationUrl;
}

@JsonProperty("externalCustomerId")
public String getExternalCustomerId() {
return externalCustomerId;
}

@JsonProperty("externalCustomerId")
public void setExternalCustomerId(String externalCustomerId) {
this.externalCustomerId = externalCustomerId;
}

@JsonProperty("partnerCustomerId")
public String getPartnerCustomerId() {
return partnerCustomerId;
}

@JsonProperty("partnerCustomerId")
public void setPartnerCustomerId(String partnerCustomerId) {
this.partnerCustomerId = partnerCustomerId;
}

@JsonProperty("createdDate")
public String getCreatedDate() {
return createdDate;
}

@JsonProperty("createdDate")
public void setCreatedDate(String createdDate) {
this.createdDate = createdDate;
}

@JsonProperty("marketplaceSubscriptionId")
public String getMarketplaceSubscriptionId() {
return marketplaceSubscriptionId;
}

@JsonProperty("marketplaceSubscriptionId")
public void setMarketplaceSubscriptionId(String marketplaceSubscriptionId) {
this.marketplaceSubscriptionId = marketplaceSubscriptionId;
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
