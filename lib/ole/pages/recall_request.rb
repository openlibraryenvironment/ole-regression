class RecallRequest <  PageFactory

  page_url $test_site
  element(:deliver) { |b| b.a(title:"Deliver").when_present(60).click}
  action(:item_search) { |b| b.a(title:"Item Search").when_present(60).click}
  element(:item_id) { |b| b.iframe(id:"iframeportlet").text_field(id:"OLEDeliverItemSearch_BarCode_control")}
  action(:click_item_search) { |b| b.iframe(id:"iframeportlet").button(id:"itemSearch_search_button").when_present(60).click}
  action(:open_request) { |b| b.iframe(id:"iframeportlet").img(id:"OLEDeliverItemSearchResult-Request_toggle_col" , alt:"collapse").when_present(60).click}
  action(:place_request) { |b| b.iframe(id:"iframeportlet").a(text:"Place Request").when_present(60).click}
  action(:search_field) { |b| b.iframe(id:"iframeportlet").input(title:"Search Field").when_present(60).click}
  element(:borrower_type) { |b| b.iframe(class:"fancybox-iframe").select(id:"borrowerType_control")}
  action(:search_borrower_type) { |b| b.iframe(class:"fancybox-iframe").button(text:"Search").when_present(60).click}
  action(:return_borrower_type) {|b| b.iframe(class:"fancybox-iframe").a(text:"return value").when_present(60).click}
  action(:conform_patron) { |b| b.iframe(id:"iframeportlet").button(text:"Confirm patron and Continue with Request").when_present(60).click}
  action(:check_recall) { |b| b.iframe(id:"iframeportlet").input(id:"recallRequestTyp_control_0").when_present(60).click}
  action(:request_submit) { |b| b.iframe(id:"iframeportlet").button(id:"request_submit_button").when_present(60).click}
  action(:request_search) { |b| b.a(title:"Request Search").when_present(60).click}
  element(:item_Id_control) { |b| b.iframe(id:"iframeportlet").text_field(id:"itemId_control")}
  element(:patron_detail) { |b| b.iframe(id:"iframeportlet").text_field(id:"pl_req_pat_control").when_present(60)}
  element(:request_search_patron) { |b| b.iframe(id:"iframeportlet").text_field(id:"olePatronBarcode_control")}
  action(:search_request) { |b| b.iframe(id:"iframeportlet").button(id:"searchReqBtn").when_present(60).click}
  value(:recallrequest_type) { |b| b.iframe(id:"iframeportlet").a(class:"uif-link").when_present(60).text}
  action(:activate_address) { |b| b.iframe(id:"iframeportlet").input(id:"active_add_control").when_present(60).click}
  action(:set_pickup_location) { |b| b.iframe(id:"iframeportlet").select(id:"placeRequest-pickupLocation_control").option(:text=>"BL_HPER").when_present(60).click}
  action(:pickup_location) { |b| b.iframe(id:"iframeportlet").select(id:"placeRequest-pickupLocation_control").option(:text=>"BL_EDUC").when_present(60).click}
  action(:open_deliver) { |b| b.a(class:"green" , title:"Deliver").when_present(60).click}
  action(:check_hold) { |b| b.iframe(id:"iframeportlet").input(id:"holdRequestTyp_control_0").when_present(60).click}
end