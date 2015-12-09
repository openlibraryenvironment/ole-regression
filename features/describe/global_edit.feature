@nightly @describe
  Feature: Global edit of items/holdings
    Scenario: Edit multiple items or holdings at a time
      Given I am logged in as ole-quickstart for global edit
      When I create multiple item and edit those items
      Then the changes should be successfully updated
