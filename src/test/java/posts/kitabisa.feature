Feature: Q1 - Create automation test for testing api, for the detail api, u can open the url https://reqres.in/ . 
- Validate response 200 for list users 
- Validate email if email == lindsay.ferguson@reqres.in 
- Validate response 200 for Create 

Background:
  Given url urlBase


Scenario: 
  - Validate response 200 for list users 
  - Validate email if email == lindsay.ferguson@reqres.in 
  When method get
  Then status 200
  * match response.data[1].email == 'lindsay.ferguson@reqres.in'

Scenario: Validate response 200 for Create 
  When method post
  Then status 201
  #in this case if validate with 200 can get failed cause status code is 201 for create

Scenario: Get qty of array []
  When method get
  Then status 200
      * match response.data == '#[6]'  


Scenario: Get type data
  When method get
  Then status 200
    * match each response[*].page == '#number'
    * match each response[*].per_page == '#number'
    * match each response[*].total == '#number'
    * match each response[*].total_page == '#number'
    * match each response.data[*].id == '#number'
    * match each response.data[*].email == '#string'
    * match each response.data[*].first_name == '#string'
    * match each response.data[*].last_name == '#string'
    * match each response.data[*].avatar == '#string'
    * match each response[*].support.url == '#string'
    * match each response[*].support.text == '#string'
  