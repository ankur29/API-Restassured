@Subscription @activation @Regression1
Feature: Publish Order Submit Listener Service

  @ECOMP-12404 @activationTest1 @positive @activation
  Scenario: user should be able to activate a subscription through the HTTP service.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | channel | salesType |
      | APP     | PRINCIPAL |
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
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "subscriptionId=id" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
    When I prepare the headers with given values:
      | Content-Type     | apigw-tracking-header                | channel |
      | application/json | ada559fd-98ca-4e61-ad81-76a0bb433df2 | web     |
    Then I execute the POST request service "httpservice_activate_subscription" with endpoint "global"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "subscriptionId=id" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                       |
      | PENDING | orderId     | id             | create-partner-subscription published        |
      | PENDING | orderId     | id             | Subscription Activation Initated By Customer |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created   |
      | PENDING | orderId     | id             | Subscription Created Successfully            |

  @ECOMP-12404 @activationTest2 @positive @activation
  Scenario: user should be able to activate a subscription through the HTTP service.
    Given I Prepare the request Body with "listenerService/publishOrderSubmit.json" with given values:
      | channel | salesType |
      | WEB     | PRINCIPAL |
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
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "subscriptionId=id" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                     |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created |
      | PENDING | orderId     | id             | Subscription Created Successfully          |
    When I prepare the headers with given values:
      | Content-Type     | apigw-tracking-header                | channel |
      | application/json | ada559fd-98ca-4e61-ad81-76a0bb433df2 | web     |
    Then I execute the POST request service "httpservice_activate_subscription" with endpoint "global"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "subscriptionId=id" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                       |
      | PENDING | orderId     | id             | create-partner-subscription published        |
      | PENDING | orderId     | id             | Subscription Activation Initated By Customer |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created   |
      | PENDING | orderId     | id             | Subscription Created Successfully            |

  @ECOMP-12404 @activationTest3 @positive @activation
  Scenario: User should be able to  create a partner subscription through the listener service.
    Given I Prepare the request Body with "listenerService/partnerSubscriptionCreated.json" with given values:
      | id     | marketplaceSubscriptionId |
      | global | global                    |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/partner-subscription-created"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify the response data with below expected result:
      | Status  | OrderNumber | SubscriptionId | Reason                                       |
      | PENDING | orderId     | id             | create-partner-subscription published        |
      | PENDING | orderId     | id             | Subscription Activation Initated By Customer |
      | PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created   |
      | PENDING | orderId     | id             | Subscription Created Successfully            |

  @ECOMP-12404 @activationTest4 @positive @activation
  Scenario: user should not be able to create a partner subscription without the required fields through the listener service.
    Given I Prepare the request Body with "listenerService/partnerSubscriptionCreated.json" with given values:
      | id   | marketplaceSubscriptionId | activationUrl | createdDate |
      | null | null                      | null          | null        |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/partner-subscription-created"
    And Verify Response code should be 200
    And Verify that Response should not be empty
      Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-12404 @activationTest5 @positive @activation
  Scenario: user should not be able to create a partner subscription with the required fields through the listener service.
    Given I Prepare the request Body with "listenerService/partnerSubscriptionCreated.json" with given values:
      | id     | marketplaceSubscriptionId | activationUrl             | createdDate              |
      | global | global                    | https://xbox.com/activate | 2023-06-19T06:21:17.974Z |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/partner-subscription-created"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "orderNumber=orderId" as query parameter
    And Verify Response code should be 200
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-12404 @activationTest6 @positive @activation
  Scenario: User should be able to  activate a partner subscription through the listener service.
    Given I Prepare the request Body with "listenerService/partnerSubscriptionActivated.json" with given values:
      | id     | marketplaceSubscriptionId |
      | global | global                    |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/partner-subscription-activated"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "subscriptionId=id" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    #And Verify the response data with below expected result:
      #| Status  | OrderNumber | SubscriptionId | Reason                                       |
      #| PENDING | orderId     | id             | create-partner-subscription published        |
      #| PENDING | orderId     | id             | Subscription Activation Initated By Customer |
      #| PENDING | orderId     | id             | KAFKA publish SUCCESS,subscription-created   |
      #| PENDING | orderId     | id             | Subscription Created Successfully            |

  @ECOMP-12404 @activationTest7 @positive @activation
  Scenario: User should not be able to create a activate subscription without the required fields through the listener service.
    Given I Prepare the request Body with "listenerService/partnerSubscriptionActivated.json" with given values:
      | id   | marketplaceSubscriptionId | status | activatedDate |
      | null | null                      | null   | null          |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/partner-subscription-activated"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "subscriptionId=id" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify Response should be "subscriptionStatuses=[]"

  @ECOMP-12404 @activationTest8 @positive @activation
  Scenario: User should not be able to create a activate subscription with the required fields through the listener service.
    Given I Prepare the request Body with "listenerService/partnerSubscriptionActivated.json" with given values:
      | id     | marketplaceSubscriptionId | status | activatedDate            |
      | global | global                    | ACTIVE | 2023-06-19T06:21:17.974Z |
    When I prepare the headers with given values:
      | Content-Type     |
      | application/json |
    Then I execute the POST request service "listener_service" with endpoint "/sls/partner-subscription-activated"
    And Verify Response code should be 200
    And Verify that Response should not be empty
    Given I execute the GET request service "subscription_logging_service" with endpoint "/subscriptions-logging/v1/log" and "subscriptionId=id" as query parameter
    And Verify Response code should be 200
    And Verify that Response should not be empty
    And Verify Response should be "subscriptionStatuses=[]"
