class Request_search_page < PageFactory

  page_url $test_site

  action(:deliver) { |b| b.link(class:"red" , title:"Deliver").when_present(60).click}
  action(:request_search) { |b| b.a(title:"Request Search").when_present(60).click}
  action(:create_request) { |b| b.iframe(id:"iframeportlet").a(text:"Create New").when_present(60).click}
  element(:request_types) { |b| b.iframe(id:"iframeportlet").select(id:"selectRequestBorrower-MaintenanceView-requestTypeIds_control").when_present(60)}
  element(:patron_barcode) { |b| b.iframe(id:"iframeportlet").text_field(id:"selectRequestBorrower-MaintenanceView-borrowerBarcodes_control").when_present(60)}
  element(:item_barcode) { |b| b.iframe(id:"iframeportlet").text_field(id:"RecallRequest-itemId_control").when_present(60)}
  element(:pickup_location) { |b| b.iframe(id:"iframeportlet").select(id:"recallRequest-MaintenanceView-pickupLocation_control").when_present(60)}
  action(:submit) { |b| b.iframe(id:"iframeportlet").button(text:"submit").when_present(60).click}
end