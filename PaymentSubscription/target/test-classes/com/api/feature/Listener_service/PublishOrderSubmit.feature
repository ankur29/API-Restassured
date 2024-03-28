@Subscription @listenerservice @Regression
Feature: Publish Order Submit Listener Service

  @ECOMP-12404 @Test1 @positive @publishOrderSubmit
  Scenario: User should be able to Create Subscription by giving "APP" value in channel and "PRINCIPAL" in salesType.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | channel | salesType |
      | APP     | PRINCIPAL |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I Prepare the request Body with "digitalPaymentService/createMandate.json" with given values:
      | channel | pir    | businessRef |
      | APP     | global | global      |
    When I prepare the headers with given values:
      | Content-Type     | APIGW-Tracking-Header |
      | application/json | aaa                   |
    Then I execute the POST request service "digital_payment_mandate" with endpoint "/digital-payments/v1/create-mandate"
    And Verify that Response should not be empty
    And Verify Response code should be 201
    And Set the value of "mprn"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id              | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  #| INITIAL | orderId     | orderId        | KAFKA publish SUCCESS,subscription-order-submitted,e2e1 |
  @ECOMP-13640 @Test2 @positive @publishOrderSubmit
  Scenario: User should be able to Create Subscription by giving "APP" value in channel and "AGENT" in salesType.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | channel | salesType |
      | APP     | AGENT     |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I Prepare the request Body with "digitalPaymentService/createMandate.json" with given values:
      | channel | pir    | businessRef |
      | APP     | global | global      |
    When I prepare the headers with given values:
      | Content-Type     | APIGW-Tracking-Header |
      | application/json | aaa                   |
    Then I execute the POST request service "digital_payment_mandate" with endpoint "/digital-payments/v1/create-mandate"
    And Verify that Response should not be empty
    And Verify Response code should be 201
    And Set the value of "mprn"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    And Verify the "mprn=data.paymentMethod.paymentInstrument.metadata.mprn" value in response
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  #| INITIAL | orderId     | orderId        | KAFKA publish SUCCESS,subscription-order-submitted,e2e1 |
  @ECOMP-13641 @Test3 @positive @publishOrderSubmit
  Scenario: User should be able to Create Subscription by giving "WEB" value in channel and "AGENT" in salesType.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | channel | salesType |
      | WEB     | AGENT     |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I Prepare the request Body with "digitalPaymentService/createMandate.json" with given values:
      | channel | pir    | businessRef |
      | APP     | global | global      |
    When I prepare the headers with given values:
      | Content-Type     | APIGW-Tracking-Header |
      | application/json | aaa                   |
    Then I execute the POST request service "digital_payment_mandate" with endpoint "/digital-payments/v1/create-mandate"
    And Verify that Response should not be empty
    And Verify Response code should be 201
    And Set the value of "mprn"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  #| INITIAL | orderId     | orderId        | KAFKA publish SUCCESS,subscription-order-submitted,e2e1 |
  @ECOMP-13644 @Test4 @positive @publishOrderSubmit
  Scenario: User should be able to Create Subscription by giving "WEB" value in channel and "PRINCIPAL" in salesType.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | channel | salesType |
      | WEB     | PRINCIPAL |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I Prepare the request Body with "digitalPaymentService/createMandate.json" with given values:
      | channel | pir    | businessRef |
      | APP     | global | global      |
    When I prepare the headers with given values:
      | Content-Type     | APIGW-Tracking-Header |
      | application/json | aaa                   |
    Then I execute the POST request service "digital_payment_mandate" with endpoint "/digital-payments/v1/create-mandate"
    And Verify that Response should not be empty
    And Verify Response code should be 201
    And Set the value of "mprn"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  #| INITIAL | orderId     | orderId        | KAFKA publish SUCCESS,subscription-order-submitted,e2e1 |
  @ECOMP-13645 @Test5 @positive @publishOrderSubmit
  Scenario: User should be able to Create Subscription by giving "DAILY" value in renewalTerm.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | renewalTerm |
      | DAILY       |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I Prepare the request Body with "digitalPaymentService/createMandate.json" with given values:
      | channel | pir    | businessRef |
      | APP     | global | global      |
    When I prepare the headers with given values:
      | Content-Type     | APIGW-Tracking-Header |
      | application/json | aaa                   |
    Then I execute the POST request service "digital_payment_mandate" with endpoint "/digital-payments/v1/create-mandate"
    And Verify that Response should not be empty
    And Verify Response code should be 201
    And Set the value of "mprn"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  #| INITIAL | orderId     | orderId        | KAFKA publish SUCCESS,subscription-order-submitted,e2e1 |
  @ECOMP-13646 @Test6 @positive @publishOrderSubmit
  Scenario: User should be able to Create Subscription by giving "WEEKLY" value in renewalTerm.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | renewalTerm |
      | WEEKLY      |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I Prepare the request Body with "digitalPaymentService/createMandate.json" with given values:
      | channel | pir    | businessRef |
      | APP     | global | global      |
    When I prepare the headers with given values:
      | Content-Type     | APIGW-Tracking-Header |
      | application/json | aaa                   |
    Then I execute the POST request service "digital_payment_mandate" with endpoint "/digital-payments/v1/create-mandate"
    And Verify that Response should not be empty
    And Verify Response code should be 201
    And Set the value of "mprn"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  #| INITIAL | orderId     | orderId        | KAFKA publish SUCCESS,subscription-order-submitted,e2e1 |
  @ECOMP-13647 @Test7 @positive @publishOrderSubmit
  Scenario: User should be able to Create Subscription by giving "MONTHLY" value in renewalTerm.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | renewalTerm |
      | MONTHLY     |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I Prepare the request Body with "digitalPaymentService/createMandate.json" with given values:
      | channel | pir    | businessRef |
      | APP     | global | global      |
    When I prepare the headers with given values:
      | Content-Type     | APIGW-Tracking-Header |
      | application/json | aaa                   |
    Then I execute the POST request service "digital_payment_mandate" with endpoint "/digital-payments/v1/create-mandate"
    And Verify that Response should not be empty
    And Verify Response code should be 201
    And Set the value of "mprn"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  #| INITIAL | orderId     | orderId        | KAFKA publish SUCCESS,subscription-order-submitted,e2e1 |
  @ECOMP-13648 @Test8 @positive @publishOrderSubmit
  Scenario: User should be able to Create Subscription by giving "YEARLY" value in renewalTerm.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | renewalTerm |
      | YEARLY      |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I Prepare the request Body with "digitalPaymentService/createMandate.json" with given values:
      | channel | pir    | businessRef |
      | APP     | global | global      |
    When I prepare the headers with given values:
      | Content-Type     | APIGW-Tracking-Header |
      | application/json | aaa                   |
    Then I execute the POST request service "digital_payment_mandate" with endpoint "/digital-payments/v1/create-mandate"
    And Verify that Response should not be empty
    And Verify Response code should be 201
    And Set the value of "mprn"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  #| INITIAL | orderId     | orderId        | KAFKA publish SUCCESS,subscription-order-submitted,e2e1 |
  @ECOMP-13649 @Test9 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription by giving "abcd" value in renewalTerm.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | renewalTerm |
      | abcd        |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 400
    #And Verify Response should be "$.paymentCycle.renewalTerm: does not have a value in the enumeration [DAILY, WEEKLY, MONTHLY, YEARLY],"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13650 @Test10 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription by giving "12345" value in renewalTerm.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | renewalTerm |
      |       12345 |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 400
    #And Verify Response should be "$.paymentCycle.renewalTerm: does not have a value in the enumeration [DAILY, WEEKLY, MONTHLY, YEARLY],"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13651 @Test11 @negative @publishOrderSubmit
  Scenario: User should not be able to create Subscription by giving "12345678" value in renewalCount.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | renewalCount |
      |     12345678 |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  #| INITIAL | orderId     | orderId        | KAFKA publish SUCCESS,subscription-order-submitted |
  #@Test12 @negative @unableToTest
  #Scenario: User should not be able to create Subscription by giving "12345678901" value in renewalCount.
  #Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
  #| renewalCount |
  #|  12345678901 |
  #When I prepare the headers with given values:
  #| Content-Type     |
  #| application/json |
  #Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
  #And Verify Response code should be 200
  #When I prepare the headers with given values:
  #| Content-Type     | x-api-key                                | Client-Id     | Correlation-Id                      | Request-Id                          |
  #| application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
  #Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
  #And Verify Response code should be 200
  #And Verify Response should be "data=[]"
  #Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
  #And Verify Response code should be 200
  #And Verify Response should be "subscriptionStatuses=[]"
  @ECOMP-13654 @Test13 @negative @publishOrderSubmit
  Scenario: "User should not be able to Create Subscription by giving "initial" value in status, "qwerty" value in channel
    and "qwerty" value in salesType objects.

    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | status  | channel | salesType |
      | initial | qwerty  | qwerty    |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 400
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13656 @Test14 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription by giving "initial" in status object.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | status  |
      | initial |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    #And Verify Response should be "$.status: does not have a value in the enumeration [INITIAL],"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  @ECOMP-13657 @Test15 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription by giving "qewrty" in pir and "1233456" in type in paymentMethod object.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | pir    | type    |
      | qewrty | 1233456 |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13658 @Test16 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription by giving "12345" in pir and "qwerty" in type in paymentMethod object.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | pir  | type |
      | abcd | 1234 |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13660 @Test17 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without paymentMethod object.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | paymentMethod |
      | null          |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify Response should be "$.paymentMethod: is missing but it is required,"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13661 @Test18 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without paymentCycle object.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | paymentCycle |
      | null         |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify Response should be "$.paymentCycle: is missing but it is required,"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13663 @Test19 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without required fields in paymentCycle object.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | renewalCount | renewalTerm | renewalRules |
      | null         | null        | null         |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify Response should be "$.paymentCycle.renewalCount: is missing but it is required,"
    And Verify Response should be "$.paymentCycle.renewalTerm: is missing but it is required,"
    #And Verify Response should be "$.paymentCycle.renewalRules: is missing but it is required,"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13664 @Test20 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without required fields in paymentMethod object.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | pir  | type |
      | null | null |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify Response should be "$.paymentMethod.pir: is missing but it is required,"
    And Verify Response should be "$.paymentMethod.type: is missing but it is required,"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13665 @Test21 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without orderInfo object
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | orderInfo |
      | null      |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify Response should be "$.orderInfo: is missing but it is required,"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13666 @Test22 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without required fields in orderInfo object.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | OrderInfo_channel | OrderInfo_createdAt | OrderInfo_orderNumber | OrderInfo_status |
      | null              | null                | null                  | null             |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify Response should be "$.orderInfo.channel: is missing but it is required,"
    And Verify Response should be "$.orderInfo.createdAt: is missing but it is required,"
    And Verify Response should be "$.orderInfo.orderNumber: is missing but it is required,"
    And Verify Response should be "$.orderInfo.status: is missing but it is required,"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13667 @Test23 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without wholesale and retail objects.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | wholesale | retail |
      | null      | null   |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify Response should be "$.wholesale: is missing but it is required,"
    And Verify Response should be "$.retail: is missing but it is required,"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13668 @Test24 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without required fields in wholesale and retail objects.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | glCode | taxCode |
      | null   | null    |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify Response should be "$.wholesale.glCode: is missing but it is required,"
    And Verify Response should be "$.wholesale.taxCode: is missing but it is required,"
    And Verify Response should be "$.retail.glCode: is missing but it is required,"
    And Verify Response should be "$.retail.taxCode: is missing but it is required,"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13670 @Test25 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without product objects.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | product |
      | null    |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify Response should be "$.product: is missing but it is required,"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13671 @Test26 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without required fields product objects.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | product_id | product_name | product_sku | product_desc | product_imageUrl | product_partner |
      | null       | null         | null        | null         | null             | null            |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify Response should be "$.product.id: is missing but it is required,"
    And Verify Response should be "$.product.name: is missing but it is required,"
    And Verify Response should be "$.product.partner: is missing but it is required,"
    And Verify Response should be "$.product.sku: is missing but it is required,"
    And Verify Response should be "$.product.desc: is missing but it is required,"
    #And Verify Response should be "$.product.imageUrl: is missing but it is required,"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13672 @Test27 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without product-partner objects.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | product_partner |
      | null            |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify Response should be "$.product.partner: is missing but it is required,"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13673 @Test28 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without required fields in product-partner objects.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | product_partner_id | product_partner_name | product_partner_key |
      | null               | null                 | null                |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify Response should be "$.product.partner.id: is missing but it is required,"
    And Verify Response should be "$.product.partner.key: is missing but it is required,"
    And Verify Response should be "$.product.partner.name: is missing but it is required,"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13674 @Test29 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without paymentCycle renewalRules objects.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | renewalRules |
      | null         |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13675 @Test30 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without required fields in paymentCycle renewalRules objects.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | renewalRules_id | renewalRules_description |
      | null            | null                     |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify Response should be "$.paymentCycle.renewalRules.description: is missing but it is required,"
    And Verify Response should be "$.paymentCycle.renewalRules.id: is missing but it is required,"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13676 @Test31 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without Customer object.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | customer |
      | null     |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify Response should be "$.customer: is missing but it is required,"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13677 @Test32 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without required fields in Customer object.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | customer_id |
      | null        |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify Response should be "$.customer.id: is missing but it is required,"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13678 @Test33 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without prices object.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | prices |
      | null   |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13679 @Test34 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without required fields in prices objects.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | price_retailCost | price_wholesaleCost | price_currency | price_start | price_end |
      | null             | null                | null           | null        | null      |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13680 @Test35 @negative @publishOrderSubmit
  Scenario: User should not be able to Create Subscription without below objects respectively.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | status | channel | customerInfoNeeded | salesType | paymentGracePeriod | brandKey | preEnrollmentRequired |
      | null   | null    | null               | null      | null               | null     | null                  |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify Response should be "$.channel: is missing but it is required,"
    And Verify Response should be "$.status: is missing but it is required,"
    And Verify Response should be "$.paymentGracePeriod: is missing but it is required,"
    And Verify Response should be "$.brandKey: is missing but it is required,"
    And Verify Response should be "$.customerInfoNeeded: is missing but it is required,"
    And Verify Response should be "$.salesType: is missing but it is required,"
    And Verify Response should be "$.preEnrollmentRequired: is missing but it is required,"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "data=[]"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-13732 @Test36 @positive @publishOrderSubmit
  Scenario: User should be able to Create Subscription by giving current date in prices.start and prices.end.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | price_start              | price_end                |
      | 2023-05-31T06:21:17.974Z | 2023-05-31T06:21:17.974Z |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I Prepare the request Body with "digitalPaymentService/createMandate.json" with given values:
      | channel | pir    | businessRef |
      | APP     | global | global      |
    When I prepare the headers with given values:
      | Content-Type     | APIGW-Tracking-Header |
      | application/json | aaa                   |
    Then I execute the POST request service "digital_payment_mandate" with endpoint "/digital-payments/v1/create-mandate"
    And Verify that Response should not be empty
    And Verify Response code should be 201
    And Set the value of "mprn"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  @ECOMP-13733 @Test37 @positive @publishOrderSubmit
  Scenario: User should be able to Create Subscription by giving future date in prices.start and prices.end.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | price_start              | price_end                |
      | 2025-07-19T06:21:17.974Z | 2025-07-19T06:21:17.974Z |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I Prepare the request Body with "digitalPaymentService/createMandate.json" with given values:
      | channel | pir    | businessRef |
      | APP     | global | global      |
    When I prepare the headers with given values:
      | Content-Type     | APIGW-Tracking-Header |
      | application/json | aaa                   |
    Then I execute the POST request service "digital_payment_mandate" with endpoint "/digital-payments/v1/create-mandate"
    And Verify that Response should not be empty
    And Verify Response code should be 201
    And Set the value of "mprn"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  @ECOMP-13734 @Test38 @positive @publishOrderSubmit
  Scenario: User should not be able to create Subscription by giving current date in prices.start and past date in prices.end.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | price_start              | price_end                |
      | 2023-05-31T06:12:17.874Z | 2021-07-23T06:21:18.774Z |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I Prepare the request Body with "digitalPaymentService/createMandate.json" with given values:
      | channel | pir    | businessRef |
      | APP     | global | global      |
    When I prepare the headers with given values:
      | Content-Type     | APIGW-Tracking-Header |
      | application/json | aaa                   |
    Then I execute the POST request service "digital_payment_mandate" with endpoint "/digital-payments/v1/create-mandate"
    And Verify that Response should not be empty
    And Verify Response code should be 201
    And Set the value of "mprn"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  @ECOMP-13735 @Test39 @positive @publishOrderSubmit
  Scenario: User should be able to create Subscription by giving current date in prices.start and future date in prices.end.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | price_start              | price_end                |
      | 2023-05-31T06:11:13.974Z | 2024-01-13T06:11:13.964Z |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I Prepare the request Body with "digitalPaymentService/createMandate.json" with given values:
      | channel | pir    | businessRef |
      | APP     | global | global      |
    When I prepare the headers with given values:
      | Content-Type     | APIGW-Tracking-Header |
      | application/json | aaa                   |
    Then I execute the POST request service "digital_payment_mandate" with endpoint "/digital-payments/v1/create-mandate"
    And Verify that Response should not be empty
    And Verify Response code should be 201
    And Set the value of "mprn"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  @ECOMP-13736 @Test40 @positive @publishOrderSubmit
  Scenario: User should be able to create Subscription by giving past date in prices.start and current date in prices.end.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | price_start              | price_end                |
      | 2021-03-10T06:20:17.874Z | 2023-05-31T06:20:17.974Z |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I Prepare the request Body with "digitalPaymentService/createMandate.json" with given values:
      | channel | pir    | businessRef |
      | APP     | global | global      |
    When I prepare the headers with given values:
      | Content-Type     | APIGW-Tracking-Header |
      | application/json | aaa                   |
    Then I execute the POST request service "digital_payment_mandate" with endpoint "/digital-payments/v1/create-mandate"
    And Verify that Response should not be empty
    And Verify Response code should be 201
    And Set the value of "mprn"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  @ECOMP-13737 @Test41 @positive @publishOrderSubmit
  Scenario: User should be able to create Subscription by giving past date in prices.start. and future in prices.end.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | price_start              | price_end                |
      | 2022-07-19T06:21:17.974Z | 2022-07-19T06:21:17.974Z |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I Prepare the request Body with "digitalPaymentService/createMandate.json" with given values:
      | channel | pir    | businessRef |
      | APP     | global | global      |
    When I prepare the headers with given values:
      | Content-Type     | APIGW-Tracking-Header |
      | application/json | aaa                   |
    Then I execute the POST request service "digital_payment_mandate" with endpoint "/digital-payments/v1/create-mandate"
    And Verify that Response should not be empty
    And Verify Response code should be 201
    And Set the value of "mprn"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  @ECOMP-13738 @Test42 @positive @publishOrderSubmit
  Scenario: User should not be able to create Subscription by giving future date in prices.start. and current in prices.end.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | price_start              | price_end                |
      | 2023-06-03T06:21:17.974Z | 2023-05-31T06:21:17.974Z |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I Prepare the request Body with "digitalPaymentService/createMandate.json" with given values:
      | channel | pir    | businessRef |
      | APP     | global | global      |
    When I prepare the headers with given values:
      | Content-Type     | APIGW-Tracking-Header |
      | application/json | aaa                   |
    Then I execute the POST request service "digital_payment_mandate" with endpoint "/digital-payments/v1/create-mandate"
    And Verify that Response should not be empty
    And Verify Response code should be 201
    And Set the value of "mprn"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  @ECOMP-13739 @Test43 @positive @publishOrderSubmit
  Scenario: User should not be able to create Subscription by giving future date in prices.start. and past in prices.end.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | price_start              | price_end                |
      | 2024-02-19T06:21:17.974Z | 2021-02-14T06:21:17.974Z |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I Prepare the request Body with "digitalPaymentService/createMandate.json" with given values:
      | channel | pir    | businessRef |
      | APP     | global | global      |
    When I prepare the headers with given values:
      | Content-Type     | APIGW-Tracking-Header |
      | application/json | aaa                   |
    Then I execute the POST request service "digital_payment_mandate" with endpoint "/digital-payments/v1/create-mandate"
    And Verify that Response should not be empty
    And Verify Response code should be 201
    And Set the value of "mprn"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  @ECOMP-13740 @Test44 @positive @publishOrderSubmit
  Scenario: User should not be able to create Subscription for same customer.id with same order number twice.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | channel | salesType |
      | APP     | PRINCIPAL |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I Prepare the request Body with "digitalPaymentService/createMandate.json" with given values:
      | channel | pir    | businessRef |
      | APP     | global | global      |
    When I prepare the headers with given values:
      | Content-Type     | APIGW-Tracking-Header |
      | application/json | aaa                   |
    Then I execute the POST request service "digital_payment_mandate" with endpoint "/digital-payments/v1/create-mandate"
    And Verify that Response should not be empty
    And Verify Response code should be 201
    And Set the value of "mprn"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty

  @ECOMP-13741 @Test45 @publishOrderSubmit
  Scenario: User should not be able to create Subscription for same customer.id with unique order number twice.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | channel | salesType |
      | APP     | PRINCIPAL |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | customer_id |
      | same        |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  @ECOMP-13742 @Test46 @publishOrderSubmit
  Scenario: User should be able to create Subscription for unique customer.id with same order number twice.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | channel | salesType |
      | APP     | PRINCIPAL |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | OrderInfo_orderNumber |
      | same                  |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |

  @ECOMP-13743 @Test47 @publishOrderSubmit
  Scenario: User should be able to create Subscription without start and end in prices object.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | price_start | price_end |
      | null        | null      |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/subscription-order-submit"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I Prepare the request Body with "digitalPaymentService/createMandate.json" with given values:
      | channel | pir    | businessRef |
      | APP     | global | global      |
    When I prepare the headers with given values:
      | Content-Type     | APIGW-Tracking-Header |
      | application/json | aaa                   |
    Then I execute the POST request service "digital_payment_mandate" with endpoint "/digital-payments/v1/create-mandate"
    And Verify that Response should not be empty
    And Verify Response code should be 201
    And Set the value of "mprn"
    When I prepare the headers with given values:
      | Content-Type     | x-api-key                                | Client-Id          | Correlation-Id                      | Request-Id                          |
      | application/json | nNoMWa1Tq885YXnAkXFEh2yPAFOv4cT62hVQRJOA | MARKETPLACE-E2E-01 | e03bf914-3738-43b5-a7d2-152561e7cf0 | e03bf914-3738-43b5-a7d2-152561e7cf0 |
    Given I execute the GET request service "subscription_manager" with endpoint "/api/v1/subscriptions" and "customerId=customerId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Get the following values "data.id,data.orderId"
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
      | INITIAL | orderId     | orderId        | Received Subscription Order                |
