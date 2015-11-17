class RequestReorderPage < PageFactory

  page_url $test_site

  action(:deliver) { |b| b.link(class:"red" , title:"Deliver").when_present(60).click}
  action(:recall_request) { |b| b.a(class:"portal_link" , title:"Request Re-order").when_present(60).click}
  element(:search_item_barcode) { |b| b.iframe(id:"iframeportlet").text_field(id:"itemIdSearch_control").when_present(60)}
  action(:save) { |b| b.iframe(id:"iframeportlet").button(id:"reOrderButton").when_present(60).click}
  value(:request_type) { |line_level,b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-tableCollectionLayout").tbody.div(id:"requestTypeId_line#{line_level}").when_present(60).text}
  value(:request_queue) { |line_level,b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-tableCollectionLayout").tbody.input(id:"borrowerQueuePosition_line#{line_level}_control").when_present(60).value}

end