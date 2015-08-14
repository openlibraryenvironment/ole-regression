class Batch_process < PageFactory
  page_url $test_site

  action(:admin) { |b| b.a(class:"green" , title:"Admin").when_present(60).click}
  action(:batch_process) { |b| b.a(class:"portal_link" , title:"Batch Process").when_present(60).click}
  element(:batch_process_type) { |b| b.iframe(id:"iframeportlet").select(id:"BatchProcessDefinition-batchProcessType_control")}
  element(:batchprocess_bib_import_profile_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"BatchProcessDefinition-batchProcessProfileName_bibImport_control")}
  action(:ingest_file) { |b| b.iframe(id:"iframeportlet").file_field(id:"ingestInputFile_control")}
  action(:submit_action) { |b| b.iframe(id:"iframeportlet").button(id:"BP-Uif-SubmitAction").when_present(60).click}
  action(:refresh_button) { |b| b.form(id:"kualiForm").button(id:"refreshOne_button_line0").when_present(60).click}
  value(:status) { |b| b.form(id:"kualiForm").span(id:"statusField_line0_control").when_present(60).text}
  value(:per_complete) { |b| b.form(id:"kualiForm").span(id:"perCompletedField_line0_control").when_present(60).text}
  value(:job_status) { |b| b.form(id:"kualiForm").span(id:"statusDescField-popup_control").when_present(60).text}
  action(:view_report) { |b| b.form(id:"kualiForm").a(text:"View Job Report").click}
  action(:upload_mrc_file) { |b| b.iframe(id:"iframeportlet").file_field(id:"marcFileField_control")}
  action(:upload_edi_file) { |b| b.iframe(id:"iframeportlet").file_field(id:"ediFileField_control")}
  element(:batchprocess_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"BatchProcessDefinition-batchProcessName_control")}
  element(:batchprocess_order_import_profile_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"BatchProcessDefinition-batchProcessProfileName_orderImport_control")}
  element(:batchprocess_invoive_import_profile_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"BatchProcessDefinition-batchProcessProfileName_invoiceImport_control")}
  value(:total_no_of_records) { |b| b.form(id:"kualiForm").span(id:"totalNoOfRecordsField-popup_control").text}
  value(:no_of_success_records) { |b| b.form(id:"kualiForm").span(id:"noOfSuccessRecordsField-popup_control").text}
  value(:no_of_failure_records) { |b| b.form(id:"kualiForm").span(id:"noOfFailureRecordsField-popup_control").text}
  value(:order_import_success_count) { |b| b.form(id:"kualiForm").div(id:"orderImportSuccessCountField-popup").span(id:"orderImportSuccessCountField-popup_control").text}
  value(:order_import_failure_count) { |b| b.form(id:"kualiForm").div(id:"orderImportFailureCountField-popup").span(id:"orderImportFailureCountField-popup_control").text}
  value(:popup_message) { |b| b.iframe(id:"iframeportlet").div(id:"invoice_import_validation_message").span(class:"uif-message").when_present(60).text}
  action(:continue_process) { |b| b.iframe(id:"iframeportlet").button(id:"yes_invoice_import").click}
  element(:popup_box) { |b| b.iframe(id:"iframeportlet").div(id:"MessagePopupSectionForInvoiceImport-HorizontalBoxSection").exists?}
  value(:invoice_doc) { |b| b.form(id:"kualiForm").div(id:"Uif-BreadcrumbWrapper").li(index:1).text}
  element(:invoice_status) { |b| b.form(id:"kualiForm").table(class:"table table-condensed table-bordered uif-gridLayout").td(index:1).span(index:0).text}
  action(:doc_search) { |b| b.img(alt:"doc search").click}
  action(:search_document) { |b| b.iframe(id:"iframeportlet").input(title:"search").when_present(60).click}
  action(:doc_id_link) { |b| b.iframe(id:"iframeportlet").table(id:"row").td(index:0).a(title:"").when_present(60).click}
  #batch_process_profile
  action(:batch_process_profile) { |b| b.a(class:"portal_link" , title:"Batch Process Profile").when_present(60).click}
  element(:batch_process_profile_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"lookup-batchProcessProfileName_control")}
  action(:search_profile) { |b| b.iframe(id:"iframeportlet").button(text:"Search").click}
  action(:edit_profile) { |b| b.iframe(id:"iframeportlet").a(text:"edit").when_present(60).click}
  action(:new_profile) { |b| b.iframe(id:"iframeportlet").a(text:"Create New").when_present(60).click}
  element(:marc_only) { |b| b.iframe(id:"iframeportlet").input(id:"mainSection-MaintenanceView-marcOnly_control")}
  element(:description) { |b| b.iframe(id:"iframeportlet").text_field(name:"document.documentHeader.documentDescription")}
  element(:profile_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"mainSection-MaintenanceView-batchProcessProfileName_control")}
  action(:search_field) { |b| b.iframe(id:"iframeportlet").input(alt:"Search Field").click}
  element(:profile_type) { |b| b.iframe(class:"fancybox-iframe").text_field(id:"lookup-batchProcessTypeName_control")}
  action(:search) { |b| b.iframe(class:"fancybox-iframe").button(text:"Search").click}
  action(:return) { |b| b.iframe(class:"fancybox-iframe").a(text:"return value").when_present(60).click}
  action(:match_point) { |b| b.iframe(id:"iframeportlet").span(text:"Match Point").when_present(60).click}
  element(:bib_match_point) { |b| b.iframe(id:"iframeportlet").text_field(id:"MatchPoint_Bib_add_control")}
  action(:add_match_point) { |b| b.iframe(id:"iframeportlet").button(id:"bibMatchPoint_add_add").when_present(60).click}
  action(:submit) { |b| b.iframe(id:"iframeportlet").button(text:"submit").click}

end