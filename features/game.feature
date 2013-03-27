Feature: Starting up the game
  As A user
  I want to be able to start up the game
  So that I can play the game

  Scenario: Starting up the game
    Given I am not yet playing
    When I start a new game
    Then I should see the message "Get ready to sequentialize!"
    And I should see the prompt "Enter guess: "
