@nightly @describe
  Feature: Single Record Import
    Scenario: Importing single bib
      Given I login with ole-quickstart
      When I upload mrc file and select bib to import
      Then the selected bib title should match the imported bib title