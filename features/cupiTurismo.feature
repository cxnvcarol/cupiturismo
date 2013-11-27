Feature: Viewer visits the Home Page
   In order to read the page
   As a viewer
   I want to see the home page of my app

  Scenario: View home page
    Given I am on the home page
    Then I should see "CupiTurismo"


 Feature: Register
 In order Log in
 A visitor
 Should fill the register form

  Scenario: user register
    When I fill register form

    Then I should see "Bienvenid@ Diomedes"


  Feature: Sign in as Diomedes Diaz
  In order Sign in
  A visitor
  Should fill the sign in form

  Scenario: user sign in
    When I sign in as Diomedes

    Then I should see "Bienvenid@ Diomedes"

  Feature: new trip

  Scenario: create trips
    When I sign in as Diomedes
    And I click on + link
    And I fill in the following:
      | tittle              | trip1           |
      | trip_begin_date_1i  | 2013            |
      | trip_begin_date_2i  | November        |
      | trip_begin_date_3i  | 23              |
      | trip_end_date_1i    | 2014            |
      | trip_end_date_2i    | November        |
      | trip_end_date_3i    | 23              |


    Then I should see "trip1"

  Feature: delete trip

  Scenario: delete trips
    When I sign in as Diomedes
    And I click on delete link

    Then I should not see "trip1"
