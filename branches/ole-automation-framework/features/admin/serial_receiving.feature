@nightly
  Feature: Serial receiving
    Scenario: Searching po record through serial receiving
      Given I log in with user name ole-quickstart
      When I search record using po number and start creating serial receiving transaction
      Then the document should be in SAVED status

    Scenario: Searching item record using title through serial receiving
      Given I log in with user name ole-quickstart
      When I search item record using title and start creating serial receiving transaction
      Then  document should be in SAVED status

    Scenario: Editing the record using serial receiving record number
      Given I log in with user name ole-quickstart
      When I search record using serial receiving record number
      Then document status should be SAVED

    Scenario: Searching record using local identifier
      Given I log in with user name ole-quickstart
      When I search record local identifier and start creating serial receiving transaction
      Then document status should be SAVED

    Scenario: Searching record using ISSN
      Given I log in with user name ole-quickstart
      When I search record using ISSN and start creating serial receiving transaction
      Then document status should be in SAVED




