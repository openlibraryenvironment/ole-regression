@nightly
  Feature: Serial receiving
    Scenario: Creating serial receiving using PO via serial receiving search
      Given I log-in with user name ole-quickstart
      When I search record using PO number and start creating serial receiving transaction
      Then the document should be in SAVED status

    Scenario: Creating serial receiving using item title via serial receiving search
      Given I log-in with user name ole-quickstart
      When I search item record using title and start creating serial receiving transaction
      Then document should be in SAVED status

    Scenario: Creating serial receiving using local identifier via serial receiving search
      Given I log-in with user name ole-quickstart
      When I search record local identifier and start creating serial receiving transaction
      Then document status should be SAVED

    Scenario: Creating serial receiving using ISSN via serial receiving search
      Given I log-in with user name ole-quickstart
      When I search record using ISSN and start creating serial receiving transaction
      Then document status should be in SAVED

    Scenario: Editing the record using serial receiving record number
      Given I log-in with user name ole-quickstart
      When I search record using serial receiving record number and update the record values
      Then document status should be SAVED

    Scenario: Receiving title with enumeration and chronology for serial receiving
      Given I log-in with user name ole-quickstart
      When I give enumeration and chronology informations for serial receiving transaction and receive it
      Then the enumeration and chronology informations should be saved

    Scenario: Unreceiving enumeration and chronology for serial receiving
      Given I log-in with user name ole-quickstart
      When I removed enumeration and chronology information
      Then the deleted informations should no longer exists

    Scenario: Receiving special issues
      Given I log-in with user name ole-quickstart
      When I add special issues of enumeration and chronology and receive it
      Then the  special issues informations should be saved

    Scenario: Unreceiving special issues
      Given I log-in with user name ole-quickstart
      When I removed special issue information
      Then the removed special issues information should  no longer exists




