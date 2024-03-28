package com.api.businessLibrary;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.api.commonLibrary.CommonStep;
import com.api.publishOrderSubmitPojo.Customer;
import com.api.publishOrderSubmitPojo.OrderInfo;
import com.api.publishOrderSubmitPojo.Partner;
import com.api.publishOrderSubmitPojo.PaymentCycle;
import com.api.publishOrderSubmitPojo.PaymentMethod;
import com.api.publishOrderSubmitPojo.Price;
import com.api.publishOrderSubmitPojo.Product;
import com.api.publishOrderSubmitPojo.PublishSubmitOrderPojo;
import com.api.publishOrderSubmitPojo.RenewalRules;
import com.api.publishOrderSubmitPojo.Retail;
import com.api.publishOrderSubmitPojo.WholeSale;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class PublishOrderSubmit {

	private static final String PRICE_END = "price_end";
	private static final String PRICE_START = "price_start";
	private static final String PRICE_CURRENCY = "price_currency";
	private static final String PRICE_WHOLESALE_COST = "price_wholesaleCost";
	private static final String PRICE_RETAIL_COST = "price_retailCost";
	private static final String PRICES = "prices";
	private static final String RENEWAL_RULES_DESCRIPTION = "renewalRules_description";
	private static final String RENEWAL_RULES_ID = "renewalRules_id";
	private static final String CUSTOMER_ID = "customer_id";
	private static final String CUSTOMER = "customer";
	private static final String PRODUCT_PARTNER_KEY = "product_partner_key";
	private static final String PRODUCT_PARTNER_NAME = "product_partner_name";
	private static final String PRODUCT_PARTNER_ID = "product_partner_id";
	private static final String PRODUCT_PARTNER = "product_partner";
	private static final String PRODUCT_IMAGE_URL = "product_imageUrl";
	private static final String PRODUCT_DESC = "product_desc";
	private static final String PRODUCT_SKU = "product_sku";
	private static final String PRODUCT_NAME = "product_name";
	private static final String PRODUCT_ID = "product_id";
	private static final String PRODUCT = "product";
	private static final String RETAIL = "retail";
	private static final String WHOLESALE = "wholesale";
	private static final String ORDER_INFO_STATUS = "OrderInfo_status";
	private static final String ORDER_NUMBER = "orderNumber";
	private static final String SAME = "same";
	private static final String ORDER_INFO_ORDER_NUMBER = "OrderInfo_orderNumber";
	private static final String ORDER_INFO_CREATED_AT = "OrderInfo_createdAt";
	private static final String ORDER_INFO_CHANNEL = "OrderInfo_channel";
	private static final String ORDER_INFO = "orderInfo";
	private static final String PAYMENT_CYCLE = "PaymentCycle";
	private static final String PAYMENT_METHOD = "PaymentMethod";
	private static final String TYPE = "type";
	private static final String PIR = "pir";
	private static final String TAX_CODE = "taxCode";
	private static final String GL_CODE = "glCode";
	private static final String RENEWAL_RULES = "renewalRules";
	private static final String RENEWAL_COUNT = "renewalCount";
	private static final String RENEWAL_TERM = "renewalTerm";
	private static final String PRE_ENROLLMENT_REQUIRED = "preEnrollmentRequired";
	private static final String BRAND_KEY = "brandKey";
	private static final String PAYMENT_GRACE_PERIOD = "paymentGracePeriod";
	private static final String CUSTOMER_INFO_NEEDED = "customerInfoNeeded";
	private static final String STATUS = "status";
	private static final String SALES_TYPE = "salesType";
	private static final String NULL = "null";
	private static final String CHANNEL = "channel";

	/**
	 * 
	 * @param valueMap
	 * @param objectMapper
	 * @param requestPayload
	 * @param globalValuesMap
	 * @return
	 * @throws IOException
	 * @throws JsonParseException
	 * @throws JsonMappingException
	 * @throws JsonProcessingException
	 */
	public String preparePublishOrderSubmitRequest(Map<String, String> valueMap, ObjectMapper objectMapper,
			String requestPayload, HashMap<String, String> globalValuesMap)
					throws IOException, JsonParseException, JsonMappingException, JsonProcessingException {
		PublishSubmitOrderPojo publishSubmitOrderPojo = objectMapper.readValue(requestPayload,PublishSubmitOrderPojo.class);
		boolean isPaymentMethodPresent = true;
		boolean isOrderInfoPresent = true;
		boolean isProductPresent = true;
		boolean isCustomerPresent =true;
		for (String key : valueMap.keySet()) {
			if (key.equalsIgnoreCase(CHANNEL)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					publishSubmitOrderPojo.setChannel(null);
				} else {
					publishSubmitOrderPojo.setChannel(valueMap.get(key));
				}
			}
			if (key.equalsIgnoreCase(SALES_TYPE)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					publishSubmitOrderPojo.setSalesType(null);
				}else{
					publishSubmitOrderPojo.setSalesType(valueMap.get(key));
				}
			}
			if (key.equalsIgnoreCase(STATUS)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					publishSubmitOrderPojo.setStatus(null);
				}else {
					publishSubmitOrderPojo.setStatus(valueMap.get(key));
				}
			}
			if (key.equalsIgnoreCase(CUSTOMER_INFO_NEEDED)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					publishSubmitOrderPojo.setCustomerInfoNeeded(null);
				}
			}
			if (key.equalsIgnoreCase(PAYMENT_GRACE_PERIOD)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					publishSubmitOrderPojo.setPaymentGracePeriod(null);
				}
			}
			if (key.equalsIgnoreCase(BRAND_KEY)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					publishSubmitOrderPojo.setBrandKey(null);
				}
			}
			if (key.equalsIgnoreCase(PRE_ENROLLMENT_REQUIRED)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					publishSubmitOrderPojo.setPreEnrollmentRequired(null);
				}
			}
			if (key.equalsIgnoreCase(RENEWAL_TERM)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					PaymentCycle paymentCycle = publishSubmitOrderPojo.getPaymentCycle();
					paymentCycle.setRenewalTerm(null);
				} else {
					PaymentCycle paymentCycle = publishSubmitOrderPojo.getPaymentCycle();
					paymentCycle.setRenewalTerm(valueMap.get(key));
				}
			}
			if (key.equalsIgnoreCase(RENEWAL_COUNT)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					PaymentCycle paymentCycle = publishSubmitOrderPojo.getPaymentCycle();
					paymentCycle.setRenewalCount(null);
				} else {
					PaymentCycle paymentCycle = publishSubmitOrderPojo.getPaymentCycle();
					paymentCycle.setRenewalCount(Integer.valueOf(valueMap.get(key)));
				}
			}

			if (key.equalsIgnoreCase(RENEWAL_RULES)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					PaymentCycle paymentCycle = publishSubmitOrderPojo.getPaymentCycle();
					paymentCycle.setrenewalRules(null);
				}
			}
			if(key.equalsIgnoreCase(GL_CODE)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					WholeSale wholesalecost =publishSubmitOrderPojo.getwholesale();
					wholesalecost.setGlCode(null);
				}
			}
			if(key.equalsIgnoreCase(TAX_CODE)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					WholeSale wholesalecost =publishSubmitOrderPojo.getwholesale();
					wholesalecost.setTaxCode(null);
				}
			}
			if(key.equalsIgnoreCase(GL_CODE)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					Retail retailCost =publishSubmitOrderPojo.getretail();
					retailCost.setGlCode(null);
				}
			}
			if(key.equalsIgnoreCase(TAX_CODE)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					Retail retailCost =publishSubmitOrderPojo.getretail();
					retailCost.setTaxCode(null);
				}
			}
			if (key.equalsIgnoreCase(PIR)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					PaymentMethod paymentMethod = publishSubmitOrderPojo.getPaymentMethod();
					paymentMethod.setPir(valueMap.get(null));
				} else {
					PaymentMethod paymentMethod = publishSubmitOrderPojo.getPaymentMethod();
					paymentMethod.setPir(valueMap.get(key));
				}
			}
			if (key.equalsIgnoreCase(TYPE)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					PaymentMethod paymentMethod = publishSubmitOrderPojo.getPaymentMethod();
					paymentMethod.setType(valueMap.get(null));
				} else {
					PaymentMethod paymentMethod = publishSubmitOrderPojo.getPaymentMethod();
					paymentMethod.setType(valueMap.get(key));
				}
			}
			if (key.equalsIgnoreCase(PAYMENT_METHOD)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					isPaymentMethodPresent = false;
					publishSubmitOrderPojo.setPaymentMethod(null);
				}
			}
			if (key.equalsIgnoreCase(PAYMENT_CYCLE)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					isPaymentMethodPresent = false;
					publishSubmitOrderPojo.setPaymentCycle(null);
				}
			}

			if (key.equalsIgnoreCase(ORDER_INFO)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					isOrderInfoPresent = false;
					publishSubmitOrderPojo.setOrderInfo(null);
				}
			}
			if (key.equalsIgnoreCase(ORDER_INFO_CHANNEL)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					isOrderInfoPresent = false;
					OrderInfo orderinfo =publishSubmitOrderPojo.getOrderInfo();
					orderinfo.setChannel(null);
				}
			}
			if (key.equalsIgnoreCase(ORDER_INFO_CREATED_AT)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					isOrderInfoPresent = false;
					OrderInfo orderinfo =publishSubmitOrderPojo.getOrderInfo();
					orderinfo.setCreatedAt(null);
				}
			}
			if (key.equalsIgnoreCase(ORDER_INFO_ORDER_NUMBER)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					isOrderInfoPresent = false;
					OrderInfo orderinfo =publishSubmitOrderPojo.getOrderInfo();
					orderinfo.setOrderNumber(null);
				}if(valueMap.get(key).equalsIgnoreCase(SAME)){
					isOrderInfoPresent = false;
					OrderInfo orderinfo = publishSubmitOrderPojo.getOrderInfo();
					orderinfo.setOrderNumber(globalValuesMap.get(ORDER_NUMBER));
				}
			}
			if (key.equalsIgnoreCase(ORDER_INFO_STATUS)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					isOrderInfoPresent = false;
					OrderInfo orderinfo =publishSubmitOrderPojo.getOrderInfo();
					orderinfo.setStatus(null);
				}
			}
			if (key.equalsIgnoreCase(WHOLESALE)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					publishSubmitOrderPojo.setWholesale(null);
				}
			}

			if (key.equalsIgnoreCase(RETAIL)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					publishSubmitOrderPojo.setRetail(null);
				}
			}
			if (key.equalsIgnoreCase(PRODUCT)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					isProductPresent = false;
					publishSubmitOrderPojo.setProduct(null);
				}
			}
			if (key.equalsIgnoreCase(PRODUCT_ID)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					isProductPresent = false;
					Product product =publishSubmitOrderPojo.getProduct();
					product.setId(null);
				}
			}
			if (key.equalsIgnoreCase(PRODUCT_NAME)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					isProductPresent = false;
					Product product =publishSubmitOrderPojo.getProduct();
					product.setName(null);
				}
			}
			if (key.equalsIgnoreCase(PRODUCT_SKU)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					isProductPresent = false;
					Product product =publishSubmitOrderPojo.getProduct();
					product.setSku(null);
				}
			}
			if (key.equalsIgnoreCase(PRODUCT_DESC)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					isProductPresent = false;
					Product product =publishSubmitOrderPojo.getProduct();
					product.setDesc(null);
				}
			}
			if (key.equalsIgnoreCase(PRODUCT_IMAGE_URL)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					isProductPresent = false;
					Product product =publishSubmitOrderPojo.getProduct();
					product.setImageUrl(null);
				}
			}
			if (key.equalsIgnoreCase(PRODUCT_PARTNER)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					isProductPresent = false;
					Product product =publishSubmitOrderPojo.getProduct();
					product.setPartner(null);
				}
			}
			if (key.equalsIgnoreCase(PRODUCT_PARTNER_ID)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					Product product =publishSubmitOrderPojo.getProduct();
					Partner partner = product.getPartner();
					partner.setId(null);
				}
			}
			if (key.equalsIgnoreCase(PRODUCT_PARTNER_NAME)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					Product product =publishSubmitOrderPojo.getProduct();
					Partner partner = product.getPartner();
					partner.setName(null);
				}
			}
			if (key.equalsIgnoreCase(PRODUCT_PARTNER_KEY)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					Product product =publishSubmitOrderPojo.getProduct();
					Partner partner = product.getPartner();
					partner.setKey(null);
				}
			}
			if (key.equalsIgnoreCase(CUSTOMER)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					isCustomerPresent = false;
					publishSubmitOrderPojo.setCustomer(null);
				}
			}

			if (key.equalsIgnoreCase(CUSTOMER_ID)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					isCustomerPresent = false;
					Customer customer =publishSubmitOrderPojo.getCustomer();
					customer.setId(null);
				}if(valueMap.get(key).equalsIgnoreCase(SAME)){
					isCustomerPresent = false;
					Customer customer =publishSubmitOrderPojo.getCustomer();
					customer.setId(globalValuesMap.get("customerId"));
				}
			}
			if (key.equalsIgnoreCase(RENEWAL_RULES_ID)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					PaymentCycle paymentCycle = publishSubmitOrderPojo.getPaymentCycle();
					RenewalRules renewalRules = paymentCycle.getRenewalRules();
					renewalRules.setId(null);
				}
			}
			if (key.equalsIgnoreCase(RENEWAL_RULES_DESCRIPTION)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					PaymentCycle paymentCycle = publishSubmitOrderPojo.getPaymentCycle();
					RenewalRules renewalRules = paymentCycle.getRenewalRules();
					renewalRules.setDescription(null);
				}
			}
			if (key.equalsIgnoreCase(PRICES)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					List<Price> prices =publishSubmitOrderPojo.getPrices();
					System.out.println(prices.get(0).getCurrency());
					publishSubmitOrderPojo.setPrices(null);
				}
			}
			if (key.equalsIgnoreCase(PRICE_RETAIL_COST)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					List<Price> prices =publishSubmitOrderPojo.getPrices();
					prices.get(0).setRetailCost(null);
				}
			}
			if (key.equalsIgnoreCase(PRICE_WHOLESALE_COST)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					List<Price> prices =publishSubmitOrderPojo.getPrices();
					prices.get(0).setWholesaleCost(null);
				}
			}
			if (key.equalsIgnoreCase(PRICE_CURRENCY)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					List<Price> prices =publishSubmitOrderPojo.getPrices();
					prices.get(0).setCurrency(null);
				}
			}
			if (key.equalsIgnoreCase(PRICE_START)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					List<Price> prices =publishSubmitOrderPojo.getPrices();
					prices.get(0).setStart(null);
				} else {
					List<Price> prices =publishSubmitOrderPojo.getPrices();
					prices.get(0).setStart(valueMap.get(key));
				}
			}
			if (key.equalsIgnoreCase(PRICE_END)) {
				if (valueMap.get(key).equalsIgnoreCase(NULL)) {
					List<Price> prices =publishSubmitOrderPojo.getPrices();
					prices.get(0).setEnd(null);
				} else {
					List<Price> prices =publishSubmitOrderPojo.getPrices();
					prices.get(0).setEnd(valueMap.get(key));
				}
			}
		}
		// Set Customer ID
		if(isCustomerPresent) {

			Customer customer = publishSubmitOrderPojo.getCustomer();
			globalValuesMap.put("customerId",CommonStep.generateRandomNumber(5));
			customer.setId(globalValuesMap.get("customerId"));
			publishSubmitOrderPojo.setCustomer(customer);
			System.out.println("Customer ID:- " +globalValuesMap.get("customerId"));
		}
		// set Order ID
		if(isOrderInfoPresent)
		{
			OrderInfo orderInfo = publishSubmitOrderPojo.getOrderInfo();
			globalValuesMap.put(ORDER_NUMBER,"EE" + "-" + CommonStep.generateRandomNumber(8));
			orderInfo.setOrderNumber(globalValuesMap.get(ORDER_NUMBER));
			publishSubmitOrderPojo.setOrderInfo(orderInfo);
			System.out.println("Order ID:- " +orderInfo.getOrderNumber());
		}

		// set pir
		if(isPaymentMethodPresent)
		{
			PaymentMethod paymentMethod = publishSubmitOrderPojo.getPaymentMethod();
			globalValuesMap.put(PIR, paymentMethod.getPir());
		}

		// set productName
		if(isProductPresent)
		{
			Product product = publishSubmitOrderPojo.getProduct();
			globalValuesMap.put("name",product.getName());
			globalValuesMap.put("productid", product.getId());
		}
		return objectMapper.writeValueAsString(publishSubmitOrderPojo);

	}
}
