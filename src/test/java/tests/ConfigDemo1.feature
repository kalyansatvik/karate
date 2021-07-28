Feature: Config request demo
  I want to use this template for my feature file

  Background: 
    * url baseUrl

  Scenario: Demo 1
    * print name

  Scenario: GET Demo 2
    Given path '/api/users'
    And param page = 2
    When method GET
    Then status 200

