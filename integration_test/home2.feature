Feature: Home

    Background:
        Given the app initialized
        Given the app is running

    Scenario: Press logout button and home navigate
        When I wait
        Then I see {'Get Started'} text
        When I tap {'Get Started'} text
        When I wait
        Then I see {'Extension'} text
        Then I waitFiveSecond





