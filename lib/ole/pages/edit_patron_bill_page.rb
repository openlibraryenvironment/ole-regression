class Edit_patron_bill_page < PageFactory
  page_url $test_site

  action(:deliver_green) { |b| b.a(class:"green" , title:"Deliver").when_present(60).click}
  element(:deliver_green_tab){ |b| b.a(class:"green" , title:"Deliver").exists?}
  element(:deliver_red_tab){ |b| b.a(class:"red" , title:"Deliver").exists?}
  action(:deliver_red) { |b| b.link(class:"red" , title:"Deliver").click}
  value(:doc_number) { |b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-gridLayout").tbody.td(index:0).when_present(60).text}
  action(:edit_patron_bill) { |b| b.a(class:"portal_link" , title:"Edit Patron Bills").when_present(60).click}
  element(:patron_id) { |b| b.iframe(id:"iframeportlet").text_field(id:"lookUp_patronId_control").when_present(60)}
  action(:search_patron) { |b| b.iframe(id:"iframeportlet").button(text:"Search").when_present(60).click}
  action(:edit_patron) { |b| b.iframe(id:"iframeportlet").a(text:"edit").when_present(60).click}
  action(:doc_description) { |b| b.iframe(id:"iframeportlet").text_field(name:"document.documentHeader.documentDescription").when_present(60)}
  element(:select_fee_type) { |b| b.iframe(id:"iframeportlet").select(id:"fee_feeType_add_control").when_present(60)}
  element(:add_fee_amount) { |b| b.iframe(id:"iframeportlet").text_field(id:"feeAmt_add_control").when_present(60)}
  action(:add_fee_type) { |b| b.iframe(id:"iframeportlet").button(id:"addFee_add").when_present(60).click}
  action(:submit_patron) { |b| b.iframe(id:"iframeportlet").button(id:"olePatronBillSubmit").when_present(60).click}
  value(:patronID) { |b| b.iframe(id:"iframeportlet").a(title:"show inquiry for Patron ").when_present(60).text}
  value(:total_fee_amount) { |line_level,b| b.form(id:"kualiForm").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").tbody.span(id:"feeAmt_line#{line_level}_control").text.delete('$').to_f}
  action(:doc_search) { |b| b.img(alt:"doc search").when_present(60).click}
  value(:doc_status) { |b| b.form(id:"kualiForm").table(class:"table table-condensed table-bordered uif-gridLayout").tbody.tr(index:0).td(index:1).div(class:"uif-inputField uif-documentStatus").when_present(60).text}
  action(:doc_id_link) { |b| b.iframe(id:"iframeportlet").table(id:"row").td(index:0).a(title:"").click}
  action(:search) { |b| b.iframe(id:"iframeportlet").button(title:"search").when_present(60).click}
  element(:doc_id) { |b| b.iframe(id:"iframeportlet").text_field(id:"documentId")}
  value(:total_amount) { |b| b.form(id:"kualiForm").span(id:"totAmt_control").when_present(60).text.delete('$').to_f}

end