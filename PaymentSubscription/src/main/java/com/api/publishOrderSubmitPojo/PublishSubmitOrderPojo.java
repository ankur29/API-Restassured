package com.api.publishOrderSubmitPojo;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({ "product", "prices", "paymentCycle", "paymentMethod", "orderInfo", "customer", "wholesale",
	"retail", "status", "channel", "customerInfoNeeded", "salesType", "paymentGracePeriod", "brandKey",
"preEnrollmentRequired" })
public class PublishSubmitOrderPojo {

	@JsonProperty("product")
	private Product product;
	
	@JsonProperty("orderInfo")
	private OrderInfo orderInfo;
	@JsonProperty("paymentMethod")
	private PaymentMethod paymentMethod;
	@JsonProperty("prices")
	private List<Price> prices;
	@JsonProperty("customer")
	private Customer customer;
	@JsonProperty("status")
	private String status;
	@JsonProperty("channel")
	private String channel;
	@JsonProperty("customerInfoNeeded")
	private Boolean customerInfoNeeded;
	@JsonProperty("salesType")
	private String salesType;
	@JsonProperty("paymentGracePeriod")
	private Integer paymentGracePeriod;
	@JsonProperty("brandKey")
	private String brandKey;
	@JsonProperty("paymentCycle")
	private PaymentCycle paymentCycle;
	@JsonProperty("preEnrollmentRequired")
	private Boolean preEnrollmentRequired;
	@JsonProperty("wholesale")
	private WholeSale wholesale;
	@JsonProperty("retail")
	private Retail retail;
	@JsonIgnore
	private Map<String, Object> additionalProperties = new LinkedHashMap<String, Object>();

	@JsonProperty("product")
	public Product getProduct() {
		return product;
	}

	@JsonProperty("product")
	public void setProduct(Product product) {
		this.product = product;
	}

	@JsonProperty("orderInfo")
	public OrderInfo getOrderInfo() {
		return orderInfo;
	}

	@JsonProperty("orderInfo")
	public void setOrderInfo(OrderInfo orderInfo) {
		this.orderInfo = orderInfo;
	}

	@JsonProperty("paymentMethod")
	public PaymentMethod getPaymentMethod() {
		return paymentMethod;
	}

	@JsonProperty("paymentMethod")
	public void setPaymentMethod(PaymentMethod paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	@JsonProperty("customer")
	public Customer getCustomer() {
		return customer;
	}

	@JsonProperty("customer")
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@JsonProperty("status")
	public String getStatus() {
		return status;
	}

	@JsonProperty("status")
	public void setStatus(String status) {
		this.status = status;
	}
	@JsonProperty("channel")
	public String getChannel() {
		return channel;
	}

	@JsonProperty("channel")
	public void setChannel(String channel) {
		this.channel = channel;
	}

	@JsonProperty("customerInfoNeeded")
	public Boolean getCustomerInfoNeeded() {
		return customerInfoNeeded;
	}

	@JsonProperty("customerInfoNeeded")
	public void setCustomerInfoNeeded(Boolean customerInfoNeeded) {
		this.customerInfoNeeded = customerInfoNeeded;
	}

	@JsonProperty("salesType")
	public String getSalesType() {
		return salesType;
	}

	@JsonProperty("salesType")
	public void setSalesType(String salesType) {
		this.salesType = salesType;
	}

	@JsonProperty("paymentCycle")
	public PaymentCycle getPaymentCycle() {
		return paymentCycle;
	}

	@JsonProperty("paymentCycle")
	public void setPaymentCycle(PaymentCycle paymentCycle) {
		this.paymentCycle = paymentCycle;
	}
	@JsonProperty("prices")
	public List<Price> getPrices() {
	return prices;
	}

	@JsonProperty("prices")
	public void setPrices(List<Price> prices) {
	this.prices = prices;
	}

	@JsonProperty("paymentGracePeriod")
	public Integer getPaymentGracePeriod() {
		return paymentGracePeriod;
	}

	@JsonProperty("paymentGracePeriod")
	public void setPaymentGracePeriod(Integer paymentGracePeriod) {
		this.paymentGracePeriod = paymentGracePeriod;
	}

	@JsonProperty("brandKey")
	public String getBrandKey() {
		return brandKey;
	}

	@JsonProperty("brandKey")
	public void setBrandKey(String brandKey) {
		this.brandKey = brandKey;
	}

	@JsonProperty("preEnrollmentRequired")
	public Boolean getPreEnrollmentRequired() {
		return preEnrollmentRequired;
	}

	@JsonProperty("preEnrollmentRequired")
	public void setPreEnrollmentRequired(Boolean preEnrollmentRequired) {
		this.preEnrollmentRequired = preEnrollmentRequired;
	}


	@JsonProperty("wholesale")
	public WholeSale getwholesale() {
		return wholesale;
	}

	@JsonProperty("wholesale")
	public void setWholesale(WholeSale wholesale) {
		this.wholesale = wholesale;
	}


	@JsonProperty("retail")
	public Retail getretail() {
		return retail;
	}

	@JsonProperty("retail")
	public void setRetail(Retail retail) {
		this.retail = retail;
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
