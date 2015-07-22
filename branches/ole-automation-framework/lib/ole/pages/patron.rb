class PatronPage < PageFactory
  page_url $test_site

  #Create a new patron
  action(:deliver) { |b| b.link(class:"red" , title:"Deliver").click}
  action(:patron) { |b| b.link(class:"portal_link" , title:"Patron").click}
  action(:create_new) { |b| b.iframe(id:"iframeportlet").a(class:"uif-actionLink uif-createNewLink uif-boxLayoutHorizontalItem").click}
  action(:overview) { |b| b.iframe(id:"iframeportlet").img(id:"OlePatronDocument-OverviewSection_toggle_col").click}
  element(:barcode) { |b| b.iframe(id:"iframeportlet").text_field(id:"barcode_control")}
  element(:borrowertype) { |b| b.iframe(id:"iframeportlet").select(id:"borrowerType_control")}
  element(:expiration_date) { |b| b.iframe(id:"iframeportlet").text_field(id:"expirationDate_control")}
  action(:contacts) { |b| b.iframe(id:"iframeportlet").img(id:"OlePatronDocument-ContactsSection_toggle_col").click}
  element(:first_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"firstName_control")}
  element(:last_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"lastName_control")}
  element(:email) { |b| b.iframe(id:"iframeportlet").text_field(id:"emailAddress_add_control")}
  action(:preferred_email) { |b| b.iframe(id:"iframeportlet").input(id:"email_defaultValue_add_control").click}
  action(:add_email) { |b| b.iframe(id:"iframeportlet").button(id:"OlePatronDocument-Email-Add_add").click}
  element(:address_type) { |b| b.iframe(id:"iframeportlet").select(id:"addressTypeCode_add_control")}
  element(:address_source) { |b| b.iframe(id:"iframeportlet").select(id:"addressSource_add_control")}
  action(:deliver_address) { |b| b.iframe(id:"iframeportlet").input(id:"deliverAddress_add_control").click}
  action(:default_value) { |b| b.iframe(id:"iframeportlet").input(id:"defaultValue_add_control").click}
  action(:add_address) { |b| b.iframe(id:"iframeportlet").button(id:"OlePatronDocument-Address_add").click}
  action(:submit) { |b| b.iframe(id:"iframeportlet").button(id:"oleSubmit").when_present.click}

  #Doc_search
  action(:doc_search) { |b| b.img(alt:"doc search").click}
  action(:search) { |b| b.iframe(id:"iframeportlet").button(title:"search").click}
  value(:patronstatus) { |b| b.iframe(id:"iframeportlet").table(id:"row").td(index:3).text}
  action(:open_patron) { |b| b.iframe(id:"iframeportlet").table(id:"row").a(title:"").click}
  action(:open_proxypatron) { |b| b.form(id:"kualiForm").div(id:"OlePatronDocument-ProxySection-Wrapper").span(class:"uif-headerText-span").a(text:"Proxy Patron").when_present.click}
  value(:proxypatron_barcode) { |b| b.form(id:"kualiForm").div(id:"barcode_Proxy_line0").span(id:"barcode_Proxy_line0_control").when_present.text}

  #For Proxy Patron
  action(:proxypatron) { |b| b.iframe(id:"iframeportlet").a(text:"Proxy Patron").click}
  value(:proxy_barcode) { |b| b.iframe(id:"iframeportlet").input(id:"barcode_Proxy_add_control").value}
  element(:add_proxy_barcode) { |b| b.iframe(id:"iframeportlet").text_field(id:"barcode_Proxy_add_control")}
  action(:proxy_search_field) { |b| b.iframe(id:"iframeportlet").input(alt:"Search Field").when_present.click}
  action(:search_proxy) { |b| b.iframe(class:"fancybox-iframe").button(text:"Search").when_present.click}
  action(:return_proxy) { |b| b.iframe(class:"fancybox-iframe").a(text:"return value").when_present.click}
  element(:proxy_activation_date) { |b| b.iframe(id:"iframeportlet").text_field(id:"proxyPatronActivationDate_Proxy_add_control")}
  element(:proxy_expiration_date) { |b| b.iframe(id:"iframeportlet").text_field(id:"proxyPatronExpirationDate_Proxy_add_control")}
  action(:add_proxypatron) { |b| b.iframe(id:"iframeportlet").button(id:"addProxyPatron_add").click}

  #For Notes
  action(:open_note) { |b| b.form(id:"kualiForm").a(text:"Note").when_present.click}
  action(:note) { |b| b.iframe(id:"iframeportlet").a(text:"Note").click}
  element(:note_type) { |b| b.iframe(id:"iframeportlet").select(id:"patronNoteTypeId_add_control")}
  element(:note_text) { |b| b.iframe(id:"iframeportlet").textarea(id:"patronNoteText_add_control")}
  action(:add_note) { |b| b.iframe(id:"iframeportlet").button(id:"OlePatronDocument-NotesSection_add").when_present.click}
  #action(:delete_note) { |notes_level,b| b.iframe(id:"iframeportlet").button(id:"OlePatronDocument-NotesSection-delete_line#{notes_level-1}").when_present.click}
  action(:delete_note) { |b| b.iframe(id:"iframeportlet").button(id:"OlePatronDocument-NotesSection-delete_line0").click}
  value(:added_note_text0) { |b| b.form(id:"kualiForm").span(id:"patronNoteText_line0_control").text}
  value(:added_note_text1) { |b| b.form(id:"kualiForm").span(id:"patronNoteText_line1_control").text}
  #for edit patron
  element(:patron_barcode) { |b| b.iframe(id:"iframeportlet").text_field(id:"barcode_control")}
  action(:search_patron_barcode) { |b| b.iframe(id:"iframeportlet").button(text:"Search").click}
  action(:patron_edit) { |b| b.iframe(id:"iframeportlet").a(text:"edit").when_present.click}
  value(:note_created_text0) { |b| b.iframe(id:"iframeportlet").div(id:"patronNoteText_line0").text}
  value(:note_created_text1) { |b| b.iframe(id:"iframeportlet").div(id:"patronNoteText_line1").text}
  value(:text_deleted) { |b| b.iframe(id:"iframeportlet").textarea(id:"patronNoteText_line0_control").when_present.text}
  value(:note_text_field) { |b| b.form(id:"kualiForm").span(id:"patronNoteText_line0_control").text}
  action(:note_form) { |b| b.form(id:"kualiForm").div(id:"note").click}

  value(:total_added_notes) { |b| b.form(id:"kualiForm").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").tbody.rows.length}
  action(:activate_address) { |b| b.iframe(id:"iframeportlet").input(id:"active_add_control").click}
  action(:activate_email_addr) { |b| b.iframe(id:"iframeportlet").input(id:"email_active_add_control").click}
  action(:active_indicator) { |b| b.iframe(id:"iframeportlet").input(id:"activeIndicator_control").click}
  value(:existing_note_text) { |b| b.iframe(id:"iframeportlet").div(id:"patronNoteText_line0").text}



end