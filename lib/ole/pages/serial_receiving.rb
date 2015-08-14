class Serial_receiving < PageFactory
  page_url $test_site

  action(:select_acquire) { |b| b.link(class: "green", title:"Select/Acquire").when_present(60).click}
  element(:green_tab) { |b| b.a(class:"green" , title:"Select/Acquire").exists?}
  element(:red_tab) { |b| b.a(class:"red" , title:"Select/Acquire").exists?}
  action(:search_and_receive) { |b| b.a(class:"portal_link" , title:"Search & Receive").when_present(60).click}
  element(:search_fields) { |line_level,b| b.iframe(id:"iframeportlet").text_field(id:"searchText_id_line#{line_level}_control")}
  action(:search_button) { |b| b.iframe(id:"iframeportlet").button(id:"search_button").click}
  action(:create_serial_receiving) { |b| b.iframe(id:"iframeportlet").a(text:"Create").click}
  element(:substatus_field) { |b| b.iframe(id:"iframeportlet").select(id:"subStatusField_control")}
  value(:document_number) { |b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-gridLayout").tbody.td(index:0).text}
  action(:save_transaction) { |b| b.iframe(id:"iframeportlet").button(id:"SR-Uif-SaveAction").when_present(60).click}
  action(:show_transaction) { |b| b.iframe(id:"iframeportlet").a(text:"Show").when_present(60).click}
  value(:record_no) { |b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-gridLayout").tbody.td(index:4).text}
  action(:doc_search) { |b| b.img(alt:"doc search").when_present(60).click}
  element(:doc_id) { |b| b.iframe(id:"iframeportlet").text_field(id:"documentId") }
  action(:search_req) { |b| b.iframe(id:"iframeportlet").input(title:"search").click}
  value(:doc_status) { |b| b.form(id:"kualiForm").table(class:"table table-condensed table-bordered uif-gridLayout").tbody.td(index:1).text}
  action(:doc_id_link) { |b| b.iframe(id:"iframeportlet").table(id:"row").td(index:0).a(title:"").click}
  value(:local_id) { |b| b.iframe(id:"iframeportlet").div(id:"instanceIdLinkField").text.gsub!(/\D/, "")}


end