#@nightly @invoice
#Feature: OLE.Create Invoice
#
#  Scenario: PL 2.1.1 Verify that a invoice can be successfully created for a purchase order
#    Given I am logged in as an acquisition staffs
#    When I create an  invoice using a purchase order
#    Then a invoice should be successfully created with status as FINAL