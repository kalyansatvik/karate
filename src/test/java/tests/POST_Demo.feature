Feature: POST Demo
  I want to use this template for my feature file

  Background: 
    * url 'https://reqres.in/api'
    * def expectedOutput = read('response1.json')
    * def payload = read('request1.json')
    * def projectPath = karate.properties['user.dir']
    * def filePath = projectPath+'/src/test/java/data/request1.json'
    * print filePath

  Scenario: POST With request body as a json
    Given path '/users'
    #And request {
    #"name": "morpheus",
    #"job": "leader"
    #		}
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
    And print response

  Scenario: POST With response assertion
    Given path '/users'
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
    #And match response == {
    #"createdAt": "2021-07-21T13:54:35.566Z",
    #"name": "morpheus",
    #"id": "581",
    #"job": "leader"
    #}
    #		And match response == {"createdAt": "2021-07-21T13:54:35.566Z","name": "morpheus","id": "581","job": "leader"}
    And match response == {"createdAt": "#ignore","name": "morpheus","id": "#string","job": "leader"}
    And print response

  Scenario: POST With request and response as a .json file
    Given path '/users'
    And request payload
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response

  Scenario: POST With request and response as a .json file and change the payload data
    Given path '/users'
    And set payload.job = 'engineer'
    And request payload
    When method POST
    Then status 201
    #And match response == expectedOutput
    And print response

  Scenario: POST With request with filePath
    Given path '/users'
    And def reqBody = filePath
    And print reqBody
    #And set reqBody.job = 'engineer'
    And request reqBody
    When method POST
    Then status 201
    #And match response == expectedOutput
    And print response
