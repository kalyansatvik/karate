Feature: GET request demo
  I want to use this template for my feature file

  Background: 
    * url 'https://reqres.in'

  Scenario: GET Demo 1
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200

  Scenario: GET Demo with path and Background
    Given path '/api/users?page=2'
    When method GET
    Then status 200

  Scenario: GET Demo with path and param
    Given path '/api/users'
    #And param page=2 
    #-- improper spaces will make the test fail
    And param page = 2
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  Scenario: GET Demo with assertions
    Given path '/api/users'
    And param page = 2
    When method GET
    Then status 200
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    And match $.data[1].id == 8
    And match $.data[3].last_name == 'Fields'
