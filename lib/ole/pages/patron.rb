class PatronPage < PageFactory
  page_url $test_site

  #Create a new patron
  action(:deliver) { |b| b.a(title:"Deliver").when_present(60).click}

  value(:doc_number) { |b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-gridLayout").tbody.td(index:0).when_present(60).text}
  value(:document_number) { |b| b.form(id:"kualiForm").table(class:"table table-condensed table-bordered uif-gridLayout").tbody.tr.td(index:0).when_present(60).text}
  element(:doc_id) { |b| b.iframe(id:"iframeportlet").text_field(id:"documentId") }
  action(:patron) { |b| b.link(class:"portal_link" , title:"Patron").when_present(60).click}
  action(:create_new) { |b| b.iframe(id:"iframeportlet").button(id:"OLE_OlePatron_Uif-CreateNewLink").when_present(60).click}
  action(:overview) { |b| b.iframe(id:"iframeportlet").img(id:"OlePatronDocument-OverviewSection_toggle_col").when_present(60).click}
  element(:barcode) { |b| b.iframe(id:"iframeportlet").text_field(id:"barcode_control")}
  element(:borrowertype) { |b| b.iframe(id:"iframeportlet").select(id:"borrowerType_control")}
  element(:expiration_date) { |b| b.iframe(id:"iframeportlet").text_field(id:"expirationDate_control")}
  action(:contacts) { |b| b.iframe(id:"iframeportlet").img(id:"OlePatronDocument-ContactsSection_toggle_col").when_present(60).click}
  element(:first_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"firstName_control")}
  element(:last_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"lastName_control")}
  element(:email) { |b| b.iframe(id:"iframeportlet").text_field(id:"emailAddress_add_control")}
  action(:preferred_email) { |b| b.iframe(id:"iframeportlet").input(id:"email_defaultValue_add_control").when_present(60).click}
  action(:add_email) { |b| b.iframe(id:"iframeportlet").button(id:"OlePatronDocument-Email-Add_add").when_present(60).click}
  element(:address_type) { |b| b.iframe(id:"iframeportlet").select(id:"addressTypeCode_add_control")}
  element(:address_source) { |b| b.iframe(id:"iframeportlet").select(id:"addressSource_add_control")}
  action(:deliver_address) { |b| b.iframe(id:"iframeportlet").input(id:"deliverAddress_add_control").when_present(60).click}
  action(:default_value) { |b| b.iframe(id:"iframeportlet").input(id:"defaultValue_add_control").when_present(60).click}
  action(:add_address) { |b| b.iframe(id:"iframeportlet").button(id:"OlePatronDocument-Address_add").when_present(60).click}
  action(:submit) { |b| b.iframe(id:"iframeportlet").button(id:"olePatronSubmit").when_present(60).click}
  action(:ole_submit) { |b| b.iframe(id:"iframeportlet").button(id:"oleSubmit").when_present(60).click}
  element(:email_source) { |b| b.iframe(id:"iframeportlet").select(id:"oleEmailAddressSource_add_control").when_present(60)}

  #Doc_search
  action(:doc_search) { |b| b.img(alt:"doc search").when_present(60).click}
  value(:doc_status) { |b| b.form(id:"kualiForm").table(class:"table table-condensed table-bordered uif-gridLayout").tbody.tr(index:0).td(index:1).div(class:"uif-inputField uif-documentStatus").when_present(60).text}
  action(:doc_id_link) { |b| b.iframe(id:"iframeportlet").table(id:"row").td(index:0).a(title:"").click}
  action(:search) { |b| b.iframe(id:"iframeportlet").button(title:"search").when_present(60).click}
  value(:patronstatus) { |b| b.iframe(id:"iframeportlet").table(id:"row").td(index:3).when_present(60).text}
  action(:open_patron) { |b| b.iframe(id:"iframeportlet").table(id:"row").a(title:"").when_present(60).click}
  action(:open_proxypatron) { |b| b.form(id:"kualiForm").div(id:"OlePatronDocument-ProxySection-Wrapper").span(class:"uif-headerText-span").a(text:"Proxy Patron").when_present(60).click}
  value(:proxypatron_barcode) { |b| b.form(id:"kualiForm").div(id:"barcode_Proxy_line0").span(id:"barcode_Proxy_line0_control").when_present(60).text}

  #For Proxy Patron
  action(:proxypatron) { |b| b.iframe(id:"iframeportlet").a(text:"Proxy Patron").when_present(60).click}
  value(:proxy_barcode) { |b| b.iframe(id:"iframeportlet").input(id:"barcode_Proxy_add_control").when_present(60).value}
  element(:add_proxy_barcode) { |b| b.iframe(id:"iframeportlet").text_field(id:"barcode_Proxy_add_control")}
  action(:proxy_search_field) { |b| b.iframe(id:"iframeportlet").input(alt:"Search Field").when_present(60).click}
  action(:search_proxy) { |b| b.iframe(class:"fancybox-iframe").button(text:"Search").when_present(60).click}
  action(:return_proxy) { |b| b.iframe(class:"fancybox-iframe").a(text:"return value").when_present(60).click}
  element(:proxy_activation_date) { |b| b.iframe(id:"iframeportlet").text_field(id:"proxyPatronActivationDate_Proxy_add_control")}
  element(:proxy_expiration_date) { |b| b.iframe(id:"iframeportlet").text_field(id:"proxyPatronExpirationDate_Proxy_add_control")}
  action(:add_proxypatron) { |b| b.iframe(id:"iframeportlet").button(id:"addProxyPatron_add").when_present(60).click}

  #For Notes
  action(:open_note) { |b| b.form(id:"kualiForm").a(text:"Note").when_present(60).click}
  action(:note) { |b| b.iframe(id:"iframeportlet").a(text:"Note").when_present(60).click}
  element(:note_type) { |b| b.iframe(id:"iframeportlet").select(id:"patronNoteTypeId_add_control")}
  element(:note_text) { |b| b.iframe(id:"iframeportlet").textarea(id:"patronNoteText_add_control")}
  action(:add_note) { |b| b.iframe(id:"iframeportlet").button(id:"OlePatronDocument-NotesSection-add_add").when_present(60).click}
  #action(:delete_note) { |notes_level,b| b.iframe(id:"iframeportlet").button(id:"OlePatronDocument-NotesSection-delete_line#{notes_level-1}").when_present.click}
  action(:delete_note) { |b| b.iframe(id:"iframeportlet").button(id:"OlePatronDocument-NotesSection-delete_line0").when_present(60).click}
  value(:added_note_text0) { |b| b.form(id:"kualiForm").span(id:"patronNoteText_line0_control").when_present(60).text}
  value(:added_note_text1) { |b| b.form(id:"kualiForm").span(id:"patronNoteText_line1_control").when_present(60).text}
  #for edit patron
  element(:patron_barcode) { |b| b.iframe(id:"iframeportlet").text_field(id:"barcode_control")}
  action(:search_patron_barcode) { |b| b.iframe(id:"iframeportlet").button(text:"Search").when_present(60).click}
  action(:patron_edit) { |b| b.iframe(id:"iframeportlet").a(text:"edit").when_present(60).click}
  value(:note_created_text0) { |b| b.iframe(id:"iframeportlet").div(id:"patronNoteText_line0").when_present(60).text}
  value(:note_created_text1) { |b| b.iframe(id:"iframeportlet").div(id:"patronNoteText_line1").when_present(60).text}
  value(:text_deleted) { |b| b.iframe(id:"iframeportlet").textarea(id:"patronNoteText_line0_control").when_present(60).text}
  value(:note_text_field) { |b| b.form(id:"kualiForm").span(id:"patronNoteText_line0_control").when_present(60).text}
  action(:note_form) { |b| b.form(id:"kualiForm").div(id:"note").when_present(60).click}

  value(:total_added_notes) { |b| b.form(id:"kualiForm").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").tbody.rows.length}
  action(:activate_address) { |b| b.iframe(id:"iframeportlet").input(id:"active_add_control").when_present(60).click}
  action(:activate_email_addr) { |b| b.iframe(id:"iframeportlet").input(id:"email_active_add_control").when_present(60).click}
  action(:active_indicator) { |b| b.iframe(id:"iframeportlet").input(id:"activeIndicator_control").when_present(60).click}
  value(:existing_note_text) { |b| b.iframe(id:"iframeportlet").div(id:"patronNoteText_line0").when_present(60).text}
  #for patron bill
  action(:createbill) { |b| b.iframe(id:"iframeportlet").a(text:"Create Bill").when_present(60).click}
  element(:feetype) { |b| b.form(id:"kualiForm").select(id:"fee_feeType_add_control")}
  element(:feeamount) { |b| b.form(id:"kualiForm").text_field(id:"feeAmt_add_control")}
  action(:addfee) { |b| b.form(id:"kualiForm").button(id:"addFee_add").when_present(60).click}
  action(:patron_submit) { |b| b.form(id:"kualiForm").button(id:"olePatronBillSubmit").when_present(60).click}
  action(:patron_bill_link) { |b| b.iframe(id:"iframeportlet").a(text:"Patron Bill").when_present(60).click}
  element(:enabled_patron_bill) { |b| b.iframe(id:"iframeportlet").a(text:"Patron Bill")}
  value(:bill_date) { |b| b.form(id:"kualiForm").div(id:"PatronBillMaintenanceDocument-BillSection").table(class:"table table-condensed table-bordered uif-gridLayout").tbody.tr.td.span(id:"bill_billDate_control").when_present(60).text}
  value(:patron_amount) { |b| b.form(id:"kualiForm").span(id:"feeAmt_line0_control").when_present(60).text}
  value(:view_patron_amount) { |b| b.form(id:"kualiForm").div(id:"PatronBillMaintenanceDocument-FeeTypeSection").div(id:"PatronBillMaintenanceDocument-FeeTypeSection_disclosureContent").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").tbody.tr.span(id:"feeAmt_line0_control").when_present(60).text}

  action(:add_notes) { |b| b.iframe(id:"iframeportlet").button(id:"OlePatronDocument-NotesSection_add").when_present(60).click}
  action(:delete_notes) { |b| b.iframe(id:"iframeportlet").button(id:"OlePatronDocument-NotesSection_del_line0").when_present(60).click}
  value(:patronID) { |b| b.iframe(id:"iframeportlet").a(title:"show inquiry for Patron ").when_present(60).text}

  value(:overview_section) { |b| b.iframe(id:"iframeportlet").div(id:"OlePatronDocument-OverviewSection").span.img(id:"OlePatronDocument-OverviewSection_toggle_exp").when_present(60).visible?}
  action(:overview_exp) { |b| b.iframe(id:"iframeportlet").div(id:"OlePatronDocument-OverviewSection").span.img(id:"OlePatronDocument-OverviewSection_toggle_exp").when_present(60).click}
  action(:overview_col) { |b| b.iframe(id:"iframeportlet").div(id:"OlePatronDocument-OverviewSection").span.img(id:"OlePatronDocument-OverviewSection_toggle_col").when_present(60).click}
  action(:update_barcode) { |b| b.iframe(id:"iframeportlet").button(id:"lostBarcode_edit").when_present(60).click}
  action(:update_reason_note) { |b| b.iframe(id:"iframeportlet").textarea(id:"OlePatronDocument-reason-note_control").when_present(60)}
  action(:lost_conform_botton) { |b| b.iframe(id:"iframeportlet").button(id:"lostConfimButton").when_present(60).click}


  element(:fee_type) { |b| b.iframe(id:"iframeportlet").select(id:"fee_feeType_add_control").when_present(60)}
  element(:fee_amount) { |b| b.iframe(id:"iframeportlet").text_field(id:"feeAmt_add_control").when_present(60)}
  action(:add_fee) { |b| b.iframe(id:"iframeportlet").button(id:"addFee_add").when_present(60).click}
  action(:proxy_patron_submit) { |b| b.iframe(id:"iframeportlet").button(id:"olePatronBillSubmit").when_present(60).click}
  value(:proxy_patron_amount) { |b| b.iframe(id:"iframeportlet").span(id:"feeAmt_line0_control").when_present(60).text}

end