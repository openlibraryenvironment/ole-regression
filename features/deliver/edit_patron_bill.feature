@nightly
  Feature:
    @retest
    Scenario: Edit patron bill
      Given I log in as ole_quickstart
      When I create patron bill and another fee type and fee amount
      Then the patron bill's total amount should updated