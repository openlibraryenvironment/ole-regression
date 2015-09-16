#@nightly
#  Feature: OLE.RequestRecall
#    Scenario: Recall deliver request for an item
#      Given I logged in with ole_quickstart
#      When I'm raising the recall request
#      Then The request type should be RecallDeliverRequest
#
#    Scenario: Recall hold request for an item
#      Given I'm log in as ole_quickstart
#      When I'm setting pick up location
#      Then The request type should be RecallHoldRequest
