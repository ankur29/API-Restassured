package com.api.parentSubscriptionActivatedPojo;

import java.util.LinkedHashMap;
import java.util.Map;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({"id","status","externalCustomerId","partnerCustomerId","activatedDate","marketplaceSubscriptionId"})
public class ParentSubscriptionActivatedPojo {

@JsonProperty("id")
private String id;
@JsonProperty("status")
private String status;
@JsonProperty("externalCustomerId")
private String externalCustomerId;
@JsonProperty("partnerCustomerId")
private String partnerCustomerId;
@JsonProperty("activatedDate")
private String activatedDate;
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

@JsonProperty("activatedDate")
public String getActivatedDate() {
return activatedDate;
}

@JsonProperty("activatedDate")
public void setActivatedDate(String activatedDate) {
this.activatedDate = activatedDate;
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