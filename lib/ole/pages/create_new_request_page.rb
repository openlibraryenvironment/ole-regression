class Create_new_request_page < PageFactory

  page_url $test_site

  action(:create_new_request) { |b| b.a(title:"Create New Request").when_present(60).click}
  element(:request_type) { |b| b.iframe(id:"iframeportlet").select(id:"selectRequestBorrower-MaintenanceView-requestTypeIds_control").when_present(60)}
  element(:borrower_barcode) { |b| b.iframe(id:"iframeportlet").text_field(id:"selectRequestBorrower-MaintenanceView-borrowerBarcodes_control").when_present(60)}
  action(:search_item_id) { |b| b.iframe(id:"iframeportlet").fieldset(id:"RecallRequest-itemId_fieldset").input(title:"Search Field").when_present(60).click}
  element(:item_barcode) { |b| b.div(class:"fancybox-wrap fancybox-desktop fancybox-type-iframe fancybox-opened").iframe(class:"fancybox-iframe").text_field(name:"lookupCriteria[itemBarCode]").when_present(60)}
  action(:item_search) { |b| b.div(class:"fancybox-wrap fancybox-desktop fancybox-type-iframe fancybox-opened").iframe(class:"fancybox-iframe").button(id:"item_search_lookup").when_present(60).click}
  action(:return_item) { |b| b.div(class:"fancybox-wrap fancybox-desktop fancybox-type-iframe fancybox-opened").iframe(class:"fancybox-iframe").a(text:"return value").when_present(60).click}
  action(:submit_request) { |b| b.iframe(id:"iframeportlet").button(text:"Submit").when_present(60).click}

  action(:search_patron) { |b| b.iframe(id:"iframeportlet").fieldset(id:"selectRequestBorrower-MaintenanceView-borrowerBarcodes_fieldset").input(title:"Search Field").when_present(60).click}
  element(:request_patron_barcode) { |b| b.div(class:"fancybox-wrap fancybox-desktop fancybox-type-iframe fancybox-opened").iframe(class:"fancybox-iframe").text_field(id:"barcode_control").when_present(60)}
  action(:request_patron_search) { |b| b.div(class:"fancybox-wrap fancybox-desktop fancybox-type-iframe fancybox-opened").iframe(class:"fancybox-iframe").button(text:"Search").when_present(60).click}
  action(:return_patron_barcode) { |b| b.div(class:"fancybox-wrap fancybox-desktop fancybox-type-iframe fancybox-opened").iframe(class:"fancybox-iframe").a(text:"return value").when_present(60).click}
  action(:request_search) { |b| b.a(title:"Request Search").when_present(60).click}
  element(:pat_barcode) { |b| b.iframe(id:"iframeportlet").text_field(id:"olePatronBarcode_control").when_present(60)}
  action(:search_request) { |b| b.iframe(id:"iframeportlet").button(id:"searchReqBtn").when_present(60).click}
  value(:request_item_barcode) { |b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").tbody.tr(index:0).td(index:6).div.span(id:"result-itemBarcode_line0_control").when_present(60).text}
  value(:search_request_type) {|b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").tbody.tr(index:0).td(index:2).div(id:"result-requestType_line0").when_present(60).text}

end

