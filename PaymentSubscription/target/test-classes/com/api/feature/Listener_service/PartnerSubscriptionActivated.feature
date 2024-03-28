@Subscription @activation @Regression12
Feature: Publish Order Submit Listener Service

 @ECOMP-12404 @activationTest1 @positive @activation1
  Scenario: User should be able to  activate a partner subscription through the listener service.
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
  @ECOMP-12404 @activationTest2 @positive @activation
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

  @ECOMP-12404 @activationTest3 @positive @activation
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
