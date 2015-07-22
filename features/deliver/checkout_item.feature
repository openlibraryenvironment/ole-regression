@nightly
Feature: OLE.CheckoutItem

  Scenario: PL 1.1.1 Verify inactive patron
  Given A patron barcode who is inactive
  When I scan for patron barcode
  Then Operator is presented with a pop-up message to allow or disallow loaning of an item

  Scenario: PL 1.1.2 Verify active patron
  Given A patron barcode who is active
  When I scan patron barcode for checkOut an item
  Then Item status should be LOANED

  Scenario: PL 1.1.4 Verify Patron's Address is verified
  Given A Patron barcode who is inactive
  When I scan patron barcode
  Then Operator is presented with pop-up message to allow or disallow loaning of an item





